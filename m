Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6756091B5D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 06:48:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D8GdUb3r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9NHY00RYz3cYg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 14:48:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D8GdUb3r;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9NGq2zFbz3cG6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 14:48:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719550082;
	bh=ICrtbbo/Rr3JpMXpVIu+Axfy69UgjoXGiFz4s0/41Qk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D8GdUb3r1uENTAKRfM/6e4uiLkma/tmvuCMcEziFWml1iJ9NSIkF8iODVW/zO+MpZ
	 nHKkdDALkcTi/1cAKbebm9g4wQ3cFqTOlmbVkKFMLVHbvGiWI5LP0Lx+AxBKBFmaiB
	 6+Se2tDamzLCxjRZyi073lfiTZWycz/kK0SGDpuOAlFv4/75LEIpuwt2hE9v99sKVW
	 lwHaFmirr6klc39ufXRUAqlScOe5BAZtDKqA82rbGHcD/fKeAsQMKV3iJoI8SNO7Ty
	 NMgTYbN4J9lnbnTrcrRGgZTpKCAy7v8lVlshvJFZii9f0LyUwX082zCVzAr2/4Y0cS
	 CHqHD8sU9B5YA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W9NGn67r6z4w2N;
	Fri, 28 Jun 2024 14:48:01 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Shawn Anastasio <sanastasio@raptorengineering.com>, Krishna Kumar
 <krishnak@linux.ibm.com>, npiggin@gmail.com
Subject: Re: [PATCH v3 1/2] pci/hotplug/pnv_php: Fix hotplug driver crash on
 Powernv
In-Reply-To: <888d3984-d00e-4148-a1ca-f7887c0af413@raptorengineering.com>
References: <20240624121052.233232-1-krishnak@linux.ibm.com>
 <20240624121052.233232-2-krishnak@linux.ibm.com>
 <888d3984-d00e-4148-a1ca-f7887c0af413@raptorengineering.com>
Date: Fri, 28 Jun 2024 14:48:00 +1000
Message-ID: <87msn5llkv.fsf@mail.lhotse>
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
Cc: nathanl@linux.ibm.com, gbatra@linux.ibm.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, tpearson@raptorengineering.com, oohall@gmail.com, bhelgaas@google.com, mahesh.salgaonkar@in.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Shawn Anastasio <sanastasio@raptorengineering.com> writes:
> Hi Krishna,
>
> On 6/24/24 7:09 AM, Krishna Kumar wrote:
>> Description of the problem: The hotplug driver for powerpc
>> (pci/hotplug/pnv_php.c) gives kernel crash when we try to
>> hot-unplug/disable the PCIe switch/bridge from the PHB.
>> 
>> Root Cause of Crash: The crash is due to the reason that, though the msi
>> data structure has been released during disable/hot-unplug path and it
>> has been assigned with NULL, still during unregistartion the code was
>> again trying to explicitly disable the msi which causes the Null pointer
>> dereference and kernel crash.
>> 
>> Proposed Fix : The fix is to correct the check during unregistration path
>> so that the code should not  try to invoke pci_disable_msi/msix() if its
>> data structure is already freed.
>> 
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
>
> As with v1, I can confirm that this patch solves the panic encountered
> when hotplugging PCIe bridges on POWER9.

Was the panic reported anywhere? So we can link to the report in the
commit.

cheers
