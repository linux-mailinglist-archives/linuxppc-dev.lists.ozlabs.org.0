Return-Path: <linuxppc-dev+bounces-14398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCC6C772D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 04:43:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCLfg5LqGz2ySb;
	Fri, 21 Nov 2025 14:43:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763696619;
	cv=none; b=SOC0q+xAWLtIZM8jhB7/wJwlTtoY7ntizz5rA505FEBFnkGKdGBfECQYKVVKlutpuIC4fjbFCvD3JPnsVKnZwAsztcL8nXRlUZqH5vg1Ejr42eET0l3cM6VVt13grNu4UqR9Do+qIcIa6UeB5zYBbbWiTCpEKM+jHOBg7B0h2YbE0NBrpq3dHd9LegDnqclUbS/wHYKrrKaTf7exHC5BLBm8Tt3GqI46YzR1/mt0PbcFG9eIRTUrySSG3hdWsGVhvALPWt1sH54wOI+miXBmfs0gv9+KZmpbX/wFB0yxZzzepTPfeQAQXteMrDrBX6GLI348u2L1Xg1e5Lk6jufHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763696619; c=relaxed/relaxed;
	bh=/xxysxJgCWfMcO9pdJv+8jWo5Gyz7GeEeukgJRHAehQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jxr4z0qinsfopKcggSikLu7r4QOa1u9ErfPo5XqwFb8pHVile176+AEuW/xo5RjNjX4mHdXwUtoVQciA9MAXu2WasgnOHsCpOn3z3dUCNx4ngMbVM/r82hvlNplBJWKHPhjrw14E0RFZPGEvgJQo6psYnRvA9oi6ClVWfhz9CA9h9acGL92anTBwZrXqw7UsZp0/WIu57rlTRLyqeV8GE27rls8bFPjLLF3TSgkQz1WOAHyw+Ad50qVGBjz26nACTPm1R5bLdMcDscp/HoHkCz06fmt10m3ViZdMaTKUnUxhtrfMn47Pcu7nVC6qM0PsSsmWvu3h+UE555efzTtPiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f4s3mcgr; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f4s3mcgr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCLfc5vhlz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 14:43:36 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL1Sh1s027957;
	Fri, 21 Nov 2025 03:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/xxysx
	JgCWfMcO9pdJv+8jWo5Gyz7GeEeukgJRHAehQ=; b=f4s3mcgrpYrdNH8KYt/3zI
	jpySnRrdNHa/h9Y6trvXXhIN1YR9xAvIg2CFo3XGBLmO8l/Z+LZwfDPt6yjGLMB9
	8viNNkIgiutBesVvkNe6SHp73OX8TRLwRLena8ycSX5N4Ruy1r/pKh+Mq7MuxuAL
	L/4qYYt7Zn0CkIlkMq7RvtE+D/PfmYDHXG3Oas52+bFRDbLD9UUKFD0MKH5QQxCM
	GK2fwg6SN3mJaSl0LFDi6Hzl4uAA2imwRLvnQ8fWE+Yvkpea3T6Vd3xpspdp8mMh
	iLWHLxspxKjElFfh7hFTs4M88kdbvC6zQCbSosTrqGyvv0Bzw8RO/BrP/ixloQUA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejka9reg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:43:28 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL3hSxr022003;
	Fri, 21 Nov 2025 03:43:28 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejka9ref-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:43:28 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKNRHM2022434;
	Fri, 21 Nov 2025 03:43:27 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4una5f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:43:27 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL3hNEA42664302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 03:43:23 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DD7E201AE;
	Fri, 21 Nov 2025 02:54:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3C5F201AA;
	Fri, 21 Nov 2025 02:54:30 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:54:30 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Shirisha G <shirisha@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kdump: Fix size calculation for hot-removed memory ranges
Date: Fri, 21 Nov 2025 08:23:59 +0530
Message-ID: <176369324781.72695.91068925619265054.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251105033941.1752287-1-sourabhjain@linux.ibm.com>
References: <20251105033941.1752287-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: KHTHAS5JVeVNgiFhUGhG8BJUfrKa4sZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX2AOOZMvyuKhK
 m7ZtK3v9HxsOuEpiWujiLBOFDKk9RSzuEmduNFy4lKRBA63CNBE+v9B8gYu/XtNEeLQJ4c+IEGa
 m3G7S0jSt/0hzNkMnODnnRHDgAMESds9Vfdc6xbw3SVGkYFPBSG7aL2fzkdsflAFii70r8DAYf8
 0FeszCXY2EdO6z65ygx++vXOLl38joC4+AwDLKH7tPA4J0DAiKzNFcaQHFVT1bmvc6BD9x5lQjh
 t66NFgomg+3UqFaFllaHXZe0b9vYujno7gruOg6Fnzr1r3PcJDRJEfInslgfKC1jLrld1qwbXBi
 D6M/nDX0nWs2zX5taSmRQ97/FuW4/tERpsLA8RrElWSSDR6kRsoXwGadOixl9FsA6ztwc/iw64X
 zLcqlPFNus0INNV/JyqcXJ/d4IOvWg==
X-Proofpoint-ORIG-GUID: hC9KIIREGWLnSBMBOasyt0PjLABWvd6n
X-Authority-Analysis: v=2.4 cv=XtL3+FF9 c=1 sm=1 tr=0 ts=691fdfe0 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=kHnH0_rxvdj-15et1z8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 05 Nov 2025 09:09:41 +0530, Sourabh Jain wrote:
> The elfcorehdr segment in the kdump image stores information about the
> memory regions (called crash memory ranges) that the kdump kernel must
> capture.
> 
> When a memory hot-remove event occurs, the kernel regenerates the
> elfcorehdr for the currently loaded kdump image to remove the
> hot-removed memory from the crash memory ranges.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/kdump: Fix size calculation for hot-removed memory ranges
      https://git.kernel.org/powerpc/c/7afe2383eff05f76f4ce2cfda658b7889c89f101

Thanks

