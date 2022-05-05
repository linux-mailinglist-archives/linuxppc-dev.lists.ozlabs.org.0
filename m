Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD8351B6DB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 05:57:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv0Jh67z5z3bqJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 13:57:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c4jBnCEO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=shawnguo@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c4jBnCEO; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv0Hr4Ytjz3bxh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 13:56:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F0701B82B7B;
 Thu,  5 May 2022 03:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B167C385AC;
 Thu,  5 May 2022 03:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651722995;
 bh=ZGeB6BLdwvK1oB8GeNocJiTdymX72fI2+efXlTwVJ2c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c4jBnCEOMG45vtff/c4Q77SABn3uxxarmvMAmKk/KmGl27LKQ6zGH4IlcUs3/vXST
 EhH9KV2XJ0o9SKLqPAGo8LZ15aURTkoGY3PbWZa1og9dfbYUaGkczS4dmca7C6cs2x
 7itB+N3joa3qnq0QOGLvwhoxx4OUXMBPfo1pWg/w5r0QvIjdA2jOV5vzUGF3Ekyy3t
 7e4H04Ul+QVepFt4rFfHKJYINkVAsueBUR/XV6uloCYn/h8HgRxRksyZm0YeYuuO2h
 JSvE9A/N+MDo0cFUyrlbozxtyzi7J9Q4sBAv5DwxnCnbIZDFFbfEh/KbL+oAuiVHIB
 pQN1PXyW7FxRg==
Date: Thu, 5 May 2022 11:56:27 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 2/4] arm64: dts: freescale: reduce the interrup-map-mask
Message-ID: <20220505035627.GU14615@dragon>
References: <20220427075338.1156449-1-michael@walle.cc>
 <20220427075338.1156449-3-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427075338.1156449-3-michael@walle.cc>
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
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 27, 2022 at 09:53:36AM +0200, Michael Walle wrote:
> Reduce the interrupt-map-mask of the external interrupt controller to
> 0xf to align with the devicetree schema.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied, thanks!
