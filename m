Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCA889E90B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 06:39:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aMpVxyZf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDqq650nBz3vZP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 14:39:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aMpVxyZf;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDqpN0wtfz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 14:38:36 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VDqpN0n2bz4wx6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 14:38:36 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VDqpN0hqHz4wx5; Wed, 10 Apr 2024 14:38:36 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aMpVxyZf;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VDqpM5Mtjz4wnr;
	Wed, 10 Apr 2024 14:38:35 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43A4WIIA032599;
	Wed, 10 Apr 2024 04:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : content-transfer-encoding : in-reply-to; s=pp1;
 bh=OUUWR96vfE3iApD8K91WsQCm1zqCydalCH/5mNdcs9E=;
 b=aMpVxyZfGQIy+dU6UTQdZf5oMFkahS+Urno1aHBRWGTNQMET5lNLDe24lTcgPKiukOxt
 7lV65TlMl92JMvMD0kLwU9RfpFSvoPYKsUAHwtkNcNo7Rk8PoComR0KvC8nziqnqJGLT
 ess0pfPXUR8+Nt9rnKJ/dBz/UtBxn515oeQpyc7IuZ+xw0wWmzT6Adc13zsiqtmDgzPT
 vlAwzGK4KX2SNq+elrxLwEF241L85xczHSUCHm4oigMvoeIbDTtY/ZwVWxJrHeyDcBMQ
 kGSrQCe6G8/oAnbGDr8Ex6qLHlIVVh36/UdiHTB4RxSlYO6kbivJ48IHlgeQoK8DDIGy zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xdktv80gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 04:38:32 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43A4cWww009350;
	Wed, 10 Apr 2024 04:38:32 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xdktv80gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 04:38:32 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43A2GQbW016971;
	Wed, 10 Apr 2024 04:38:31 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbke2j5g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 04:38:31 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43A4cPU449414550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Apr 2024 04:38:27 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A125720043;
	Wed, 10 Apr 2024 04:38:25 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C90A20040;
	Wed, 10 Apr 2024 04:38:24 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.109.248.226])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 10 Apr 2024 04:38:23 +0000 (GMT)
Date: Wed, 10 Apr 2024 10:08:21 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Message-ID: <nv5gv3pymozjyctxr4x7vmb3qip2figvj2qtmhs7ohwspvylf4@s3wcsjkdllwv>
References: <20240214095146.1527369-1-mahesh@linux.ibm.com>
 <87edcmnu7o.fsf@mail.lhotse>
 <8d973907-8e86-4b9f-8995-cf3a8621f6b6@linux.ibm.com>
 <874jdhno19.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874jdhno19.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LS0IlzKEel6oYcGWtwCmkccEjdBABYAN
