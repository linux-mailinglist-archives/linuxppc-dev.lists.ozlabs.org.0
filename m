Return-Path: <linuxppc-dev+bounces-9607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B5AE2876
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jun 2025 11:59:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPVF269K4z2yF0;
	Sat, 21 Jun 2025 19:59:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.95.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750499974;
	cv=none; b=fK/OHUKrdb9bXhMd58IrXNpjbWfproNaQggTa5wNT1vzbh4PzK/y2xdfBb+CPH7nt+JYWZ5tRSq20afOzmK5o9VLklC2jebj4H0PVnWSEFSeh4SDIvtYYU1AuV3q7gVfY0EaBtFz11n337ioof3H2PloiGekYn0NSV1daUrHo2aYsSI2JlQoJB7+hxXbqvls5RkQADdmkprGfcOn/p1p/0GTmHcOAv54VnCjRmFi6Jzckde4nrpm1KWB8C3XMz9KCDWMfUhOIvGt4TL5GcHzi5JqBY5e6K/wwB+Rhwf3rdnnjj6UZFYHUdr/5mMJPfeIrlTYm8S5S2hQQbHCIhO/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750499974; c=relaxed/relaxed;
	bh=gxpwAa/GGuKe/21Zk9QFASNFUTD4Bv3FfKUryeAZWBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHbBCqvUVZwVLRh5R0eFEaWNCYeYnP/eyqO3f7L9x7JM0QNbch1C+NXSqDnNWwM0oHR0z7F3ZcfbClcKtRPbwmi6FT9M/xJwTah6syibT8Nw/8nzK6chRkpd8mBgDsvDdoWofx1keH4PsMskH/456ey2MqrSzfiEKg5ldEfLw/+kTKC/BR1HIhdRcf7nvqqoBerpjGkL7czvl8JbvgEiE/bTwTaAdxEeud6Q4ZEIJSO0iDVamWGQ76z4OQ5t4XqWXTjvWG368NhaDMgK9JqsUC3a6szfdE3IN74QIFe3DQdzJ2uAhTcwSCJ+S2cke6Md2ilRePtnW7nrpGWCj4OQHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 93986 seconds by postgrey-1.37 at boromir; Sat, 21 Jun 2025 19:59:33 AEST
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bPVF14qtwz2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jun 2025 19:59:31 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 06C922C06849;
	Sat, 21 Jun 2025 11:59:26 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E55963A0E4E; Sat, 21 Jun 2025 11:59:25 +0200 (CEST)
Date: Sat, 21 Jun 2025 11:59:25 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Krishna Kumar <krishnak@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"\"linux-pci\"," <linux-pci@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	"\"Bjorn Helgaas\"," <bhelgaas@google.com>
Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
Message-ID: <aFaCfYre9N52ARWH@wunner.de>
References: <20250618190146.GA1213349@bhelgaas>
 <1469323476.1312174.1750293474949.JavaMail.zimbra@raptorengineeringinc.com>
 <19689b53-ac23-4b48-97c7-b26f360a7b75@linux.ibm.com>
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
In-Reply-To: <19689b53-ac23-4b48-97c7-b26f360a7b75@linux.ibm.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 20, 2025 at 02:56:51PM +0530, Krishna Kumar wrote:
> 5. If point 3 and 4 does not solve the problem, then only we should
> move to pciehp.c. But AFAIK, PPC/Powernv is DT based while pciehp.c
> may be only supporting acpi (I have to check it on this). We need to
> provide PHB related information via DTB and maintain the related
> topology information via dtb and then it can be doable.

pciehp is not ACPI-specific.  The PCIe port service driver in
drivers/pci/pcie/portdrv.c binds to any PCIe port, examines the
port's capabilities (e.g. hotplug, AER, DPC, ...) and instantiates
sub-devices to which pciehp and the other drivers such as aer bind.

How do you prevent pciehp from driving hotplug on PowerNV anyway?
Do you disable CONFIG_HOTPLUG_PCI_PCIE?

Thanks,

Lukas

