Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A93DF19AABB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 13:25:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48skQN6f3qzDqBW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 22:25:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48skLF2lJmzDqxf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 22:21:57 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031B7WeE093342
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 07:21:54 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 304h3w6yh8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 07:21:54 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Wed, 1 Apr 2020 12:21:36 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 12:21:34 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 031BLnAT42467590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 11:21:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 101F6AE053;
 Wed,  1 Apr 2020 11:21:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42183AE051;
 Wed,  1 Apr 2020 11:21:47 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.32.36])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 11:21:46 +0000 (GMT)
Subject: Re: [PATCH v3 3/3] powerpc test_emulate_step: add testcases for
 divde[.] and divdeu[.] instructions
From: Balamuruhan S <bala24@linux.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, mpe@ellerman.id.au
Date: Wed, 01 Apr 2020 16:51:45 +0530
In-Reply-To: <1585738460.fzpd1gjpyj.naveen@linux.ibm.com>
References: <20200120065426.3259-1-bala24@linux.ibm.com>
 <20200120065426.3259-4-bala24@linux.ibm.com>
 <1585738460.fzpd1gjpyj.naveen@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040111-0020-0000-0000-000003BF911F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040111-0021-0000-0000-000022183688
Message-Id: <7ffed5d5bb476fd8c88980039ffddce6e0c3e678.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=858 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010100
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org, sandipan@linux.ibm.com,
 ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-04-01 at 16:26 +0530, Naveen N. Rao wrote:
