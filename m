Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E867414DA4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 18:02:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF32Y6SHvz30BM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 02:01:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ee6ogOXS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ee6ogOXS; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF31q3s9dz2xb2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 02:01:19 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18MFZNfx023517
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 12:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=xiyUlFOvIVIC68M+50LzNxkaTNAACiPJRqbDqOdbZi8=;
 b=Ee6ogOXS7ECGAvS0VFmHjyTngjNhOLiW9VerBuzITFuyLC/CQY2q9FAFrSJKuYbUFSAj
 7rCWqU+SD0Oz4HJx5tbGnB0HHXOj+wD+7A30uzA+JJWh5XmmeycN3bGouiCvv2vw2doF
 Mj7MTVlEaV9vUT5NxawdAKJ4bi3sPgKLk8qNjuueeB1H1kofIspmvQ021SP9tsvEfLsJ
 HqEEKm0NhxWJr9d+J1Oj0HWDo9BscLagtBI7reDOC4D6c7ZXK2fLO+zpLa1daeTtRdg1
 d8tMEm4upm/og/Hvl07xMYN5LTiQg/oHIE0LJ1sqFrJ8CZPe5nHkXXodYOXEscu2zTH4 rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b878x0mjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 12:01:15 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18MFee2B009366
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 12:01:14 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b878x0mj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 12:01:14 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18MFlqal001389;
 Wed, 22 Sep 2021 16:01:14 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3b7q6q9nfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 16:01:14 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18MG1DIA22020426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 16:01:13 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04DDE6A05D;
 Wed, 22 Sep 2021 16:01:13 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD39E6A047;
 Wed, 22 Sep 2021 16:01:12 +0000 (GMT)
Received: from localhost (unknown [9.211.63.177])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 22 Sep 2021 16:01:12 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/paravirt: correct preempt debug splat in
 vcpu_is_preempted()
In-Reply-To: <20210922075718.GA2004@linux.vnet.ibm.com>
References: <20210921031213.2029824-1-nathanl@linux.ibm.com>
 <20210922075718.GA2004@linux.vnet.ibm.com>
Date: Wed, 22 Sep 2021 11:01:12 -0500
Message-ID: <87ee9gob07.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BAdmmyU4pRTNlrcDupCQLIzNqtuWC1X8
X-Proofpoint-ORIG-GUID: cu1swTYup3C6I-pONGE3YQAn3YXnd04f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_06,2021-09-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxlogscore=604 spamscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220110
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Nathan Lynch <nathanl@linux.ibm.com> [2021-09-20 22:12:13]:
>
>> vcpu_is_preempted() can be used outside of preempt-disabled critical
>> sections, yielding warnings such as:
>> 
>> BUG: using smp_processor_id() in preemptible [00000000] code: systemd-udevd/185
>> caller is rwsem_spin_on_owner+0x1cc/0x2d0
>> CPU: 1 PID: 185 Comm: systemd-udevd Not tainted 5.15.0-rc2+ #33
>> Call Trace:
>> [c000000012907ac0] [c000000000aa30a8] dump_stack_lvl+0xac/0x108 (unreliable)
>> [c000000012907b00] [c000000001371f70] check_preemption_disabled+0x150/0x160
>> [c000000012907b90] [c0000000001e0e8c] rwsem_spin_on_owner+0x1cc/0x2d0
>> [c000000012907be0] [c0000000001e1408] rwsem_down_write_slowpath+0x478/0x9a0
>> [c000000012907ca0] [c000000000576cf4] filename_create+0x94/0x1e0
>> [c000000012907d10] [c00000000057ac08] do_symlinkat+0x68/0x1a0
>> [c000000012907d70] [c00000000057ae18] sys_symlink+0x58/0x70
>> [c000000012907da0] [c00000000002e448] system_call_exception+0x198/0x3c0
>> [c000000012907e10] [c00000000000c54c] system_call_common+0xec/0x250
>> 
>> The result of vcpu_is_preempted() is always subject to invalidation by
>> events inside and outside of Linux; it's just a best guess at a point in
>> time. Use raw_smp_processor_id() to avoid such warnings.
>
> Typically smp_processor_id() and raw_smp_processor_id() except for the
> CONFIG_DEBUG_PREEMPT.

Sorry, I don't follow...

> In the CONFIG_DEBUG_PREEMPT case, smp_processor_id()
> is actually debug_smp_processor_id(), which does all the checks.

Yes, OK.

> I believe these checks in debug_smp_processor_id() are only valid for x86
> case (aka cases were they have __smp_processor_id() defined.)

Hmm, I am under the impression that the checks in
debug_smp_processor_id() are valid regardless of whether the arch
overrides __smp_processor_id().

I think the stack trace here correctly identifies an incorrect use of
smp_processor_id(), and the call site needs to be changed. Do you
disagree?