X-Proofpoint-ORIG-GUID: jCR5LXBDzsJ_E_49vltw2QmdsWL9JUe7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=630 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404100031
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
Reply-To: mahesh@linux.ibm.com
Cc: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-03-08 19:08:50 Fri, Michael Ellerman wrote:
> Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> writes:
> > On 3/7/24 5:13 PM, Michael Ellerman wrote:
> >> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> >>> nmi_enter()/nmi_exit() touches per cpu variables which can lead to kernel
> >>> crash when invoked during real mode interrupt handling (e.g. early HMI/MCE
> >>> interrupt handler) if percpu allocation comes from vmalloc area.
> >>>
> >>> Early HMI/MCE handlers are called through DEFINE_INTERRUPT_HANDLER_NMI()
> >>> wrapper which invokes nmi_enter/nmi_exit calls. We don't see any issue when
> >>> percpu allocation is from the embedded first chunk. However with
> >>> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there are chances where percpu
> >>> allocation can come from the vmalloc area.
> >>>
> >>> With kernel command line "percpu_alloc=page" we can force percpu allocation
> >>> to come from vmalloc area and can see kernel crash in machine_check_early:
> >>>
> >>> [    1.215714] NIP [c000000000e49eb4] rcu_nmi_enter+0x24/0x110
> >>> [    1.215717] LR [c0000000000461a0] machine_check_early+0xf0/0x2c0
> >>> [    1.215719] --- interrupt: 200
> >>> [    1.215720] [c000000fffd73180] [0000000000000000] 0x0 (unreliable)
> >>> [    1.215722] [c000000fffd731b0] [0000000000000000] 0x0
> >>> [    1.215724] [c000000fffd73210] [c000000000008364] machine_check_early_common+0x134/0x1f8
> >>>
> >>> Fix this by avoiding use of nmi_enter()/nmi_exit() in real mode if percpu
> >>> first chunk is not embedded.
> >> 
> >> My system (powernv) doesn't even boot with percpu_alloc=page.
> >
> >
> > Can you share the crash details?
> 
> Yes but it's not pretty :)
> 
>   [    1.725257][  T714] systemd-journald[714]: Collecting audit messages is disabled.
>   [    1.729401][    T1] systemd[1]: Finished systemd-tmpfiles-setup-dev.service - Create Static Device Nodes in /dev.
>   [^[[0;32m  OK  ^[[0m] Finished ^[[0;1;39msystemd-tmpfiles-…reate Static Device Nodes in /dev.
>   [    1.773902][   C22] Disabling lock debugging due to kernel taint
>   [    1.773905][   C23] Oops: Machine check, sig: 7 [#1]
>   [    1.773911][   C23] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
>   [    1.773916][   C23] Modules linked in:
>   [    1.773920][   C23] CPU: 23 PID: 0 Comm: swapper/23 Tainted: G   M               6.8.0-rc7-02500-g23515c370cbb #1
>   [    1.773924][   C23] Hardware name: 8335-GTH POWER9 0x4e1202 opal:skiboot-v6.5.3-35-g1851b2a06 PowerNV
>   [    1.773926][   C23] NIP:  0000000000000000 LR: 0000000000000000 CTR: 0000000000000000
>   [    1.773929][   C23] REGS: c000000fffa6ef50 TRAP: 0000   Tainted: G   M                (6.8.0-rc7-02500-g23515c370cbb)
>   [    1.773932][   C23] MSR:  0000000000000000 <>  CR: 00000000  XER: 00000000
>   [    1.773937][   C23] CFAR: 0000000000000000 IRQMASK: 3 
>   [    1.773937][   C23] GPR00: 0000000000000000 c000000fffa6efe0 c000000fffa6efb0 0000000000000000 
>   [    1.773937][   C23] GPR04: c00000000003d8c0 c000000001f5f000 0000000000000000 0000000000000103 
>   [    1.773937][   C23] GPR08: 0000000000000003 653a0d962a590300 0000000000000000 0000000000000000 
>   [    1.773937][   C23] GPR12: c000000fffa6f280 0000000000000000 c0000000000084a4 0000000000000000 
>   [    1.773937][   C23] GPR16: 0000000053474552 0000000000000000 c00000000003d8c0 c000000fffa6f280 
>   [    1.773937][   C23] GPR20: c000000001f5f000 c000000fffa6f340 c000000fffa6f2e8 0000000000000000 
>   [    1.773937][   C23] GPR24: 0007fffffecf0000 c0000000065bbb80 0000000000550102 c000000002172b20 
>   [    1.773937][   C23] GPR28: 0000000000000000 0000000053474552 0000000000000000 c000000ffffc6d80 
>   [    1.773982][   C23] NIP [0000000000000000] 0x0
>   [    1.773988][   C23] LR [0000000000000000] 0x0
>   [    1.773990][   C23] Call Trace:
>   [    1.773991][   C23] [c000000fffa6efe0] [c000000001f5f000] .TOC.+0x0/0xa1000 (unreliable)
>   [    1.773999][   C23] Code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 
>   [    1.774021][   C23] ---[ end trace 0000000000000000 ]---
> 
> Something has gone badly wrong.
> 
> That was a test kernel with some other commits, but nothing that should
> cause that. Removing percpu_alloc=page fix it.

So, when I try this without my patch "Avoid nmi_enter/nmi_exit in real
mode interrupt", I see this getting recreated. However, I was not able
to recrate this even once with my changes. Are you able to see this
crash with my patch ?

Thanks,
-Mahesh.

