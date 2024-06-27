Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A491AD9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 19:12:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=bZbZIRvu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W94rF2WnTz3cft
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 03:12:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=bZbZIRvu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W94pw2dY0z3cfB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 03:11:20 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 9A9808284676;
	Thu, 27 Jun 2024 12:11:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8M9sTC8IiM0Q; Thu, 27 Jun 2024 12:11:18 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D1C748287291;
	Thu, 27 Jun 2024 12:11:18 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D1C748287291
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1719508278; bh=w0cEudny5PU8YvBvvlFhixxtK4IKtgz3lssxEp5pCGw=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=bZbZIRvuEntX4eYzCC3cMaso2r9eE/hUjToEQvGXbLDmgNP7Rm8yAZqFYBbUkXuop
	 JG68k6rTbQx7SI0fHE9Al/g4Qb7vdRaAmtzppTw6y2BZvQ9BGbh/LMqPmVmzL0ya4b
	 B3HXKoZR60vOefzlalffebwbI0HgqFinHoiEoHjc=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1p0pndOz2WXs; Thu, 27 Jun 2024 12:11:18 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
	by mail.rptsys.com (Postfix) with ESMTPSA id 3864A8284676;
	Thu, 27 Jun 2024 12:11:18 -0500 (CDT)
Message-ID: <36276ba1-fc2c-418d-a80e-388e1f7988ed@raptorengineering.com>
Date: Thu, 27 Jun 2024 12:11:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] powerpc: hotplug driver bridge support
To: Krishna Kumar <krishnak@linux.ibm.com>, mpe@ellerman.id.au,
 npiggin@gmail.com
References: <20240624121052.233232-1-krishnak@linux.ibm.com>
 <20240624121052.233232-3-krishnak@linux.ibm.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240624121052.233232-3-krishnak@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: nathanl@linux.ibm.com, gbatra@linux.ibm.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, tpearson@raptorengineering.com, oohall@gmail.com, bhelgaas@google.com, mahesh.salgaonkar@in.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Krishna,

On 6/24/24 7:09 AM, Krishna Kumar wrote:
> There is an issue with the hotplug operation when it's done on the
> bridge/switch slot. The bridge-port and devices behind the bridge, which
> become offline by hot-unplug operation, don't get hot-plugged/enabled by
> doing hot-plug operation on that slot. Only the first port of the bridge
> gets enabled and the remaining port/devices remain unplugged. The hot
> plug/unplug operation is done by the hotplug driver
> (drivers/pci/hotplug/pnv_php.c).
> 
> Root Cause Analysis: This behavior is due to missing code for the
> switch/bridge. The existing driver depends on pci_hp_add_devices()
> function for device enablement. This function calls pci_scan_slot() on
> only one device-node/port of the bridge, not on all the siblings'
> device-node/port.
> 
> The missing code needs to be added which will find all the sibling
> device-nodes/bridge-ports and will run explicit pci_scan_slot() on
> those.  A new function has been added for this purpose which gets
> invoked from pci_hp_add_devices(). This new function
> pci_traverse_sibling_nodes_and_scan_slot() gets all the sibling
> bridge-ports by traversal and explicitly invokes pci_scan_slot on them.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Gaurav Batra <gbatra@linux.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Brian King <brking@linux.vnet.ibm.com>
> 
> Signed-off-by: Krishna Kumar <krishnak@linux.ibm.com>

Other than the case with NVMe devices failing that we discussed in v1's
thread, I can confirm that this patch resolves many of the issues we've
encountered with PCIe hotplug on POWER9.

Tested-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn
