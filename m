Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1532869A250
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 00:24:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHrd408RNz3f3V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 10:24:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KSdsfq3u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KSdsfq3u;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHrc46XWPz3cLX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 10:23:48 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31GLJjHQ029572;
	Thu, 16 Feb 2023 23:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=L7FgBZMVcMXv09tsyy00N+GhFc/lk3W0G5pUnLBw+m0=;
 b=KSdsfq3uRyZ2xY9GkbGuDVBcWwGQVk3N7vYsZEFrfESY8XMLaj18mDpI22IkQpuLNJaI
 OSlyg3af06OR62Zvqk+kMq7WB/6sI+3AyFfC4EBYMi50U6JqIZUMN5xxWRLkoytfk1Rr
 frWzVy8s9JDK3yTapjAcwXZTuJN6ayfiV0sYnZzL7EPHP/Uihns4QmZeGydAocUsUuLG
 gEk2MmeNXRsPqJZFbrOH5uwv8ugqtmK2tafiXX75GYv+Cm1kHkw8SqS6qrnRIAvdfds8
 JJnLQNo9AjRqBo5rBf3V+yaY0qojRoJym5WcwqHt61KhNRiZNGIdtUJ8cKNHlN/au57W Xg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsvaajdjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 23:23:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31GJoA6f028428;
	Thu, 16 Feb 2023 23:23:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3np2n6ncvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 23:23:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31GNNb0x49938868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 23:23:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AE1F20043;
	Thu, 16 Feb 2023 23:23:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCB6F20040;
	Thu, 16 Feb 2023 23:23:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Feb 2023 23:23:36 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0BCE4600A5;
	Fri, 17 Feb 2023 10:23:32 +1100 (AEDT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 2/2] powerpc/{32,book3e}: kcsan: Extend KCSAN Support
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <319e4663-2732-4974-5642-f0c1ef98d08a@csgroup.eu>
Date: Fri, 17 Feb 2023 10:23:21 +1100
Message-Id: <9B8ABAF9-22DE-43A6-AADE-9B3165FD3522@linux.ibm.com>
References: <20230216050938.2188488-1-rmclure@linux.ibm.com>
 <20230216050938.2188488-2-rmclure@linux.ibm.com>
 <319e4663-2732-4974-5642-f0c1ef98d08a@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4Of4NNQ_H2ZjhPIYjKVmTcBAwdopbFXR
X-Proofpoint-ORIG-GUID: 4Of4NNQ_H2ZjhPIYjKVmTcBAwdopbFXR
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_16,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160198
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 16 Feb 2023, at 6:14 pm, Christophe Leroy <christophe.leroy@csgroup.eu=
> wrote:
>=20
>=20
>=20
> Le 16/02/2023 =C3=A0 06:09, Rohan McLure a =C3=A9crit :
>> Enable HAVE_ARCH_KCSAN on all powerpc platforms, permitting use of the
>> kernel concurrency sanitiser through the CONFIG_KCSAN_* kconfig options.
>>=20
>> Boots and passes selftests on 32-bit and 64-bit platforms. See
>> documentation in Documentation/dev-tools/kcsan.rst for more information.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> New patch
>> ---
>>  arch/powerpc/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 2c9cdf1d8761..45771448d47a 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -197,7 +197,7 @@ config PPC
>>   select HAVE_ARCH_KASAN if PPC_RADIX_MMU
>>   select HAVE_ARCH_KASAN if PPC_BOOK3E_64
>>   select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
>> - select HAVE_ARCH_KCSAN             if PPC_BOOK3S_64
>> + select HAVE_ARCH_KCSAN
>=20
> So that's a followup of a not yet posted version v5 of the other series ?
> Why not just add patch 1 in that series and have KCSAN for all powerpc=20
> at once ?

So the v3 was accepted upstream, likely to appear in 6.3. This patch series=
 is
just to extend support to other platforms, once kcsan supports us.

Link: https://patchwork.ozlabs.org/project/linuxppc-dev/cover/2023020602180=
1.105268-1-rmclure@linux.ibm.com/

>=20
>>   select HAVE_ARCH_KFENCE if ARCH_SUPPORTS_DEBUG_PAGEALLOC
>>   select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>>   select HAVE_ARCH_KGDB


