Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D2491D9B9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 10:11:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EDmpEFyz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCJfZ4YTHz3d4F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 18:11:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EDmpEFyz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishna.kumar11@ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCJdt3D1nz3cNV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 18:11:13 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4617ucU6018969;
	Mon, 1 Jul 2024 08:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	nCQv8/viKXnzHIWRR3w7m2uDPzOmhLiFd/+m7V5VxVE=; b=EDmpEFyzjuXM29op
	Xhsg9nsSWUbVnRXaDnP5Qiv4ZJdYfpycohP/HfSMeJqzew0Xb7CQfOyix0475LcO
	UDmHIKOUDu7lVZdzbaakWf2lfa5hJJaWZPaJhEJqNybhXVkvD6wXuzPQPlBq2NLI
	+VMmRmlAuTtDeV2DKpWbOn1+ETvUc0uBJEA3zzysrHIncOih9RtWSJpaszNxLCdD
	5JVx5xRH9CZ/5654DqFwQpkHkndhjCgYCcV6BrNYvzJWYT52IgKxrBl1znp1An0H
	159AvMqx8l3vejfk0F0rzKY1YgyssueT8jkjsXeZsPABU27hXWM2fvFSCsfG8pdZ
	e9JrLA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403r3u02w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 08:11:02 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4618B1MO009261;
	Mon, 1 Jul 2024 08:11:01 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403r3u02vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 08:11:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46185Ddv026417;
	Mon, 1 Jul 2024 08:11:00 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 402wkpp5bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 08:11:00 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4618AsMV30802434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2024 08:10:57 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF6282004B;
	Mon,  1 Jul 2024 08:10:54 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 968442004D;
	Mon,  1 Jul 2024 08:10:51 +0000 (GMT)
Received: from [9.109.241.85] (unknown [9.109.241.85])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jul 2024 08:10:51 +0000 (GMT)
Message-ID: <c17fa094-f337-4422-8ae0-d554d66dd92a@ibm.com>
Date: Mon, 1 Jul 2024 13:40:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] pci/hotplug/pnv_php: Fix hotplug driver crash on
 Powernv
To: Krishna Kumar <krishnak@linux.ibm.com>, mpe@ellerman.id.au,
        npiggin@gmail.com
References: <20240701074513.94873-1-krishnak@linux.ibm.com>
 <20240701074513.94873-2-krishnak@linux.ibm.com>
Content-Language: en-US
From: Krishna Kumar <krishna.kumar11@ibm.com>
In-Reply-To: <20240701074513.94873-2-krishnak@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uGtoPARkEk5c4KUJx69RJXApADgzx_sF
X-Proofpoint-ORIG-GUID: pmjukpBmqWJ1wsAj0Hj6FZSeQcph6LQ5
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_06,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 suspectscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407010060
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
Cc: nathanl@linux.ibm.com, gbatra@linux.ibm.com, linux-pci@vger.kernel.org, Shawn Anastasio <sanastasio@raptorengineering.com>, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, tpearson@raptorengineering.com, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

When you apply/merge the patch, please consider below URL in commit message.
This is the URL where this issue was reported - 

https://lists.ozlabs.org/pipermail/linuxppc-dev/2023-December/267034.html

Thanks, 
Krishna


On 7/1/24 1:15 PM, Krishna Kumar wrote:
> Description of the problem: The hotplug driver for powerpc
> (pci/hotplug/pnv_php.c) gives kernel crash when we try to
> hot-unplug/disable the PCIe switch/bridge from the PHB.
>
> Root Cause of Crash: The crash is due to the reason that, though the msi
> data structure has been released during disable/hot-unplug path and it
> has been assigned with NULL, still during unregistration the code was
> again trying to explicitly disable the MSI which causes the NULL pointer
> dereference and kernel crash.
>
> The patch fixes the check during unregistration path to prevent invoking
> pci_disable_msi/msix() since its data structure is already freed.
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
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Krishna Kumar <krishnak@linux.ibm.com>
> ---
>  drivers/pci/hotplug/pnv_php.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index 694349be9d0a..573a41869c15 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -40,7 +40,6 @@ static void pnv_php_disable_irq(struct pnv_php_slot *php_slot,
>  				bool disable_device)
>  {
>  	struct pci_dev *pdev = php_slot->pdev;
> -	int irq = php_slot->irq;
>  	u16 ctrl;
>  
>  	if (php_slot->irq > 0) {
> @@ -59,7 +58,7 @@ static void pnv_php_disable_irq(struct pnv_php_slot *php_slot,
>  		php_slot->wq = NULL;
>  	}
>  
> -	if (disable_device || irq > 0) {
> +	if (disable_device) {
>  		if (pdev->msix_enabled)
>  			pci_disable_msix(pdev);
>  		else if (pdev->msi_enabled)
