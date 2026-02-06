Return-Path: <linuxppc-dev+bounces-16693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHWiGCUdhmmTJwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 17:56:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8761009F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 17:56:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f70bN6Wwzz309y;
	Sat, 07 Feb 2026 03:56:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770396960;
	cv=none; b=izSsowFXSv9eOTRHCX26U3At/ao4RMCDI2Y1RWjm5RyIswURD9tk17z4Gi/NeNU0q5aEeGf5SbZ/pcB9bHieRIMw8T4930xZyTAmG05un59kQa8mOn1qTIy0g4w2NbIKr8j2NXNVSvbUKNX0H/udmslb9WfuMBoXwLJxXgEeQVD6zULwTsDrtXPXijs5HGFdy+lCF9a/i6gbYwM8BNs1PpUIfokY9pI8CH6CpRik8POUoc4gTHm+KpdFv3gzKU/WBep0OJCD5uCXpBuPbINKuf0Vw0w8bsUwo+jASn+WZWEiZMz4IW1w3nbVxGoBvbkMoKNe4RzYbzubHvRd6vKKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770396960; c=relaxed/relaxed;
	bh=WDHuhmii8UVkJ/u8uQhZujlayEcsbkKUhzG4qNcIQjA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=W2qAB/LK6fHpEgjkFmrhYHCFIv5ZKaMKHGaIZX5kmMxpkN02sjGxANAEAhf4raXaO1TzCyy74cDG1RjFLMuwseUPVkcX/WHqWIryJene1RYJQ+bPUivx3RYQEGiNbwb4jW7ahyFlEjwqD9tKMeWkGotAz76iN5Xv482Okke6+MJoTP7otUWtl4gn7jH9Cy8K2KSsfggDgbYjoYBUWH1GhaWBKIM87jATIobXh9bvxc4vm8R3z3y6gH4gbWic5aFLl15zGWOsh5VeUjQZDD7uaHbFEY7NgotVN2J0AChOec+2zNp21yUG4oNTvjpqAIUcCqSgyPH0SC/ybY5ZtKwY+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CQ5AcyTN; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CQ5AcyTN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f70bM4CLpz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 03:55:58 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6168kGFG030403;
	Fri, 6 Feb 2026 16:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WDHuhm
	ii8UVkJ/u8uQhZujlayEcsbkKUhzG4qNcIQjA=; b=CQ5AcyTN4H06maY9nH2FS4
	7GMcCXQ1/qBxmFKoGlzFPdyx+USKHv8TznXLFuHFMriZdI4rjVxHO11d1mvYBWz8
	wFTMqpCCyPVViA5RD/8My7Dc7hfHDQ7t7s2tCdj6JkGCdn/XTewQCnWtGu++MonF
	sEhtAeEtnQIu4q1+QDsGsxxWSdOekL4nRYmdTykhWGkWhsXD83DsQz0YZs8Qtz6i
	7kGp74JVlDksLqKgxjpSsYEwfssEWWBdYUyhXVmXeRNKovOgGfe2wh2/u6+zu5xQ
	uUdZjF12UeFKn5CVmqSBI+PpqwdTb1vbJl1SCUC/mjdXa4HMCgNOt89K39YlU3zA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c19cwh9fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Feb 2026 16:55:32 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 616GtVYL022433;
	Fri, 6 Feb 2026 16:55:31 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c19cwh9fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Feb 2026 16:55:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 616FwN8T009156;
	Fri, 6 Feb 2026 16:55:31 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c1veyf2p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Feb 2026 16:55:31 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 616GtUnW31654490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Feb 2026 16:55:30 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4453D58052;
	Fri,  6 Feb 2026 16:55:30 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9BE758065;
	Fri,  6 Feb 2026 16:55:22 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.249.149])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  6 Feb 2026 16:55:22 +0000 (GMT)
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
Subject: Re: [PATCH V3 0/3] Rust support for powerpc
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260205180429.3280657-1-mkchauras@gmail.com>
Date: Fri, 6 Feb 2026 22:25:09 +0530
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
        a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
        dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
        rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F9EAA7DA-7CD3-43CB-8C6A-671E519BC963@linux.ibm.com>
