Return-Path: <linuxppc-dev+bounces-7352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B83A7323C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 13:32:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNjhc1PH0z2yfL;
	Thu, 27 Mar 2025 23:32:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743078720;
	cv=none; b=CHFyk9BHp/ibmtuByPoSB65636aBNQAHH0VncAqMrlBRySHV+upfV8kPMu0+WgbeRkN0LnP0sgZGNEA1fEKPGlKpaC2EXVKJxydobJFA4jPTR0HI5dUe8XUuR3q8mGSn/OQU5vJers8gmW5SKhbYYsHofIQeNO7I9EQqHDr1s9EDNb4lwvVoFO8pOmmxnPzC6GXcYf0s0kIHKlYNePDDDQGcktft4tyO/PolQjp360a0j2aR+KVS7sWx5VbCPrzVncOC2bJqT3dnxz6e5MRq+txPnTEKlNcuhDS+KLh5F8eRKKiNmvQhTznB6B+CmXjCQbnqLRM9XEiD4sUH/mhshQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743078720; c=relaxed/relaxed;
	bh=WzaWaBrzy/zcV3/lzkRdPYXCaZALjKMfXDScLnuiDPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezAHDqx8ctfMObOZinldjmCQOnYfs/mMWtk22aGlubVqHrssCBf1Gri/3JJvC8HlLTURQ3RKapMFPVfwHEeeSRVhag+Mdcdl0Rjs0T8jXRHopuQORBbkmyEg5HLhW7iz81QQ+c8uHPO3Sqx1SWxRvRW89mhNZWeoS9V58BRjzchkpA2ZNghaYv/W2eEVjILq0ZiACsg4ACNIDEcJbboJ5vifjhVQID9YrHU7qBcSg3CaAj2uiu/ZhvkfZDGTssJeQ9xuy7j9iNEt8EL6TOLzrUJdbGM6B+xULm1REr2rABFLTOukaCFI5nhscu/qhevvhWV/xTaTIDfzf15aQ2pyAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=ZG/I9wt5; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=I/KTXyWA; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=lb5Zvmbs; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VxbPFARU; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jack@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=ZG/I9wt5;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=I/KTXyWA;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=lb5Zvmbs;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VxbPFARU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jack@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNjhZ4yNdz2yqn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 23:31:58 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C53031F395;
	Thu, 27 Mar 2025 12:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743078715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzaWaBrzy/zcV3/lzkRdPYXCaZALjKMfXDScLnuiDPQ=;
	b=ZG/I9wt5ZoN+9pyrWeHEIj2Y+YhmF/H322pKTbSIT++Jd5QMS7A4KBDxnkxiYgJqM6k0Z/
	zPFaFYvKKqsD1qUBrHFIqovqmcfPwFSqp+CgGbOBp0P+OTStGOwdABg5pCifa4CZ+EHVK1
	pj2/R1JUINQ/fHD7PGZ2Qqa2roTXhe4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743078715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzaWaBrzy/zcV3/lzkRdPYXCaZALjKMfXDScLnuiDPQ=;
	b=I/KTXyWAI7OZXN35XcO6K5/zqHdo+taUOXCrsUatHwWIi9o6Cn2X8tDqSn3zmLX32m98/s
	nXU5LS4dGmgx6BDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=lb5Zvmbs;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=VxbPFARU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743078714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzaWaBrzy/zcV3/lzkRdPYXCaZALjKMfXDScLnuiDPQ=;
	b=lb5ZvmbsngZdXyGxjwN188J/bOCMBjDdZgQCabf/CeOAi6M2Twf/Uvk/191R5XWyu0lGWl
	AEl4d9NQZJaVQugn6t+do0QEie8Dy+8lhPhSifS0GSj4wIvJGc322gBmIgL7I4bFACC2hY
	pAfYMaUPPetq4wmz0Y51dt1ib8GBJRs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743078714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzaWaBrzy/zcV3/lzkRdPYXCaZALjKMfXDScLnuiDPQ=;
	b=VxbPFARUT+Ot/Cwaz/cqzLioWcahEjXqUKYr91UP0arcbn4gyYBmqSmEUfxKBcs6WzU4va
	LscvDn3wyXH42ACQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE8D513A41;
	Thu, 27 Mar 2025 12:31:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jU2XKjpF5WevPAAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 27 Mar 2025 12:31:54 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 5AA64A082A; Thu, 27 Mar 2025 13:31:50 +0100 (CET)
Date: Thu, 27 Mar 2025 13:31:50 +0100
From: Jan Kara <jack@suse.cz>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH v4 3/3] fs: introduce getfsxattrat and setfsxattrat
 syscalls
