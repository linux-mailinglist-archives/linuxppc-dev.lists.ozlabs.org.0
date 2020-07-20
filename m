Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE504225A70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 10:54:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9Frx3XgLzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 18:54:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9Fq12BnbzDqW1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 18:52:29 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K8ofZb122606; Mon, 20 Jul 2020 04:52:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5p8mg7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 04:52:24 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06K8XGKi063452;
 Mon, 20 Jul 2020 04:52:24 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5p8mg66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 04:52:23 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06K8oIYB005708;
 Mon, 20 Jul 2020 08:52:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 32brq8181t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 08:52:21 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06K8qGLk20382182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 08:52:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F46AAE051;
 Mon, 20 Jul 2020 08:52:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6E38AE053;
 Mon, 20 Jul 2020 08:52:14 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 20 Jul 2020 08:52:14 +0000 (GMT)
Date: Mon, 20 Jul 2020 14:22:14 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH 04/11] powerpc/smp: Enable small core scheduling sooner
Message-ID: <20200720085214.GG21103@linux.vnet.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-5-srikar@linux.vnet.ibm.com>
 <CACzsE9qoyh++qfTrNq5BXc5eAJeg8Gz2WxrWs4spG40t3c+MBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CACzsE9qoyh++qfTrNq5BXc5eAJeg8Gz2WxrWs4spG40t3c+MBg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_04:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200060
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Jordan Niethe <jniethe5@gmail.com> [2020-07-20 17:47:27]:

> On Tue, Jul 14, 2020 at 2:44 PM Srikar Dronamraju
> <srikar@linux.vnet.ibm.com> wrote:
> >
> > Enable small core scheduling as soon as we detect that we are in a
> > system that supports thread group. Doing so would avoid a redundant
> > check.
> >
> > Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> > Cc: Michael Ellerman <michaele@au1.ibm.com>
> > Cc: Nick Piggin <npiggin@au1.ibm.com>
> > Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
> > Cc: Nathan Lynch <nathanl@linux.ibm.com>
> > Cc: Michael Neuling <mikey@linux.ibm.com>
> > Cc: Anton Blanchard <anton@au1.ibm.com>
> > Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> > Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/kernel/smp.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > index 24529f6134aa..7d430fc536cc 100644
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -892,6 +892,12 @@ static int init_big_cores(void)
> >         }
> >
> >         has_big_cores = true;
> > +
> > +#ifdef CONFIG_SCHED_SMT
> > +       pr_info("Big cores detected. Using small core scheduling\n");
> Why change the wording from "Big cores detected but using small core
> scheduling\n"?
> > +       powerpc_topology[0].mask = smallcore_smt_mask;
> > +#endif
> > +

To me, "but" in the message sounded as if we detected Big cores *but* we want
to continue using smallcore scheduling. However the code was always meaning
to say, "Since we detected big core, i.e thread grouping within a core, System would
benefit by using small core scheduling".

If you think, "but" was adding more info and not misleading, then I can add it back.

> >         return 0;
> >  }
> >

-- 
Thanks and Regards
Srikar Dronamraju
