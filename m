Return-Path: <linuxppc-dev+bounces-16216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKmyL7Inc2kAswAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 08:48:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA07671F9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 08:48:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy95W30n1z2yF1;
	Fri, 23 Jan 2026 18:47:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769154479;
	cv=none; b=Y6Bw+7TDq7aYj8ojUGGvMWlGUoehKzamIUatgumFU4yMqOMztlg7oj+8IPl8Igub85U9gPaFEnyd6r3+xsghKLVX+nhSSdwnGhPwqEob4eaKBE7eZsuHNOh6Utvy6LMDjh7DB/feJdnAeW8kgx/B13/U9YmXOuWwJCKyWZiIUrN5l3wn4Zm881it/C/kJFtIYpN+aQEAaYQbhT62AlYyLJ3Z7JvDKlRqsFdKinFyFSGhgcrGLeQONYocW9Ix/rA9O+Ad9xC4GnGNqYiz1GS3dnBids/ZpjQzWiWFxRr9Olmrbm2aR3GqldB3EfI9B0L9QTMF9TjMQa4A+WhOT+z10w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769154479; c=relaxed/relaxed;
	bh=9Vt7yVFoK4bmwFtBayugg3Mesk0IO0qQaHoMpLPENbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7xYRR6T9Vi2VSLszIe+mlXl2CGK99eCzCTVwE78m1n8mOMZwPSmKbnKJey50+sRxPkV326edDUKfOhoE7mAmK1nCGrFyA7y9rgSk6Au50XW1mcsyQFrIvqRURtYsRNNSMoEgDK7ntIEtkFHRX6FPU5yhMCSwxCV0AlIJiWFZqrwZJyAxyjZ4SmKNM2ELr+ATsPOROPU72cz/UU8U4QvcBglIHA89TOXYuTNbSteInnQAlK4KyVsL8XJWlOrKBRWUSZ1M0HQeR7C13n36mJ3ZRe80l8q6ALlgoM0z/w/BuWSyK4fR6x1aIwTcb0N+hFOEHGAty3UlilTZRvfM2gMsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JH4KbYUX; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JH4KbYUX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy95N1mCcz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 18:47:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=9Vt7yVFoK4bmwFtBayugg3Mesk0IO0qQaHoMpLPENbQ=; b=JH4KbYUX058ePaxG6Kq/vBj54b
	/MAUT+kGOgRDN4c008Mc0ZPESCgDWRiElC1DXnKT9IIGfTxJ5gEcqspiIpTUDk/tyjMSz3p61ID83
	W4BnBU2b1J81QI0b/QFUMuqbMMDwXwySQBcf8C5RLzOWtVVx0O+SCZd1pSFsrGLh4b/9eKvCQF8b0
	HY2hWFvQ4XMgdq3d/pPoe6ur2I9WZR5G4coBCCTptXYq5n048Q1qjkFfhfWey9Uow2ZzsRqpdE1gV
	WNSUwxNI+BoitoRa0vMMjiGJTpH/ZjZvgyCm/80lUV8yyzS9OJQtWAE6Yk0FwRR//jtwi/l+x18GE
	SexraFLg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBtM-00000008OX7-3wMq;
	Fri, 23 Jan 2026 07:47:41 +0000
Message-ID: <f07d721f-ac80-4421-86a3-1f7f76ea8e6c@infradead.org>
Date: Thu, 22 Jan 2026 23:47:39 -0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [next-20260122] Build failure on IBM Power Server
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, broonie@kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <43ea0202-891d-4582-980b-5cb557b41114@linux.ibm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <43ea0202-891d-4582-980b-5cb557b41114@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:venkat88@linux.ibm.com,m:maddy@linux.ibm.com,m:broonie@kernel.org,m:linux-next@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-16216-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.713];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: DA07671F9B
X-Rspamd-Action: no action



On 1/22/26 8:15 PM, Venkat Rao Bagalkote wrote:
> Greetings!!
> 
> IBM CI has reported build failure of 20260122 on IBM Power server.
> 
> 
> Error:
> 
> 
> ERROR: modpost: "phy_get_rx_polarity" [drivers/net/phy/air_en8811h.ko] undefined!
> ERROR: modpost: "phy_get_tx_polarity" [drivers/net/phy/air_en8811h.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [/home/upstreamci/linux/Makefile:2040: modpost] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> 
> IBM CI has bisected this issue and below is the bisection log.
> 
> 
> git bisect log
> git bisect log
> git bisect start
> # status: waiting for both good and bad commits
> # good: [24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7] Linux 6.19-rc6
> git bisect good 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> # status: waiting for bad commit, 1 good commit known
> # bad: [a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d] Add linux-next specific files for 20260122
> git bisect bad a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> # good: [2574bcf1765ec13bf3ef469aa5b15cce293aebb6] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
> git bisect good 2574bcf1765ec13bf3ef469aa5b15cce293aebb6
> # good: [2ad38467d20c16f38d0cffad711ef4f4acdb8b29] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git
> git bisect good 2ad38467d20c16f38d0cffad711ef4f4acdb8b29
> # good: [a954370fea56ee1bf995524255a34da7a1ddb524] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> git bisect good a954370fea56ee1bf995524255a34da7a1ddb524
> # good: [c7ec480f05dd0185a26f190471905ddf1215bc52] Merge branch 'staging-next' of https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> git bisect good c7ec480f05dd0185a26f190471905ddf1215bc52
> # good: [4427398fed2b8e07a62fd4f3f6fcf9ffcf56829a] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> git bisect good 4427398fed2b8e07a62fd4f3f6fcf9ffcf56829a
> # good: [852ccea1ca3144beb7003976d4fa04dbf81b307b] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git
> git bisect good 852ccea1ca3144beb7003976d4fa04dbf81b307b
> # good: [f174dabd307dfd92edacb34e8bee0384daa1bd2e] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git
> git bisect good f174dabd307dfd92edacb34e8bee0384daa1bd2e
> # good: [e31f3c967c66cf03eecdf50fe138d05f635e3698] doc: Add housekeeping documentation
> git bisect good e31f3c967c66cf03eecdf50fe138d05f635e3698
> # good: [0cc83fc23debf3e2df19c4510a77fe2d60ab2693] gpu: nova-core: don't print raw PMU table entries
> git bisect good 0cc83fc23debf3e2df19c4510a77fe2d60ab2693
> # good: [75df6953fed6b7274f9c5080925ae4c8d3e424e6] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
> git bisect good 75df6953fed6b7274f9c5080925ae4c8d3e424e6
> # good: [086714bbb96f63785da251e1f8d1ce3e716a6e42] Merge tag 'v6.19-rc5' into drm-rust-next
> git bisect good 086714bbb96f63785da251e1f8d1ce3e716a6e42
> # good: [6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331] drm/tyr: use read_poll_timeout
> git bisect good 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
> # good: [b956937ce78fae5fa785f6a95f291e2137502c5e] drm: tyr: Mark BROKEN
> git bisect good b956937ce78fae5fa785f6a95f291e2137502c5e
> # first bad commit: [a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d] Add linux-next specific files for 20260122
> 
> 
> If you happen to fix, this please add below tag.
> 
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

I don't think that bisection helps very much.

Can you post the kernel config file?

-- 
~Randy


