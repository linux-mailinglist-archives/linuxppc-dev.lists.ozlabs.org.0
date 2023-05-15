Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A929702AA1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 12:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKbN605brz3fCL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 20:34:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E1Y6ZR0W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E1Y6ZR0W;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKbMD1S3Kz3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 20:34:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2547A616DA;
	Mon, 15 May 2023 10:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1595CC433EF;
	Mon, 15 May 2023 10:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684146836;
	bh=5tmSZMTrH48otorY7sLrXC7yV0twLhRBW3UaH6lhA84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1Y6ZR0WzHfeBpvPqw70ZdEnLQQpgWKdvoQLpVhX+5wJVudUhLnJbQKQ2L7d8drrx
	 vaba6Sv7UUva6cY/90vupd2i0jeWyJImmPki/eVyWS/qSMa4zlGwG45Onyby+LYuxz
	 t4v6jVxMQtxbDLB5kD152NTGCQXYVQ9LjsNZS98+cpJ/IHA1JmLip8tRBk9o0W7UFS
	 +hXPahVEsUNYeokdYRgs4mMcHkNUFNQTsItXvcYkTMceYm84h1teCoroif0s3h9uPe
	 sqWkX5W99uvKpXcxOHqVsL+ray+oaNU/T2ud44pu1HOLF41InFyVvhMR9XVkRjPq03
	 36vFVPrZNiVOw==
Date: Mon, 15 May 2023 12:33:47 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christian =?utf-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>
Subject: Re: [RFC PATCH v2] fs/xattr: add *at family syscalls
Message-ID: <20230515-kopfgeld-umkurven-f27be4b68a26@brauner>
References: <20230511150802.737477-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230511150802.737477-1-cgzones@googlemail.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, amir73il@gmail.com, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>, selinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, cyphar@cyphar.com, linux-api@vger.kernel.org, jlayton@kernel.org, linux-kernel@vger.kernel.org, audit@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 11, 2023 at 05:08:02PM +0200, Christian Göttsche wrote:
> Add the four syscalls setxattrat(), getxattrat(), listxattrat() and
> removexattrat().  Those can be used to operate on extended attributes,
> especially security related ones, either relative to a pinned directory
> or on a file descriptor without read access, avoiding a
> /proc/<pid>/fd/<fd> detour, requiring a mounted procfs.
> 
> One use case will be setfiles(8) setting SELinux file contexts
> ("security.selinux") without race conditions.
> 
> Add XATTR flags to the private namespace of AT_* flags.
> 
> Use the do_{name}at() pattern from fs/open.c.
> 
> Use a single flag parameter for extended attribute flags (currently
> XATTR_CREATE and XATTR_REPLACE) and *at() flags to not exceed six
> syscall arguments in setxattrat().
> 
> Previous approach ("f*xattr: allow O_PATH descriptors"): https://lore.kernel.org/all/20220607153139.35588-1-cgzones@googlemail.com/
> v1 discussion: https://lore.kernel.org/all/20220830152858.14866-2-cgzones@googlemail.com/
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> CC: x86@kernel.org
> CC: linux-alpha@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-ia64@vger.kernel.org
> CC: linux-m68k@lists.linux-m68k.org
> CC: linux-mips@vger.kernel.org
> CC: linux-parisc@vger.kernel.org
> CC: linuxppc-dev@lists.ozlabs.org
> CC: linux-s390@vger.kernel.org
> CC: linux-sh@vger.kernel.org
> CC: sparclinux@vger.kernel.org
> CC: linux-fsdevel@vger.kernel.org
> CC: audit@vger.kernel.org
> CC: linux-arch@vger.kernel.org
> CC: linux-api@vger.kernel.org
> CC: linux-security-module@vger.kernel.org
> CC: selinux@vger.kernel.org
> ---

Fwiw, your header doesn't let me see who the mail was directly sent to
so I'm only able to reply to lists which is a bit pointless...

> v2:
>   - squash syscall introduction and wire up commits
>   - add AT_XATTR_CREATE and AT_XATTR_REPLACE constants

> +#define AT_XATTR_CREATE	        0x1	/* setxattrat(2): set value, fail if attr already exists */
> +#define AT_XATTR_REPLACE	0x2	/* setxattrat(2): set value, fail if attr does not exist */

We really shouldn't waste any AT_* flags for this. Otherwise we'll run
out of them rather quickly. Two weeks ago we added another AT_* flag
which is up for merging for v6.5 iirc and I've glimpsed another AT_*
flag proposal in one of the talks at last weeks Vancouver conference
extravaganza.

Even if we reuse 0x200 for AT_XATTR_CREATE (like we did for AT_EACCESS
and AT_REMOVEDIR) we still need another bit for AT_XATTR_REPLACE.

Plus, this is really ugly since AT_XATTR_{CREATE,REPLACE} really isn't
in any way related to lookup and we're mixing it in with lookup
modifying flags.

So my proposal for {g,s}etxattrat() would be:

struct xattr_args {
        __aligned_u64 value;
        __u32 size;
        __u32 cmd;
};

So everything's nicely 64bit aligned in the struct. Use the @cmd member
to set either XATTR_REPLACE or XATTR_CREATE and treat it as a proper
enum and not as a flag argument like the old calls did.

So then we'd have:

setxattrat(int dfd, const char *path, const char __user *name,
           struct xattr_args __user *args, size_t size, unsigned int flags)
getxattrat(int dfd, const char *path, const char __user *name,
           struct xattr_args __user *args, size_t size, unsigned int flags)

The current in-kernel struct xattr_ctx would be renamed to struct
kernel_xattr_args and then we do the usual copy_struct_from_user()
dance:

struct xattr_args args;
err = copy_struct_from_user(&args, sizeof(args), uargs, usize);

and then go on to handle value/size for setxattrat()/getxattrat()
accordingly.

getxattr()/setxattr() aren't meaningfully filterable by seccomp already
so there's not point in not using a struct.

If that isn't very appealing then another option is to add a new flag
namespace just for setxattrat() similar to fspick() and move_mount()
duplicating the needed lookup modifying flags.
Thoughts?
