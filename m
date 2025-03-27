Return-Path: <linuxppc-dev+bounces-7353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D65A73246
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 13:32:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNjhn4vsBz2yr7;
	Thu, 27 Mar 2025 23:32:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743078729;
	cv=none; b=adBORgM237ueBNaYQPGqTCyh4jaVZ7NLHmDS4bc1+2NFZh0HgsoEIbDSP1/LwewjciTtxwAsrGPGvYINJRdSNS5CcPQjiNnJdPNypwT9pbVFXzAXKK3WiDpevIhoKibJ4v813txmT3hGnQR6t5Tj3NQVF5fjgp8v3KHo7icgqb22iHFInnPtUnkCcN2s50lrDGz5aQJ8VIVPJpUF4EaJs8yOcgsuk1R8Q7H9c9PGZ3IW8HgrjgqqcY8JtYn6uUdszzdHHAKeBOw6cWK+hsLrT2Ewr+EzXLEhfAWbmM6265NaafwyQnn/BYUxlsmNEeGPN2S/fCSq2Jh0iBNfgNFL4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743078729; c=relaxed/relaxed;
	bh=YZG14QR51a53B21JvKh9jT0ARcAKPuGiQLGnJ/TJfNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRxFxDiRjfqZRUcwRR05I9bOyAq8YEA5j1qNVJd9hMUTe/KJ4MAVZdpFAD8f6u0rQvEadTYQQyEOtozBUF3eBa+VEKdup6HjT5z1kOVasMPyz7jVVUk51ul8bshXv1Ce7ZQICf7Eew2zXMWMGWAi02ctO4aoIL0XmkvmMwTRzrlZOoU14q/XCrbyhPpYno+LzHqKVCgVEK9HcHjCCKn34W7CcCFJdPsoaPeRi2+DZs/EfsjKr3tstYqKgC1LfLP1jzbNh5s8oukGcgIADr7DS0qwYrVgERHN3F/GGVbl+LgOCnArK4BpAJAnWYrDYHdDeh2/A/UPiP7n5Q198Hqzqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=NPoancez; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=q0PRQMJp; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=NPoancez; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=q0PRQMJp; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jack@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=NPoancez;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=q0PRQMJp;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=NPoancez;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=q0PRQMJp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jack@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNjhm6sDZz2yqn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 23:32:08 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 58BF41F453;
	Thu, 27 Mar 2025 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743078726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YZG14QR51a53B21JvKh9jT0ARcAKPuGiQLGnJ/TJfNE=;
	b=NPoancez8cGcz158aaFuQXkVY/Rk1QSp1PE1iTEKex7C/C6X4QLcYqBAD5m89kw8rjhMNU
	qLNSQY0CuaoqJZN1TVHH9NoiYdImWpdI1HwDYKNvGJ1GaDOt2WHALfPiUMy1v+/zTFQFpJ
	P60x1ligl+CU3bHS59kivJz4FrbDU4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743078726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YZG14QR51a53B21JvKh9jT0ARcAKPuGiQLGnJ/TJfNE=;
	b=q0PRQMJpRAwDi+liitWJVrsE7LN8A7E7Cwjwebt1a90Ufw/FNfaGyDh2IYj4ix0C5xBiRH
	N3Vu1DNqSuDGdnBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=NPoancez;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=q0PRQMJp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743078726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YZG14QR51a53B21JvKh9jT0ARcAKPuGiQLGnJ/TJfNE=;
	b=NPoancez8cGcz158aaFuQXkVY/Rk1QSp1PE1iTEKex7C/C6X4QLcYqBAD5m89kw8rjhMNU
	qLNSQY0CuaoqJZN1TVHH9NoiYdImWpdI1HwDYKNvGJ1GaDOt2WHALfPiUMy1v+/zTFQFpJ
	P60x1ligl+CU3bHS59kivJz4FrbDU4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743078726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YZG14QR51a53B21JvKh9jT0ARcAKPuGiQLGnJ/TJfNE=;
	b=q0PRQMJpRAwDi+liitWJVrsE7LN8A7E7Cwjwebt1a90Ufw/FNfaGyDh2IYj4ix0C5xBiRH
	N3Vu1DNqSuDGdnBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CAA4139D4;
	Thu, 27 Mar 2025 12:32:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RkbMDkZF5WfIPAAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 27 Mar 2025 12:32:06 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id EEF6AA082A; Thu, 27 Mar 2025 13:32:05 +0100 (CET)
