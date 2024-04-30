Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B0B8B7500
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 13:57:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=vqeIBGjX;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y4Kk2Nxd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=vqeIBGjX;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y4Kk2Nxd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTJb056qdz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 21:57:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=vqeIBGjX;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y4Kk2Nxd;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=vqeIBGjX;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y4Kk2Nxd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=jack@suse.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 373 seconds by postgrey-1.37 at boromir; Tue, 30 Apr 2024 20:15:25 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTGKn0rmJz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 20:15:24 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 90B981F7C9;
	Tue, 30 Apr 2024 10:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1714471742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTUPyaWcpZDKUukiVIneGRzBea/lmcCk8kXRR619DJk=;
	b=vqeIBGjXPKb0XycMvacAW428uolNoqtaN+EBo2mJHjf74TxTIQVlt1MpATsa4IuUZcKLzy
	UJEys7GFBXXE5vubiBV2DPs1hUa/STmWvTjbv7yEWIAwLpxqDSUen9/F+c160SQUX7J9ZM
	gWZoQjDIPJgvZSToK75KO55SPRn2Kws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1714471742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTUPyaWcpZDKUukiVIneGRzBea/lmcCk8kXRR619DJk=;
	b=Y4Kk2NxdcsJrpGpYXQLpbXlde7mZBRQhy/lhK6wfFaRvxYGJW/MWwnAVpk3q6wgGY68wCh
	8DrbHfPc84XlzxAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=vqeIBGjX;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Y4Kk2Nxd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1714471742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTUPyaWcpZDKUukiVIneGRzBea/lmcCk8kXRR619DJk=;
	b=vqeIBGjXPKb0XycMvacAW428uolNoqtaN+EBo2mJHjf74TxTIQVlt1MpATsa4IuUZcKLzy
	UJEys7GFBXXE5vubiBV2DPs1hUa/STmWvTjbv7yEWIAwLpxqDSUen9/F+c160SQUX7J9ZM
	gWZoQjDIPJgvZSToK75KO55SPRn2Kws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1714471742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTUPyaWcpZDKUukiVIneGRzBea/lmcCk8kXRR619DJk=;
	b=Y4Kk2NxdcsJrpGpYXQLpbXlde7mZBRQhy/lhK6wfFaRvxYGJW/MWwnAVpk3q6wgGY68wCh
	8DrbHfPc84XlzxAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80DCA136A8;
	Tue, 30 Apr 2024 10:09:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 51BwHz7DMGa5bAAAD6G6ig
	(envelope-from <jack@suse.cz>); Tue, 30 Apr 2024 10:09:02 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 32814A06D4; Tue, 30 Apr 2024 12:09:02 +0200 (CEST)
Date: Tue, 30 Apr 2024 12:09:02 +0200
From: Jan Kara <jack@suse.cz>
To: cgzones@googlemail.com
Subject: Re: [PATCH v3 2/2] fs/xattr: add *at family syscalls
Message-ID: <20240430100902.iwmeszr2jzv4wyo7@quack3>
References: <20240426162042.191916-1-cgoettsche@seltendoof.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240426162042.191916-1-cgoettsche@seltendoof.de>
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 90B981F7C9
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[googlemail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,linaro.org,jurassic.park.msu.ru,gmail.com,armlinux.org.uk,arm.com,linux-m68k.org,monstr.eu,alpha.franken.de,HansenPartnership.com,gmx.de,ellerman.id.au,csgroup.eu,linux.ibm.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,zeniv.linux.org.uk,suse.cz,paul-moore.com,arndb.de,kernel.dk,infradead.org,intel.com,sifive.com,schaufler-ca.com,broadcom.com,chromium.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_GT_50(0.00)[72];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	TAGGED_RCPT(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLdxgs459xdbsauns6rcjztsec)];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:dkim,suse.com:email]
X-Mailman-Approved-At: Tue, 30 Apr 2024 21:56:24 +1000
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
Cc: Andreas Larsson <andreas@gaisler.com>, Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Jan Kara <jack@suse.cz>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>,
  Christian Borntraeger <borntraeger@linux.ibm.com>, Miklos Szeredi <mszeredi@redhat.com>, Palmer Dabbelt <palmer@sifive.com>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, selinux@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Christian Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Casey Schaufler <casey@schaufler-ca.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Sohil Mehta <sohil.mehta@intel.com>, Thomas Gleixner <tglx@linutronix.de>, io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nhat Pham <nphamcs@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.
 com>, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>, Pavel Begunkov <asml.silence@gmail.com>, audit@vger.kernel.org, linux-security-module@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 26-04-24 18:20:14, Christian Göttsche wrote:
