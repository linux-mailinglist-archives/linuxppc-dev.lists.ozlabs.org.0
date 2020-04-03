Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5D19D10B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 09:19:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48trsY4lGyzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 18:19:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48trmX3L0jzDrdp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 18:15:08 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03373a7t089514
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Apr 2020 03:15:06 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304r51d4bw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 03:15:05 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 3 Apr 2020 08:14:54 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Apr 2020 08:14:51 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0337ExsM43581760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 07:14:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0DC8A405B;
 Fri,  3 Apr 2020 07:14:58 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD7D3A4054;
 Fri,  3 Apr 2020 07:14:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.32.187])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Apr 2020 07:14:56 +0000 (GMT)
Subject: Re: [RFC PATCH 3/4] powerpc ppc-opcode: move ppc instuction
 encoding from test_emulate_step
From: Balamuruhan S <bala24@linux.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Date: Fri, 03 Apr 2020 12:44:55 +0530
In-Reply-To: <1585810752.gtbei2f2gy.naveen@linux.ibm.com>
References: <20200320081837.1016820-1-bala24@linux.ibm.com>
 <20200320081837.1016820-4-bala24@linux.ibm.com>
 <1585759165.2r0pc78n07.naveen@linux.ibm.com>
 <87ftdmtsy9.fsf@mpe.ellerman.id.au>
 <1585810752.gtbei2f2gy.naveen@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040307-0012-0000-0000-0000039D5F90
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040307-0013-0000-0000-000021DA75D6
Message-Id: <4b7093ff85217c7f4ac49f4bfb3697ab0b3ad0bd.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_04:2020-04-02,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030054
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
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org, sandipan@linux.ibm.com,
 paulus@samba.org, ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-04-02 at 12:34 +0530, Naveen N. Rao wrote:
> Michael Ellerman wrote:
> > "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> > > Balamuruhan S wrote:
> > > > Few ppc instructions are encoded in test_emulate_step.c, consolidate
> > > > them to
> > > > ppc-opcode.h, fix redefintion errors in bpf_jit caused due to this
> > > > consolidation.
> > > > Reuse the macros from ppc-opcode.h
> > ...
> > > > diff --git a/arch/powerpc/net/bpf_jit32.h
> > > > b/arch/powerpc/net/bpf_jit32.h
> > > > index 4ec2a9f14f84..8a9f16a7262e 100644
> > > > --- a/arch/powerpc/net/bpf_jit32.h
> > > > +++ b/arch/powerpc/net/bpf_jit32.h
> > > > @@ -76,13 +76,13 @@ DECLARE_LOAD_FUNC(sk_load_byte_msh);
> > > >  		else {	PPC_ADDIS(r, base, IMM_HA(i));			
> > > >       \
> > > >  			PPC_LBZ(r, r, IMM_L(i)); } } while(0)
> > > > 
> > > > -#define PPC_LD_OFFS(r, base, i) do { if ((i) < 32768) PPC_LD(r, base,
> > > > i);     \
> > > > +#define _OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_ENCODE_LD(r,
> > > > base, i));     \
> > > 	   ^^^^^
> > > Should be PPC_LD_OFFS. For the next version, please also build ppc32 and 
> > > booke codebase to confirm that your changes in those areas are fine.
> > > 
> > > PPC_ENCODE_* also looks quite verbose, so perhaps PPC_ENC_* might be 
> > > better. Otherwise, this patchset looks good to me and should help reuse 
> > > some of those macros, especially from the eBPF codebase.
> > > 
> > > Michael,
> > > Can you let us know if this looks ok to you? Based on your feedback, we 
> > > will also update the eBPF codebase.
> > 
> > I didn't really like the first patch which does the mass renaming. It
> > creates a huge amount of churn.

sorry for that.

> > 
> > I think I'd be happier if this series just did what it needs, and then
> > maybe at the end there's a patch to update all the existing names, which
> > I may or may not take.
> 
> Ok.

I will work on it.

> 
> > As far as the naming, currently we have:
> > 
> > PPC_INST_FOO - just the opcode
> > 
> > PPC_FOO(x) - macro to encode the opcode with x and (usually) also emit a
> >             .long and stringify.
> > 
> > And you need an in-between that gives you the full instruction but
> > without the .long and stringify, right?
> 
> Yes.
> 
> > So how about PPC_RAW_FOO() for just the numeric value, without the .long
> > and stringify.
> 
> Sure, thanks for the feedback -- that makes sense.

Thanks for the feedback.

> 
> > We also seem to have a lot of PPC_INST_FOO's that are only ever used in
> > the PPC_INST macro. I'm inclined to fold those into the PPC_INST macro,
> > to avoid people accidentally using the PPC_INST version when they don't
> > mean to. But that's a separate issue.
> 
> Good point -- I do see many uses of PPC_INST_FOO that can be replaced 
> with PPC_RAW_FOO once we introduce that. We will take a stab at doing 
> this cleanup as a separate patch at the end.

Will make the changes as suggested.

-- Bala
> 
> 
> Thanks,
> Naveen
> 

