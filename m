Return-Path: <linuxppc-dev+bounces-8962-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C982AC6238
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 08:44:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6g3S5nLWz2xHT;
	Wed, 28 May 2025 16:44:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:150:2161:1:b009:f23e:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748414692;
	cv=none; b=nZq0yRaxRc0Gj2ApYOQXHZzrDeEPyE3j1kdx1eCcyCpF6sT5r7IsaQjWSq6dH34fgm9Kh+MUVRy5iLSdarRx8i3BTXDjA7/G6pT1E6soYqZNZAnhv7qFd/sP8gWIbzjk/n5iOUXsE4TmQethvEhBtBu6Au3OVZPtF67AkvMsu4R2uXy1+rqUz2vZJL0vGJReNp5Y5J7NlNacr5KHrf1hBDgi0kECu4Qy2hNo1v+A8hL2WIzmdDOhLYVLOq5dlbd2dnqMtttRDyb9hsUmIBvfcPi4NndyyCQRXBiff6qzfNmy5F76AYr9/pfhRu2bD0Dd07rWuNpqRnAd5hVZpUY/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748414692; c=relaxed/relaxed;
	bh=+LpbCzVDV/6N/5wpLgx4cNGbaE/jYucytTebCP0K3tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6D8VLZld7DzbcvB956xRtmmh5ASh8Lrw+skxO2VmFafXo3f7aYVXMdXIgAcKrHsz0FsDDrSQEDOnJtzFGBIyspzgJyN8sTCEeV5YxAX2O2GrAkqLFwCKyShnE6sk/IgzBDK2MOKsgWELbuCnUzZ8MJSyV2Pdu7g2kOVjDwm4Khg/3SmBwP7massq0ZpXYJXEeq94fODKpw/EaF0HGlEvVrFd/II9tlEefppizJ5G4ZDoJpQczwCvjVSO1JuskeZVf03kAegrkmanJ9Cbwbt5xwYZMK27eHEUX7wSz/dTSgETapGqcj+fGuGiEKic3dxD6Go341sWjXP17WLIQ9WVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:4f8:150:2161:1:b009:f23e:0; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=2a01:4f8:150:2161:1:b009:f23e:0; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 350 seconds by postgrey-1.37 at boromir; Wed, 28 May 2025 16:44:50 AEST
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6g3Q5Ttxz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 16:44:50 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 7F9772C0AD18;
	Wed, 28 May 2025 08:38:51 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3F699176016; Wed, 28 May 2025 08:38:51 +0200 (CEST)
Date: Wed, 28 May 2025 08:38:51 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v8 13/20] PCI/ERR: Add printk level to
 pcie_print_tlp_log()
Message-ID: <aDave5XyXZoKWole@wunner.de>
References: <20250522232339.1525671-1-helgaas@kernel.org>
 <20250522232339.1525671-14-helgaas@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522232339.1525671-14-helgaas@kernel.org>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 22, 2025 at 06:21:19PM -0500, Bjorn Helgaas wrote:
> @@ -130,6 +132,6 @@ void pcie_print_tlp_log(const struct pci_dev *dev,
>  		}
>  	}
>  
> -	pci_err(dev, "%sTLP Header%s: %s\n", pfx,
> +	dev_printk(level, &dev->dev, "%sTLP Header%s: %s\n", pfx,
>  		log->flit ? " (Flit)" : "", buf);
>  }

Nit: pci_printk() ?

The definition in include/linux/pci.h was retained by fab874e12593.

