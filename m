Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 838F07C643B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 06:52:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N6d44qlW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5cgN1pPKz3cJW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 15:52:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N6d44qlW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aboorvad@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5cfR74sDz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 15:51:11 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39C4iLLo025899;
	Thu, 12 Oct 2023 04:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : in-reply-to : references : content-type : date :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4dRq0+qrMW79vqCmIh3c+89lFEC0oEWqBR9f44r+nC0=;
 b=N6d44qlWX88K3KDvz1RgMB3loG9x3oKHvzFgvhaTYZRZJ3wmB1Ma50T30horlkljv91N
 KAEReLY3rseMDpawJgNVrGOJaruy2CUL+T0bInN/GOpNU6dcB/7dTOz+CHPnwwgAwMkY
 BV3/5DIqGKl3h+zAx9hIoDlpmZlaNC3ZUM1Fz2ARRlMaGVpxllDiRxxjWQMhnRHOQdQ4
 bZcDA7aH9nXSoyGdq2ajH53LawTCQmfpasLypY9ZLfYHQhLz7h6v34V3LnbUcJVZSZQq
 cg+LPVEH53VNDKe18oMqvmRwGLrPlQlsWHwUSvR+eh9VqRA627SOU+dYl2KNu47TjvFb 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpa1jr63j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 04:50:56 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39C4jPwF030786;
	Thu, 12 Oct 2023 04:50:56 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpa1jr638-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 04:50:55 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39C2L8xQ001270;
	Thu, 12 Oct 2023 04:50:55 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkkvk4rts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 04:50:55 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39C4osou25559758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Oct 2023 04:50:54 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDAF758059;
	Thu, 12 Oct 2023 04:50:54 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DE7E58058;
	Thu, 12 Oct 2023 04:50:49 +0000 (GMT)
Received: from li-34d1fccc-27cd-11b2-a85c-c167793e56f7.ibm.com (unknown [9.171.22.41])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Oct 2023 04:50:49 +0000 (GMT)
Message-ID: <09b5de78a39277400a1198f1120448e95e9855cd.camel@linux.vnet.ibm.com>
Subject: Re: [RFC v3 0/2] CPU-Idle latency selftest framework
From: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
To: 20230911053620.87973-1-aboorvad@linux.vnet.ibm.com, mpe@ellerman.id.au,
        rafael@kernel.org, daniel.lezcano@linaro.org, linux-pm@vger.kernel.org
In-Reply-To: <2725211932028cf24ab34da9eb9d19190848cceb.camel@linux.vnet.ibm.com>
References: <20230911053620.87973-1-aboorvad@linux.vnet.ibm.com>
	 <2725211932028cf24ab34da9eb9d19190848cceb.camel@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Oct 2023 10:18:06 +0530
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PfVY_pCpedc4FtHJmE7cPhhLepKrOzBD
X-Proofpoint-ORIG-GUID: _WLu91LP65pqIpal-zDbWIbGnwHhKy5-
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_02,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1011 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310120040
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
Cc: srikar@linux.vnet.ibm.com, arnd@arndb.de, pratik.r.sampat@gmail.com, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, rmclure@linux.ibm.com, joel@jms.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-09-25 at 10:36 +0530, Aboorva Devarajan wrote:

Gentle ping to check if there are any feedback or comments on this
patch-set.

Thanks
Aboorva

