Return-Path: <linuxppc-dev+bounces-4555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3DC9FF38D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 10:09:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNPCb5k8Yz303B;
	Wed,  1 Jan 2025 20:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735722539;
	cv=none; b=DjLqdfyc13CYFDSXMkcbQmjE+eb83snrODbxvEdnCAZ6+V1d18Eifg7iwvE5DHtfPJpdqAbtCAeSKMrb/9lGNQIN1WQxrYiuIsdlUOZxVtTjkvsNWvKObaQbRt1bb4jPBDgHxor8ictoOM7tQ8guKQxTAGcOjb1rr1NG9DE8Xe8FX8jn10SkdOw7sb+S2JyZv8u5t09OvKvhNS253dtlmGLapNHWJuIgAFnfXuD/PJppFbnh00Zmvbm78eIqbJBviyVCtUWty8DHa9L3fsPFXr84nUtfl6WabeE+tqcgcHgvzdux7jhUNZuDVR8tjbbsuoPc/wRfU9wn/W99HFZvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735722539; c=relaxed/relaxed;
	bh=oYoas61OhAYOoieOqXCEGrdvSIwZzmKeua7845ofkRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HRZfVav9n3TiWfp7O3ntFhE0P7JaGCUlnL6H7C4TjnP6CgqAyrFTS53hezkpkpPqkJNtmNM2eBh7GJhC0u+fcYN6mwXtYN80NsK/5++Y5lweLe0bBZ+hE3TNWVjk1SG5dmY2xZmjybno62LLaLwUI9nVnRRI5p2KTxWimATWm6WFWPhlCC2p1skXbIHggb8jF/VXcsW2zHlS3MbhHnQW6xNBSvV0QfyoxLhkhj7GiFi5K7U8yhxiOLHxow9eK87el/RG826isfxNIu9dGPDGXRLlrOA63btcajHCN3Es/DwfoMSOPBmhQXKCD3fzZbPcal3TTZ4v138RJ6lAeJAYEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OcV/MApP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OcV/MApP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNPCZ2J9Qz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jan 2025 20:08:58 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5014iCup024354;
	Wed, 1 Jan 2025 09:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=oYoas6
	1OhAYOoieOqXCEGrdvSIwZzmKeua7845ofkRw=; b=OcV/MApP+X6A6aOUls2sAb
	ilvI3+YvvpcgjfwiM3Voehd7fOJdoxip8JN3H3x/wYTYNfDgHRJKWqnbsEWTMG7o
	sR2aZNoRCOwRBqfdDp0ODhZSbOOETpOdLcCTB/Req4TYcyHyWb2CPzU/i7jhyXQP
	N44rw4kb2lAVNohgTi9KdBUb+tNBrh5Fn/nAYt3gLRXN/EquhHjVUiuTwCwQadJ8
	d8S1xDnPr1MlSC4sFDFvF8N3kQ6QQB8WwFuxE8Y+mUpe4jD19JkWhyG7o0xP9nm9
	ce6iS515RG+J64iTra4lwYkRR/ki+e7LmUouDcwDj+NRyGcbnhFCRBuIkJOJnusQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vx6hrrys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:46 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50194sme030394;
	Wed, 1 Jan 2025 09:08:46 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vx6hrryn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5017EseG016711;
	Wed, 1 Jan 2025 09:08:45 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tw5kdj1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:45 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50198hc739518588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jan 2025 09:08:43 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2308E20043;
	Wed,  1 Jan 2025 09:08:43 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C86062004B;
	Wed,  1 Jan 2025 09:08:38 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.115.214])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jan 2025 09:08:38 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, shuah@kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v2 1/3] selftest/powerpc/ptrace/core-pkey: Remove duplicate macros
Date: Wed,  1 Jan 2025 14:38:36 +0530
Message-ID: <173572211261.1875638.17052629553644664859.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241216160257.87252-1-maddy@linux.ibm.com>
References: <20241216160257.87252-1-maddy@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: opcIxYR9v9nmOHoU2v1fY2vME-gYTL-f
X-Proofpoint-GUID: oJiLXkRhD9L1p11bwTdyMOfvRgitffjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=828 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501010077
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 16 Dec 2024 21:32:55 +0530, Madhavan Srinivasan wrote:
> ./powerpc/ptrace/Makefile includes flags.mk. In flags.mk,
> -I$(selfdir)/powerpc/include is always included as part of
> CFLAGS. So it will pick up the "pkeys.h" defined in
> powerpc/include.
> 
> core-pkey.c test has couple of macros defined which
> are part of "pkeys.h" header file. Remove those
> duplicates and include "pkeys.h"
> 
> [...]

Applied to powerpc/next.

[1/3] selftest/powerpc/ptrace/core-pkey: Remove duplicate macros
      https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=026ac4dda8f666f737b375731e30ef8f5698b215 
[2/3] selftest/powerpc/ptrace/ptrace-pkey: Remove duplicate macros
      https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=b0e1b95b1597ad3d87ff91d52f6b67cc9423c31e 
[3/3] selftest/powerpc/ptrace: Cleanup duplicate macro definitions
      https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=65f5038352e8f635fb827f7482f1d08fae4d16bf 

Thanks

