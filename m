Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7639D195388
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 10:06:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pbZP3fXhzDr97
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 20:06:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pbXP0DL0zDr4M
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 20:04:52 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02R94lkt109231
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 05:04:50 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yxw7gxtjt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 05:04:48 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 27 Mar 2020 09:03:44 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Mar 2020 09:03:41 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02R93kcQ55509174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 09:03:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33241A4051;
 Fri, 27 Mar 2020 09:03:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1579A4040;
 Fri, 27 Mar 2020 09:03:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.61.93])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 27 Mar 2020 09:03:43 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc xmon: use `dcbf` inplace of `dcbi`
 instruction for 64bit Book3S
From: Balamuruhan S <bala24@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au
Date: Fri, 27 Mar 2020 14:33:42 +0530
In-Reply-To: <caf285b1-172e-7116-b2ed-3645f36264ed@c-s.fr>
References: <20200326061522.33123-1-bala24@linux.ibm.com>
 <caf285b1-172e-7116-b2ed-3645f36264ed@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032709-0016-0000-0000-000002F903A2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032709-0017-0000-0000-0000335CB3DB
Message-Id: <a0d623ad8347c6b88ef25c4de1ac5ed736037025.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-27_02:2020-03-26,
 2020-03-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270078
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-27 at 07:48 +0100, Christophe Leroy wrote:
> 
> Le 26/03/2020 à 07:15, Balamuruhan S a écrit :
> > Data Cache Block Invalidate (dcbi) instruction was implemented back in
> > PowerPC
> > architecture version 2.03. It is obsolete and attempt to use of this
> > illegal
> > instruction results in a hypervisor emulation assistance interrupt. So,
> > ifdef
> > it out the option `i` in xmon for 64bit Book3S.
> 
> I don't understand. You say two contradictory things:
> 1/ You say it _was_ added back.
> 2/ You say it _is_ obsolete.
> 
> How can it be obsolete if it was added back ?

I actually learnt it from P8 and P9 User Manual,

The POWER8/POWER9 core does not provide support for the following optional or
obsolete instructions (attempted use of these results in a hypervisor emulation
assistance interrupt):
• tlbia - TLB invalidate all
• tlbiex - TLB invalidate entry by index (obsolete)
• slbiex - SLB invalidate entry by index (obsolete)
• dcba - Data cache block allocate (Book II; obsolete)
• dcbi - Data cache block invalidate (obsolete)
• rfi - Return from interrupt (32-bit; obsolete)

> 
> [...]
> 
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index 0ec9640335bb..bfd5a97689cd 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -335,10 +335,12 @@ static inline void cflush(void *p)
> >   	asm volatile ("dcbf 0,%0; icbi 0,%0" : : "r" (p));
> >   }
> >   
> > +#ifndef CONFIG_PPC_BOOK3S_64
> 
> You don't need that #ifndef. Keeping it should be harmless.

okay.

> 
> >   static inline void cinval(void *p)
> >   {
> >   	asm volatile ("dcbi 0,%0; icbi 0,%0" : : "r" (p));
> >   }
> > +#endif
> >   
> >   /**
> >    * write_ciabr() - write the CIABR SPR
> > @@ -1791,8 +1793,9 @@ static void prregs(struct pt_regs *fp)
> >   
> >   static void cacheflush(void)
> >   {
> > -	int cmd;
> >   	unsigned long nflush;
> > +#ifndef CONFIG_PPC_BOOK3S_64
> 
> Don't make it so complex, see below
> 
> > +	int cmd;
> >   
> >   	cmd = inchar();
> >   	if (cmd != 'i')
> > @@ -1800,13 +1803,14 @@ static void cacheflush(void)
> >   	scanhex((void *)&adrs);
> >   	if (termch != '\n')
> >   		termch = 0;
> > +#endif
> >   	nflush = 1;
> >   	scanhex(&nflush);
> >   	nflush = (nflush + L1_CACHE_BYTES - 1) / L1_CACHE_BYTES;
> >   	if (setjmp(bus_error_jmp) == 0) {
> >   		catch_memory_errors = 1;
> >   		sync();
> > -
> > +#ifndef CONFIG_PPC_BOOK3S_64
> 
> You don't need that ifndef, just ensure below that regardless of cmd, 
> book3s/64 calls cflush and not cinval.
> 
> >   		if (cmd != 'i') {
> 
> The only thing you have to do is to replace the above test by:
> 
> 		if (cmd != 'i' || IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {

yes, this is the better way.

> 
> >   			for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
> >   				cflush((void *) adrs);
> > @@ -1814,6 +1818,10 @@ static void cacheflush(void)
> >   			for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
> >   				cinval((void *) adrs);
> >   		}
> > +#else
> 
> Don't need that at all, it's a duplication of the above.

sure :+1:

Thanks for reviewing.

-- Bala

> 
> > +		for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
> > +			cflush((void *)adrs);
> > +#endif
> >   		sync();
> >   		/* wait a little while to see if we get a machine check */
> >   		__delay(200);
> > 
> > base-commit: a87b93bdf800a4d7a42d95683624a4516e516b4f
> > 
> 
> Christophe

