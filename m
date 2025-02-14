Return-Path: <linuxppc-dev+bounces-6194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F0EA35DE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 13:53:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvX6F6yQWz3bkb;
	Fri, 14 Feb 2025 23:53:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739537605;
	cv=none; b=TZWxWWhEhG9AJ6FKTCOVK4vWn4zzQG+rY3krRD2Zx8Aia0Lskt8kq61g/h5K4yvuo87nTrNc8wI8P5qU1SS9rr1i4JTkYkC63KGHR8yfa3OhDPLV9GJ1zoSn3DCYOigcgUvicpYLB5DdOv1r+jbuSTpxmUl8FSzRI06yWDd0xdq8xaCi50m68gjTKGTQAeXAWhbzP1PgY54570F1TZ510VPk+qoF596pHvFtJStdBqNhRyINZkYxZ55TJhol4wMf5MVGdOG8G535HOQ7dRzli8YeOq0j36zaVJIsxUrTEfvj7O1pDSjVi6qtd/+D9n9TTm0/GKKtdZjxhg2LCOkqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739537605; c=relaxed/relaxed;
	bh=K/vHlxtp8u2AsFXYa5DpBNIqpU2zSvYFe8jdl1RRDL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSQQXzyxVtgz/VD/5LFR1he/Jr8Fi9VpPgHF6EWMzJf3MAddQE8kCO9/rsnyfwWNB5m1b40zAqdNGEdFupw+3sCNWom/Jm6fc1u+xLulNW291ocHIO14uHryoqVU9VfH47U7E0Q69XPxkwzVYQGrHF6chZ8rtpfBm/se58a/7OxM4rmR8xt94J4fNkKUiI5YYtk7hVziF0UqCADevDsfA8wtLNX3bennae2IfqpsuaTS8ew/0IfDO/CL+A/tamIoi/nmS4JsqA1FLSLdTor5rayPmpvQNMPZ+ht2BAu7HXsptukfrpUBQ9hQERAYVSXjL31k5xQvHM8dGbCgNhGEPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XUX7IPjM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XUX7IPjM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvX6F2K60z30Gq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 23:53:25 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EB7VWw013089;
	Fri, 14 Feb 2025 12:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=K/vHlx
	tp8u2AsFXYa5DpBNIqpU2zSvYFe8jdl1RRDL4=; b=XUX7IPjM1KRdHKzc4SqX70
	fE+vn3LRBcAf+Qj8YRC98Tnkwa54F96gwKheFYWxDEYaaS4yU/Y4msAdjCbL5oRa
	+OhkoVWFwnhcI+0n9YcFvyT1Ju8qcieeWG/4ccGOw45T0JYtaw9S/alsgb2CzQhR
	XK/LTc89wxJgs3t5i4BP1Zd33CGw0niVhjcmLdJHdH9gI+1gDxuzspbAf5EPxf9T
	C19MaIivT3oOwVMFDoFdIx2RduJKN8COoJZJznM50NczUv3e/vGVhBr1SSLofWfA
	U8YUmpCRfuUzqCrDvBYI1iV6C4IXg2JC6+28jzlH/h/WWMxa2EawmLJN/18ns1pQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44svp0ambn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:53:13 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51ECr6YH003082;
	Fri, 14 Feb 2025 12:53:12 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44svp0ambm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:53:12 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51EAX7pc028244;
	Fri, 14 Feb 2025 12:53:12 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44phyyurww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:53:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51ECrAH351970326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 12:53:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 184CA20043;
	Fri, 14 Feb 2025 12:53:10 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6BA720040;
	Fri, 14 Feb 2025 12:53:05 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.125.185])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Feb 2025 12:53:05 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH v2] powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC
Date: Fri, 14 Feb 2025 18:23:03 +0530
Message-ID: <173953661683.199877.9730863250927440226.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <06621423da339b374f48c0886e3a5db18e896be8.1739342693.git.christophe.leroy@csgroup.eu>
References: <06621423da339b374f48c0886e3a5db18e896be8.1739342693.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-ORIG-GUID: RRd7hmEcIPgC1HcBVjzk2ByDOy6x_H5c
X-Proofpoint-GUID: OUzYFy5Itgqmw9uNZPi0y7RtKoOzsu1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 mlxlogscore=538 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140092
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 12 Feb 2025 07:46:28 +0100, Christophe Leroy wrote:
> Erhard reported the following KASAN hit while booting his PowerMac G4
> with a KASAN-enabled kernel 6.13-rc6:
> 
>   BUG: KASAN: vmalloc-out-of-bounds in copy_to_kernel_nofault+0xd8/0x1c8
>   Write of size 8 at addr f1000000 by task chronyd/1293
> 
>   CPU: 0 UID: 123 PID: 1293 Comm: chronyd Tainted: G        W          6.13.0-rc6-PMacG4 #2
>   Tainted: [W]=WARN
>   Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
>   Call Trace:
>   [c2437590] [c1631a84] dump_stack_lvl+0x70/0x8c (unreliable)
>   [c24375b0] [c0504998] print_report+0xdc/0x504
>   [c2437610] [c050475c] kasan_report+0xf8/0x108
>   [c2437690] [c0505a3c] kasan_check_range+0x24/0x18c
>   [c24376a0] [c03fb5e4] copy_to_kernel_nofault+0xd8/0x1c8
>   [c24376c0] [c004c014] patch_instructions+0x15c/0x16c
>   [c2437710] [c00731a8] bpf_arch_text_copy+0x60/0x7c
>   [c2437730] [c0281168] bpf_jit_binary_pack_finalize+0x50/0xac
>   [c2437750] [c0073cf4] bpf_int_jit_compile+0xb30/0xdec
>   [c2437880] [c0280394] bpf_prog_select_runtime+0x15c/0x478
>   [c24378d0] [c1263428] bpf_prepare_filter+0xbf8/0xc14
>   [c2437990] [c12677ec] bpf_prog_create_from_user+0x258/0x2b4
>   [c24379d0] [c027111c] do_seccomp+0x3dc/0x1890
>   [c2437ac0] [c001d8e0] system_call_exception+0x2dc/0x420
>   [c2437f30] [c00281ac] ret_from_syscall+0x0/0x2c
>   --- interrupt: c00 at 0x5a1274
>   NIP:  005a1274 LR: 006a3b3c CTR: 005296c8
>   REGS: c2437f40 TRAP: 0c00   Tainted: G        W           (6.13.0-rc6-PMacG4)
>   MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 24004422  XER: 00000000
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC
      https://git.kernel.org/powerpc/c/d262a192d38e527faa5984629aabda2e0d1c4f54

Thanks

