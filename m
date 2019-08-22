Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C639887D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 02:29:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DQPm4sMqzDqj4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 10:29:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DQMq0ckgzDqdw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 10:27:18 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7M0NTse138093
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 20:27:14 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uhdkm532r-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 20:27:13 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 22 Aug 2019 01:27:12 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 01:27:10 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7M0R9lu33816988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 00:27:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C54EC42049;
 Thu, 22 Aug 2019 00:27:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C1BF42047;
 Thu, 22 Aug 2019 00:27:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 00:27:09 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 04713A021A;
 Thu, 22 Aug 2019 10:27:08 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Segher Boessenkool
 <segher@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Aug 2019 10:27:07 +1000
In-Reply-To: <a0ad8dd8-2f5d-256d-9e88-e9c236335bb8@c-s.fr>
References: <de7a813c71c4823797bb351bea8be15acae83be2.1565970465.git.christophe.leroy@c-s.fr>
 <9887dada07278cb39051941d1a47d50349d9fde0.camel@au1.ibm.com>
 <a0ad8dd8-2f5d-256d-9e88-e9c236335bb8@c-s.fr>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19082200-0008-0000-0000-0000030BA0E9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082200-0009-0000-0000-00004A29CD79
Message-Id: <fcc94e7f347c3759a1698444239a7250b22cde7d.camel@au1.ibm.com>
Subject: RE: [RFC PATCH] powerpc: Convert ____flush_dcache_icache_phys() to C
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=959 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220002
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-08-21 at 22:27 +0200, Christophe Leroy wrote:
> 
> Le 20/08/2019 à 06:36, Alastair D'Silva a écrit :
> > On Fri, 2019-08-16 at 15:52 +0000, Christophe Leroy wrote:
> 
> [...]
> 
> > 
> > Thanks Christophe,
> > 
> > I'm trying a somewhat different approach that requires less
> > knowledge
> > of assembler. Handling of CPU_FTR_COHERENT_ICACHE is outside this
> > function. The code below is not a patch as my tree is a bit messy,
> > sorry:
> 
> Can we be 100% sure that GCC won't add any code accessing some
> global 
> data or stack while the Data MMU is OFF ?
> 
> Christophe
> 

+mpe

I'm not sure how we would go about making such a guarantee, but I've
tied every variable used to a register and addr is passed in a
register, so there is no stack usage, and every call in there only
operates on it's operands.

The calls to the inline cache helpers (for the PPC32 case) are all
constants, so I can't see a reasonable scenario where there would be a
function call and reordered to after the DR bit is turned off, but I
guess if we want to be paranoid, we could always add an mb() call
before the DR bit is manipulated to prevent the compiler from
reordering across the section where the data MMU is disabled.


> 
> > /**
> >   * flush_dcache_icache_phys() - Flush a page by it's physical
> > address
> >   * @addr: the physical address of the page
> >   */
> > static void flush_dcache_icache_phys(unsigned long addr)
> > {
> > 	register unsigned long msr;
> > 	register unsigned long dlines = PAGE_SIZE >> l1_dcache_shift();
> > 	register unsigned long dbytes = l1_dcache_bytes();
> > 	register unsigned long ilines = PAGE_SIZE >> l1_icache_shift();
> > 	register unsigned long ibytes = l1_icache_bytes();
> > 	register unsigned long i;
> > 	register unsigned long address = addr;
> > 
> > 	/*
> > 	 * Clear the DR bit so that we operate on physical
> > 	 * rather than virtual addresses
> > 	 */
> > 	msr = mfmsr();
> > 	mtmsr(msr & ~(MSR_DR));
> > 
> > 	/* Write out the data cache */
> > 	for (i = 0; i < dlines; i++, address += dbytes)
> > 		dcbst((void *)address);
> > 
> > 	/* Invalidate the instruction cache */
> > 	address = addr;
> > 	for (i = 0; i < ilines; i++, address += ibytes)
> > 		icbi((void *)address);
> > 
> > 	mtmsr(msr);
> > }
> > 
> > void test_flush_phys(unsigned long addr)
> > {
> > 	flush_dcache_icache_phys(addr);
> > }
> > 
> > 
> > This gives the following assembler (using pmac32_defconfig):
> > 000003cc <test_flush_phys>:
> >   3cc:   94 21 ff f0     stwu    r1,-16(r1)
> >   3d0:   7d 00 00 a6     mfmsr   r8
> >   3d4:   55 09 07 34     rlwinm  r9,r8,0,28,26
> >   3d8:   7d 20 01 24     mtmsr   r9
> >   3dc:   39 20 00 80     li      r9,128
> >   3e0:   7d 29 03 a6     mtctr   r9
> >   3e4:   39 43 10 00     addi    r10,r3,4096
> >   3e8:   7c 69 1b 78     mr      r9,r3
> >   3ec:   7c 00 48 6c     dcbst   0,r9
> >   3f0:   39 29 00 20     addi    r9,r9,32
> >   3f4:   42 00 ff f8     bdnz    3ec <test_flush_phys+0x20>
> >   3f8:   7c 00 1f ac     icbi    0,r3
> >   3fc:   38 63 00 20     addi    r3,r3,32
> >   400:   7f 8a 18 40     cmplw   cr7,r10,r3
> >   404:   40 9e ff f4     bne     cr7,3f8 <test_flush_phys+0x2c>
> >   408:   7d 00 01 24     mtmsr   r8
> >   40c:   38 21 00 10     addi    r1,r1,16
> >   410:   4e 80 00 20     blr
> > 
> > 
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

