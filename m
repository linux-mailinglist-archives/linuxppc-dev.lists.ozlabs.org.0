Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D5665D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 06:36:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lKrL6RQwzDqYq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 14:36:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=ftp.linux.org.uk
 (client-ip=195.92.253.2; helo=zeniv.linux.org.uk;
 envelope-from=viro@ftp.linux.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lKnf6YXwzDq6N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 14:34:14 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hlnFe-0003Rz-Ja; Fri, 12 Jul 2019 04:33:42 +0000
Date: Fri, 12 Jul 2019 05:33:42 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v9 05/10] namei: O_BENEATH-style path resolution flags
Message-ID: <20190712043341.GI17978@ZenIV.linux.org.uk>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-6-cyphar@cyphar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190706145737.5299-6-cyphar@cyphar.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 07, 2019 at 12:57:32AM +1000, Aleksa Sarai wrote:

> @@ -1442,8 +1464,11 @@ static int follow_dotdot_rcu(struct nameidata *nd)
>  	struct inode *inode = nd->inode;
>  
>  	while (1) {
> -		if (path_equal(&nd->path, &nd->root))
> +		if (path_equal(&nd->path, &nd->root)) {
> +			if (unlikely(nd->flags & LOOKUP_BENEATH))
> +				return -EXDEV;

> @@ -1468,6 +1493,8 @@ static int follow_dotdot_rcu(struct nameidata *nd)
>  				return -ECHILD;
>  			if (&mparent->mnt == nd->path.mnt)
>  				break;
> +			if (unlikely(nd->flags & LOOKUP_XDEV))
> +				return -EXDEV;
>  			/* we know that mountpoint was pinned */
>  			nd->path.dentry = mountpoint;
>  			nd->path.mnt = &mparent->mnt;
> @@ -1482,6 +1509,8 @@ static int follow_dotdot_rcu(struct nameidata *nd)
>  			return -ECHILD;
>  		if (!mounted)
>  			break;
> +		if (unlikely(nd->flags & LOOKUP_XDEV))
> +			return -EXDEV;

Are you sure these failure exits in follow_dotdot_rcu() won't give
suprious hard errors?

> +	if (unlikely(nd->flags & LOOKUP_BENEATH)) {
> +		error = dirfd_path_init(nd);
> +		if (unlikely(error))
> +			return ERR_PTR(error);
> +		nd->root = nd->path;
> +		if (!(nd->flags & LOOKUP_RCU))
> +			path_get(&nd->root);
> +	}
>  	if (*s == '/') {
>  		if (likely(!nd->root.mnt))
>  			set_root(nd);
> @@ -2350,9 +2400,11 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
>  			s = ERR_PTR(error);
>  		return s;
>  	}
> -	error = dirfd_path_init(nd);
> -	if (unlikely(error))
> -		return ERR_PTR(error);
> +	if (likely(!nd->path.mnt)) {

Is that a weird way of saying "if we hadn't already called dirfd_path_init()"?
