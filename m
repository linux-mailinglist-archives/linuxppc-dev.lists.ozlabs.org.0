Return-Path: <linuxppc-dev+bounces-8273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE62AA83BF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 May 2025 05:22:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZqqhX5jMfz2yqW;
	Sun,  4 May 2025 13:22:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746328924;
	cv=none; b=gSRMJxo5rX3iaJSPyAnHPmSu9m0ILQRqOHmwx+VeHhbbUoSFA7CQ/J1MGDDDgBrGrKnbyw4SIJiY6+cQ74grFiPBVr++Gdd7ZRMe7+KbrBaWIUZeBVVGw2y7t+GSwN6zuTT008BZoROLrEpmeu34tYmzefC+fcYyDeeEAoxBUGmjPxbM4p0oi1MySzBvgZRssOs0nW35CBwqlPrfN3hKPDirTG+whcbgpQyUiMNEbK4tE8lPhBhL7+tJiGyLGk7oSnEHJlgWnUykYk2+8Nc+ZbIClA8Vz4N5KbNmnZUdZC+vUjXvJJ89jkJmVJEuOtPawHFCTHyzWMHBh60RBY4fpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746328924; c=relaxed/relaxed;
	bh=+HfweOBbkgvqFntRb8rDHzQ7txkSSueZh8ubgyu2t5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WLjRlBkH9G+C/+LIoSVrSVtxP6hr0dGnTPfF3ihj0nlI/+Uung+ahZ9GNFPeRcjJcfyoG2me4omr+OxnXyQt7uWlcz66JHrisI2qMS+3wC6Cl7C3OMV87GH8HPWXEW4GR/mP+vDgwW37/7Fgj276O1xy0gZ8e09YquxlfRp7GS1KWB2RDve3eu39aA2L5nbizsYwFcS8N/bJ/eiieEiLS+suzy09cjznn61uGlC6u2hxr0k+goqxFSOM0Hpdbfswwh2An4fqrhNBsqRsbj/gQ6SEH5UCnvW3tMK5Hnp05xf0gcTbmudeT126gmJWf+n/lXgT11pAZ5I7T0A+pA6uug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hJre+UKO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hJre+UKO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZqqhX0JkGz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 May 2025 13:22:03 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5442xe4A031625;
	Sun, 4 May 2025 03:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+HfweO
	BbkgvqFntRb8rDHzQ7txkSSueZh8ubgyu2t5g=; b=hJre+UKOp84bYbvHWgIHxf
	zA3uQdU5adNrp5Oxv7DkSPcurvPZJkU4mkDOsRXgMn0XSalUJoErr4EOulnnTsxn
	7vzQr6Eapegp8Ddi3Te4fyDUvh0Yamu/6UgcBwFvC+axkDZ9dexLec/TRs746RTA
	CA9DN47Ilkd4GKOJ11KJHs9c2c6Q9MCRPl6gfXPCQpQP2ASNmvCwROqjWQAh/j/t
	Z00WCBfLhYVYSaKF5DkNvaqZ99S+xOLCFI15oFixw6PSfYn3etDqQbXRySISRvd1
	8sDGkcgRd+8EQXWb9EJi5D9AklpmAeNDJjsbvIdI0llI1v67Ab689tJHX0/QJu4w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46du888nmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:47 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5443LlCf008226;
	Sun, 4 May 2025 03:21:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46du888nmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5443FUv6013880;
	Sun, 4 May 2025 03:21:46 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46e06200gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:46 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443Li8N41550140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:21:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C47320043;
	Sun,  4 May 2025 03:21:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8068420040;
	Sun,  4 May 2025 03:21:38 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:38 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Hari Bathini <hbathini@linux.ibm.com>
