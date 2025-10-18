Return-Path: <linuxppc-dev+bounces-13037-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 421CBBEC820
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Oct 2025 07:34:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpVjv27Qnz3cdg;
	Sat, 18 Oct 2025 16:34:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760765651;
	cv=none; b=XPAFhq6pPNugB9CM9y4Wzm0wMXbVQuzudgZa0KGMQ4/Y/g9VcOrORsrORGheYZd3N/b2DrqZZ94ViaKNVF7mmB/zUwB+EY3twYn8vqMZcaajzPc1hC6u3aOJmLJff7KRVGFm6DoTV8Z1Sj4tvwpuz/CanyIvjXevwcNk7mUSJytprYR1+di5QHrN4QDW+gsWU0ixAMQ7pT47xtUY4mhQzJKzWjd+BUWi8iBYeTmNPZfCiSGxM5eQ5aAaC/jKWn4pB7nebffPnVJceuG4i0ALVVCYV870biMb0Fp7HuMeNgNrwBnGpJ8vExFnWV3eUr6RH20AyFIsle53ZF6huWK8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760765651; c=relaxed/relaxed;
	bh=jWtQdzXBsYxj0v9zhQ5pI4sofFpKUSRnMcBC4vx++pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=flqHi7bFjQNsm0d0CrGy4hsr2nR/Xl3dW40drKiYNKzZCghY7tdm3nzBtILj142jwqjPqmGpYFRRQWrPh3/O/zF+MMyirVruVW+zuiC3qdPniN6n7yTfHJszef8jHmFSqTwAWm50pzrh5wfEFmYUGnK5WgEtxCNm2BVMHciZfM6T7KVeVi2I04d7cLB6+ttpD09TC3u5tuWLSKjiamumkaHeNEzjzW8uCjr+HSWy/IkfyCb8WOJkQ5c4i4bKzr1ZBOw83XAWJXDwcq0GyvI+LKJqAzR8G+DBXbAdqno4+jQSzJmB/mImhg2F95gLePeEK8DyF9sN1xehINIDlKmSug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XDcP1vR1; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XDcP1vR1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpVjt1K8bz3cdG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 16:34:09 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59I3ZFQ4023305;
	Sat, 18 Oct 2025 05:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jWtQdz
	XBsYxj0v9zhQ5pI4sofFpKUSRnMcBC4vx++pk=; b=XDcP1vR1zrerl2qr+UFqXe
	AmQmgiBLzu/GUfJOwZ61eePyU91RdczRDmyba3enxTPF7TCU8L3H01FdEpxf5qaK
	FPGOfIEwBNbCiMek50KWe3cAZOHkI6NYY41CKvMvEUwkVq7+ofTnGg0NYck0yBtL
	RTXNfpWQPTnAY5rBZVdRzR5QAPRUSZDVOtoTA3os8DK8M9g4DOi3PyZn36f+2m8p
	tG/8AqntDU4OyPT1Zw0m94wZc2u6XYYSEfcsj/SsYIYMclR6LMUH/D45SOT2m4rO
	AZeRWSN8aZ/WVDyD3LgGFxGhA6XLn9qcMNzk84daVzHm8nuegoaJKHn2/K5JFCjA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v33erb7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 05:34:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59I3J6O9018894;
	Sat, 18 Oct 2025 05:34:00 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r2jn8wrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 05:34:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59I5XvHl32637482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 18 Oct 2025 05:33:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 171A820043;
	Sat, 18 Oct 2025 05:33:57 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8EE620040;
	Sat, 18 Oct 2025 05:33:55 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com (unknown [9.43.69.229])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 18 Oct 2025 05:33:55 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: powerpc/fadump: skip parameter area allocation when fadump is disabled
Date: Sat, 18 Oct 2025 11:03:54 +0530
Message-ID: <176076456873.59904.7799538298456225588.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008032934.262683-1-sourabhjain@linux.ibm.com>
References: <20251008032934.262683-1-sourabhjain@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=FMYWBuos c=1 sm=1 tr=0 ts=68f326c9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=X3HrmfdtJb39MzEP_QcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: ABC_ggJWBsSwkvkcaDR8hwynwO0RQCMA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfXzdpRrYVD9ZoY
 4ngdeKS5jrDWldSEC7q44uHBEKwStivoXu0x8qedv5SBZro6QUkUZXU1K7N1I0grRnc6S4i79ZL
 5mrAoCkCTCYmAQvtQk5fO/ORwpO9gKRcu4CHqIO+ig2cLvOnlo6+TXJR3ak9F5MZDDJjwJU+Stj
 xn71rIz+mwlszUHJnKyxjrSC6aoAW8b3gJXiZ2WR1PdWOqbpU7meqdqBqroUoLn0GL7W1jwiVim
 h2IrHaz6r5l8TL/SHbjZRRYeZH9198LDuQwRCt/CUYXrroENzv3fLkebASwVNMnYJOOv+/ejb+r
 Ot0klM84xYPDXigW1dIRqPF7J3eZ7l+VyH29O3nbECPaaoYEO1sB3MdPag3Qk+XEWoim9x7+Khp
 1jsmUvIvny8l2bL88gN2ZvWnS0YUYw==
X-Proofpoint-ORIG-GUID: ABC_ggJWBsSwkvkcaDR8hwynwO0RQCMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 08 Oct 2025 08:59:34 +0530, Sourabh Jain wrote:
> Fadump allocates memory to pass additional kernel command-line argument
> to the fadump kernel. However, this allocation is not needed when fadump
> is disabled. So avoid allocating memory for the additional parameter
> area in such cases.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/fadump: skip parameter area allocation when fadump is disabled
      https://git.kernel.org/powerpc/c/0843ba458439f38efdc14aa359c14ad0127edb01

Thanks

