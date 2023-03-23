Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B08BE6C6D13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 17:13:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj9Nw4DTwz3f7T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 03:13:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oKkYeaYF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oKkYeaYF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj9Mx2xJwz3cjM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 03:12:13 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NF80lH022777;
	Thu, 23 Mar 2023 16:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=oSJEVLwEKqQwTZPvAIjerxVBtlI2bT9tUq/P1hkllzw=;
 b=oKkYeaYFpdQzukV79DS0LyuS2Vz3Oa1Z+CXoVABqn6mS+ZYa/O+wwUxLoiySZ+SwLpEc
 stZoBW0xdiQ8LMUXUwB3t6jY3gPGxYdeeDo+capF5mbLXlUXr83WclwelOvr0yFzmfww
 INhNaLIUp86bPBD5YzFTSjv6UD3tnxcIkxEQRkCtLDcBmkE/Itfe59n/n+OtdW3BEE/f
 8Q48Wyl6CM1ADUUSk4x7nbAZI+ayc+cB6cN62Rxwt3qqHsqqTHpL2QIFh5wlbEdriPex
 TzNMvKcjR3Fx9yFbNh3FE0Cn41CWtXDw1j/SM6REUr37A1WTn5zub2k5HNkZTcIZa0cB 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pge77tm84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 16:12:02 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32NEVKUs036320;
	Thu, 23 Mar 2023 16:12:02 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pge77tm7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 16:12:02 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32ND8nVD012813;
	Thu, 23 Mar 2023 16:12:01 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x76tds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 16:12:00 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32NGBxhp53674396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 16:11:59 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37C4658062;
	Thu, 23 Mar 2023 16:11:59 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1695D5805D;
	Thu, 23 Mar 2023 16:11:59 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 16:11:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas
	Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 5/8] powerpc/rtas: rename va_rtas_call_unlocked() to
 va_rtas_call()
In-Reply-To: <84edcbaacd87e84997cd77664048799a3f93d169.camel@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-5-010e4416f13f@linux.ibm.com>
 <84edcbaacd87e84997cd77664048799a3f93d169.camel@linux.ibm.com>
Date: Thu, 23 Mar 2023 11:11:58 -0500
Message-ID: <87h6ub78hd.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XuqutOKwDFKnOpofaluIEvXYKAgzoI7r
X-Proofpoint-ORIG-GUID: kuK9mClv2bRC-EwoPnt69zynvp22elSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxlogscore=859
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230118
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Nick Child <nnac123@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:

> On Mon, 2023-03-06 at 15:33 -0600, Nathan Lynch via B4 Relay wrote:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>> 
>> The function name va_rtas_call_unlocked() is confusing: it may be
>> called with or without rtas_lock held. Rename it to va_rtas_call().
>> 
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>
> Not a huge fan of the name, the va_ suggests that the only difference
> between this function and rtas_call() is the varargs handling. Perhaps
> something like __rtas_call()?

I would be more inclined to agree if va_rtas_call() were a public API,
like rtas_call().

But it's not, so the convention you're appealing to shouldn't inform the
expectations of external users of the rtas_* APIs, at least.

__rtas_call() conveys strictly less information than va_rtas_call()
IMO. Most functions in the kernel that take a va_list have a "v" worked
into their name somehow.
