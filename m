Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A497B7ACF54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 07:07:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VlR1a+Xc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rv9qG3kTQz3ccY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 15:07:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VlR1a+Xc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aboorvad@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rv9pK4r1dz3cFq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 15:06:49 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38P43Gxv015554;
	Mon, 25 Sep 2023 05:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=C+Am1hs4BkW3DIdDY654brlQSLgS04t9wYlBnYLOdFw=;
 b=VlR1a+XceBkjbpjjivbKKEhAO2KLI2j1sOTlA6qGglUqLGFo+H94b/Dcilb6ukD0PjdG
 Tl/m5jitpl2MN/YOiSnM+wdHjfZVM0jkw+I/2bR4/iUN4ucNxG9SgRiy/lg9+pgiENJT
 yN9+7ur8WfJ5hXLImX7LNNovnJ5jzhBxCEouRlXzP2tGG09uLCZEM8SENoXvfiTjRAjk
 280/BOZH8kS3jz70sLRWR33aWULCfRA7+9aQdyQ/NYTNd6LwwOTl+9dzr5rvvvqa4viH
 8JqKv7Ho1XroYuMFOnBhKhN9qeOyvhTyneJy1+qb0OKlBMVgR4QMkpOsitRnAkrJPCP6 Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ta6dhs3qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 05:06:28 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38P4qb9v029115;
	Mon, 25 Sep 2023 05:06:28 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ta6dhs3qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 05:06:28 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38P3SMkt011010;
	Mon, 25 Sep 2023 05:06:27 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tabujyexq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 05:06:27 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38P56Qdo7995916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Sep 2023 05:06:27 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD88558057;
	Mon, 25 Sep 2023 05:06:26 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C76458065;
	Mon, 25 Sep 2023 05:06:21 +0000 (GMT)
Received: from li-34d1fccc-27cd-11b2-a85c-c167793e56f7.ibm.com (unknown [9.171.87.83])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Sep 2023 05:06:20 +0000 (GMT)
Message-ID: <2725211932028cf24ab34da9eb9d19190848cceb.camel@linux.vnet.ibm.com>
Subject: Re: [RFC v3 0/2] CPU-Idle latency selftest framework
From: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, rmclure@linux.ibm.com,
        arnd@arndb.de, joel@jms.id.au, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com,
        aboorvad@linux.vnet.ibm.com
Date: Mon, 25 Sep 2023 10:36:19 +0530
In-Reply-To: <20230911053620.87973-1-aboorvad@linux.vnet.ibm.com>
References: <20230911053620.87973-1-aboorvad@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6cY4PlYdrtJwZsXuoaQ-NxoofsXmwBHb
X-Proofpoint-ORIG-GUID: FpWd_RXR3RWrFyiWORBVe2Lww56IVftl
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_02,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309250034
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
Reply-To: 20230911053620.87973-1-aboorvad@linux.vnet.ibm.com
Cc: sshegde@linux.vnet.ibm.com, linux-pm@vger.kernel.org, daniel.lezcano@linaro.org, srikar@linux.vnet.ibm.com, rafael@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-09-11 at 11:06 +0530, Aboorva Devarajan wrote:

CC'ing CPUidle lists and maintainers,

Patch Summary:

The patchset introduces a kernel module and userspace driver designed
for estimating the wakeup latency experienced when waking up from
various CPU idle states. It primarily measures latencies related to two
types of events: Inter-Processor Interrupts (IPIs) and Timers.

Background:

Initially, these patches were introduced as a generic self-test.
However, it was later discovered that Intel platforms incorporate
timer-based wakeup optimizations. These optimizations allow CPUs to
perform a pre-wakeup, which limits the effectiveness of latency
observation in certain scenarios because it only measures the optimized
wakeup latency [1]. 

Therefore, in this RFC, the self-test is specifically integrated into
PowerPC, as it has been tested and used in PowerPC so far.

Another proposal is to introduce these patches as a generic cpuilde IPI
and timer wake-up test. While this method may not give us an exact
measurement of latency variations at the hardware level, it can still
help us assess this metric from a software observability standpoint.

Looking forward to hearing what you think and any suggestions you may
have regarding this. Thanks.

[1] 
https://lore.kernel.org/linux-pm/20200914174625.GB25628@in.ibm.com/T/#m5c004b9b1a918f669e91b3d0f33e2e3500923234