> From: Christian Göttsche <cgzones@googlemail.com>
> 
> Add the four syscalls setxattrat(), getxattrat(), listxattrat() and
> removexattrat().  Those can be used to operate on extended attributes,
> especially security related ones, either relative to a pinned directory
> or on a file descriptor without read access, avoiding a
> /proc/<pid>/fd/<fd> detour, requiring a mounted procfs.
> 
> One use case will be setfiles(8) setting SELinux file contexts
> ("security.selinux") without race conditions and without a file
> descriptor opened with read access requiring SELinux read permission.
> 
> Use the do_{name}at() pattern from fs/open.c.
> 
> Pass the value of the extended attribute, its length, and for
> setxattrat(2) the command (XATTR_CREATE or XATTR_REPLACE) via an added
> struct xattr_args to not exceed six syscall arguments and not
> merging the AT_* and XATTR_* flags.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>

The patch looks good to me. Just a few nits below:

> -static int path_setxattr(const char __user *pathname,
> +static int do_setxattrat(int dfd, const char __user *pathname, unsigned int at_flags,

Can we please stay within 80 columns (happens in multiple places in the
patch)? I don't insist but it makes things easier to read in some setups so
I prefer it.

> @@ -852,13 +908,21 @@ listxattr(struct dentry *d, char __user *list, size_t size)
>  	return error;
>  }
>  
> -static ssize_t path_listxattr(const char __user *pathname, char __user *list,
> -			      size_t size, unsigned int lookup_flags)
> +static ssize_t do_listxattrat(int dfd, const char __user *pathname, char __user *list,
> +			      size_t size, int flags)

So I like how in previous syscalls you have 'at_flags', 'lookup_flags', and
'xattr_flags'. That makes things much easier to digest. Can you please stay
with that convention here as well and call this argument 'at_flags'? Also I
think the argument ordering like "dfd, pathname, at_flags, list, size" is
more consistent with other syscalls you define.

> @@ -870,16 +934,22 @@ static ssize_t path_listxattr(const char __user *pathname, char __user *list,
>  	return error;
>  }
>  
> +SYSCALL_DEFINE5(listxattrat, int, dfd, const char __user *, pathname, char __user *, list,
> +		size_t, size, int, flags)
> +{
> +	return do_listxattrat(dfd, pathname, list, size, flags);
> +}
> +

Same comment as above - "flags" -> "at_flags" and reorder args please.

> @@ -917,13 +987,21 @@ removexattr(struct mnt_idmap *idmap, struct dentry *d,
>  	return vfs_removexattr(idmap, d, kname);
>  }
>  
> -static int path_removexattr(const char __user *pathname,
> -			    const char __user *name, unsigned int lookup_flags)
> +static int do_removexattrat(int dfd, const char __user *pathname,
> +			    const char __user *name, int flags)
>  {

Same comment as above - "flags" -> "at_flags" and reorder args please.

> @@ -939,16 +1017,22 @@ static int path_removexattr(const char __user *pathname,
>  	return error;
>  }
>  
> +SYSCALL_DEFINE4(removexattrat, int, dfd, const char __user *, pathname,
> +		const char __user *, name, int, flags)
> +{

Same comment as above - "flags" -> "at_flags" and reorder args please.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
