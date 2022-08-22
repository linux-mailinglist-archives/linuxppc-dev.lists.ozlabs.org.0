Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F8F59C0FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 15:51:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBDKr1094z3cdw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 23:51:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pVEGPBuX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pVEGPBuX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBDKG1Gt4z3086
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 23:50:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D110A611A8;
	Mon, 22 Aug 2022 13:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18269C433D6;
	Mon, 22 Aug 2022 13:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661176254;
	bh=/cAXDlxfdqXtNq2EiSdHceUvcnPaNa0w0mmKBDRxaTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVEGPBuXI1lIaWb0vZ7AbB8Bh4pFVa8uYcmwTmCuZYzZ8XlOhFz2AscRUCUHgjY01
	 WxwWLAALdKtnt9/PV9aDGvcwj2fr0LOoORwyZFZv8Ds0hpCyDisbvuEIlw8NH3L3id
	 Wu4UhnjHyB+oDNU2hlqRCA0bgLgaknVTNRL0VTRFNSc4m2p4UgCosm5NhgmZMBVPVq
	 JR6U4v8fvwlTjZKNeXaH5G/6m/lAJqz4lhY1cRI5OEDU7gJQNNchC5cCcTzlUNE1gP
	 4fFuxExY5MwhTgZUWfBVJcMLXONUyn2OsmqdAP5mtTQ1KU2vWZX9qUyY3G6qrwKXdU
	 ChE3GCV7L2oYw==
Received: by pali.im (Postfix)
	id CB05697B; Mon, 22 Aug 2022 15:50:50 +0200 (CEST)
Date: Mon, 22 Aug 2022 15:50:50 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: reset: syscon-reboot: Add priority
 property
Message-ID: <20220822135050.o4a4bw3dqkmhtjgb@pali>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220822124728.GA3641041-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220822124728.GA3641041-robh@kernel.org>
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
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 22 August 2022 07:47:28 Rob Herring wrote:
> On Sat, Aug 20, 2022 at 12:29:23PM +0200, Pali Rohár wrote:
> > This new optional priority property allows to specify custom priority level
> > of reset device. Default level was always 192.
> 
> Why do we need/want this? What problem does it solve?

See patch 3/3.

> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >  .../devicetree/bindings/power/reset/syscon-reboot.yaml        | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> > index da2509724812..d905133aab27 100644
> > --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> > +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> > @@ -42,6 +42,10 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description: The reset value written to the reboot register (32 bit access).
> >  
> > +  priority:
> 
> A bit too generic for the name.
> 
> > +    $ref: /schemas/types.yaml#/definitions/sint32
> > +    description: Priority level of this syscon reset device. Default 192.
> 
> default: 192
> 
> 
> Though I'm not really sure about the whole concept of this in DT. Where 
> does 192 come from?

Implicitly from the current implementation and how it is used.

> Presumably if we have more than 1 reset device, then 
> 'priority' is needed in multiple places. So you need a common schema 
> defining the property (as property types should be defined exactly 
> once) which this schema can reference.
> 
> Rob

Sorry, I do not understand.
