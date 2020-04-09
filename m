Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F781A2EB1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 07:06:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yTdk5MPdzDqRv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 15:06:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yTbV53hSzDqL8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 15:04:54 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03953214107315
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Apr 2020 01:04:52 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3092062c08-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Apr 2020 01:04:51 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Thu, 9 Apr 2020 06:04:36 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 Apr 2020 06:04:33 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03954j1H55181396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Apr 2020 05:04:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF11D4C04E;
 Thu,  9 Apr 2020 05:04:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 780C94C04A;
 Thu,  9 Apr 2020 05:04:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.180.143])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Apr 2020 05:04:44 +0000 (GMT)
Subject: Re: [PATCH v5 13/21] powerpc/xmon: Use a function for reading
 instructions
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 09 Apr 2020 10:34:43 +0530
In-Reply-To: <CACzsE9r8hAKGwN1reVo00UfO5UiONo2GpUdMsNgqgAJa=LDbSg@mail.gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-14-jniethe5@gmail.com>
 <ff7df8a41dc80faaa020754b5eaafe81a6e745b9.camel@linux.ibm.com>
 <CACzsE9r8hAKGwN1reVo00UfO5UiONo2GpUdMsNgqgAJa=LDbSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040905-0012-0000-0000-000003A11EEA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040905-0013-0000-0000-000021DE460F
Message-Id: <1e58ff6f13a8fe730c57a73ac0d7b0548277d17c.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-08_09:2020-04-07,
 2020-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004090037
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-04-08 at 12:18 +1000, Jordan Niethe wrote:
> On Tue, Apr 7, 2020 at 9:31 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
> > On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> > > Currently in xmon, mread() is used for reading instructions. In
> > > preparation for prefixed instructions, create and use a new function,
> > > mread_instr(), especially for reading instructions.
> > > 
> > > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > > ---
> > > v5: New to series, seperated from "Add prefixed instructions to
> > > instruction data type"
> > > ---
> > >  arch/powerpc/xmon/xmon.c | 24 ++++++++++++++++++++----
> > >  1 file changed, 20 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > > index 5e3949322a6c..6f4cf01a58c1 100644
> > > --- a/arch/powerpc/xmon/xmon.c
> > > +++ b/arch/powerpc/xmon/xmon.c
> > > @@ -125,6 +125,7 @@ extern unsigned int bpt_table[NBPTS * BPT_WORDS];
> > >  static int cmds(struct pt_regs *);
> > >  static int mread(unsigned long, void *, int);
> > >  static int mwrite(unsigned long, void *, int);
> > > +static int mread_instr(unsigned long, struct ppc_inst *);
> > >  static int handle_fault(struct pt_regs *);
> > >  static void byterev(unsigned char *, int);
> > >  static void memex(void);
> > > @@ -899,7 +900,7 @@ static void insert_bpts(void)
> > >       for (i = 0; i < NBPTS; ++i, ++bp) {
> > >               if ((bp->enabled & (BP_TRAP|BP_CIABR)) == 0)
> > >                       continue;
> > > -             if (mread(bp->address, &instr, 4) != 4) {
> > > +             if (!mread_instr(bp->address, &instr)) {
> > 
> > Are these checks made based on whether `ppc_inst_len()` returns bool from
> > mread_instr() ?
> No, it was meant to be the length itself returned with a length of 0
> indicating an error. I will need to fix that.


I doubt it would return 0, whether we read instruction or not ppc_inst_len()
would always return sizeof(struct ppc_inst).

can we do something like,

static int
mread_instr(unsigned long adrs, struct ppc_inst *instr)
{
	int size = 0;
	if (setjmp(bus_error_jmp) == 0) {
		catch_memory_errors = 1;
		sync();
		*instr = ppc_inst_read((struct ppc_inst *)adrs);
		sync();
		/* wait a little while to see if we get a machine check */
		__delay(200);
		size = ppc_inst_len(instr);
	}
	catch_memory_errors = 0;
	return size;
}

-- Bala
> > -- Bala
> > 
> > 
> > >                       printf("Couldn't read instruction at %lx, "
> > >                              "disabling breakpoint there\n", bp-
> > > >address);
> > >                       bp->enabled = 0;
> > > @@ -949,7 +950,7 @@ static void remove_bpts(void)
> > >       for (i = 0; i < NBPTS; ++i, ++bp) {
> > >               if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
> > >                       continue;
> > > -             if (mread(bp->address, &instr, 4) == 4
> > > +             if (mread_instr(bp->address, &instr)
> > >                   && ppc_inst_equal(instr, ppc_inst(bpinstr))
> > >                   && patch_instruction(
> > >                       (struct ppc_inst *)bp->address, ppc_inst_read(bp-
> > > > instr)) != 0)
> > > @@ -1165,7 +1166,7 @@ static int do_step(struct pt_regs *regs)
> > >       force_enable_xmon();
> > >       /* check we are in 64-bit kernel mode, translation enabled */
> > >       if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) == (MSR_64BIT|MSR_IR))
> > > {
> > > -             if (mread(regs->nip, &instr, 4) == 4) {
> > > +             if (mread_instr(regs->nip, &instr)) {
> > >                       stepped = emulate_step(regs, instr);
> > >                       if (stepped < 0) {
> > >                               printf("Couldn't single-step %s
> > > instruction\n",
> > > @@ -1332,7 +1333,7 @@ static long check_bp_loc(unsigned long addr)
> > >               printf("Breakpoints may only be placed at kernel
> > > addresses\n");
> > >               return 0;
> > >       }
> > > -     if (!mread(addr, &instr, sizeof(instr))) {
> > > +     if (!mread_instr(addr, &instr)) {
> > >               printf("Can't read instruction at address %lx\n", addr);
> > >               return 0;
> > >       }
> > > @@ -2125,6 +2126,21 @@ mwrite(unsigned long adrs, void *buf, int size)
> > >       return n;
> > >  }
> > > 
> > > +static int
> > > +mread_instr(unsigned long adrs, struct ppc_inst *instr)
> > > +{
> > > +     if (setjmp(bus_error_jmp) == 0) {
> > > +             catch_memory_errors = 1;
> > > +             sync();
> > > +             *instr = ppc_inst_read((struct ppc_inst *)adrs);
> > > +             sync();
> > > +             /* wait a little while to see if we get a machine check */
> > > +             __delay(200);
> > > +     }
> > > +     catch_memory_errors = 0;
> > > +     return ppc_inst_len(*instr);
> > > +}
> > > +
> > >  static int fault_type;
> > >  static int fault_except;
> > >  static char *fault_chars[] = { "--", "**", "##" };

