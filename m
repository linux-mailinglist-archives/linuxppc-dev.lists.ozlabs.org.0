Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A567953E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 11:32:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1NZT27Plz3c9r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 21:32:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qOeJ8B3m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qOeJ8B3m;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1NYV6JF8z3c72;
	Tue, 24 Jan 2023 21:31:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EED2960B29;
	Tue, 24 Jan 2023 10:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA936C433D2;
	Tue, 24 Jan 2023 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674556283;
	bh=h6wqmaeSg72818E0HuM8wvDpwZQKe1MLEUh3fylym74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOeJ8B3malNs8GmcREBHPjGGsuPcJbrrt1JGKdLHNCH1YhQS20WjWTEBMOOva9FGF
	 apXKxTTgUq/2dAGom0s22T9+BcfEaBvvJG4t8iyd6Gy67bySXFALPapgEG1g3dJYKL
	 4RdL0u0HxeZ8kpo8kX8so9Kfg663/SBoMp2aN/jm6skdR4U50mjT8QSnw0Ejqqu+Ak
	 eHzOI3ZnqZaB2qyVZ4sLLAobvB2RCwmjQYgr/4ZXYP9+7UuAXanhB0KKuvJT9HtkH1
	 b2pcZYdGoAa6q5CN5VBnbWcgih3TiIaTGrzGTOAyXW/4tzIZnirKN9LHU3I4OhxMtW
	 5kKuUezJSxpGQ==
Date: Tue, 24 Jan 2023 10:31:16 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: usb: Convert OMAP OHCI/EHCI bindings
 to schema
Message-ID: <Y8+zdODQTEyKGwpd@google.com>
References: <20230110-dt-usb-v3-0-5af0541fcf8c@kernel.org>
 <20230110-dt-usb-v3-3-5af0541fcf8c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230110-dt-usb-v3-3-5af0541fcf8c@kernel.org>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linuxppc-dev@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 23 Jan 2023, Rob Herring wrote:

> The OMAP OHCI and EHCI USB host bindings follow the generic binding, so
> add the compatibles and remove the old txt binding docs.
> 
> The examples in omap-usb-host.txt don't match actual users, so update
> them dropping the fallback compatible.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v3:
>  - Fix document references to generic-ehci.yaml and generic-ohci.yaml (0-day)
> v2:
>  - New patch
> ---
>  .../devicetree/bindings/mfd/omap-usb-host.txt      |  8 +++---

Acked-by: Lee Jones <lee@kernel.org>

>  .../devicetree/bindings/usb/ehci-omap.txt          | 31 ----------------------
>  .../devicetree/bindings/usb/generic-ehci.yaml      |  1 +
>  .../devicetree/bindings/usb/generic-ohci.yaml      |  4 ++-
>  .../devicetree/bindings/usb/ohci-omap3.txt         | 15 -----------
>  5 files changed, 8 insertions(+), 51 deletions(-)

-- 
Lee Jones [李琼斯]
