Return-Path: <linuxppc-dev+bounces-8109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A21A9F4F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 17:52:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmSdY04Y0z306l;
	Tue, 29 Apr 2025 01:52:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745855568;
	cv=none; b=hhEkNVcnuk3DuL4hetKTaPRWjHZ43tyf5p9iVFRt+nu/r3nqZB83Zdcjdq1XvyJMwsJdX1L2zA9e8SQn+9u/2+ZqGL+qt4+pLhfev01O8gTWAxwkxJ+2PApczr3m1CrT62CKZDqDNEn3VDUasVcXsGZR28xd/kDYI/qgMQadMT4S/FUrdEfmWvtPr2eBP6DHgH022FNiBMBKMxTSeWfm4PqbvzE6n+q5CCBAt9T3t36tOx9Rz9GSovKiMXS3f3yCnUV9cfVh4e43G+L+rScue/rMI7Sgk3R7vhhkWBlo6rmk7kTRWhGSdMURJq6U4v5jIKbNbgdtRmzr+WEY8O73QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745855568; c=relaxed/relaxed;
	bh=CwSj7ypTHGZPElQRVKae0+WBdkejDBt4rF+btde+lEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VO/WXaP8h6YPHzu0ajZpBO9j+u6pbsEFr1fSfIYlu2J5+msJ1QjR3IPr3MfBH6fqq8r3GGDduU2gdKHnShZ0PsFW4eacZYMQRTEnl1Ja3whFzTv4fTDU5c1efdC/RRoIaHUrey6t1EonL1JCvQj2hb/odHTLCMK/+OgO/XerZOgYwvzEd0kJ8yswZuBJ/JYq5bDJTnVJUO9vd01TmGjXbXRDvovPAel/QB89wBYckBkFVyfdvpqKScu4fn1maqd/DsW4mrgyKkNSEi2tNNGPr1wS2+0LBIZoLToY49mOmyns8LSeb+t51qxQtTzUeV0qZ3V4N6uz/NH8dmV5P6HBHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OU3oqtHO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OU3oqtHO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmSdX0SG9z3064
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 01:52:47 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAmGNx003209;
	Mon, 28 Apr 2025 15:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=CwSj7ypTHGZPElQRVKae0+WBdkejDB
	t4rF+btde+lEw=; b=OU3oqtHOLX5VWUofyB0UI82vl8imRkKL3HZO0BWMXZc9GB
	6mSpASMIWTkVVLw2ogFd1RzWAhfZFFe3ikMvpnrusz7ZyGXCCiVh2LVo2brMxCHh
	MhesD8PlTNjykZuMIcVoVyHKhBT8qJT6VoqmJ5/2nnYMp2EOQ9lTrsl89PmJsMSe
	REDU5hdzKVY5HDKm1gF3VfR4ZifbOo+aHmUY8vX3ZzrzjHS89fnUm50IMCtA86zK
	zccMH95+/qEER5ITrVSKq6HnpJTAyyoleNjVrjH9Cwemq57z8Mnjm5vASUyvpzcF
	t0VOLIz+y7LM18wANXGsa1Nc1kiRHzg0+8qj9WVA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469v5km6vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:52:29 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53SFZKio016120;
	Mon, 28 Apr 2025 15:52:28 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469v5km6vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:52:28 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SC5SDp001803;
	Mon, 28 Apr 2025 15:52:27 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469bamf291-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:52:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SFqNNu40370470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 15:52:23 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82E4920040;
	Mon, 28 Apr 2025 15:52:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C51BD20049;
	Mon, 28 Apr 2025 15:52:17 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com (unknown [9.39.16.25])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 28 Apr 2025 15:52:17 +0000 (GMT)
Date: Mon, 28 Apr 2025 21:22:15 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        neeraj.upadhyay@kernel.org, vschneid@redhat.com, tglx@linutronix.de,
        frederic@kernel.org, ankur.a.arora@oracle.com, sshegde@linux.ibm.com,
        bigeasy@linutronix.de, kees@kernel.org, oleg@redhat.com,
        peterz@infradead.org, tzimmermann@suse.de, namcao@linutronix.de,
        kan.liang@linux.intel.com, mcgrof@kernel.org, rppt@kernel.org,
        atrajeev@linux.vnet.ibm.com, anjalik@linux.ibm.com,
        coltonlewis@google.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC V1 0/6] Generic Entry/Exit support for ppc64
