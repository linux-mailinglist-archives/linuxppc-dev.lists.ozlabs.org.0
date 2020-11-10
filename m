Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A05D2AD854
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 15:11:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVqXm1wJzzDqfs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 01:11:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NQK4zgu0; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVqVG1cl2zDqNw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 01:09:09 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AAE5lCH037405; Tue, 10 Nov 2020 09:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=OA11YaXazznN/AgHrH6Sxgb05nHOV5VokJrQ4np7Y+A=;
 b=NQK4zgu0kYEhZdsDuH1nOzbOYVFngShNgjjaoDR1U/186eDHafYVxyRyi1/fGYxv0GIK
 YkV+yAvZ6X+RWkjlkFdfX9E+MXDsFMWXu22xvb+PXncNnslORm1DxqfdRlPXB6Yzh8Mv
 Wue0qUvG0YHvkjpXYz3uGXkQnqSA7YSmEr+9EiuAOXglFyXzuDGWZC6HUKSc5bdw3vOG
 KPl8xLatfXdXjfUK9Fpw+nJ0Tdvz0LQ8T2MBP4mAiyepGdFHsaHqUGqE3ebiprrl8beT
 FLopmxv2ssh9cjDgD38Pu0NQy7wJGUhCvHQ3kIPV0U1KaUbawDdYeqsxHU9k7qgAHHlB Jw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34qdkhhb5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 09:08:48 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AAE83Ya009577;
 Tue, 10 Nov 2020 14:08:47 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 34nk7a7mr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 14:08:47 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AAE8ksF10027734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 14:08:46 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F947AC05B;
 Tue, 10 Nov 2020 14:08:46 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 525ACAC059;
 Tue, 10 Nov 2020 14:08:46 +0000 (GMT)
Received: from localhost (unknown [9.65.230.88])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 10 Nov 2020 14:08:46 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: Fix memleak when cpus node
 not exist
In-Reply-To: <20201110123029.3767459-1-zhangxiaoxu5@huawei.com>
References: <20201110123029.3767459-1-zhangxiaoxu5@huawei.com>
Date: Tue, 10 Nov 2020 08:08:45 -0600
Message-ID: <87ft5hjocy.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_05:2020-11-10,
 2020-11-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=952 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011100096
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
Cc: tyreld@linux.ibm.com, groug@kaod.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zhang Xiaoxu <zhangxiaoxu5@huawei.com> writes:
> From: zhangxiaoxu <zhangxiaoxu5@huawei.com>
>
> If the cpus nodes not exist, we lost to free the 'cpu_drcs', which
> will leak memory.
>
> Fixes: a0ff72f9f5a7 ("powerpc/pseries/hotplug-cpu: Remove double free in error path")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhangxiaoxu <zhangxiaoxu5@huawei.com>
> ---
>  arch/powerpc/platforms/pseries/hotplug-cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index f2837e33bf5d..4bb1c9f2bb11 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -743,6 +743,7 @@ static int dlpar_cpu_add_by_count(u32 cpus_to_add)
>  	parent = of_find_node_by_path("/cpus");
>  	if (!parent) {
>  		pr_warn("Could not find CPU root node in device tree\n");
> +		kfree(cpu_drcs);
>  		return -1;
>  	}

Thanks for finding this.

a0ff72f9f5a7 ("powerpc/pseries/hotplug-cpu: Remove double free in error
path") was posted in Sept 2019 but was not applied until July 2020:

https://lore.kernel.org/linuxppc-dev/20190919231633.1344-1-nathanl@linux.ibm.com/

Here is that change as posted; note the function context is
find_dlpar_cpus_to_add(), not dlpar_cpu_add_by_count():

--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -726,7 +726,6 @@ static int find_dlpar_cpus_to_add(u32 *cpu_drcs, u32 cpus_to_add)
 	parent = of_find_node_by_path("/cpus");
 	if (!parent) {
 		pr_warn("Could not find CPU root node in device tree\n");
-		kfree(cpu_drcs);
 		return -1;
 	}

Meanwhile b015f6bc9547dbc056edde7177c7868ca8629c4c ("powerpc/pseries: Add
cpu DLPAR support for drc-info property") was posted in Nov 2019 and
committed a few days later:

https://lore.kernel.org/linux-pci/1573449697-5448-4-git-send-email-tyreld@linux.ibm.com/

This change reorganized the same code, removing
find_dlpar_cpus_to_add(), and it had the effect of fixing the same
issue.

However git apparently allowed the older change to still apply on top of
this (changing a function different from the one in the original
patch!), leading to a real bug.

Your patch is correct but it should be framed as a revert of
a0ff72f9f5a7 with this context in the commit message.
