Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC019DDEA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:26:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v7g61bbBzDqsR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 05:26:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v7cy0yjqzDscf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 05:24:33 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 033HYaUU008830; Fri, 3 Apr 2020 14:24:21 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 301yfk69kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 14:24:21 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 033IMqsI026873;
 Fri, 3 Apr 2020 18:24:19 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 301x77k23p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 18:24:19 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 033IOJBh55312726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 18:24:19 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AA51AC060;
 Fri,  3 Apr 2020 18:24:19 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 823BFAC05E;
 Fri,  3 Apr 2020 18:24:16 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.180.115])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri,  3 Apr 2020 18:24:16 +0000 (GMT)
References: <1585211927-784-1-git-send-email-linuxram@us.ibm.com>
 <87r1x86pzw.fsf@morokweng.localdomain>
 <20200401053200.GE5903@oc0525413822.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v2] powerpc/XIVE: SVM: share the event-queue page with the
 Hypervisor.
In-reply-to: <20200401053200.GE5903@oc0525413822.ibm.com>
Date: Fri, 03 Apr 2020 15:24:12 -0300
Message-ID: <87pncobf77.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_14:2020-04-03,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030145
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, groug@kaod.org,
 kvm-ppc@vger.kernel.org, clg@fr.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Ram Pai <linuxram@us.ibm.com> writes:

> On Tue, Mar 31, 2020 at 08:53:07PM -0300, Thiago Jung Bauermann wrote:
>> 
>> Hi Ram,
>> 
>> Ram Pai <linuxram@us.ibm.com> writes:
>> 
>> > diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
>> > index 55dc61c..608b52f 100644
>> > --- a/arch/powerpc/sysdev/xive/spapr.c
>> > +++ b/arch/powerpc/sysdev/xive/spapr.c
>> > @@ -26,6 +26,8 @@
>> >  #include <asm/xive.h>
>> >  #include <asm/xive-regs.h>
>> >  #include <asm/hvcall.h>
>> > +#include <asm/svm.h>
>> > +#include <asm/ultravisor.h>
>> >  
>> >  #include "xive-internal.h"
>> >  
>> > @@ -501,6 +503,9 @@ static int xive_spapr_configure_queue(u32 target, struct xive_q *q, u8 prio,
>> >  		rc = -EIO;
>> >  	} else {
>> >  		q->qpage = qpage;
>> > +		if (is_secure_guest())
>> > +			uv_share_page(PHYS_PFN(qpage_phys),
>> > +					1 << xive_alloc_order(order));
>> 
>> If I understand this correctly, you're passing the number of bytes of
>> the queue to uv_share_page(), but that ultracall expects the number of
>> pages to be shared.
>
>
> static inline u32 xive_alloc_order(u32 queue_shift)
> {
>         return (queue_shift > PAGE_SHIFT) ? (queue_shift - PAGE_SHIFT) : 0;
> }
>
> xive_alloc_order(order) returns the order of PAGE_SIZE pages.
> Hence the value passed to uv_shared_pages is the number of pages,
> and not the number of bytes.
>
> BTW: I did verify through testing that it was indeed passing 1 page to the
> uv_share_page().  

Ah, my mistake. I misunderstood the code. Sorry for the noise and thanks
for clarifying.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
