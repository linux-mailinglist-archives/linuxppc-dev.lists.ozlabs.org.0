Return-Path: <linuxppc-dev+bounces-9372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C99AD9CC9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jun 2025 15:00:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKGZQ4QP4z2xS2;
	Sat, 14 Jun 2025 22:59:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749905998;
	cv=none; b=Rv8RnhC+TDI1UpqgoSw6ediqL1b68TWRJBJYvwChdemYReS+Z/ALoZ8lv/rol/a9GAAzjVi5wVYIcaXKgWWJCtAZCxknyR/aRgIkbmMXVoZE/CQ/VZfcPWSIvuwNUoKOSuE9lhc4xpzUrtjvZ+YlgH7uu/bUpxO4Etx0fbSxNaFoQ3YrS/2viCH97JKKo+jnYwLQUf1Wf+1zTSHzD6TE3JphGZ28agbGx0feR5uukoNMkscwXknUOg4tbO9HQuFN4VXXijFtwNB7Mv4X0K/bKqDil+CfvqwakOU39tFvWG2jurmlgXctNe4Q3dL/enMA3TkZc9hJ6p6VaUGrbXceOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749905998; c=relaxed/relaxed;
	bh=GWf9Q8fhQIaK2IkjdJfjOiEYmA7IMxs/QoLebp9mL84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5MCEXE7YfJ0KBoS1lfWn/zFPixEGdxAC56Kg4tLrC9FEpNmXGGKKMtS8l4ihlOGifOo6aS87hnp6lJmPV1ItMEo4uatNSWbEAQJ1z2vf76T5inQ60m8Jn9wLboBcYZVwJlPkXbh2GMje8FWE1vXtSZRx13UKet27KF9a4qNd/x6Jjqz0MPk2QzRN6zbngAw6Lq/a9/rQj9D47rwT2PBED7ru0yGm5GO+X39j3Atofs9/joFGx/WFtMLkhIZjoyU85Uj0EoJkhuuIApvAt0LxO4jMy/JjcFKGvKPfJe0QZrqzWfbZhrRG5Cby0NvoCyMMMfCJPuBGb8dtQUcN0+lXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HfOEjmIA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HfOEjmIA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKGZN67DDz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 22:59:55 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EASOqZ013764;
	Sat, 14 Jun 2025 12:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=GWf9Q8fhQIaK2IkjdJfjOiEYmA7IMx
	s/QoLebp9mL84=; b=HfOEjmIABRPfZRM5N68UxC93NaUpOnZuFMdKHk7oL3/8/v
	MEYbngBORYsLrxpKAV1Xd66apdLIWuxMX7P02e9oDJ/7He8jki3MILn40BAHpmcm
	QBvpiDoDfl2iQCNeVn7fWH9oS5a+65FaYln0d8oQAZTgNKkoPr+PTSaeBwxGIlGX
	X+5FI3i6a4Pa1sNg+9tYytF987xboS+24DHeCchFh4LhznrWke+haxhbA68lRoYV
	p+OolePLs4vLc2654GR1VL33+c0hCEtqLrVenzSG4aq3kJhP2jFqSFJQPgCdEc5S
	1gyBRDHqkZsZjN9feEXyKYe6H2VQoKf7+5Q34czg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 478ygmssfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jun 2025 12:59:42 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55E7j8dQ015006;
	Sat, 14 Jun 2025 12:59:41 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4750rpprqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jun 2025 12:59:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55ECxd9q17367540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Jun 2025 12:59:39 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DC2A20043;
	Sat, 14 Jun 2025 12:59:39 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AAA420040;
	Sat, 14 Jun 2025 12:59:38 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.87.143.160])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 14 Jun 2025 12:59:38 +0000 (GMT)
Date: Sat, 14 Jun 2025 14:59:36 +0200
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
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <aE1yOG2JhS86XsrK@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250607200454.73587-1-ebiggers@kernel.org>
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
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDEwNyBTYWx0ZWRfX/gPO7RlVoHIq H3zfnrZ9eeNrf1eNS+pQ7Q+72lGui2nOL/FAAW3VH367zdi2lxWx2zCUw4/9+LPZ5ySP5B8gVBB BTxtRduhv73wv65mkAIr/Cd0zpNyfEXVO/UKXhUZIlsw1JOSkK3klGpVP70ojFxXrlmXy8Pm8Ci
 fLa/ScaQZWnpdG8VK+ILf4YcLOPNr9Q2oMIGqCxM0D1RXBeOAvP1UgOeMal0Gm9FATsENBOTOnQ zA8EssuGDPn/O87HU7ArmLEIL4EK0eYH9XNiW/Ifv1aGzDgFh5Tdh+cYcoVd2O2JrS7SXTtQ4Zs N0pj3VnbilN/6ECoCV/zklRcgrjwh85j5Tl2OrwWpNeTegUWbK8Ck2da7OADC7W6OZO23vWv5JV
 EvdxAyj+GdEOusaEWkZvk/HhuHFYj6TZ698WtgsSTAlLaJPRavGiQUR9nMbxADwS7TJ9VjaS
X-Authority-Analysis: v=2.4 cv=fYSty1QF c=1 sm=1 tr=0 ts=684d723e cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=CxYdweyBhWEn_dVdmv8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: MOyPwlTHSYAIS_-mVBTJ8AD1_k4DNQqq
X-Proofpoint-GUID: MOyPwlTHSYAIS_-mVBTJ8AD1_k4DNQqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=422 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140107
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jun 07, 2025 at 01:04:42PM -0700, Eric Biggers wrote:

Hi Eric,

> This series is also available at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git lib-crc-arch-v2
...

I tried git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-next

With s390 debug_defconfig It causes this:

alg: hash: skipping comparison tests for crc32c-s390 because crc32c-generic is unavailable

No other alg complains. Is it expected?

Thanks!


