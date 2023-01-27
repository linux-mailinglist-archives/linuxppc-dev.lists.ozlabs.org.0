Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A6A67DEB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 08:55:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P38xc4Spgz3fGg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 18:55:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ab38RrYu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ab38RrYu;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P38wj25qDz3fFS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 18:54:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5E01BB81FB7;
	Fri, 27 Jan 2023 07:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600A7C433EF;
	Fri, 27 Jan 2023 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674806049;
	bh=CM71a7RaPTKo5G+aWp9LGHGbcPlqyBG685bqrz/8uJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ab38RrYubwJ/Bf8gU8e5ltFEMR680slK5s1jVaoKxRnglRIg1PFf826eC0hgtSVDV
	 HLmDjzOXdvMv8md5rlx735fM5c0OlSh4K3RbSVAoT29tc0OWZrni2aeEF0CH04lwnc
	 bhTYpVcLplNzIG2yaAOYCKoDQtP0dgW26+1LLOO00dRTaYay2t37bea6mYggYT+YGZ
	 0GYe5ROZVOiT5IDAr+eIihMXj6GTsxMlBtyCfOUh4HmfROsX6kS5CtY48TjrRXmF59
	 vpOqnDPuFz7GQuV9srMdOLa+EEniFdJ+zkZJcgc0GU05WClVGWE3AREDDr4FWAnVxC
	 Q3c236md0EikA==
Date: Fri, 27 Jan 2023 15:53:57 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v9 06/10] arm64: dts: ls1046a: Add serdes bindings
Message-ID: <20230127075356.GM20713@T480>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-7-sean.anderson@seco.com>
 <20230125234638.GD20713@T480>
 <aa602661-f7f6-ca63-d8a7-d6de0e924259@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa602661-f7f6-ca63-d8a7-d6de0e924259@seco.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 11:43:26AM -0500, Sean Anderson wrote:
> On 1/25/23 18:46, Shawn Guo wrote:
> > On Thu, Dec 29, 2022 at 07:01:35PM -0500, Sean Anderson wrote:
> >> This adds bindings for the SerDes devices. They are disabled by default
> > 
> > s/bindings/descriptions?
> > 
> > The term "bindings" generally means the schema/doc in
> > Documentation/devicetree/bindings/.
> 
> How about "nodes"?

Yeah, or device nodes.

Shawn