Message-ID: <qyiozv4dtkqlp5wuyhocpptngs5wpuhyouhfqf7vaagkbobsv7@ez3cvpjdyj6q>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
X-Rspamd-Queue-Id: C53031F395
X-Spam-Score: -4.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:dkim,suse.com:email];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLdxgs459xdbsauns6rcjztsec)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,linux-m68k.org,monstr.eu,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,csgroup.eu,users.sourceforge.jp,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,zeniv.linux.org.uk,suse.cz,digikod.net,google.com,arndb.de,paul-moore.com,namei.org,hallyn.com,vger.kernel.org,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[60];
	RCVD_TLS_LAST(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri 21-03-25 20:48:42, Andrey Albershteyn wrote:
> From: Andrey Albershteyn <aalbersh@redhat.com>
> 
> Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> extended attributes/flags. The syscalls take parent directory fd and
> path to the child together with struct fsxattr.
> 
> This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> that file don't need to be open as we can reference it with a path
> instead of fd. By having this we can manipulated inode extended
> attributes not only on regular files but also on special ones. This
> is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> we can not call ioctl() directly on the filesystem inode using fd.
> 
> This patch adds two new syscalls which allows userspace to get/set
> extended inode attributes on special files by using parent directory
> and a path - *at() like syscall.
> 
> CC: linux-api@vger.kernel.org
> CC: linux-fsdevel@vger.kernel.org
> CC: linux-xfs@vger.kernel.org
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Looks good. Just two nits below:

> +SYSCALL_DEFINE5(getfsxattrat, int, dfd, const char __user *, filename,
> +		struct fsxattr __user *, ufsx, size_t, usize,
> +		unsigned int, at_flags)
> +{
> +	struct fileattr fa = {};
> +	struct path filepath;
> +	int error;
> +	unsigned int lookup_flags = 0;
> +	struct filename *name;
> +	struct fsxattr fsx = {};
> +
> +	BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> +	BUILD_BUG_ON(sizeof(struct fsxattr) != FSXATTR_SIZE_LATEST);
> +
> +	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> +		return -EINVAL;
> +
> +	if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> +		lookup_flags |= LOOKUP_FOLLOW;
> +
> +	if (at_flags & AT_EMPTY_PATH)
> +		lookup_flags |= LOOKUP_EMPTY;

Strictly speaking setting LOOKUP_EMPTY does not have any effect because
empty names are already handled by getname_maybe_null(). But it does not
hurt either so I don't really care...

> +
> +	if (usize > PAGE_SIZE)
> +		return -E2BIG;
> +
> +	if (usize < FSXATTR_SIZE_VER0)
> +		return -EINVAL;
> +
> +	name = getname_maybe_null(filename, at_flags);
> +	if (!name) {
> +		CLASS(fd, f)(dfd);
> +
> +		if (fd_empty(f))
> +			return -EBADF;
> +		error = vfs_fileattr_get(file_dentry(fd_file(f)), &fa);
> +	} else {
> +		error = filename_lookup(dfd, name, lookup_flags, &filepath,
> +					NULL);
> +		if (error)
> +			goto out;
> +		error = vfs_fileattr_get(filepath.dentry, &fa);
> +		path_put(&filepath);
> +	}
> +	if (error == -ENOIOCTLCMD)
> +		error = -EOPNOTSUPP;
> +	if (!error) {
> +		fileattr_to_fsxattr(&fa, &fsx);
> +		error = copy_struct_to_user(ufsx, usize, &fsx,
> +					    sizeof(struct fsxattr), NULL);
> +	}
> +out:
> +	putname(name);
> +	return error;
> +}
> +
> +SYSCALL_DEFINE5(setfsxattrat, int, dfd, const char __user *, filename,
> +		struct fsxattr __user *, ufsx, size_t, usize,
> +		unsigned int, at_flags)
> +{
> +	struct fileattr fa;
> +	struct path filepath;
> +	int error;
> +	unsigned int lookup_flags = 0;
> +	struct filename *name;
> +	struct mnt_idmap *idmap;
> +	struct dentry *dentry;
> +	struct vfsmount *mnt;
> +	struct fsxattr fsx = {};
> +
> +	BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> +	BUILD_BUG_ON(sizeof(struct fsxattr) != FSXATTR_SIZE_LATEST);
> +
> +	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> +		return -EINVAL;
> +
> +	if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> +		lookup_flags |= LOOKUP_FOLLOW;
> +
> +	if (at_flags & AT_EMPTY_PATH)
> +		lookup_flags |= LOOKUP_EMPTY;

Same comment regarding LOOKUP_EMPTY here.

> +
> +	if (usize > PAGE_SIZE)
> +		return -E2BIG;
> +
> +	if (usize < FSXATTR_SIZE_VER0)
> +		return -EINVAL;
> +
> +	error = copy_struct_from_user(&fsx, sizeof(struct fsxattr), ufsx, usize);
> +	if (error)
> +		return error;
> +
> +	fsxattr_to_fileattr(&fsx, &fa);
> +
> +	name = getname_maybe_null(filename, at_flags);
> +	if (!name) {
> +		CLASS(fd, f)(dfd);
> +
> +		if (fd_empty(f))
> +			return -EBADF;
> +
> +		idmap = file_mnt_idmap(fd_file(f));
> +		dentry = file_dentry(fd_file(f));
> +		mnt = fd_file(f)->f_path.mnt;
> +	} else {
> +		error = filename_lookup(dfd, name, lookup_flags, &filepath,
> +					NULL);
> +		if (error)
> +			return error;
> +
> +		idmap = mnt_idmap(filepath.mnt);
> +		dentry = filepath.dentry;
> +		mnt = filepath.mnt;
> +	}
> +
> +	error = mnt_want_write(mnt);
> +	if (!error) {
> +		error = vfs_fileattr_set(idmap, dentry, &fa);
> +		if (error == -ENOIOCTLCMD)
> +			error = -EOPNOTSUPP;
> +		mnt_drop_write(mnt);
> +	}
> +
> +	path_put(&filepath);

filepath will not be initialized here in case of name == NULL. 

> +	return error;
> +}

With this fixed feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

