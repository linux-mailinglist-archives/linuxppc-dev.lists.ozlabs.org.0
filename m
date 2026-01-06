Return-Path: <linuxppc-dev+bounces-15288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA49CF6B7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 06:00:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlf9q25M6z2yKr;
	Tue, 06 Jan 2026 16:00:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767675615;
	cv=none; b=SxBMTd/djIJKy6cuKJhFNYyt3sxzKJ5JW+rto41zzVTMiZh9DoYnyXE2MqeRAsZBWL1LH9RtJHFdP2R+pwvzlyCRvSCNbRz8HEIrEYvHeUBzb96sMvzU9U1dNK7hC4EzdLB4RIN4+GtUMZR0YnLHv6BK6JuMRhRIjKAmL0dO4beRtY7WNM/lvrxrcSC/5/8H89rBkFRFrWQQU+r30wdiXqlD9AdGdDDlXnN4q7UoSZDxZRbyGYQSYT0WCku1C8+HZ/0scPweKzr2VrXpxGdxY+cL2caW1YMicdERci8tzqjCRfcv7pK7QslraoUnQ5jYZlZKjhHtwBnXtfqnVu65sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767675615; c=relaxed/relaxed;
	bh=ID1U7wiAUmT+Tng6FT6H2wduhH65EY17q4FB/LKZ+VY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjyx5dZkEUKh6HPDAcHpGRXUA77DcsBQzxANijwYDmjO7B7nbjZ/SMe/WSShi801Rut4mRyJc8cHQXQxKqdu9HQwlTEjuxSNASJ7Ocu9PyPVITDT+7Yfa0LG4snCsNKkZYz9ryf4AO3qAzeMaNMOKqny3bKMXhdWdBf7K1JVsZmPMFIfmGrLYHzrPTPGl7jYRRLcdIMQ8M2u4s24arZQUl8IifNzyPJdSbgFUav/H5IukbyxeT10+FvtFFN5rOMyG8jz3UkmAdNOP03tlVq2F1Bdr7fTwyZBje7ZnxIaiLDbshd6B4dSxKHW1A01Fh0OaLuTFGYTRJ5EGpXuhOzzUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cmjsLLuF; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cmjsLLuF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlf9p0WPBz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 16:00:13 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6063Dx7Q013132;
	Tue, 6 Jan 2026 04:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ID1U7w
	iAUmT+Tng6FT6H2wduhH65EY17q4FB/LKZ+VY=; b=cmjsLLuFcZ/vGhpA1dNYRD
	GZ1gF5wQ9lO4tyoTpc4IeYpWfK3D1Xgb2DLTSefm5/yZwukoWoZ8XFALgiILUybj
	09RG2DqicS7HG1V6p9N4qXbOj3nZXaP9Ee6WtqTkTPfSe/jqhaoLrZtd3afzwazB
	7Tj6KJ3D1Uf5FXwQpf1z84CwgPxy4yf/OLcHrvKCde3CtxyVHPqLJF2BqvFdr0W6
	1NeCu5yS1f9cTFt9pfogqtJApmXTxJWxmlLJwKbBCICsipwqzQ0Ct4eZJV4JFbQw
	d+a9F7j38v/o12V0LuLOsbuzrT5iDTjh9ykJEBpIpnT5e7AS/tVyXFi6m5hhJpyw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu62c92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:59:43 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 6064xgva026765;
	Tue, 6 Jan 2026 04:59:42 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu62c8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:59:42 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6060mmUD005206;
	Tue, 6 Jan 2026 04:59:41 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bfexk1fx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:59:40 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6064xaDk44826940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jan 2026 04:59:36 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC8A920043;
	Tue,  6 Jan 2026 04:59:36 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF0E820040;
	Tue,  6 Jan 2026 04:59:31 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.213.216])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  6 Jan 2026 04:59:31 +0000 (GMT)
Date: Tue, 6 Jan 2026 10:29:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: chleroy@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, akpm@linux-foundation.org, macro@orcam.me.uk,
        deller@gmx.de, ldv@strace.io, charlie@rivosinc.com,
        segher@kernel.crashing.org, bigeasy@linutronix.de,
        peterz@infradead.org, namcao@linutronix.de, tglx@linutronix.de,
        kan.liang@linux.intel.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/8] powerpc: Enable IRQ generic entry/exit path.
