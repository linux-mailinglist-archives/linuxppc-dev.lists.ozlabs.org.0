Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA60F9004
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 13:53:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C72k56W4zDqdX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 23:53:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C6xQ1hWtzF31M
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 23:48:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="QWldi17X"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47C6xM6z4Rz9sPJ;
 Tue, 12 Nov 2019 23:48:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573562920;
 bh=yGPX0ihRsGHoBSHw3nM8YEYTqEx8IEUHP7uLcPtPQD0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QWldi17X64RcjmSvWnT6aPC+hWjq25kDxm7dwPNBxX4z+GBonz9DE9HXXTi8CMMbR
 VtZfk+dOMHWXlhcMyFsd8FlXMBK2u3KfqbufLY+vYO3hfouTGXhQ79ew06k1QxP6WX
 IsjwnuwLnCX3y0wS75aIicIcDnSGaUPv6FYLzzY7KAkl4kGnOix8kgjXgJpbCXGtqf
 EPlj0djpApJ8K7kvxH0ASlJBpJlHX5iQgSXFwkib3YEnavcCLqW5A0ubbcDaoaOj3D
 emI6LRjcoKeorCISgDPmt4KecfdMTwW3vhSmT/Un1TeVP0m32xgbZEegBAgfa71p3H
 jrv+/09Ut48QA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Murray <andrew.murray@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v1 5/7] powerpc: dts: fsl: Use IRQ flags for legacy PCI
 IRQ interrupts
In-Reply-To: <20191104163834.8932-6-andrew.murray@arm.com>
References: <20191104163834.8932-1-andrew.murray@arm.com>
 <20191104163834.8932-6-andrew.murray@arm.com>
Date: Tue, 12 Nov 2019 23:48:39 +1100
Message-ID: <87y2wl1crc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Murray <andrew.murray@arm.com> writes:

> Replace magic numbers used to describe legacy PCI IRQ interrupts
> with #define.
>
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> ---
>  arch/powerpc/boot/dts/fsl/b4420qds.dts        |   4 +-
>  arch/powerpc/boot/dts/fsl/b4420si-post.dtsi   |   2 +-
>  arch/powerpc/boot/dts/fsl/b4860qds.dts        |   4 +-
>  arch/powerpc/boot/dts/fsl/b4860si-post.dtsi   |   2 +-
>  arch/powerpc/boot/dts/fsl/b4qds.dtsi          |   2 +-
>  arch/powerpc/boot/dts/fsl/b4si-post.dtsi      |  12 +-
>  arch/powerpc/boot/dts/fsl/bsc9132qds.dts      |   2 +-
>  arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi |  12 +-
>  arch/powerpc/boot/dts/fsl/c293pcie.dts        |   2 +-
>  arch/powerpc/boot/dts/fsl/c293si-post.dtsi    |  12 +-
>  arch/powerpc/boot/dts/fsl/gef_sbc310.dts      |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8536ds.dts       |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dts   |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8540ads.dts      | 100 ++++++------
>  arch/powerpc/boot/dts/fsl/mpc8544ds.dts       |  22 +--
>  arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi      |  22 +--
>  arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts  |  14 +-
>  arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts  |  14 +-
>  arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8560ads.dts      | 100 ++++++------
>  arch/powerpc/boot/dts/fsl/mpc8568mds.dts      |  22 +--
>  arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8569mds.dts      |   2 +-
>  arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi |  12 +-
>  arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts    | 150 +++++++++---------
>  .../powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts | 150 +++++++++---------
>  arch/powerpc/boot/dts/fsl/p2020ds.dts         |   2 +-
>  arch/powerpc/boot/dts/fsl/p2020ds.dtsi        |  46 +++---
>  arch/powerpc/boot/dts/fsl/ppa8548.dts         |   2 +-
>  arch/powerpc/boot/dts/fsl/sbc8641d.dts        |   4 +-
>  30 files changed, 408 insertions(+), 368 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
