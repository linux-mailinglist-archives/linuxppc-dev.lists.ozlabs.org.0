Return-Path: <linuxppc-dev+bounces-15726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C87D1EA97
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 13:12:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drlP61FBDz2xNT;
	Wed, 14 Jan 2026 23:12:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768392762;
	cv=none; b=RckKtzE9YCFQ7h9ApGW5H+9fEpe5wPB3FaAzdioGx4GmHXlA/qGGy/BWb5EbIwn5HzxyKQaFYQwSejYheQTCBImHXtd4E4DztbwLzkrmnIv1xV0oCgX1U28y5KkQvdBYHD0Oq3aZBd/ppyNjbfUywVvbQOiGCtS67XnQsPVYY5kGNlXA9cNjTThjg483K9wfQKFBZ9I73gyKjKHNn67HGqNiKiJftqgmBriSGBCgnn+FG080WC+e+Okki8TNZFogz3XJF+KW+cmmK7ZP4YKxn4JRbQQcRULykW7lqFPbFhXWxKy08PW2Cf2AolkGJP5QnKX7KC3UlJPvRSvw8AH4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768392762; c=relaxed/relaxed;
	bh=pzHVxvE5ODBHsgsz8pyhe6cG5oMDjzw2x+Um2O9cGO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=faLbklu44sXikvdVVWwiLWs+N4O8u1Np8rrAicj6oBUNFRoxdQPzQJxzNR0LKzObJDNgNXBE8sOTVXQ+KSNp0SZTfB5+rAr9dGCOx9uHL2dYVgjLgPr5kw3fiPn5OW/Tb9ZgWjNdqVC7BxhhjEfyffj3mbfzcCJMK1MF+Je6NL+HAeNdabxvWbfHTC7aMqqFYgYgBKf2jjm7g+8V/mKhF06jTm9ETH1uxv4Bsjlpgu0U7ev2livdmDcgtC2RB3deVQjnYo4esf5kc1hoGlzQkIzai+yMW580GjeODSwm97mgm9dDBDm+cZ8y1SDPNu+BKNe++AgX+Nx7kP4lZIIZIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lMJWfhbE; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dengler@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lMJWfhbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dengler@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drlP44qJqz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 23:12:39 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60E6dduV001269;
	Wed, 14 Jan 2026 12:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pzHVxv
	E5ODBHsgsz8pyhe6cG5oMDjzw2x+Um2O9cGO8=; b=lMJWfhbEbMAC0y/nZY42B/
	5YaagzgIChz+c+hXT+p0sPjrIsQKN01YUhffjjGLx0tcgLpD555fPceEiis/cMPo
	Ud+G/Q9qOY9L/BVKtJsa6PM7nPLQ2li2e5HZ1Fq0/wc1cTTUI/2bgTGdegdjgLMg
	zr8PcN7jyW7myFFQBc+mnSiZIqK3UBp2rwlFjaGbBtFtH75Enu8vC2GfCCWGS/lt
	IDWXQCvJxHqU4aNYABYn2I68yeuDhL+ER6cPDB/3djfxAenBiZERQZim3y2zwN62
	Q+vsqMpVm+LV40sb9OoEMQXKU2l8r41K+Yb0TalBh3Lydh2cRDmoTWd1RStYZX+Q
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkc6h91dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 12:12:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60E8Y3X7031269;
	Wed, 14 Jan 2026 12:12:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3t1sjyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 12:12:22 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60ECCLDO44564742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jan 2026 12:12:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3811E20043;
	Wed, 14 Jan 2026 12:12:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E59C620040;
	Wed, 14 Jan 2026 12:12:20 +0000 (GMT)
