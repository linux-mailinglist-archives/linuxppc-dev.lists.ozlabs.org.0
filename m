Return-Path: <linuxppc-dev+bounces-16423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGAoNwZdfGkYMAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 08:25:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05949B7E60
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 08:25:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2SGq4T5Sz30M0;
	Fri, 30 Jan 2026 18:25:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769757955;
	cv=none; b=eSIBNuD1NcjJnX6naxbp50ePitnrnTFyt7VVtkL7rIFqcNcAbRZ/baLWcwCQF8Qg8KkYFnZxs3zLaJ9x4HnQ8QwZLPD+0+UI+Ial3ueOnnJMDisfkB6YCco+bC2xpQ1UG8n1gzGKtj1tufPQWUMTUc+wIeqKCp7j2LUHMI4IFPxnD7TRydq0b/igvU+0Dz7twfuH1tAqtW/qC4mRc5Ni+kBVlu7XPL37vPLK9Ht4VvCltnZKzCqxi9FEfeNaAQykSg9lTeD5Eb951ra08v+eG0uOoEK3Uz+mOCwG4AbJHIp0+S09dag4U0SEFl+bZNB6P+Na+3T+PzHW4XH5bEAbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769757955; c=relaxed/relaxed;
	bh=Vp/MVXWKLfmcf3W30OS3OMGE1YCMMoCP2G4v7UNz/A8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=H6KlCbcujmSiGsYuXwbrW/NrUxsHi4UgVBuugWNrmdBw0QUHuFBdsDjgIJx47+CqqTDVCTh/S8Aq44CzeEipe7+o/UrqQpWzhGJxkt3HosJI9xT+e/9nrp2CcOhNE0RFiLl50s7u16rZkLR3ySegnRA/ihJfE8fhFMuPi5PDJ0Tu4GHAJZMu7hD3s7ykKahFemMdzkyrVO1P5H7qTzDX6ikNP6NQsoUCo7VyqYtB8Ts/D7UKGR9C8cez4SNsvrYk8nAwcq0cGgeVXcenWDF3ZL9O8rbhkYSMMVROBlXepqgjt3J4dOxb6YXa2kOLzet20Rz49anSLB1i9bazbvVyHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KrNkDNoT; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KrNkDNoT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2SGp2FKmz30FF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 18:25:53 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60U2vfVe011251;
	Fri, 30 Jan 2026 07:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Vp/MVX
	WKLfmcf3W30OS3OMGE1YCMMoCP2G4v7UNz/A8=; b=KrNkDNoTpGIWn32FP21hNm
	8zRCqfOsV8SqVYFljGKX4GYWWwx32OiWBR5KulaCb+LZGUsygOjdk8WDS5wdnMJf
	zzPZ17cywYjOJyRIuYTM3aFHX8LfZ3UXTsRK23nbZYh2ZZPEDlB7AcOrJ6DgemEc
	P3OjcYaNgpMCht3sKM/gBndfYdNMoCGK5L4wuimJriZqXVAdXBni7tHCtU2pJ/Ua
	xm3lmvNeHyv9mgCD3jcXC/HikUy4RKiABw8OIxBr55n86hjl7gP59Kayzz6F+nu0
	5GpB/avzes/B+0A0p3S+7IDLAWKrL+iZkR8a2Ux05/C4qtN9UrucE2YccU/AB6Sg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvmgg9u1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 07:25:05 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60U7P5fx015866;
	Fri, 30 Jan 2026 07:25:05 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvmgg9u15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 07:25:05 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60U24ewf018303;
	Fri, 30 Jan 2026 07:25:03 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bwb4251x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 07:25:03 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60U7P2X831326754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 07:25:02 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7568058061;
	Fri, 30 Jan 2026 07:25:02 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2AF2958056;
	Fri, 30 Jan 2026 07:24:53 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.240.86])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 30 Jan 2026 07:24:52 +0000 (GMT)
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
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4 0/8] Generic IRQ entry/exit support for powerpc
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260123073916.956498-1-mkchauras@linux.ibm.com>
Date: Fri, 30 Jan 2026 12:54:40 +0530
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com,
        andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        ruanjinjie@huawei.com, sshegde@linux.ibm.com,
        akpm@linux-foundation.org, charlie@rivosinc.com, deller@gmx.de,
        ldv@strace.io, macro@orcam.me.uk, segher@kernel.crashing.org,
        peterz@infradead.org, bigeasy@linutronix.de, namcao@linutronix.de,
        tglx@linutronix.de, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E4046FE5-A919-4B30-B6D8-8F968628CFE3@linux.ibm.com>
