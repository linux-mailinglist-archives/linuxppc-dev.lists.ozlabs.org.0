Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2287F85661F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 15:40:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jsRvp+7k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbHm405Lwz3dWQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 01:40:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jsRvp+7k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bergner@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbHlK5Nxkz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 01:39:41 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FEa0Td022512;
	Thu, 15 Feb 2024 14:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zZurr08+4rCmi2p87VmKajNXUbdSQeh/Ml+DyrXsBJY=;
 b=jsRvp+7kedzUhComLQF4tv0eXIaGM2RShLJ2AHhUnsUehPlEmIrFeKtHeBQz5x8W2Woo
 dszYEPUFXpbSvpkkEnusY9IZnLt8SdUFDybty+7BFnq7nFNLDdij9O5wT7PW4iQxl5wJ
 jp9yj+4qezufi7RtUIuh+N9PUHQvAhD7SEnm1MrDp0apd7Q2iIcNuRqfm7Oe1xGRawf8
 5WOS4yk2pCniZ6WtFpuM1ZfEUvQVLWlTmeWJZNF/J/XymUhEFE6pFgwnQSM3aVuUkoDW
 8x67oTWrjzw2PjJXN/HMdxiPLNqd6u15Aoo4kmmLmLcnPx4If9PYhvsiLs2NhZVS/5JM 8A== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9m1991pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 14:39:32 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FDqAda004297;
	Thu, 15 Feb 2024 14:39:30 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv0ng2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 14:39:30 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FEdR8s24511196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 14:39:29 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 829C658062;
	Thu, 15 Feb 2024 14:39:27 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD1825805A;
	Thu, 15 Feb 2024 14:39:26 +0000 (GMT)
Received: from [9.61.99.202] (unknown [9.61.99.202])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 14:39:26 +0000 (GMT)
Message-ID: <a50cf258-b861-40e5-8ca9-dec7721400ec@linux.ibm.com>
Date: Thu, 15 Feb 2024 08:39:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] uapi/auxvec: Define AT_HWCAP3 and AT_HWCAP4 aux
 vector, entries
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-api@vger.kernel.org,
        Linux-Arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <a406b535-dc55-4856-8ae9-5a063644a1af@linux.ibm.com>
 <aa657f01-7cb1-43f4-947e-173fc8a53f1f@app.fastmail.com>
From: Peter Bergner <bergner@linux.ibm.com>
In-Reply-To: <aa657f01-7cb1-43f4-947e-173fc8a53f1f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: U0zh-cXg3ppxx8BiWtZDI9TVoSkYhrAq
X-Proofpoint-GUID: U0zh-cXg3ppxx8BiWtZDI9TVoSkYhrAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_13,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 mlxlogscore=319
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150117
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>, Nick Piggin <npiggin@au1.ibm.com>, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/15/24 2:16 AM, Arnd Bergmann wrote:
> On Wed, Feb 14, 2024, at 23:34, Peter Bergner wrote:
>> The powerpc toolchain keeps a copy of the HWCAP bit masks in our TCB for fast
>> access by the __builtin_cpu_supports built-in function.  The TCB space for
>> the HWCAP entries - which are created in pairs - is an ABI extension, so
>> waiting to create the space for HWCAP3 and HWCAP4 until we need them is
>> problematical.  Define AT_HWCAP3 and AT_HWCAP4 in the generic uapi header
>> so they can be used in glibc to reserve space in the powerpc TCB for their
>> future use.
>>
>> I scanned through the Linux and GLIBC source codes looking for unused AT_*
>> values and 29 and 30 did not seem to be used, so they are what I went
>> with.  This has received Acked-by's from both GLIBC and Linux kernel
>> developers and no reservations or Nacks from anyone.
>>
>> Arnd, we seem to have consensus on the patch below.  Is this something
>> you could take and apply to your tree? 
>>
> 
> I don't mind taking it, but it may be better to use the
> powerpc tree if that is where it's actually being used.

So this is not a powerpc only patch, but we may be the first arch
to use it.  Szabolcs mentioned that aarch64 was pretty quickly filling
up their AT_HWCAP2 and that they will eventually require using AT_HWCAP3
as well.  If you still think this should go through the powerpc tree,
I can check on that.

Peter


