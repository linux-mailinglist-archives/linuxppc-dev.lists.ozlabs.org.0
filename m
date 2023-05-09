Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027C6FCEB5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 21:45:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QG7sm1qvNz3fPW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:45:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UubM7SP5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UubM7SP5;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QG7rs1fM1z3fLn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 05:44:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97FF0615BB;
	Tue,  9 May 2023 19:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F56AC433EF;
	Tue,  9 May 2023 19:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683661448;
	bh=pItE0WInMSDSitpSLtD1IAdtthiJmuw3raHHqTpBuXg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UubM7SP5K0CE7+QtObAtFpZP8w1q41xAejPDg3yxVE52X+RSHb+xZ359xeMPGVRHu
	 BNJQFpqOMvZL8t62NgBLvIWI1LnzsBq7HNx15O94PjsBZM5NJaqPJQP2O76El7Fw9s
	 BMq45FZJJ+WbVzImQVyt+xtZEykDlkBY8jbcwa8w2FB3Z2dQwNQWX3pEu8FWFeZTTp
	 1U5PBJzuNvLK3wSiq9y4djH/EcGd7k3np1pz0b2bUIcmqAaRRRYLYFJRzE37DLHFrD
	 kBPuEtcQjFCIQJBATG990NHm2FJ7l6K8iUkyPpc0Y2JztOnKOSoBvC79DCC9zjjSmZ
	 re3ccb6bwn0IQ==
Date: Tue, 9 May 2023 14:44:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <frank.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 1/1] PCI: layerscape: Add the endpoint
 linkup notifier support
Message-ID: <20230509194406.GA1265845@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB4838C21F4C2F0689B13B05A988719@AM6PR04MB4838.eurprd04.prod.outlook.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Roy Zang <roy.zang@nxp.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Rob Herring <robh@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 08, 2023 at 09:45:59PM +0000, Frank Li wrote:
> > > > Subject: [EXT] Re: [PATCH v2 1/1] PCI: layerscape: Add the endpoint
> > linkup
> > > > notifier support
> > 
> > All these quoted headers are redundant clutter since we've already
> > seen them when Manivannan sent his comments.  It would be nice if your
> > mailer could be configured to omit them.
> 
> Our email client quite stupid. 

Yeah, sometimes those are really hard to work around.

Bjorn
