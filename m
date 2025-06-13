Return-Path: <linuxppc-dev+bounces-9355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA7FAD9251
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 18:02:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJkfz2Lyyz2yb9;
	Sat, 14 Jun 2025 02:02:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749830523;
	cv=none; b=fPuOSMleFsNyPpTkh7y4KlT/scGgFXZt8szgN5iBbLpKPQueZsWgTRuiYfpofS8yuDcTxEsLvZH1OqtaYKoZMzcJSmDSHT58yhLhw3Yj1JGOTTRs8/6HJVsyYQYDtWV5vBpluJMwVYWpAKbPcrAAomqAbFtDDVi6AsMAkU0mDw+HhCmCIhsmefOOMkSK5+OH1Xm4p+r62Xg63m6chqDxcSwNAZ/WAoSfsVKKgC9TlG8uXQWG3XM0C7HE3w/Krhtpdpf8B5vFttLnmDyb6ti6VHYbeDzZJUjv6fAobedD74Ld0a2B38Fhke6NXYBHkPirSfpKMSA6lIm8ZoIxBP7Nhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749830523; c=relaxed/relaxed;
	bh=dxMSfWlJLSP1Q2CznlmbgSk8Q0tBnIErVGASW4hTcD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2lqRhOeMkImc56kmzGxE8A369HBuyGMGd9ajfLAxxSl4y6dGbXNtahztDpjor6Ol157U4AmPHgBY84fQw5+6jI0/IvEI+Mw4YbHaxhLxuobKzCEGaLP+0jsFEmLJPfZ6DVI1AV/JvH8ZQjCc/rNnsWGl5oQ+Mmy80eBST4if+XQGYNPooXbmsOwxNVKVvfjS1GoAZooQaRohqCXL194ksl1Nr0pD1GkpjqIcMRxtg9zw4c8wZe35MlLycOHvj4fJ/HowFnO34JMFAPE1WH2hpkBNiZSY6P5xmcZ4X+ni1Tabr+UD4LxBG/8HTn+HryrYup6pLBzASevBztD8vPSjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zhfihg3Q; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zhfihg3Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJkfy37gNz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 02:02:01 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DATE0P029060;
	Fri, 13 Jun 2025 16:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=dxMSfWlJLSP1Q2CznlmbgSk8Q0tBnI
	ErVGASW4hTcD0=; b=Zhfihg3QYV80iCtJFIZNXzwNsO28/CBzBPA1NW4+cP5VWr
	k5l0f/92cmSa5uH4HyGSN7MW6sSZu3gD2JREmvkY9IWiDksFl/haBc28Yev1eh2p
	fR3cqw2RD+tVrXIr7ijzmVyteuDmhjWOR5YkS2N2qTSLKs3rs5KGToPoP9lOHn28
	Zc0+P608Mn4Oofwq9OObNNP0q5WFKuFHs7VgiBgMYGALGpI5XLkpWYhrNGGVAIJg
	CsvXGDatoWJVdD4D+XIN/bR1Z2kVnng6dv251wWZwQ5XqU8LCwiGj9YrhbE5Yqqs
	c0WIsVuRjG1it6BmiiXjCc1Dtc3+1matXW8Zfx8g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474dv8225n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 16:01:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55DFim5F019573;
	Fri, 13 Jun 2025 16:01:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4752f2tec9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 16:01:45 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55DG1irx33227464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 16:01:44 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3311620040;
	Fri, 13 Jun 2025 16:01:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4533A20043;
	Fri, 13 Jun 2025 16:01:43 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.111.81.121])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 13 Jun 2025 16:01:43 +0000 (GMT)
Date: Fri, 13 Jun 2025 18:01:41 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 09/12] lib/crc/s390: migrate s390-optimized CRC code
 into lib/crc/
Message-ID: <aExLZaoBCg55rZWJ@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <20250607200454.73587-10-ebiggers@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607200454.73587-10-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oqxWeEseK0qommY-tA52lM8_yDgYBZ8b
X-Proofpoint-GUID: oqxWeEseK0qommY-tA52lM8_yDgYBZ8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDExNSBTYWx0ZWRfX2SFXW8bIydO8 QijS4XnzPyWGv7hUAVPhEsrOB00xE8g+gtnZ5TKc3xm/6m22RAo7pWDdkAUOPF1K6LO6qJEf193 PxiDvBNjb2KojolH7uIG4xIF5aoOVAuWCvsnLPUnzUljRW/4dT+d6yR8TGdRxod4wQd7u9oXLyt
 960X1pKDQBdkA9i2fSfl/dxiyGZuXG6X5RlU4ZS8JXRnJlDwSVv11Yh0NZ3so0jxjPrI/YVMcT2 6jW8eHHK29fMPvF4SWZi3ZgmFX9oL1/VYz01noMZpHwwtcEMmmSVoqdhzy0/dmzN0+Go88V0p57 Weg2+fyKZ+PNLuJB+wyFM7SDDMfP0OJ1UZqOon8sp39ETo2dKYj4MRErDeC122oOtE8J8jykSry
 lFdOt02pLQfhwmo1MyS48Be/xFyI96QJGhA1Fc1zghsJy38d3Mb+b7BSNKN7KQSA+ld6RejI
X-Authority-Analysis: v=2.4 cv=CfMI5Krl c=1 sm=1 tr=0 ts=684c4b6b cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=1XWaLZrsAAAA:8 a=DtkNC_JpMhehFE-g-C8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=403 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130115
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jun 07, 2025 at 01:04:51PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Move the s390-optimized CRC code from arch/s390/lib/crc* into its new
> location in lib/crc/s390/, and wire it up in the new way.  This new way
> of organizing the CRC code eliminates the need to artificially split the
> code for each CRC variant into separate arch and generic modules,
> enabling better inlining and dead code elimination.  For more details,
> see "lib/crc: prepare for arch-optimized code in subdirs of lib/crc/".
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
...

Hi Eric,

With this series I am getting on s390:

alg: hash: skipping comparison tests for crc32c-s390 because crc32c-generic is unavailable

Thanks!

