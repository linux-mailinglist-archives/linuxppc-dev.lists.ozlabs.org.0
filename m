Return-Path: <linuxppc-dev+bounces-12621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4C3BA9C1B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Sep 2025 17:06:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cb4Jb0W0gz30MY;
	Tue, 30 Sep 2025 01:06:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759137231;
	cv=none; b=R4lBO5iQgv4rnMTbUoXveLx+z3q9tW6WaOXRjY75Chf4Xz5QFSKoAfSuSbPsI5fHQdPrLWSYTYDaX63sQ455sAZLA1QVP+HQxRlCECbxyHx22d/3mys8IK7HK/TYqApdS4rl10IJJksUQQygLLiiDwcLcShpQwnjTZniRnj1tp6JdKWSKDXJOC2A0aAglveCkPLksgpJ3tAqPmZdc2hBNZvvLLKhcvpDqfT4NuTT1Di0OosE9f+3tWFm73814x8RcIMDexNvqZxfmA+DtOyTMlUDpOS9ol/HNs13gHEV3IuDI/2RNhMRAOi8WYoEdlbJJtWc9ivuoei/BuVsBH0bUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759137231; c=relaxed/relaxed;
	bh=krawKFrMK6CfXJGZRbum6m0whh/VNnnKuCLw/mlg22U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KYIlsQZ3YFsWNwMnx+imb0R5UjJdS7zpStkLTyJ6T8N/z91Vxn7tIPLlW0RxCEWMrXEO5yIPbLZAH8Dx1QmyILQjqBWvIGG4CA4I/3+RMZvKLdrt5Yzru2JjK1WExkQf54lrPIXmOLsS7mM3DKIFwcWKgkUYZPQ4A+Ku33yYaQzguNMv8OUW7Ck0WS1o0qqesBnq+qUSDI2EYLa7fiejCtrsSN8FJoCSRPcOtx3Ap8OU5owTpnS6aWZN/e0JVJ/Q9hSHnfoo9ybHAkzBjO6hMC+r2jnO35G7GjSI5sc8zw1JYoCN6PMcxTM+UBi82YcZVFAjF9SAJ31kWfgcryGFNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Hq4pd3FL; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=b25DWtEA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hMG0X5o7; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZWV8cEdM; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=ddiss@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Hq4pd3FL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=b25DWtEA;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hMG0X5o7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZWV8cEdM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=ddiss@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZwV55wHpz301Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 19:13:49 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A184628A42;
	Mon, 29 Sep 2025 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759137220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krawKFrMK6CfXJGZRbum6m0whh/VNnnKuCLw/mlg22U=;
	b=Hq4pd3FLlIHlpsq/WIWIpKTQIK1u5uVC206WcP0fQUSFrI19DANzMPCVUP75KY+hBZcL0Q
	dtdVgf8LzRHS+mLGqBHxvAYy4l40BsAWLIlpobyu01j8D02b0I98f1+p5dw6q44ptuX62H
	m9Zo3mhg2ZXRKipx4DYunUuhbPd04E4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759137220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krawKFrMK6CfXJGZRbum6m0whh/VNnnKuCLw/mlg22U=;
	b=b25DWtEAGkPFc4sT9issDmqy/BMl9Qbnlh5ruisp0J1gFMCT/qNvoATff8AwO5EUhSceEL
	kSBiQsu7tqSUuVAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hMG0X5o7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZWV8cEdM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759137219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krawKFrMK6CfXJGZRbum6m0whh/VNnnKuCLw/mlg22U=;
	b=hMG0X5o7qx5uLzOvtPU6oAOR/sM1jQy2B6QsQik0JJGzKLSrpedSDbKzqP6/qSgL4E6z5c
	PYEIwt7LMqEi6gairxqjXKFRdyD4dFJYTy2ovOneowKDznaaZr9VZ4B/+OwUlRFxMrvTSI
	pzIsg61tXM/wB+hrp8gOffgcwit1QxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759137219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krawKFrMK6CfXJGZRbum6m0whh/VNnnKuCLw/mlg22U=;
	b=ZWV8cEdMR8rl5mD9g70Zqdfp6Osb2Z+ASfy/UIiBlSB9+DmXXVL0n2mnz3VGfUEWe6Zu2m
	Fw46i1nCG69w1gBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB9D413782;
	Mon, 29 Sep 2025 09:13:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q2iJILJN2mgkQwAAD6G6ig
	(envelope-from <ddiss@suse.de>); Mon, 29 Sep 2025 09:13:22 +0000
