Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0935D37986D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 22:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfCTB0YVcz30Hk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 06:34:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qrHtXn/t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qrHtXn/t; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfCSf1dzpz2yWK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 06:33:53 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14AKWxPK164813; Mon, 10 May 2021 16:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ZaYXqzhAdMlM6eU4azwpCAo/jp804HQsNhxXAkn1OTA=;
 b=qrHtXn/tCZYMP0uJ4TiQSsmzq1HOQm3k1QzF/ztkQC8eDL9HrGbmXd22DMqMpMn30AdQ
 to8CPbaWS0GMbuVpu/Wg4DF21bcNFO7Y1gOqSTCbvJrbWMhxfQFj9WXClahGzZ3/nR8k
 IO08je/jp7tW7vgTkEMgnXLlf2++ZnPlBS0wp016fdfl76BvkS16OnrvrcGg0kBfHYHf
 nH4RE8KO5y/e1DQLZHdf8HEac7IDFDRbvHzAlhznjKPvcAVvQ1hyOtK5rL76AedSTCpy
 T9aSc+X+IRkwbrSXcMn+NCmyEwLvqm9NDvwj8GbJcvEUpE8kvXzf6GdKkh+LJ5bSCqFM Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38f8cuxm3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 16:33:42 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14AKXDZ0168118;
 Mon, 10 May 2021 16:33:42 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38f8cuxm33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 16:33:42 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14AKXZH0004026;
 Mon, 10 May 2021 20:33:41 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 38dj99d6b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 20:33:41 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14AKWreV31195500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 20:32:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D0B0112061;
 Mon, 10 May 2021 20:32:53 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA82E112062;
 Mon, 10 May 2021 20:32:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.194.217])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 10 May 2021 20:32:52 +0000 (GMT)
Message-ID: <87bf041c7b33464c7d312f12f1329db7687750aa.camel@linux.ibm.com>
Subject: Re: [V3 PATCH 03/16] powerpc/vas: Create take/drop task reference
 functions
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Mon, 10 May 2021 13:32:51 -0700
In-Reply-To: <1620624047.yy8sqcrk40.astroid@bobo.none>
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <3d634fb22a1d3d87f3172b23414a48650fc9a366.camel@linux.ibm.com>
 <1620624047.yy8sqcrk40.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YcbY4PPH2RR4tYvXHyFNf18H8T_8DcTr
X-Proofpoint-ORIG-GUID: X5r-Sx17i6_TSlOQ-AwzqgWB5cNyA2Zc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-10_12:2021-05-10,
 2021-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105100140
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2021-05-10 at 15:28 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of April 18, 2021 7:03 am:
> > Take task reference when each window opens and drops during close.
> > This functionality is needed for powerNV and pseries. So this patch
> > defines the existing code as functions in common book3s platform
> > vas-api.c
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/vas.h              | 20 ++++++++
> >  arch/powerpc/platforms/book3s/vas-api.c     | 51
> > ++++++++++++++++++
> >  arch/powerpc/platforms/powernv/vas-fault.c  | 10 ++--
> >  arch/powerpc/platforms/powernv/vas-window.c | 57 ++---------------
> > ----
> >  arch/powerpc/platforms/powernv/vas.h        |  6 +--
> >  5 files changed, 83 insertions(+), 61 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index 6bbade60d8f4..2daaa1a2a9a9 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -5,6 +5,9 @@
> >  
> >  #ifndef _ASM_POWERPC_VAS_H
> >  #define _ASM_POWERPC_VAS_H
> > +#include <linux/sched/mm.h>
> > +#include <linux/mmu_context.h>
> > +#include <asm/icswx.h>
> >  #include <uapi/asm/vas-api.h>
> >  
> >  
> > @@ -60,6 +63,22 @@ struct vas_user_win_ops {
> >  	int (*close_win)(void *);
> >  };
> >  
> > +struct vas_win_task {
> > +	struct pid *pid;	/* Thread group ID of owner */
> > +	struct pid *tgid;	/* Linux process mm_struct */
> > +	struct mm_struct *mm;	/* Linux process mm_struct */
> > +};
> 
> Looks okay, happy with struct vas_win_task? (and vas_user_win_ops)?
> 
> I'd be happier to have everything related to vas windows prefixed
> with 
> vas_window_ consistently, and have _user be present always for
> userspace
> windows, but you have to read and type it.

I will change to vas_window_task and vas_user_window_ops. struct
vas_window is common for both kernel and user space window, but struct
vas_window_task is needed only for user space.

> 
> > +
> > +static inline void vas_drop_reference_task(struct vas_win_task
> > *task)
> 
> This is not dropping a reference task, but a task reference. And
> it's 
> not really a task reference as far as Linux understands, but a
> reference on pid (not task) and mm related to an open vas window. And
> specifically a user window (with corresponding vas_user_win_ops).

Yes get and put references to pid and mm. Hence mentioned
reference_task to reflect for both pid and mm. Would you prefer
vas_put_reference_pid_mm()?

> 
> Could it be called a 'struct vas_window_user_ref' instead?

To support LPM and DLPAR, plannig to add VMA (mapping address) in
struct vas_window_task. But I can change it to 'struct
vas_window_user_ref' instread of vas_window_task.

Thanks
Haren 

> 
> Thanks,
> Nick
> 
> > +{
> > +	/* Drop references to pid and mm */
> > +	put_pid(task->pid);
> > +	if (task->mm) {
> > +		mm_context_remove_vas_window(task->mm);
> > +		mmdrop(task->mm);
> > +	}