> Changelog: v2 -> v3
> 
> * Minimal code refactoring
> * Rebased on v6.6-rc1
> 
> RFC v1: 
> https://lore.kernel.org/all/20210611124154.56427-1-psampat@linux.ibm.com/
> 
> RFC v2:
> https://lore.kernel.org/all/20230828061530.126588-2-aboorvad@linux.vnet.ibm.com/
> 
> Other related RFC:
> https://lore.kernel.org/all/20210430082804.38018-1-psampat@linux.ibm.com/
> 
> Userspace selftest:
> https://lkml.org/lkml/2020/9/2/356
> 
> ----
> 
> A kernel module + userspace driver to estimate the wakeup latency
> caused by going into stop states. The motivation behind this program
> is
> to find significant deviations behind advertised latency and
> residency
> values.
> 
> The patchset measures latencies for two kinds of events. IPIs and
> Timers
> As this is a software-only mechanism, there will be additional
> latencies
> of the kernel-firmware-hardware interactions. To account for that,
> the
> program also measures a baseline latency on a 100 percent loaded CPU
> and the latencies achieved must be in view relative to that.
> 
> To achieve this, we introduce a kernel module and expose its control
> knobs through the debugfs interface that the selftests can engage
> with.
> 
> The kernel module provides the following interfaces within
> /sys/kernel/debug/powerpc/latency_test/ for,
> 
> IPI test:
>     ipi_cpu_dest = Destination CPU for the IPI
>     ipi_cpu_src = Origin of the IPI
>     ipi_latency_ns = Measured latency time in ns
> Timeout test:
>     timeout_cpu_src = CPU on which the timer to be queued
>     timeout_expected_ns = Timer duration
>     timeout_diff_ns = Difference of actual duration vs expected timer
> 
> Sample output is as follows:
> 
> # --IPI Latency Test---
> # Baseline Avg IPI latency(ns): 2720
> # Observed Avg IPI latency(ns) - State snooze: 2565
> # Observed Avg IPI latency(ns) - State stop0_lite: 3856
> # Observed Avg IPI latency(ns) - State stop0: 3670
> # Observed Avg IPI latency(ns) - State stop1: 3872
> # Observed Avg IPI latency(ns) - State stop2: 17421
> # Observed Avg IPI latency(ns) - State stop4: 1003922
> # Observed Avg IPI latency(ns) - State stop5: 1058870
> #
> # --Timeout Latency Test--
> # Baseline Avg timeout diff(ns): 1435
> # Observed Avg timeout diff(ns) - State snooze: 1709
> # Observed Avg timeout diff(ns) - State stop0_lite: 2028
> # Observed Avg timeout diff(ns) - State stop0: 1954
> # Observed Avg timeout diff(ns) - State stop1: 1895
> # Observed Avg timeout diff(ns) - State stop2: 14556
> # Observed Avg timeout diff(ns) - State stop4: 873988
> # Observed Avg timeout diff(ns) - State stop5: 959137
> 
> Aboorva Devarajan (2):
>   powerpc/cpuidle: cpuidle wakeup latency based on IPI and timer
> events
>   powerpc/selftest: Add support for cpuidle latency measurement
> 
>  arch/powerpc/Kconfig.debug                    |  10 +
>  arch/powerpc/kernel/Makefile                  |   1 +
>  arch/powerpc/kernel/test_cpuidle_latency.c    | 154 ++++++
>  tools/testing/selftests/powerpc/Makefile      |   1 +
>  .../powerpc/cpuidle_latency/.gitignore        |   2 +
>  .../powerpc/cpuidle_latency/Makefile          |   6 +
>  .../cpuidle_latency/cpuidle_latency.sh        | 443
> ++++++++++++++++++
>  .../powerpc/cpuidle_latency/settings          |   1 +
>  8 files changed, 618 insertions(+)
>  create mode 100644 arch/powerpc/kernel/test_cpuidle_latency.c
>  create mode 100644
> tools/testing/selftests/powerpc/cpuidle_latency/.gitignore
>  create mode 100644
> tools/testing/selftests/powerpc/cpuidle_latency/Makefile
>  create mode 100755
> tools/testing/selftests/powerpc/cpuidle_latency/cpuidle_latency.sh
>  create mode 100644
> tools/testing/selftests/powerpc/cpuidle_latency/settings
> 