Cc: linux-trace-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Viktor Malik <vmalik@redhat.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] powerpc64/ftrace: fix clobbered r15 during livepatching
Date: Sun,  4 May 2025 08:51:36 +0530
Message-ID: <174632869186.233894.4009537486958760221.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416191227.201146-1-hbathini@linux.ibm.com>
References: <20250416191227.201146-1-hbathini@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyNyBTYWx0ZWRfX4MqmmYiUiAD1 YQ/QDwH186KoM3gcU5IPTflw60TQwBG2wi2uhttYPAaNAYG/yek9QaGB60KC/7C6NFjctgDst1H PCdPy5ozYEHty3dvcqQO19LzCCEwDuasWxYlWghxy37CqV12IvbrvZsv1pgrx4fNpRNctuubhZU
 bvQ6IEs1pEccZ0QPESKUhHDoMdk4RkQXBLaP2GZhaHqIGNNbaP0Uf5P2yzAGQMayFjyQdwI3Dj0 q7CBEqssuZM2Q9JDdp/GpAFOhvyNX9IbLIY0DY6R34VjMoSR7j9XjeltnKvSMC+/NT06BNDZZ2t 56lwvVcSJ8m4Ia0RdeZGQ9BChzxNIAEfvXBsHF80xEMunhwPoJ6pZjnZvl0VTTOjYaw78DTcnhL
 uDRcIHT5WHvT/l7iOqO8Sb7kovkH6pv+Tm+0Xu8QZ5tZeJIXkuhwDH3UO25a3/p2FBz2dg3w
X-Proofpoint-ORIG-GUID: D7VNrTAyrh7Ix-M5LjKcmxbdAfxR3upH
X-Authority-Analysis: v=2.4 cv=c7mrQQ9l c=1 sm=1 tr=0 ts=6816dd4b cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=j9ENY3UkbgF66zyUuo4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: tpEtm0Ah2R4auKXeVRcaWAvedqRwFzUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1011 malwarescore=0 mlxlogscore=312 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040027
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 17 Apr 2025 00:42:27 +0530, Hari Bathini wrote:
> While r15 is clobbered always with PPC_FTRACE_OUT_OF_LINE, it is
> not restored in livepatch sequence leading to not so obvious fails
> like below:
> 
>   BUG: Unable to handle kernel data access on write at 0xc0000000000f9078
>   Faulting instruction address: 0xc0000000018ff958
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   ...
>   NIP:  c0000000018ff958 LR: c0000000018ff930 CTR: c0000000009c0790
>   REGS: c00000005f2e7790 TRAP: 0300   Tainted: G              K      (6.14.0+)
>   MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2822880b  XER: 20040000
>   CFAR: c0000000008addc0 DAR: c0000000000f9078 DSISR: 0a000000 IRQMASK: 1
>   GPR00: c0000000018f2584 c00000005f2e7a30 c00000000280a900 c000000017ffa488
>   GPR04: 0000000000000008 0000000000000000 c0000000018f24fc 000000000000000d
>   GPR08: fffffffffffe0000 000000000000000d 0000000000000000 0000000000008000
>   GPR12: c0000000009c0790 c000000017ffa480 c00000005f2e7c78 c0000000000f9070
>   GPR16: c00000005f2e7c90 0000000000000000 0000000000000000 0000000000000000
>   GPR20: 0000000000000000 c00000005f3efa80 c00000005f2e7c60 c00000005f2e7c88
>   GPR24: c00000005f2e7c60 0000000000000001 c0000000000f9078 0000000000000000
>   GPR28: 00007fff97960000 c000000017ffa480 0000000000000000 c0000000000f9078
>   ...
>   Call Trace:
>     check_heap_object+0x34/0x390 (unreliable)
>   __mutex_unlock_slowpath.isra.0+0xe4/0x230
>   seq_read_iter+0x430/0xa90
>   proc_reg_read_iter+0xa4/0x200
>   vfs_read+0x41c/0x510
>   ksys_read+0xa4/0x190
>   system_call_exception+0x1d0/0x440
>   system_call_vectored_common+0x15c/0x2ec
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc64/ftrace: fix clobbered r15 during livepatching
      https://git.kernel.org/powerpc/c/cb5b691f8273432297611863ac142e17119279e0

Thanks

