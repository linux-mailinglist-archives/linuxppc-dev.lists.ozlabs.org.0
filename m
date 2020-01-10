Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68928136A2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 10:47:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vJ6f1zggzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 20:47:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vJ4G0hLzzDqcw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 20:44:58 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00A9g5iX070489
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 04:44:55 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xe9uywfdp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 04:44:55 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 10 Jan 2020 09:44:53 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 10 Jan 2020 09:44:51 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00A9inGt60096578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jan 2020 09:44:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96A7A42047;
 Fri, 10 Jan 2020 09:44:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED9594204C;
 Fri, 10 Jan 2020 09:44:47 +0000 (GMT)
Received: from dhcp-9-109-246-161.in.ibm.com (unknown [9.109.246.161])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 10 Jan 2020 09:44:47 +0000 (GMT)
Date: Fri, 10 Jan 2020 15:14:44 +0530
From: Balamuruhan S <bala24@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH 2/3] powerpc sstep: add support for divde[.] and
 divdeu[.] instructions
References: <20191210071904.31013-1-bala24@linux.ibm.com>
 <20191210071904.31013-3-bala24@linux.ibm.com>
 <20200108222314.GA11821@blackberry>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108222314.GA11821@blackberry>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-TM-AS-GCONF: 00
x-cbid: 20011009-0012-0000-0000-0000037C3077
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011009-0013-0000-0000-000021B8543E
Message-Id: <20200110094444.GA16324@dhcp-9-109-246-161.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_01:2020-01-10,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 mlxlogscore=999 suspectscore=3 lowpriorityscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001100083
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
Cc: naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 sandipan@linux.ibm.com, ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 09, 2020 at 09:23:14AM +1100, Paul Mackerras wrote:
> On Tue, Dec 10, 2019 at 12:49:03PM +0530, Balamuruhan S wrote:
> > This patch adds emulation support for divde, divdeu instructions,
> > 	* Divide Doubleword Extended (divde[.])
> > 	* Divide Doubleword Extended Unsigned (divdeu[.])
> > 
> > Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> > ---
> >  arch/powerpc/lib/sstep.c | 27 ++++++++++++++++++++++++++-
> >  1 file changed, 26 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > index c077acb983a1..4b4119729e59 100644
> > --- a/arch/powerpc/lib/sstep.c
> > +++ b/arch/powerpc/lib/sstep.c
> > @@ -1736,7 +1736,32 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
> >  			op->val = (int) regs->gpr[ra] /
> >  				(int) regs->gpr[rb];
> >  			goto arith_done;
> > -
> > +#ifdef __powerpc64__
> > +		case 425:	/* divde[.] */
> > +			if (instr & 1) {
> > +				asm volatile(PPC_DIVDE_DOT(%0, %1, %2) :
> > +					"=r" (op->val) : "r" (regs->gpr[ra]),
> > +					"r" (regs->gpr[rb]));
> > +				set_cr0(regs, op);
> 
> This seems unneccesarily complicated.  You take the trouble to do a
> "divde." instruction rather than a "divde" instruction but then don't
> use the CR0 setting that the instruction did, but instead go and work
> out what happens to CR0 manually in set_cr0().  Also you don't tell
> the compiler that CR0 has been modified, which could lead to problems.
> 
> This case could be done much more simply like this:
> 
> 
> 
> 		case 425:	/* divde[.] */
> 			asm volatile(PPC_DIVDE(%0, %1, %2) :
> 				"=r" (op->val) : "r" (regs->gpr[ra]),
> 				"r" (regs->gpr[rb]));
> 			goto arith_done;
> 
> (note, goto arith_done rather than compute_done) and similarly for the
> divdeu case.

Thanks Paul for review, I will fix it as suggested and post the v2 version.

-- Bala
> 
> Paul.