References: <20260205180429.3280657-1-mkchauras@gmail.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEyMyBTYWx0ZWRfXwQTrGuZHHBJd
 rJ/l6bwnIOM33g7LpWXX1Sf23d9MANX9kF+jOK8SopJVeeAsYCm3oUOt47JyvRBoWb/PV5Ccewj
 r21oBgsA+KHDBOnXwMPwD2WeBbOhjb0MDgjR83F09QzHrHP8r8TLkbFzl6svvqXOEnZwY2xEn8A
 di8O1weRYpZxe+Fa36aUQ/uW+keWXRc4/qZA55LggQTIQjxBbFses6ZaAECyeezx3x4vT901MWt
 yKLniss4i/ptrhFadDUiqcYqt2bSo9aJLkJfTpoPY/WMmGV/GEUZAI1MVgqJcP8cagHeNDMwtuK
 BIpf1fxZdK4B5Keg+lRP1ciI1jACGOKf/jbaroPydSmy4rCz0CgfiugY1hUBv1l5NxLjlDIGsmx
 u4j5L0VAp5Tt5D8ETIJmYZi6j+m0Xy0afSBI6eRxDx5JDL14V43nZcb2QjNmc7A1nWehoQEC/6Z
 OVWJ82DaqWszZqw07nQ==
X-Authority-Analysis: v=2.4 cv=UuRu9uwB c=1 sm=1 tr=0 ts=69861d04 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=2MjLW5cuPvDTUXhGF14A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: rKAbCXQU6ntD18MJSrVnl-2QzwLCgd6Q
X-Proofpoint-GUID: cQ4oq6Q_JzgXBg9zPMTZqe32qENXp67y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2602060123
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16693-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid]
X-Rspamd-Queue-Id: BF8761009F3
X-Rspamd-Action: no action



> On 5 Feb 2026, at 11:34=E2=80=AFPM, Mukesh Kumar Chaurasiya (IBM) =
<mkchauras@gmail.com> wrote:
>=20
> Enable experimental rust support for ppc64le and ppc32be. The patch =
for
> ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has =
been=20
> merged over it. ppc32 needs some toolchain fixes mentioned in the =
patch=20
> `rust: Add PowerPC support` and the discussion for that is done =
here[1].=20
>=20
> This has been tested on powernv9 hardware and power10 pseries qemu. I
> I request Link to test the ppc32 part as i don't have a hardware to =
test
> it out.=20
>=20
> [1] =
https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
> [2] =
https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com
>=20
> Changelog:
> V2 -> V3:
> - Splited HAVE_RUST in 2 lines
> - BINDGEN_TARGET_powerpc initialized before assigning the same to
>  BINDGEN_TARGET
> V2: =
https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com
>=20
> V1 -> V2:
> - jump label fix for rust has been moved to a separate patch
> - PPC32 support has been taken
> - rust support has been marked experimental
> - target.json dependency has been removed
> - HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64
>=20
> Link Mauve (1):
>  rust: Add PowerPC support
>=20
> Mukesh Kumar Chaurasiya (IBM) (2):
>  powerpc/jump_label: adjust inline asm to be consistent
>  powerpc: Enable Rust for ppc64le
>=20
> Documentation/rust/arch-support.rst   |  1 +
> arch/powerpc/Kconfig                  |  2 ++
> arch/powerpc/Makefile                 |  9 +++++++++
> arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
> rust/Makefile                         | 12 +++++++++++-
> 5 files changed, 36 insertions(+), 11 deletions(-)
>=20
> --=20
> 2.52.0
>=20

Tested this patch set, by applying on mainline kernel. Attached is the =
.config file used.

Please add below tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Logs:

rustc --version
rustc 1.95.0-nightly (e96bb7e44 2026-01-27)

llvm-18.1.8-3.el9.ppc64le

