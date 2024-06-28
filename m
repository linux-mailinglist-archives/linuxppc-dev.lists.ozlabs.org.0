Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 472DC91B628
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 07:35:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TwzTH6mf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9PKM5hksz3cSX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 15:35:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TwzTH6mf;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9PJg20NZz30WP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 15:34:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719552878;
	bh=V4tEOQ9UGeIQAjhJ/FQpHexugT3Fmzlf9p6/vfCvUD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TwzTH6mfqpKiM1bOviw8zRJTdZB++J8GHaNmHXyFy3VEq+bf+AoMBXmU8HQ4892hj
	 Ny2e84gcWtweIRFQ1Zw2LI5LnFubWaLq5qKkRDskMZoc0/yJfndG0/yB0Bns5I+Ou0
	 letwP18U4KkhuOzO3dMU/B07Huqgcm6ztkKRWa1NXcmZpf37u9Hm6wMAlFN19afbtf
	 ieIb46kvzG0O9b9WiVBGzIXGQwbRdXtO3RFE9QSbHHjJCeATKvOvVZkKKJFz9ejz6H
	 guoWXUbWm3oZiACaX9m2Ohi0+itg5hvdluC4MyVSfWyeZfV40yw02H9vZGdX/BGBWY
	 bPiCZZYBBi7AQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W9PJZ2TWqz4w2N;
	Fri, 28 Jun 2024 15:34:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bjorn Helgaas <helgaas@kernel.org>, Krishna Kumar <krishnak@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] pci/hotplug/pnv_php: Fix hotplug driver crash on
 Powernv
In-Reply-To: <20240626152154.GA1467164@bhelgaas>
References: <20240626152154.GA1467164@bhelgaas>
Date: Fri, 28 Jun 2024 15:34:37 +1000
Message-ID: <87jzi9ljf6.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nathanl@linux.ibm.com, aneesh.kumar@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, gbatra@linux.ibm.com, bhelgaas@google.com, tpearson@raptorengineering.com, oohall@gmail.com, christophe.leroy@csgroup.eu, brking@linux.vnet.ibm.com, mahesh.salgaonkar@in.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bjorn Helgaas <helgaas@kernel.org> writes:
> I expect this series would go through the powerpc tree since that's
> where most of the chance is.

Thanks, yeah I'll plan to merge v4 with your comments addressed.

cheers

> On Mon, Jun 24, 2024 at 05:39:27PM +0530, Krishna Kumar wrote:
>> Description of the problem: The hotplug driver for powerpc
>> (pci/hotplug/pnv_php.c) gives kernel crash when we try to
>> hot-unplug/disable the PCIe switch/bridge from the PHB.
>> 
>> Root Cause of Crash: The crash is due to the reason that, though the msi
>> data structure has been released during disable/hot-unplug path and it
>> has been assigned with NULL, still during unregistartion the code was
>> again trying to explicitly disable the msi which causes the Null pointer
>> dereference and kernel crash.
>
> s/unregistartion/unregistration/
> s/Null/NULL/ to match previous use
> s/msi/MSI/ to match spec usage
>
>> Proposed Fix : The fix is to correct the check during unregistration path
>> so that the code should not  try to invoke pci_disable_msi/msix() if its
>> data structure is already freed.
>
> s/Proposed Fix : The fix is to// ... Just say what the patch does.
>
> If/when the powerpc folks like this, add my:
>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: Gaurav Batra <gbatra@linux.ibm.com>
>> Cc: Nathan Lynch <nathanl@linux.ibm.com>
>> Cc: Brian King <brking@linux.vnet.ibm.com>
>> 
>> Signed-off-by: Krishna Kumar <krishnak@linux.ibm.com>
>> ---
>>  drivers/pci/hotplug/pnv_php.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
>> index 694349be9d0a..573a41869c15 100644
>> --- a/drivers/pci/hotplug/pnv_php.c
>> +++ b/drivers/pci/hotplug/pnv_php.c
>> @@ -40,7 +40,6 @@ static void pnv_php_disable_irq(struct pnv_php_slot *php_slot,
>>  				bool disable_device)
>>  {
>>  	struct pci_dev *pdev = php_slot->pdev;
>> -	int irq = php_slot->irq;
>>  	u16 ctrl;
>>  
>>  	if (php_slot->irq > 0) {
>> @@ -59,7 +58,7 @@ static void pnv_php_disable_irq(struct pnv_php_slot *php_slot,
>>  		php_slot->wq = NULL;
>>  	}
>>  
>> -	if (disable_device || irq > 0) {
>> +	if (disable_device) {
>>  		if (pdev->msix_enabled)
>>  			pci_disable_msix(pdev);
>>  		else if (pdev->msi_enabled)
>> -- 
>> 2.45.0
>> 
