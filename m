Return-Path: <linuxppc-dev+bounces-15672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65696D1C30C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 04:04:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drWDV4Gnzz2yFq;
	Wed, 14 Jan 2026 14:04:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768359866;
	cv=none; b=md9/HkCeEm+lm5YuoQcpnfLkOiazVaL5ThvptzE0n76ii9SG47w4h3YqzYiFOEfV5jed1UFMLuvZXCI9abqyhHYqvX0SY7JSWiZ1mSY1BMSukKDWc+I43YAPNLaHsYHo7fEN9vPv5BPL+8gOz8r4ou4H2Z+ZwIXrSm1+Jt7q29swbPwcNy/GT5KWM8Fuj6S072/A4E+k72/TRuJ8SKXSVvY3ha6FzNuXMXjkAVzGm4FxR/I6OrVGzxc/UxJdikjU49cZocBzpOKE9WCPkxmZKurirTuK/3afvdNXXje5VEN7wyWSReXYObvgnppQ24gIiMcs1MxZlxZkeoVmmxlMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768359866; c=relaxed/relaxed;
	bh=t+rRfJuosLbUX+O3DkM3CuUYQhZBNktKuLp5gjZSKfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bC0fzq71xXwvHvpV1NZBC0oahmpBHw04NBm4v6I7/aLX4zBUpve3haeQdFA1qNd7R5pAODPa7QYuNXsfMsz9SSJvQbHrPC9a/XeC/+frgLcIFTxJvWmvjzsw4ayCUli8k0E8UyaXL6skWJSgTlt+7OSdlJjas6/3k97aHiUUOEScaYhKrPpBWeN+bLD1LNJ9QbPtFLrAy4Yl8PXXl6Qfm8h1xnMGZP58zwCAfe0/CwAogYnNyLDCehXzn0k8ELD64OQspa62tHKUEreBy7JO3lhBRUYfVypqAAdZAiCKM7d3/I24N1s/FI7e/QkBe0replPNZ1IFVQwv88InnJQTNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lWz9OjhY; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lWz9OjhY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drWDT2JN4z2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 14:04:24 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60DEFdYu003940
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=t+rRfJ
	uosLbUX+O3DkM3CuUYQhZBNktKuLp5gjZSKfc=; b=lWz9OjhY5QmFpss3tjUpwt
	gEhD42qmFozj+kGCmyF4JkWeVsYTK69kTx5eHW2po4slYwewNwwwgg30FZnyionF
	+FV483HWscCBNUuHqomruJ5gZlDbAgZOBe0fLEdeMXP4TceSovGI2Ieow/cphior
	CHNNGW17Qc3gFa/JpoglxingAiJWsxwNmuN8mnwfZ84kIyqMREJoI5eK5ZBgh1IB
	M2eqoB6LynKItnekP2Sp582iSbGUWJyvQqVtzP1GbCRm1ONrDqgnNtiU8Pj9e6fS
	bVRVw0ftIRZvdKtGdseWkmXybbmbs36TGO/IgCCPgzMvsPLCmUqGCfmQD+LKv4Ew
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkedsy3q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:04:20 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60DN7ZG6025549
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:04:19 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm23n7uux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:04:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60E34Fbv51773728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jan 2026 03:04:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B77A20043;
	Wed, 14 Jan 2026 03:04:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CC5A20040;
	Wed, 14 Jan 2026 03:04:14 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.124.217.241])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Jan 2026 03:04:14 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Gaurav Batra <gbatra@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/iommu: bypass DMA APIs for coherent allocations for pre-mapped memory
Date: Wed, 14 Jan 2026 08:34:13 +0530
Message-ID: <176835971841.41689.14371822782572777165.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251107161105.85999-1-gbatra@linux.ibm.com>
References: <20251107161105.85999-1-gbatra@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAxOSBTYWx0ZWRfX9rrwPM2mdOjd
 Jjrssccc8vuhrzEBwE8uiBqHh9k5Fx+QDNJD82riXuK/Jmg4hLwR5i+Rde2D9huh3Idz/h0Ys8f
 RyAlCd1LdjAi/a1f0YhkshjhUQgW4iikFsDqrHp6dCyqtHFtds+HNSYgnKRz9uN9TcDi5IHM9HA
 OxKAtv4KqA+zMrmqBPnXzhpPS5Ny5adz1rueIn62UlmIrJXub9rtKE0ZJadFiyo9y4GKu5goUiV
 WyIcI7o1EQvpF9cZ2tuVXdcP9zlz0on3j4HapErxHC7qaT21V2b65FHVX7NFelsyJYNRofY1Ng3
 /2iVcWzdKZBEH5qHkbWhASosXqTedmWd+TabovIMKZCDCiOhwbSZn6eE49rBIO62w8g+doiy8qW
 08J2zpf/APFSj0kxpYckbx7t4NwVr5dwSzyQ0ukoZJL3gkWB94J66TxzGMv6nf9IiJ6zsbVY1BI
 CUQuHNORi4zRaupPc0w==
X-Proofpoint-GUID: i3rH_psibJSOnafB-wqEBBThPz25s3ZJ
X-Authority-Analysis: v=2.4 cv=WLJyn3sR c=1 sm=1 tr=0 ts=696707b4 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UzJeWJRkDdmME4iAw-AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: i3rH_psibJSOnafB-wqEBBThPz25s3ZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601140019
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 07 Nov 2025 10:11:05 -0600, Gaurav Batra wrote:
> Leverage ARCH_HAS_DMA_MAP_DIRECT config option for coherent allocations as
> well. This will bypass DMA ops for memory allocations that have been
> pre-mapped.
> 
> Always set device bus_dma_limit when memory is pre-mapped. In some
> architectures, like PowerPC, pmemory can be converted to regular memory via
> daxctl command. This will gate the coherent allocations to pre-mapped RAM
> only, by dma_coherent_ok().
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/iommu: bypass DMA APIs for coherent allocations for pre-mapped memory
      https://git.kernel.org/powerpc/c/1471c517cf7dae1a6342fb821d8ed501af956dd0

cheers

