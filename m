Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B48852CF1A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 11:14:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3khM375dz3bcy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 19:14:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FI4OZYOn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FI4OZYOn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3kgP55m8z30MQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 19:13:53 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J91pq4001764;
 Thu, 19 May 2022 09:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=01iFSxjdhwaWazLJtkduIJmgq5LWuokGImG5Wq+Bn2A=;
 b=FI4OZYOnt839qWHZHQom2QKrQJUS5RrRPM+HJOHhRhLX8T1mpx4qLj4W+xXcPgpkUpun
 6RGlwbtgQDHmQxwhv0T1Fedm7T0DnLi7Q9Zaz405oIRb+REJUDjTVDBMCRXoVWhiQj3O
 SNa/vOfAOt3faG6doNyo64QXDbSzFBeuLwg6IJaxkq2CmrhVTwFoY2OFCODP+AF7Sd2l
 t1R1MkWcd5dMCWtuSzFZPtsUl2KWg6gKDCc5jgtNxaEmC07WGGrkOjC+XdW68PQ6CeSI
 aXV90083JvcaPvBrPhrNKK9+1AThQ0VFpSMwaygnKCGnc1DlmIo9I5wiBIeB5I3yrgxf Qw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5jwf0ayj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 09:13:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24J9BtAE005953;
 Thu, 19 May 2022 09:13:44 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3g2429f0g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 09:13:44 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24J9DgRp35062026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 09:13:42 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB1835204F;
 Thu, 19 May 2022 09:13:41 +0000 (GMT)
Received: from localhost (unknown [9.43.24.187])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 72EA05204E;
 Thu, 19 May 2022 09:13:41 +0000 (GMT)
Date: Thu, 19 May 2022 14:43:38 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
To: Andrew Morton <akpm@linux-foundation.org>
References: <20220518181828.645877-1-naveen.n.rao@linux.vnet.ibm.com>
 <20220518134705.7ae186d5419b24d689a38ccc@linux-foundation.org>
In-Reply-To: <20220518134705.7ae186d5419b24d689a38ccc@linux-foundation.org>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1652950421.sq10xtycz9.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gmtnuMw_LuC3SBZrwBQTxa5rgfdcIp6B
X-Proofpoint-ORIG-GUID: gmtnuMw_LuC3SBZrwBQTxa5rgfdcIp6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_01,2022-05-19_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=791 mlxscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205190053
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
Cc: linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org,
 Eric Biederman <ebiederm@xmission.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Morton wrote:
> On Wed, 18 May 2022 23:48:28 +0530 "Naveen N. Rao" <naveen.n.rao@linux.vn=
et.ibm.com> wrote:
>=20
>> Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
>> symbols") [1], binutils (v2.36+) started dropping section symbols that
>> it thought were unused.  This isn't an issue in general, but with
>> kexec_file.c, gcc is placing kexec_arch_apply_relocations[_add] into a
>> separate .text.unlikely section and the section symbol ".text.unlikely"
>> is being dropped. Due to this, recordmcount is unable to find a non-weak
>> symbol in .text.unlikely to generate a relocation record against.
>>=20
>> Address this by dropping the weak attribute from these functions:
>> - arch_kexec_apply_relocations() is not overridden by any architecture
>>   today, so just drop the weak attribute.
>> - arch_kexec_apply_relocations_add() is only overridden by x86 and s390.
>>   Retain the function prototype for those and move the weak
>>   implementation into the header as a static inline for other
>>   architectures.
>>=20
>> ...
>>
>=20
> Sigh.  This patch demonstrates why I like __weak :<
>=20
>> --- a/include/linux/kexec.h
>> +++ b/include/linux/kexec.h
>> @@ -229,6 +225,30 @@ extern int crash_exclude_mem_range(struct crash_mem=
 *mem,
>>  				   unsigned long long mend);
>>  extern int crash_prepare_elf64_headers(struct crash_mem *mem, int kerne=
l_map,
>>  				       void **addr, unsigned long *sz);
>> +
>> +#if defined(CONFIG_X86_64) || defined(CONFIG_S390)
>=20
> Let's avoid listing the architectures here?  Better to add
>=20
> 	select ARCH_HAVE_ARCH_KEXEC_APPLY_RELOCATIONS_ADD
>=20
> to arch/<arch>/Kconfig?

I followed the approach used in commit 6e7b64b9dd6d96 ("elfcore: fix=20
building with clang") since here again, it was overridden on only two=20
architectures. I also wanted to avoid touching the architecture headers=20
so as to make it simpler to backport.

But, as Michael points out, using a #ifdef isn't too much of a change=20
either. I also confirmed that those changes still apply cleanly all the=20
way back to v5.10. I've posted a v2 which takes this approach.

>=20
> Please cc me on any additional work on this.

I've copied you on the v2 patch. Thanks!


- Naveen

