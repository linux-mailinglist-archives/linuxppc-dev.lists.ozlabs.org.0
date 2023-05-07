Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A83F6F9AE7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 May 2023 20:33:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QDtNg0M6sz3chl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 04:33:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=2001:4190:8020::34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=<UNKNOWN>)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QDtN7311cz3bTJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 04:33:25 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id A527C92009C; Sun,  7 May 2023 20:33:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 96E4F92009B;
	Sun,  7 May 2023 19:33:16 +0100 (BST)
Date: Sun, 7 May 2023 19:33:16 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v8 7/7] PCI: Work around PCIe link training failures
In-Reply-To: <20230504222048.GA887151@bhelgaas>
Message-ID: <alpine.DEB.2.21.2305071922310.54316@angie.orcam.me.uk>
References: <20230504222048.GA887151@bhelgaas>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Oliver O'Halloran <oohall@gmail.com>, Stefan Roese <sr@denx.de>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jim Wilson <wilson@tuliptree.org>, Nicholas Piggin <npiggin@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Abdurachmanov <david.abdurachmanov@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Lukas Wunner <lukas@wunner.de>, netdev@vger.kernel.org, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 May 2023, Bjorn Helgaas wrote:

> On Thu, Apr 06, 2023 at 01:21:31AM +0100, Maciej W. Rozycki wrote:
> > Attempt to handle cases such as with a downstream port of the ASMedia 
> > ASM2824 PCIe switch where link training never completes and the link 
> > continues switching between speeds indefinitely with the data link layer 
> > never reaching the active state.
> 
> We're going to land this series this cycle, come hell or high water.

 Thank you for coming back to me and for your promise.  I'll strive to 
address your concerns next weekend.

 Unfortunately a PDU in my remote lab has botched up and I've lost control
over it (thankfully not one for the RISC-V machine affected by the patch 
series, so I can still manage it for reboots, etc., but the botched PDU is 
actually upstream), so depending on how situation develops I may have to 
book air travel instead and spend the whole weekend getting things back to 
normal operation at my lab.  That unit was not supposed to fail, not in 
such a silly way anyway, sigh...

  Maciej
