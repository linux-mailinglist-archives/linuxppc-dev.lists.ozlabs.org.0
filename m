Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF83991ADAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 19:13:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=UyJF5CEt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W94sT0yhSz3d94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 03:13:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=UyJF5CEt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W94rm4fbzz3cVy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 03:12:56 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 3899C82871B7;
	Thu, 27 Jun 2024 12:04:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Z0AZFKoChWpd; Thu, 27 Jun 2024 12:04:04 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 759F482871F3;
	Thu, 27 Jun 2024 12:04:04 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 759F482871F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1719507844; bh=lxG8sC0/ltpBtPDS3WyH/p3fZxyBFAQa4wHnHvd9qOQ=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=UyJF5CEtwodZS0AOmdl/Xe0uxiSxyqQJHRJ5WHGh794xkqqwdOw0GKBPwrDxZ+8eX
	 3yO3V2HpVP1xLj4cvvlxmVk0QV3aTYmnq//UqGpCtjyKTkNfTIf2fiJFfd+rdW80Yq
	 bI9E/iHQvuaAvotGXRWxmvkZBEDw24oMyhr/h8VU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nqNGWJcLLn22; Thu, 27 Jun 2024 12:04:04 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
	by mail.rptsys.com (Postfix) with ESMTPSA id C6C9682871B7;
	Thu, 27 Jun 2024 12:04:03 -0500 (CDT)
Message-ID: <4826c905-720d-43bf-98a8-c4be076a3ebe@raptorengineering.com>
Date: Thu, 27 Jun 2024 12:04:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pci/hotplug/pnv_php: Fix hotplug driver crash on
 Powernv
To: Krishna Kumar <krishnak@linux.ibm.com>, mpe@ellerman.id.au,
 npiggin@gmail.com
References: <20240509120644.653577-1-krishnak@linux.ibm.com>
 <20240509120644.653577-2-krishnak@linux.ibm.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240509120644.653577-2-krishnak@linux.ibm.com>
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
Cc: nathanl@linux.ibm.com, gbatra@linux.ibm.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, tpearson@raptorengineering.com, oohall@gmail.com, bhelgaas@google.com, mahesh.salgaonkar@in.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Krishna,

On 5/9/24 7:05 AM, Krishna Kumar wrote:
> Description of the problem: The hotplug driver for powerpc
> (pci/hotplug/pnv_php.c) gives kernel crash when we try to
> hot-unplug/disable the PCIe switch/bridge from the PHB.
> 
> 
> Root Cause of Crash: The crash is due to the reason that, though the msi
> data structure has been released during disable/hot-unplug path and it
> has been assigned with NULL, still during unregistartion the code was
> again trying to explicitly disable the msi which causes the Null pointer
> dereference and kernel crash.
> 
> 
> Proposed Fix : The fix is to correct the check during unregistration path
> so that the code should not  try to invoke pci_disable_msi/msix() if its
> data structure is already freed.
> 
> 
> Signed-off-by: Krishna Kumar <krishnak@linux.ibm.com>

I've tested this on a POWER9 box and can confirm that it fixes the panics
when hotplugging PCIe bridges.

Tested-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn
