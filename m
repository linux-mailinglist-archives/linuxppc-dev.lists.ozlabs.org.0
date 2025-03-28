Return-Path: <linuxppc-dev+bounces-7369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 786E3A74907
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 12:14:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPHxC0G8rz2yfX;
	Fri, 28 Mar 2025 22:14:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743160494;
	cv=none; b=D1/2ZQMRiN3C8Xc/tUz9p3IlLUqGkrm2oWvOkHAbe4WrjA0tNnpgB58rUapTkGAM/qd7derGZsaoP9w/fsPICJNsYzT7SU3xU2Aqg3qj0DETKkj5dDm+1AiweIR/vbgCUevzIZ+BmvLO31I0Mt1j7GM7QwJql3PatP9voFFZ/O5OwdjaVZ7LJAQ/KRb6C6r3MfTyh080gk2AYLcLYJrbONm0+QcRt8bH0p7iS/Yt/m4mjL8EZByaDfm5Z7b5rB/agWbmdY0gHBC44ObEuiimTT/TRSt8Rw6BlnVHwpCO21ksuYB4b+k/Dhp+6obYlmxsBJymio9sd7vRSKPUBO6WcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743160494; c=relaxed/relaxed;
	bh=tBdNgCTiH0JzSJs0sxReFO7ivUNoEUckmfZfBH5iVow=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f4qDM/y6+xmhSEWEt6lPBWJt8UOfN/MSDBWxFtPJFTgAg0JDcM2A9DvO58DOG5Q7wU06ES5fMfOWgqUE/0dliUjZxiVAibTNnFuCs/Ff6a9vHO8po00R2+l4j6u618DH9c5cRWLS5/rnDA4L6ECyAZUxGel45YsNXsHTixhAbW8TKqJQ6ygTgbT9mAzxd0QDItFVXpV6/vISn0Gd+kVPE0/WKt8SG20sDgy9zcaIh5uo1REUoYISF3/XtWvKUdISd/t4s4DSb9M6bpAae/DvIHTtlQQztSdcssWLWNk69mKsTaecifSAZqU87Z9p4LCA4DJfdg9H0RUOeg9zossntQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cuDgzPjV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cuDgzPjV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPHx96rs8z2yfN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 22:14:53 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S3IOuH001394;
	Fri, 28 Mar 2025 11:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tBdNgC
	TiH0JzSJs0sxReFO7ivUNoEUckmfZfBH5iVow=; b=cuDgzPjVYpV2Z8Dn7zTb+B
	nU1DDJao0o9XjzDfcOvIA7SUN2UNhuqvdE3bo7mg6Aq0ZU4+n9mIoZ9HbM3gl4Db
	9zu9zmgOIjGTtWdoLrWXWM+ZqIYyQTV2zXd3NnWNWM4Q3ikkGsi1PXu7zbO+bVyn
	PZT7IMyZokLm75gi9NWwCDp8Ag626nl3dIvNrngOTm7zBp3hy+JPJqRSSl6zMVJ0
	wB4OXVAzufJy7ArQ2iVx6zBq6RILqO2n4l8SzddJKsb10tUuo0Hqntv9DvRpXAge
	1zcjvUzOCKz9xU45wI9dzkEjgpOHgs5A8Ki+nETpUvjr+TLXF4SQXEHPFsCgjsIw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45naux4e6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 11:14:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52S8Ewv5025462;
	Fri, 28 Mar 2025 11:14:48 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j7x0j7f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 11:14:47 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52SBEl1630474988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 11:14:47 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2C6658054;
	Fri, 28 Mar 2025 11:14:46 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 540915803F;
	Fri, 28 Mar 2025 11:14:44 +0000 (GMT)
Received: from [9.43.60.59] (unknown [9.43.60.59])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 28 Mar 2025 11:14:43 +0000 (GMT)
Message-ID: <e18df940-bb30-44c9-9384-7325e8d02d25@linux.ibm.com>
Date: Fri, 28 Mar 2025 16:44:41 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [main-line]Build warnings on PowerPC system
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
 <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
 <b5713b0b-a278-424c-8ba3-3aec01454e94@linux.ibm.com>
 <38653c58-a5c4-496f-9b52-e7bc3e447423@linux.ibm.com>
 <516febac-b2ba-48a0-83a4-ab259e972541@linux.ibm.com>
 <b37c7a1a-9ec8-417e-9d9d-adeffe409df8@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <b37c7a1a-9ec8-417e-9d9d-adeffe409df8@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Z3XN_wktqKTys0rekGKUEFQOIFCvRnL8
X-Proofpoint-ORIG-GUID: Z3XN_wktqKTys0rekGKUEFQOIFCvRnL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503280075
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


>>> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
>>> index 1db60fe13802..09ceb5a42d81 100755
>>> --- a/arch/powerpc/boot/wrapper
>>> +++ b/arch/powerpc/boot/wrapper
>>> @@ -235,7 +235,7 @@ fi
>>>   # suppress some warnings in recent ld versions
>>>   nowarn="-z noexecstack"
>>>   if ! ld_is_lld; then
>>> -       if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
>>> +       if [ "$LD_VERSION" -ge "$(echo 2.35 | ld_version)" ]; then
>>>                  nowarn="$nowarn --no-warn-rwx-segments"
>>>          fi
>>>   fi
>> Above change fixes the issue. No warnings observed. Thank you!!
> 
> Take care, this must be a special version of binutils.
> 
> With regular 2.36.1 I get following error:
> 
> $ /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld --version
> GNU ld (GNU Binutils) 2.36.1
> Copyright (C) 2021 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public License version 3 or (at your option) a later version.
> This program has absolutely no warranty.
> 
> $ /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld --no-warn-rwx-segments test.o
> /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: unrecognized option '--no-warn-rwx-segments'
> /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: use the --help option for usage information
> 

Nice catch. Thanks Christophe.

May be we need to handle this special/specific case with an
additional check

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 1db60fe13802..d3779c20e548 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -237,6 +237,8 @@ nowarn="-z noexecstack"
 if ! ld_is_lld; then
        if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
                nowarn="$nowarn --no-warn-rwx-segments"
+        elif [ "$LD_VERSION" -eq "235020000" ]; then
+                nowarn="$nowarn --no-warn-rwx-segments"
        fi
 fi

 
Maddy

