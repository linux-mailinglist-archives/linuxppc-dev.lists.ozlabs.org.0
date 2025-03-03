Return-Path: <linuxppc-dev+bounces-6648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655EFA4C2A9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 15:00:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z60nj4nhgz2xX3;
	Tue,  4 Mar 2025 01:00:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741010425;
	cv=none; b=LURjoy3d2ALWwjIzmP+56ND+2tbwh/XLeEY9e3wrDRsbTez0WI3hxnkj8mzpL8oOBWGkthXmXqp5+ga+Rhzbg2R5zvgie7si806XQN0hH5RVDR8kjQUQDb4fA20GLJ1vRlYe3kAAx8iEaNc3QjYQWE7yw5R+NH/15DpWELgptLKKrsOi2mYs25LUiB2Yb/4Mp9VkW0xTcGLGKh9JbjONV981XjpDKVes6W7aW769u15Vl45aLYr2zWXZsqt2hC9dk+hywH+bz9VXBHmzg+E/aAxxq+kDDpQLGcXbTVGPC06fdPe2JmvovmKzzVc3NBXF6Wrvvw16oWduoZ6xfZBjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741010425; c=relaxed/relaxed;
	bh=26REjzN2pCHBTgrgK8lb2ROww5O4wc/uS6T8Q9tL0N8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlkugvmzOroDe/qHyd6U4fZy2QnIuXEN2RSjbyvAHx3qCMP4i6V0bmLnSARVxfpXSttxe5SuE35xtydnkC4LjlDlqhTudsDsEsogf4PsYWyAkDnFBdRWCEH4Wew8rIvzib8EpClCNlQMJJ+uQ1vUUXFHQEtk4bHkvKvF01k3eI4xuW+kJSIvJaZcuu6ZffHSuXHo9CPJjFFWflJIPUmder7Jewbqhgdkhe2aiBcYRjMG+ZXscI8mITvGA3q8dDB9I1YqMzrUpmZdH65hD7e1lJ8COytKF3YyaaSU1+jX/WGs3t6QzhR9U3hzyFsfkLFLaNwqO4b/a2zYfslGleTMdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LDE7Vziq; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LDE7Vziq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z60nh5j04z2y92
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 01:00:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FA2B5C566B;
	Mon,  3 Mar 2025 13:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C4AC4CED6;
	Mon,  3 Mar 2025 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741010422;
	bh=Kp+dH75fRkj4Yg2B/u14qSdnyXfV1851mjVlG/eyDkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LDE7VziqE8Z5eAcLy1ADJtkYPvmnQ1FWgShTdhPsi0Jp00/5H4ih7eFkudyTpV6Ey
	 vzUekJexEEcxmdtofMzZn68/GabGTmMLoyDmPxm2kdElEPPLV3qZha5Aib/AxkKR7v
	 m/mOgM3NliygKNSm4cdkNZYbDU4CUHy7o2nUsiBNydIculfOZE9XJX6vA2Cx8O7TEs
	 nqGWAiDj2LY2VHmrB5jeTqSMkAWpR8/oVe9f3U39KoH0vSV+sGksApEvY4YbqOUYgD
	 MEbgvDOyAHF9gVrkOu+yiC5BM/+QxMgNexT3mwUVWIsR0RWjNldR9e1Z2gFqBmOcaC
	 wYe+elLtbMKhQ==
Date: Mon, 3 Mar 2025 08:00:21 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Richard Weinberger <richard@nod.at>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Crystal Wood <oss@buserror.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-mtd@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/3] dt-bindings: nand: Add fsl,elbc-fcm-nand
Message-ID: <20250303140021.GA1732495-robh@kernel.org>
References: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
 <20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net>
 <174059551678.3319332.12055848852503108874.robh@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174059551678.3319332.12055848852503108874.robh@kernel.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 26, 2025 at 12:45:17PM -0600, Rob Herring (Arm) wrote:
> 
> On Wed, 26 Feb 2025 18:01:41 +0100, J. Neuschäfer wrote:
> > Formalize the binding already supported by the fsl_elbc_nand.c driver
> > and used in several device trees in arch/powerpc/boot/dts/.
> > 
> > raw-nand-chip.yaml is referenced in order to accommodate situations in
> > which the ECC parameters settings are set in the device tree. One such
> > example is in arch/powerpc/boot/dts/turris1x.dts:
> > 
> > 	/* MT29F2G08ABAEAWP:E NAND */
> > 	nand@1,0 {
> > 		compatible = "fsl,p2020-fcm-nand", "fsl,elbc-fcm-nand";
> > 		reg = <0x1 0x0 0x00040000>;
> > 		nand-ecc-mode = "soft";
> > 		nand-ecc-algo = "bch";
> > 
> > 		partitions { ... };
> > 	};
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > 
> > V3:
> > - remove unnecessary #address/size-cells from nand node in example
> > - add Frank Li's review tag
> > - add missing end of document marker (...)
> > - explain choice to reference raw-nand-chip.yaml
> > 
> > V2:
> > - split out from fsl,elbc binding patch
> > - constrain #address-cells and #size-cells
> > - add a general description
> > - use unevaluatedProperties=false instead of additionalProperties=false
> > - fix property order to comply with dts coding style
> > - include raw-nand-chip.yaml instead of nand-chip.yaml
> > ---
> >  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml | 68 ++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.example.dtb: nand@1,0: $nodename:0: 'nand@1,0' does not match '^nand@[a-f0-9]$'
> 	from schema $id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#

Drop the unit address in raw-nand-chip.yaml. So: 

properties:
  $nodename:
    pattern: "^nand@"


