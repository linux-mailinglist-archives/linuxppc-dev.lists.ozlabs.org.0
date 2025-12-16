Return-Path: <linuxppc-dev+bounces-14813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E037DCC3C77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 15:57:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW0QH1gjVz2yDk;
	Wed, 17 Dec 2025 01:57:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765897031;
	cv=none; b=OardMCeTg8C32GYgiluIwjc53JWIrf3mHVOxUedXMCtJxUK1gFztRgCMW6wVJhAuuARrEsrsqMawFRYKa0F9utavRbBgSMuDh4tDPB0AN469Rri9ZFO2Wn2boS+3fSmXsHkO9iGfS7zPcCOosgWPi7Z81cYWOPG5qgxdPYkwQl66cz0dMxN3AX266T9dCSEM27Eta3O70L5p3lH64xRWNF1XKbK3h567FmQ5bnA7Pnay+dpnqdpQSGIBZsEuqE0l6jfk5uYXlXNUFVdRUEp9dvQv7pOoydap3ld7sbRvqlIe4pWE5tIqttUn0l6k8H+gSqOtkuExUGJfugdE3x4tYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765897031; c=relaxed/relaxed;
	bh=8Rnt96cyItUgko1m+asvigDbSic8ql2tfa0iXWkBwq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBFOyNsEXWpG3BB9kffB2mUr3LTuOL95FLEg+nBrMaSRsdd3+FRHYF5E2bVjezTmBvhP8jcxmwsajgUXeeDhfOyKpkhwe8DSMBJVYR9AFTT3T8i0Gbstisv3C1t28X8fB9EkZpXU4RWki7fr70sC0Aqzkg3Py67XLb1livegyd2Ery+WUeJns4V486us7nQ0VN//rLSsolU48TlizQKIq9sJUy+XWyIjDmypdVo1SqkylpFQnKKQf6aExE9AlmVdKJ8m8CT6fIO0r2P5zu9UMSET3KmElGD7O3/s8Kv1U7oGYacMF2jaq52bNx2PiId1fj+0jYGde939HftQsw5jZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L5myjDOv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L5myjDOv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW0QG2TnSz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 01:57:10 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGBRKFA013834;
	Tue, 16 Dec 2025 14:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8Rnt96
	cyItUgko1m+asvigDbSic8ql2tfa0iXWkBwq4=; b=L5myjDOvEdz/EgFnu8jMkA
	F+KrfYBGe1iHlIoOk6sUqpMLX/R0+WyPPIO/IkWpp7ZpqRx2Tg6sh/k9pgvM3A42
	ffoEFRJlIBeYRm2I6VE7N7B0BhiK8WFdnLRudjswsEBdWrVXP0nthQaISF27ddtM
	/eKeNSxAhlOhwLAvt06RhjkTB8rsO8nlzg2aRNA6Iv3Q/DIWFEq0CXfaGes5C4ye
	DCR1T4quaHen74Z7jFTk2sGqqLdizBya9v9+q09SRGROOoi0g0M/OKUUMMe3Hvjq
	deTlbCAFZ+GTLYIWBSUUjQ9lrND7G4JZlbWjPNVz0+nLzj9NiH6kJCOrScGl3/0Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn8fsag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:56:45 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BGEtY3m013640;
	Tue, 16 Dec 2025 14:56:44 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn8fsac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:56:44 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGCZ8Uv026761;
	Tue, 16 Dec 2025 14:56:43 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1jfscwre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:56:43 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BGEueGB27394518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 14:56:40 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6B6E20040;
	Tue, 16 Dec 2025 14:56:39 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 904CE20043;
	Tue, 16 Dec 2025 14:56:33 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.210.89])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Dec 2025 14:56:33 +0000 (GMT)
Date: Tue, 16 Dec 2025 20:26:30 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        sshegde@linux.ibm.com, charlie@rivosinc.com, macro@orcam.me.uk,
        akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
        ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] powerpc: add exit_flags field in pt_regs
