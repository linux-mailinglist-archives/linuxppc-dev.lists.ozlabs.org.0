Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D6019A4C1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 07:37:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sZhc6k1gzDqT6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 16:37:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sZZl6N9SzDqsh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 16:32:15 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03153Fu5003146
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 01:32:12 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 304h3vw348-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 01:32:12 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Wed, 1 Apr 2020 06:32:00 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 06:31:56 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0315V2Jk30605762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 05:31:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78AAD4C040;
 Wed,  1 Apr 2020 05:32:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 262624C04A;
 Wed,  1 Apr 2020 05:32:03 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.175.204])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  1 Apr 2020 05:32:02 +0000 (GMT)
Date: Tue, 31 Mar 2020 22:32:00 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/XIVE: SVM: share the event-queue page with
 the Hypervisor.
References: <1585211927-784-1-git-send-email-linuxram@us.ibm.com>
 <87r1x86pzw.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r1x86pzw.fsf@morokweng.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20040105-0008-0000-0000-000003684423
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040105-0009-0000-0000-00004A89CB08
Message-Id: <20200401053200.GE5903@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010044
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, groug@kaod.org,
 kvm-ppc@vger.kernel.org, clg@fr.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 08:53:07PM -0300, Thiago Jung Bauermann wrote:
> 
> Hi Ram,
> 
> Ram Pai <linuxram@us.ibm.com> writes:
> 
> > diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
> > index 55dc61c..608b52f 100644
> > --- a/arch/powerpc/sysdev/xive/spapr.c
> > +++ b/arch/powerpc/sysdev/xive/spapr.c
> > @@ -26,6 +26,8 @@
> >  #include <asm/xive.h>
> >  #include <asm/xive-regs.h>
> >  #include <asm/hvcall.h>
> > +#include <asm/svm.h>
> > +#include <asm/ultravisor.h>
> >  
> >  #include "xive-internal.h"
> >  
> > @@ -501,6 +503,9 @@ static int xive_spapr_configure_queue(u32 target, struct xive_q *q, u8 prio,
> >  		rc = -EIO;
> >  	} else {
> >  		q->qpage = qpage;
> > +		if (is_secure_guest())
> > +			uv_share_page(PHYS_PFN(qpage_phys),
> > +					1 << xive_alloc_order(order));
> 
> If I understand this correctly, you're passing the number of bytes of
> the queue to uv_share_page(), but that ultracall expects the number of
> pages to be shared.


static inline u32 xive_alloc_order(u32 queue_shift)
{
        return (queue_shift > PAGE_SHIFT) ? (queue_shift - PAGE_SHIFT) : 0;
}

xive_alloc_order(order) returns the order of PAGE_SIZE pages.
Hence the value passed to uv_shared_pages is the number of pages,
and not the number of bytes.

BTW: I did verify through testing that it was indeed passing 1 page to the
uv_share_page().  

RP

