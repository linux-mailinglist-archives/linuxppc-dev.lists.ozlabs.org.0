Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4581811D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 08:23:53 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ck2c4y6lzDqY5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 18:23:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ck176mM1zDqNg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 18:22:03 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02B7KJUW001795
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 03:21:54 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ypsx5mfyr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 03:21:54 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Wed, 11 Mar 2020 07:21:52 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Mar 2020 07:21:49 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02B7Llsm52756558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 07:21:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4677AE04D;
 Wed, 11 Mar 2020 07:21:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53B3DAE045;
 Wed, 11 Mar 2020 07:21:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.150])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Mar 2020 07:21:46 +0000 (GMT)
Subject: Re: [PATCH 1/2] powerpc test_emulate_step: fix DS operand in ld
 encoding to appropriate value
From: Balamuruhan S <bala24@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au
Date: Wed, 11 Mar 2020 12:51:45 +0530
In-Reply-To: <188eadfa-6908-196a-ed77-cec210c54c84@c-s.fr>
References: <20200311061417.384629-1-bala24@linux.ibm.com>
 <188eadfa-6908-196a-ed77-cec210c54c84@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031107-0028-0000-0000-000003E2FCAD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031107-0029-0000-0000-000024A83FF7
Message-Id: <768e59b32832e95483ab538d67bf290228968824.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_01:2020-03-10,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=821
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110047
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

On Wed, 2020-03-11 at 08:01 +0100, Christophe Leroy wrote:
> 
> Le 11/03/2020 à 07:14, Balamuruhan S a écrit :
> > ld instruction should have 14 bit immediate field (DS) concatenated
> > with
> > 0b00 on the right, encode it accordingly.
> > 
> > Fixes: 4ceae137bdab ("powerpc: emulate_step() tests for load/store
> > instructions")
> > Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
> > Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> > ---
> >   arch/powerpc/lib/test_emulate_step.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/lib/test_emulate_step.c
> > b/arch/powerpc/lib/test_emulate_step.c
> > index 42347067739c..51c254fd15b5 100644
> > --- a/arch/powerpc/lib/test_emulate_step.c
> > +++ b/arch/powerpc/lib/test_emulate_step.c
> > @@ -19,7 +19,7 @@
> >    * definitions.
> >    */
> >   #define TEST_LD(r, base, i)	(PPC_INST_LD | ___PPC_RT(r) |	
> > 	\
> > -					___PPC_RA(base) | IMM_L(i))
> > +					___PPC_RA(base) | ((i) &
> > 0xfffc))
> 
> I think you should squash patch 1 and 2 together. Or at least you
> should
> put the new IMM_DS macro in patch 1 and use it instead of open
> coding.

sure, I will make the changes as suggested.

-- Bala

> 
> >   #define TEST_LWZ(r, base, i)	(PPC_INST_LWZ | ___PPC_RT(r) |	
> > 	\
> >   					___PPC_RA(base) | IMM_L(i))
> >   #define TEST_LWZX(t, a, b)	(PPC_INST_LWZX | ___PPC_RT(t) |
> > 		\
> > 
> > base-commit: 5aa19adac1f3152a5fd3b865a1ab46bb845d3696
> > 
> 
> Christophe