Message-ID: <aVyWWMoNBZ_APBXS@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
 <20251229045416.3193779-8-mkchauras@linux.ibm.com>
 <25b443c7-cdbc-43c4-8db0-4c5eb3435687@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25b443c7-cdbc-43c4-8db0-4c5eb3435687@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QbNrf8bv c=1 sm=1 tr=0 ts=695c96bf cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=5_UflZDDiSmAe-Q9fPEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GYPApWY_EM1E_V1cLspa62NFv8YQJEP9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAzOCBTYWx0ZWRfX5zR5H2G0Sxml
 6ex++pvVKFOBd/x2qfP0Q3PqB08Y7r/hnmXLSAUiGjsWo2VbOcTo1LxNRZojtF/r6ekuRRlyszr
 IWfBw+2J2Z+uJfkJZirfLslWnbsCbx5CCJM4zd/PvdOnrQvpaEMUnQhWe+HwUutHuHmjiTbNsyu
 Gtv/3tO1k3wV+AZ+3iqg0TnROSe2L9f/nvkDVInrXl3USen96VOWAwzDj7Jk8F3htxFTqzLXPqI
 0OrLz5KpblQFVXPhLaXKL+bOk3Hzs0WmUL68Eg3ycrecI7kvAcRT0j7j5zk+KqLHL8vddZPgqVb
 cW06RqGxPR6YdBLtvPuui1QLTm4fQkjHkETEoc/9UrI9Zxun5OcUPiMJfZhUQiHOBzJTulJz4w7
 RGZFjbP2viqrfVQCL4h7dhNS2J5nCr0LW9U+bxPAiCRPGaKKUB1w4kEWiuNP1hkyXq5/BXXFIOb
 tKiqF/pRh3eMsWhhyiA==
X-Proofpoint-GUID: PG7A8-FMZdTR5enlaWcviWv5V1cSkDmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601060038
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 01, 2026 at 11:01:08PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 12/29/25 10:24 AM, Mukesh Kumar Chaurasiya wrote:
> > From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > 
> > Enable the generic IRQ entry/exit infrastructure on PowerPC by selecting
> > GENERIC_IRQ_ENTRY and integrating the architecture-specific interrupt
> > handlers with the generic entry/exit APIs.
> > 
> > This change replaces PowerPC’s local interrupt entry/exit handling with
> > calls to the generic irqentry_* helpers, aligning the architecture with
> > the common kernel entry model. The macros that define interrupt, async,
> > and NMI handlers are updated to use irqentry_enter()/irqentry_exit()
> > and irqentry_nmi_enter()/irqentry_nmi_exit() where applicable.
> > 
> > Key updates include:
> >   - Select GENERIC_IRQ_ENTRY in Kconfig.
> >   - Replace interrupt_enter/exit_prepare() with arch_interrupt_* helpers.
> >   - Integrate irqentry_enter()/exit() in standard and async interrupt paths.
> >   - Integrate irqentry_nmi_enter()/exit() in NMI handlers.
> >   - Remove redundant irq_enter()/irq_exit() calls now handled generically.
> >   - Use irqentry_exit_cond_resched() for preemption checks.
> >   - Remove unused code.
> > 
> > This change establishes the necessary wiring for PowerPC to use the
> > generic IRQ entry/exit framework while maintaining existing semantics.
> > 
> > Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > ---
> >   arch/powerpc/Kconfig                    |   1 +
> >   arch/powerpc/include/asm/entry-common.h |  61 +--
> >   arch/powerpc/include/asm/interrupt.h    | 484 +++---------------------
> >   arch/powerpc/kernel/interrupt.c         |  15 +-
> >   4 files changed, 72 insertions(+), 489 deletions(-)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 9537a61ebae0..398cef868c14 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -207,6 +207,7 @@ config PPC
> >   	select GENERIC_GETTIMEOFDAY
> >   	select GENERIC_IDLE_POLL_SETUP
> >   	select GENERIC_IOREMAP
> > +	select GENERIC_IRQ_ENTRY
> >   	select GENERIC_IRQ_SHOW
> >   	select GENERIC_IRQ_SHOW_LEVEL
> >   	select GENERIC_PCI_IOMAP		if PCI
> 
> There is no need for GENERIC_IRQ_ENTRY. I don't see a reason why
> we need to have both.
> 
> Enabling GENERIC_ENTRY which is done in next patch will enable this.
> It does the same thing and one less kconfig to worry about.
> 
> This would allow some easier code refactoring IMO.
> 
> - You can keep adding code to asm/entry-common.h. This will help avoid
>   moving to interrupt.h in between.
> 
Yeah this would be good, will send out in next revision.
> - You can add another patch as cleanup post GENERIC_ENTRY for
> easier review for seccomp/ptrace.
> 
Sure.
> ...
> 
> - Some more ct_warning in arch/powerpc are probably not necessary
>   (can be done post the series too)
> 
> - Some more cleanups can be done w.r.t to lockdep and tracing hardirq etc.
>   For example in next_interrupt. I think replay soft interrupts will end
>   up making irqentry_enter/exit calls which does same or similar thing.
>   (can be done post the series too)
> 
> - can we move syscall_exit_prepare/ into kernel/syscall.c?
>   (can be done post the series too)

Sure will do all of above in a separate series.

Regards,
Mukesh

