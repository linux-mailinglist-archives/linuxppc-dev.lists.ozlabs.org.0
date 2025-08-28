Return-Path: <linuxppc-dev+bounces-11409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F28B393D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 08:33:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCBRh0ts3z3bqP;
	Thu, 28 Aug 2025 16:33:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756362800;
	cv=none; b=n+AFAje8LctujF5dSCXAvqOY6snt24Xk+Pla8G8MOD55G3AatOHN7uPsOPTaZNobREUXYIw1nCDw7VbtqOoCoa063b8TeWydCmnLAtsGmNesvn/IKzjyjAXmmNZhgtfLpND08lAVfl0roabL4R1d8kx+jdDvH1telfYCiaf9whBpuSEdqOdBtbPz819cY8QnVJqZ98cX1Wr67FYfE5adeO0nfb+ag3DsmvHHEgqJQ1fy0znZ145hceKNIE5I7XN3xpt7j3Fsa8MYCy2BNET9cVbJzsxHHeFHBICgP+fIxBlFuuEyzCn978RimSrwcX+n0TenmlJDB5QhHvf6URqIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756362800; c=relaxed/relaxed;
	bh=ZsFoQ3XNdMSmSqg7LwRtO2Kby10vyu1rMlBHeIlujig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZHKpIHEXmMl7sbZ0G4KLwIaGfI/3aBMw+cPeqjoFhj4HDcM6DzSTmaOHysBZcsbKcsgFvUk5ym0EjpOoMsEDanMV/TKGLaGFCkrDdO0wMwLcwGyaCe+y00YMlQ8Sl7DsQxJ3H1h/2AYe6Kip2BxMIbUe+gVLDM/4wZomZ/RykBiFDAg0wxJWHIrv5PrGXNsBWSnBvwdet00xI5eulAclytFQK2vdbiq0dNyjOWKMuVf37zcl7ibHIb5HZroBHlrUKZhY+DTkPC5mUKf0dvpeHPSZ8u8YBKwLBtIYIX724/H0YiBEA8mcDZNrrRR48d5VnweGANgVjskTGgdTm06bUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hyEuo5V0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hyEuo5V0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCBRg3CK9z30WS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 16:33:19 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RN2DBN006426;
	Thu, 28 Aug 2025 06:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZsFoQ3
	XNdMSmSqg7LwRtO2Kby10vyu1rMlBHeIlujig=; b=hyEuo5V0TwKxefldRwouIY
	ZSdfK+G87OlV0lI+yygywp2ybBTzqrDw8k7ggpL3NpbeVQ+0N8W6emhiRjepvjAT
	ZAso3xrzSpgK0F+mv7rUlDG5kPkn3vmzHGs6MSM5iJLVxf7lm9z7XBtq3ifWAVqB
	HnfcZsb14xVXl+Wuh7XXVfMaOUlM36iwAkp9uofcZU4VM1r4ro/431BEUuZsY2mZ
	8qn49GX2sd8mu7R/OwJUW8vntUH0GRLmc9PLfOxLf59+y8iGfjZMkSXbaEQN/Ral
	65wPUAu2BrOf6f5LQaTPZd0bDRpQJKXy8rJmp6+OLjzjTJBmkx7PKQaHNeTovm+Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avr4cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:08 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57S6Mpja030850;
	Thu, 28 Aug 2025 06:33:07 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avr4ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:07 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57S1t2qV017981;
	Thu, 28 Aug 2025 06:33:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qtp3kard-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:06 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57S6X3Xu42991872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 06:33:03 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04E9D20043;
	Thu, 28 Aug 2025 06:33:03 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 054B420040;
	Thu, 28 Aug 2025 06:33:01 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.161])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 06:33:00 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/kvm: Fix ifdef to remove build warning
Date: Thu, 28 Aug 2025 12:03:00 +0530
Message-ID: <175635911051.1554354.6427450484684804574.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250518044107.39928-1-maddy@linux.ibm.com>
References: <20250518044107.39928-1-maddy@linux.ibm.com>
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
X-Proofpoint-GUID: w5VuY08GiL5WbMil7qHGnATs4_kGRZtO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfXzRk1C4ersrDN
 GHXgn8q6xAoFFzc7EO6z6rDHsmiwUe/wMINYfveLkA0v9yqpmILjBKN6YziwlYizuPpkrSRVclA
 hQzKZCPvD9T93ilzoSLVCpl1pyO4+/UKk1kAhW1kb8ATZZ4O8rstoOo4a9gawjknDIw1ikT1DG6
 IxX+H86SQ41J6QhzBBYVf8zNX+VNkESaejIDSWMO6HAl54R5J83NACI37rxbW9qoQlaTS0S8F7j
 EnvT7Igg6UkbqjmjMIwbIfhkg02ey4WncF52ZmZGcZSzrbTRTJBDGHhgwC71zi381dNvR0kFW6f
 FqtzCiHVsvb4mLudyaw3Zy/3m89Xrd0CgRlGatM51Fhzc9v1sRGGJPe+D6c2hbDY0Xn1jk9v8+T
 22xNQpBu
X-Proofpoint-ORIG-GUID: JXkG1h97D-UlmBVSsutClIblkOzoxTbu
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68aff824 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=s2StSpeh2kIBs2Lx2WIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 18 May 2025 10:11:04 +0530, Madhavan Srinivasan wrote:
> When compiling for pseries or powernv defconfig with "make C=1",
> these warning were reported bu sparse tool in powerpc/kernel/kvm.c
> 
> arch/powerpc/kernel/kvm.c:635:9: warning: switch with no cases
> arch/powerpc/kernel/kvm.c:646:9: warning: switch with no cases
> 
> Currently #ifdef were added after the switch case which are specific
> for BOOKE and PPC_BOOK3S_32. These are not enabled in pseries/powernv
> defconfig. Fix it by moving the #ifdef before switch(){}
> 
> [...]

Applied to powerpc/fixes.

[1/4] powerpc/kvm: Fix ifdef to remove build warning
      https://git.kernel.org/powerpc/c/88688a2c8ac6c8036d983ad8b34ce191c46a10aa
[3/4] powerpc/prom_init: Fix shellcheck warnings
      https://git.kernel.org/powerpc/c/d40ae9033418095642f65f4fd54dc5a7d292ee39
[4/4] powerpc/boot/install.sh: Fix shellcheck warnings
      https://git.kernel.org/powerpc/c/8763d2257f5231cfdfd8a53594647927dbf8bb06

Thanks

