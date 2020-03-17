Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD05188DD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 20:16:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hjZT1qlNzDqkj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 06:16:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hjXQ5c5DzDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 06:14:30 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HJ23bn122160; Tue, 17 Mar 2020 15:14:11 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ytb3pvbaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 15:14:11 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02HJ288j122797;
 Tue, 17 Mar 2020 15:14:11 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ytb3pvb9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 15:14:11 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02HJ9tOO009967;
 Tue, 17 Mar 2020 19:14:10 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2yrpw6h76b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 19:14:10 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HJE9GD10617128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 19:14:09 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04B37C6059;
 Tue, 17 Mar 2020 19:14:09 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CD94C6057;
 Tue, 17 Mar 2020 19:14:08 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 19:14:08 +0000 (GMT)
Subject: Re: [PATCH V7 08/14] powerpc/vas: Take reference to PID and mm for
 user space windows
From: Haren Myneni <haren@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <87r1xrpqqh.fsf@mpe.ellerman.id.au>
References: <1583525239.9256.5.camel@hbabu-laptop>
 <1583525764.9256.13.camel@hbabu-laptop> <87r1xrpqqh.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Mar 2020 12:13:48 -0700
Message-ID: <1584472428.9256.14776.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_08:2020-03-17,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=2 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003170071
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-03-17 at 15:09 +1100, Michael Ellerman wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
> > Process close windows after its requests are completed. In multi-thread
> > applications, child can open a window but release FD will not be called
> > upon its exit. Parent thread will be closing it later upon its exit.
> 
> What if the parent exits first?

Thanks for the review.

If the parent exists, child thread will close the window when it exits.
So we should not get the case where window is still open. 


> 
> > The parent can also send NX requests with this window and NX can
> > generate page faults. After kernel handles the page fault, send
> > signal to process by using PID if CSB address is invalid. Parent
> > thread will not receive signal since its PID is different from the one
> > saved in vas_window. So use tgid in case if the task for the pid saved
> > in window is not running and send signal to its parent.
> >
> > To prevent reusing the pid until the window closed, take reference to
> > pid and task mm.
> 
> That text is all very dense. Can you please flesh it out and reword it
> to clearly spell out what's going on in much more detail.

Sure, will update the commit description. 
> 
> 
> > diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
> > index a45d81d..7587258 100644
> > --- a/arch/powerpc/platforms/powernv/vas-window.c
> > +++ b/arch/powerpc/platforms/powernv/vas-window.c
> > @@ -1266,8 +1300,17 @@ int vas_win_close(struct vas_window *window)
> >  	poll_window_castout(window);
> >  
> >  	/* if send window, drop reference to matching receive window */
> > -	if (window->tx_win)
> > +	if (window->tx_win) {
> > +		if (window->user_win) {
> > +			/* Drop references to pid and mm */
> > +			put_pid(window->pid);
> > +			if (window->mm) {
> > +				mmdrop(window->mm);
> > +				mm_context_remove_copro(window->mm);
> 
> That seems backward. Once you drop the reference the mm can be freed
> can't it?

Yes, will change.

> 
> > +			}
> > +		}
> >  		put_rx_win(window->rxwin);
> > +	}
> >  
> >  	vas_window_free(window);
> 
> cheers


