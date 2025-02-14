Return-Path: <linuxppc-dev+bounces-6192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E662A35DE6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 13:53:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvX5z70JWz30VY;
	Fri, 14 Feb 2025 23:53:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739537591;
	cv=none; b=TEQ0mkRunel0TAixqoC+tt/Vv5bWeQqpr1JetSts2z4zuCJt98rxghm9WBLipHkbbNpJyvBwLsQetkul7Ze+7BvlTBjpSGtFvF8JCqQ5geTkK7U1caqQWCsCA5cYxcWJOoGv52UxVtF8ard7kTFWXYghPHMo16zogHEV22hz7/cNIdO/x/Z+uY57b5nh6ypwoOGZZkb5cmtP01zHHoUylnFvVRMeMy9PUy4Fy3LgL5Jsy6nHCaUXEtZplEVN1z9dxvUCdRYWZfJz1XztWvB1T+in2keyKIRYYbdK56aCenAbOWznM/oE+hQHGbRaZDSyV7G4enlOEUIxZKmsVhgjng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739537591; c=relaxed/relaxed;
	bh=SIQpZMzGZrldU/1bEWKd+aQqNiMGG457ywKG5GbG4z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iaR+N0NDroXXuy6dc0vpnxG7SeVjt9LAUkBwO9+IQzqijAKpO6UTzTMrsIfv/GeixEuQlXm0x8z2izyWfJnyOPWc5X4EwiIdY5CQJA8SYfyWXUOaO+B9y+orN1HTi6iJmGffF4N+QpcZVJt8CWSxDk8xN7g6FCa8PYIm1/ixYWyBh55IEnNqov6sgd8RKaQILdoP55cmYdwcFvu+2HhrGYEtuVbh2o7BIAh2MW1u9Kgb1svckZYM4q5FSEPzVtJbCMhjPJbztIHgj/L+UCbpa7U2KsWNtOzLsaKsRv9IEzD+UccO99n69EBru1BIwjcUZulJ7/Er6uqcDMR6/LAlcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N70aOHMt; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N70aOHMt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvX5z0cphz30Gq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 23:53:10 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E5OJbI010280;
	Fri, 14 Feb 2025 12:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SIQpZM
	zGZrldU/1bEWKd+aQqNiMGG457ywKG5GbG4z8=; b=N70aOHMtq8+CZaVNR6XJi9
	l1LkPrnjbWHPXW44CZx4UQ0R+rU6KZCPOrej8b/iXY36qzvanI4ThSBz37gR1Q2Q
	IPtvQSqJGcp7KwkpGSaXoPqfTD9unZNGIyvCi91C/dlFuSa181THj8QehOec1vFY
	9cffl4SFFirtFUnVTkZ/UJzhtBfibmdd2aeOca7t2JfkFAfbaFQeUxVqMQPELFGE
	/Ax9QyRl4EiCCro2/OF237UuDk9E7tlU181zxO0IyhF+PY+5+64n2ohrWQkgGCZj
	wR4fhOuH57KS2g/aCWrPVyFdfwUY6dE117ypjChTZM/nQHAj93k9ZfIA2dxRB4aw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44syn81wxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:52:59 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51ECqwVG025200;
	Fri, 14 Feb 2025 12:52:58 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44syn81wxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:52:58 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51EBZ9bm001051;
	Fri, 14 Feb 2025 12:52:57 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pjknkkxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:52:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51ECqt5N42140106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 12:52:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8572520043;
	Fri, 14 Feb 2025 12:52:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28BC62004E;
	Fri, 14 Feb 2025 12:52:51 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.125.185])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Feb 2025 12:52:50 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] powerpc/code-patching: Disable KASAN report during patching via temporary mm
