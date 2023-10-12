Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2512E7C7810
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 22:48:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jwW6XONp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S61v66pNNz3cm9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 07:48:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jwW6XONp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S61tC3SFYz3cCM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 07:47:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0DE7AB8270F;
	Thu, 12 Oct 2023 20:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D11C433C7;
	Thu, 12 Oct 2023 20:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697143662;
	bh=aRI71YpV2+d2IfU0eZ+HabZAmiGR+yyp2A4+ZTsQCm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwW6XONp9+IMeAdLC1MyMWFkTL/L1Hr+ur2t+B5NP0UUDc9ONKaqHTzvv0oxqvS9/
	 /jXz/mBCECQ846jut7nzwMpEVmoV4xcaSarxfTXPF9zQUCeLVeXpWbQSGeWElukxpH
	 hmK9Xu879p9WIcxTglg170fsF1NK+WWmRk+1etdS2+gsznWZdx4SghDduB8FUkFTTI
	 D5aLPEDFrX/Ew+4GELA8rAyIl0CXXsS9jBSxEzf4TvcKz0L3tTGLy3DfL+c4iBoH8Y
	 V9I7A1mtfNwuYaOTFpgho6RY5aglBHpgGTC2DZO9Cw9eDAHayKrqnTF0tLqIkf0Fdz
	 OpimIrub0090Q==
Received: (nullmailer pid 1712886 invoked by uid 1000);
	Thu, 12 Oct 2023 20:47:39 -0000
Date: Thu, 12 Oct 2023 15:47:39 -0500
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: sound-card-common: List DAPM
 endpoints ignoring system suspend
Message-ID: <20231012204739.GA1706264-robh@kernel.org>
References: <20231011114759.1073757-1-chancel.liu@nxp.com>
 <f639c88d-371a-4c72-a906-47d643b24ca8@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f639c88d-371a-4c72-a906-47d643b24ca8@sirena.org.uk>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, Chancel Liu <chancel.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 11, 2023 at 10:21:33PM +0100, Mark Brown wrote:
> On Wed, Oct 11, 2023 at 07:47:58PM +0800, Chancel Liu wrote:
> 
> > +  lpa-widgets:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description: |
> > +      A list of DAPM endpoints which mark paths between these endpoints should
> > +      not be disabled when system enters in suspend state. LPA means low power
> > +      audio case. For example on asymmetric multiprocessor, there are Cortex-A
> 
> I suspect that the DT maintainers would prefer that this description be
> workshopped a bit to remove the Linux specifics.

And Cortex A/M specifics if this is a common binding.


>  I think the key thing
> here is that these are endpoints that can be active over suspend of the
> main application processor that the current operating system is running
> (system DT stuff is an interesting corner case here...), and the example
> is probably a bit specific.  Other bindings use "audio sound widgets"
> rather than "DAPM widgets".
> 
> We also shouldn't see that these endpoints "should not be disabled"
> since that implies that they should be left on even if they aren't
> active which isn't quite the case, instead it's that we can continue
> playing an audio stream through them in suspend.

This seems like one of those things that everyone has/does, and everyone 
handles it a bit differently. I applaud trying to do something common, 
but it isn't really common until we have multiple users.

Rob
