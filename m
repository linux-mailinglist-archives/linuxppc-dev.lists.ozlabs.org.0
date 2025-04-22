Return-Path: <linuxppc-dev+bounces-7892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0203EA96625
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 12:41:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zhf164tNCz2ym3;
	Tue, 22 Apr 2025 20:41:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745318490;
	cv=none; b=T3yjm3qrCldh7b8upOmI0K75GnZK1qVZoZXzKEzOicqYLKjmoMJuJQ1/AqzvTvIdEusIjfzzG+tO7qBKitigdpUyEgpw2onFWHzAojY8bZXe7IMty1r6yJ2mCmdeeDY6rlxEAKgNOadxS8CSVhULV74HxszRTSKfzMuXu0iiT7RqUm8EUlDyD+ydqrWPxtSJ4I0gh3VpN8+Nz/Z3xeXiNIC8YaAiT/K6Jf+w/34sCXn2o1ZJp2Se1QD8HUcYnDWCU6KOqZUssNOk2Vhdo/J7BCtsF2HJtdCMvOOH93YaUQJ360it/KabwE+ENzGTQh+3FQH46SagrUwxQJaegDCwvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745318490; c=relaxed/relaxed;
	bh=ro8c0oezTvm8771KKaPZnVmA3AEU40jiYFOCFR9Jw/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YK23pZGSzbbaS/EC4qLlKLqvCAhm+O33bvqyLS7EigjaDvbWkGqBuMueK03E9iz6SrM0VXa5tVRQbLgdQNbnPgVT3tPhlE/EYWbqHzPLESe6CuWyhawomt7JWA68ZtjXJ4qQx63rG33va4S+3OiKZ1C9nm88RnulS9jNGDcnYRwJ2OzaioIEKr6ETRGbalmfoX4/7l4xtZVbvifynGyfZCLimPEaIhIp779bfmCqler30zXWjZZNRnqJakHp6BK2oFgJ+s5VwzNNGscAbayHXVMflSSr0/WEiQALtYG+1+pDatE/44AP7jsjTkOlaY0ZAnELzC43o4WfhzS4exqh3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GFIYQD3j; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GFIYQD3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zhf152J2Kz2yhY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 20:41:28 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MA3xUA026063;
	Tue, 22 Apr 2025 10:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ro8c0oezTvm8771KKaPZnVmA3AEU40
	jiYFOCFR9Jw/c=; b=GFIYQD3jNyV4b1ZIRFmL2QjAYDr4nWfOAo3Evk9/1z7zUw
	i15krz6qP9UFEzaHuv5mkDLKYDpfsVhqBAMaQeieDZBeHJLF9KYEQJph1V1MUccT
	eo8GGlJUxUGUSq77LDGRA9Yq7H1EP/Oe0PxjdugE7nTLqVyeDULRQQnB0yGxuIjC
	AWMUpTFBsI5c3Kad9kOO12WT5GavL7G5d/aVFt+zPtYgmvs55rJwKljPoJErZv0i
	1duIwLCevCnhkp6dqtAwYy+y/DmWvI4Ywr9xrwUmYUQamY7OG7S/OhekEf6q0FLv
	uIKHKR0Jmkoecy6pwQNqH4IPvjE/q44ZSK4TctUA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46691hg5qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 10:41:22 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7FejH015374;
	Tue, 22 Apr 2025 10:41:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464qnkjbfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 10:41:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MAfITR34407024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 10:41:18 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C44E320043;
	Tue, 22 Apr 2025 10:41:18 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E75A20040;
	Tue, 22 Apr 2025 10:41:18 +0000 (GMT)
Received: from osiris (unknown [9.87.146.239])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 22 Apr 2025 10:41:18 +0000 (GMT)
Date: Tue, 22 Apr 2025 12:41:16 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        x86@kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 03/13] crypto: s390 - drop redundant dependencies on
 S390
Message-ID: <20250422104116.24507A7b-hca@linux.ibm.com>
References: <20250420192609.295075-1-ebiggers@kernel.org>
 <20250420192609.295075-4-ebiggers@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420192609.295075-4-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=V7h90fni c=1 sm=1 tr=0 ts=68077252 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=i5JU4SdIdlksGHhJ9uQA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: XSQVzYNRWO4K8dSJKrHUF-rfa72ff6Wp
X-Proofpoint-GUID: XSQVzYNRWO4K8dSJKrHUF-rfa72ff6Wp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 mlxlogscore=535 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220079
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 20, 2025 at 12:25:59PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> arch/s390/crypto/Kconfig is sourced only when CONFIG_S390=y, so there is
> no need for the symbols defined inside it to depend on S390.
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/s390/crypto/Kconfig | 10 ----------
>  1 file changed, 10 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