Message-ID: <es7wva5ptfty5lzrvugew2q2jyb5xygz6tbdp5ztklnfvrhwzl@gqvzutk7whvr>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-6-mkchauras@linux.ibm.com>
 <dc0edfb4-d2bc-43be-9221-a1acb1cae5ec@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc0edfb4-d2bc-43be-9221-a1acb1cae5ec@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAxOCBTYWx0ZWRfXx1jKuAbNtX0J
 LO0AlEppw5sOYJ9I6d/8VM+fu+w/Za3dRUHCbLAMh8ptR5bKHRRUGv61Trxje5aBPhPEa6ckuwU
 7Nx/fcKJ5GqOk32YzorXTnNSMdvOzpcNDW7YxquQ+SB5kQ4tFxYTnHC7WxE8E8uHbYz+cxb6JDY
 0xNj0HDAvtaRCPXvrqfpJaa7Nxx/WK9OVUWwVPFPFpQmOKjfnc7p3jG2i04In4EoFOqny4d2W9i
 WL72T4xddWRIH9rhLiesV20PNSxzLqz7UK6038JMqfNc17o+QaBs9CVM8ornB5YBZETR+dQ4rqU
 BD4WZ0EFNMFqdWjlyMsFeBVjwWJhahMw2/74asq8T71i6ElR5pVZfjl0AdlXWKlYXcIc6+6rfwS
 wdm19dcmMTXrbEiBTLhfZXggVSiXQg==
