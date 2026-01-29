Return-Path: <linuxppc-dev+bounces-16407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKZJD9Pfe2ljJAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 23:31:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6365DB559F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 23:31:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2DQR6tY5z2y6G;
	Fri, 30 Jan 2026 09:31:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769725903;
	cv=none; b=Kw+/ItXmxZ2pCV5YdCexT3ZT7fe9jLHHli61v1i6bKAunlY4ibSrlP0WVY9nJX7jotvglYIFObRjBTGTh1LXgKLcS7Hov17uiVZMJNunTvLT6x5+UXQsfR0nFZUqBNQjFCwRO1fkgc1gcNLplIoUQkzGUsTIQTTRZHJsxYC9CSaeA0H9OsF8ZKv/0USoPlLqinapTbCsiToHbnDeB5NCzAVy6FyKQAylGhL7LWEk7LspE3stJFoRJDC9FenGr08Rx3zqg/J2hNeYnPHVw84eBBs9ueE++TCYhhbPDpsntFZFAFeF7wjoSqoEERraxNbHgOrmg6gjMWuA+GumnSsXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769725903; c=relaxed/relaxed;
	bh=AGbWynn54TuwXdaLRJ2FlA7C/5UgLSkYvUaEIrfr1bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUO6g8gjwPtFselkJ8cUZ00f9ppriSYSk5ECICKkIhrPZw84oWK30W7tLkDeOgdRBmD2hgayxl7GfMQyPThtO5RN/RMtVgi+3Lr0EqB58xq+x5bxmFbmJQvuHm9LV+Zza+et2NhpTT1lPHMmr/gAu9w1kRl7+jamSKlwufNQCKoHLnpd/PEnPMjubrkXkKHWmLfcNcAJDV7Fra4ZZ+jgc+V1kSwQte7Jz127ZmAYrAC1p10wrO8ehcjJz/XZEtorcl+xVaP+b2CnmIIQXtlaonKqMypXn6kZFOmNXbBK1/pu808bo7KnkCKAmOchlVhu6EvdSHmoxYJ9ZdQoEvMEUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q9XqZXlz; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q9XqZXlz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2DQR22Nxz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 09:31:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F6B460054;
	Thu, 29 Jan 2026 22:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFF7C4CEF7;
	Thu, 29 Jan 2026 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769725899;
	bh=E32m1zZl3x1RripaVchHUXrgIQHgmrfviHWdUL621HE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9XqZXlzP6Mp6G99g+KUIqj2ErofnD8ERZW7Gh29Xb9YlUznohVK/Imewv1JI6ILk
	 zQ+6rZYGMs5Wvsqs6eiDPtVG0t2AmarAYGamMZiH4MRm8iNAIQaGD7ouYFSixJQkdU
	 UBPtshydj6D/gmxbpm+w844GVPIpUpk66r/HzsTVio/nsCKXxgJSqGuGs5BB2MdXxR
	 mHp5HxhnkQ26Lo5h7Wd+XkinJfRgP5wE2Ek4ieDpicb1JesZT6T+RUU1jxgn2M3g9g
	 lBC9v94uFT2rnM2tCeKjHp9g3NkU5VUodpFxX4tnqkji6DOnNqdd5tmmkpJDoeU6Pu
	 zGJWVYtdLOj9g==
Date: Thu, 29 Jan 2026 15:31:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
Subject: Re: Failure to build with LLVM for the Wii
Message-ID: <20260129223136.GA1614447@ax162>
References: <aXs8sgAcci9FKKpx@luna>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXs8sgAcci9FKKpx@luna>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16407-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 6365DB559F
X-Rspamd-Action: no action

Hi Link,

On Thu, Jan 29, 2026 at 11:55:46AM +0100, Link Mauve wrote:
> I’m trying to build the kernel for the Nintendo Wii, using LLVM instead
> of gcc, in order to bring Rust support to this architecture (and also
> because my distribution doesn’t ship a cross-compiling gcc), but I get
> this build issue near the end:
> ```
> % make O=wii LLVM=1 ARCH=powerpc -j1
> make[1]: Entering directory '/home/linkmauve/dev/linux/wii'
>   GEN     Makefile
>   CALL    ../scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   WRAP    arch/powerpc/boot/dtbImage.wii
> objcopy: Unable to recognise the format of the input file `vmlinux'
> make[3]: *** [../arch/powerpc/boot/Makefile:394: arch/powerpc/boot/dtbImage.wii] Error 1
> make[2]: *** [../arch/powerpc/Makefile:236: zImage] Error 2
> make[1]: *** [/home/linkmauve/dev/linux/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/home/linkmauve/dev/linux/wii'
> make: *** [Makefile:248: __sub-make] Error 2
> ```
> 
> I believe it should use $(OBJCOPY) instead of objcopy, which is set to
> llvm-objcopy, but couldn’t figure out where it is misconfigured.
> 
> Thanks for your help!

It is the arch/powerpc/boot/wrapper script:

  https://github.com/ClangBuiltLinux/linux/issues/1601

I have a WIP series from long ago that may be a good starting point for
getting something working but there were some errors I never got around
to solving before having to shelve it for other issues:

  https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git/log/?h=wip/llvm-1-powerpc-boot-wrapper

Maybe something I (or someone else) can get back to soon.

Cheers,
Nathan

