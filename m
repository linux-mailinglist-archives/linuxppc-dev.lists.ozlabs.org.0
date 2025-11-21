Return-Path: <linuxppc-dev+bounces-14389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C3C77147
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 03:55:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCKbH1CXLz2ySq;
	Fri, 21 Nov 2025 13:55:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763693739;
	cv=none; b=a1ZzB9SNhBKf3zkMP7Gl6onD67d5miF5B57BDWfihIwZbIZ8gfvjxOwoRau8t5bYPmI2/aitz8a17dpxSIg8G8yRrxJnzzXn4Dqt1T46nCXHCp2Qkm/MJIp2APvopXlnI/OjipciLrA7TpYTMG1ApC4RfBk7Zecqf+kbPMRi/S3FDRCD4VfT7AAxdcegV6d1XRnehHwDm3s61Dx1FdxSxbEtqPwzUntYZXBBOCmJjJkrI8CYZsX71/2ATCGk34z1h5rXJ+9XbZdj+QONxXQhPZwKDUwFz3zuNLfnJ2u4/7pFhK2B4DjP4qGPBn6K/DzEf+nipkN2FaKq2KjsheXPng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763693739; c=relaxed/relaxed;
	bh=6r4YsXXpYgLWjU2aHpVesRm6n0kDDa3VvcHa2DZPKG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RE24CQIVwY13ea51iQpaU6hr2fIIWhghxztIFYi+FEJWfp6VMCp4AGT1YBNnAkR5KKnbnUn3c6avJyketRfQdB7Rg4AYK1qSJ+RVRxDKSwZGU5oD2Os78xgQkBvIJbBwksXHNI/zcXma5LtqBxFcVDWaDRP5ZA+YFKCEXN2hHj876yKq61gUWrOAVTP+5AXg6t4hOjLg2iEwvuehzkiJMEhwI05govJjIkBp4tbZtA2Wzu7wGnBBqpjhc2fAwoAxMj0DlvjxXwdlArH+Q9h5m6Ec+wEOs726Y1hJxDgh6nP7OyeLj9XyMaLdDq7/I8TgKp16/Q06irIIx+QcsMxMrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V4Lckuqd; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V4Lckuqd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCKbG2h8Rz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 13:55:38 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKNTgU2028030;
	Fri, 21 Nov 2025 02:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6r4YsX
	XpYgLWjU2aHpVesRm6n0kDDa3VvcHa2DZPKG4=; b=V4Lckuqd8ZOChwGWJTsz1z
	LlxiWiYDB8JjUnxQvDOg8zXmSOlVZvPvYtMpv4MzzD3PO94UWrgCh+b5JayuYNy9
	rKPjchNgSxItqCRcih6u/2LYscLIlVZjgNvBYMxEHx5A6dg8so+GU/IyRPjczZ/M
	LJOtvDv0qU1/czqwDmNERk+tImLFaOpr2jiztZzY+1FqfcuTSdyNmTUI10FHnWEy
	mBOplsK4eLBO2+pCy6V+Vxo25nWLFb39uEkKQ3SkIUuyw5AmhTX3nl3qZtgKdZCu
	0wIkAB+uiJQEeoZ2/JeqnIEpCdkjr+Y9bsi7JZ6WkfJuI4jMKoxpePCfxjdKiDjQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejka9mbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:55:32 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL2srwF030981;
	Fri, 21 Nov 2025 02:55:32 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejka9mbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:55:32 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL03QIn005065;
	Fri, 21 Nov 2025 02:55:31 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bkhywe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:55:31 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL2tRYO36897140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 02:55:27 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC0022015C;
	Fri, 21 Nov 2025 02:54:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFA9F20159;
	Fri, 21 Nov 2025 02:54:36 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:54:36 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pseries/lparcfg: Add resource group monitoring
Date: Fri, 21 Nov 2025 08:24:06 +0530
Message-ID: <176369324779.72695.12138694029606864511.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20250716104600.59102-1-srikar@linux.ibm.com>
References: <20250716104600.59102-1-srikar@linux.ibm.com>
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
X-Proofpoint-GUID: ZqmsyBsRazGsqpqxH7fa_mTFksfocTd6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXwvw6+2ojmOMA
 wPeFf1e6VXbPnUCVX1QwRpYW7AVZiQkMv+MacCMVqFcp9lH6RjrF5tXJluGafQ/7RuKt298iMBJ
 NTHg5p/KrhXLmlHCMBocpbtM7251OqvJVjFmilNx9Znk13cd8zUa+k3tqRBvgMIY/M9iXuaajsU
 +9Rdgg7q3v5eMVR31beOH4tdAPT2rwNCKrFU7i4Uv5Ll6DA71oKb2CODOPEhF1j3kZAVMjd4zHd
 6wSr01F29tH4xyjWvGbS0o8a4atMAMYhtpF67QTeXEG+VgUXQoQnu4NIGHEvda1/YvTUsOYJIlO
 U5IXuGG8snp7s3Q5Bd8jrmr4FU6Dk/1YvvXULhldmlWy/dsPt2FOkpc8YXPf9kDbyXQ0+Cmak9k
 LUuE8e5Gjs2Dr2LBxYBP9HyL1ivQNg==
X-Proofpoint-ORIG-GUID: ynW3ZEy0AhQiGaThbIXPCe-NWcJZC-fi
X-Authority-Analysis: v=2.4 cv=XtL3+FF9 c=1 sm=1 tr=0 ts=691fd4a4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=XtJ6tFtuJrrXro_qfTYA:9 a=QEXdDO2ut3YA:10
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

On Wed, 16 Jul 2025 16:15:56 +0530, Srikar Dronamraju wrote:
> Systems can now be partitioned into resource groups. By default all
> systems will be part of default resource group. Once a resource group is
> created, and resources allocated to the resource group, those resources
> will be removed from the default resource group. If a LPAR moved to a
> resource group, then it can only use resources in the resource group.
> 
> So maximum processors that can be allocated to a LPAR can be equal or
> smaller than the resources in the resource group.
> 
> [...]

Applied to powerpc/next.

[1/1] pseries/lparcfg: Add resource group monitoring
      https://git.kernel.org/powerpc/c/8127c4fdf169465b631b62f7e45a042ced32dc77

Thanks

