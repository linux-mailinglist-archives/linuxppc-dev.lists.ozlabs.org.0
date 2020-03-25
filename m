Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12644191FCF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 04:38:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nDN942DGzDqsy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 14:38:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nDLT1NWLzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 14:36:32 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02P3XtiT035384; Tue, 24 Mar 2020 23:36:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ywbuw736d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 23:36:00 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02P3YGWC036317;
 Tue, 24 Mar 2020 23:35:59 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ywbuw7365-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 23:35:59 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02P3XDdI013399;
 Wed, 25 Mar 2020 03:35:58 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 2ywaw25qey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 03:35:58 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02P3Zwv827328932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Mar 2020 03:35:58 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09B2B124053;
 Wed, 25 Mar 2020 03:35:58 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EA2D124054;
 Wed, 25 Mar 2020 03:35:57 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Mar 2020 03:35:57 +0000 (GMT)
Subject: Re: [PATCH v8 12/14] powerpc/vas: Return credits after handling fault
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <1584931224.oij3nwbo4z.astroid@bobo.none>
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598755.9256.15264.camel@hbabu-laptop>
 <1584931224.oij3nwbo4z.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Mar 2020 20:35:24 -0700
Message-ID: <1585107324.10664.383.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_10:2020-03-23,
 2020-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003250026
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, hch@infradead.org, oohall@gmail.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-03-23 at 12:44 +1000, Nicholas Piggin wrote:
> Haren Myneni's on March 19, 2020 4:19 pm:
> > 
> > NX expects OS to return credit for send window after processing each
> > fault. Also credit has to be returned even for fault window.
> 
> And this should be merged in the fault handler function.

credits are assigned and used per VAS window - default value is 1024 for
user space windows, and fault_fifo_size/CRb_SIZE for fault window.
 
When user space submits request, credit is taken on specific window (by
VAS). After successful processing of this request, NX return credit. In
case if NX sees fault, expects OS return credit for the corresponding
user space window after handling fault CRB. 

Similarly NX takes credit on fault window after pasting fault CRB and
expects return credit after handling fault CRB. NX workbook has on
credits usage and How this credit system works.

Thought vas_return_credit() is unique function and added as separate
patch so that easy to review.

> 
> > 
> > Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/powernv/vas-fault.c  |  9 +++++++++
> >  arch/powerpc/platforms/powernv/vas-window.c | 17 +++++++++++++++++
> >  arch/powerpc/platforms/powernv/vas.h        |  1 +
> >  3 files changed, 27 insertions(+)
> > 
> > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
> > index 40e1de4..292f7ba 100644
> > --- a/arch/powerpc/platforms/powernv/vas-fault.c
> > +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> > @@ -238,6 +238,10 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
> >  		memcpy(crb, fifo, CRB_SIZE);
> >  		entry->stamp.nx.pswid = cpu_to_be32(FIFO_INVALID_ENTRY);
> >  		entry->ccw |= cpu_to_be32(CCW0_INVALID);
> > +		/*
> > +		 * Return credit for the fault window.
> > +		 */
> 
> None of the comments in this patch are useful.
> 
> > +		vas_return_credit(vinst->fault_win, 0);
> 
> Can you use true/false for bools?
> 
> >  		mutex_unlock(&vinst->mutex);
> >  
> >  		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d\n",
> > @@ -267,6 +271,11 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
> >  		}
> >  
> >  		update_csb(window, crb);
> > +		/*
> > +		 * Return credit for send window after processing
> > +		 * fault CRB.
> > +		 */
> 
> Any chance of a little bit of explanation how the credit system works?
> Or is it in the code somewhere already?
Sure will add few comments on credit usage.
> 
> I don't suppose there is a chance to batch credit updates with multiple
> faults? (maybe the MMIO is insignificant)

Yes, we return credit after processing each CRB. In the case of fault
window, NX can continue pasting fault CRB whenever the credit is
available. 

Thanks
Haren

> 
> > +		vas_return_credit(window, 1);
> >  	} while (true);
> >  }
> >  
> 
> Thanks,
> Nick


