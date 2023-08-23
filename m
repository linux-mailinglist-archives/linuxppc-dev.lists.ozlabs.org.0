Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17524785D08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:12:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A7TFU5kw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWB8072JVz3cCK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:12:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A7TFU5kw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=lpieralisi@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWB783wS0z2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:12:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 463B563ED6;
	Wed, 23 Aug 2023 16:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04537C433C8;
	Wed, 23 Aug 2023 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807120;
	bh=pNHMDSofAvP8QX/d2Msi3h2uJ91bbmjTCRWGWU/RVIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A7TFU5kwyCBeCDZIsZVe2kTo4ubtSfffDk1Gy2QGeC8f3zJuI+Jg1rdeWOBjledj6
	 9lXcoK47lDbiRx/0n/lwu7/065jhnCVkVymkJHRVK7FJkvPcsYxgURmJPmUtZxLvT7
	 tjgTLbPelxBGZfPGI9uMhBiDdaVtvH6ruxbFB28vLCsPbrhdt7AmgbFpDTw0leLDMI
	 pm1cKYnzISHsfFrU09v/nu8QIWekX5ODFbwCilNjrQYI3qh6Tl2KoaSBIoB7pyG+rV
	 aseiaHA0pj0mOWPu2cDuYAGPn+eEScHvUyzYdhUOhDQ4nc0LIUXysvE0dySMtop8w0
	 qrvWeYRIkNesg==
Date: Wed, 23 Aug 2023 18:11:53 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v4 1/2] PCI: layerscape: Add support for Link down
 notification
Message-ID: <ZOYvyUgC1o2lWAzE@lpieralisi>
References: <20230720135834.1977616-1-Frank.Li@nxp.com>
 <ZMfN9w6ixBFBmof7@lizhi-Precision-Tower-5810>
 <ZNzw7MPF00t3i3bn@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNzw7MPF00t3i3bn@lizhi-Precision-Tower-5810>
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
Cc: imx@lists.linux.dev, xiaowei.bao@nxp.com, kw@linux.com, linux-pci@vger.kernel.org, Zhiqiang.Hou@nxp.com, mani@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, markus.elfring@web.de, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 16, 2023 at 11:53:16AM -0400, Frank Li wrote:
> On Mon, Jul 31, 2023 at 11:06:31AM -0400, Frank Li wrote:
> > On Thu, Jul 20, 2023 at 09:58:33AM -0400, Frank Li wrote:
> > > Add support to pass Link down notification to Endpoint function driver
> > > so that the LINK_DOWN event can be processed by the function.
> > > 
> > > Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > 
> > @Lorenzo
> > 
> > Could you please consider pick both patches?
> > Manivannan already reviewed and only impact layerscape.
> 
> @lorenzo:
> 	ping

I will have a look tomorrow.

Lorenzo

> > 
> > Frank
> > 
> > > Change from v2 to v4
> > >  - none
> > > Change from v1 to v2
> > > 
> > >  drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > index de4c1758a6c3..e0969ff2ddf7 100644
> > > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > @@ -89,6 +89,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
> > >  		dev_dbg(pci->dev, "Link up\n");
> > >  	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
> > >  		dev_dbg(pci->dev, "Link down\n");
> > > +		pci_epc_linkdown(pci->ep.epc);
> > >  	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
> > >  		dev_dbg(pci->dev, "Hot reset\n");
> > >  	}
> > > -- 
> > > 2.34.1
> > > 
