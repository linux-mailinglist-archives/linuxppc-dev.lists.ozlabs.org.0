Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7D87FBF1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 17:22:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dpuRx357;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sfnlx6Z84z3d95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 03:22:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dpuRx357;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sfnl61vRxz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 03:21:21 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASG9gmY026138;
	Tue, 28 Nov 2023 16:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=XCgPeKVfVZAY27MO6wcKdrhgvAV+AxkGCBsi7/v/0ms=;
 b=dpuRx357iSEB27Ln81ZREfvKlypQfDEMp5FhW+yWvW+yxZa84X3pTSAHKUlcBbc2+r8o
 VjHIxBbnpIyKVVELy5MnKNaqfPn2OhfCG2dB/CdlRQ+qFvPZIY37M6F1D+wemVVoEUaF
 wDztrUjTLVOfC1a73QzfgU9DIgfWJQQBnc1IvWLMxH5DMChIIngcnHbAevhC6KcaPuAF
 joWXJoydZz6FixUtVoQiFe9flFdnZaXe4nmz28ls/qqKfEBiODyJ55TWeqOFj+cLhgEF
 uXdo6qaZLEUSa8H4dUVS5/2Yyi6fOHcFDezOTM6h6oCUb4Y6cz1yQxOlhBUmEtUjA3hP 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unkfrre2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 16:21:04 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ASGA0mb027745;
	Tue, 28 Nov 2023 16:21:03 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unkfrre05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 16:21:03 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASFxDbl012208;
	Tue, 28 Nov 2023 16:16:20 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukvrkgpy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 16:16:20 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ASGGIYm4588150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Nov 2023 16:16:19 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D452858052;
	Tue, 28 Nov 2023 16:16:18 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 944285805E;
	Tue, 28 Nov 2023 16:16:18 +0000 (GMT)
Received: from localhost (unknown [9.61.20.55])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Nov 2023 16:16:18 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
        Nathan Lynch via B4
 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 06/13] powerpc/rtas: Serialize firmware activation
 sequences
In-Reply-To: <875y1lev8p.fsf@kernel.org>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-6-b794d8cb8502@linux.ibm.com>
 <874jhglu6x.fsf@kernel.org>
 <87zfyx28rf.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <875y1lev8p.fsf@kernel.org>
Date: Tue, 28 Nov 2023 10:16:17 -0600
Message-ID: <87r0k926r2.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i-rHkknuluw73nxFZH-IQ74_w34IrcZc
X-Proofpoint-ORIG-GUID: ADCbHtMgF6rvX33zu9Pp9qCNQyzmO0ol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_18,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280130
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

"Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org> writes:

> Nathan Lynch <nathanl@linux.ibm.com> writes:
>
>> "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org> writes:
>>> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
>>> writes:
>>>
>>>>
>>>> Use the function lock API to prevent interleaving call sequences of
>>>> the ibm,activate-firmware RTAS function, which typically requires
>>>> multiple calls to complete the update. While the spec does not
>>>> specifically prohibit interleaved sequences, there's almost certainly
>>>> no advantage to allowing them.
>>>>
>>>
>>> Can we document what is the equivalent thing the userspace does?
>>
>> I'm not sure what we would document.
>>
>> As best I can tell, the activate_firmware command in powerpc-utils does
>> not make any effort to protect its use of the ibm,activate-firmware RTAS
>> function. The command is not intended to be run manually and I guess
>> it's relying on the platform's management console to serialize its
>> invocations.
>>
>> drmgr (also from powerpc-utils) has some dead code for LPM that calls
>> ibm,activate-firmware; it should probably be removed. The command uses a
>> lock file to serialize all of its executions.
>>
>> Something that could happen with interleaved ibm,activate-firmware
>> sequences is something like this:
>>
>> 1. Process A initiates an ibm,activate-firmware sequence and receives a
>>    "retry" status (-2/990x).
>> 2. Process B calls ibm,activate-firmware and receives the "done" status
>>    (0), concluding the sequence A began.
>> 3. Process A, unaware of B, calls ibm,activate-firmware again,
>>    inadvertently beginning a new sequence.
>>
>
> So this patch won't protect us against a parallel userspace
> invocation.

It does protect in-kernel sequences from disruption by sys_rtas-based
sequences. Patch 5/13 "Facilitate high-level call sequences" makes it so
sys_rtas-based invocations of ibm,activate-firmware acquire
rtas_ibm_activate_firmware_lock.

> We can add static bool call_in_progress to track the ongoing
> ibm,activate-firmware call from userspace?

We can't reliably maintain any such state in the kernel. A user of
sys_rtas could exit with a sequence in progress, or it could simply
decline to complete a sequence it has initiated for any reason. This is
one of the fundamental problems with directly exposing more complex RTAS
functions to user space.

> My only concern is we are adding locks to protect against parallel
> calls in the kernel, but at the same time, we ignore any userspace
> call regarding the same. We should at least document this if this is
> not important to be fixed.

It's not accurate to say we're ignoring user space calls. Patch 5/13
makes it so that sys_rtas(ibm,activate-firmware) will serialize on the
same lock used here.
