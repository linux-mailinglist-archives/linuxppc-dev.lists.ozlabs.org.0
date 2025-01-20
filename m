Return-Path: <linuxppc-dev+bounces-5386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E31A16828
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 09:23:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc3Jc0Bzgz3011;
	Mon, 20 Jan 2025 19:23:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737361423;
	cv=none; b=g+klhD5MJAYiyCWLr9oEbV5sgZAuVxrTXoJROCZU7jlGC2KgaJsQ1smIp/OMmDm/dMieiHaMK2442L+Ecjgx1PrOBk0xspv8rnChizVazqePs9PhSOwhk96zw7Xy2Nedw4/is1YXws/tI8pz6J4+dDmInTBAsFmY6MyAcEAM931FbLPDE9b+C3i27Trljyah0JNE28RwWuxxbJZ5DMaNars5nknD/7v+dIFYmtQuyDHBwmDcfnkEmPEFRmgfbqbbs2k3AhJtJ3ZgjFr377WMlce9gufWf/+XTEfsBkkM5QiWihmm2qIVZhu5tX2JAMiJF5JWClo9bkOpqCMLqtiHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737361423; c=relaxed/relaxed;
	bh=Qtqen/MXOiB4PVUtzX0xf/ut44hK7g+2ztmrYVWMB0c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fmS03YucySzfbQ+Aa04kRaXgr+ApbMt/wk6VbU8ayU7D6O2lJcKYLpAMYrjAJ7LJ4/m0yg5E7eJ0vCgic0qkROBxwo/RsgZm+Fw1ueA4HtdhEh2Vfr81Y9uCE1njdsqlPsV/6Kx1XFzxvLM5R3nNL/RE9rxcmKkKdqLR1beTeTf51AElN+VJPxYUmAvc6yq5L8nMJu4E1ZIT8fJbJV3M4IU2pBM5aQ2xg6FPVpH0xS0ckOdhcfJmG+je5GV0AvBoP9X7sGjJjB7fMHiKMMDK0SeBe9wtyJlswcNK8ndGfyJbab3C/re07LaTkkJxUKkigwvSLnPcKaLnrgSxn0lUfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ANIWsBtF; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ANIWsBtF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc3JZ73SFz300B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 19:23:42 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K20hBx031841;
	Mon, 20 Jan 2025 08:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Qtqen/
	MXOiB4PVUtzX0xf/ut44hK7g+2ztmrYVWMB0c=; b=ANIWsBtFCHr2E/eBixq+lb
	4XTWlwtJCJxAhXrIZCTj+kCK91Lav0RcaVtUXAEVxWqgr2TgXRjbBrs6/Sc2a5YT
	XpPVNhTUMLgXbrT+dXwIrsLKLdUV6W8F8OjhqSjrD59vuvpRtMTIqIPX72vy1K4F
	8+sLKs8SZ9zRbFo1+GSPx/1zejFz39wTD33vZPOHWzUJeb1VVJULmlX7o/EfEr0d
	o4jPj0bAq6stznKMVmighkyhKlJGKQmuAPouqXdQuUH2JmPEEs6tQjz8AGmqVkMh
	DsEH6Dtk5of5VUjy1XKUPoRDHtYnZq83P71CaOL2sXmxsb6WgKlsLU2CRTfOlMqA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449db0sb9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 08:23:33 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50K8J23c018403;
	Mon, 20 Jan 2025 08:23:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449db0sb9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 08:23:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50K4ttpL032248;
	Mon, 20 Jan 2025 08:23:32 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 448rujd4yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 08:23:32 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50K8NSk163635918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 08:23:28 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A65152004B;
	Mon, 20 Jan 2025 08:23:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 283C22004D;
	Mon, 20 Jan 2025 08:23:23 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.253])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 20 Jan 2025 08:23:22 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] tools/perf/tests: Update event_groups test to use
 instructions as one of the sibling event for hw type
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <d4403303-81b5-4f7d-b7b1-1550c37d9e0f@amd.com>
Date: Mon, 20 Jan 2025 13:53:08 +0530
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.ibm.com, Tejas Manhas <Tejas.Manhas1@ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7626F28E-7BEC-4374-800F-ABD1D044D092@linux.vnet.ibm.com>
References: <20250110094620.94976-1-atrajeev@linux.vnet.ibm.com>
 <d4403303-81b5-4f7d-b7b1-1550c37d9e0f@amd.com>
To: Ravi Bangoria <ravi.bangoria@amd.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VwJRQRGy7MzrR9smNCpHEK5bTplLABr-
X-Proofpoint-GUID: iDaWe2gOwOoF1cFD5EkR1oKzR_m8zw6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200066
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 20 Jan 2025, at 12:00=E2=80=AFPM, Ravi Bangoria =
<ravi.bangoria@amd.com> wrote:
>=20
> Hi Athira,
>=20
> On 10-Jan-25 3:16 PM, Athira Rajeev wrote:
>> In some of the powerpc platforms, event group testcase fails as =
below:
>>=20
>>   # perf test -v 'Event groups'
>>   69: Event groups                                                    =
:
>>   --- start ---
>>   test child forked, pid 9765
>>   Using CPUID 0x00820200
>>   Using hv_24x7 for uncore pmu event
>>   0x0 0x0, 0x0 0x0, 0x0 0x0: Fail
>>   0x0 0x0, 0x0 0x0, 0x1 0x3: Pass
>>=20
>> The testcase creates various combinations of hw, sw and uncore
>> PMU events and verify group creation succeeds or fails as expected.
>> This tests one of the limitation in perf where it doesn't allow
>> creating a group of events from different hw PMUs.
>>=20
>> The testcase starts a leader event and opens two sibling events.
>> The combination the fails is three hardware events in a group.
>> "0x0 0x0, 0x0 0x0, 0x0 0x0: Fail"
>>=20
>> Type zero and config zero which translates to PERF_TYPE_HARDWARE
>> and PERF_COUNT_HW_CPU_CYCLE. There is event constraint in powerpc
>> that events using same counter cannot be programmed in a group.
>> Here there is one alternative event for cycles, hence one leader
>> and only one sibling event can go in as a group.
>=20
> For power9, cycles seems to map to PM_CYC event:
>=20
>   GENERIC_EVENT_ATTR(cpu-cycles,                  PM_CYC);
>=20
> However, I don't see PM_CYC in power9_event_alternatives[]. Is =
PM_RUN_CYC
> and PM_CYC are same?

Hi Ravi

They are not the same. PM_CYC count irrespective of the run latch state =
(idle state)
whereas PM_RUN_CYC doesn=E2=80=99t do that.

This test runs fine in power9. The event code for PM_CYC is=20
EVENT(PM_CYC,                                   0x0001e)

Here it is not specifically meant to be run a particular counter and =
even if no alternative event is defined, it can pick available counters =
and go in as a group. But there are cases like other PMU (which is used =
in absence of platform specific PMU) , where alternative event is =
specified to run a particular counter.
Example: arch/powerpc/perf/generic-compat-pmu.c=20

        EVENT(PM_CYC_ALT,                       0x100f0)
	EVENT(PM_CYC,                           0x600f4)

In this case, we can have only two cycles events to go in a group. So =
with our testcase events, one leader and only one sibling event
can go in a group (checked other PMU=E2=80=99s to confirm two is =
possible). So added this fix to consider instructions as one of the =
sibling event.

Thanks
Athira

>=20
> Thanks,
> Ravi



