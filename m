Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C09CE6B8BBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 08:10:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbPmd48gBz3chV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 18:10:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q6GdfbTC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q6GdfbTC;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbPlh1B70z3c9Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 18:09:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1D7AAB818A0;
	Tue, 14 Mar 2023 07:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA01C433EF;
	Tue, 14 Mar 2023 07:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678777753;
	bh=dJiDwvlKwnk919Dv4H3AXKo5uOs1Vovj49gT6cb/jxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6GdfbTC2MbHRDbOnIBC/47DzX2vfiiY7SZlSEZW+hiM2YhvOyhixQfDAkI2v2P97
	 +99h3BL7fcoY5hbHjneA8iRmoi8pagpgl3P4f6ygcY+ewbJ9UjEcU43kJG8C1SIn1F
	 7rpif6nuy+vhCSKruzIqhwstfPZV4dcZaRng2853tLxw8pE3bhbPFQ23eJGvA5jaDh
	 HoKFo1WW/n3xgZ9OJPfwqQ5+TfoSiWw4dX5td7+3je0WvSAm9Iihl2hgQFwYwbk8cj
	 zwddUmQ/o3m5/PLXLBcblZ8SgEXfX9w0SymDtPJVBUDAcVcMCnuaBwQi77+AwRHVFk
	 o8YYiA/mM4HLw==
Date: Tue, 14 Mar 2023 15:08:48 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v11 09/13] arm64: dts: ls1046a: Add serdes nodes
Message-ID: <20230314070848.GA143566@dragon>
References: <20230313161138.3598068-1-sean.anderson@seco.com>
 <20230313161138.3598068-10-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313161138.3598068-10-sean.anderson@seco.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 13, 2023 at 12:11:33PM -0400, Sean Anderson wrote:
> This adds nodes for the SerDes devices. They are disabled by default
> to prevent any breakage on existing boards.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

The DTS patches look good to me.  Let me know if they are ready to be
applied.

Shawn
