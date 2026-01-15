Return-Path: <linuxppc-dev+bounces-15872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4D7D28EAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 23:00:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dscNq6SrWz2yFY;
	Fri, 16 Jan 2026 09:00:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768514427;
	cv=none; b=mj+aIP75U+QLHeLEITzOq6KsmcTr1o/JgaDbNMpXEqaCDqW1KbXlqIr6VtJ7qWa2f1k3A5YQxmDgFq6ITB3kcfgCuYVvEQExJ/sKqDPOIkDgfH6IO/tNEjZloClH540I6QDtt/DgGzjRv8I0s3JSraTST37LpiK+gPshq155O8iR28zQrQ84fowtcmCvZvviY2zQRW0WUWsADeRNpWaF4EsGAyIwYT5CgSsYOoZ3gFVcQswd+AN8fms4QLX2zMCdtmRZwtGY9RzGUr5kbF+ks3rBBCsRWGERYRakinhZhrj0xouKE9i6s89Y9o9uBxGt3GxKzQja5r6eYFDsIhO3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768514427; c=relaxed/relaxed;
	bh=fn2sWs9rsdbV0vxeRVrjmzY9BmEC+XTCv1XXSHerLL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YG3Rr/Z4RPFTkyboUlSRiGCtap6x+k2qtVcLBCpA4Ptbk+CKZDNs7OUPBBejJX8Aa4EPPqGMUFCzn2muPZE5RaBrr3XHx0wgG58gyeC7qtGE/l4FyYPZBseFH4ylKsY2iRfWpBnsWUKGVAqCWn3WiWo1cDFM+uhZh/MXMfgo2X4xmccC64leXorrAjwZjRow7JDPIft9iTlth6mdlsGkhl23tweqlXPEzjvDmPONN7NOa7lLHpnViLL5ryr6IMqeUvGre+TWghg4v+tn0WauMSa3GRed4wEAtjT2KHmfkjRPuxtI/B7q41i4GxN2RaDOCnoUBZsF6S8Pq3NmouNgUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UhWJ1/AD; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dengler@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UhWJ1/AD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dengler@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dscNp2WZLz2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 09:00:25 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60FHEjlW023973;
	Thu, 15 Jan 2026 22:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fn2sWs
	9rsdbV0vxeRVrjmzY9BmEC+XTCv1XXSHerLL8=; b=UhWJ1/AD1XNfi2W0E653MX
	rWZ+eYl1wyhuYHNXvRBwfqnQcJBJKmgA74Jf0/kUgkcmeHe/8SH7NJyLR8QZTf5d
	aOOI1LZEJrl6W61v8hK+vC/CK7c0e2LMKgEU9Ofk0672o5Dpv9Vakg9XGuol6vgO
	eARfjFasmy52XTIeOhomSw6z8EYo6++NggXM8w1EXcectmP+2Rlr5b1Xk+Fj8/nU
	pO7pK8Jl2szqf/da1q4WNVGbwL6Jk0mNl/sCr3e1np+rimYa7OBQGJxvLx6X93cg
	iK7o+oUuDtt+GjO1TLdfqg1ufeFKqdeYkot8h9G+F+JjU4cU87CpInckkGyjhN3Q
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6egeye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 22:00:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60FKkCfH014255;
	Thu, 15 Jan 2026 22:00:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm1fyjsh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 22:00:15 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60FM0DTZ60162344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 22:00:13 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37DDF20040;
	Thu, 15 Jan 2026 22:00:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D33902004B;
	Thu, 15 Jan 2026 22:00:12 +0000 (GMT)
Received: from [9.111.195.181] (unknown [9.111.195.181])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jan 2026 22:00:12 +0000 (GMT)
Message-ID: <03ba58e6-0eaf-4970-8d27-ffe29bc9a7bf@linux.ibm.com>
Date: Thu, 15 Jan 2026 23:00:12 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/35] lib/crypto: s390/aes: Migrate optimized code
 into library
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org,
        Harald Freudenberger <freude@linux.ibm.com>,
        linux-crypto@vger.kernel.org
References: <20260112192035.10427-1-ebiggers@kernel.org>
 <20260112192035.10427-16-ebiggers@kernel.org>
From: Holger Dengler <dengler@linux.ibm.com>
Content-Language: de-DE
In-Reply-To: <20260112192035.10427-16-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6p5z8nBCPsT3_rpKVRy3lnJhFN25wKw4
X-Authority-Analysis: v=2.4 cv=LLxrgZW9 c=1 sm=1 tr=0 ts=69696370 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=w4HzK-rsqA_2YikTyBoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3MSBTYWx0ZWRfXz5BoL5J7pcUU
 EZ3HWHibhHjFOAoKQCeCAZQZFMw/rVxT3IT4w9ASJsDdLE0sXatur5m8WX/gRMd2Mvjk9EaFY5D
 C/Y4bvVEpB3VqE2+10CoQfUpEs64m3duyFEDGkeNQ4xeUUr2AEUG0ynVzNXFgKzknUbAS2y45W1
 dA34Ek0N1Un5SPKN09kDdU7nbue+a4UqMMJjlQn3bIyoNUk9mRpfFnYqdetqw7Nw1y7ntYTzKNI
 BcddjFCun4THIVcuAjbj91UfZX3GenM7j++LCuimK57ylm2xCH1S4KQzxPnj6RsL9R2HbSYujVK
 uvRKRDYg4HGrPP/KnsIX8bLXU6I40Het/QKY/mhLxoOshgIjE4/phJIiOKwt/3Rw7wNztuDmfZT
 1Lr8WlCzPTGKSsXxJT+I/p/uJbjtxbpFvRqsk4x7QlvgLbabrSlm0K6nh/BMNn3NUmYgv/OZiLz
 uZY40rcvNmYBRee4FVw==
X-Proofpoint-ORIG-GUID: 6p5z8nBCPsT3_rpKVRy3lnJhFN25wKw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601150171
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/01/2026 20:20, Eric Biggers wrote:
> Implement aes_preparekey_arch(), aes_encrypt_arch(), and
> aes_decrypt_arch() using the CPACF AES instructions.
> 
> Then, remove the superseded "aes-s390" crypto_cipher.
> 
> The result is that both the AES library and crypto_cipher APIs use the
> CPACF AES instructions, whereas previously only crypto_cipher did (and
> it wasn't enabled by default, which this commit fixes as well).
> 
> Note that this preserves the optimization where the AES key is stored in
> raw form rather than expanded form.  CPACF just takes the raw key.
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Thanks!

Tested-by: Holger Dengler <dengler@linux.ibm.com>
Reviewed-by: Holger Dengler <dengler@linux.ibm.com>

-- 
Mit freundlichen Grüßen / Kind regards
Holger Dengler
--
IBM Systems, Linux on IBM Z Development
dengler@linux.ibm.com