Date: Thu, 27 Mar 2025 13:32:05 +0100
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
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v4 2/3] fs: split fileattr/fsxattr converters into helpers
Message-ID: <7por3exi45jfmlprgp6v573n3mwdzoxglzfypygvsocw3x42v4@7wvnedauzi5f>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <20250321-xattrat-syscall-v4-2-3e82e6fb3264@kernel.org>
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
In-Reply-To: <20250321-xattrat-syscall-v4-2-3e82e6fb3264@kernel.org>
X-Rspamd-Queue-Id: 58BF41F453
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim,suse.cz:email];
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri 21-03-25 20:48:41, Andrey Albershteyn wrote:
> This will be helpful for get/setfsxattrat syscalls to convert
> between fileattr and fsxattr.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ioctl.c               | 32 +++++++++++++++++++++-----------
>  include/linux/fileattr.h |  2 ++
>  2 files changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 4434c97bc5dff5a3e8635e28745cd99404ff353e..840283d8c406623d8d26790f89b62ebcbd39e2de 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -538,6 +538,16 @@ int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
>  }
>  EXPORT_SYMBOL(vfs_fileattr_get);
>  
> +void fileattr_to_fsxattr(const struct fileattr *fa, struct fsxattr *fsx)
> +{
> +	memset(fsx, 0, sizeof(struct fsxattr));
> +	fsx->fsx_xflags = fa->fsx_xflags;
> +	fsx->fsx_extsize = fa->fsx_extsize;
> +	fsx->fsx_nextents = fa->fsx_nextents;
> +	fsx->fsx_projid = fa->fsx_projid;
> +	fsx->fsx_cowextsize = fa->fsx_cowextsize;
> +}
> +
>  /**
>   * copy_fsxattr_to_user - copy fsxattr to userspace.
>   * @fa:		fileattr pointer
> @@ -549,12 +559,7 @@ int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
>  {
>  	struct fsxattr xfa;
>  
> -	memset(&xfa, 0, sizeof(xfa));
> -	xfa.fsx_xflags = fa->fsx_xflags;
> -	xfa.fsx_extsize = fa->fsx_extsize;
> -	xfa.fsx_nextents = fa->fsx_nextents;
> -	xfa.fsx_projid = fa->fsx_projid;
> -	xfa.fsx_cowextsize = fa->fsx_cowextsize;
> +	fileattr_to_fsxattr(fa, &xfa);
>  
>  	if (copy_to_user(ufa, &xfa, sizeof(xfa)))
>  		return -EFAULT;
> @@ -563,6 +568,15 @@ int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa)
>  }
>  EXPORT_SYMBOL(copy_fsxattr_to_user);
>  
> +void fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa)
> +{
> +	fileattr_fill_xflags(fa, fsx->fsx_xflags);
> +	fa->fsx_extsize = fsx->fsx_extsize;
> +	fa->fsx_nextents = fsx->fsx_nextents;
> +	fa->fsx_projid = fsx->fsx_projid;
> +	fa->fsx_cowextsize = fsx->fsx_cowextsize;
> +}
> +
>  static int copy_fsxattr_from_user(struct fileattr *fa,
>  				  struct fsxattr __user *ufa)
>  {
> @@ -571,11 +585,7 @@ static int copy_fsxattr_from_user(struct fileattr *fa,
>  	if (copy_from_user(&xfa, ufa, sizeof(xfa)))
>  		return -EFAULT;
>  
> -	fileattr_fill_xflags(fa, xfa.fsx_xflags);
> -	fa->fsx_extsize = xfa.fsx_extsize;
> -	fa->fsx_nextents = xfa.fsx_nextents;
> -	fa->fsx_projid = xfa.fsx_projid;
> -	fa->fsx_cowextsize = xfa.fsx_cowextsize;
> +	fsxattr_to_fileattr(&xfa, fa);
>  
>  	return 0;
>  }
> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index 47c05a9851d0600964b644c9c7218faacfd865f8..31888fa2edf10050be134f587299256088344365 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -33,7 +33,9 @@ struct fileattr {
>  	bool	fsx_valid:1;
>  };
>  
> +void fileattr_to_fsxattr(const struct fileattr *fa, struct fsxattr *fsx);
>  int copy_fsxattr_to_user(const struct fileattr *fa, struct fsxattr __user *ufa);
> +void fsxattr_to_fileattr(const struct fsxattr *fsx, struct fileattr *fa);
>  
>  void fileattr_fill_xflags(struct fileattr *fa, u32 xflags);
>  void fileattr_fill_flags(struct fileattr *fa, u32 flags);
> 
> -- 
> 2.47.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

