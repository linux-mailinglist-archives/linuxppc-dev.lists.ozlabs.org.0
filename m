Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B3869478E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 14:59:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFmDD1YhLz3cCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 00:59:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=h08.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=<UNKNOWN>)
X-Greylist: delayed 313 seconds by postgrey-1.36 at boromir; Tue, 14 Feb 2023 00:58:51 AEDT
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFmCb5rklz3bXv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 00:58:51 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 019173000794D;
	Mon, 13 Feb 2023 14:53:28 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id D8E261E172; Mon, 13 Feb 2023 14:53:27 +0100 (CET)
Date: Mon, 13 Feb 2023 14:53:27 +0100
From: Lukas Wunner <lukas@wunner.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v6 6/7] PCI: pciehp: Rely on `link_active_reporting'
Message-ID: <20230213135327.GA29595@wunner.de>
References: <alpine.DEB.2.21.2302022022230.45310@angie.orcam.me.uk>
 <alpine.DEB.2.21.2302051459210.33812@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2302051459210.33812@angie.orcam.me.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Oliver O'Halloran <oohall@gmail.com>, Stefan Roese <sr@denx.de>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jim Wilson <wilson@tuliptree.org>, Nicholas Piggin <npiggin@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Abdurachmanov <david.abdurachmanov@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 05, 2023 at 03:49:21PM +0000, Maciej W. Rozycki wrote:
> Use `link_active_reporting' to determine whether Data Link Layer Link 
> Active Reporting is available rather than re-retrieving the capability.
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>

Reviewed-by: Lukas Wunner <lukas@wunner.de>

I believe this should work without the preceding patches in the series,
hence can be applied independently.

Thanks,

Lukas

>  drivers/pci/hotplug/pciehp_hpc.c |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> linux-pcie-link-active-reporting-hpc.diff
> Index: linux-macro/drivers/pci/hotplug/pciehp_hpc.c
> ===================================================================
> --- linux-macro.orig/drivers/pci/hotplug/pciehp_hpc.c
> +++ linux-macro/drivers/pci/hotplug/pciehp_hpc.c
> @@ -984,7 +984,7 @@ static inline int pcie_hotplug_depth(str
>  struct controller *pcie_init(struct pcie_device *dev)
>  {
>  	struct controller *ctrl;
> -	u32 slot_cap, slot_cap2, link_cap;
> +	u32 slot_cap, slot_cap2;
>  	u8 poweron;
>  	struct pci_dev *pdev = dev->port;
>  	struct pci_bus *subordinate = pdev->subordinate;
> @@ -1030,9 +1030,6 @@ struct controller *pcie_init(struct pcie
>  	if (dmi_first_match(inband_presence_disabled_dmi_table))
>  		ctrl->inband_presence_disabled = 1;
>  
> -	/* Check if Data Link Layer Link Active Reporting is implemented */
> -	pcie_capability_read_dword(pdev, PCI_EXP_LNKCAP, &link_cap);
> -
>  	/* Clear all remaining event bits in Slot Status register. */
>  	pcie_capability_write_word(pdev, PCI_EXP_SLTSTA,
>  		PCI_EXP_SLTSTA_ABP | PCI_EXP_SLTSTA_PFD |
> @@ -1051,7 +1048,7 @@ struct controller *pcie_init(struct pcie
>  		FLAG(slot_cap, PCI_EXP_SLTCAP_EIP),
>  		FLAG(slot_cap, PCI_EXP_SLTCAP_NCCS),
>  		FLAG(slot_cap2, PCI_EXP_SLTCAP2_IBPD),
> -		FLAG(link_cap, PCI_EXP_LNKCAP_DLLLARC),
> +		FLAG(pdev->link_active_reporting, true),
>  		pdev->broken_cmd_compl ? " (with Cmd Compl erratum)" : "");
>  
>  	/*