References: <20260123073916.956498-1-mkchauras@linux.ibm.com>
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Z4vh3XRA c=1 sm=1 tr=0 ts=697c5cd1 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=PKHrbpWhOttoSJa1NdwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: MOtuIipkCsAG32U1n9mma2eNkA-XhVLe
X-Proofpoint-ORIG-GUID: 1eWwm_FmuSP_nBNnRBgIffQncjCokOBm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA1NSBTYWx0ZWRfX6KNP6j5jq2+v
 nANystBdQ3Fe6bnYg3ATgoo+QUV4er0iY7XpMFXF6xm5NXGu8g6n2OmS2JJ1vFdFmpVKJwPgEhV
 IJ9UGdgyz1ALoUiOn//fgKTy4a3AwPq5Qs9AA1D+tCLocmcZds6VGjlFkYKl8ivJRf4+bbEZuWi
 rqyzd+piEVUiMufOrJLG2UsPpzDfEiPFQ/R9CNiS25MimTVdXcZvI7uChznUmALsqlgo90rtMdh
 cDsCLkuk3oRTGy34U0XMcanL0XPCbqRNZh9JjCP+PGbJ+Gxtqq+SwUtcto7WhIBIORo/xeNKIy3
 x9k80cATF1slciXugXstQ4HmrCunD5pu9RznmUy8ScwmmcPfRhfJnMGngRAbmpQ5rzyE2mhz5eQ
 uW7f77p2ph2EhGB4/TwTpDUUJmhE2RWmlS9WJbYLzeYlePxq6Kq8KYMvmrkXGhvhmSHCeIJi/no
 rxB7pPwZihtWOZ0gxfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601300055
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16423-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,google.com,arm.com,redhat.com,amacapital.net,chromium.org,huawei.com,linux-foundation.org,rivosinc.com,gmx.de,strace.io,orcam.me.uk,kernel.crashing.org,infradead.org,linutronix.de,lists.ozlabs.org,vger.kernel.org,googlegroups.com];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:oleg@redhat.com,m:kees@kernel.org,m:luto@amacapital.net,m:wad@chromium.org,m:mchauras@linux.ibm.com,m:thuth@redhat.com,m:ruanjinjie@huawei.com,m:sshegde@linux.ibm.com,m:akpm@linux-foundation.org,m:charlie@rivosinc.com,m:deller@gmx.de,m:ldv@strace.io,m:macro@orcam.me.uk,m:segher@kernel.crashing.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:namcao@linutronix.de,m:tglx@linutronix.de,m:mark.barnett@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:mkchauras@linux.ibm.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 05949B7E60
X-Rspamd-Action: no action



