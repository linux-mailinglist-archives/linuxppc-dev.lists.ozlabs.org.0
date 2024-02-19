Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B81B985AE62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 23:26:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=etz1DvA7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tdxvt4tpnz3cGc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 09:26:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=etz1DvA7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tdxv25M7Qz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 09:25:34 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41JLVEJI016770;
	Mon, 19 Feb 2024 22:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=qDJQB/ltTH9qmIf4IVC8UtkoZYAjRiPYpooTfHwKSWI=;
 b=etz1DvA7wjtXu9FFMjagx1AbCPxwwHVgRQtwoHCWTHdybCQyxug65wj+bajkfjxY4hBj
 ck3VGBQkuW8X+8Vzj6k13Fub/JA/wut9NN+y2a8M9vDhzRCqYkN9mv9XTLvn07+S1fkK
 Ty8/KCIT8SQLYMWF/m9qMMm8n9HkcAFcMtdn7oGBsyeZbRfgs8nFOrMrvXR+9mPIDsx8
 Kfv7UTWfBBwFBJk1+9HUWbCl9TW/IJqBhX1qAEHhgLrA0YLjK7OYMsvDL2mDdeNs2jQN
 8X/cfNCsETeLEeGIstTgEyI5HtfEQEr50oYKsVyVy+qw/GGjBpCqwaacQYSAy6soY9Zc mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wcepus7p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 22:25:28 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41JMFiNp024715;
	Mon, 19 Feb 2024 22:25:28 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wcepus7nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 22:25:28 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41JLSfYY014406;
	Mon, 19 Feb 2024 22:25:27 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wb9u2bt58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 22:25:27 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41JMPNXC5112482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Feb 2024 22:25:26 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA0565805D;
	Mon, 19 Feb 2024 22:25:23 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A87A258057;
	Mon, 19 Feb 2024 22:25:23 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Feb 2024 22:25:23 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Brian King
 <brking@linux.ibm.com>
Subject: Re: [PATCH RFC] powerpc/pseries: exploit H_PAGE_SET_UNUSED for
 partition migration
In-Reply-To: <20240111-h_page_set_unused-for-lpm-v1-1-cd56184ad608@linux.ibm.com>
References: <20240111-h_page_set_unused-for-lpm-v1-1-cd56184ad608@linux.ibm.com>
Date: Mon, 19 Feb 2024 16:25:23 -0600
Message-ID: <877cj0hz1o.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bR2827zsOEBtEir8_jSEnOoYqMqiprAg
X-Proofpoint-GUID: -QYwpt-QNgajAFDsvDUcRCfHbt7CQ2ZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_20,2024-02-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402190168
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>
> Although the H_PAGE_INIT hcall's H_PAGE_SET_UNUSED historically has
> been tied to the cooperative memory overcommit (CMO) platform feature,
> the flag also is treated by the PowerVM hypervisor as a hint that the
> page contents need not be copied to the destination during a live
> partition migration.
>
> Use the "ibm,migratable-partition" root node property to determine
> whether this partition/guest can be migrated. Mark freed pages unused
> if so (or if CMO is in use, as before).
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
> Several things yet to improve here:
>
> * powerpc's arch_free_page()/HAVE_ARCH_FREE_PAGE should be decoupled
>   from CONFIG_PPC_SMLPAR.
>
> * powerpc's arch_free_page() could be made to use a static key if
>   justified.
>
> * I have not yet measured the overhead this introduces, nor have I
>   measured the benefit to a live migration.
>
> To date, I have smoke tested it by doing a live migration and
> performing a build on a kernel with the change, to ensure it doesn't
> introduce obvious memory corruption or anything.

An update on this. I've been working on quantifying the benefit, and
I've now seen memory corruption after partition migrations, with several
programs getting mysterious SIGSEGV/SIGILL:

mobility: calling ibm,suspend-me on CPU 7
mobility: CPU 7 waking all threads
mobility: waiting for memory transfer to complete...
touch[10988]: segfault (11) at 8 nip 7fff8fc2f9fc lr 7fff8fc26684 code 1 in ld-2.28.so[7fff8fc20000+30000]
touch[10987]: segfault (11) at 8 nip 7fff86f5f9fc lr 7fff86f56684 code 1 in ld-2.28.so[7fff86f50000+30000]
touch[10988]: code: 3d22ffff 81297470 71290020 4082254c e93d00f0 2fa90000 f93f00b0 409e2458 
touch[10988]: code: e93d00f8 e95d0068 eb1d0000 2fa90000 <ea2a0008> 419e00f8 e93d0158 e91d0058 
touch[10987]: code: 3d22ffff 81297470 71290020 4082254c e93d00f0 2fa90000 f93f00b0 409e2458 
touch[10987]: code: e93d00f8 e95d0068 eb1d0000 2fa90000 <ea2a0008> 419e00f8 e93d0158 e91d0058 

Maybe I had some debug options enabled that masked this before, or just
got lucky.

In any case, it seems obvious now that for this to be safe,
powerpc/pseries needs to implement arch_alloc_page() to undo setting the
"unused" flag.


>
> This will be a possibly significant behavior change in that we will be
> flagging pages unused where we typically did not before. Until now,
> having CMO enabled was the only way to do this, and I don't think that
> feature is used all that much?
>
> Posting this as RFC to see if there are any major concerns.
> ---
>  arch/powerpc/platforms/pseries/lpar.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
> index 4561667832ed..b264371d8e12 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -16,6 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/jump_label.h>
>  #include <linux/delay.h>
> +#include <linux/of.h>
>  #include <linux/stop_machine.h>
>  #include <linux/spinlock.h>
>  #include <linux/cpuhotplug.h>
> @@ -1772,17 +1773,25 @@ static void pSeries_set_page_state(struct page *page, int order,
>  	}
>  }
>  
> +static bool migratable_partition;
> +
>  void arch_free_page(struct page *page, int order)
>  {
> -	if (radix_enabled())
> -		return;
> -	if (!cmo_free_hint_flag || !firmware_has_feature(FW_FEATURE_CMO))
> -		return;
> -
> -	pSeries_set_page_state(page, order, H_PAGE_SET_UNUSED);
> +	if (migratable_partition ||
> +	    (firmware_has_feature(FW_FEATURE_CMO) && cmo_free_hint_flag))
> +		pSeries_set_page_state(page, order, H_PAGE_SET_UNUSED);
>  }
>  EXPORT_SYMBOL(arch_free_page);
>  
> +static int __init check_migratable_partition(void)
> +{
> +	struct device_node *root = of_find_node_by_path("/");
> +	migratable_partition = !!of_find_property(root, "ibm,migratable-partition", NULL);
> +	of_node_put(root);
> +	return 0;
> +}
> +machine_device_initcall(pseries, check_migratable_partition);
> +
>  #endif /* CONFIG_PPC_SMLPAR */
>  #endif /* CONFIG_PPC_BOOK3S_64 */
>  
>
