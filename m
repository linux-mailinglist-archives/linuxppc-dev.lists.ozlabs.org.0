Return-Path: <linuxppc-dev+bounces-7893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47EA9662B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 12:41:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zhf1P6BNFz3bsf;
	Tue, 22 Apr 2025 20:41:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745318505;
	cv=none; b=awQf/eDswSAvKO+MSDtcVuIETJ2XNNPRVNjWwJJ2E66olEfzxxNvv6/97ziH6pfWB7ClhAKdf9E+BxDwFtsWD5cUuMFm/VYFw3qjkF2SCUce/tlbmWBZs++17qo9fV2YuiW4CUecBhi+1Rys4WMuJi0stPe0lZfvzcRgnkyAIxh5byUa21thqLdrAV0v84Y7jF1GbcfRP6oWvCj8Mho6mRqAljXd7Wj7yUTLo9QvrEl9xU3ivehzn1zeaRYqKvdUSz7t0XcykC3fn9jGTPQiT3EPkYWmsJTLCVJJfsWyniHoRZRsZGUeUbo/bp3RaCA8p3o2j3qvlgpxtc7KarrVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745318505; c=relaxed/relaxed;
	bh=2vBVjmEn5NTa769mIj8GmdhBQLhe0x76SUXx/x1ydTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuBFJ4PzbPpoxU9Mv4TFQF2R7jl6gJFtB42FCLmk71p4+CF4fhmfg1ZjSxS4rgUoIxQP8+DErbf2I/TL5ooaAgmYsDEYM715jW3cN8u54HKrFZuq8DxzdFNK90Zcks/Q6oyWNt6hFJFrJ0sIwXp8ljIjkIH8MIZyH2+Is06vuBm5lntm6SIGRot8IeXUO9Jo9YhxNioVgOaO94EcyFPFD4NqIgfIiIUHO+3Y0uCldlXlMRPziVx7aknwoY4o7tT7pMhrF3ViH6Zy/zP0m0nXaCxa+/1HAGnHzHsJqnWKObt9xhTvL8O4ez+zJflXVVLqXMA0vMTTTge6GoiB7qNkaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KCWe+JyP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KCWe+JyP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zhf1P1Lb0z2yhY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 20:41:45 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M87Pmb014494;
	Tue, 22 Apr 2025 10:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=2vBVjmEn5NTa769mIj8GmdhBQLhe0x
	76SUXx/x1ydTU=; b=KCWe+JyPXZxPGEeoK+BOdCrNbtsxJb4V9z9BQcp5BUBqYV
	37VU8eW6wcULQQ+47XX+foEl2LJOpLzDYicKyXGMbmxSsxY/RjYRpPLwU4gd3xgo
	ogftcFUpG4M5EExmKa9VSwegOZZCOthSnTL5tZzw/QsNni+y3b8rifq7WaNGiCQj
	j+1TNRLnCGFaeE7g7IFvUokadm9sHdkM1DTa5ZNw8G70CZ6275/qaUa7U1Maq/WW
	0YeViG35vFRhe3g8H8uT8aYQmfUlyhrkgc3/p524PO1EQhqkXTZkl6383xOstWCu
	KymJAGFH+gNa/NTzBcefpqMr3IQs8YYjNit6pTwg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4667ap0qvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 10:41:40 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7afmQ015373;
	Tue, 22 Apr 2025 10:41:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464qnkjbg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 10:41:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MAfbYl59376010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 10:41:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39AF620043;
	Tue, 22 Apr 2025 10:41:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8204220040;
	Tue, 22 Apr 2025 10:41:36 +0000 (GMT)
Received: from osiris (unknown [9.87.146.239])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 22 Apr 2025 10:41:36 +0000 (GMT)
Date: Tue, 22 Apr 2025 12:41:35 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        x86@kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 10/13] crypto: s390 - move library functions to
 arch/s390/lib/crypto/
Message-ID: <20250422104135.24507Bb1-hca@linux.ibm.com>
References: <20250420192609.295075-1-ebiggers@kernel.org>
 <20250420192609.295075-11-ebiggers@kernel.org>
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
In-Reply-To: <20250420192609.295075-11-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=M5pNKzws c=1 sm=1 tr=0 ts=68077264 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8 a=EBXGqsIhDzg0S2J9wWsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: FKpmuf9m7FggGnatUI-UByB2a5PrqXcD
X-Proofpoint-GUID: FKpmuf9m7FggGnatUI-UByB2a5PrqXcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=709
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220079
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 20, 2025 at 12:26:06PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Continue disentangling the crypto library functions from the generic
> crypto infrastructure by moving the s390 ChaCha library functions into a
> new directory arch/s390/lib/crypto/ that does not depend on CRYPTO.
> This mirrors the distinction between crypto/ and lib/crypto/.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/s390/crypto/Kconfig                 | 6 ------
>  arch/s390/crypto/Makefile                | 3 ---
>  arch/s390/lib/Makefile                   | 1 +
>  arch/s390/lib/crypto/Kconfig             | 7 +++++++
>  arch/s390/lib/crypto/Makefile            | 4 ++++
>  arch/s390/{ => lib}/crypto/chacha-glue.c | 0
>  arch/s390/{ => lib}/crypto/chacha-s390.S | 0
>  arch/s390/{ => lib}/crypto/chacha-s390.h | 0
>  lib/crypto/Kconfig                       | 3 +++
>  9 files changed, 15 insertions(+), 9 deletions(-)
>  create mode 100644 arch/s390/lib/crypto/Kconfig
>  create mode 100644 arch/s390/lib/crypto/Makefile
>  rename arch/s390/{ => lib}/crypto/chacha-glue.c (100%)
>  rename arch/s390/{ => lib}/crypto/chacha-s390.S (100%)
>  rename arch/s390/{ => lib}/crypto/chacha-s390.h (100%)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

