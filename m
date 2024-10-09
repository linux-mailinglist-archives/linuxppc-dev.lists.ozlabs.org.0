Return-Path: <linuxppc-dev+bounces-1878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB9D996598
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 11:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNnqh6bgVz30MR;
	Wed,  9 Oct 2024 20:37:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728466672;
	cv=none; b=DfZy7COwZ3hNMgWDzHAGI6Xuh8lRzKcwFnIfzl9cuzCK9lKb1sGxlyJ6eP+AFQ7ELuDyviZnbYO3OidmGZZiBG9DghRBXHrkcgIXVRFpASEoCD4Zef4F4KpvWPo/l8KzI2x9bLAaOrFKJgxaE/7tBCOWOV3Ig62Wb/2EbcN6J6SJeTSwJWIrHHl9qU7yaXoWr9BUJ+aPKbDaPY3VqDkq89kPmHuwiF5NsqH9tu+OU/A1hHOe+k3FXw2LAQLQp5geXifGCK8G14/WwMwYpNlcYJS/4XJ7X/Qu/J1666hnkafMnTmKjvhcQ8rmJ6S3Klbktd3M1MBHC+mJgpmb/S/d1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728466672; c=relaxed/relaxed;
	bh=4fNQ+8RmglCqVKBxGrAojCBFjWcqgWspkWgdbNioFLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6rfyxWkbK/NP7b2f8uH2rc87CqJ7OxFq2gT/epg9Q5PUDP4PZWbRxW5vy1D2CHIA6YnXb8m8cs3J482ks1/u+Od32MtvC4xVOgca0VUxtF1pgOqcRPfwo5mNfWmzHy2y5+Rssd00g5raYjmH/gjj7x5ByhV6PBPzlmmBaU8ezbe3mMR4nqXADUuri5VH9ISM8JzGMilZCWCU0e5dg8NE6jGz+t+a30g/theAt8oEAz2Yj45uyFnahQT9agB91koBOtVTwKQqhaX838RvhulCMZqWom47+yRAtFfZATs/dw6Jd8l3/10VPxfK6B5dl98M8BV29yCGQ3bJ9uYo1qepg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kcXD4bIE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kcXD4bIE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNnqg6kXNz2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 20:37:51 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4997QMve028472;
	Wed, 9 Oct 2024 09:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pp1; bh=4fNQ+8RmglCqVKBxGrAojCBFjWc
	qgWspkWgdbNioFLc=; b=kcXD4bIEySVjicPnDmfzdEHWme2X+EHygcgQfb9Qm65
	hwM7abq+fXHcrZYXDD+AwHBJmFNpM/QCzKQVsMRW4V+BF/M+1gBS9KOoTVVGutQr
	QRMjg12z4gmfnmURH+nAyZzREFJoW1U2vhzVCWDsxb7G4KP5/jBtk0J8S3EOI49X
	uLwzvajfTPBHCO9AfpcQQpLpx6PD61mhcxlc9kx896ZDIZdXD+/a+z6Ujh2x1yxK
	I99Gux9E6xwA3MV2VajYUxDIFzjHCDD+1RqKRkhDoWMzqMy8DONzGv4f6mgJKX0x
	DNsGVdk51O11jjkqSP9ziktsv2GPXtjDUP8gJGwo1Ng==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 425nefgjhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:37:23 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4999bM2T011033;
	Wed, 9 Oct 2024 09:37:22 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 425nefgjh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:37:22 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4998VI50022847;
	Wed, 9 Oct 2024 09:37:21 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423h9k0wk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:37:21 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4999bHUW53543356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Oct 2024 09:37:17 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61DE920040;
	Wed,  9 Oct 2024 09:37:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 951412004B;
	Wed,  9 Oct 2024 09:37:16 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  9 Oct 2024 09:37:16 +0000 (GMT)
Date: Wed, 9 Oct 2024 11:37:14 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 2/2] ftrace: Consolidate ftrace_regs accessor
 functions for archs using pt_regs
Message-ID: <20241009093714.8007-D-hca@linux.ibm.com>
References: <20241008230527.674939311@goodmis.org>
 <20241008230629.118325673@goodmis.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008230629.118325673@goodmis.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TFXfZJBKt3TXi7mhFzxQ8d6YDbWPR-O_
X-Proofpoint-ORIG-GUID: zEXZbVUipOyj-zc2RijPGpZTAs11IO_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_08,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=386 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090061
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 08, 2024 at 07:05:29PM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> Most architectures use pt_regs within ftrace_regs making a lot of the
> accessor functions just calls to the pt_regs internally. Instead of
> duplication this effort, use a HAVE_ARCH_FTRACE_REGS for architectures
> that have their own ftrace_regs that is not based on pt_regs and will
> define all the accessor functions, and for the architectures that just use
> pt_regs, it will leave it undefined, and the default accessor functions
> will be used.
> 
> Note, this will also make it easier to add new accessor functions to
> ftrace_regs as it will mean having to touch less architectures.
> 
> Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
...
>  arch/s390/include/asm/ftrace.h      | 26 +--------------------

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390

