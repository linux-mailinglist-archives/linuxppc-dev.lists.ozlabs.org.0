Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7E02DAC9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 13:04:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwH4C6XRnzDqQs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 23:04:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Facu5ci7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFZS01cTzDqNQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:56:57 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BFAX8R2021990; Tue, 15 Dec 2020 05:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Qb0rZ1dVPtQFGzSjliyhSM8lSw3Zwf5Vb1nHA2IeKME=;
 b=Facu5ci7ViQYG/8M5n7WLXp9ObWoUKCXlEqhGGcy6QLQi+KlkfVmq/7C71Dr7ZLB8nwJ
 gACsy/qRKKnErwuHnNGSwTq64IfOjlVruCrXVwfVnMQCxi01GcXCW8L215jXNGQwEN2L
 y1ysY+dmtIoWY7+cpLKkn2t38OC2QfbDmiXBzD94ZmjPWuHNAZAzCcKfCJ5ppl6mhyGx
 LnmDdISaopu8JYXzs0PwMmbCzmGAm0Jl+30cZLH4Y+QkwrtS4d0wt4jmmXcWA2Vtyq8u
 ZwqB9ipB3XrcKorpbyP7bq+lZ+rUKhftB6GHXpAmzBV3fJnw/Pq9tTsn9VmEM8zdbl52 rA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35epsw94n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 05:56:44 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BFAm2f9011723;
 Tue, 15 Dec 2020 10:56:43 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 35cng8y107-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 10:56:43 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BFAugfP23593242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Dec 2020 10:56:42 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62EECC605A;
 Tue, 15 Dec 2020 10:56:42 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40899C605D;
 Tue, 15 Dec 2020 10:56:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.204.57])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Dec 2020 10:56:40 +0000 (GMT)
Message-ID: <facf50fec946b5ee85f8151c4e539acf60cc149e.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/vas: Fix IRQ name allocation
From: Haren Myneni <haren@linux.ibm.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Date: Tue, 15 Dec 2020 02:56:38 -0800
In-Reply-To: <20201212142707.2102141-1-clg@kaod.org>
References: <20201212142707.2102141-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-15_08:2020-12-14,
 2020-12-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 phishscore=0 clxscore=1011 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150070
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
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-12-12 at 15:27 +0100, Cédric Le Goater wrote:
> The VAS device allocates a generic interrupt to handle page faults
> but
> the IRQ name doesn't show under /proc. This is because it's on
> stack. Allocate the name.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Thanks for fixing.

Acked-by: Haren Myneni <haren@linux.ibm.com>

> ---
> 
>  I didn't understand this part in init_vas_instance() :
> 
> 	if (vinst->virq) {
> 		rc = vas_irq_fault_window_setup(vinst);
> 		/*
> 		 * Fault window is used only for user space send
> windows.
> 		 * So if vinst->virq is NULL, tx_win_open returns
> -ENODEV
> 		 * for user space.
> 		 */
> 		if (rc)
> 			vinst->virq = 0;
> 	}
> 
>  If the IRQ cannot be requested, the device probing should fail but
>  it's not today. The use of 'vinst->virq' is suspicious.

VAS raises an interrupt only when NX sees fault on request buffers and
faults can happen only for user space requests. So Fault window setup
is needed for user space requests. For kernel requests, continue even
if IRQ / fault_window_setup is failed. 

When window open request is issued from user space, kernel returns
-ENODEV if vinst->virq = 0 (means fault window setup is failed). 


> 
>  arch/powerpc/platforms/powernv/vas.h |  1 +
>  arch/powerpc/platforms/powernv/vas.c | 11 ++++++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/vas.h
> b/arch/powerpc/platforms/powernv/vas.h
> index 70f793e8f6cc..c7db3190baca 100644
> --- a/arch/powerpc/platforms/powernv/vas.h
> +++ b/arch/powerpc/platforms/powernv/vas.h
> @@ -340,6 +340,7 @@ struct vas_instance {
>  	struct vas_window *rxwin[VAS_COP_TYPE_MAX];
>  	struct vas_window *windows[VAS_WINDOWS_PER_CHIP];
>  
> +	char *name;
>  	char *dbgname;
>  	struct dentry *dbgdir;
>  };
> diff --git a/arch/powerpc/platforms/powernv/vas.c
> b/arch/powerpc/platforms/powernv/vas.c
> index 598e4cd563fb..b65256a63e87 100644
> --- a/arch/powerpc/platforms/powernv/vas.c
> +++ b/arch/powerpc/platforms/powernv/vas.c
> @@ -28,12 +28,10 @@ static DEFINE_PER_CPU(int, cpu_vas_id);
>  
>  static int vas_irq_fault_window_setup(struct vas_instance *vinst)
>  {
> -	char devname[64];
>  	int rc = 0;
>  
> -	snprintf(devname, sizeof(devname), "vas-%d", vinst->vas_id);
>  	rc = request_threaded_irq(vinst->virq, vas_fault_handler,
> -				vas_fault_thread_fn, 0, devname,
> vinst);
> +				vas_fault_thread_fn, 0, vinst->name,
> vinst);
>  
>  	if (rc) {
>  		pr_err("VAS[%d]: Request IRQ(%d) failed with %d\n",
> @@ -80,6 +78,12 @@ static int init_vas_instance(struct
> platform_device *pdev)
>  	if (!vinst)
>  		return -ENOMEM;
>  
> +	vinst->name = kasprintf(GFP_KERNEL, "vas-%d", vasid);
> +	if (!vinst->name) {
> +		kfree(vinst);
> +		return -ENOMEM;
> +	}
> +
>  	INIT_LIST_HEAD(&vinst->node);
>  	ida_init(&vinst->ida);
>  	mutex_init(&vinst->mutex);
> @@ -162,6 +166,7 @@ static int init_vas_instance(struct
> platform_device *pdev)
>  	return 0;
>  
>  free_vinst:
> +	kfree(vinst->name);
>  	kfree(vinst);
>  	return -ENODEV;
>  

