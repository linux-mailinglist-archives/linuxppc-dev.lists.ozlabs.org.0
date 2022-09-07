Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF39D5B0A31
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 18:34:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN7BB4G2Rz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 02:34:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f+8BMs2C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f+8BMs2C;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN79b2r2Hz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 02:33:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5B463B81E0C;
	Wed,  7 Sep 2022 16:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE94DC433C1;
	Wed,  7 Sep 2022 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662568414;
	bh=AAB6Huu3ZlaINnAmbB+e3dt23bU2El2/Mz0SFEyyIxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+8BMs2CzlgjCDzTBmoW489NaCSwLjhVnegzttOeTHnOktXYFDM192XHs4sF2AGc+
	 diLyroyG1iD5TvGOdh1CVJnaF7pDtqrqAC6Lw/+jCy9yl39d/Ypjz01evcAK0J6WG2
	 dP9UGtbUJ7QoysWRtwjCNSKpPgCC2WeTPmGiTcy8ESQvnjZJs3vbCtZDST7wsGMIqJ
	 R4ym//XbwQtYnUk33tBGBH36tim4qSR0J0U56uSYrdA/oYBn/sAPxQrU1igKEgvC6s
	 jk2/p93qDyihdy+HC7/HqtbslxyYbODZ/4XJ9EYCs8+yn7ClgGPzDbPd8KcGRZHzFn
	 5Ew8iLMWRbjqQ==
Received: by pali.im (Postfix)
	id 4B1FA7F0; Wed,  7 Sep 2022 18:33:31 +0200 (CEST)
Date: Wed, 7 Sep 2022 18:33:31 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: syscon-reboot: Add priority
 property
Message-ID: <20220907163331.zoumcdmmarnbkmm5@pali>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220831081715.14673-1-pali@kernel.org>
 <9a71a2f3-97f6-f3ac-8852-1d3da1a50370@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a71a2f3-97f6-f3ac-8852-1d3da1a50370@linaro.org>
User-Agent: NeoMutt/20180716
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
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday 07 September 2022 14:38:42 Krzysztof Kozlowski wrote:
> On 31/08/2022 10:17, Pali Rohár wrote:
> > This new optional priority property allows to specify custom priority level
> > of reset device. Prior this change priority level was hardcoded to 192 and
> > not possible to specify or change. Specifying other value is needed for
> > some boards. Default level when not specified stays at 192 as before.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> 
> Thanks for the changes. Explanation looks good.
> 
> I sent a patch adding the common schema with priority. If it gets
> ack/review from Rob and Sebastian, please kindly rebase on top of it and
> use same way as I did for gpio-restart.yaml
> 
> Best regards,
> Krzysztof

Ok, so just by adding "allOf: - $ref: restart-handler.yaml#" right?
