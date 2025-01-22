Return-Path: <linuxppc-dev+bounces-5480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27290A191A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2025 13:44:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdP0M2Y7nz2ytm;
	Wed, 22 Jan 2025 23:44:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737549859;
	cv=none; b=lHv78q5rdDNIjJsyaTX1HU2GPiwepK4vdMobmkNOimO2GNGFSZVKsQvSCdLk/AzlZSWRLTLv4WwiNdtQf42k7vCBq7iznMl5J9WAd6biwq5lv/rMPeqEFdHICVi1PlbOEGQP3+cQ30hUU0MxjfIeLgpRL4FQbfasIreQVFLTvPTSwt6AHJOzwJj1/bmbOrrJ3KZ6pIsO8FT3wZ0vCfnB/y5TLe9hhnkzYdC+RG3xoikEKq0qX1rOgLQQiP3NupHQslooUjoU65Uua8+Qut8p5MqkKOqFXs95qsMVf72O/e98AuBftyIVBbnAENqayBgKS55XP2jAavbVb9DP150W4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737549859; c=relaxed/relaxed;
	bh=XlYM4sKxk84TwQy/utw7Dea1Av6/+t1sQO/BqDHu2ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7m5ZGm96/rjxWNx2hu4DW6c1DjR+cGbFHHraD6QhyHJo5yqEMUEyeRxVTFuVt7vieMwBPVxB7Lpv5yKVZa6iYvgfb/NV8TkY6VCeUwaAPWw3UE2lIWJprJiAbeT9fWAPPYVJPxthZbvt1B2Pd8NyGGryhpB/WBUL0bcz6WyhVh4f6gdixCyIdfkFEJOnhY89WPkl4i9kjxg0Iw/Wg6N9qpSvWMPJBvl9LU+c3AH6zD+kgLIVddXib6rW9Olo5aljFmqOXVWiC2Ra6qsUp+9H0bdBnIBxCbLV56Sjk6AC0MTIEMMI6r641vx1IGol8vpf+Q21l8GfLP0vF2ThoTLzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kELFAIRW; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kELFAIRW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdP0L52h4z2ywS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 23:44:18 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M7WuQf012808;
	Wed, 22 Jan 2025 12:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XlYM4s
	Kxk84TwQy/utw7Dea1Av6/+t1sQO/BqDHu2ao=; b=kELFAIRWLum03i75P7GFU+
	njJBT+fmaE9wzzNlBoSV/by3FoVHOe4BTJubAs87LIippisi3G9TlvF9im9r3o3Q
	34jhc7rK6CaJlv4zuKvhke2+lWU21RzShAZ6ftHmzbPqb/b68hIe3KuGjDSALw/V
	UG1X4H+ztnAE1jqwPQ8+twk3h5xb426uqsRBqHOAGPWQKPovwGRLqUNKmVW7h8ef
	cYf2gjHk6EnbPbMOVQ+cXA5lSsYkGFnrs8asw1wabAfvfSXp7WInQy8JHqDIGhcA
	payoL0ukeE1qXPIhbOMy60NwH3jyfGbez06fgK4p8sOhrCNOxVHVF2RjnrnYmi/Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44avcp1ak6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 12:44:08 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50MCXGka013766;
	Wed, 22 Jan 2025 12:44:08 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44avcp1ak3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 12:44:08 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MAVRIE022384;
	Wed, 22 Jan 2025 12:44:07 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448r4k8arc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 12:44:07 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50MCi3dK56885598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 12:44:04 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D256120043;
	Wed, 22 Jan 2025 12:44:03 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D90320040;
	Wed, 22 Jan 2025 12:43:59 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.85])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Jan 2025 12:43:58 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com,
        vaish123@in.ibm.com, stable@vger.kernel.org
Subject: Re: [PATCH] powerpc/pseries/iommu: Don't unset window if it was never set
Date: Wed, 22 Jan 2025 18:13:57 +0530
Message-ID: <173754932979.1094869.2005290852678611840.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <173674009556.1559.12487885286848752833.stgit@linux.ibm.com>
References: <173674009556.1559.12487885286848752833.stgit@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BL7oZJv0OrjYS4LKyT-JwHw51RSJMHux
X-Proofpoint-GUID: 4u0jaRfOtPp97hSgEWWwhOZtnJCnz-LL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 mlxlogscore=248 spamscore=0 phishscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220093
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 13 Jan 2025 03:48:55 +0000, Shivaprasad G Bhat wrote:
> On pSeries, when user attempts to use the same vfio container used by
> different iommu group, the spapr_tce_set_window() returns -EPERM
> and the subsequent cleanup leads to the below crash.
> 
>    Kernel attempted to read user page (308) - exploit attempt?
>    BUG: Kernel NULL pointer dereference on read at 0x00000308
>    Faulting instruction address: 0xc0000000001ce358
>    Oops: Kernel access of bad area, sig: 11 [#1]
>    NIP:  c0000000001ce358 LR: c0000000001ce05c CTR: c00000000005add0
>    <snip>
>    NIP [c0000000001ce358] spapr_tce_unset_window+0x3b8/0x510
>    LR [c0000000001ce05c] spapr_tce_unset_window+0xbc/0x510
>    Call Trace:
>      spapr_tce_unset_window+0xbc/0x510 (unreliable)
>      tce_iommu_attach_group+0x24c/0x340 [vfio_iommu_spapr_tce]
>      vfio_container_attach_group+0xec/0x240 [vfio]
>      vfio_group_fops_unl_ioctl+0x548/0xb00 [vfio]
>      sys_ioctl+0x754/0x1580
>      system_call_exception+0x13c/0x330
>      system_call_vectored_common+0x15c/0x2ec
>    <snip>
>    --- interrupt: 3000
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/iommu: Don't unset window if it was never set
      https://git.kernel.org/powerpc/c/17391cb2613b82f8c405570fea605af3255ff8d2

Thanks

