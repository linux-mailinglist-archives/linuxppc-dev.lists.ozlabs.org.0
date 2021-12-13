Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CDA47204B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 06:15:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC8pP6r7gz2yp6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 16:15:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pcDQjwCH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=vkoul@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pcDQjwCH; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JC8nl4wVRz2yn2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 16:14:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3B0C9CE0DAF;
 Mon, 13 Dec 2021 05:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F64C00446;
 Mon, 13 Dec 2021 05:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639372469;
 bh=m+MbzkCsPCJNXsBFySexaUdkbI+fIAKWZPiq+A6GBck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pcDQjwCHOz6BSONU5joUW6e60Mu1jAbxQzts0EfFaFm5JmSfwPYHyrXe+as4aLjeM
 eFJH1OLum6J0MwbxxotL5Ynx/Wl9FSzFLuVcZ/MiaFGyolmZeXYP0aRrzCZjW5ZdJq
 Yt5fu6OtnruTRf7YSvoSO+XnwngnSyHnpkVidlaQ4C6iMZ9tlspBmToBaYm7+u5kTp
 56ZJujbc1BVH7oROt6l/x3asZi1J9mKWjGd5xEZzFFEQ0GglJh+ze5/cFl0ltz5OnT
 HkJi0GnpAKgWw3QDQFyUKxAUiibgYJ1iBPJwPobSVKG5xk0d9X3x2zWgArHsKu4K1+
 TCjLAS6Yk203w==
Date: Mon, 13 Dec 2021 10:44:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 29/35] dmaengine: mv_xor_v2: Get rid of msi_desc abuse
Message-ID: <YbbWsUO6o5ccU5ai@matsya>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.970099984@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221814.970099984@linutronix.de>
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
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, Will Deacon <will@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10-12-21, 23:19, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Storing a pointer to the MSI descriptor just to keep track of the Linux
> interrupt number is daft. Use msi_get_virq() instead.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
