Return-Path: <linuxppc-dev+bounces-10690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8DB1C454
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 12:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxmpj3p3Qz3bmc;
	Wed,  6 Aug 2025 20:33:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754476397;
	cv=none; b=Ubudt1eTkKmSwRFCINwZnrWvyVXnPq2+cL9GuG1xQi5k0u4343EtLc1fdDkTr747/uGOdtYk+Xbc6y+cFgNP89ufLi4J7odrrCsd/a14EnvuNq4MvojOG69OvxpVDjfXulrGHlyrpzgEdoiLKYrLBSyKuxKDTplMU1NPp981Hk0F4JXdwmjCea3iQ5n4guh6q9EAT5CQzv6RFMMCHMqfkor7gOG91CzZrUj9Dtf+oK8W1ffd2RB5T99MAgD1EfBtyQVmLR4WAD0pl+vRVFVFuXz6pD6tN4No6VrLg8NYHzy+OhDbUsxPLNDYtISWM5WhSlivRYgQ+pvwWVXYUsNifg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754476397; c=relaxed/relaxed;
	bh=3wBoqQwRkSBaQEVLP0xWuNtEXTupVTvuJMqQFfbbBMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ivdk84Oj5RYvSxvY6qc+yDJbfurguYJ4xjs6pqPnFszmRg1M0WPU48Yywc7HWYGACAFFigNngVPA2sEBzj4xUSRUUoS3DjHTiqPrzSJIo/9JLozC9m7P9azf+Z662bKgpGc/bXDUB4oRiGEhCENdfI4JGWSGLcLZDJdmhQnn5Nd6wKcPA8tFerogxRLf7UH4p4+7GZg2p+rZllUeEjPIDymcG8/EwzYyWXLQwJRWgVyMvXuFkBiEQW5bia03yuZbc+DWas2E9NUlIm8j4bAX5AXi3zGABeKQWxW828p+rQgtJvtUvivF4K3XCXCxZrgbdydfrSqTnYwSajWmCQKAoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bXCsUiIU; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bXCsUiIU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxmph1pchz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 20:33:15 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57692NPP018065;
	Wed, 6 Aug 2025 10:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=3wBoqQwRkSBaQEVLP0xWuNtEXTupVT
	vuJMqQFfbbBMk=; b=bXCsUiIUGuNdsnpstSK7KJ+EHWCL6u+flAEgHfLhazaMGZ
	A2cOEBmYWln1FbP2qTEczCBjdPo+RtNzcIMRJ19xPazntSu2S12gUFaaHfuo/nQU
	jHyAcBmYwm3yQi2lpywOWKhy9UgshrQmFDKiqSYdN0lvR6LteIeMno5fOYwy2N+1
	SS8FrDWGFapdZMQYu8BDyoEf+invbVP0dQ13P+dm0meAwlmfJ5hGZ1W3Ffuv22RH
	rVF7zho8Jk2fTvPROq5h3F2/8QA/aNNZQNOFLxnMzJDGjimVoQCGH45+KR3bmLfS
	0wlyA9YB8dI+vXNZ7cjWcVN308jpV5LOdVcXGSzA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq633jar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 10:33:04 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57683Fvx020612;
	Wed, 6 Aug 2025 10:33:04 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48bpwmu5p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 10:33:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 576AX2qq32703150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Aug 2025 10:33:02 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C7912005A;
	Wed,  6 Aug 2025 10:33:02 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7A652004B;
	Wed,  6 Aug 2025 10:33:01 +0000 (GMT)
Received: from osiris (unknown [9.152.212.133])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  6 Aug 2025 10:33:01 +0000 (GMT)
Date: Wed, 6 Aug 2025 12:33:00 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 14/17] s390: Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <20250806103300.11925Cbe-hca@linux.ibm.com>
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-14-kees@kernel.org>
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
In-Reply-To: <20250804164417.1612371-14-kees@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX1ElbkHLwop5M
 nPtrgbB752LU1pfAwNBDgIAJaBFi6LdxUXlVN+CUECGityjOLd34EGE9Toa3cseKpijmOYkbMrT
 aNwZhYK7iA/bCymHo9U7IaM/O7Xot0VGlpwnnhV1aXHyUVrek/1n8npVMb07MiX+K+TDGIg0AO4
 ihzZswvna0t8psGTcbnxJracRM2oTHbAzHtGyMCKd3aNtNi66J9AADNlixjxITc6ZJ7TjnULCHk
 P4T4ObjAhkO8s+SveY8dJN1qu9r4TUmsgwFAOb96zQD69cH4RtCGyQz1GCIcyhMWlhz5kn2Ucc+
 LWbDbC/Jrwgoq+v6/0pZM6yn2Dx13ovRiSUZITmIvPptutFSJZ1mNsE00D5CNG/6vkJ4UDgYu3T
 wIBBzpQWWdbv/iQCNo1U4G1hbBeBXZZlCO1Mqsl7bXq7JJnmf6ZyHAANHSil8agH6h4bvtmd
X-Proofpoint-GUID: eM8kqSdm0FroOEI9WgdEMMtevU6pWRX4
X-Authority-Analysis: v=2.4 cv=PoCTbxM3 c=1 sm=1 tr=0 ts=68932f60 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=La76t7K_3jgqz9qSpcQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: eM8kqSdm0FroOEI9WgdEMMtevU6pWRX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=896 mlxscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508060064
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 09:44:10AM -0700, Kees Cook wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> Add missing __attribute_const__ annotations to S390's implementations of
> ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
> functions that always return the same result for the same input with no
> side effects, making them eligible for compiler optimization.
> 
> Build tested ARCH=s390 defconfig with GCC s390x-linux-gnu 14.2.0.
> 
> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  arch/s390/include/asm/bitops.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

