Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D039C245
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 23:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxbK01kyvz3bsq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 07:20:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KAe9MAAm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KAe9MAAm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxbJR5gMWz2ykP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 07:20:07 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 154L4w3M020896; Fri, 4 Jun 2021 17:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=wpmvsPDoEIJlZQJgX3R4B+oZxJlXrwoy72BNgCOylFY=;
 b=KAe9MAAm0hpr8aqS8MXC1caY4IVeTpL6T9hRbPlkbX1sBHjYnuE4Kgi//frmLZa1YkA5
 miY7ZlP6wNKaUznqWrtwKHhQ/CySi/6xKs5DjY//9rkrpbTcMV3x2wXBIgUTDxTYBaDJ
 U3810UkI76NtiWm5wY2orSL6IaMgvJXl7328ZgB77M5ZoCc6c7NQw1p+AZshCGo4o+b2
 pw3CehvZ88Uu1aVMGvQvy/DCyNThacO4fPzNyE8jRxV9d/STfK/J+J+h8+fEuwIiKMz2
 D7Kj2el8NzwxTTrl+aaR7t3LNBoskG0Qyrk0dbC48xoNirDXNji54CJpGGtXLi+Sbfv4 Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38ysb1uw0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 17:19:51 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 154L5G4G022661;
 Fri, 4 Jun 2021 17:19:50 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38ysb1uw02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 17:19:50 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 154LBbbn029970;
 Fri, 4 Jun 2021 21:19:50 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 38ud8ab3pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 21:19:50 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 154LJmAY21758396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Jun 2021 21:19:49 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E372DB2068;
 Fri,  4 Jun 2021 21:19:48 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A2DEB2064;
 Fri,  4 Jun 2021 21:19:45 +0000 (GMT)
Received: from sig-9-77-136-17.ibm.com (unknown [9.77.136.17])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Jun 2021 21:19:45 +0000 (GMT)
Message-ID: <c4c983d72417706cc1b54d2439dfe3da455416e8.camel@linux.ibm.com>
Subject: Re: [PATCH v4 06/16] powerpc/vas:  Define and use common vas_window
 struct
From: Haren Myneni <haren@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Date: Fri, 04 Jun 2021 14:19:43 -0700
In-Reply-To: <87r1hhg83t.fsf@mpe.ellerman.id.au>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <6ba07d742db8db2666f4972f02467cc2c6b789ad.camel@linux.ibm.com>
 <1622694591.mzoa5k71xz.astroid@bobo.none>
 <d4505652d8e5355075e3bb2436b1dcd243c64e10.camel@linux.ibm.com>
 <87r1hhg83t.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _7XddQCCNzxrfHWt-yQuC6Aba_MvIizc
X-Proofpoint-ORIG-GUID: kEWdq-lf-P1hC3nJN4VbaPWl9PS2oYGY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_12:2021-06-04,
 2021-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106040146
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