Date: Mon, 29 Sep 2025 19:13:16 +1000
From: David Disseldorp <ddiss@suse.de>
To: nschichan@freebox.fr
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk,
 brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org,
 ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com,
 gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de,
 hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz,
 julian.stecklina@cyberus-technology.de, kees@kernel.org,
 linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 mcgrof@kernel.org, mingo@redhat.com, monstr@monstr.eu,
 mzxreary@0pointer.de, patches@lists.linux.dev, rob@landley.net,
 safinaskar@gmail.com, sparclinux@vger.kernel.org,
 thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev,
 torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk,
 x86@kernel.org
Subject: Re: [PATCH-RFC] init: simplify initrd code (was Re: [PATCH RESEND
 00/62] initrd: remove classic initrd support).
Message-ID: <20250929171652.50b7a959.ddiss@suse.de>
In-Reply-To: <20250925131055.3933381-1-nschichan@freebox.fr>
References: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
	<20250925131055.3933381-1-nschichan@freebox.fr>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Rspamd-Queue-Id: A184628A42
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,gmail.com,kernel.dk,kernel.org,cyphar.com,vger.kernel.org,redhat.com,amazon.com,linuxfoundation.org,linux.ibm.com,lst.de,linux.alibaba.com,suse.cz,cyberus-technology.de,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,lists.linux.dev,monstr.eu,0pointer.de,landley.net,linutronix.de,linux.dev,mit.edu,zeniv.linux.org.uk];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RL4bphh9snz1w7feaus4qmzef6)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_GT_50(0.00)[56];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Spam-Score: -2.01
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Nicolas,

On Thu, 25 Sep 2025 15:10:56 +0200, nschichan@freebox.fr wrote:

> From: Nicolas Schichan <nschichan@freebox.fr>
> 
> - drop prompt_ramdisk and ramdisk_start kernel parameters
> - drop compression support
> - drop image autodetection, the whole /initrd.image content is now
>   copied into /dev/ram0
> - remove rd_load_disk() which doesn't seem to be used anywhere.
> 
> There is now no more limitation on the type of initrd filesystem that
> can be loaded since the code trying to guess the initrd filesystem
> size is gone (the whole /initrd.image file is used).
> 
> A few global variables in do_mounts_rd.c are now put as local
> variables in rd_load_image() since they do not need to be visible
> outside this function.
> ---
> 
> Hello,
> 
> Hopefully my email config is now better and reaches gmail users
> correctly.
> 
> The patch below could probably split in a few patches, but I think
> this simplify the code greatly without removing the functionality we
> depend on (and this allows now to use EROFS initrd images).
> 
> Coupled with keeping the function populate_initrd_image() in
> init/initramfs.c, this will keep what we need from the initrd code.
> 
> This removes support of loading bzip/gz/xz/... compressed images as
> well, not sure if many user depend on this feature anymore.
> 
> No signoff because I'm only seeking comments about those changes right
> now.
> 
>  init/do_mounts.h    |   2 -
>  init/do_mounts_rd.c | 243 +-------------------------------------------
>  2 files changed, 4 insertions(+), 241 deletions(-)

This seems like a reasonable improvement to me. FWIW, one alternative
approach to clean up the FS specific code here was proposed by Al:
https://lore.kernel.org/all/20250321020826.GB2023217@ZenIV/

...
> diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
> index ac021ae6e6fa..5a69ff43f5ee 100644
> --- a/init/do_mounts_rd.c
> +++ b/init/do_mounts_rd.c
> @@ -14,173 +14,9 @@
>  
>  #include <linux/decompress/generic.h>
>  
> -static struct file *in_file, *out_file;
> -static loff_t in_pos, out_pos;
> -
> -static int __init prompt_ramdisk(char *str)
> -{
> -	pr_warn("ignoring the deprecated prompt_ramdisk= option\n");
> -	return 1;
> -}
> -__setup("prompt_ramdisk=", prompt_ramdisk);
> -
> -int __initdata rd_image_start;		/* starting block # of image */
> -
> -static int __init ramdisk_start_setup(char *str)
> -{
> -	rd_image_start = simple_strtol(str,NULL,0);
> -	return 1;
> -}
> -__setup("ramdisk_start=", ramdisk_start_setup);

There are a couple of other places that mention these parameters, which
should also be cleaned up.

...
>  static unsigned long nr_blocks(struct file *file)
>  {
> -	struct inode *inode = file->f_mapping->host;
> -
> -	if (!S_ISBLK(inode->i_mode))
> -		return 0;
> -	return i_size_read(inode) >> 10;
> +	return i_size_read(file->f_mapping->host) >> 10;

This should be >> BLOCK_SIZE_BITS, and dropped as a wrapper function
IMO.

