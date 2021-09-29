Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3E241BFEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 09:30:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK7Lx4XTqz3069
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 17:30:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pcW/IPZn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pcW/IPZn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK7L91d1Dz2xX2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 17:29:36 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T7BvRT006578
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 03:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=p98J6v1/iGtybQON7YNyczgL6pW93NCwoBINJL3uDnc=;
 b=pcW/IPZnBLZ1xmInvb4NXkY+Pvtt8CZFp5aFiu14/yjy/B8nabKLfC6Pea8GfBTBTI11
 Zgr3ebF42Oc/dNfqJBstI0mB1XAQeNiocnJqoxaMnqJR5M1wmW+1RBk/Q2+13AR2keqO
 WuQBkV835+QoWox9Qkt+bnh3teb9+ZXSvYyaEDdlm/jjyw6bIYmjayN6mnOv+d4zhhWO
 5r+4Hl44VDMlNMuUHawf238lNLMT+6vorXNVME3zrgCMuDauRPb4EZnnmF05C69jjFpb
 F4AhEkKR4B9fGO1t6DlTdUoOb24ER8aaToBkZ2hwANQhcRaA9hCajgIiZkn9+HZB6RyJ Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bckhp8b1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 03:29:33 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18T7Q9kj025350
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 03:29:32 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bckhp8b1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 03:29:32 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18T7BwP4015396;
 Wed, 29 Sep 2021 07:29:31 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3b9uda2yma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 07:29:30 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18T7OPSu56688980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Sep 2021 07:24:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15761A4040;
 Wed, 29 Sep 2021 07:29:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE550A405D;
 Wed, 29 Sep 2021 07:29:26 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 29 Sep 2021 07:29:26 +0000 (GMT)
Date: Wed, 29 Sep 2021 12:59:25 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc: fix unbalanced node refcount in check_kvm_guest()
Message-ID: <20210929072925.GE2004@linux.vnet.ibm.com>
References: <20210928124550.132020-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210928124550.132020-1-nathanl@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u7BLEXpIYPtYPIuMeXyank40Bv9K_Rkh
X-Proofpoint-GUID: 3Bs-_BfNjy3dHEKIxFATATsSAaeAX81a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_02,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290041
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nathan Lynch <nathanl@linux.ibm.com> [2021-09-28 07:45:50]:

> When check_kvm_guest() succeeds in looking up a /hypervisor OF node, it
> returns without performing a matching put for the lookup, leaving the
> node's reference count elevated.
> 
> Add the necessary call to of_node_put(), rearranging the code slightly to
> avoid repetition or goto.
> 

Looks good to me.

I do see few other cases where we call of_find_node calls without
of_node_put().

Some of them that I saw were in

find_legacy_serial_ports()  in  arch/powerpc/kernel/legacy_serial.c
proc_ppc64_create in arch/powerpc/proc/powerpc.c
update_events_in_group in arch/powerpc/perf/imc-pmu.c
cell_iommu_init_disabled in arch/powerpc/platforms/cell/iommu.c
cell_publish_devices in arch/powerpc/platforms/cell/setup.c
spufs_init_isolated_loader in arch/powerpc/platforms/cell/spufs/inode.c
holly_init_pci / holly_restart and holly_init_IRQ in arch/powerpc/platforms/embedded6xx/holly.c

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: 107c55005fbd ("powerpc/pseries: Add KVM guest doorbell restrictions")
> ---
>  arch/powerpc/kernel/firmware.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/firmware.c b/arch/powerpc/kernel/firmware.c
> index c7022c41cc31..20328f72f9f2 100644
> --- a/arch/powerpc/kernel/firmware.c
> +++ b/arch/powerpc/kernel/firmware.c
> @@ -31,11 +31,10 @@ int __init check_kvm_guest(void)
>  	if (!hyper_node)
>  		return 0;
> 
> -	if (!of_device_is_compatible(hyper_node, "linux,kvm"))
> -		return 0;
> -
> -	static_branch_enable(&kvm_guest);
> +	if (of_device_is_compatible(hyper_node, "linux,kvm"))
> +		static_branch_enable(&kvm_guest);
> 
> +	of_node_put(hyper_node);
>  	return 0;
>  }
>  core_initcall(check_kvm_guest); // before kvm_guest_init()
> -- 
> 2.31.1
> 

-- 
Thanks and Regards
Srikar Dronamraju
