Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F179654450D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 09:47:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJblQ5dzQz3bm2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 17:46:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D/ACygWE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=au1.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=michaele@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D/ACygWE;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJbkg4V2yz3bk9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 17:46:18 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2596Du3o020649;
	Thu, 9 Jun 2022 07:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=LKc4Qkftkhm6rdS8OZ9MxW+psHBAVnTIc+1bOxxa1ZE=;
 b=D/ACygWEMj3aDxbi57K1RXQIkzleAWfufRkaA+44vGNpnudpgm94NrX8GvtW3F8MN/o3
 T3JSFIAHO6Jt/E1xXbttFgr+2nwH8FYb0HxZhaPM5pfnOoBGARoca14Cn6/v02akg1jB
 ifnwgpmiz09s+8N6MxB2VXCi+P+xfcRMisTKLr8WIs5mSGPBl6HdjPxxnAQK3YD8kz2u
 WsfHZaT5+ysnEnoaBOWiFp6Vlv51tbA8nxTB005ETqHSik4zsU/azdwReUeniaYRwS7b
 7BZy49Y1oil7/eGjypOoXDIjZ0cgSEH8tuFUR2680tIKrJNFaDFi8bPkHsmFBCm4QUQF XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gkbdmsmna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jun 2022 07:46:14 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2597jRHT023319;
	Thu, 9 Jun 2022 07:46:13 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gkbdmsmmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jun 2022 07:46:13 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2597KwFx001860;
	Thu, 9 Jun 2022 07:46:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03fra.de.ibm.com with ESMTP id 3gfy18w6fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jun 2022 07:46:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2597k9uC45089268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jun 2022 07:46:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0A8442042;
	Thu,  9 Jun 2022 07:46:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BB4942047;
	Thu,  9 Jun 2022 07:46:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jun 2022 07:46:09 +0000 (GMT)
Received: from localhost (sasvpn-9-085-036-117.sasj.japan.ibm.com [9.85.36.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BD3AB600FE;
	Thu,  9 Jun 2022 17:45:57 +1000 (AEST)
From: Michael Ellerman <michaele@au1.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
        Laurent Dufour
 <ldufour@linux.ibm.com>
Subject: Re: [PATCH 0/2] Disabling NMI watchdog during LPM's memory transfer
In-Reply-To: <874k0x1s1d.fsf@linux.ibm.com>
References: <20220601155315.35109-1-ldufour@linux.ibm.com>
 <87a6av0wxk.fsf@linux.ibm.com>
 <666cedea-2dbc-254e-467b-c02a3a2d8795@linux.ibm.com>
 <874k0x1s1d.fsf@linux.ibm.com>
Date: Thu, 09 Jun 2022 17:45:49 +1000
Message-ID: <87zgimfff6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L3LMogi31C_Ggb2EXwJxoFkg1dMcNZUZ
X-Proofpoint-ORIG-GUID: w3q-E7AZatuWMwgqO1w7hT97xjld8Ryq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_07,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 spamscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090029
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
Cc: linuxppc-dev@lists.ozlabs.org, haren@linux.vnet.ibm.com, paulus@samba.org, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Laurent Dufour <ldufour@linux.ibm.com> writes:
...
>
>> There are  ongoing investigations to clarify where and how this latency is
>> happening. I'm not excluding any other issue in the Linux kernel, but right
>> now, this looks to be the best option to prevent system crash during
>> LPM.
>
> It will prevent the likely crash mode for enterprise distros with
> default watchdog tunables that our internal test environments happen to
> use. But if someone were to run the same scenario with softlockup_panic
> enabled, or with the RCU stall timeout lower than the watchdog
> threshold, the failure mode would be different.
>
> Basically I'm saying:
> * Some users may actually want the OS to panic when it's in this state,
>   because their applications can't work correctly.
> * But if we're going to inhibit one watchdog, we should inhibit them
>   all.

I'm sympathetic to both of your arguments.

But I think there is a key difference between the NMI watchdog and other
watchdogs, which is that the NMI watchdog will use the unsafe NMI to
interrupt other CPUs, and that can cause the system to crash when other
watchdogs would just print a backtrace.

We had the same problem with the rcu_sched stall detector until we
changed it to use the "safe" NMI, see:
  5cc05910f26e ("powerpc/64s: Wire up arch_trigger_cpumask_backtrace()")


So even if the NMI watchdog is disabled there are still the other
watchdogs enabled, which should print backtraces by default, and if
desired can also be configured to cause a panic.

Instead of disabling the NMI watchdog, can we instead increase the
timeout (by how much?) during LPM, so that it is less likely to fire in
normal usage, but is still there as a backup if the system is completely
clogged.

cheers
