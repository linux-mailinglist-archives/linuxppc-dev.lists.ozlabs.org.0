Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4CD782310
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 07:11:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PBUChxHi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTgYX3R13z3bv6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 15:11:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PBUChxHi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTgXd2CLdz2yKy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 15:10:24 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37L4wHMU021846;
	Mon, 21 Aug 2023 05:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=arN6obsB5z1X5bmBF0j+L5h/b4zc+8NhRDKXN9z16mg=;
 b=PBUChxHi9fmpvP1BHoTvc4ducu4m2Nh08unQFuEeWZtcA/rHrkSfdxHYkN/9gznuJL2O
 w0keKGupauj0D2AVq/jajZV2hzyBhTnco5jbYCL2fhJLToz0NW2CLdx96ItDp/TWHzkF
 uXkUhvn9/qEbDCY7U/yeBMhpOxnKJWmGuxBrjQCGRwDJEcmjdSvcpS+co2DA7SkO8tSQ
 2TUuH6nGMXCAkluWhMknxhssrzhIMIaa5DTYhR12r0YyFOpqqIxb5LOaEzSkbfZhBtGq
 ViN4VeN3er06/C9wLPKMr0mrooky+fOU9WPDVVYhUGyj3LegxgGiVdYrz0cHV0eAooqu mA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sm1c9rdqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 05:10:00 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37L50WAh027258;
	Mon, 21 Aug 2023 05:09:59 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sm1c9rdq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 05:09:59 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37L3MYj4018411;
	Mon, 21 Aug 2023 05:09:58 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sk82sgec6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 05:09:58 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37L59vas8389220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Aug 2023 05:09:57 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1817F20040;
	Mon, 21 Aug 2023 05:09:57 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1CFD20043;
	Mon, 21 Aug 2023 05:09:52 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.51.109])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 21 Aug 2023 05:09:52 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation); Mon, 21 Aug 2023 10:39:51 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Enable generic cpu idle-loop
In-Reply-To: <875y5cwqdb.fsf@mail.lhotse>
References: <20230818050739.827851-1-vaibhav@linux.ibm.com>
 <875y5cwqdb.fsf@mail.lhotse>
Date: Mon, 21 Aug 2023 10:39:51 +0530
Message-ID: <875y59j80w.fsf@vajain21.in.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sehh3jbzZkK2hOKOFBHYgjGE_9waUpYt
X-Proofpoint-ORIG-GUID: J25pHfOH4RGd8_kNhoWGpSr2fiFWeoMR
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-20_15,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=865 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308210047
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Randy Dunlap <rdunlap@infradead.org>, "Steven
 Rostedt \(Google\)" <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>, Daniel Sneddon <daniel.sneddon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for looking at this patch Mpe.

Michael Ellerman <mpe@ellerman.id.au> writes:

> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>> This minor patch enables config option GENERIC_IDLE_POLL_SETUP for arch
>> powerpc. This should add support for kernel param 'nohlt'.
>
> Which is named after an 8086 instruction :), but oh well.
>
Thanks. This is an interesting trivia :)

>> Powerpc kernel also supports another kernel boot-time param called
>> 'powersave' which can also be used to disable all cpu idle-states and
>> forces CPU to an idle-loop similar to what cpu_idle_poll() does. This
>> patch however makes powerpc kernel-parameters better aligned to the
>> generic boot-time parameters.
>
> It would be nice if we could make our powersave=off parameter just
> enable this generic logic.
>
> Have you looked at if that's possible? At a glance it looks like it
> should be, when cpu_idle_force_poll is true do_idle() never calls
> cpuidle_idle_call(), so the cpuidle drivers are never invoked.

Thanks for suggesting this and it looks like a simple fix to arch/idle.c
code. I have posted a v2 with the needed change on the mailing list at
https://lore.kernel.org/all/20230821045928.1350893-1-vaibhav@linux.ibm.com

-- 
Cheers
~ Vaibhav
