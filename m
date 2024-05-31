Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 288548D5704
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 02:36:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cWTelCmJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr4172yCQz3fwG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 10:36:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cWTelCmJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vr40M1zCmz3dTB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 10:35:30 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44V0TAQ2001938;
	Fri, 31 May 2024 00:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc : content-type : date
 : from : in-reply-to : message-id : mime-version : references : subject :
 to; s=pp1; bh=Gksg9ASmB4oUKniGsv1oGIGtEURLj504u/+VF+hKbow=;
 b=cWTelCmJPAc6uyIA7jfoRiwqN25cyptudYb8BOqc4zJ/Q+jBgqNH3wVXzZUf0PZetzK7
 GXFMvs3eGf/GDbg1EGzbD8VBMcyxJoDZNlnLW3+4GaRtstSa3nWV8Tv5UExJcEQmSs7d
 GMnEd1oT3OfTKf7Q140d9yo92dR8rvvWagUKUXhIvl0dCZbbzlwV8uRpN1n2+7xoAHqC
 Z07P00z/72dpMOS96CSa+XHEAHLEXwp0dzzNkKmd1jsxq1cvfo5t4ojzcnFyXo4Sg0j6
 az3CKAUxsFaD0J7DM0bk7N0C4duGPNkXL6OCMcHdEaul76ZF4sakBOUx3qpO0h95wzEn rA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yf41dr0xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 00:35:11 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44UM9kad024784;
	Fri, 31 May 2024 00:35:09 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ydphqvwgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 00:35:09 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44V0Z79864029024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 May 2024 00:35:09 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ACD65806C;
	Fri, 31 May 2024 00:35:07 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD1815804B;
	Fri, 31 May 2024 00:35:06 +0000 (GMT)
Received: from localhost (unknown [9.67.129.78])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 May 2024 00:35:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Breno Leitao <leitao@debian.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/kernel: Fix potential spectre v1 in syscall
In-Reply-To: <87wmno2c11.fsf@mail.lhotse>
References: <1534876926-21849-1-git-send-email-leitao@debian.org>
 <baf6af2b-d6e1-4df8-9466-98d19f8c765f@csgroup.eu>
 <ZfAa59Z8njiGUnRW@gmail.com> <874jdb4sj9.fsf@mail.lhotse>
 <875xxj36ke.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <87wmno2c11.fsf@mail.lhotse>
Date: Thu, 30 May 2024 19:35:05 -0500
Message-ID: <87o78m4y4m.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N-IHrn_CQ9ipB2o6vDrFfqGA95DR2fL-
X-Proofpoint-ORIG-GUID: N-IHrn_CQ9ipB2o6vDrFfqGA95DR2fL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_21,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=408
 priorityscore=1501 adultscore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310002
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
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>
>> 1. The patch sanitizes 'nargs' immediately before the call to memset(),
>>    but shouldn't that happen before 'nargs' is used as an input to
>>    copy_from_user()?
>
> I think the reasoning is that there's no way to exploit an out of bounds
> value using copy_from_user(). But it's much easier to reason about if we
> just do the sanitisation up front.
>
>> 2. If 'nargs' needs this treatment, then why wouldn't the user-supplied
>>    'nret' and 'token' need them as well? 'nret' is used to index the
>>    same array as 'nargs'. And at least conceptually, 'token' is used to
>>    index a data structure (xarray) with array-like semantics (to be
>>    fair, this is a relatively recent development and was not the case
>>    when this change was submitted).
>     
> I don't know exactly what smatch looks for when trying to detect these,
> but I suspect it's a plain array access. Not sure why it doesn't
> complain about nret, but I think it would be good to sanitise it as
> well.

Agreed. I'm sending a new patch that does this.

> token is different, at least in the above code, because it's not bounds
> checked, so there's no bounds check to bypass.

Right.

> Though maybe there is one inside the rtas lookup code that should be
> masked.

In rtas_function_token()? I think it's OK... the handles passed to it
are always build-time constants that are supposed to be within the
bounds of the function table.
