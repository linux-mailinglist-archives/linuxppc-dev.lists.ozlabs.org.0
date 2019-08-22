Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A004E98AEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 07:50:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DYXc6CMnzDqkG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:50:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DYV16f8mzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 15:48:09 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7M5lMcK082480
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:48:05 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhhxyws4w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:48:05 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 22 Aug 2019 06:48:03 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 06:47:59 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7M5lwED56360970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 05:47:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BACB3AE051;
 Thu, 22 Aug 2019 05:47:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30D3DAE055;
 Thu, 22 Aug 2019 05:47:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 05:47:58 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 225ACA021A;
 Thu, 22 Aug 2019 15:47:55 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Segher Boessenkool
 <segher@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Aug 2019 15:47:54 +1000
In-Reply-To: <c22dfd19-872a-afe1-40c6-82e11b0af9e1@c-s.fr>
References: <de7a813c71c4823797bb351bea8be15acae83be2.1565970465.git.christophe.leroy@c-s.fr>
 <9887dada07278cb39051941d1a47d50349d9fde0.camel@au1.ibm.com>
 <a0ad8dd8-2f5d-256d-9e88-e9c236335bb8@c-s.fr>
 <fcc94e7f347c3759a1698444239a7250b22cde7d.camel@au1.ibm.com>
 <c22dfd19-872a-afe1-40c6-82e11b0af9e1@c-s.fr>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19082205-4275-0000-0000-0000035BBE7F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082205-4276-0000-0000-0000386DE354
Message-Id: <381baa08d36bc8a8f7051ec8bdbe9620e83f925d.camel@au1.ibm.com>
Subject: RE: [RFC PATCH] powerpc: Convert ____flush_dcache_icache_phys() to C
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220061
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

On Thu, 2019-08-22 at 07:06 +0200, Christophe Leroy wrote:
> 
> Le 22/08/2019 à 02:27, Alastair D'Silva a écrit :
> > On Wed, 2019-08-21 at 22:27 +0200, Christophe Leroy wrote:
> > > Le 20/08/2019 à 06:36, Alastair D'Silva a écrit :
> > > > On Fri, 2019-08-16 at 15:52 +0000, Christophe Leroy wrote:
> > > 
> > > [...]
> > > 
> > > > Thanks Christophe,
> > > > 
> > > > I'm trying a somewhat different approach that requires less
> > > > knowledge
> > > > of assembler. Handling of CPU_FTR_COHERENT_ICACHE is outside
> > > > this
> > > > function. The code below is not a patch as my tree is a bit
> > > > messy,
> > > > sorry:
> > > 
> > > Can we be 100% sure that GCC won't add any code accessing some
> > > global
> > > data or stack while the Data MMU is OFF ?
> > > 
> > > Christophe
> > > 
> > 
> > +mpe
> > 
> > I'm not sure how we would go about making such a guarantee, but
> > I've
> > tied every variable used to a register and addr is passed in a
> > register, so there is no stack usage, and every call in there only
> > operates on it's operands.
> > 
> > The calls to the inline cache helpers (for the PPC32 case) are all
> > constants, so I can't see a reasonable scenario where there would
> > be a
> > function call and reordered to after the DR bit is turned off, but
> > I
> > guess if we want to be paranoid, we could always add an mb() call
> > before the DR bit is manipulated to prevent the compiler from
> > reordering across the section where the data MMU is disabled.
> > 
> > 
> 
> Anyway, I think the benefit of converting that function to C is
> pretty 
> small. flush_dcache_range() and friends were converted to C mainly
> in 
> order to inline them. But this __flush_dcache_icache_phys() is too
> big 
> to be worth inlining, yet small and stable enough to remain in
> assembly 
> for the time being.
> 
I disagree on this point, after converting it to C, using
44x/currituck.defconfig, the compiler definitely will inline it (noting
that there is only 1 caller of it):

00000134 <flush_dcache_icache_page>:
 134:   94 21 ff f0     stwu    r1,-16(r1)
 138:   3d 20 00 00     lis     r9,0
 13c:   81 29 00 00     lwz     r9,0(r9)
 140:   7c 08 02 a6     mflr    r0
 144:   38 81 00 0c     addi    r4,r1,12
 148:   90 01 00 14     stw     r0,20(r1)
 14c:   91 21 00 0c     stw     r9,12(r1)
 150:   48 00 00 01     bl      150 <flush_dcache_icache_page+0x1c>
 154:   39 00 00 20     li      r8,32
 158:   39 43 10 00     addi    r10,r3,4096
 15c:   7c 69 1b 78     mr      r9,r3
 160:   7d 09 03 a6     mtctr   r8
 164:   7c 00 48 6c     dcbst   0,r9
 168:   39 29 00 80     addi    r9,r9,128
 16c:   42 00 ff f8     bdnz    164 <flush_dcache_icache_page+0x30>
 170:   7c 00 04 ac     hwsync
 174:   7c 69 1b 78     mr      r9,r3
 178:   7c 00 4f ac     icbi    0,r9
 17c:   39 29 00 80     addi    r9,r9,128
 180:   7f 8a 48 40     cmplw   cr7,r10,r9
 184:   40 9e ff f4     bne     cr7,178 <flush_dcache_icache_page+0x44>
 188:   7c 00 04 ac     hwsync
 18c:   4c 00 01 2c     isync
 190:   80 01 00 14     lwz     r0,20(r1)
 194:   38 21 00 10     addi    r1,r1,16
 198:   7c 08 03 a6     mtlr    r0
 19c:   48 00 00 00     b       19c <flush_dcache_icache_page+0x68>


> So I suggest you keep it aside your series for now, just move 
> PURGE_PREFETCHED_INS inside it directly as it will be the only
> remaining 
> user of it.
> 
> Christophe

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

