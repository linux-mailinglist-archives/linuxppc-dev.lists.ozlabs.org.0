Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD003704F78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 15:38:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLHPF4BLTz3fF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 23:38:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UjFmnmvm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UjFmnmvm;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLHMd5sgJz3f7v
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 23:36:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1315661904;
	Tue, 16 May 2023 13:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9985C433EF;
	Tue, 16 May 2023 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684244203;
	bh=y/yWoPs8Nlf4p3CTjaVQfoHaJvHxuvjvDqaUL6F6Phs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjFmnmvm35D7Eoud6qOlQMYj0uS3SPPHJcIUVr0C9BDKoibiNK8iuxNXsMfN8dUcl
	 mVm73t4opsFn4yO0j6dumM+xej3qJCNa76TPN9pFSHIrzPk4gJY7dHx3ArwaUhJG1m
	 mRMvXSsr3sblzY1w38uCi8+ho8rBSWj6yui36whSEGEQVWI+NM8vEvEK5OL22MkFi3
	 FncsH9nsj40e6PPPzWlCBVz6ymCuBSDoD79oWbiprWq/5FEmdYM2tn2UwaLT5z5q1k
	 ZIMNJVjtmipsCnGvhlqqu+G63uKI6zGkdoKe4c6qBlY8PSExWjIhu9bTYaUozT7pua
	 0TiA4WuBanyaA==
Date: Tue, 16 May 2023 19:06:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 07/15] phy: fsl: Add Lynx 10G SerDes driver
Message-ID: <ZGOG5iwINTcFABHB@matsya>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
 <20230413160607.4128315-8-sean.anderson@seco.com>
 <ZFi/Y7wcad4hrAMe@matsya>
 <957a6bb4-f07b-f511-72c9-da4199dc8616@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <957a6bb4-f07b-f511-72c9-da4199dc8616@seco.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08-05-23, 11:28, Sean Anderson wrote:
> On 5/8/23 05:22, Vinod Koul wrote:
> > On 13-04-23, 12:05, Sean Anderson wrote:

> >> +static const struct lynx_cfg ls1088a_cfg = {
> >> +	.lanes = 4,
> >> +	.endian = REGMAP_ENDIAN_LITTLE,
> >> +	.mode_conflict = lynx_ls_mode_conflict,
> >> +	.mode_apply = lynx_ls_mode_apply,
> >> +	.mode_init = lynx_ls_mode_init,
> > 
> > So you have cfg with mode_xxx pointing to same functions for both of the
> > versions you support... so question is why do this and not call the
> > functions directly?
> 
> The intention is to make it easy to add support for T-series processors,
> which have a different PCCR layout.

And when is that going to come. I would prefer this to be added when we
have users being added

-- 
~Vinod
