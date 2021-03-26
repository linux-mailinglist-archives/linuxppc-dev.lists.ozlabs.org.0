Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1534AC56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 17:13:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6Rpx1nDqz3c62
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 03:13:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=142.44.231.140;
 helo=zeniv-ca.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6Rpd1ZPPz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 03:13:13 +1100 (AEDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lPp4S-0001TY-0Z; Fri, 26 Mar 2021 16:12:24 +0000
Date: Fri, 26 Mar 2021 16:12:23 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] exec: simplify the compat syscall handling
Message-ID: <YF4H58gozyNkoCeO@zeniv-ca.linux.org.uk>
References: <20210326143831.1550030-1-hch@lst.de>
 <20210326143831.1550030-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326143831.1550030-4-hch@lst.de>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Brian Gerst <brgerst@gmail.com>, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 26, 2021 at 03:38:30PM +0100, Christoph Hellwig wrote:

> -static const char __user *get_user_arg_ptr(struct user_arg_ptr argv, int nr)
> +static const char __user *
> +get_user_arg_ptr(const char __user *const __user *argv, int nr)
>  {
> -	const char __user *native;
> -
> -#ifdef CONFIG_COMPAT
> -	if (unlikely(argv.is_compat)) {
> +	if (in_compat_syscall()) {
> +		const compat_uptr_t __user *compat_argv =
> +			compat_ptr((unsigned long)argv);
>  		compat_uptr_t compat;
>  
> -		if (get_user(compat, argv.ptr.compat + nr))
> +		if (get_user(compat, compat_argv + nr))
>  			return ERR_PTR(-EFAULT);
> -
>  		return compat_ptr(compat);
> -	}
> -#endif
> -
> -	if (get_user(native, argv.ptr.native + nr))
> -		return ERR_PTR(-EFAULT);
> +	} else {
> +		const char __user *native;
>  
> -	return native;
> +		if (get_user(native, argv + nr))
> +			return ERR_PTR(-EFAULT);
> +		return native;
> +	}
>  }

Yecchhh....  So you have in_compat_syscall() called again and again, for
each argument in the list?  I agree that current version is fucking ugly,
but I really hate that approach ;-/
