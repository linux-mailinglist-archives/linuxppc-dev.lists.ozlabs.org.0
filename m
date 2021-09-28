Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD941B821
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 22:08:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJrDh56TMz2yn1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 06:08:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SJlILrO3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SJlILrO3; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJrD04d7Sz2xr3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 06:08:16 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13EEA61157;
 Tue, 28 Sep 2021 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632859693;
 bh=2q54bLyOqMkKWDejBRp+5bRZfTrKTSWJcV2n/WM7O5I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=SJlILrO3fJ9ue8UvYpapX4ojkALIQWP0IhyvgGUEnmc2bU4/eR9Oz1WHf91TFCvXA
 +AvaFLotNIk6GNVMTzMiHUmE0SECnG/DaFsMeYfbeJ4HnUD4sgFtdp1R5TXABKq/V5
 4Gltdrd5KbjraDvTp7Dojw2UaOlvPdW7DYea08nUCxmciYyaMtdgK79OJikk1fI3dS
 IQxjaLHV0wfoBer0BAfg32is1dAvMuIslQlV94SxW032Uh3Itk0NL7NQX8SiKEicB1
 kZRIFonoYbzHfn7L/mtYQNU1K3C/vNR3V9ujP6yh2gmx56PtY428rmLhwG6a55K51M
 NJoYyJGhopiig==
Date: Tue, 28 Sep 2021 15:08:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4 4/8] PCI: replace pci_dev::driver usage that gets the
 driver name
Message-ID: <20210928200811.GA724823@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210928192936.w5umyzivi4hs6q3r@pengutronix.de>
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
Cc: linux-pci@vger.kernel.org, Alexander Duyck <alexanderduyck@fb.com>,
 oss-drivers@corigine.com, Oliver O'Halloran <oohall@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Ido Schimmel <idosch@nvidia.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 Vadym Kochan <vkochan@marvell.com>, Michael Buesch <m@bues.ch>,
 Jiri Pirko <jiri@nvidia.com>, Salil Mehta <salil.mehta@huawei.com>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taras Chornyi <tchornyi@marvell.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, Simon Horman <simon.horman@corigine.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 28, 2021 at 09:29:36PM +0200, Uwe Kleine-König wrote:
> On Tue, Sep 28, 2021 at 12:17:59PM -0500, Bjorn Helgaas wrote:
> > [+to Oliver, Russell for eeh_driver_name() question below]
> > 
> > On Mon, Sep 27, 2021 at 10:43:22PM +0200, Uwe Kleine-König wrote:
> > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > 
> > > struct pci_dev::driver holds (apart from a constant offset) the same
> > > data as struct pci_dev::dev->driver. With the goal to remove struct
> > > pci_dev::driver to get rid of data duplication replace getting the
> > > driver name by dev_driver_string() which implicitly makes use of struct
> > > pci_dev::dev->driver.

> > Also, would you mind using "pci_dev.driver" instead of
> > "pci_dev::driver"?  AFAIK, the "::" operator is not actually part of
> > C, so I think it's more confusing than useful.
> 
> pci_dev.driver doesn't work either in C because pci_dev is a type and
> not a variable.

Sure, "pci_dev.driver" is not strictly acceptable C unless you have a
"struct pci_dev pci_dev", but it's pretty common.
