Return-Path: <linuxppc-dev+bounces-6594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4B1A4AF45
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Mar 2025 05:41:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z58Qh5nvqz30T0;
	Sun,  2 Mar 2025 15:41:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740890460;
	cv=none; b=lArB7PnqdfV8PzwFKFU8IdUQxRbK/Ho5gxUjw0jBO1QbHRZluNPOjOieUUOfoyQ19A5qV96ByQ0ZKNaOiDYbe/fNghpHNBGbgnDm9WpecnZQZYKb84Y0JN7uchfF8PKH9iyKgKwWk/qwLkmhL1RIpZni6W/4dMNAekj0KdGekrM8wTd3Q1RtyNQz63kbo5OwKh78DHXyUhL/6Tu1vYYG9de/h2fnItHuELj7yA4iFH8ikGNVabrQxikiJDzJPKou39SnRS/Ry6GqzVcGbWPwi8H9m3q4PbSVZtOxocfhgHiBBl3VObFk1/exbYj0LuoZftMfomBOMzp7rwRp1OBsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740890460; c=relaxed/relaxed;
	bh=dC6JslnQYFvdw958NVt+SuurZVmN4Yq00mGGbOLDy7Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WAnBWbIv9wjTSygnYurHvJCtR9+WrgpxX6husLN8RL5/nTF5WTQohgGoiKYY8GslyLl5PUXCMb5Yt8GZ400zflso8tong0n98tUVbLU6cb5ulASKpRRHAaDrVwEpnmxM1cQz4A9EWiYNym2X9bWcPZbcoWs2679YZHvidi+qCNR/wEVmXMs7oT7V/wwd7ZVPQdG8b7kn2db9jgbUInsC09sBn39Xaz0YQllDmAu5f5K8TLI+ZyXoLkyhNuxRMDz/ehENMA99Xk/b79ew/16/ibtiW3gEyjX2bDRgT95p+IUQgWfPMX5vohFi+EM0JLUtRMTe5/IRUeeGpx6ihThRcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U9whNHuV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U9whNHuV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z58Qg3yYfz30CL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 15:40:58 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5223MMJZ016475;
	Sun, 2 Mar 2025 04:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dC6Jsl
	nQYFvdw958NVt+SuurZVmN4Yq00mGGbOLDy7Q=; b=U9whNHuVNKizJRthppZdvi
	Y+wjdvke8YvNDTRpdWRMzcYewaCPmVH9mlB3rQwhaJmrqLDC8xsRIoaXDLw6TgUQ
	G/nt4Z0+UORNOLFXK2SYsVOEhCpWynAOYJC/ZlQ+aHJ0M+7QwEWpX7FLiUj1ENSU
	6edOtYnimXMrGHYfMsBJiw5jZl+llWJFMRPftHTydeIz+sdmdlootPWtRzGWN1r9
	6XJtvfQH8picAVbshf4n7kirAXEzlmmftRvjcKaQeJytTwpHW8EnrhGt5HaDTvhx
	hpdLEmI5TXdVDV0yBu248pFXEUvudaLzDoOzYi2QPmBDGrxczmzM82M0i2qqmDNg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4549n4994j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Mar 2025 04:40:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5221JNn9020871;
	Sun, 2 Mar 2025 04:40:55 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454djn0pm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Mar 2025 04:40:54 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5224ertm28312224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 04:40:53 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1587C20043;
	Sun,  2 Mar 2025 04:40:53 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4578120040;
	Sun,  2 Mar 2025 04:40:51 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.83.152])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  2 Mar 2025 04:40:50 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v2 0/5] Microwatt updates
Date: Sun,  2 Mar 2025 10:10:49 +0530
Message-ID: <174089027713.25244.113258937939421569.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <Z5xtIVa0y7lTDTU3@thinks.paulus.ozlabs.org>
References: <Z5xtIVa0y7lTDTU3@thinks.paulus.ozlabs.org>
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
X-Proofpoint-GUID: jFQC2r_5l0Os8OOjhBtwKxhfLVLwQTt5
X-Proofpoint-ORIG-GUID: jFQC2r_5l0Os8OOjhBtwKxhfLVLwQTt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_10,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=407 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503020031
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 31 Jan 2025 17:26:41 +1100, Paul Mackerras wrote:
> This patch series updates the kernel support for the Microwatt
> soft-core and its implementation on FPGA systems, particularly the
> Digilent Arty A7-100 FPGA development board.
> 
> Microwatt now supports almost all of the features of the SFFS (Scalar
> Fixed-point and Floating-point Subset) compliancy subset of Power ISA
> version 3.1C, including prefixed instructions and the fixed-point hash
> (ROP mitigation) instructions.  It is also now SMP-capable, and a
> dual-core system will fit on the Arty A7-100 board.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/microwatt: Select COMMON_CLK in order to get the clock framework
      https://git.kernel.org/powerpc/c/81bb6490b78aab8cbfc2d0670f177233d2fa15f5
[2/5] powerpc/microwatt: Device-tree updates
      https://git.kernel.org/powerpc/c/78099fe1e3b5b72d4627f360b59a3470b1547bad
[3/5] powerpc/microwatt: Define an idle power-save function
      https://git.kernel.org/powerpc/c/2b0a438d5380c32817e1b2c883bd0494461e9f4f
[4/5] powerpc: Define config option for processors with broadcast TLBIE
      https://git.kernel.org/powerpc/c/3d45a3d0d2e6b5cf47c6f0ab890f6ce762d9fd23
[5/5] powerpc/microwatt: Add SMP support
      https://git.kernel.org/powerpc/c/aca95fb6bb572a77f39d42d83ab72a965026577d

Thanks

