Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 870C57B51D5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 13:56:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Y+TMpJzr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzfYH4Gs8z3vYx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 22:56:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Y+TMpJzr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzfXN1CFZz3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 22:55:12 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D7EAC0007;
	Mon,  2 Oct 2023 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696247707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZauemzlB2GLs7I7VeZeMr7YTRfLhZitHrMbmBgYpBFo=;
	b=Y+TMpJzrSEayNtrQ1/UBUfMpH1c7s5l736WL9S3/lFbOXcx0BTUCPb/erG9k+osScJSt0y
	2tbeBT7/SGnbvouwlGDLERC25y4ZcvayWFzdg/+PfokEDbKflSRhLVWeR40woW8xPlw8Ox
	8YG1Fvh6sY+27HWsp2z15RKmQUl5kLV9dzDDPUB0zbgmVCPFeznmRQGhJQOZ2xTSYzAjGe
	NoJzak3j4Py4dzMatBXdC8yNKY3MdQrC208MwQiapP6gCOc8Tx0NARPrBEWIeXgMu71pdE
	KxUkEfL+NLoKzt+j+Ski75iX7InerKkxpp5uKvWbQdzBuBTRaaRAlf+3yYfmTA==
Date: Mon, 2 Oct 2023 13:54:58 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 25/30] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20231002135458.420f6ae4@bootlin.com>
In-Reply-To: <202309291924.OBfdyhXb-lkp@intel.com>
References: <20230928070652.330429-26-herve.codina@bootlin.com>
	<202309291924.OBfdyhXb-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob, all,

On Fri, 29 Sep 2023 20:04:44 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Herve,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.6-rc3 next-20230929]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/soc-fsl-cpm1-tsa-Fix-__iomem-addresses-declaration/20230928-151746
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20230928070652.330429-26-herve.codina%40bootlin.com
> patch subject: [PATCH v7 25/30] dt-bindings: net: Add the Lantiq PEF2256 E1/T1/J1 framer
> compiler: loongarch64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230929/202309291924.OBfdyhXb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309291924.OBfdyhXb-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
> >> Documentation/devicetree/bindings/net/lantiq,pef2256.yaml: properties:lantiq,data-rate-bps: 'oneOf' conditional failed, one must be fixed:  
>    	'type' is a required property
>    		hint: A vendor boolean property can use "type: boolean"
>    	Additional properties are not allowed ('default', 'enum' were unexpected)
>    		hint: A vendor boolean property can use "type: boolean"
>    	Additional properties are not allowed ('default' was unexpected)
>    		hint: A vendor string property with exact values has an implicit type
> >> 	Documentation/devicetree/bindings/net/lantiq,pef2256.yaml: properties:lantiq,data-rate-bps: 'oneOf' conditional failed, one must be fixed:  
>    		'$ref' is a required property
>    		'allOf' is a required property
>    		hint: A vendor property needs a $ref to types.yaml
>    		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
>    	2048000 is not of type 'string'
>    		hint: A vendor string property with exact values has an implicit type
>    	4096000 is not of type 'string'
>    		hint: A vendor string property with exact values has an implicit type
>    	8192000 is not of type 'string'
>    		hint: A vendor string property with exact values has an implicit type
> 

This issue is related to '-bps' standard suffix not yet available in the
dt-schema release.
The commit adding '-pbs' suffix is
  commit 033d0b1 ("Add '-bps' as a standard unit suffix for bits per second")
present in https://github.com/devicetree-org/dt-schema/

This point was previously discussed with Rob [1] and mentioned in the cover
letter of the series.

[1]: https://lore.kernel.org/linux-kernel/CAL_JsqJTruTExc=uHCPCp3q-fo+fB-wAJ-ggPpHpWcHSoGALdw@mail.gmail.com/

Best regards,
Hervé

