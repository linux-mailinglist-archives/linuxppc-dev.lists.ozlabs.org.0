Return-Path: <linuxppc-dev+bounces-1857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE57D995913
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 23:16:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNTNN53gzz2xpf;
	Wed,  9 Oct 2024 08:16:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728399584;
	cv=none; b=jV9Y1T98AP8vsr1bXRwNiUwj/R3JENvtQBapaPNLcIc3klqO1sgoCjvUWU02lAJeTTjZ85+BpcNb0XfC+upHLzLFBCkaPUnRbT33fUQSYRsrqClmNF/fry9ikukubPsvfVznlINqLRcXxmc+fgyEs/yfU2mao+OZxJC/7KhegDyxFVJh8IcG20tsZHKVDPhxGIR08dCM8rVmq2G5Z/Zw3NjYYEDSvVOmI6k+JFi+2OCdStgezI398aSf5A/8O/SxcE0hbftFAMQoqwFmDrIngyqCdS3tatPbDX2D+BuZHaC3BZgmW+/YOXgdN+7BlRfTUlflQZbdMAZkAFq3I6nXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728399584; c=relaxed/relaxed;
	bh=BQI8GJBzvYzMZY9guzB38AAkQephutvxTMxerY22j98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0BAQxaAhoRmoTNlik4fpua18o5QP4lp6uMALezvcaJKwGSfqh99FSF4sj1PQhQMXIl8BWlPN6KNkAL0RdhwlLn1fPf+6C2mnj60BckyQy3JqkQn7gazptN70Urf3fuALsz8IL/uG/Qkogq9XyjbW2DEdaEFae5O2MHJc3nPxVvSmyLcc2DoG2FM1FQEg7syadhMr1+HdnNhoBKmKpW5wPhuEHXZ7obDixfAL++3MeOH4ib8EeGbDlpjGdiM2wEIGHeb4NHcxEtJsg5aXkSDpUk07+BkcN3bExq91OMa+6khKB80be8nFkrLDqulnBooFcETzrfDwrEyvVSC4ErCNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r9CRYLuq; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r9CRYLuq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNK1W0xmqz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 01:59:42 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498AnhDi003703;
	Tue, 8 Oct 2024 14:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pp1; bh=BQI8GJBzvYzMZY9guzB38AAkQep
	hutvxTMxerY22j98=; b=r9CRYLuq87IoMuZlkQ0Ni4dlH5oab8oUZHdJ1O7eW/f
	ASY5wTgBmrRdV197eKYTzRIgFr9QF/X/3sGswuCcNpP4Ra/xeM/rqwS7VZxYkOmc
	FEOukCnltW7eFV5Iw1RtzWtn+BYigF7m66Uv12aF2Yf65bknIsb/IWpigr3apkpT
	fP6/5nmpiI8n5/dTZAbyLf7Md7VQAfeKilpLeNbpwAHp2lkfFbpelSgIrDv0Dqt1
	L6b6y2EFRDszfq1Bb+GSYImWr34yTiNS8khAMGgSk+R+OjdHtNwo/v+WwPvZ4T7+
	OKNMuUWTzzK5Ar+C4fVeDFQEEQDZP3sk4gYojXB9i9Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4253axshkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 14:59:00 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 498EwxvT020967;
	Tue, 8 Oct 2024 14:59:00 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4253axshkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 14:58:59 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 498Ccg58011524;
	Tue, 8 Oct 2024 14:58:58 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423g5xn1k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 14:58:58 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 498EwsmQ53805504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Oct 2024 14:58:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 963E92005A;
	Tue,  8 Oct 2024 14:58:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFF592004B;
	Tue,  8 Oct 2024 14:58:53 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  8 Oct 2024 14:58:53 +0000 (GMT)
Date: Tue, 8 Oct 2024 16:58:52 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
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
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <20241008145852.27223-E-hca@linux.ibm.com>
References: <20241007204743.41314f1d@gandalf.local.home>
 <20241007205458.2bbdf736@gandalf.local.home>
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
In-Reply-To: <20241007205458.2bbdf736@gandalf.local.home>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rpCzCkGFqxcT_39UaFTAgq0pycf5z52K
X-Proofpoint-GUID: r9NhdoWBAoOlbu5hPW1yGJhlEeNksSe2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_13,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=9 clxscore=1011 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=9 priorityscore=1501
 impostorscore=0 spamscore=9 mlxlogscore=101 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080096
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 07, 2024 at 08:54:58PM -0400, Steven Rostedt wrote:
> On Mon, 7 Oct 2024 20:47:43 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> #define arch_ftrace_get_regs(fregs)	({ &arch_ftrace_regs(fregs)->regs; })
> 
> I may send a v2 (tomorrow).

Could you also write against which tree this patch is?
It doesn't apply on top of Linus' master branch.

