Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F593F8BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:52:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXhCX6S5Dz3dSp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:52:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXhC82hMQz3cXM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:51:48 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3FC4D92009C; Mon, 29 Jul 2024 16:51:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 3971892009B;
	Mon, 29 Jul 2024 15:51:37 +0100 (BST)
Date: Mon, 29 Jul 2024 15:51:37 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: PCI: Work around PCIe link training failures
In-Reply-To: <914b7d34-9ed5-cd99-cb76-f6f8eccb842e@linux.intel.com>
Message-ID: <alpine.DEB.2.21.2407291540120.48387@angie.orcam.me.uk>
References: <20240724191830.4807-1-mattc@purestorage.com> <20240726080446.12375-1-mattc@purestorage.com> <914b7d34-9ed5-cd99-cb76-f6f8eccb842e@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, christophe.leroy@csgroup.eu, kuba@kernel.org, pabeni@redhat.com, Jim Wilson <wilson@tuliptree.org>, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, alex.williamson@redhat.com, Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, david.abdurachmanov@gmail.com, Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, Matthew W Carlis <mattc@purestorage.com>, saeedm@nvidia.com, pali@kernel.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Jul 2024, Ilpo Järvinen wrote:

> > > The main reason is it is believed that it is the downstream device
> > > causing the issue, and obviously you can't fetch its ID if you can't
> > > negotiate link so as to talk to it in the first place.
> > 
> > Have had some more time to look into this issue. So, I think the problem
> > with this change is that it is quite strict in its assumptions about what
> > it means when a device fails to train, but in an environment where hot-plug
> > is exercised frequently you are essentially bound have something interrupt
> > the link training. In the first case where we caught this problem our test
> > automation was doing some power cycle tortures on our endpoints. If you catch
> > the right timing the link will be forced down to Gen1 forever without some other
> > automation to recover you unless your device is the one single device in the
> > allowlist which had the hardware bug in the first place.
> > 
> > I wonder if we can come up with some kind of alternative.
> 
> The most obvious solution is to not leave the speed at Gen1 on failure in 
> Target Speed quirk but to restore the original Target Speed value. The 
> downside with that is if the current retraining interface (function) is 
> used, it adds delay. But the retraining functions could be reworked such 
> that the retraining is only triggered in case the Target Speed quirk 
> fails but we don't wait for its result (which will very likely fail 
> anyway).

 This is what I have also been thinking of.

 After these many years it took from the inception of this change until it 
landed upstream I'm not sure anymore what my original idea was behind 
leaving the link clamped on a retrain failure, but I think it was either 
not to fiddle with the setting beyond the absolute necessity at hand 
(which the scenarios such as Matthew's prove wrong) or to leave the 
setting in a hope that training will eventually have succeeded (but it 
seems to make little sense as there'll be nothing there to actually 
observe the success unless the bus gets rescanned for another reason).

 I'll be at my lab towards the end of the week with a maintenance visit, 
so I'll allocate some time to fiddle with this issue on that occasion and 
implement such an update.

  Maciej
