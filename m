Return-Path: <linuxppc-dev+bounces-12204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E60E6B574DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 11:26:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQKQk68Lbz3dHC;
	Mon, 15 Sep 2025 19:26:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757928366;
	cv=none; b=b2wN4DXNc1WFyeKgBB+hhRtQaoilWCaXqTrMuNBKu/47sbuVQ87thnpllrUB1tC4Z4Lm8HJwSHPh0+TYGLyOPqZJRPzyKg1743fti+UkE1jR3Gw2o+VAUGbKpg/mPo7YGQs+5+vXpOp4UcjnH1+SW6kzM1ysQ0L3iW1D1HpJNRRPLxNR4rY2yjcdcZOp+rAV/aQhJBKGBnSgXApeVxF/2dfL7ff/BM1V7SxFXMDWsz1By6Y20aV5y6xuPYdY1Eh7XlEByQvWeWYwDSvatpleg2fwPCfAJTTJXWqEXccSBafjeHWKZ4lS8L9hLYHtfCdC3iHRp8Ff2cOH0tsVG8wOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757928366; c=relaxed/relaxed;
	bh=PhWypHhs76OUhW0wRhEmCSwbci4KHZ6s4gw5WflTcZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieKfyOsAtDmtKHphCHhkIRKZdOlztYsETDK8+ZKqJyKzXCgJB2grg7xWgJXCM12UOB+R3PCFPKpG00WxlRz/qfHLg1M3N9QjDPcrWK29BqYPXSMpPgJv700ACzu3dzlgaoMhWoxWD24Dtr8skOC/GRjaPEzABmc2+V23oGszLsGkqqABuSxylfrlIC3vimr9rcTF4Q+kQHu7xwkOfR4Li4pBmLBbnMpJiQ9ZkGO28QiJ8q+ezCtfUq5laiY4fEaSKvFWrzrufi+wKBJrRn6r0cSh/ctvlMplyl8F2AQH39rN3PiDqp6+/J1iYRLS6dD8YZlfZj/ItqnAkf9CQiDzbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=y6rhBH2y; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SJvrSjvI; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=dMec5VwZ; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NOo6WaFM; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=jack@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=y6rhBH2y;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SJvrSjvI;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=dMec5VwZ;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NOo6WaFM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=jack@suse.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 375 seconds by postgrey-1.37 at boromir; Mon, 15 Sep 2025 19:26:03 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQKQg2SJ0z3dGr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 19:26:02 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA1BB33712;
	Mon, 15 Sep 2025 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1757927979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PhWypHhs76OUhW0wRhEmCSwbci4KHZ6s4gw5WflTcZE=;
	b=y6rhBH2yIHqcEhWvW3OK/M1MGL07yB+6JMwC6X/CknVE5ua038lWDkVtBxXcMW2YiW0/gB
	rSMv7hNa/JVKJWM7hARJEEPpYWbHOSmUMRbz8f4sVhqeny14kYvL5lcca9exMU9JyNeq6n
	Pyq6WFF1sN1B85usXfvLUNO8krTzzDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1757927979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PhWypHhs76OUhW0wRhEmCSwbci4KHZ6s4gw5WflTcZE=;
	b=SJvrSjvI7wBdkhoQj3MZ4ZBU7tX1b1mGqMmsm9Le3rr8bw1HFENqVr83A7BDG7tAfD/H3I
	rh7jnWIRJSAAW1Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1757927978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PhWypHhs76OUhW0wRhEmCSwbci4KHZ6s4gw5WflTcZE=;
	b=dMec5VwZSk27WNcuKLsJWYANLg5lWjboI6lQZXChre5tGBQy9LfQiob4gACGMYnIEyj7wt
	of5w1OHw8GaX5rzloEDHnRzUEa9We+whyL+vVkIgzkYI4qkYUE0EW8OsHCuSl7kqKZApPI
	R62vbkO0euBFSVizbuH5OjHtbfjlT3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1757927978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PhWypHhs76OUhW0wRhEmCSwbci4KHZ6s4gw5WflTcZE=;
	b=NOo6WaFMZo/gSs0Cn6FVxnoIe/rbPumE4+eUSjak33WwfmR1YoYCMva3UzVfmUFBWfq4S4
	cDjh2ACDImG9O8DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5CE31398D;
	Mon, 15 Sep 2025 09:19:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FQ3QMyrax2hoeQAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 15 Sep 2025 09:19:38 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 74FF7A0A2B; Mon, 15 Sep 2025 11:19:38 +0200 (CEST)