> Balamuruhan S wrote:
> > add testcases for divde, divde., divdeu, divdeu. emulated
> > instructions to cover few scenarios,
> >         * with same dividend and divisor to have undefine RT
> >           for divdeu[.]
> >         * with divide by zero to have undefine RT for both
> >           divde[.] and divdeu[.]
> >         * with negative dividend to cover -|divisor| < r <= 0 if
> >           the dividend is negative for divde[.]
> >         * normal case with proper dividend and divisor for both
> >           divde[.] and divdeu[.]
> > 
> > Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
> > Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> > ---
> >  arch/powerpc/lib/test_emulate_step.c | 164
> > +++++++++++++++++++++++++++++++++++
> >  1 file changed, 164 insertions(+)
> > 
> > diff --git a/arch/powerpc/lib/test_emulate_step.c
> > b/arch/powerpc/lib/test_emulate_step.c
> > index 42347067739c..ffeb9b68a31d 100644
> > --- a/arch/powerpc/lib/test_emulate_step.c
> > +++ b/arch/powerpc/lib/test_emulate_step.c
> > @@ -53,6 +53,14 @@
> >  					___PPC_RA(a) | ___PPC_RB(b))
> >  #define TEST_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		
> > \
> >  					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
> > +#define TEST_DIVDE(t, a, b)	(PPC_INST_DIVDE | ___PPC_RT(t) |	\
> > +					___PPC_RA(a) | ___PPC_RB(b))
> > +#define TEST_DIVDE_DOT(t, a, b)	(PPC_INST_DIVDE | ___PPC_RT(t) |	\
> > +					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
> > +#define TEST_DIVDEU(t, a, b)	(PPC_INST_DIVDEU | ___PPC_RT(t) |	\
> > +					___PPC_RA(a) | ___PPC_RB(b))
> > +#define TEST_DIVDEU_DOT(t, a, b)(PPC_INST_DIVDEU | ___PPC_RT(t) |	\
> > +					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
> > 
> >  #define MAX_SUBTESTS	16
> > 
> > @@ -837,6 +845,162 @@ static struct compute_test compute_tests[] = {
> >  				}
> >  			}
> >  		}
> > +	},
> > +	{
> > +		.mnemonic = "divde",
> > +		.subtests = {
> > +			{
> > +				.descr = "RA = LONG_MIN, RB = LONG_MIN",
> > +				.instr = TEST_DIVDE(20, 21, 22),
> > +				.regs = {
> > +					.gpr[21] = LONG_MIN,
> > +					.gpr[22] = LONG_MIN,
> > +				}
> > +			},
> > +			{
> > +				.descr = "RA = 1L, RB = 0",
> > +				.instr = TEST_DIVDE(20, 21, 22),
> > +				.flags = IGNORE_GPR(20),
> > +				.regs = {
> > +					.gpr[21] = 1L,
> > +					.gpr[22] = 0,
> > +				}
> > +			},
> > +			{
> > +				.descr = "RA = LONG_MIN, RB = LONG_MAX",
> > +				.instr = TEST_DIVDE(20, 21, 22),
> > +				.regs = {
> > +					.gpr[21] = LONG_MIN,
> > +					.gpr[22] = LONG_MAX,
> > +				}
> > +			}
> > +		}
> > +	},
> > +	{
> > +		.mnemonic = "divde.",
> > +		.subtests = {
> > +			{
> > +				.descr = "RA = LONG_MIN, RB = LONG_MIN",
> > +				.instr = TEST_DIVDE_DOT(20, 21, 22),
> > +				.regs = {
> > +					.gpr[21] = LONG_MIN,
> > +					.gpr[22] = LONG_MIN,
> > +				}
> > +			},
> > +			{
> > +				.descr = "RA = 1L, RB = 0",
> > +				.instr = TEST_DIVDE_DOT(20, 21, 22),
> > +				.flags = IGNORE_GPR(20),
> > +				.regs = {
> > +					.gpr[21] = 1L,
> > +					.gpr[22] = 0,
> > +				}
> > +			},
> > +			{
> > +				.descr = "RA = LONG_MIN, RB = LONG_MAX",
> > +				.instr = TEST_DIVDE_DOT(20, 21, 22),
> > +				.regs = {
> > +					.gpr[21] = LONG_MIN,
> > +					.gpr[22] = LONG_MAX,
> > +				}
> > +			}
> > +		}
> > +	},
> > +	{
> > +		.mnemonic = "divdeu",
> > +		.subtests = {
> > +			{
> > +				.descr = "RA = LONG_MIN, RB = LONG_MIN",
> > +				.instr = TEST_DIVDEU(20, 21, 22),
> > +				.flags = IGNORE_GPR(20),
> > +				.regs = {
> > +					.gpr[21] = LONG_MIN,
> > +					.gpr[22] = LONG_MIN,
> > +				}
> > +			},
> > +			{
> > +				.descr = "RA = 1L, RB = 0",
> > +				.instr = TEST_DIVDEU(20, 21, 22),
> > +				.flags = IGNORE_GPR(20),
> > +				.regs = {
> > +					.gpr[21] = 1L,
> > +					.gpr[22] = 0,
> > +				}
> > +			},
> > +			{
> > +				.descr = "RA = LONG_MIN, RB = LONG_MAX",
> > +				.instr = TEST_DIVDEU(20, 21, 22),
> > +				.regs = {
> > +					.gpr[21] = LONG_MIN,
> > +					.gpr[22] = LONG_MAX,
> > +				}
> > +			},
> > +			{
> > +				.descr = "RA = LONG_MAX - 1, RB = LONG_MAX",
> > +				.instr = TEST_DIVDEU_DOT(20, 21, 22),
> > +				.regs = {
> > +					.gpr[21] = LONG_MAX - 1,
> > +					.gpr[22] = LONG_MAX,
> > +				}
> > +			},
> > +			{
> > +				.descr = "RA = LONG_MIN + 1, RB = LONG_MIN",
> > +				.instr = TEST_DIVDEU_DOT(20, 21, 22),
> 
> I think you meant to use TEST_DIVDEU here ^^^^^ and in the test before, 
> rather than TEST_DIVDEU_DOT.

yes indeed, I will fix it in my next version.

> 
> Apart from them, for this series:
> Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Thank you Naveen for reviewing.

-- Bala
> 
> 
> - Naveen
> 

