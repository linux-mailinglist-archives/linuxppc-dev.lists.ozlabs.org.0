Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C027EBE68
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 09:11:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lte3mq1+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVbTh1P6Yz3dLT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 19:11:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lte3mq1+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVbSM1HQZz3clb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 19:10:10 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF7ddjb013223
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 08:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=y4z3zM37LwbbPOQ+VcbIvM3rSKn55xlNvSpooMLrybE=;
 b=lte3mq1+7KbFY4BC/hT0zAM4K6ZFjxCdq41GHc4HE7cyzLJ9lDUr+jinDUrWmPkOYB18
 RbFf9GZEImhNphEF+tdm8r4ElJjCtDLO9mV+/uvLl6/wSY16GkgJ/c62u0vTgPnbobJj
 q0junFRK8UGErY5wTA44ngf0fYaJ3ASRutB9M5tgNgtuiLVGcENvmNTYca6boErw/OAt
 05oaUPu7pIfsTSFWfX8S6S7jefrTr9Vm6Z3Qt70DzP9eeDNr2TiYZIHLXZZGH6mkkiOW
 9Ozuskg2nQL5dLIJ0mSY19PJOdauIWdRGa3sZTHqrZMauw+ixHBes9YBlbM7Ir8XjWX/ BQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ucssw0t8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 08:10:05 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF7jVGc023945
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 08:09:59 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uamaye0h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 08:09:59 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AF89wE66226474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 08:09:58 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FC3E5805C;
	Wed, 15 Nov 2023 08:09:58 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE1E65805A;
	Wed, 15 Nov 2023 08:09:56 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.109.250])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Nov 2023 08:09:56 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Restrict ARCH_HIBERNATION_POSSIBLE to
 supported configurations
In-Reply-To: <20231114082046.6018-1-vishalc@linux.ibm.com>
References: <20231114082046.6018-1-vishalc@linux.ibm.com>
Date: Wed, 15 Nov 2023 13:39:54 +0530
Message-ID: <87sf57zbcd.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qscIRIBxlkqFW7-M11YxbqvaMI4o50yO
X-Proofpoint-ORIG-GUID: qscIRIBxlkqFW7-M11YxbqvaMI4o50yO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_07,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=785 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150059
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
Cc: Vishal Chourasia <vishalc@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vishal Chourasia <vishalc@linux.ibm.com> writes:

> This patch modifies the ARCH_HIBERNATION_POSSIBLE option to ensure that it
> correctly depends on these PowerPC configurations being enabled. As a result,
> it prevents the HOTPLUG_CPU from being selected when the required dependencies
> are not satisfied.
>
> This change aligns the dependency tree with the expected hardware support for
> CPU hot-plugging under PowerPC architectures, ensuring that the kernel
> configuration steps do not lead to inconsistent states.
>
> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> ---
> During the configuration process with 'make randconfig' followed by
> 'make olddefconfig', we observed a warning indicating an unmet direct
> dependency for the HOTPLUG_CPU option. The dependency in question relates to
> various PowerPC configurations (PPC_PSERIES, PPC_PMAC, PPC_POWERNV,
> FSL_SOC_BOOKE) which were not enabled, yet the HOTPLUG_CPU was being
> erroneously selected due to an implicit assumption by the PM_SLEEP_SMP option.
> This misalignment in dependencies could potentially lead to inconsistent kernel
> configuration states, especially when considering the necessary hardware
> support for CPU hot-plugging on PowerPC platforms. The patch aims to correct
> this by ensuring that ARCH_HIBERNATION_POSSIBLE is contingent upon the
> appropriate PowerPC configurations being active.
>
> steps to reproduce (before applying the patch):
>
> Run 'make pseries_le_defconfig'
> Run 'make menuconfig'
> Enable hibernation [ Kernel options -> Hibernation (aka 'suspend to disk') ] 
> Disable [ Platform support -> IBM PowerNV (Non-Virtualized) platform support ]
> Disable [ Platform support -> IBM pSeries & new (POWER5-based) iSeries ]
> Enable SMP [ Processor support -> Symmetric multi-processing support ]
> Save the config
> Run 'make olddefconfig'
>
>  arch/powerpc/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 6f105ee4f3cf..bf99ff9869f6 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -380,8 +380,9 @@ config DEFAULT_UIMAGE
>  	  Used to allow a board to specify it wants a uImage built by default
>  
>  config ARCH_HIBERNATION_POSSIBLE
> -	bool
> -	default y
> +	def_bool y
> +	depends on PPC_PSERIES || \
> +		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
>  
>  config ARCH_SUSPEND_POSSIBLE
>  	def_bool y
>

I am wondering whether it should be switched to using select from
config PPC? 

-aneesh