Date: Mon, 15 Sep 2025 11:19:38 +0200
From: Jan Kara <jack@suse.cz>
To: Askar Safin <safinaskar@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Aleksa Sarai <cyphar@cyphar.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	x86@kernel.org, Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, 
	initramfs@vger.kernel.org, linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>, 
	linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, devicetree@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Subject: Re: [PATCH RESEND 13/62] ext2: remove ext2_image_size and associated
 code
Message-ID: <5xr5efvf4dhy43fchbvfsxspzgde5bxezhszdgqcya4eqrocgy@lqqkaq5wok6a>
References: <20250913003842.41944-1-safinaskar@gmail.com>
 <20250913003842.41944-14-safinaskar@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913003842.41944-14-safinaskar@gmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux-foundation.org,linuxfoundation.org,kernel.org,zeniv.linux.org.uk,suse.cz,lst.de,kernel.dk,gmail.com,cyphar.com,linutronix.de,cyberus-technology.de,linux.alibaba.com,redhat.com,amazon.com,landley.net,0pointer.de,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,mit.edu,monstr.eu,linux.dev,linux.ibm.com];
	R_RATELIMIT(0.00)[to_ip_from(RLbyy5b47ky7xssyr143sji8pp)];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	RCVD_TLS_LAST(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.30
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 13-09-25 00:37:52, Askar Safin wrote:
> It is not used anymore
> 
> Signed-off-by: Askar Safin <safinaskar@gmail.com>

Looks good.

Acked-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext2/ext2.h          |  9 ---------
>  include/linux/ext2_fs.h | 13 -------------
>  2 files changed, 22 deletions(-)
> 
> diff --git a/fs/ext2/ext2.h b/fs/ext2/ext2.h
> index cf97b76e9fd3..d623a14040d9 100644
> --- a/fs/ext2/ext2.h
> +++ b/fs/ext2/ext2.h
> @@ -608,15 +608,6 @@ struct ext2_dir_entry_2 {
>  					 ~EXT2_DIR_ROUND)
>  #define EXT2_MAX_REC_LEN		((1<<16)-1)
>  
> -static inline void verify_offsets(void)
> -{
> -#define A(x,y) BUILD_BUG_ON(x != offsetof(struct ext2_super_block, y));
> -	A(EXT2_SB_MAGIC_OFFSET, s_magic);
> -	A(EXT2_SB_BLOCKS_OFFSET, s_blocks_count);
> -	A(EXT2_SB_BSIZE_OFFSET, s_log_block_size);
> -#undef A
> -}
> -
>  /*
>   * ext2 mount options
>   */
> diff --git a/include/linux/ext2_fs.h b/include/linux/ext2_fs.h
> index 1fef88569037..e5ebe6cdf06c 100644
> --- a/include/linux/ext2_fs.h
> +++ b/include/linux/ext2_fs.h
> @@ -27,17 +27,4 @@
>   */
>  #define EXT2_LINK_MAX		32000
>  
> -#define EXT2_SB_MAGIC_OFFSET	0x38
> -#define EXT2_SB_BLOCKS_OFFSET	0x04
> -#define EXT2_SB_BSIZE_OFFSET	0x18
> -
> -static inline u64 ext2_image_size(void *ext2_sb)
> -{
> -	__u8 *p = ext2_sb;
> -	if (*(__le16 *)(p + EXT2_SB_MAGIC_OFFSET) != cpu_to_le16(EXT2_SUPER_MAGIC))
> -		return 0;
> -	return (u64)le32_to_cpup((__le32 *)(p + EXT2_SB_BLOCKS_OFFSET)) <<
> -		le32_to_cpup((__le32 *)(p + EXT2_SB_BSIZE_OFFSET));
> -}
> -
>  #endif	/* _LINUX_EXT2_FS_H */
> -- 
> 2.47.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

