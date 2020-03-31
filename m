Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E240819A280
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 01:30:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sQXn0j88zDqwN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 10:30:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=popple.id.au
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sQVd28mmzDqnr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 10:28:08 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VN5o41011314
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 19:28:06 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30227wgf2u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 19:28:06 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Wed, 1 Apr 2020 00:27:48 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 00:27:45 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02VNS0ml54591714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 23:28:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6661052050;
 Tue, 31 Mar 2020 23:28:00 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 12FD15204E;
 Tue, 31 Mar 2020 23:28:00 +0000 (GMT)
Received: from townsend.localnet (unknown [9.102.62.55])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 147C0A0118;
 Wed,  1 Apr 2020 10:27:54 +1100 (AEDT)
From: Alistair Popple <alistair@popple.id.au>
To: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH] powerpc: Add new HWCAP bits
Date: Wed, 01 Apr 2020 10:27:58 +1100
In-Reply-To: <34ff52dfe8233007db6dd7b1cd98a741e5bc392c.camel@neuling.org>
References: <20200331094247.28976-1-alistair@popple.id.au>
 <877dz0sglo.fsf@linux.ibm.com>
 <34ff52dfe8233007db6dd7b1cd98a741e5bc392c.camel@neuling.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 20033123-0020-0000-0000-000003BF3740
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033123-0021-0000-0000-00002217D9EC
Message-Id: <2967504.H6m59ABNDB@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 impostorscore=0 spamscore=0 suspectscore=1 mlxlogscore=785
 lowpriorityscore=0 clxscore=1034 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003310183
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
Cc: Tulio Magno Quites Machado Filho <tuliom@ascii.art.br>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday, 1 April 2020 9:47:03 AM AEDT Michael Neuling wrote:
> On Tue, 2020-03-31 at 12:12 -0300, Tulio Magno Quites Machado Filho wrote:
> > Alistair Popple <alistair@popple.id.au> writes:
> > > diff --git a/arch/powerpc/include/uapi/asm/cputable.h
> > > b/arch/powerpc/include/uapi/asm/cputable.h
> > > index 540592034740..8888c6fe10b2 100644
> > > --- a/arch/powerpc/include/uapi/asm/cputable.h
> > > +++ b/arch/powerpc/include/uapi/asm/cputable.h
> > > @@ -50,6 +50,8 @@
> > > 
> > >  #define PPC_FEATURE2_DARN		0x00200000 /* darn random number insn */
> > >  #define PPC_FEATURE2_SCV		0x00100000 /* scv syscall */
> > >  #define PPC_FEATURE2_HTM_NO_SUSPEND	0x00080000 /* TM w/out suspended
> > > 
> > > state */
> > > +#define PPC_FEATURE2_ARCH_3_10		0x00040000 /* ISA 3.10 */
> > 
> > I think this should have been:
> > 
> > #define PPC_FEATURE2_ARCH_3_1		0x00040000 /* ISA 3.1 */
> 
> Agreed. That's the new name.
> 
> Sorry Al I should have caught that earlier.

No worries, I missed it too. Will send v2.

- Alistair

> Mikey