On Fri, 2021-06-04 at 21:52 +1000, Michael Ellerman wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
> > On Thu, 2021-06-03 at 14:38 +1000, Nicholas Piggin wrote:
> > > Excerpts from Haren Myneni's message of May 21, 2021 7:33 pm:
> > > > Same vas_window struct is used on powerNV and pseries. So this
> > > > patch
> > > > changes in struct vas_window to support both platforms and also
> > > > the
> > > > corresponding modifications in powerNV vas code.
> > > > 
> > > > On powerNV, vas_window is used for both TX and RX windows,
> > > > whereas
> > > > only for TX windows on powerVM. So some elements are specific
> > > > to
> > > > these platforms.
> > > > 
> > > > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > > > ---
> > > >  arch/powerpc/include/asm/vas.h              |  50 +++++++-
> > > >  arch/powerpc/platforms/powernv/vas-debug.c  |  12 +-
> > > >  arch/powerpc/platforms/powernv/vas-fault.c  |   4 +-
> > > >  arch/powerpc/platforms/powernv/vas-trace.h  |   6 +-
> > > >  arch/powerpc/platforms/powernv/vas-window.c | 129 +++++++++++-
> > > > ----
> > > > ----
> > > >  arch/powerpc/platforms/powernv/vas.h        |  38 +-----
> > > >  6 files changed, 135 insertions(+), 104 deletions(-)
> > > > 
> > > > diff --git a/arch/powerpc/include/asm/vas.h
> > > > b/arch/powerpc/include/asm/vas.h
> > > > index 2c1040f399d9..49bfb5be896d 100644
> > > > --- a/arch/powerpc/include/asm/vas.h
> > > > +++ b/arch/powerpc/include/asm/vas.h
> > > > @@ -10,8 +10,6 @@
> > > >  #include <asm/icswx.h>
> > > >  #include <uapi/asm/vas-api.h>
> > > >  
> > > > -struct vas_window;
> > > > -
> > > >  /*
> > > >   * Min and max FIFO sizes are based on Version 1.05 Section
> > > > 3.1.4.25
> > > >   * (Local FIFO Size Register) of the VAS workbook.
> > > > @@ -63,6 +61,54 @@ struct vas_user_win_ref {
> > > >  	struct mm_struct *mm;	/* Linux process mm_struct */
> > > >  };
> > > >  
> > > > +/*
> > > > + * In-kernel state a VAS window. One per window.
> > > > + * powerVM: Used only for Tx windows.
> > > > + * powerNV: Used for both Tx and Rx windows.
> > > > + */
> > > > +struct vas_window {
> > > > +	u32 winid;
> > > > +	u32 wcreds_max;	/* Window credits */
> > > > +	enum vas_cop_type cop;
> > > > +	struct vas_user_win_ref task_ref;
> > > > +	char *dbgname;
> > > > +	struct dentry *dbgdir;
> > > > +	union {
> > > > +		/* powerNV specific data */
> > > > +		struct {
> > > > +			void *vinst;	/* points to VAS
> > > > instance
> > > > */
> > > > +			bool tx_win;	/* True if send window
> > > > */
> > > > +			bool nx_win;	/* True if NX window */
> > > > +			bool user_win;	/* True if user space
> > > > window */
> > > > +			void *hvwc_map;	/* HV window context */
> > > > +			void *uwc_map;	/* OS/User window
> > > > context
> > > > */
> > > > +
> > > > +			/* Fields applicable only to send
> > > > windows */
> > > > +			void *paste_kaddr;
> > > > +			char *paste_addr_name;
> > > > +			struct vas_window *rxwin;
> > > > +
> > > > +			atomic_t num_txwins;	/* Only for
> > > > receive
> > > > windows */
> > > > +		} pnv;
> > > > +		struct {
> > > > +			u64 win_addr;	/* Physical paste
> > > > address
> > > > */
> > > > +			u8 win_type;	/* QoS or Default
> > > > window */
> > > > +			u8 status;
> > > > +			u32 complete_irq;	/* Completion
> > > > interrupt */
> > > > +			u32 fault_irq;	/* Fault interrupt */
> > > > +			u64 domain[6];	/* Associativity domain
> > > > Ids
> > > > */
> > > > +					/* this window is
> > > > allocated */
> > > > +			u64 util;
> > > > +
> > > > +			/* List of windows opened which is used
> > > > for LPM
> > > > */
> > > > +			struct list_head win_list;
> > > > +			u64 flags;
> > > > +			char *name;
> > > > +			int fault_virq;
> > > > +		} lpar;
> > > > +	};
> > > > +};
> > > 
> > > The more typical way to do code like this is have the common bit
> > > as
> > > its own struct, and then have the users embed it into their own
> > > structs.
> > > 
> > > 
> > > struct vas_window {
> > > 	u32 winid;
> > > 	u32 wcreds_max;	/* Window credits */
> > > 	enum vas_cop_type cop;
> > > 	struct vas_user_win_ref task_ref;
> > > 	char *dbgname;
> > > 	struct dentry *dbgdir;
> > > };
> > > 
> > > struct pnv_vas_window {
> > > 	struct vas_window vas_window;
> > > 
> > > 	void *vinst;	/* points to VAS instance */
> > > 	bool tx_win;	/* True if send window */
> > > 	bool nx_win;	/* True if NX window */
> > > 	bool user_win;	/* True if user space window */
> > > 	void *hvwc_map;	/* HV window context */
> > > 	void *uwc_map;	/* OS/User window context */
> > > 
> > > 	/* Fields applicable only to send windows */
> > > 	void *paste_kaddr;
> > > 	char *paste_addr_name;
> > > 	struct vas_window *rxwin;
> > > 
> > > 	atomic_t num_txwins;	/* Only for receive windows */
> > > };
> > > 
> > > Which helps reusability / avoids churn (don't have to update the
> > > same 
> > > structure to add new functionality), slightly helps naming and
> > > union 
> > > size mismatches, helps with type checking, etc.
> > > 
> > > Maybe not a great benefit for your code as is which may not grow
> > > more
> > > users, but unless there are some good reasons for the unions I
> > > would 
> > > really consider changing to this style.
> > 
> > Defined platform specific data as union for the following reasons:
> > - vas_window address is saved for each file descriptor
> > (fp-private_data). If we define separate structs for PowerNV and
> > PowerVM, 'struct vas_window' has to be the first element which can
> > add
> > confusion.
> 
> I don't follow.
> 
> I think what you're saying is you want to return a struct vas_window
> *
> to the drive code, ie. you don't want the driver code to know if it's
> a
> pnv window or a pseries one.
> 
> ie. you get a vas_window in open and stash it in fp->private_data:
> 
> static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
> {
> 	...
> 	struct coproc_instance *cp_inst;
> 	struct vas_window *txwin;
> 	int rc;
> 
> 	cp_inst = fp->private_data;
> 
> 	...
> 	txwin = cp_inst->coproc->vops->open_win(&uattr, cp_inst-
> >coproc->cop_type);
> 	...
> 	cp_inst->txwin = txwin;
> 
> 	return 0;
> }
> 
> And then you want to pass it back to the backend (powernv/pseries)
> code
> in eg. mmap:
> 
> static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
> {
> 	struct coproc_instance *cp_inst = fp->private_data;
> 	struct vas_window *txwin;
>         ...
> 
> 	txwin = cp_inst->txwin;
> 
> 	...
> 	paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
> 
> 
> But that can work perfectly fine with Nick's suggestion. You just
> pass
> the vas_window * in and out and the backend code is responsible for
> using container_of() to get access to its backend-specific struct.
> 
> eg. for powernv it would be something like:
> 
> static u64 vas_user_win_paste_addr(struct vas_window *win)
> {
> 	struct pnv_vas_window *pnv_win;
> 	u64 paste_addr;
> 
> 	pnv_win = container_of(win, struct pnv_vas_window, vas_window);
> 
> 	vas_win_paste_addr(pnv_win, &paste_addr, NULL);
> 
> 	return paste_addr;
> }
> 
> 
> Another advantage which I don't think Nick mentioned is that you can
> have the powernv specific parts private to the powernv code, and
> similarly for pseries.


Intially defined the following struct so that can define platform
specific elements and be exposed to only in platform code. But thought
will be simpler with the union since may not be having lot of windows.

struct vas_window {
    /* common elements */
    void *platform_win;
}

I will make the suggested changes.

Thanks
Haren

> 
> cheers

