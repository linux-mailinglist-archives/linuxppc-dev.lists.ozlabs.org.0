Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11E694734
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 14:40:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFlnt1WlVz3cBq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 00:40:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Viv5tgtz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Viv5tgtz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFlms3s5gz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 00:39:09 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31DD0o4F021542;
	Mon, 13 Feb 2023 13:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=rXYPVNMng/pkBrvcgKdcpNDqHi0adQXf5x4aEJz4zPs=;
 b=Viv5tgtzUfG98HNFEn1DsIi5jox3+JwEXl6Q4VeRoconUPryt0YlMiXjvWnd3F7xY4GG
 6HYhKgZUkrIy5tNS7DUXh1n7RfetiYVaeXTEr8jdcWcDmT5+VEHPwegm93phxMD3w5J0
 z22t9+O8VNVyWSPcGCcwxYZ0QZ5qK4mRmlEL/6q1kZ3rQP0/2OBjfSJwvhsAUkknvx9Y
 7ds07Op1dewCtMcC+6gxvPTgnbEF/dMfpIQbixIVr668IaZQdHWAO6Yc0Mc15fK9idjB
 z0zl/ztVgotlIF1XCpc+lerFJRo9BGsa8F01RbTbDshex9UMML9mq4rNoN8n6fMySWt1 hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqnqfgye9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 13:38:59 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DD2SeQ003261;
	Mon, 13 Feb 2023 13:38:58 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqnqfgydu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 13:38:58 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DD6n1U020625;
	Mon, 13 Feb 2023 13:38:57 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3np2n6tp3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 13:38:57 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31DDcuqU41746758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Feb 2023 13:38:56 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D6D558065;
	Mon, 13 Feb 2023 13:38:56 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8D8058056;
	Mon, 13 Feb 2023 13:38:55 +0000 (GMT)
Received: from localhost (unknown [9.211.96.43])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Feb 2023 13:38:55 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy
 <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/machdep: warn when machine_is() used too early
In-Reply-To: <87sff9vo7j.fsf@mpe.ellerman.id.au>
References: <20230210-warn-on-machine-is-before-probe-machine-v1-1-f0cba57125fb@linux.ibm.com>
 <53a1e4be-e41a-8cb7-c617-b473a2a01b9d@csgroup.eu>
 <87sff9vo7j.fsf@mpe.ellerman.id.au>
Date: Mon, 13 Feb 2023 07:38:55 -0600
Message-ID: <87lel1adn4.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: McPigTst-UpDaRDg90leT3WsSNXA8jBb
X-Proofpoint-ORIG-GUID: PxTbyA61-766dcE-ePZdUKwfKAbFODoc
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130122
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

Michael Ellerman <mpe@ellerman.id.au> writes:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 11/02/2023 =C3=A0 00:56, Nathan Lynch via B4 Submission Endpoint a =
=C3=A9crit=C2=A0:
>>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>>=20
>>> machine_is() can't provide correct results before probe_machine() has
>>> run. Warn when it's used too early in boot.
>>>=20
>>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>>> ---
>>> Prompted by my attempts to do some pseries-specific setup during
>>> rtas_initialize() and being puzzled for a while that it wasn't
>>> working.
>>> ---
>>>   arch/powerpc/include/asm/machdep.h | 12 +++++++-----
>>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>>=20
>>> diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/=
asm/machdep.h
>>> index 378b8d5836a7..8c0a799d18cd 100644
>>> --- a/arch/powerpc/include/asm/machdep.h
>>> +++ b/arch/powerpc/include/asm/machdep.h
>>> @@ -220,11 +220,13 @@ extern struct machdep_calls *machine_id;
>>>   	EXPORT_SYMBOL(mach_##name);				\
>>>   	struct machdep_calls mach_##name __machine_desc =3D
>>>=20=20=20
>>> -#define machine_is(name) \
>>> -	({ \
>>> -		extern struct machdep_calls mach_##name \
>>> -			__attribute__((weak));		 \
>>> -		machine_id =3D=3D &mach_##name; \
>>> +#define machine_is(name)                                            \
>>> +	({                                                          \
>>> +		extern struct machdep_calls mach_##name             \
>>> +			__attribute__((weak));                      \
>>> +		WARN(!machine_id,                                   \
>>> +		     "machine_is() called before probe_machine()"); \
>>
>> Is a WARN() really necessary ? WARN() is less optimised than WARN_ON(),=
=20
>> especially on PPC64.
>>
>> This should never ever happen so a WARN_ON(!machine_id) should be=20
>> enough, the developper that hits it is able to go to the given file:line=
=20
>> and understand what happened.
>
> Yeah I agree, WARN_ON() should be sufficient here, and should generate
> slightly better code. We have > 100 uses of machine_is(), so keeping
> each small is desirable.

Sure, I'll change it.