Date: Fri, 14 Feb 2025 18:22:47 +0530
Message-ID: <173953661682.199877.13295619540278726758.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <1c05b2a1b02ad75b981cfc45927e0b4a90441046.1738577687.git.christophe.leroy@csgroup.eu>
References: <1c05b2a1b02ad75b981cfc45927e0b4a90441046.1738577687.git.christophe.leroy@csgroup.eu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: q5jwVCIH-Wkiuq9oi1Dmxf7-NrLK3270
X-Proofpoint-GUID: 2j3UAGZW-ZS4xgwiNH9Ipj2klGkHJs0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 mlxlogscore=336 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502140092
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 03 Feb 2025 11:14:57 +0100, Christophe Leroy wrote:
> Erhard reports the following KASAN hit on Talos II (power9) with kernel 6.13:
> 
> [   12.028126] ==================================================================
> [   12.028198] BUG: KASAN: user-memory-access in copy_to_kernel_nofault+0x8c/0x1a0
> [   12.028260] Write of size 8 at addr 0000187e458f2000 by task systemd/1
> 
> [   12.028346] CPU: 87 UID: 0 PID: 1 Comm: systemd Tainted: G                T  6.13.0-P9-dirty #3
> [   12.028408] Tainted: [T]=RANDSTRUCT
> [   12.028446] Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
> [   12.028500] Call Trace:
> [   12.028536] [c000000008dbf3b0] [c000000001656a48] dump_stack_lvl+0xbc/0x110 (unreliable)
> [   12.028609] [c000000008dbf3f0] [c0000000006e2fc8] print_report+0x6b0/0x708
> [   12.028666] [c000000008dbf4e0] [c0000000006e2454] kasan_report+0x164/0x300
> [   12.028725] [c000000008dbf600] [c0000000006e54d4] kasan_check_range+0x314/0x370
> [   12.028784] [c000000008dbf640] [c0000000006e6310] __kasan_check_write+0x20/0x40
> [   12.028842] [c000000008dbf660] [c000000000578e8c] copy_to_kernel_nofault+0x8c/0x1a0
> [   12.028902] [c000000008dbf6a0] [c0000000000acfe4] __patch_instructions+0x194/0x210
> [   12.028965] [c000000008dbf6e0] [c0000000000ade80] patch_instructions+0x150/0x590
> [   12.029026] [c000000008dbf7c0] [c0000000001159bc] bpf_arch_text_copy+0x6c/0xe0
> [   12.029085] [c000000008dbf800] [c000000000424250] bpf_jit_binary_pack_finalize+0x40/0xc0
> [   12.029147] [c000000008dbf830] [c000000000115dec] bpf_int_jit_compile+0x3bc/0x930
> [   12.029206] [c000000008dbf990] [c000000000423720] bpf_prog_select_runtime+0x1f0/0x280
> [   12.029266] [c000000008dbfa00] [c000000000434b18] bpf_prog_load+0xbb8/0x1370
> [   12.029324] [c000000008dbfb70] [c000000000436ebc] __sys_bpf+0x5ac/0x2e00
> [   12.029379] [c000000008dbfd00] [c00000000043a228] sys_bpf+0x28/0x40
> [   12.029435] [c000000008dbfd20] [c000000000038eb4] system_call_exception+0x334/0x610
> [   12.029497] [c000000008dbfe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
> [   12.029561] --- interrupt: 3000 at 0x3fff82f5cfa8
> [   12.029608] NIP:  00003fff82f5cfa8 LR: 00003fff82f5cfa8 CTR: 0000000000000000
> [   12.029660] REGS: c000000008dbfe80 TRAP: 3000   Tainted: G                T   (6.13.0-P9-dirty)
> [   12.029735] MSR:  900000000280f032 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI>  CR: 42004848  XER: 00000000
> [   12.029855] IRQMASK: 0
>                GPR00: 0000000000000169 00003fffdcf789a0 00003fff83067100 0000000000000005
>                GPR04: 00003fffdcf78a98 0000000000000090 0000000000000000 0000000000000008
>                GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>                GPR12: 0000000000000000 00003fff836ff7e0 c000000000010678 0000000000000000
>                GPR16: 0000000000000000 0000000000000000 00003fffdcf78f28 00003fffdcf78f90
>                GPR20: 0000000000000000 0000000000000000 0000000000000000 00003fffdcf78f80
>                GPR24: 00003fffdcf78f70 00003fffdcf78d10 00003fff835c7239 00003fffdcf78bd8
>                GPR28: 00003fffdcf78a98 0000000000000000 0000000000000000 000000011f547580
> [   12.030316] NIP [00003fff82f5cfa8] 0x3fff82f5cfa8
> [   12.030361] LR [00003fff82f5cfa8] 0x3fff82f5cfa8
> [   12.030405] --- interrupt: 3000
> [   12.030444] ==================================================================
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/code-patching: Disable KASAN report during patching via temporary mm
      https://git.kernel.org/powerpc/c/dc9c5166c3cb044f8a001e397195242fd6796eee

Thanks