sudo insmod samples/rust/rust_minimal.ko
[   39.532119] rust_minimal: loading out-of-tree module taints kernel.
[   39.532132] rust_minimal: module verification failed: signature =
and/or required key missing - tainting kernel
[   39.532856] rust_minimal: Rust minimal sample (init)
[   39.532860] rust_minimal: Am I built-in? false
[   39.532864] rust_minimal: test_parameter: 1
# dmesg | tail -n 30
[    3.418850] systemd[1]: Mounted Kernel Trace File System.
[    3.419194] systemd[1]: Finished Create List of Static Device Nodes.
[    3.419482] systemd[1]: modprobe@configfs.service: Deactivated =
successfully.
[    3.419647] systemd[1]: Finished Load Kernel Module configfs.
[    3.419913] systemd[1]: modprobe@drm.service: Deactivated =
successfully.
[    3.420056] systemd[1]: Finished Load Kernel Module drm.
[    3.420405] systemd[1]: Finished Read and set NIS domainname from =
/etc/sysconfig/network.
[    3.420694] systemd[1]: Finished Generate network units from Kernel =
command line.
[    3.422214] systemd[1]: Mounting Kernel Configuration File System...
[    3.423543] systemd[1]: Finished Apply Kernel Variables.
[    3.424011] systemd[1]: Mounted Kernel Configuration File System.
[    3.430589] systemd[1]: Started Journal Service.
[    3.477706] fuse: init (API version 7.45)
[    3.548678] EXT4-fs (sda3): re-mounted =
78691517-64fe-451b-9009-14359b774643 r/w.
[    3.556791] systemd-journald[640]: Received client request to flush =
runtime journal.
[    3.681167] Adding 10485696k swap on /dev/sda2.  Priority:-1 =
extents:1 across:10485696k SS
[    3.693490] pseries_rng: Registering IBM pSeries RNG driver
[    3.693904] cryptd: max_cpu_qlen set to 1000
[    4.702590] RPC: Registered named UNIX socket transport module.
[    4.702604] RPC: Registered udp transport module.
[    4.702607] RPC: Registered tcp transport module.
[    4.702609] RPC: Registered tcp-with-tls transport module.
[    4.702612] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    6.701147] block sda: the capability attribute has been deprecated.
[   10.150485] fbcon: Taking over console
[   39.532119] rust_minimal: loading out-of-tree module taints kernel.
[   39.532132] rust_minimal: module verification failed: signature =
and/or required key missing - tainting kernel
[   39.532856] rust_minimal: Rust minimal sample (init)
[   39.532860] rust_minimal: Am I built-in? false
[   39.532864] rust_minimal: test_parameter: 1
# sudo rmmod rust_minimal
[ 4125.461822] rust_minimal: My numbers are [72, 108, 200]
[ 4125.461839] rust_minimal: Rust minimal sample (exit)
# sudo insmod samples/rust/rust_print.ko
[ 4142.492146] rust_print: Rust printing macros sample (init)
[ 4142.492158] rust_print: Emergency message (level 0) without args
[ 4142.492161] rust_print: Alert message (level 1) without args
[ 4142.492163] rust_print: Critical message (level 2) without args
[ 4142.492166] rust_print: Error message (level 3) without args
[ 4142.492169] rust_print: Warning message (level 4) without args
[ 4142.492171] rust_print: Notice message (level 5) without args
[ 4142.492174] rust_print: Info message (level 6) without args
[ 4142.492176] rust_print: A line that is continued without args
[ 4142.492181] rust_print: Emergency message (level 0) with args
[ 4142.492185] rust_print: Alert message (level 1) with args
[ 4142.492188] rust_print: Critical message (level 2) with args
[ 4142.492190] rust_print: Error message (level 3) with args
[ 4142.492193] rust_print: Warning message (level 4) with args
[ 4142.492195] rust_print: Notice message (level 5) with args
[ 4142.492197] rust_print: Info message (level 6) with args
[ 4142.492200] rust_print: A line that is continued with args
[ 4142.492205] rust_print: 1
[ 4142.492206] rust_print: "hello, world"
[ 4142.492208] rust_print: [rust_print_main.rs:35:5] c =3D "hello, =
world"
[ 4142.492213] rust_print: Arc<dyn Display> says 42
[ 4142.492214] rust_print: Arc<dyn Display> says hello, world
# dmesg | tail -n 50
[    3.419913] systemd[1]: modprobe@drm.service: Deactivated =
successfully.
[    3.420056] systemd[1]: Finished Load Kernel Module drm.
[    3.420405] systemd[1]: Finished Read and set NIS domainname from =
/etc/sysconfig/network.
[    3.420694] systemd[1]: Finished Generate network units from Kernel =
command line.
[    3.422214] systemd[1]: Mounting Kernel Configuration File System...
[    3.423543] systemd[1]: Finished Apply Kernel Variables.
[    3.424011] systemd[1]: Mounted Kernel Configuration File System.
[    3.430589] systemd[1]: Started Journal Service.
[    3.477706] fuse: init (API version 7.45)
[    3.548678] EXT4-fs (sda3): re-mounted =
78691517-64fe-451b-9009-14359b774643 r/w.
[    3.556791] systemd-journald[640]: Received client request to flush =
runtime journal.
[    3.681167] Adding 10485696k swap on /dev/sda2.  Priority:-1 =
extents:1 across:10485696k SS
[    3.693490] pseries_rng: Registering IBM pSeries RNG driver
[    3.693904] cryptd: max_cpu_qlen set to 1000
[    4.702590] RPC: Registered named UNIX socket transport module.
[    4.702604] RPC: Registered udp transport module.
[    4.702607] RPC: Registered tcp transport module.
[    4.702609] RPC: Registered tcp-with-tls transport module.
[    4.702612] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    6.701147] block sda: the capability attribute has been deprecated.
[   10.150485] fbcon: Taking over console
[   39.532119] rust_minimal: loading out-of-tree module taints kernel.
[   39.532132] rust_minimal: module verification failed: signature =
and/or required key missing - tainting kernel
[   39.532856] rust_minimal: Rust minimal sample (init)
[   39.532860] rust_minimal: Am I built-in? false
[   39.532864] rust_minimal: test_parameter: 1
[ 4125.461822] rust_minimal: My numbers are [72, 108, 200]
[ 4125.461839] rust_minimal: Rust minimal sample (exit)
[ 4142.492146] rust_print: Rust printing macros sample (init)
[ 4142.492158] rust_print: Emergency message (level 0) without args
[ 4142.492161] rust_print: Alert message (level 1) without args
[ 4142.492163] rust_print: Critical message (level 2) without args
[ 4142.492166] rust_print: Error message (level 3) without args
[ 4142.492169] rust_print: Warning message (level 4) without args
[ 4142.492171] rust_print: Notice message (level 5) without args
[ 4142.492174] rust_print: Info message (level 6) without args
[ 4142.492176] rust_print: A line that is continued without args
[ 4142.492181] rust_print: Emergency message (level 0) with args
[ 4142.492185] rust_print: Alert message (level 1) with args
[ 4142.492188] rust_print: Critical message (level 2) with args
[ 4142.492190] rust_print: Error message (level 3) with args
[ 4142.492193] rust_print: Warning message (level 4) with args
[ 4142.492195] rust_print: Notice message (level 5) with args
[ 4142.492197] rust_print: Info message (level 6) with args
[ 4142.492200] rust_print: A line that is continued with args
[ 4142.492205] rust_print: 1
[ 4142.492206] rust_print: "hello, world"
[ 4142.492208] rust_print: [rust_print_main.rs:35:5] c =3D "hello, =
world"
[ 4142.492213] rust_print: Arc<dyn Display> says 42
[ 4142.492214] rust_print: Arc<dyn Display> says hello, world
# sudo rmmod rust_print
[ 4142.492217] rust_print: "hello, world"
[ 4153.334714] rust_print: Rust printing macros sample (exit)

# sudo rmmod rust_debugfs

Regards,
Venkat.=

