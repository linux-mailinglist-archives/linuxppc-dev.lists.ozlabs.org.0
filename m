Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C690297B25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 15:40:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D81w442BzDqXK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 23:40:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D7xW4ZXLzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 23:37:01 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97B24AD08;
 Wed, 21 Aug 2019 13:36:56 +0000 (UTC)
Date: Wed, 21 Aug 2019 15:36:56 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: Re: [PATCH] powerpc: Add barrier_nospec to raw_copy_in_user()
Message-ID: <20190821153656.57fabe9c@kitsune.suse.cz>
In-Reply-To: <20190306011038.16449-1-sjitindarsingh@gmail.com>
References: <20190306011038.16449-1-sjitindarsingh@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  6 Mar 2019 12:10:38 +1100
Suraj Jitindar Singh <sjitindarsingh@gmail.com> wrote:

> Commit ddf35cf3764b ("powerpc: Use barrier_nospec in copy_from_user()")
> Added barrier_nospec before loading from user-controller pointers.
> The intention was to order the load from the potentially user-controlled
> pointer vs a previous branch based on an access_ok() check or similar.
> 
> In order to achieve the same result, add a barrier_nospec to the
> raw_copy_in_user() function before loading from such a user-controlled
> pointer.
> 
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> ---
>  arch/powerpc/include/asm/uaccess.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index e3a731793ea2..bb615592d5bb 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -306,6 +306,7 @@ extern unsigned long __copy_tofrom_user(void __user *to,
>  static inline unsigned long
>  raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
>  {
> +	barrier_nospec();
>  	return __copy_tofrom_user(to, from, n);
>  }
>  #endif /* __powerpc64__ */

Hello,

AFAICT this is not needed. The data cannot be used in the kernel without
subsequent copy_from_user which already has the nospec barrier.

Thanks

Michal
