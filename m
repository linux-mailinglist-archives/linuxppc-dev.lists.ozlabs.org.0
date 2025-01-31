Return-Path: <linuxppc-dev+bounces-5751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E193A2405E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 17:26:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl1Vq10X5z30ML;
	Sat,  1 Feb 2025 03:26:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738340803;
	cv=none; b=KMIKTIaLxc+NOaVIuzknV2DEurznnEA+WBareYXS/BmgsVAdMXSKqj2hSqqIveY1UbCqjRQR/FlRL9mvSocrC71zz25M76DPW4PN+pOUxBPLdULk96Jr+hdrz2ytQjnxy3Xr138+4/N5UcfIp8l1sy9dgn2PazrCA/k53oTP4qDYmOJ7e4/+K+nlSpueJM95KT+AC1ds/KfaT9BN79w11/ZHk845zK2s9gTdzaoVSJedqUhdPtJcyF5Fjnl3xbIKMpj6ad6jR8wVprnyuNFROWlP363iuOWwh+PR9f81AYrZ/PqTaFCFS1tiw2FCdK1rYq8Dji4ih+7e5xpsHI4KvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738340803; c=relaxed/relaxed;
	bh=I1uj/AIFvW3TkvVDVcjXPUH5/EYWEwV4qgbFUX28yB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNDAAr+0Dl5k305MY/INivQNDEI9j2UPZ8F1WWpm/Oy4hTasCjrUPQjpcztNGwazWrKyC15PlvbWnoNqCb/fXwCnuIfShqZfR12CZhB/rGYxa/23aZfPb3lS3scAq5SteMw58uOoq2msADs4Gi15jojEWPWDQJwccqWdyVbAE0pHIa6NGUbt03E96pW+h3lor2CXO7szVdROUt6rKburDxJY846+ugSs2BDtrRGxYvJxmSqgx7r79Z3pZslqz5o9CUKQPOrCIJMFSUVom4WNB+R6V7Hfz/ibyRzZOQEA58qAlJwyOjdXkIDlwX1ighurn7uH6MdiAoePN8rFjztniw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl1Vp1tBCz30Kd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2025 03:26:42 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 50VGPe0x026344;
	Fri, 31 Jan 2025 10:25:40 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 50VGPdxQ026339;
	Fri, 31 Jan 2025 10:25:39 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 31 Jan 2025 10:25:38 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/5] powerpc/microwatt: Define an idle power-save function
Message-ID: <20250131162538.GZ20626@gate.crashing.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org> <Z5lfyDQbGjxYT_eF@thinks.paulus.ozlabs.org>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5lfyDQbGjxYT_eF@thinks.paulus.ozlabs.org>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi!

> +static void microwatt_idle(void)
> +{
> +	if (!prep_irq_for_idle())
> +		return;
> +
> +	__asm__ __volatile__ ("wait");
> +}

All asm without outputs is always implicitly volatile (if it wasn't, it
could always be transfirmed whatever way you want, like, optimised away
completely).

It can still be useful for documentation purposes of course, but here it
is the other way around really, it is just cargo cult :-(


Segher

