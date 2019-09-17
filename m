Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A00F8B44F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 02:51:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XPhC0wZWzF3c9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 10:51:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=popple.id.au
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XPcB1C9MzDsPd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 10:48:25 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H0kaAJ083386
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 20:48:22 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2h81q1rv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 20:48:22 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Tue, 17 Sep 2019 01:48:20 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 01:48:18 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8H0mHkc51708158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 00:48:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15FFDA4060;
 Tue, 17 Sep 2019 00:48:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 740BFA4054;
 Tue, 17 Sep 2019 00:48:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 00:48:16 +0000 (GMT)
Received: from townsend.localnet (unknown [9.102.58.176])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EBC1AA019A;
 Tue, 17 Sep 2019 10:48:14 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] PPC: Set reserved PCR bits
Date: Tue, 17 Sep 2019 10:48:14 +1000
In-Reply-To: <877e68tvtl.fsf@mpe.ellerman.id.au>
References: <20190910060102.21597-1-alistair@popple.id.au>
 <877e68tvtl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 19091700-0028-0000-0000-0000039DD7C7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091700-0029-0000-0000-000024604E81
Message-Id: <2120353.GbO1pRtziF@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=957 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170007
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Those definitions were introduced in a previous commit so I've posted a new 
series to fix the definitions first. Thanks.

- Alistair

On Monday, 16 September 2019 7:49:26 PM AEST Michael Ellerman wrote:
> Alistair Popple <alistair@popple.id.au> writes:
> > Currently the reserved bits of the Processor Compatibility Register
> > (PCR) are cleared as per the Programming Note in Section 1.3.3 of
> > version 3.0B of the Power ISA. This causes all new architecture
> > features to be made available when running on newer processors with
> > new architecture features added to the PCR as bits must be set to
> > disable a given feature.
> >
> > For example to disable new features added as part of Version 2.07 of
> > the ISA the corresponding bit in the PCR needs to be set.
> >
> > As new processor features generally require explicit kernel support
> > they should be disabled until such support is implemented. Therefore
> > kernels should set all unknown/reserved bits in the PCR such that any
> > new architecture features which the kernel does not currently know
> > about get disabled.
> >
> > An update is planned to the ISA to clarify that the PCR is an
> > exception to the Programming Note on reserved bits in Section 1.3.3.
> >
> > Signed-off-by: Alistair Popple <alistair@popple.id.au>
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > Tested-by: Joel Stanley <joel@jms.id.au>
> > ---
> > v2: Added some clarifications to the commit message
> > ---
> >  arch/powerpc/include/asm/reg.h          |  3 +++
> >  arch/powerpc/kernel/cpu_setup_power.S   |  6 ++++++
> >  arch/powerpc/kernel/dt_cpu_ftrs.c       |  3 ++-
> >  arch/powerpc/kvm/book3s_hv.c            | 11 +++++++----
> >  arch/powerpc/kvm/book3s_hv_nested.c     |  6 +++---
> >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 10 ++++++----
> >  6 files changed, 27 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/
reg.h
> > index 10caa145f98b..258435c75c43 100644
> > --- a/arch/powerpc/include/asm/reg.h
> > +++ b/arch/powerpc/include/asm/reg.h
> > @@ -475,6 +475,7 @@
> >  #define   PCR_VEC_DIS	(1ul << (63-0))	/* Vec. disable (bit NA since 
POWER8) */
> >  #define   PCR_VSX_DIS	(1ul << (63-1))	/* VSX disable (bit NA since 
POWER8) */
> >  #define   PCR_TM_DIS	(1ul << (63-2))	/* Trans. memory disable (POWER8) 
*/
> > +#define   PCR_HIGH_BITS	(PCR_VEC_DIS | PCR_VSX_DIS | PCR_TM_DIS)
> 
> This doesn't build with old binutils that don't support 'ul', eg:
> 
>   arch/powerpc/kvm/book3s_hv_rmhandlers.S:647: Error: junk at end of line, 
first unrecognized character is `u'
>   arch/powerpc/kvm/book3s_hv_rmhandlers.S:647: Error: missing ')'
>   arch/powerpc/kvm/book3s_hv_rmhandlers.S:647: Error: junk at end of line: 
`ul<<(63-0))|(1ul<<(63-1))|(1ul<<(63-2)))|(0x8|0x4|0x2)))>>32)@h'
>   arch/powerpc/kernel/cpu_setup_power.S:131: Error: syntax error; found `u', 
expected `,'
>   arch/powerpc/kernel/cpu_setup_power.S:131: Error: junk at end of line: 
`ul<<(63-0))|(1ul<<(63-1))|(1ul<<(63-2)))|(0x8|0x4|0x2)))@l'
> 
> etc. http://kisskb.ellerman.id.au/kisskb/buildresult/13957233/ 
> 
> There's a gcc-4.6 with an old binutils on the ka's.
> 
> cheers
> 




