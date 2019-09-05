Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCB9AAB59
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 20:44:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PV3V5NnTzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 04:44:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="Y5HpMYTv"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PV1J3sz1zDr2r
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 04:42:44 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id E21BC7F933;
 Thu,  5 Sep 2019 13:42:10 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1567708931; bh=rxv4QLf9HCtfom1Uhju5LVSvzANgFuLIb2JMOlcou9I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Y5HpMYTvY7D1uU9xy0wS+ulM64Im5+we5EsSRy3YE4PphhLKAXM7V01+gc5421Phc
 Hi/+w/NXCWeCOPDGXb3S/ZcAcYFWc7ZJ27UTOnehNo6fxM9nePzdzcVzxOhNgZYVXC
 B8WlnlkZ0Ajkl2H/eTSMFvpmiShR05wf+rHAxBogSKOAr+C4wOVHPYeBctCn0KYZ5/
 suOXKh0B4jdhfam8RyYfsZF8CpF5gzICeNMgHJywWN1JxoqGpkzqczNcK0HeBTCQm2
 2Lc2W5gkmd5JemKl9sQkcTLmOS78/lRu6rSOY9qsAQYwiNk4/poTvpvIk6Gwfnw+0v
 XRv8FbKEVrXzw==
Subject: Re: [PATCH 0/2] Fix IOMMU setup for hotplugged devices on pseries
To: Lukas Wunner <lukas@wunner.de>
References: <20190905042215.3974-1-shawn@anastas.io>
 <20190905093841.mkpvzkcrafwpo5lj@wunner.de>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <b43dada8-7fc8-2ee1-46da-273c522426a4@anastas.io>
Date: Thu, 5 Sep 2019 13:42:10 -0500
MIME-Version: 1.0
In-Reply-To: <20190905093841.mkpvzkcrafwpo5lj@wunner.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: aik@ozlabs.ru, linux-pci@vger.kernel.org, sbobroff@linux.ibm.com,
 oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/5/19 4:38 AM, Lukas Wunner wrote:
> On Wed, Sep 04, 2019 at 11:22:13PM -0500, Shawn Anastasio wrote:
>> If anybody has more insight or a better way to fix this, please let me know.
> 
> Have you considered moving the invocation of pcibios_setup_device()
> to pcibios_bus_add_device()?
> 
> The latter is called from pci_bus_add_device() in drivers/pci/bus.c.
> At this point device_add() has been called, so the device exists in
> sysfs.
> 
> Basically when adding a PCI device, the order is:
> 
> * pci_device_add() populates struct pci_dev, calls device_add(),
>    binding the device to a driver is prevented
> * after pci_device_add() has been called for all discovered devices,
>    resources are allocated
> * pci_bus_add_device() is called for each device,
>    calls pcibios_bus_add_device() and binds the device to a driver

Thank you, this is exactly what I was looking for! Just tested and
this seems to work perfectly. I'll go ahead and submit a v2 that
does this instead.

Thanks again,
Shawn
