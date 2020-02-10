Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EB0156EA7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 06:19:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GDjm3zb3zDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 16:19:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GDh84nttzDqDl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 16:18:16 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01A5ERL4048289; Mon, 10 Feb 2020 00:18:05 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y1tncgeh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 00:18:05 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01A5FFfD050096;
 Mon, 10 Feb 2020 00:18:05 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y1tncgeh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 00:18:05 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01A5GQtN025550;
 Mon, 10 Feb 2020 05:18:04 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 2y1mm66phm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 05:18:04 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01A5I0so6947074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Feb 2020 05:18:00 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33BC26A054;
 Mon, 10 Feb 2020 05:18:00 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A46CF6A04F;
 Mon, 10 Feb 2020 05:17:59 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 Feb 2020 05:17:59 +0000 (GMT)
Subject: Re: [PATCH V5 06/14] powerpc/vas: Setup thread IRQ handler per VAS
 instance
From: Haren Myneni <haren@linux.ibm.com>
To: Michael Neuling <mikey@neuling.org>
In-Reply-To: <71427c6b8d8e00461fa27e603db2012e8215f467.camel@neuling.org>
References: <1579679802.26081.6.camel@hbabu-laptop>
 <1579680639.26081.31.camel@hbabu-laptop>
 <71427c6b8d8e00461fa27e603db2012e8215f467.camel@neuling.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 09 Feb 2020 21:17:36 -0800
Message-ID: <1581311856.18705.23.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_01:2020-02-07,
 2020-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 mlxlogscore=954 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002100042
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
Cc: herbert@gondor.apana.org.au, npiggin@gmail.com, hch@infradead.org,
 oohall@gmail.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-02-07 at 16:57 +1100, Michael Neuling wrote:
> >  /*
> > + * Process CRBs that we receive on the fault window.
> > + */
> > +irqreturn_t vas_fault_handler(int irq, void *data)
> > +{
> > +	struct vas_instance *vinst = data;
> > +	struct coprocessor_request_block buf, *crb;
> > +	struct vas_window *window;
> > +	void *fifo;
> > +
> > +	/*
> > +	 * VAS can interrupt with multiple page faults. So process all
> > +	 * valid CRBs within fault FIFO until reaches invalid CRB.
> > +	 * NX updates nx_fault_stamp in CRB and pastes in fault FIFO.
> > +	 * kernel retrives send window from parition send window ID
> > +	 * (pswid) in nx_fault_stamp. So pswid should be non-zero and
> > +	 * use this to check whether CRB is valid.
> > +	 * After reading CRB entry, it is reset with 0's in fault FIFO.
> > +	 *
> > +	 * In case kernel receives another interrupt with different page
> > +	 * fault and CRBs are processed by the previous handling, will be
> > +	 * returned from this function when it sees invalid CRB (means 0's).
> > +	 */
> > +	do {
> > +		mutex_lock(&vinst->mutex);
> 
> This isn't going to work.
> 
> From Documentation/locking/mutex-design.rst
> 
>     - Mutexes may not be used in hardware or software interrupt
>       contexts such as tasklets and timers.

Initially used kernel thread per VAS instance and later using IRQ
thread. 

vas_fault_handler() is IRQ thread function, not IRQ handler. I thought
we can use mutex_lock() in thread function.

> 
> Mikey
> 


