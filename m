Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C801223F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 06:41:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cRnl56vTzDqLF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 16:40:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cRkd0nffzDqWm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 16:38:16 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBH5bPr9076008; Tue, 17 Dec 2019 00:37:53 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wxfgsqn63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 00:37:53 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBH5bq0W078051;
 Tue, 17 Dec 2019 00:37:52 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wxfgsqn5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 00:37:52 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBH5YePg010353;
 Tue, 17 Dec 2019 05:37:52 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 2wvqc69cgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 05:37:52 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBH5bpcu55378182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2019 05:37:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C45F7805E;
 Tue, 17 Dec 2019 05:37:51 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A2B378063;
 Tue, 17 Dec 2019 05:37:50 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Dec 2019 05:37:50 +0000 (GMT)
Subject: Re: [PATCH V2 07/13] powerpc/vas: Take reference to PID and mm for
 user space windows
From: Haren Myneni <haren@linux.ibm.com>
To: Christoph Hellwig <hch@infradead.org>
In-Reply-To: <20191212130248.GE3381@infradead.org>
References: <1575861522.16318.9.camel@hbabu-laptop>
 <1575862366.16318.24.camel@hbabu-laptop>
 <20191212130248.GE3381@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Dec 2019 21:35:58 -0800
Message-ID: <1576560958.16318.6529.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_01:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=596 mlxscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912170050
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-12-12 at 05:02 -0800, Christoph Hellwig wrote:
> > +	if (txwin->user_win) {
> > +		/*
> > +		 * Window opened by child thread may not be closed when
> > +		 * it exits. So take reference to its pid and release it
> > +		 * when the window is free by parent thread.
> > +		 * Acquire a reference to the task's pid to make sure
> > +		 * pid will not be re-used.
> > +		 */
> > +		txwin->pid = get_task_pid(current, PIDTYPE_PID);
> > +		/*
> > +		 * Acquire a reference to the task's mm.
> > +		 */
> > +		txwin->mm = get_task_mm(current);
> > +
> > +		if (txwin->mm) {
> > +			mmput(txwin->mm);
> > +			mmgrab(txwin->mm);
> 
> Doesn't the mmgrab need to come before the mmput?
> 
> > +			mm_context_add_copro(txwin->mm);
> > +		} else {
> > +			put_pid(txwin->pid);
> > +			pr_err("VAS: pid(%d): mm_struct is not found\n",
> > +					current->pid);
> > +			rc = -EPERM;
> > +			goto free_window;
> > +		}
> 
> Also the code is much easier to follow if you handle the error
> first and avoid the else:
> 
> 		txwin->mm = get_task_mm(current);
> 		if (!txwin->mm) {
> 			put_pid(txwin->pid);
> 			pr_err("VAS: pid(%d): mm_struct is not found\n",
> 					current->pid);
> 			rc = -EPERM;
> 			goto free_window;
> 		}
> 		mmgrab(txwin->mm);
> 		mmput(txwin->mm);
> 
> Also don't you need to take a reference to the struct pid for the
> tgid as well?

Process opens window and closed it upon its exit. We do not have to take
pid reference in this case. But in multithread applications, child
thread can open window, can exit without closing it. Parent thread can
use this window and expects to close it later. So in this case pid
reference for child thread is needed. Where as parent thread is the one
who is closing the window later, do not to have to take its pid
reference.

Basically we are taking pid reference to the process who opens the
window to cover multithread applications.

Thanks for your review comments. I will post V3 patches.


