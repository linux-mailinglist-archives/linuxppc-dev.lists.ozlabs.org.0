Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC29701F9C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 May 2023 22:55:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKFBB0JNfz3fJW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 06:54:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=2001:4190:8020::34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=<UNKNOWN>)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKF9d4BY0z3bhL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 06:54:29 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2215892009C; Sun, 14 May 2023 22:54:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1361D92009B;
	Sun, 14 May 2023 21:54:11 +0100 (BST)
Date: Sun, 14 May 2023 21:54:10 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v8 7/7] PCI: Work around PCIe link training failures
In-Reply-To: <alpine.DEB.2.21.2305071922310.54316@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2305142145320.11892@angie.orcam.me.uk>
References: <20230504222048.GA887151@bhelgaas> <alpine.DEB.2.21.2305071922310.54316@angie.orcam.me.uk>
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

On Sun, 7 May 2023, Maciej W. Rozycki wrote:

> > We're going to land this series this cycle, come hell or high water.
> 
>  Thank you for coming back to me and for your promise.  I'll strive to 
> address your concerns next weekend.
> 
>  Unfortunately a PDU in my remote lab has botched up and I've lost control
> over it (thankfully not one for the RISC-V machine affected by the patch 
> series, so I can still manage it for reboots, etc., but the botched PDU is 
> actually upstream), so depending on how situation develops I may have to 
> book air travel instead and spend the whole weekend getting things back to 
> normal operation at my lab.  That unit was not supposed to fail, not in 
> such a silly way anyway, sigh...

 Last Thu the situation with the PDU became critical, so I spent a better 
part of yesterday and today travelling and then all night long getting 
things sorted.  So it'll have to be next weekend when I get back to these 
patches.  I hope we can still make it regardless.

  Maciej
