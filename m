Return-Path: <linuxppc-dev+bounces-6385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24142A403A7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2025 00:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z06DP42Tpz30VQ;
	Sat, 22 Feb 2025 10:44:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740181477;
	cv=none; b=TxVRq7EZdp65FWDnnCKFo5E0u4c4yQpKilZVVFpdZ9mxSeZ3GPIC1YZCeuEAr3PU3UjSEaQZMgsQONVwCkpznDqFG6m5RZWUbGL4hEvW6mj7SajHGqqQkuRAzMtNHOijl4OsYB9LtEP2i5RV6A7GW7+im/7fjUaqxohhXUE/euTSkmQHsL8W/K1NDblMbT8maMM16AvJbp4FoMrrTa3dNOzL4s2r2qkTwenJhkieQjwXJgu1agabCtdS6yJ8ha9wUmFZgPNKQzZjvY1rLcYn1459zfvNhVFHhaVUqRTtc8NCqIeF/VBAdBjA8gtUkNICkVNwYKraOvXDA+im+2mNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740181477; c=relaxed/relaxed;
	bh=hUqIJBibsmbnPJogcXliLkIeRLRswEhVmHxAsbFNMFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hmcAjEzP5DbPvoq3V9qERAfi1NBcNgCW0iuvtG1OuEyV1LO5BLamRAa/7nyHrN4VLlKZi4HnbnBtCSF/vB+UXf1zJ8kG3VpWYVa5zLEaf+l7Mfl19QY42DR6hUQ5wV4WJ71EgReBsNooNINhGbzo6wS5xye0PU8GPSrBcp3bYJ85aQ81m4z36wPxgSpHaTb9D3r419r9qknzmfSUEJG/G7j2romQSjEIv0fEklIKE+KTfGhSDkc031HIdZOsTKm0NySPRjmMP/f3zznSru3ZMOc+4C1KaTavAXnTAs3kwSDMu9warxE9nWFGZKpqEDkWl+thHuGxjBsWP2pUxy6xpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I9/+cK7b; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I9/+cK7b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 474 seconds by postgrey-1.37 at boromir; Sat, 22 Feb 2025 10:44:36 AEDT
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z06DN3G2dz30CL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2025 10:44:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B3CA6134E;
	Fri, 21 Feb 2025 23:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51352C4CED6;
	Fri, 21 Feb 2025 23:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740180997;
	bh=Fzra3LTozAg1Caf4BQdZdGPzv/rLipAz4636FFpafrU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=I9/+cK7b5Os9EJJvA+A2tT1AI7MEU4cYE2uHhPjbpxsWOSlQTNv7ei/j1775SGlo7
	 ATSaK5KEAOB2X/UFUrMBrRZw/0d73yTA+sAciJ8otQ9st328UxrgVn99TAqt5Mx7cT
	 pQHY5nP52ubmB8bb3AlUUQx1P1tkSk5C1x1JsTI5/ZmZYL7NMq9zW1EDX2PQ5L+PO3
	 ohat8UVjy5+3iKyDcctjf3+3mj49C52dWekRYoV82Jua7pFMxW9BM368BdafOizLSF
	 W3bWwocINj4nXShXAUJC38RGtOzDHGaqveXWXD0aQ16R3vH4njRK0hSU3blbCBKra3
	 wx93WhKB7/a6Q==
Date: Fri, 21 Feb 2025 17:36:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v2 1/2] PCI: Track Flit Mode Status & print it with link
 status
Message-ID: <20250221233635.GA372807@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250221152948.GA926653@yaz-khff2.amd.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 21, 2025 at 10:29:48AM -0500, Yazen Ghannam wrote:
> On Fri, Feb 07, 2025 at 06:18:35PM +0200, Ilpo Järvinen wrote:
> > PCIe r6.0 added Flit mode that mainly alters HW behavior but some OS
> > visible changes are also because of it. The OS visible changes include
> 
> The first sentence reads oddly. Maybe a slight change?
> 
> "...but there are some OS visible changes because of it."

Updated locally.

> > +	if (dev->bus && dev->bus->flit_mode)
> > +		flit_mode = ", in Flit mode";
> > +
> >  	if (bw_avail >= bw_cap && verbose)
> > -		pci_info(dev, "%u.%03u Gb/s available PCIe bandwidth (%s x%d link)\n",
> > +		pci_info(dev, "%u.%03u Gb/s available PCIe bandwidth (%s x%d link)%s\n",
> >  			 bw_cap / 1000, bw_cap % 1000,
> > -			 pci_speed_string(speed_cap), width_cap);
> > +			 pci_speed_string(speed_cap), width_cap, flit_mode);
> >  	else if (bw_avail < bw_cap)
> > -		pci_info(dev, "%u.%03u Gb/s available PCIe bandwidth, limited by %s x%d link at %s (capable of %u.%03u Gb/s with %s x%d link)\n",
> > +		pci_info(dev, "%u.%03u Gb/s available PCIe bandwidth, limited by %s x%d link at %s (capable of %u.%03u Gb/s with %s x%d link)%s\n",
> >  			 bw_avail / 1000, bw_avail % 1000,
> >  			 pci_speed_string(speed), width,
> >  			 limiting_dev ? pci_name(limiting_dev) : "<unknown>",
> >  			 bw_cap / 1000, bw_cap % 1000,
> > -			 pci_speed_string(speed_cap), width_cap);
> > +			 pci_speed_string(speed_cap), width_cap, flit_mode);
> 
> Does the "Flit mode" message *need* to go into these lines? Could it be
> its own message?

I suppose it doesn't need to be there, and these bandwidth lines are
already pretty long (my fault, open to suggestions to shorten them),
but I do think it's useful to have related info all on the same line.

>  +#include <linux/string_choices.h>
> 
>  @@ -6190,21 +6190,25 @@ void __pcie_print_link_status(struct pci_dev *dev, bool verbose)
>   	enum pci_bus_speed speed, speed_cap;
>   	struct pci_dev *limiting_dev = NULL;
>   	u32 bw_avail, bw_cap;
>   
>   	bw_cap = pcie_bandwidth_capable(dev, &speed_cap, &width_cap);
>   	bw_avail = pcie_bandwidth_available(dev, &limiting_dev, &speed, &width);
>   
>  +	if (dev->bus)
>  +		pci_info(dev, "Flit mode: %s\n", str_enabled_disabled(dev->bus->flit_mode);
>  +
>   	if (bw_avail >= bw_cap && verbose)
>  		pci_info(dev, "%u.%03u Gb/s available PCIe bandwidth (%s x%d link)\n",
>   			 bw_cap / 1000, bw_cap % 1000,
>  			 pci_speed_string(speed_cap), width_cap);
>   	else if (bw_avail < bw_cap)
>  		pci_info(dev, "%u.%03u Gb/s available PCIe bandwidth, limited by %s x%d link at %s (capable of %u.%03u Gb/s with %s x%d link)\n",
>   			 bw_avail / 1000, bw_avail % 1000,
>   			 pci_speed_string(speed), width,
>   			 limiting_dev ? pci_name(limiting_dev) : "<unknown>",
>   			 bw_cap / 1000, bw_cap % 1000,
>  			 pci_speed_string(speed_cap), width_cap);
> 
> >  }

