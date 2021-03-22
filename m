Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624713447AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 15:45:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3y3d2CyYz3bdF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 01:45:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=lorenzo.pieralisi@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F3y2r4NmZz302W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 01:45:07 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F0131042;
 Mon, 22 Mar 2021 07:45:04 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5C2B3F719;
 Mon, 22 Mar 2021 07:45:02 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:44:57 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Roy Zang <roy.zang@nxp.com>
Subject: Re: [PATCH -next] pci/controller/dwc: convert comma to semicolon
Message-ID: <20210322144457.GA13436@e121166-lin.cambridge.arm.com>
References: <20201216131944.14990-1-zhengyongjun3@huawei.com>
 <20210106190722.GA1327553@bjorn-Precision-5520>
 <20210115113654.GA22508@e121166-lin.cambridge.arm.com>
 <YEUdSZpwzg0k5z2+@rocinante>
 <20210322124326.GD11469@e121166-lin.cambridge.arm.com>
 <VI1PR04MB5967D3FCEE442AF30738939B8B659@VI1PR04MB5967.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB5967D3FCEE442AF30738939B8B659@VI1PR04MB5967.eurprd04.prod.outlook.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 "robh@kernel.org" <robh@kernel.org>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Zheng Yongjun <zhengyongjun3@huawei.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 22, 2021 at 01:40:16PM +0000, Roy Zang wrote:
> Yes.  It is maintained.

To be maintained you should review its code please.

> I will send out a patch.

Krzysztof already posted one for you, you just need to ack it:

https://patchwork.kernel.org/project/linux-pci/patch/20210311033745.1547044-1-kw@linux.com

For the future email exchanges: don't top-post please.

Thanks,
Lorenzo

> Thanks.
> Roy
> 
> -----Original Message-----
> From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> 
> 
> On Sun, Mar 07, 2021 at 07:36:57PM +0100, Krzysztof Wilczyński wrote:
> > Hi,
> > 
> > [...]
> > > I would request NXP maintainers to take this patch, rewrite it as 
> > > Bjorn requested and resend it as fast as possible, this is a very 
> > > relevant fix.
> > [...]
> > 
> > Looking at the state of the pci-layerscape-ep.c file in Linus' tree, 
> > this still hasn't been fixed, and it has been a while.
> > 
> > NXP folks, are you intend to pick this up?  Do let us know.
> 
> Minghuan, Mingkai, Roy,
> 
> either one of you reply and follow up this patch or I will have to update the MAINTAINERS entry and take action accordingly, you are not maintaining this driver and I won't maintain your code, sorry.
> 
> Lorenzo
> 
> > Krzysztof