X-Proofpoint-GUID: 0-lcGgTAACXXvBHAhK1sY0iDExrRGDpk
X-Proofpoint-ORIG-GUID: KkwIYXcUIr2ScMsFav9UBfSvs28PZTCw
X-Authority-Analysis: v=2.4 cv=LbYxKzfi c=1 sm=1 tr=0 ts=6941732d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=qY29MhMMhjLxGZdjxj8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2512130018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 10:52:42AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> > From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > 
> > Add a new field `exit_flags` in the pt_regs structure. This field will hold
> > the flags set during interrupt or syscall execution that are required during
> > exit to user mode.
> > 
> > Specifically, the `TIF_RESTOREALL` flag, stored in this field, helps the
> > exit routine determine if any NVGPRs were modified and need to be restored
> > before returning to userspace.
> 
> In the current implementation we did our best to keep this information in a
> local var for performance reasons. Have you assessed the performance impact
> of going through the stack for that ?
> 
I needed this information out of the stack calls so kept it here. After
enabling the code as a whole i didn't see much of an impact.
> > 
> > This addition ensures a clean and architecture-specific mechanism to track
> > per-syscall or per-interrupt state transitions related to register restore.
> > 
> > Changes:
> >   - Add `exit_flags` and `__pt_regs_pad` to maintain 16-byte stack alignment
> >   - Update asm-offsets.c and ptrace.c for offset and validation
> >   - Update PT_* constants in uapi header to reflect the new layout
> > 
> > Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > ---
> >   arch/powerpc/include/asm/ptrace.h      |  3 +++
> >   arch/powerpc/include/uapi/asm/ptrace.h | 14 +++++++++-----
> >   arch/powerpc/kernel/asm-offsets.c      |  1 +
> >   arch/powerpc/kernel/ptrace/ptrace.c    |  1 +
> >   4 files changed, 14 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> > index 94aa1de2b06e..3af8a5898fe3 100644
> > --- a/arch/powerpc/include/asm/ptrace.h
> > +++ b/arch/powerpc/include/asm/ptrace.h
> > @@ -53,6 +53,9 @@ struct pt_regs
> >   				unsigned long esr;
> >   			};
> >   			unsigned long result;
> > +			unsigned long exit_flags;
> > +			/* Maintain 16 byte interrupt stack alignment */
> 
> On powerpc/32, one 'long' is 4 bytes not 8.
> 
Oh ohk. Will fix this in next revision.
> > +			unsigned long __pt_regs_pad[1];
> >   		};
> >   	};
> >   #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_KUAP)
> > diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
> > index 01e630149d48..de56b216c9c5 100644
> > --- a/arch/powerpc/include/uapi/asm/ptrace.h
> > +++ b/arch/powerpc/include/uapi/asm/ptrace.h
> > @@ -55,6 +55,8 @@ struct pt_regs
> >   	unsigned long dar;		/* Fault registers */
> >   	unsigned long dsisr;		/* on 4xx/Book-E used for ESR */
> >   	unsigned long result;		/* Result of a system call */
> > +	unsigned long exit_flags;	/* System call exit flags */
> > +	unsigned long __pt_regs_pad[1];	/* Maintain 16 byte interrupt stack alignment */
> 
> On powerpc/32, one 'long' is 4 bytes not 8.
> 
Will fix this too.
> >   };
> >   #endif /* __ASSEMBLER__ */
> > @@ -114,10 +116,12 @@ struct pt_regs
> >   #define PT_DAR	41
> >   #define PT_DSISR 42
> >   #define PT_RESULT 43
> > -#define PT_DSCR 44
> > -#define PT_REGS_COUNT 44
> > +#define PT_EXIT_FLAGS 44
> > +#define PT_PAD 45
> > +#define PT_DSCR 46
> > +#define PT_REGS_COUNT 46
> > -#define PT_FPR0	48	/* each FP reg occupies 2 slots in this space */
> > +#define PT_FPR0	(PT_REGS_COUNT + 4)	/* each FP reg occupies 2 slots in this space */
> >   #ifndef __powerpc64__
> > @@ -129,7 +133,7 @@ struct pt_regs
> >   #define PT_FPSCR (PT_FPR0 + 32)	/* each FP reg occupies 1 slot in 64-bit space */
> > -#define PT_VR0 82	/* each Vector reg occupies 2 slots in 64-bit */
> > +#define PT_VR0	(PT_FPSCR + 2)	/* <82> each Vector reg occupies 2 slots in 64-bit */
> >   #define PT_VSCR (PT_VR0 + 32*2 + 1)
> >   #define PT_VRSAVE (PT_VR0 + 33*2)
> > @@ -137,7 +141,7 @@ struct pt_regs
> >   /*
> >    * Only store first 32 VSRs here. The second 32 VSRs in VR0-31
> >    */
> > -#define PT_VSR0 150	/* each VSR reg occupies 2 slots in 64-bit */
> > +#define PT_VSR0	(PT_VRSAVE + 2)	/* each VSR reg occupies 2 slots in 64-bit */
> >   #define PT_VSR31 (PT_VSR0 + 2*31)
> >   #endif /* __powerpc64__ */
> > diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> > index a4bc80b30410..c0bb09f1db78 100644
> > --- a/arch/powerpc/kernel/asm-offsets.c
> > +++ b/arch/powerpc/kernel/asm-offsets.c
> > @@ -292,6 +292,7 @@ int main(void)
> >   	STACK_PT_REGS_OFFSET(_ESR, esr);
> >   	STACK_PT_REGS_OFFSET(ORIG_GPR3, orig_gpr3);
> >   	STACK_PT_REGS_OFFSET(RESULT, result);
> > +	STACK_PT_REGS_OFFSET(EXIT_FLAGS, exit_flags);
> 
> Where is that used ?
> 
It's not used anywhere as of now but kept it there as a convention.
Should this be removed?

Regards,
Mukesh
> >   	STACK_PT_REGS_OFFSET(_TRAP, trap);
> >   #ifdef CONFIG_PPC64
> >   	STACK_PT_REGS_OFFSET(SOFTE, softe);
> > diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> > index c6997df63287..2134b6d155ff 100644
> > --- a/arch/powerpc/kernel/ptrace/ptrace.c
> > +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> > @@ -432,6 +432,7 @@ void __init pt_regs_check(void)
> >   	CHECK_REG(PT_DAR, dar);
> >   	CHECK_REG(PT_DSISR, dsisr);
> >   	CHECK_REG(PT_RESULT, result);
> > +	CHECK_REG(PT_EXIT_FLAGS, exit_flags);
> >   	#undef CHECK_REG
> >   	BUILD_BUG_ON(PT_REGS_COUNT != sizeof(struct user_pt_regs) / sizeof(unsigned long));
> 

