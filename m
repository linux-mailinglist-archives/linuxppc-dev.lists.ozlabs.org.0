Return-Path: <linuxppc-dev+bounces-16395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BKCHlxAe2mNCwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 12:11:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B522FAF769
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 12:11:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1xKN0C47z2ydj;
	Thu, 29 Jan 2026 22:11:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769685079;
	cv=none; b=GsE9usvEadM0zTUivovouedoa8KwNNoBhZXoNb14c40EoPwSWyhQderJ6oDMCHzoWaT2sysYS/5dh2zm0Mbvmo7oOBqqQSPqglcTXPe6euyO1JoqGyA7p5e9+BHqNb4VAxUkinFUcaKOD/kv93j7918mk2346bZQ/okP744kK1Za6qtagzFb1/rfetl5ZoWhXtBsTx3zdAS0SgZfzws4pkePCEmSdYEe/JgF72RwkwALg6Se09wqnjqNB5oeQUhAxfZ9z+MiPxu4jyAtqgjqLbkPXbSsaulpxwKU9h/9p4lUrIjUxWhsTPiqcUzcZzFEJC8cfiFEEQoEV/+1neGMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769685079; c=relaxed/relaxed;
	bh=fCOg+Vr+1pkQkn7jSacyO8tSOkEjiKDLkkPtwyOfo8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Gm2LLCHj2v67ACqN6JTikFwIL7nbj46HnN//cGWC58aSGIGlyWAc5SStt2qZ6g+6udNsK5oyxVylaFPXidjgoHOftXyoHG+rDSb3JzqX7eLKDPdMwTa6IxsR55jIYXVW4UF/B12trK44O4169ZN0+2BP46pvnQeqMj5t1e0mlHua5B4KQRPxldoAs7dEJTyR51TgBY/MrPetymON1PkFRzXxyYvPOr87fHIA9HCyl2HB2jMqhhzDDxPLaKx5LOnY99KKEuPXUH5g1dTUIHJM65P7El1EvZ2KxYJA1iE6iJ2SDYTWsbI2l6B8QvndzJnMlrljxsc1PpSa/27+pyoTKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=egajm808; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=egajm808;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1xKM02G8z2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 22:11:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E03A540673;
	Thu, 29 Jan 2026 11:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D00C4CEF7;
	Thu, 29 Jan 2026 11:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769685075;
	bh=9Mj9fmfw6bq524BRF+/munvNYqAqgwilJJI8hE5YfC4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=egajm8087TXTn8ylQ+uBCRTkRb5hcW34LT4WDUss7w8rgOODjwprojyzNI/+wZmTy
	 Z6vpdsklBml2L7OgghLyshQ5W4YXwhm9Y5g6MeXLm11xX+bROcHavR2J21E2Su9oas
	 Az8ZOjBparxk5IM3i0L9j1VdYGSROeAvQnt9/UsfukzYOu4eLis8i0+/wBryxHMWIX
	 D7May8KTA/Zpsi03CyQ0R5vwqg9gQTUMNYbwPeITucLjjrymtrGSw/5HENlcI9dXJV
	 q/NFj92HfJPgjR3+5NdEau9xpXBHN3YNIDgleCc5LEHjov1COOmcaFoKx/k4e8ua/Q
	 ysHMkRwNF8yAQ==
Message-ID: <e23c7d00-2938-442e-9b23-1f730794e3f7@kernel.org>
Date: Thu, 29 Jan 2026 12:11:12 +0100
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
Subject: Re: Failure to build with LLVM for the Wii
To: Link Mauve <linkmauve@linkmauve.fr>, linuxppc-dev@lists.ozlabs.org
References: <aXs8sgAcci9FKKpx@luna>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <aXs8sgAcci9FKKpx@luna>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16395-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url]
X-Rspamd-Queue-Id: B522FAF769
X-Rspamd-Action: no action



Le 29/01/2026 à 11:55, Link Mauve a écrit :
> [Vous ne recevez pas souvent de courriers de linkmauve@linkmauve.fr. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi,
> 
> I’m trying to build the kernel for the Nintendo Wii, using LLVM instead
> of gcc, in order to bring Rust support to this architecture (and also
> because my distribution doesn’t ship a cross-compiling gcc), but I get
> this build issue near the end:
> ```
> % make O=wii LLVM=1 ARCH=powerpc -j1
> make[1]: Entering directory '/home/linkmauve/dev/linux/wii'
>    GEN     Makefile
>    CALL    ../scripts/checksyscalls.sh
>    DESCEND objtool
>    INSTALL libsubcmd_headers
>    WRAP    arch/powerpc/boot/dtbImage.wii
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

Must be here I guess:

arch/powerpc/boot/wrapper:${CROSS}objcopy $objflags "$kernel" "$vmz.$$"
arch/powerpc/boot/wrapper:    ${CROSS}objcopy $4 $1 \
arch/powerpc/boot/wrapper:    ${CROSS}objcopy -O binary "$ofile".elf 
"$ofile"
arch/powerpc/boot/wrapper:    ${CROSS}objcopy -O aixcoff-rs6000 
--set-start "$entry" "$ofile"
arch/powerpc/boot/wrapper:    ${CROSS}objcopy -O binary "$ofile" 
"$ofile.bin"


