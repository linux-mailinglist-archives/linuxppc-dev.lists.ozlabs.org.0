Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E147FCA95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 00:10:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IW7arEHy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sfyq46qJQz3cnr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 10:10:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IW7arEHy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sfyp973FBz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 10:09:37 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASMvmni021571;
	Tue, 28 Nov 2023 23:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=pgMS2zHPfQr+8RbP2g9CjVx4yaLpxxiFOl8pwidaoc8=;
 b=IW7arEHyX8l6W7QL/2YXZq4dqPO10lQNbghuNkPmD8FNxI0ShhlZ2qStUfKFaESh6wrG
 8FAWw3mRTnvyvSMGoiEpnGHRLObh6roGIwHeMp8+SZRCbzFyGgB2ky55QkJC5UdUqWHa
 2yLkteSw0uN119DGySBY0A6zqU9Ukk10Ub5OB7hKlAmW9skWbQ7kWJFqdoTPidyizUTJ
 LPnY4aAhV1Qwx3/4x1hWS21y+YgahWBzgvNXXxzcDD7d6g0qydHEgSS4d+FXzMNuKIWS
 Snp1PHh2BshCucRaP932ixbLEf+OzolJnGPIf9jGZEgfGKgu0khZxbGyUhmfAdyFY58v kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unsf8g7k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 23:09:26 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ASN055e026984;
	Tue, 28 Nov 2023 23:09:24 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unsf8g6fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 23:09:22 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASN067Q018258;
	Tue, 28 Nov 2023 23:05:50 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwy1txt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 23:05:50 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ASN5n0147776068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Nov 2023 23:05:49 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B74958087;
	Tue, 28 Nov 2023 23:05:49 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 196E35807B;
	Tue, 28 Nov 2023 23:05:49 +0000 (GMT)
Received: from localhost (unknown [9.61.20.55])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Nov 2023 23:05:49 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Lynch via B4 Relay
 <devnull+nathanl.linux.ibm.com@kernel.org>,
        Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
In-Reply-To: <87sf4p33zg.fsf@mail.lhotse>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
 <87sf4p33zg.fsf@mail.lhotse>
Date: Tue, 28 Nov 2023 17:05:48 -0600
Message-ID: <87jzq11nsj.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OC7wI5wow9QmzvLAD1nXHG7DwF1ho6NW
X-Proofpoint-GUID: 2vh12mXqtCwP1Uy9e-xGcfaUpVVabWHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_24,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxlogscore=934 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280182
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
Cc: tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
> writes:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>
>> On RTAS platforms there is a general restriction that the OS must not
>> enter RTAS on more than one CPU at a time. This low-level
>> serialization requirement is satisfied by holding a spin
>> lock (rtas_lock) across most RTAS function invocations.
> ...
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index 1fc0b3fffdd1..52f2242d0c28 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -581,6 +652,28 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
>>  	return NULL;
>>  }
>>  
>> +static void __rtas_function_lock(struct rtas_function *func)
>> +{
>> +	if (func && func->lock)
>> +		mutex_lock(func->lock);
>> +}
>
> This is obviously going to defeat most static analysis tools.

I guess it's not that obvious to me :-) Is it because the mutex_lock()
is conditional? I'll improve this if it's possible.

> I assume lockdep is OK with it though?

Seems to be, yes.