> On 23 Jan 2026, at 1:09=E2=80=AFPM, Mukesh Kumar Chaurasiya =
<mkchauras@linux.ibm.com> wrote:
>=20
> Adding support for the generic irq entry/exit handling for PowerPC. =
The
> goal is to bring PowerPC in line with other architectures that already
> use the common irq entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths.
>=20
> This is slightly tested of ppc64le and ppc32.
>=20
> The performance benchmarks are below:
>=20
> perf bench syscall usec/op (-ve is improvement)
>=20
> | Syscall | Base        | test        | change % |
> | ------- | ----------- | ----------- | -------- |
> | basic   | 0.093543    | 0.093023    | -0.56    |
> | execve  | 446.557781  | 450.107172  | +0.79    |
> | fork    | 1142.204391 | 1156.377214 | +1.24    |
> | getpgid | 0.097666    | 0.092677    | -5.11    |
>=20
> perf bench syscall ops/sec (+ve is improvement)
>=20
> | Syscall | Base     | New      | change % |
> | ------- | -------- | -------- | -------- |
> | basic   | 10690548 | 10750140 | +0.56    |
> | execve  | 2239     | 2221     | -0.80    |
> | fork    | 875      | 864      | -1.26    |
> | getpgid | 10239026 | 10790324 | +5.38    |
>=20
>=20
> IPI latency benchmark (-ve is improvement)
>=20
> | Metric         | Base (ns)     | New (ns)      | % Change |
> | -------------- | ------------- | ------------- | -------- |
> | Dry run        | 583136.56     | 584136.35     | 0.17%    |
> | Self IPI       | 4167393.42    | 4149093.90    | -0.44%   |
> | Normal IPI     | 61769347.82   | 61753728.39   | -0.03%   |
> | Broadcast IPI  | 2235584825.02 | 2227521401.45 | -0.36%   |
> | Broadcast lock | 2164964433.31 | 2125658641.76 | -1.82%   |
>=20
>=20
> Thats very close to performance earlier with arch specific handling.
>=20
> Tests done:
> - Build and boot on ppc64le pseries.
> - Build and boot on ppc64le powernv8 powernv9 powernv10.
> - Build and boot on ppc32.
> - Performance benchmark done with perf syscall basic on pseries.
>=20
> Changelog:
> V3 -> V4
> - Fixed the issue in older gcc version where linker couldn't find
>   mem functions
> - Merged IRQ enable and syscall enable into a single patch
> - Cleanup for unused functions done in separate patch.
> - Some other cosmetic changes
> V3: =
https://lore.kernel.org/all/20251229045416.3193779-1-mkchauras@linux.ibm.c=
om/
>=20
> V2 -> V3
> - #ifdef CONFIG_GENERIC_IRQ_ENTRY removed from unnecessary places
> - Some functions made __always_inline
> - pt_regs padding changed to match 16byte interrupt stack alignment
> - And some cosmetic changes from reviews from earlier patch
> V2: =
https://lore.kernel.org/all/20251214130245.43664-1-mkchauras@linux.ibm.com=
/
>=20
> V1 -> V2
> - Fix an issue where context tracking was showing warnings for
>   incorrect context
> V1: =
https://lore.kernel.org/all/20251102115358.1744304-1-mkchauras@linux.ibm.c=
om/
>=20
> RFC -> PATCH V1
> - Fix for ppc32 spitting out kuap lock warnings.
> - ppc64le powernv8 crash fix.
> - Review comments incorporated from previous RFC.
> RFC =
https://lore.kernel.org/all/20250908210235.137300-2-mchauras@linux.ibm.com=
/
>=20
> Mukesh Kumar Chaurasiya (8):
>  powerpc: rename arch_irq_disabled_regs
>  powerpc: Prepare to build with generic entry/exit framework
>  powerpc: introduce arch_enter_from_user_mode
>  powerpc: Introduce syscall exit arch functions
>  powerpc: add exit_flags field in pt_regs
>  powerpc: Prepare for IRQ entry exit
>  powerpc: Enable GENERIC_ENTRY feature
>  powerpc: Remove unused functions
>=20
> arch/powerpc/Kconfig                    |   1 +
> arch/powerpc/include/asm/entry-common.h | 533 ++++++++++++++++++++++++
> arch/powerpc/include/asm/hw_irq.h       |   4 +-
> arch/powerpc/include/asm/interrupt.h    | 386 +++--------------
> arch/powerpc/include/asm/kasan.h        |  15 +-
> arch/powerpc/include/asm/ptrace.h       |   6 +-
> arch/powerpc/include/asm/signal.h       |   1 -
> arch/powerpc/include/asm/stacktrace.h   |   6 +
> arch/powerpc/include/asm/syscall.h      |   5 +
> arch/powerpc/include/asm/thread_info.h  |   1 +
> arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
> arch/powerpc/kernel/interrupt.c         | 254 ++---------
> arch/powerpc/kernel/ptrace/ptrace.c     | 142 +------
> arch/powerpc/kernel/signal.c            |  25 +-
> arch/powerpc/kernel/syscall.c           | 119 +-----
> arch/powerpc/kernel/traps.c             |   2 +-
> arch/powerpc/kernel/watchdog.c          |   2 +-
> arch/powerpc/perf/core-book3s.c         |   2 +-
> 18 files changed, 690 insertions(+), 828 deletions(-)
> create mode 100644 arch/powerpc/include/asm/entry-common.h
>=20
> --=20
> 2.52.0
>=20

Tested this patch set, and it builds successfully. Also ran ltp, ptrace, =
ftrace, perf related tests and no crash or warnings observed. Please add =
below tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.=