> On Mon, 2023-09-11 at 11:06 +0530, Aboorva Devarajan wrote:
> 
> CC'ing CPUidle lists and maintainers,
> 
> Patch Summary:
> 
> The patchset introduces a kernel module and userspace driver designed
> for estimating the wakeup latency experienced when waking up from
> various CPU idle states. It primarily measures latencies related to
> two
> types of events: Inter-Processor Interrupts (IPIs) and Timers.
> 
> Background:
> 
> Initially, these patches were introduced as a generic self-test.
> However, it was later discovered that Intel platforms incorporate
> timer-based wakeup optimizations. These optimizations allow CPUs to
> perform a pre-wakeup, which limits the effectiveness of latency
> observation in certain scenarios because it only measures the
> optimized
> wakeup latency [1]. 
> 
> Therefore, in this RFC, the self-test is specifically integrated into
> PowerPC, as it has been tested and used in PowerPC so far.
> 
> Another proposal is to introduce these patches as a generic cpuilde
> IPI
> and timer wake-up test. While this method may not give us an exact
> measurement of latency variations at the hardware level, it can still
> help us assess this metric from a software observability standpoint.
> 
> Looking forward to hearing what you think and any suggestions you may
> have regarding this. Thanks.
> 
> [1] 
> https://lore.kernel.org/linux-pm/20200914174625.GB25628@in.ibm.com/T/#m5c004b9b1a918f669e91b3d0f33e2e3500923234
> 
> > Changelog: v2 -> v3
> > 
> > * Minimal code refactoring
> > * Rebased on v6.6-rc1
> > 
> > RFC v1: 
> > https://lore.kernel.org/all/20210611124154.56427-1-psampat@linux.ibm.com/
> > 
> > RFC v2:
> > https://lore.kernel.org/all/20230828061530.126588-2-aboorvad@linux.vnet.ibm.com/
> > 
> > Other related RFC:
> > https://lore.kernel.org/all/20210430082804.38018-1-psampat@linux.ibm.com/
> > 
> > Userspace selftest:
> > https://lkml.org/lkml/2020/9/2/356
> > 
> > ----
> > 
> > A kernel module + userspace driver to estimate the wakeup latency
> > caused by going into stop states. The motivation behind this
> > program
> > is
> > to find significant deviations behind advertised latency and
> > residency
> > values.
> > 
> > The patchset measures latencies for two kinds of events. IPIs and
> > Timers
> > As this is a software-only mechanism, there will be additional
> > latencies
> > of the kernel-firmware-hardware interactions. To account for that,
> > the
> > program also measures a baseline latency on a 100 percent loaded
> > CPU
> > and the latencies achieved must be in view relative to that.
> > 
> > To achieve this, we introduce a kernel module and expose its
> > control
> > knobs through the debugfs interface that the selftests can engage
> > with.
> > 
> > The kernel module provides the following interfaces within
> > /sys/kernel/debug/powerpc/latency_test/ for,
> > 
> > IPI test:
> >     ipi_cpu_dest = Destination CPU for the IPI
> >     ipi_cpu_src = Origin of the IPI
> >     ipi_latency_ns = Measured latency time in ns
> > Timeout test:
> >     timeout_cpu_src = CPU on which the timer to be queued
> >     timeout_expected_ns = Timer duration
> >     timeout_diff_ns = Difference of actual duration vs expected
> > timer
> > 
> > Sample output is as follows:
> > 
> > # --IPI Latency Test---
> > # Baseline Avg IPI latency(ns): 2720
> > # Observed Avg IPI latency(ns) - State snooze: 2565
> > # Observed Avg IPI latency(ns) - State stop0_lite: 3856
> > # Observed Avg IPI latency(ns) - State stop0: 3670
> > # Observed Avg IPI latency(ns) - State stop1: 3872
> > # Observed Avg IPI latency(ns) - State stop2: 17421
> > # Observed Avg IPI latency(ns) - State stop4: 1003922
> > # Observed Avg IPI latency(ns) - State stop5: 1058870
> > #
> > # --Timeout Latency Test--
> > # Baseline Avg timeout diff(ns): 1435
> > # Observed Avg timeout diff(ns) - State snooze: 1709
> > # Observed Avg timeout diff(ns) - State stop0_lite: 2028
> > # Observed Avg timeout diff(ns) - State stop0: 1954
> > # Observed Avg timeout diff(ns) - State stop1: 1895
> > # Observed Avg timeout diff(ns) - State stop2: 14556
> > # Observed Avg timeout diff(ns) - State stop4: 873988
> > # Observed Avg timeout diff(ns) - State stop5: 959137
> > 
> > Aboorva Devarajan (2):
> >   powerpc/cpuidle: cpuidle wakeup latency based on IPI and timer
> > events
> >   powerpc/selftest: Add support for cpuidle latency measurement
> > 
> >  arch/powerpc/Kconfig.debug                    |  10 +
> >  arch/powerpc/kernel/Makefile                  |   1 +
> >  arch/powerpc/kernel/test_cpuidle_latency.c    | 154 ++++++
> >  tools/testing/selftests/powerpc/Makefile      |   1 +
> >  .../powerpc/cpuidle_latency/.gitignore        |   2 +
> >  .../powerpc/cpuidle_latency/Makefile          |   6 +
> >  .../cpuidle_latency/cpuidle_latency.sh        | 443
> > ++++++++++++++++++
> >  .../powerpc/cpuidle_latency/settings          |   1 +
> >  8 files changed, 618 insertions(+)
> >  create mode 100644 arch/powerpc/kernel/test_cpuidle_latency.c
> >  create mode 100644
> > tools/testing/selftests/powerpc/cpuidle_latency/.gitignore
> >  create mode 100644
> > tools/testing/selftests/powerpc/cpuidle_latency/Makefile
> >  create mode 100755
> > tools/testing/selftests/powerpc/cpuidle_latency/cpuidle_latency.sh
> >  create mode 100644
> > tools/testing/selftests/powerpc/cpuidle_latency/settings
> > 

