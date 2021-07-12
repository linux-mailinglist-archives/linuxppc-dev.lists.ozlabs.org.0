Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6DD3C5CB7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 14:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNkMc2kmpz3bVn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 22:58:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TIXovsvw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TIXovsvw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNVWr48jJz2yxj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 14:04:23 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16C43Aep121318; Mon, 12 Jul 2021 00:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=SnCnHdtOeqy9L++ZFtPlHUXIxEcgiWEXhHOKAojy3eA=;
 b=TIXovsvwv7es6KR8v0LtDjtOdoaUoy6YudxunUoPHDh8RKzZoeD5acjxIQhuq5Ojf8zw
 csvE+9Fokk5v3WQ+mOENsLhfbD1gcx6vUEZKyM+rM8NjrfbGc+Fn+qvcST+1yd/dkIAh
 xk7BIghocj9oDgKcYJTpPFA8ZzHpAQmTLXcuB6vGcxuXBjY4IdKx5SRqBXFrWIanmbqA
 02986LFpnQOXacwfokOVc+e+FYO0yaLkK/h0Wr/oyn/qs86aCm11KvI1bst10qGqURcZ
 WH6c2E12xKGBL6EayVwDOHLD2Z+VlqnxLaeg0T5P7LEq+7HCyaGwB/Tja7jQTHw1yTom gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrr3cb46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 00:04:21 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16C43We7126276;
 Mon, 12 Jul 2021 00:04:20 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrr3cb2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 00:04:20 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16C441lJ027805;
 Mon, 12 Jul 2021 04:04:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 39q368g9m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 04:04:18 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16C42DIn28508428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 04:02:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C986611C04C;
 Mon, 12 Jul 2021 04:04:14 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B376311C052;
 Mon, 12 Jul 2021 04:04:13 +0000 (GMT)
Received: from [9.195.47.54] (unknown [9.195.47.54])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Jul 2021 04:04:13 +0000 (GMT)
Subject: Re: [RFC PATCH 10/43] powerpc/64s: Always set PMU control registers
 to frozen/disabled when not in use
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Content-Type: text/html;
	charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://22/
In-Reply-To: <1626057462.8m12ralsd6.astroid@bobo.none>
X-Apple-Windows-Friendly: 1
Date: Mon, 12 Jul 2021 08:47:12 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <C5467AE9-8348-4B84-A2DA-688C3E9C4F1E@linux.vnet.ibm.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-11-npiggin@gmail.com>
 <C58A063A-3B5D-4188-80E2-4C19802785BF@linux.vnet.ibm.com>
 <1626057462.8m12ralsd6.astroid@bobo.none>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Z7ID5iGbwYHqPp11K578fJMeJNuTDLx7
