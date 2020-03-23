Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4671518F113
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 09:45:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m7HS4H5vzDqjn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 19:45:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m7Fp4cqFzDq9R
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 19:43:42 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8XJhF002302
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 04:43:39 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywet1p61g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 04:43:39 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 23 Mar 2020 08:43:37 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Mar 2020 08:43:33 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02N8hWft41025594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 08:43:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D637152050;
 Mon, 23 Mar 2020 08:43:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.203.173.30])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B2A7A52052;
 Mon, 23 Mar 2020 08:43:30 +0000 (GMT)
Subject: Re: [PATCH v4 09/16] powerpc: Use a function for reading instructions
From: Balamuruhan S <bala24@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Date: Mon, 23 Mar 2020 14:13:29 +0530
In-Reply-To: <1584946118.tw98vo7hqx.astroid@bobo.none>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-10-jniethe5@gmail.com>
 <1584946118.tw98vo7hqx.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20032308-0020-0000-0000-000003B961E3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032308-0021-0000-0000-00002211DB89
Message-Id: <bc592c51a195d920a48aaac3c8c42afad76ad488.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_02:2020-03-21,
 2020-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=866 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230051
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: alistair@popple.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-03-23 at 18:00 +1000, Nicholas Piggin wrote:
> Jordan Niethe's on March 20, 2020 3:18 pm:
> > Prefixed instructions will mean there are instructions of different
> > length. As a result dereferencing a pointer to an instruction will not
> > necessarily give the desired result. Introduce a function for reading
> > instructions from memory into the instruction data type.
> > 
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > ---
> >  arch/powerpc/include/asm/uprobes.h |  4 ++--
> >  arch/powerpc/kernel/kprobes.c      |  8 ++++----
> >  arch/powerpc/kernel/mce_power.c    |  2 +-
> >  arch/powerpc/kernel/optprobes.c    |  6 +++---
> >  arch/powerpc/kernel/trace/ftrace.c | 33 +++++++++++++++++++-----------
> >  arch/powerpc/kernel/uprobes.c      |  2 +-
> >  arch/powerpc/lib/code-patching.c   | 22 ++++++++++----------
> >  arch/powerpc/lib/feature-fixups.c  |  6 +++---
> >  arch/powerpc/xmon/xmon.c           |  6 +++---
> >  9 files changed, 49 insertions(+), 40 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/uprobes.h
> > b/arch/powerpc/include/asm/uprobes.h
> > index 2bbdf27d09b5..fff3c5fc90b5 100644
> > --- a/arch/powerpc/include/asm/uprobes.h
> > +++ b/arch/powerpc/include/asm/uprobes.h
> > @@ -23,8 +23,8 @@ typedef ppc_opcode_t uprobe_opcode_t;
> >  
> >  struct arch_uprobe {
> >  	union {
> > -		u32	insn;
> > -		u32	ixol;
> > +		u8	insn[MAX_UINSN_BYTES];
> > +		u8	ixol[MAX_UINSN_BYTES];
> >  	};
> >  };
> 
> Hmm. I wonder if this should be a different patch. Not sure if raw
> bytes is a good idea here. ppc probes also has a ppc_opcode_t, maybe
> could be replaced with ppc_insn_t and used here instead?
> 
> Also can't find where you define ppc_inst_read.

Nick, ppc_inst_read and macro PPC_INST you have asked in patch 4 are defined in
asm/inst.h with patch 3 (powerpc: Use a datatype for instructions)

-- Bala
> 
> > diff --git a/arch/powerpc/kernel/trace/ftrace.c
> > b/arch/powerpc/kernel/trace/ftrace.c
> > index 7614a9f537fd..ad451205f268 100644
> > --- a/arch/powerpc/kernel/trace/ftrace.c
> > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > @@ -41,6 +41,12 @@
> >  #define	NUM_FTRACE_TRAMPS	8
> >  static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
> >  
> > +static long
> > +read_inst(ppc_inst *inst, const void *src)
> > +{
> > +	return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE);
> > +}
> 
> Humbly suggest probe_kernel_inst_read.
> 
> Thanks,
> Nick
> 

