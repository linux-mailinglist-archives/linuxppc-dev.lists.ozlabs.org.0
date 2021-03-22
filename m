Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2076344399
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 13:54:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3vbh46nrz30DZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 23:54:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=lorenzo.pieralisi@arm.com; receiver=<UNKNOWN>)
X-Greylist: delayed 663 seconds by postgrey-1.36 at boromir;
 Mon, 22 Mar 2021 23:54:39 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F3vbM55ddz2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 23:54:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C6891063;
 Mon, 22 Mar 2021 05:43:31 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 667843F718;
 Mon, 22 Mar 2021 05:43:29 -0700 (PDT)
Date: Mon, 22 Mar 2021 12:43:26 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 minghuan.Lian@nxp.com, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>
Subject: Re: [PATCH -next] pci/controller/dwc: convert comma to semicolon
Message-ID: <20210322124326.GD11469@e121166-lin.cambridge.arm.com>
References: <20201216131944.14990-1-zhengyongjun3@huawei.com>
 <20210106190722.GA1327553@bjorn-Precision-5520>
 <20210115113654.GA22508@e121166-lin.cambridge.arm.com>
 <YEUdSZpwzg0k5z2+@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YEUdSZpwzg0k5z2+@rocinante>
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
Cc: robh@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zheng Yongjun <zhengyongjun3@huawei.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 07, 2021 at 07:36:57PM +0100, Krzysztof Wilczyński wrote:
> Hi,
> 
> [...]
> > I would request NXP maintainers to take this patch, rewrite it as
> > Bjorn requested and resend it as fast as possible, this is a very
> > relevant fix.
> [...]
> 
> Looking at the state of the pci-layerscape-ep.c file in Linus' tree,
> this still hasn't been fixed, and it has been a while.
> 
> NXP folks, are you intend to pick this up?  Do let us know.

Minghuan, Mingkai, Roy,

either one of you reply and follow up this patch or I will have to
update the MAINTAINERS entry and take action accordingly, you are
not maintaining this driver and I won't maintain your code, sorry.

Lorenzo

> Krzysztof
