Return-Path: <linuxppc-dev+bounces-9917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D43AEE24B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 17:24:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW91T26bfz3bmS;
	Tue,  1 Jul 2025 01:24:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751297053;
	cv=none; b=dtfADJpWPZvHVCMwaTqchl1A7k74sRSE9jUc9FjW3PS+OFPUu505/tCoo3YfoNa2oZ4ybPwCW1q+Cvag73fQmr01Rc6H48RiZx8Oe36+ZPsKXtJoDUYfyEHpbFykZHZmGQmwb4FWM6YGBP8VhorNAK7E4E322atBZ+i6yDB7p8vopXMIp6HlqyBQZ1QPLV5Oe6IIDjk+VE2l29vhQGY/k1NWkVBm4MIoRoq3bTW6c1adfHUug8Gc1NRESU2w05XNUutqI7ZxHtQiF/NAgLRJ5Xz/6Y4STu0CT/npOtiDRVTY9db/4GHOEtPYeShuP3AXB1LGtz+sws3bG0PWb2VfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751297053; c=relaxed/relaxed;
	bh=6FceECBbuO6Z4x2Rp39hcL1hfD2xOI56xCXiWcKK9WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzMDlUOfo429RPgqNT90VLJqkfFWZzjyf6feNVkfKHzcn8E4/aFaifTmywdieqyqEwUyewdNg8Et8sxcK0qMYc31k6uH4J+IWFIreLwhfK8Q+Z+/dMPwzhdhUIzzkd3m5oSqOZN1KJz7e16hrEV8ki5OtK5CGFKuuDsVfN8vDdGqlmEik9hjmMMnpP/OqqceE/SQMq9Kn/qbFPKIJicbKZscrssVGPINHarIx4elK9RS9WS2ccPZUusshp1EudIr4PGYTv8A5GD/2OlpVNeemLGeSLkkryBdupXOqr3Q8c2cY1lLiTHrSQ0q74zrEf550EOiBvNQmDTQN/SZ66W57Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ab5IZRmw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ab5IZRmw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW91S1RpKz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 01:24:11 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8V2Ia000758;
	Mon, 30 Jun 2025 15:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=6FceECBbuO6Z4x2Rp39hcL1hfD2xOI
	56xCXiWcKK9WA=; b=Ab5IZRmwLvmMk3AiZ89wAAQHApO3HRzY/FKi33YccoEVV8
	62jDs8lp3GuMhnbp5PvwJeVzIOTdSyIpma+gS0Ugks/c8ATcOXl8/K0Lujz+g0Ad
	dM1SgFXrBuUMrFqGRGP0yd+oVE8+JDooGZJbbiLjhPut5GCRrRHFIebtiR9AW6Jx
	+jqh3I+r86Dc9UH2RwXLLF7G0y4EGIwXIEG+8EQguDuTyxyDmyjszA0gk24KkYF+
	WMQi8/9cdZV76CjE0Ytj99DnJbIc8orRNj1BD/lhbit4VZ05IUXEHPr+1f9T4Iaf
	PZjXXX61nBxSuq0zpSNKKHaNRcKWSqGn9BNz7ZPg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5tt2hv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 15:23:21 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55UFKkJT001633;
	Mon, 30 Jun 2025 15:23:20 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5tt2hut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 15:23:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55UF6Jrx006928;
	Mon, 30 Jun 2025 15:23:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jvxm687n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 15:23:19 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55UFNFi141091496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 15:23:15 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E3012004E;
	Mon, 30 Jun 2025 15:23:15 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EF2520043;
	Mon, 30 Jun 2025 15:23:14 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 30 Jun 2025 15:23:14 +0000 (GMT)
Date: Mon, 30 Jun 2025 17:23:12 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>,
        Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
        glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
        vincenzo.frascino@arm.com, linux@armlinux.org.uk,
        catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
        kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, borntraeger@linux.ibm.com, svens@linux.ibm.com,
        richard@nod.at, anton.ivanov@cambridgegreys.com,
        johannes@sipsolutions.net, dave.hansen@linux.intel.com,
        luto@kernel.org, peterz@infradead.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        chris@zankel.net, jcmvbkbc@gmail.com, akpm@linux-foundation.org,
        nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
        justinstitt@google.com, arnd@arndb.de, rppt@kernel.org,
        geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com,
        tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com,
        kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
        linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 01/11] kasan: unify static kasan_flag_enabled across
 modes
Message-ID: <aGKr4DgJ4w3TfJm1@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
 <20250626153147.145312-2-snovitoll@gmail.com>
 <aGKDhPBgDv2JjJZr@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <20250630143934.15284Caf-hca@linux.ibm.com>
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
In-Reply-To: <20250630143934.15284Caf-hca@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z4_YQR3yiIx6CG78lyz9FOWfFKu_sVzX
X-Authority-Analysis: v=2.4 cv=UtNjN/wB c=1 sm=1 tr=0 ts=6862abe9 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=DoNX2vE5F4BLjyZpJB8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: tSMJYZyFhxN0ELYUCpeHLTTc07NMO3uI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEyNiBTYWx0ZWRfX8gNfFxZTXHKZ dZ80+g69PboCFvZ7mBnOUfK0bCwcv0dSYRqbRWUQ19q/nN1wI6TuhuYqwHy593nbcEA7jlbJwZD 77dnrz9oUStk3kQiVeqmPXKGtKxsdBJ2rMDUHOTQC4GBaAbPZwrp6WqFZf9dFe5sx5xhOKbWCy/
 NwZq+dxl31GEeh7qeRCnnHi4Qxd16CxChbxAbT7vyTZGkfYmt2gzAZsQ9WVivWWtyFljm9LUYUu /A210g10AJ2Cdlfpn7GA0E0mvRxrp+tSiKfaUfSUuPHgdjtBlrSqzSrHD/D2Xsqd7rUwWfMIZjW fInaitcISkEwByhpED+nxsY2XtLUIBynWgUbXHjHc6nBJWSN0rrJzyr4x5ElJH4AxMuQUcAIOs7
 1rhZuhkKthJv/kG2udE/dGMrx+Msfn4q3zQeVCOUgtPKntnHQoMJd3LZcLGKdzNOHbuQfZDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300126
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 30, 2025 at 04:39:34PM +0200, Heiko Carstens wrote:
> > > +/*
> > > + * Initialize Generic KASAN and enable runtime checks.
> > > + * This should be called from arch kasan_init() once shadow memory is ready.
> > > + */
> > > +void __init kasan_init_generic(void)
> > > +{
> > > +	static_branch_enable(&kasan_flag_enabled);
> > 
> > s390 crashes at this line, when the whole series is applied.
> > 
> > FWIW, it looks like kasan is called while its state is not yet finalized.
> > E.g. whether calling __asan_report_store4_noabort() before kasan_init_generic()
> > is expected?
> 
> It crashes because with this conversion a call to static_branch_enable() is
> introduced. This one get's called way before jump_label_init() init has been
> called. Therefore the STATIC_KEY_CHECK_USE() in static_key_enable_cpuslocked()
> triggers.
> 
> This again tries to emit a warning. Due to lack of console support that early
> the kernel crashes.
> 
> One possible solution would be to move the kasan init function to
> arch/s390/kernel/setup.c, after jump_label_init() has been called.
> If we want this, is a different question.
> 
> It seems to work, so I see no reason for not doing that.

IIRC, we wanted to have kasan coverage as early as possible.
Delaying it past jump_label_init() leaves out pretty big chunk of code?

> Vasily, since you did nearly all of the KASAN work for s390, do you have any
> opinion about this?