Received: from [9.111.193.9] (unknown [9.111.193.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Jan 2026 12:12:20 +0000 (GMT)
Message-ID: <f31a9a3f-ec9a-44e1-85ae-c0e0391ff0fc@linux.ibm.com>
Date: Wed, 14 Jan 2026 13:12:20 +0100
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
 <167cbd49-e0ba-4b1d-a724-e64ab6ee863c@linux.ibm.com>
 <20260107203458.GA2200@quark>
From: Holger Dengler <dengler@linux.ibm.com>
Content-Language: de-DE
In-Reply-To: <20260107203458.GA2200@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0JISleG8ICtApQmeXiUHRBk2QsRrV-GL
X-Proofpoint-ORIG-GUID: 0JISleG8ICtApQmeXiUHRBk2QsRrV-GL
X-Authority-Analysis: v=2.4 cv=TaibdBQh c=1 sm=1 tr=0 ts=69678827 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=ZiP0gMQ4KlzIHEEEXi0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA5OCBTYWx0ZWRfX5A+i08xANtZk
 Fe+bZobRq26jJWk184c/YDGBQCyOVVLaLTd7R8/xRa2F7V2TV8Bg+SsBN/h5dn5SfGzmh/wYuz5
 w30g6R0CLgIL1jn/JcBYwYqbkxyZpkEfj16M+S4Affu9dsapUUHK0CVqv+IhI4UyQQIrYFEEB0Z
 3B9m8UtdjEXn9TKdLvp2EtGA7bwr8Alb3lyx1W8g1FvkDLqWZH8pNiHlGy3bUSdyIYaBBzJ6Ksu
 0hIrAA0Vz1lE+E3NgThKtT8Ny5YVbfRradjECMhYhDl9l3y2VMv+nwgy2ECrru+8J9islTgzfan
 nQJxf6ZdIBhgXVxQNe9ke1h11g9yU3MtkbRg2UKG439sbAXH7R/Fn6hMC6skQh5adHr6hOm9T9R
 /VzDc94a0vrwPKWt5A5rwL1Wgu+r0uvCX12NNuyZVH782uArTzidCMQGvU81ZBbcWtx+kFbgpbO
 RBT7auXbzpAuG57LgUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601140098
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07/01/2026 21:34, Eric Biggers wrote:
> On Wed, Jan 07, 2026 at 08:41:02AM +0100, Holger Dengler wrote:
>> Hi Eric,
>>
>> first of all: happy New Year! ANd thanks for the series.
>>
>> On 05/01/2026 06:12, Eric Biggers wrote:
>>> Implement aes_preparekey_arch(), aes_encrypt_arch(), and 
>>> aes_decrypt_arch() using the CPACF AES instructions.
>>
>> I'm not sure, it it makes sense to implement this on s390 at all. The CPACF
>> instructions cover full modes of operations and are  to process more
>> than one cipher-block-size (*). For single-block operations, the performance
>> might be worth than using the generic functions. I will look into it and do
>> some performance tests. If there is a possibility to plug-in to the level
>> where the modes of operation are implemented, it would make much more sense
>> for s390.
>>
>> (*) Yes, it's a bit uncommon, but the CPACF instructions on s390 can process
>> multiple block with a single instruction call! They are so called long running
>> instructions.
> 
> I'm happy to drop the CPACF single-block AES code if it's not
> worthwhile.  I included it only because arch/s390/crypto/ already has
> such code.  Since I'm making it so that the crypto_cipher API simply
> wraps the library API, if this code is not brought into the library it
> will effectively be dropped.  You had pushed back the last time I
> proposed dropping one of the s390 optimizations, even a fairly minor one
> (https://lore.kernel.org/linux-crypto/51fc91b6-3a6e-44f7-ae93-aef0bcb48964@linux.ibm.com/).
> 
> But I have no way to test or benchmark the s390 code myself.  If the
> CPACF single-block AES en/decryption code isn't worthwhile, there's no
> reason to keep it, so I'll remove it.

My assumtion, that the aes single-block-operation operation is slower in CPACF
than in software, seems to be wrong. I did some measurements on different
machines and it turns out, that it is up to ~2x faster doing it in CPACF.

So, sorry for the noise. Please leave your s390 implementation as it is.

PS: I have a simple kunit test for aes (KAT and benchmark for each direction
and key-size). I'll send it in a separate reply. Feel free to pick it.

> As for AES modes, later patchsets are going to introduce
> architecture-optimized AES modes into the library, and the traditional
> crypto API for those modes will similarly be reimplemented on top of it.
> This patchset just focuses on the existing library API for key expansion
> and single block en/decryption as a first step.  (As with the
> traditional API, single block en/decryption is needed as a fallback to
> handle any modes that don't have a standalone implementation.)

Ok. So we'll wait for upcoming patchsets.

-- 
Mit freundlichen Grüßen / Kind regards
Holger Dengler
--
IBM Systems, Linux on IBM Z Development
dengler@linux.ibm.com


