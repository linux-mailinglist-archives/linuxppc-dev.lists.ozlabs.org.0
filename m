Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E54570C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 15:38:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwfQv0zM5z3c8W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 01:37:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VzpfaVK0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VzpfaVK0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwfQ76Wnfz2xr8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 01:37:19 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJEBssw004349; 
 Fri, 19 Nov 2021 14:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=WPRU6Unm/xQLyk5NZVxypL1GVFolMPC+q1OrFC7cIW8=;
 b=VzpfaVK0BcIxtOs179olC8WqXXSSs4UgY5+YCYqss8hWpp8uaDhjrBP92REtKLYsLj76
 U3fDVwEzRbaHbt0o9fzQyZaq/4oeuHmqStlqoS+13608MrnAamqjIQPZXzq+1KMauXdy
 Z1RqmhyYvr56S74wZiOZ8uDX8m2dq14nbj3nba912Y0307f3o4oD1k76W8VKrHuH3I4O
 m9FNwzbiWgXzdpI7AhK7ksuEpRiQkpBtISeMC6DxMQBzJ511jrmwNoWQ2QgQvcKIe9rd
 Wsya2Dc98vRxV4LAlGjTc0UR5yuam8d49pjFBXAYvo4iobD0jcHCMOtWYFg08Fqu1WWG /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ced1h95ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 14:37:11 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AJEagBi020120;
 Fri, 19 Nov 2021 14:37:11 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ced1h95f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 14:37:11 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AJEXgJt022560;
 Fri, 19 Nov 2021 14:37:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3ca4mky7tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 14:37:09 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AJEb69C25035010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 14:37:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 582BEA405F;
 Fri, 19 Nov 2021 14:37:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED347A4064;
 Fri, 19 Nov 2021 14:37:03 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.163.30.231])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 19 Nov 2021 14:37:03 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH V4 0/1] powerpc/perf: Clear pending PMI in ppmu callbacks
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1626846509-1350-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Fri, 19 Nov 2021 20:06:59 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <40F23366-66BE-4063-8516-445E41E19EC6@linux.vnet.ibm.com>
References: <1626846509-1350-1-git-send-email-atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wfwke2EdZ_z8Hmcyq8gl-pY0EuSK18lo
X-Proofpoint-GUID: YmIUgM9YUZla3pbumuDMHU0YryaOCRia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190081
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 21-Jul-2021, at 11:18 AM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> Running perf fuzzer testsuite popped up below messages
> in the dmesg logs:
>=20
> "Can't find PMC that caused IRQ"
>=20
> This means a PMU exception happened, but none of the PMC's =
(Performance
> Monitor Counter) were found to be overflown. Perf interrupt handler =
checks
> the PMC's to see which PMC has overflown and if none of the PMCs are
> overflown ( counter value not >=3D 0x80000000 ), it throws warning:
> "Can't find PMC that caused IRQ".
>=20
> Powerpc has capability to mask and replay a performance monitoring
> interrupt (PMI). In case of replayed PMI, there are some corner cases
> that clears the PMCs after masking. In such cases, the perf interrupt
> handler will not find the active PMC values that had caused the =
overflow
> and thus leading to this message. This patchset attempts to fix those
> corner cases.
>=20
> However there is one more case in PowerNV where these messages are
> emitted during system wide profiling or when a specific CPU is =
monitored
> for an event. That is, when a counter overflow just before entering =
idle
> and a PMI gets triggered after wakeup from idle. Since PMCs
> are not saved in the idle path, perf interrupt handler will not
> find overflown counter value and emits the "Can't find PMC" messages.
> This patch documents this race condition in powerpc core-book3s.
>=20
> Patch fixes the ppmu callbacks to disable pending interrupt before =
clearing
> the overflown PMC and documents the race condition in idle path.
>=20
> Changelog:
> changes from v3 -> v4
>   Addressed review comments from Nicholas Piggin
>   - Added comment explaining the need to clear MMCR0 PMXE bit in
>     pmu disable callback.
>   - Added a check to display warning if there is a PMI pending
>     bit set in Paca without any overflown PMC.
>   - Removed the condition check before clearing pending PMI
>     in 'clear_pmi_irq_pending' function.
>   - Added reviewed by from Nicholas Piggin.
>=20
> Changes from v2 -> v3
>   Addressed review comments from Nicholas Piggin
>   - Moved the clearing of PMI bit to power_pmu_disable.
>     In previous versions, this was done in power_pmu_del,
>     power_pmu_stop/enable callbacks before clearing of PMC's.
>   - power_pmu_disable is called before any event gets deleted
>     or stopped. If more than one event is running in the PMU,
>     we may clear the PMI bit for an event which is not going
>     to be deleted/stopped. Hence introduced check in
>     power_pmu_enable to set back PMI to avoid dropping of valid
>     samples in such cases.
>   - Disable MMCR0 PMXE bit in pmu disable callback which otherwise
>     could trigger PMI when PMU is getting disabled.
> Changes from v1 -> v2
>   Addressed review comments from Nicholas Piggin
>   - Moved the PMI pending check and clearing function
>     to arch/powerpc/include/asm/hw_irq.h and renamed
>     function to "get_clear_pmi_irq_pending"
>   - Along with checking for pending PMI bit in Paca,
>     look for PMAO bit in MMCR0 register to decide on
>     pending PMI interrupt.
>=20
> Athira Rajeev (1):
>  powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting
>    an overflown PMC

Hi,

Please let me know if there are any review comments for this patch.

Thanks
Athira
>=20
> arch/powerpc/include/asm/hw_irq.h | 38 +++++++++++++++++++++++++
> arch/powerpc/perf/core-book3s.c   | 59 =
++++++++++++++++++++++++++++++++++++++-
> 2 files changed, 96 insertions(+), 1 deletion(-)
>=20
> --=20
> 1.8.3.1
>=20

