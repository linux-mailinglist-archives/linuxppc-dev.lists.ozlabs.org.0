Return-Path: <linuxppc-dev+bounces-6686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9689A4DF40
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 14:29:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6c3810s7z30Vb;
	Wed,  5 Mar 2025 00:29:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741094948;
	cv=none; b=G7ZNGNDQzPT28EdkwjSYmGdNqkWRWOnYS5HMQ1ltL7Jw8rJD3quouPwNMjXCSWGMEyF6OoMF6zk/EwxCqfCEd2xFaVPWjGIY0EpfStBn//S7cHZF5Vaz2KpE2Mu68ec9/0zRp5gcCRxUPL1MO49wHyqTLP3znFBN4mY3dhjpfO6VYoUtgnmt6cfOvLJkLIu1S2/oR9nksQuScKV5q6czX4F+/sc63dnbwhRjZ5iM5xhsrbbgIvk5qK63HjLb8m9Mc+GFCtibVZwNfwclNTkt1KPaWnAs+S9eVn81chWIcnrn3+zcb6qgKW/WCWeeugBwttlHBiM6V5Ju8eYA1fTAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741094948; c=relaxed/relaxed;
	bh=Vlie2s6A3W2NoubPXYvVeaREA7BeWoMmTyq0pjCXtwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4TS3bTCq7nmSX9TbgIR8/b7TfukIDjqHf4KMyr4r7fwiLPbyh4m9B5Wi48qDfm4K6TlnoydySIKdDEuzBqxKuzyZSovHWEBkc8V+YIfzXJ3W/DOeGpZtkMAX/iz7/C2x0MVCjJR0kTJ/vrba4/7RlpWhO4G5eNsFuLw0VTPcsBzocVSo3kK+KJCCemWXFtTIcQrH9mq6lfDQnrKdoAbFF1n1C3/mS2xwSdFAzNugRYpjkh2bKqd1K/scI17PZzysRGBrWaGW2k9ivhEUCe4SvBDMJCN9BKFTM88opq7VAp5fON3+DM7Kii+BNqL+5IncpAO6fpgfoKQcqnhvryQcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=R3RhzeRj; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=R3RhzeRj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6c346YQbz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 00:29:01 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 148E924002A
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 14:28:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1741094935; bh=GPsFfWzJ45kkPKaIC8bUVtCSlM7aVHTBZr1/4Ads9no=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=R3RhzeRjfiKl8RRpGtbiWddCgwW2TygfsbPeT/fMdBGDodRsnGd3NDBXVd5wKFA8r
	 HTizIctUmqdlhL5uXdQX9vTAOerQAOzGcQLj3X2i/um8I+V8wf2Yj7l7qWk1LVJegM
	 Jkb+YIMoWdTceuTfyWDy6UQg7CLiSOBbyB+Wtn8mRWj8l+RPfB2CIkGMBdircWoj5u
	 JhviOeZ1uxUg0CoTg0KOiRm4uPqPLctJVkUyodvpBeuZnH/TieWJzRE19ExAsBYcUZ
	 rIfEj+6zSvANeG4TQe++b303hdEMBe9GViZquyu7qWFS1r25tLBUsab4yCJGBF5MNp
	 mzlMxqP68d3DQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Z6c2r19WLz9rxF;
	Tue,  4 Mar 2025 14:28:52 +0100 (CET)
Date: Tue,  4 Mar 2025 13:28:51 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	dmaengine@vger.kernel.org, Crystal Wood <oss@buserror.net>,
	linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: dma: Convert fsl,elo*-dma to YAML
Message-ID: <Z8cAE0L3qnPHWLCR@probook>
References: <20250226-ppcyaml-dma-v3-1-79ce3133569f@posteo.net>
 <174059099427.2999773.4836262903761680275.robh@kernel.org>
 <20250303134200.GA1710704-robh@kernel.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303134200.GA1710704-robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Mar 03, 2025 at 07:42:00AM -0600, Rob Herring wrote:
> On Wed, Feb 26, 2025 at 11:29:54AM -0600, Rob Herring (Arm) wrote:
> > 
> > On Wed, 26 Feb 2025 16:57:17 +0100, J. Neuschäfer wrote:
> > > The devicetree bindings for Freescale DMA engines have so far existed as
> > > a text file. This patch converts them to YAML, and specifies all the
> > > compatible strings currently in use in arch/powerpc/boot/dts.
> > > 
> > > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > > ---
[...]
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/fsl,elo-dma.example.dtb: dma-controller@82a8: '#dma-cells' is a required property
> > 	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.example.dtb: dma-controller@21300: '#dma-cells' is a required property
> > 	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/fsl,elo3-dma.example.dtb: dma-controller@100300: '#dma-cells' is a required property
> > 	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
> 
> Just stick with 'dma' for node name as that's what .dts files are using 
> and 'dma-controller' is reserved for users of DMA provider binding.
> 
> Rob

Ok, makes sense.

Thanks,
J. Neuschäfer

