Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDB311A69E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 10:17:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XrtS0V3jzDqHJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 20:17:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="mKolWP6/"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XrqJ0L8RzDqfM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 20:14:51 +1100 (AEDT)
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3CD2214AF;
 Wed, 11 Dec 2019 09:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576055689;
 bh=sWqE+PcnhDwEJHLDzeVDWNdfl/id8Y+dl/d6YHFPhmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mKolWP6/zNkaJDAq1mr0n9oO24i8kaPsJRDd3Dp/NZYOY7F9QumKj2uIhdgdsLMQu
 VZ+HrToPi4ZuQeae+gCZnhKKsFTFQTeETG9LbIfEuldpN/50LPbIfDXyawdzRESIsw
 fhqzZ4d6Md+Phzj1BzeVO5L+MidMps2jm/E3xrCM=
Date: Wed, 11 Dec 2019 17:14:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Y.b. Lu" <yangbo.lu@nxp.com>
Subject: Re: [PATCH v1 3/4] arm64: dts: ls1028a: fix little-big endian issue
 for dcfg
Message-ID: <20191211091433.GU15858@dragon>
References: <20190814072649.8237-3-yinbo.zhu@nxp.com>
 <20191210000623.22321-1-michael@walle.cc>
 <VI1PR0401MB2237D2D6708807511BDB8788F85B0@VI1PR0401MB2237.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR0401MB2237D2D6708807511BDB8788F85B0@VI1PR0401MB2237.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Amit Jain \(aj\)" <amit.jain_1@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 Alexandru Marginean <alexandru.marginean@nxp.com>,
 "catalin.horghidan@nxp.com" <catalin.horghidan@nxp.com>,
 Ashish Kumar <ashish.kumar@nxp.com>, Xiaobo Xie <xiaobo.xie@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "rajat.srivastava@nxp.com" <rajat.srivastava@nxp.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>, Michael Walle <michael@walle.cc>,
 Jiafei Pan <jiafei.pan@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Yinbo Zhu <yinbo.zhu@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 10, 2019 at 02:34:30AM +0000, Y.b. Lu wrote:
> + Shawn,
> 
> > -----Original Message-----
> > From: Michael Walle <michael@walle.cc>
> > Sent: Tuesday, December 10, 2019 8:06 AM
> > To: Yinbo Zhu <yinbo.zhu@nxp.com>
> > Cc: Ashish Kumar <ashish.kumar@nxp.com>; Alexandru Marginean
> > <alexandru.marginean@nxp.com>; Alison Wang <alison.wang@nxp.com>;
> > Amit Jain (aj) <amit.jain_1@nxp.com>; catalin.horghidan@nxp.com; Claudiu
> > Manoil <claudiu.manoil@nxp.com>; devicetree@vger.kernel.org; Jiafei Pan
> > <jiafei.pan@nxp.com>; Leo Li <leoyang.li@nxp.com>;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > linuxppc-dev@lists.ozlabs.org; mark.rutland@arm.com;
> > rajat.srivastava@nxp.com; Rajesh Bhagat <rajesh.bhagat@nxp.com>;
> > robh+dt@kernel.org; Vabhav Sharma <vabhav.sharma@nxp.com>; Xiaobo Xie
> > <xiaobo.xie@nxp.com>; Y.b. Lu <yangbo.lu@nxp.com>; Michael Walle
> > <michael@walle.cc>
> > Subject: Re: [PATCH v1 3/4] arm64: dts: ls1028a: fix little-big endian issue for
> > dcfg
> > 
> 
> [Y.b. Lu] Acked-by: Yangbo Lu <yangbo.lu@nxp.com>
> 
> Hi Shawn, could you help to review and merge the two dts patches of this patch-set?
> Thanks.

Please resend them with me on recipients.

Shawn