Message-ID: <tuylzfyyxfexl4fqid4xqo3bkxc25kkr3kah72ndexfw7qradv@xdqz7qxaliyf>
References: <20250428152225.66044-2-mchauras@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428152225.66044-2-mchauras@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O9lXcAocXti5-2NdzVKePAyxxUL8PtxU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyOCBTYWx0ZWRfX/RzOgR4IFVmE nTSW5QbW9RwkVa+aQDUS/CxCYvzMnThTf+nRaTwC/LmYcCANWb88QUsa1liG0MeQhnCh70AmlXU BHgIJeOypTRvi4TpphsG3pO0981V/9SVHvWPShNbqtZGokJe8S3ePd4f8CArz4LpA7X50ARdQ/0
 VGU0OGYyfWVnFbIr1QxYWuTm0pFjwbT7z1+6s7+5tIaXyWYBpnWGzwdqLk6VuBuOZ2rfMMhV0xv Ftv2fxeq5qjj5KstmDcX3FrIlSPPvduCzqPbuBolzaBD2mrOQj0DWIWh5GQfRuALM1SereyNHdv 8mObKnvjqG/ranE7oMBJkuh2LTja4Z8Dnmzw/fvf+f0iEKlgoPrxhUVQsDfkxk27F7Eib6edQx3
 f7E3faYoltfFdVPTSRrlj8z/6TGATFYvFeN0HbycudUbxvxFIdXe+pW/KvXRuqGdrA0EVW9l
X-Proofpoint-GUID: CUej1cs9APT6IM5K8RiNlp_52PD6H-gr
X-Authority-Analysis: v=2.4 cv=DvxW+H/+ c=1 sm=1 tr=0 ts=680fa43d cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=lkT6MX_KWXG3DhZVOTYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=885 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280128
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 28, 2025 at 08:52:20PM +0530, Mukesh Kumar Chaurasiya wrote:

Few corrections in the commit message:
> This is a syscall only implementation of generic entry/exit framework
> for framework for ppc. IRQ handling is not done in this RFC. 
>
s/framework for framework/framework
> This will break the ppc32 build as of now which will be fixed along with
> IRQ handling.
> 
> Below are the performance benchmarks from perf bench basic syscall.
> This is for 1,00,00,000 getppid() calls
> 
> | Metric     | Without Generic Framework | With Generic Framework |
> | ---------- | ------------------------- | ---------------------- |
> | Total time | 0.904 [sec]               | 0.856 [sec]            |
> | usecs/op   | 0.090403                  | 0.085638               |
> | ops/sec    | 1,10,61,579               | 1,16,77,086            |
>
The coloums are reversed here

| Metric     | With Generic Framework    | Without Generic Framework |
| ---------- | ------------------------- | ------------------------- |
| Total time | 0.904 [sec]               | 0.856 [sec]               |
| usecs/op   | 0.090403                  | 0.085638                  |
| ops/sec    | 1,10,61,579               | 1,16,77,086               |

> That's ~5% degradation as of now.
> 
> Mukesh Kumar Chaurasiya (6):
>   powerpc: rename arch_irq_disabled_regs
>   powerpc: Prepare to build with genreic entry/exit framework
>   powerpc: introduce arch_enter_from_user_mode
>   powerpc: Add flag in paca for register restore state
>   powerpc: Introduce syscall exit arch functions
>   powerpc: Enable Generic Entry/Exit for syscalls.
> 
>  arch/powerpc/Kconfig                    |   1 +
>  arch/powerpc/include/asm/entry-common.h | 158 ++++++++++++++++++++++++
>  arch/powerpc/include/asm/hw_irq.h       |   4 +-
>  arch/powerpc/include/asm/interrupt.h    | 117 +++++++++++++++++-
>  arch/powerpc/include/asm/paca.h         |   1 +
>  arch/powerpc/include/asm/stacktrace.h   |   8 ++
>  arch/powerpc/include/asm/syscall.h      |   5 +
>  arch/powerpc/include/asm/thread_info.h  |   1 +
>  arch/powerpc/kernel/interrupt.c         | 153 ++++++-----------------
>  arch/powerpc/kernel/ptrace/ptrace.c     | 103 ---------------
>  arch/powerpc/kernel/signal.c            |   8 ++
>  arch/powerpc/kernel/syscall.c           | 117 +-----------------
>  arch/powerpc/kernel/traps.c             |   2 +-
>  arch/powerpc/kernel/watchdog.c          |   2 +-
>  arch/powerpc/perf/core-book3s.c         |   2 +-
>  15 files changed, 336 insertions(+), 346 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/entry-common.h
> 
> -- 
> 2.49.0
> 

