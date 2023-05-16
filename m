Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D7D704368
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 04:29:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL0Yc1TsHz3f8s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 12:29:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ADMuoPQ0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ADMuoPQ0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QL0Xj4pGQz3ccg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 12:28:37 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34G2KTuQ017442;
	Tue, 16 May 2023 02:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=93nx4XRXEJ2oChNtCEa/e0ov1XCSgQcqSANY4D7TMk4=;
 b=ADMuoPQ0DPyaGVjH+Du7QX0nqAr+NojVEtLa6yvaOX634PO/9yU1yZU/dsFL4s1E9vdN
 I7vKSJ3MbJ1Dx68ciR1OKRhLbpwIXGdOXVbND2jbmfjegtMBDptFMECXWm7Oa2dyV7st
 xgUxRnZ7DoZua+1TVI8AzXrgzMohYRKLOQfsMgtHgTVFqRxpqY8PdpspzBOk6uFGd/RU
 hV5PTNjLF0N+urJnJoGympnPRbdXt6eQlowBmgqJrpLbuv+oaoOiXjjRX72W04yrgGik
 ZLnkpB2CTHFwx+hM2EazcN/NQgs6TGFvNsyYai4YcGXN75ABMA0Mm67DpgggQQ6/PMJH gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qm0yb04f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 May 2023 02:28:25 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34G2M8HN021431;
	Tue, 16 May 2023 02:28:24 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qm0yb04e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 May 2023 02:28:24 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34G1bEJL012656;
	Tue, 16 May 2023 02:28:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3qj264s4qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 May 2023 02:28:21 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34G2SJAh24707652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 May 2023 02:28:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4C9D20040;
	Tue, 16 May 2023 02:28:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23BEB20043;
	Tue, 16 May 2023 02:28:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 May 2023 02:28:19 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.22.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 824BB602C3;
	Tue, 16 May 2023 12:28:12 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v2 05/11] powerpc: Mark accesses to power_save callback in
 arch_cpu_idle
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CSMM6YE0FGF9.SG52DCRHZ35E@wheely>
Date: Tue, 16 May 2023 12:27:56 +1000
Content-Transfer-Encoding: 7bit
Message-Id: <6DBE2353-ACD4-42E8-9672-C44413FEC09B@linux.ibm.com>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
 <20230510033117.1395895-6-rmclure@linux.ibm.com>
 <CSMM6YE0FGF9.SG52DCRHZ35E@wheely>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IVcH_-DiW8yAeN5N6DfZpSCF9Q999-lI
X-Proofpoint-ORIG-GUID: YnaeZSY7P6TYiCBAL1d7yvhYL3VD5lxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_21,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305160015
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
Cc: gautam@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 15 May 2023, at 3:50 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
> 
> On Wed May 10, 2023 at 1:31 PM AEST, Rohan McLure wrote:
>> The power_save callback can be overwritten by another core at boot time.
>> Specifically, null values will be replaced exactly once with the callback
>> suitable for the particular platform (PowerNV / pseries lpars), making
>> this value a good candidate for __ro_after_init.
>> 
>> Even with this the case, KCSAN sees unmarked reads to the callback
>> variable, and notices that unfortunate compiler reorderings could lead
>> to distinct function pointers being read. In reality this is impossible,
>> so don't instrument at this read.
>> 
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> v2: Mark instances at init where the callback is written to, and
>> data_race() read as there is no capacity for the value to change
>> underneath.
>> ---
>> arch/powerpc/kernel/idle.c | 9 ++++++---
>> 1 file changed, 6 insertions(+), 3 deletions(-)
>> 
>> diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
>> index b1c0418b25c8..43d96c0e3b96 100644
>> --- a/arch/powerpc/kernel/idle.c
>> +++ b/arch/powerpc/kernel/idle.c
>> @@ -35,7 +35,7 @@ EXPORT_SYMBOL(cpuidle_disable);
>> 
>> static int __init powersave_off(char *arg)
>> {
>> - ppc_md.power_save = NULL;
>> + WRITE_ONCE(ppc_md.power_save, NULL);
>> cpuidle_disable = IDLE_POWERSAVE_OFF;
>> return 1;
>> }
> 
> Shouldn't need the WRITE_ONCE if you don't need a READ_ONCE. Does
> data_race work here too? What about the other writers? Does
> KCSAN know it's single threaded in early boot so skips marking,
> but perhaps this comes later? Would be good to have a little
> comment if so.

Apologies, yep I was meant to remove this WRITE_ONCE now that
the read-side has data_race. Sorry for the confusion.

> 
> Thanks,
> Nick
> 
>> @@ -43,10 +43,13 @@ __setup("powersave=off", powersave_off);
>> 
>> void arch_cpu_idle(void)
>> {
>> + /* power_save callback assigned only at init so no data race */
>> + void (*power_save)(void) = data_race(ppc_md.power_save);
>> +
>> ppc64_runlatch_off();
>> 
>> - if (ppc_md.power_save) {
>> - ppc_md.power_save();
>> + if (power_save) {
>> + power_save();
>> /*
>> * Some power_save functions return with
>> * interrupts enabled, some don't.
>> -- 
>> 2.37.2
> 

