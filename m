Return-Path: <linuxppc-dev+bounces-15355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7ACFC6BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 08:42:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmKkK4x8Qz2yGL;
	Wed, 07 Jan 2026 18:42:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767771737;
	cv=none; b=lthGy9BSKMNx6mU32qZx1QoMvJy5/twEdJP+vCgarW7G6QGLHyffJOjk/aI5vw/qAU5rChSrm1sWiMSO5EUc23HZWT7iTsCmahZRnz17E9Erb35jfjqEcmnHjm7J4SHAPd57S7SfJRAGfzyjNiwQ3kveJMB78FLF/iMTbVidHUjye51sU3dKJlIe7wISil9lcKhV5mr7X2D+YP2KyCKA+2IG5smsPTUl9FWk4Hju/P6YgM62D+x6NTAIzqnuke6CuNwqTnzgvZx6hRVodfbezbI+K1Ssh0lKzShUz4q4qyetKpjRmY4T7dei3UJXhrByQc4FX+3aLMiJ+Zg3ZkCX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767771737; c=relaxed/relaxed;
	bh=1OZUwcKFlVEp1Wy+fiQBJUjbSRrLG01ise870K7kToI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBzwf2Y0dLQA7fRTwIlpifAHiJ8xKFNGaGqNwOTneXxjHJkZjpdg1LRWnn5uk3yhMoYa593vz2wnIELWD6JvAba/XM3J7WPjuJzEgRXrjDQqB4NRPucSpH3L1hJxuItx4w1rVxJUIxLOugshmsw8ymyDU3ETsfEUBwDj02t69QKfq3hEwnlylfiQA+uNa7YH89b1iwOhBLE+q7bIx3e8kIlgw0S62zVs+9iexNiGRCtm6e/yBkoY4XhPUAdMvzTniqcBjKldkSqL775BSfVCgCSi3WjAzyliOyhySLUNni3f2ZK699KI0ZeimAm+02KI6fyRt0Jv3E8gR8+yqrh12Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bFsXPVWQ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dengler@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bFsXPVWQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dengler@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmKkJ3DRQz2xbQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 18:42:16 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 606JHNFG010621;
	Wed, 7 Jan 2026 07:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1OZUwc
	KFlVEp1Wy+fiQBJUjbSRrLG01ise870K7kToI=; b=bFsXPVWQffGEjgz43qR9SU
	oK9i1gKcGibfmctolAf0Q95wRmnUngUTNHd2zM2G59babPu8XdgILHMZoDz0wTAq
	4eYjSWZgPNgZWVYDTk+OnX/6LCj5+1HiBQ/iP/uakjlCDMjjRGVBsfez5YEDAbXO
	/cxf/ovbbw7QTTH/ZgMhjz10jPo4lJbKXYM40fkI70r7pVtga2xeU1Vi249nCNK4
	KaHEo1JhOt7nZ/TTwFjtbW4SoR59yMc9EOw/EB/PI5a86kvDMKfglBi5kb05SFED
	GVS7bn13G3twfi4Y3S0a7SRsE3R8CbgFviQmZjdfEB1rnMvxqrwaawJSzuiM3WDw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4beshexq7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 07:41:05 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6073cmdh005264;
	Wed, 7 Jan 2026 07:41:05 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bfexk7rkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 07:41:04 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6077f2aR16122176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 07:41:03 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF7732004E;
	Wed,  7 Jan 2026 07:41:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A3312004B;
	Wed,  7 Jan 2026 07:41:02 +0000 (GMT)
Received: from [9.111.198.188] (unknown [9.111.198.188])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jan 2026 07:41:02 +0000 (GMT)
Message-ID: <167cbd49-e0ba-4b1d-a724-e64ab6ee863c@linux.ibm.com>
Date: Wed, 7 Jan 2026 08:41:02 +0100
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
Subject: Re: [PATCH 15/36] lib/crypto: s390/aes: Migrate optimized code into
 library
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org,
        Harald Freudenberger <freude@linux.ibm.com>,
        linux-crypto@vger.kernel.org
References: <20260105051311.1607207-1-ebiggers@kernel.org>
 <20260105051311.1607207-16-ebiggers@kernel.org>
From: Holger Dengler <dengler@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260105051311.1607207-16-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA1NyBTYWx0ZWRfX2Ar3kzLBShn/
 kdRHVYkMALEAtFOLTrFv3UfaLcyHGNcf2FudjUR/NeyXQ7HAsrwQwlYZneMJ2N2uGvAupQRk1e/
 TSguKGdM8P/wi3igdzTYXCbt1TuRtcriMIpKGz1q+34bvm2mFZxURCDAEFZ7ryUhKJA/DdD2MAp
 3o8LQKFDglWsyiT4LMj68s0SN7DVxC4u641BbU+DyD+pblgwJ0jw1Pe5/qmd6ArnP1Z100oAPvL
 a6Add51rNovhsAzGHW4iUYS/l7vtFWxtXxTJVz7G0slY/W7koj28QBNWoTI0rf38mxOrTtj1UCV
 N+zXBL+vzIKjyQNF3RLFspYinN9vgfuVJpQ0nkXy/1ShtyuR4fKH4FNlzq/G6QmdwxV0SdyQavG
 GIgvHZEtzy4g9sk9HKKrGeBGxWK2zEF1eq+89TivB8tIEmzU7X8E2C3eipi9+Bwb9ZDpNNfyMTV
 7YxdoBUyksPo7u0Y7Rw==
X-Proofpoint-GUID: ucJZtlyWTiqD4d7TJcTXL99WK-bHXMG1
X-Proofpoint-ORIG-GUID: ucJZtlyWTiqD4d7TJcTXL99WK-bHXMG1
X-Authority-Analysis: v=2.4 cv=AOkvhdoa c=1 sm=1 tr=0 ts=695e0e11 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=w46-cfdy0MOtRbFV-QQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601070057
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Eric,

first of all: happy New Year! ANd thanks for the series.

On 05/01/2026 06:12, Eric Biggers wrote:
> Implement aes_preparekey_arch(), aes_encrypt_arch(), and 
> aes_decrypt_arch() using the CPACF AES instructions.

I'm not sure, it it makes sense to implement this on s390 at all. The CPACF
instructions cover full modes of operations and are optimized to process more
than one cipher-block-size (*). For single-block operations, the performance
might be worth than using the generic functions. I will look into it and do
some performance tests. If there is a possibility to plug-in to the level
where the modes of operation are implemented, it would make much more sense
for s390.

(*) Yes, it's a bit uncommon, but the CPACF instructions on s390 can process
multiple block with a single instruction call! They are so called long running
instructions.

> Then, remove the superseded "aes-s390" crypto_cipher.
> 
> The result is that both the AES library and crypto_cipher APIs use the 
> CPACF AES instructions, whereas previously only crypto_cipher did (and it 
> wasn't enabled by default, which this commit fixes as well).
> 
> Note that this preserves the optimization where the AES key is stored in 
> raw form rather than expanded form.  CPACF just takes the raw key.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org> --- arch/s390/crypto/

-- Mit freundlichen Grüßen / Kind regards
Holger Dengler
--
IBM Systems, Linux on IBM Z Development
dengler@linux.ibm.com


