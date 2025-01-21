Return-Path: <linuxppc-dev+bounces-5434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1781A1770F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 06:42:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycbgh406Qz2yGC;
	Tue, 21 Jan 2025 16:42:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737438128;
	cv=none; b=XOR1gTgOiIglqsILgD2O0wu0Fuh8+TM7DgNIUjnUXwIbyRFSnD1i6ewcz3L7dSsNGBkofLt7MxLHbsLh4Nt0Y1GAi/sUP0FgMLhhuHl3RvF4CAKDo1uz4ZJRuadXx8lS3/Wceah7i1JTpI8VLyGwLI7LteysXO5si6uMh1KzQ1EKPT+SICl0SzBtWZRQE0T6Fq6Q8A9fgecLRzoeD7Ln5krn2l9FC2fev5u1JWrHI1KSbojWBP6gbDa2Ls/xzfKZpU/jC6F66wIaI6n15DEW8MInjLYD8o1uYwvfX0lstoyQoc3cDWcbvOEjyMB77og470Wim3G8LvMywPUSsamLjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737438128; c=relaxed/relaxed;
	bh=W5rlUE9pSuUHpHz6caHGNTYQd/mhE+46jBfxUUf3PRk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b4mWf+Ni9wJuUZ3gfUA/qTR+YSFyeWZ/4bLGtmrfuBnLJetTIKXxsqCAe0JatIKGbTBY6kIQ5wUDZqugQ7MSghQq1KHBVifG6uxL1vqKJhxIS6cVS0pPGkQ/ioBabugP5woxosg8/jz2RQ5DQf9BFhi5Wto20HggWwe4XVeM3dYKLD9CjCH3UXmx7op3x4cQHCD7rYGC9+Nn74psaZSgFeM2PzFhbWRIIlWShWaF40h+jgIC88rz3KgIVMQ5xPqXLjEvg6RkHsu2AXFfgWGmJ5K+V/1fs/Mf1h0oaFNlwikD3+Zc6C2TysR888gbf12Mqsls2AVf3WcnPxreqEvSzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KNIM8MCT; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KNIM8MCT;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycbgf5BPnz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 16:42:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1737438116;
	bh=W5rlUE9pSuUHpHz6caHGNTYQd/mhE+46jBfxUUf3PRk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KNIM8MCTHi60AX2o3imk1smnxRbChwAnrO46jhiV2Ror/nTwFBPW8niGYyBZTgZoZ
	 gxBmkSaQYFtYFOq9w9g16eMNxTFVk76sbwLhXSU4VaXZgmjHn2vv5cT0g4boYF/IV8
	 R8DnNy2s6cUzyfsPEnCEBDfvXsjJEwp8H2LLhhjZ/MxDsdghzXgxmhOi5RIoC9jNO7
	 XswmMLYpqMKx+RjlXZtoQhYJEP9qc7P7NwPPIkyVlJL2ApVxS4+LFW0FqvqfAGHEnz
	 41YY9b9clCaH389eGbmLUl7LDtjMHLAau1wtFAUi2Eg71ncjY12TQFF1B6DiWzSYUK
	 qN5AawrVDbUpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YcbgS0gNsz4x2g;
	Tue, 21 Jan 2025 16:41:56 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Madhavan Srinivasan
 <maddy@linux.ibm.com>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the powerpc tree
In-Reply-To: <20250117174051.532c5772@canb.auug.org.au>
References: <20250117174051.532c5772@canb.auug.org.au>
Date: Tue, 21 Jan 2025 16:42:01 +1100
Message-ID: <87msfk4tau.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>
>   7fee0217538a ("MAINTAINERS: powerpc: Update my status")
>
> This is commit
>
>   77a903cd8e5a ("MAINTAINERS: powerpc: Update my status")
>
> in Linus' tree.

Sorry my fault. I asked Maddy to apply it without noticing that Linus
had already applied it.

cheers