X-Proofpoint-ORIG-GUID: wxwMsiJuWoUxpNPv0zCWgTRJFTGm-NIm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_02:2021-07-09,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120031
X-Mailman-Approved-At: Mon, 12 Jul 2021 22:57:40 +1000
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div dir=3D"auto" style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On =
12-Jul-2021, at 8:11 AM, Nicholas Piggin &lt;npiggin@gmail.com&gt; =
wrote:<br><br>Excerpts from Athira Rajeev's message of July 10, 2021 =
12:50 pm:<br><blockquote type=3D"cite"><br><br><blockquote =
type=3D"cite">On 22-Jun-2021, at 4:27 PM, Nicholas Piggin =
&lt;npiggin@gmail.com&gt; wrote:<br><br>KVM PMU management code looks =
for particular frozen/disabled bits in<br>the PMU registers so it knows =
whether it must clear them when coming<br>out of a guest or not. Setting =
this up helps KVM make these optimisations<br>without getting confused. =
Longer term the better approach might be to<br>move guest/host PMU =
switching to the perf subsystem.<br><br>Signed-off-by: Nicholas Piggin =
&lt;npiggin@gmail.com&gt;<br>---<br>arch/powerpc/kernel/cpu_setup_power.c =
| 4 ++--<br>arch/powerpc/kernel/dt_cpu_ftrs.c &nbsp;&nbsp;&nbsp;&nbsp;| =
6 +++---<br>arch/powerpc/kvm/book3s_hv.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 5 =
+++++<br>arch/powerpc/perf/core-book3s.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 7 +++++++<br>4 files changed, 17 =
insertions(+), 5 deletions(-)<br><br>diff --git =
a/arch/powerpc/kernel/cpu_setup_power.c =
b/arch/powerpc/kernel/cpu_setup_power.c<br>index =
a29dc8326622..3dc61e203f37 100644<br>--- =
a/arch/powerpc/kernel/cpu_setup_power.c<br>+++ =
b/arch/powerpc/kernel/cpu_setup_power.c<br>@@ -109,7 +109,7 @@ static =
void init_PMU_HV_ISA207(void)<br>static void =
init_PMU(void)<br>{<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCRA, 0);<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr(SPRN_MMCR0, 0);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR0, =
MMCR0_FC);<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr(SPRN_MMCR1, 0);<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR2, 0);<br>}<br>@@ =
-123,7 +123,7 @@ static void init_PMU_ISA31(void)<br>{<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr(SPRN_MMCR3, 0);<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCRA, =
MMCRA_BHRB_DISABLE);<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR0, =
MMCR0_PMCCEXT);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR0, MMCR0_FC | =
MMCR0_PMCCEXT);<br>}<br><br>/*<br>diff --git =
a/arch/powerpc/kernel/dt_cpu_ftrs.c =
b/arch/powerpc/kernel/dt_cpu_ftrs.c<br>index 0a6b36b4bda8..06a089fbeaa7 =
100644<br>--- a/arch/powerpc/kernel/dt_cpu_ftrs.c<br>+++ =
b/arch/powerpc/kernel/dt_cpu_ftrs.c<br>@@ -353,7 +353,7 @@ static void =
init_pmu_power8(void)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br><br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr(SPRN_MMCRA, 0);<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR0, 0);<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr(SPRN_MMCR0, MMCR0_FC);<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR1, 0);<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr(SPRN_MMCR2, 0);<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCRS, 0);<br>@@ =
-392,7 +392,7 @@ static void init_pmu_power9(void)<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr(SPRN_MMCRC, 0);<br><br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCRA, 0);<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr(SPRN_MMCR0, 0);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR0, =
MMCR0_FC);<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr(SPRN_MMCR1, 0);<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR2, 0);<br>}<br>@@ =
-428,7 +428,7 @@ static void init_pmu_power10(void)<br><br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr(SPRN_MMCR3, 0);<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCRA, =
MMCRA_BHRB_DISABLE);<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR0, =
MMCR0_PMCCEXT);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR0, MMCR0_FC | =
MMCR0_PMCCEXT);<br>}<br><br>static int __init =
feat_enable_pmu_power10(struct dt_cpu_feature *f)<br>diff --git =
a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c<br>index =
1f30f98b09d1..f7349d150828 100644<br>--- =
a/arch/powerpc/kvm/book3s_hv.c<br>+++ =
b/arch/powerpc/kvm/book3s_hv.c<br>@@ -2593,6 +2593,11 @@ static int =
kvmppc_core_vcpu_create_hv(struct kvm_vcpu =
*vcpu)<br>#endif<br>#endif<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>vcpu-&gt;arch.mmcr[0] =3D =
MMCR0_FC;<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (cpu_has_feature(CPU_FTR_ARCH_31)) {<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>vcpu-&gt;arch.mmcr[0] |=3D MMCR0_PMCCEXT;<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>vcpu-&gt;arch.mmcra =3D MMCRA_BHRB_DISABLE;<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br>+<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>vcpu-&gt;arch.ctrl =3D CTRL_RUNLATCH;<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/* =
default to host PVR, since we can't spoof it */<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>kvmppc_set_pvr_hv(vcpu, mfspr(SPRN_PVR));<br>diff --git =
a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c<br>index 51622411a7cc..e33b29ec1a65 =
100644<br>--- a/arch/powerpc/perf/core-book3s.c<br>+++ =
b/arch/powerpc/perf/core-book3s.c<br>@@ -1361,6 +1361,13 @@ static void =
power_pmu_enable(struct pmu *pmu)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>goto out;<br><br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(cpuhw-&gt;n_events =3D=3D 0) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if =
(cpu_has_feature(CPU_FTR_ARCH_31)) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCRA, =
MMCRA_BHRB_DISABLE);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR0, MMCR0_FC | =
MMCR0_PMCCEXT);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>} else {<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr(SPRN_MMCRA, 0);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr(SPRN_MMCR0, =
MMCR0_FC);<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br></blockquote><br><br>Hi Nick,<br><br>We are setting these =
bits in =E2=80=9Cpower_pmu_disable=E2=80=9D function. And disable will =
be called before any event gets deleted/stopped. Can you please help to =
understand why this is needed in power_pmu_enable path also =
?<br></blockquote><br>I'll have to go back and check what I needed it =
for.<br><br>Basically what I'm trying to achieve is that when the guest =
and host <br>are not running perf, then the registers should match. This =
way the host <br>can test them with mfspr but does not need to fix them =
with mtspr.<br><br>It's not too important for performance after TM =
facility demand faulting<br>and the nested guest PMU fix means you can =
usually just skip that <br>entirely, but I think it's cleaner. I'll =
double check my perf/ changes<br>it's possible that part should be split =
out or is unnecessary.<br><br></blockquote><br>Sure =
Nick<br><br>power_pmu_disable already sets =
MMCRA_BHRB_DISABLE/MMCR0_FC/MMCR0_PMCCEXT bits.<br>Hence trying to =
understand in which scenario we found this was needed for =
power_pmu_enable.<br><br>Thanks<br>Athira<br><br><blockquote =
type=3D"cite">Thanks,<br>Nick<br></blockquote><br></div></div></body></htm=
l>=
