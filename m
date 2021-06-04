Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D494939B18A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 06:36:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx91z2881z305t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 14:36:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ps9J0cNV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ps9J0cNV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx91Q4Zh7z2yYn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 14:35:38 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1544X9nL092736; Fri, 4 Jun 2021 00:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Z8ERfD3sZ7PCSZrMxxQwIWjrU9m0Tg3Gpe9a6n4aV9w=;
 b=Ps9J0cNVdAupN1VdGRROUv9qMurMzVXNvh+g/JFXJm6aLX3mJkFnn7MkSYd7eaBAVdTE
 9nUlA5p5rkM4YEfkwck/yFiB6xXCBPclpV0Ew9COoH6GxMz04l+tPdDDKUao+V6BlKXi
 ykfS86xFYK/e2p9lsCqLFKXsEhJmYvjgrsG9tVKLEWhJeSMqQFoa596zD8bU9uMt/bs8
 TN8pGyyjHLwv3fEA9cPNjULJJWhr9CX+z0X7DjjWpzBmHQPWvedcqfeABb8kpiEtl2Kz
 TDUizN7bFt/pUwu83v1LhxJTCnO+g4pqxL9442ejEirDJ0OGXsL7NscxJ1m1JNGUTfz/ xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38yb9dae0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 00:35:30 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1544XEE9092881;
 Fri, 4 Jun 2021 00:35:29 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38yb9dae09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 00:35:29 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1544Xo2q018110;
 Fri, 4 Jun 2021 04:35:28 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 38ud8a8fvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 04:35:28 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1544ZRBG29229494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Jun 2021 04:35:27 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 614C1C6059;
 Fri,  4 Jun 2021 04:35:27 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC37EC605B;
 Fri,  4 Jun 2021 04:35:25 +0000 (GMT)
Received: from sig-9-77-136-17.ibm.com (unknown [9.77.136.17])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Jun 2021 04:35:25 +0000 (GMT)
Message-ID: <d4505652d8e5355075e3bb2436b1dcd243c64e10.camel@linux.ibm.com>
Subject: Re: [PATCH v4 06/16] powerpc/vas:  Define and use common vas_window
 struct
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Thu, 03 Jun 2021 21:35:23 -0700
In-Reply-To: <1622694591.mzoa5k71xz.astroid@bobo.none>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <6ba07d742db8db2666f4972f02467cc2c6b789ad.camel@linux.ibm.com>
 <1622694591.mzoa5k71xz.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wr2jEaUBjwmaPMI1lP9nFQ3d_0z5Pedp
X-Proofpoint-ORIG-GUID: eNkjwuQ89miLDTU1qd9Y0JOu90xfCo4i
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_01:2021-06-04,
 2021-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106040035
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

On Thu, 2021-06-03 at 14:38 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of May 21, 2021 7:33 pm:
> > Same vas_window struct is used on powerNV and pseries. So this
> > patch
> > changes in struct vas_window to support both platforms and also the
> > corresponding modifications in powerNV vas code.
> > 
> > On powerNV, vas_window is used for both TX and RX windows, whereas
> > only for TX windows on powerVM. So some elements are specific to
> > these platforms.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/vas.h              |  50 +++++++-
> >  arch/powerpc/platforms/powernv/vas-debug.c  |  12 +-
> >  arch/powerpc/platforms/powernv/vas-fault.c  |   4 +-
> >  arch/powerpc/platforms/powernv/vas-trace.h  |   6 +-
> >  arch/powerpc/platforms/powernv/vas-window.c | 129 +++++++++++-----
> > ----
> >  arch/powerpc/platforms/powernv/vas.h        |  38 +-----
> >  6 files changed, 135 insertions(+), 104 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index 2c1040f399d9..49bfb5be896d 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -10,8 +10,6 @@
> >  #include <asm/icswx.h>
> >  #include <uapi/asm/vas-api.h>
> >  
> > -struct vas_window;
> > -
> >  /*
> >   * Min and max FIFO sizes are based on Version 1.05 Section
> > 3.1.4.25
> >   * (Local FIFO Size Register) of the VAS workbook.
> > @@ -63,6 +61,54 @@ struct vas_user_win_ref {
> >  	struct mm_struct *mm;	/* Linux process mm_struct */
> >  };
> >  
> > +/*
> > + * In-kernel state a VAS window. One per window.
> > + * powerVM: Used only for Tx windows.
> > + * powerNV: Used for both Tx and Rx windows.
> > + */
> > +struct vas_window {
> > +	u32 winid;
> > +	u32 wcreds_max;	/* Window credits */
> > +	enum vas_cop_type cop;
> > +	struct vas_user_win_ref task_ref;
> > +	char *dbgname;
> > +	struct dentry *dbgdir;
> > +	union {
> > +		/* powerNV specific data */
> > +		struct {
> > +			void *vinst;	/* points to VAS instance
> > */
> > +			bool tx_win;	/* True if send window */
> > +			bool nx_win;	/* True if NX window */
> > +			bool user_win;	/* True if user space
> > window */
> > +			void *hvwc_map;	/* HV window context */
> > +			void *uwc_map;	/* OS/User window context
> > */
> > +
> > +			/* Fields applicable only to send windows */
> > +			void *paste_kaddr;
> > +			char *paste_addr_name;
> > +			struct vas_window *rxwin;
> > +
> > +			atomic_t num_txwins;	/* Only for receive
> > windows */
> > +		} pnv;
> > +		struct {
> > +			u64 win_addr;	/* Physical paste address
> > */
> > +			u8 win_type;	/* QoS or Default window */
> > +			u8 status;
> > +			u32 complete_irq;	/* Completion interrupt */
> > +			u32 fault_irq;	/* Fault interrupt */
> > +			u64 domain[6];	/* Associativity domain Ids
> > */
> > +					/* this window is allocated */
> > +			u64 util;
> > +
> > +			/* List of windows opened which is used for LPM
> > */
> > +			struct list_head win_list;
> > +			u64 flags;
> > +			char *name;
> > +			int fault_virq;
> > +		} lpar;
> > +	};
> > +};
> 
> The more typical way to do code like this is have the common bit as
> its 
> own struct, and then have the users embed it into their own structs.
> 
> 
> struct vas_window {
> 	u32 winid;
> 	u32 wcreds_max;	/* Window credits */
> 	enum vas_cop_type cop;
> 	struct vas_user_win_ref task_ref;
> 	char *dbgname;
> 	struct dentry *dbgdir;
> };
> 
> struct pnv_vas_window {
> 	struct vas_window vas_window;
> 
> 	void *vinst;	/* points to VAS instance */
> 	bool tx_win;	/* True if send window */
> 	bool nx_win;	/* True if NX window */
> 	bool user_win;	/* True if user space window */
> 	void *hvwc_map;	/* HV window context */
> 	void *uwc_map;	/* OS/User window context */
> 
> 	/* Fields applicable only to send windows */
> 	void *paste_kaddr;
> 	char *paste_addr_name;
> 	struct vas_window *rxwin;
> 
> 	atomic_t num_txwins;	/* Only for receive windows */
> };
> 
> Which helps reusability / avoids churn (don't have to update the
> same 
> structure to add new functionality), slightly helps naming and union 
> size mismatches, helps with type checking, etc.
> 
> Maybe not a great benefit for your code as is which may not grow more
> users, but unless there are some good reasons for the unions I would 
> really consider changing to this style.

Defined platform specific data as union for the following reasons:
- vas_window address is saved for each file descriptor (fp-
>private_data). If we define separate structs for PowerNV and PowerVM,
'struct vas_window' has to be the first element which can add
confusion.
- vas-window is also used in the PowerNV driver. since exposed this
struct to the driver, thought clean way of exposing common vas-window. 
- Not wasting much memory on PowerNV. Max may be around 20 bytes /
window. 

Thanks
Haren
> 
> Thanks,
> Nick
> 
> > +		struct {
> > +			u64 win_addr;	/* Physical paste address
> > */
> > +			u8 win_type;	/* QoS or Default window */
> > +			u8 status;
> > +			u32 complete_irq;	/* Completion interrupt */
> > +			u32 fault_irq;	/* Fault interrupt */
> > +			u64 domain[6];	/* Associativity domain Ids
> > */
> > +					/* this window is allocated */
> > +			u64 util;
> > +
> > +			/* List of windows opened which is used for LPM
> > */
> > +			struct list_head win_list;
> > +			u64 flags;
> > +			char *name;
> > +			int fault_virq;
> > +		} lpar;
> > +	};
> > +};
> > +
> >  /*
> >   * User space window operations used for powernv and powerVM
> >   */
> > diff --git a/arch/powerpc/platforms/powernv/vas-debug.c
> > b/arch/powerpc/platforms/powernv/vas-debug.c
> > index 41fa90d2f4ab..80f735449ab8 100644
> > --- a/arch/powerpc/platforms/powernv/vas-debug.c
> > +++ b/arch/powerpc/platforms/powernv/vas-debug.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/seq_file.h>
> > +#include <asm/vas.h>
> >  #include "vas.h"
> >  
> >  static struct dentry *vas_debugfs;
> > @@ -33,11 +34,11 @@ static int info_show(struct seq_file *s, void
> > *private)
> >  	mutex_lock(&vas_mutex);
> >  
> >  	/* ensure window is not unmapped */
> > -	if (!window->hvwc_map)
> > +	if (!window->pnv.hvwc_map)
> >  		goto unlock;
> >  
> >  	seq_printf(s, "Type: %s, %s\n", cop_to_str(window->cop),
> > -					window->tx_win ? "Send" :
> > "Receive");
> > +				window->pnv.tx_win ? "Send" :
> > "Receive");
> >  	seq_printf(s, "Pid : %d\n", vas_window_pid(window));
> >  
> >  unlock:
> > @@ -60,7 +61,7 @@ static int hvwc_show(struct seq_file *s, void
> > *private)
> >  	mutex_lock(&vas_mutex);
> >  
> >  	/* ensure window is not unmapped */
> > -	if (!window->hvwc_map)
> > +	if (!window->pnv.hvwc_map)
> >  		goto unlock;
> >  
> >  	print_reg(s, window, VREG(LPID));
> > @@ -115,9 +116,10 @@ void vas_window_free_dbgdir(struct vas_window
> > *window)
> >  
> >  void vas_window_init_dbgdir(struct vas_window *window)
> >  {
> > +	struct vas_instance *vinst = window->pnv.vinst;
> >  	struct dentry *d;
> >  
> > -	if (!window->vinst->dbgdir)
> > +	if (!vinst->dbgdir)
> >  		return;
> >  
> >  	window->dbgname = kzalloc(16, GFP_KERNEL);
> > @@ -126,7 +128,7 @@ void vas_window_init_dbgdir(struct vas_window
> > *window)
> >  
> >  	snprintf(window->dbgname, 16, "w%d", window->winid);
> >  
> > -	d = debugfs_create_dir(window->dbgname, window->vinst->dbgdir);
> > +	d = debugfs_create_dir(window->dbgname, vinst->dbgdir);
> >  	window->dbgdir = d;
> >  
> >  	debugfs_create_file("info", 0444, d, window, &info_fops);
> > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c
> > b/arch/powerpc/platforms/powernv/vas-fault.c
> > index 2729ac541fb3..faaf5b110645 100644
> > --- a/arch/powerpc/platforms/powernv/vas-fault.c
> > +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> > @@ -152,10 +152,10 @@ irqreturn_t vas_fault_thread_fn(int irq, void
> > *data)
> >  			/*
> >  			 * NX sees faults only with user space windows.
> >  			 */
> > -			if (window->user_win)
> > +			if (window->pnv.user_win)
> >  				vas_update_csb(crb, &window->task_ref);
> >  			else
> > -				WARN_ON_ONCE(!window->user_win);
> > +				WARN_ON_ONCE(!window->pnv.user_win);
> >  
> >  			/*
> >  			 * Return credit for send window after
> > processing
> > diff --git a/arch/powerpc/platforms/powernv/vas-trace.h
> > b/arch/powerpc/platforms/powernv/vas-trace.h
> > index a449b9f0c12e..843aae37c07a 100644
> > --- a/arch/powerpc/platforms/powernv/vas-trace.h
> > +++ b/arch/powerpc/platforms/powernv/vas-trace.h
> > @@ -95,9 +95,11 @@ TRACE_EVENT(	vas_paste_crb,
> >  
> >  		TP_fast_assign(
> >  			__entry->pid = tsk->pid;
> > -			__entry->vasid = win->vinst->vas_id;
> > +			__entry->vasid =
> > +				((struct vas_instance *)win-
> > >pnv.vinst)->vas_id;
> >  			__entry->winid = win->winid;
> > -			__entry->paste_kaddr = (unsigned long)win-
> > >paste_kaddr
> > +			__entry->paste_kaddr =
> > +				(unsigned long)win->pnv.paste_kaddr;
> >  		),
> >  
> >  		TP_printk("pid=%d, vasid=%d, winid=%d,
> > paste_kaddr=0x%016lx\n",
> > diff --git a/arch/powerpc/platforms/powernv/vas-window.c
> > b/arch/powerpc/platforms/powernv/vas-window.c
> > index ffd619e5a218..6ce8ee4b3371 100644
> > --- a/arch/powerpc/platforms/powernv/vas-window.c
> > +++ b/arch/powerpc/platforms/powernv/vas-window.c
> > @@ -31,9 +31,10 @@ void vas_win_paste_addr(struct vas_window
> > *window, u64 *addr, int *len)
> >  {
> >  	int winid;
> >  	u64 base, shift;
> > +	struct vas_instance *vinst = window->pnv.vinst;
> >  
> > -	base = window->vinst->paste_base_addr;
> > -	shift = window->vinst->paste_win_id_shift;
> > +	base = vinst->paste_base_addr;
> > +	shift = vinst->paste_win_id_shift;
> >  	winid = window->winid;
> >  
> >  	*addr  = base + (winid << shift);
> > @@ -46,9 +47,10 @@ void vas_win_paste_addr(struct vas_window
> > *window, u64 *addr, int *len)
> >  static inline void get_hvwc_mmio_bar(struct vas_window *window,
> >  			u64 *start, int *len)
> >  {
> > +	struct vas_instance *vinst = window->pnv.vinst;
> >  	u64 pbaddr;
> >  
> > -	pbaddr = window->vinst->hvwc_bar_start;
> > +	pbaddr = vinst->hvwc_bar_start;
> >  	*start = pbaddr + window->winid * VAS_HVWC_SIZE;
> >  	*len = VAS_HVWC_SIZE;
> >  }
> > @@ -56,9 +58,10 @@ static inline void get_hvwc_mmio_bar(struct
> > vas_window *window,
> >  static inline void get_uwc_mmio_bar(struct vas_window *window,
> >  			u64 *start, int *len)
> >  {
> > +	struct vas_instance *vinst = window->pnv.vinst;
> >  	u64 pbaddr;
> >  
> > -	pbaddr = window->vinst->uwc_bar_start;
> > +	pbaddr = vinst->uwc_bar_start;
> >  	*start = pbaddr + window->winid * VAS_UWC_SIZE;
> >  	*len = VAS_UWC_SIZE;
> >  }
> > @@ -74,13 +77,14 @@ static void *map_paste_region(struct vas_window
> > *txwin)
> >  	void *map;
> >  	char *name;
> >  	u64 start;
> > +	struct vas_instance *vinst = txwin->pnv.vinst;
> >  
> > -	name = kasprintf(GFP_KERNEL, "window-v%d-w%d", txwin->vinst-
> > >vas_id,
> > +	name = kasprintf(GFP_KERNEL, "window-v%d-w%d", vinst->vas_id,
> >  				txwin->winid);
> >  	if (!name)
> >  		goto free_name;
> >  
> > -	txwin->paste_addr_name = name;
> > +	txwin->pnv.paste_addr_name = name;
> >  	vas_win_paste_addr(txwin, &start, &len);
> >  
> >  	if (!request_mem_region(start, len, name)) {
> > @@ -138,12 +142,12 @@ static void unmap_paste_region(struct
> > vas_window *window)
> >  	int len;
> >  	u64 busaddr_start;
> >  
> > -	if (window->paste_kaddr) {
> > +	if (window->pnv.paste_kaddr) {
> >  		vas_win_paste_addr(window, &busaddr_start, &len);
> > -		unmap_region(window->paste_kaddr, busaddr_start, len);
> > -		window->paste_kaddr = NULL;
> > -		kfree(window->paste_addr_name);
> > -		window->paste_addr_name = NULL;
> > +		unmap_region(window->pnv.paste_kaddr, busaddr_start,
> > len);
> > +		window->pnv.paste_kaddr = NULL;
> > +		kfree(window->pnv.paste_addr_name);
> > +		window->pnv.paste_addr_name = NULL;
> >  	}
> >  }
> >  
> > @@ -163,11 +167,11 @@ static void unmap_winctx_mmio_bars(struct
> > vas_window *window)
> >  
> >  	mutex_lock(&vas_mutex);
> >  
> > -	hvwc_map = window->hvwc_map;
> > -	window->hvwc_map = NULL;
> > +	hvwc_map = window->pnv.hvwc_map;
> > +	window->pnv.hvwc_map = NULL;
> >  
> > -	uwc_map = window->uwc_map;
> > -	window->uwc_map = NULL;
> > +	uwc_map = window->pnv.uwc_map;
> > +	window->pnv.uwc_map = NULL;
> >  
> >  	mutex_unlock(&vas_mutex);
> >  
> > @@ -193,12 +197,12 @@ static int map_winctx_mmio_bars(struct
> > vas_window *window)
> >  	u64 start;
> >  
> >  	get_hvwc_mmio_bar(window, &start, &len);
> > -	window->hvwc_map = map_mmio_region("HVWCM_Window", start, len);
> > +	window->pnv.hvwc_map = map_mmio_region("HVWCM_Window", start,
> > len);
> >  
> >  	get_uwc_mmio_bar(window, &start, &len);
> > -	window->uwc_map = map_mmio_region("UWCM_Window", start, len);
> > +	window->pnv.uwc_map = map_mmio_region("UWCM_Window", start,
> > len);
> >  
> > -	if (!window->hvwc_map || !window->uwc_map) {
> > +	if (!window->pnv.hvwc_map || !window->pnv.uwc_map) {
> >  		unmap_winctx_mmio_bars(window);
> >  		return -1;
> >  	}
> > @@ -523,7 +527,7 @@ static int vas_assign_window_id(struct ida
> > *ida)
> >  static void vas_window_free(struct vas_window *window)
> >  {
> >  	int winid = window->winid;
> > -	struct vas_instance *vinst = window->vinst;
> > +	struct vas_instance *vinst = window->pnv.vinst;
> >  
> >  	unmap_winctx_mmio_bars(window);
> >  
> > @@ -547,7 +551,7 @@ static struct vas_window
> > *vas_window_alloc(struct vas_instance *vinst)
> >  	if (!window)
> >  		goto out_free;
> >  
> > -	window->vinst = vinst;
> > +	window->pnv.vinst = vinst;
> >  	window->winid = winid;
> >  
> >  	if (map_winctx_mmio_bars(window))
> > @@ -566,9 +570,9 @@ static struct vas_window
> > *vas_window_alloc(struct vas_instance *vinst)
> >  static void put_rx_win(struct vas_window *rxwin)
> >  {
> >  	/* Better not be a send window! */
> > -	WARN_ON_ONCE(rxwin->tx_win);
> > +	WARN_ON_ONCE(rxwin->pnv.tx_win);
> >  
> > -	atomic_dec(&rxwin->num_txwins);
> > +	atomic_dec(&rxwin->pnv.num_txwins);
> >  }
> >  
> >  /*
> > @@ -591,7 +595,7 @@ static struct vas_window *get_user_rxwin(struct
> > vas_instance *vinst, u32 pswid)
> >  
> >  	rxwin = vinst->windows[winid];
> >  
> > -	if (!rxwin || rxwin->tx_win || rxwin->cop != VAS_COP_TYPE_FTW)
> > +	if (!rxwin || rxwin->pnv.tx_win || rxwin->cop !=
> > VAS_COP_TYPE_FTW)
> >  		return ERR_PTR(-EINVAL);
> >  
> >  	return rxwin;
> > @@ -616,7 +620,7 @@ static struct vas_window
> > *get_vinst_rxwin(struct vas_instance *vinst,
> >  		rxwin = vinst->rxwin[cop] ?: ERR_PTR(-EINVAL);
> >  
> >  	if (!IS_ERR(rxwin))
> > -		atomic_inc(&rxwin->num_txwins);
> > +		atomic_inc(&rxwin->pnv.num_txwins);
> >  
> >  	mutex_unlock(&vinst->mutex);
> >  
> > @@ -649,7 +653,7 @@ static void set_vinst_win(struct vas_instance
> > *vinst,
> >  	 * There should only be one receive window for a coprocessor
> > type
> >  	 * unless its a user (FTW) window.
> >  	 */
> > -	if (!window->user_win && !window->tx_win) {
> > +	if (!window->pnv.user_win && !window->pnv.tx_win) {
> >  		WARN_ON_ONCE(vinst->rxwin[window->cop]);
> >  		vinst->rxwin[window->cop] = window;
> >  	}
> > @@ -667,11 +671,11 @@ static void set_vinst_win(struct vas_instance
> > *vinst,
> >  static void clear_vinst_win(struct vas_window *window)
> >  {
> >  	int id = window->winid;
> > -	struct vas_instance *vinst = window->vinst;
> > +	struct vas_instance *vinst = window->pnv.vinst;
> >  
> >  	mutex_lock(&vinst->mutex);
> >  
> > -	if (!window->user_win && !window->tx_win) {
> > +	if (!window->pnv.user_win && !window->pnv.tx_win) {
> >  		WARN_ON_ONCE(!vinst->rxwin[window->cop]);
> >  		vinst->rxwin[window->cop] = NULL;
> >  	}
> > @@ -686,6 +690,8 @@ static void init_winctx_for_rxwin(struct
> > vas_window *rxwin,
> >  			struct vas_rx_win_attr *rxattr,
> >  			struct vas_winctx *winctx)
> >  {
> > +	struct vas_instance *vinst;
> > +
> >  	/*
> >  	 * We first zero (memset()) all fields and only set non-zero
> > fields.
> >  	 * Following fields are 0/false but maybe deserve a comment:
> > @@ -750,8 +756,9 @@ static void init_winctx_for_rxwin(struct
> > vas_window *rxwin,
> >  
> >  	winctx->min_scope = VAS_SCOPE_LOCAL;
> >  	winctx->max_scope = VAS_SCOPE_VECTORED_GROUP;
> > -	if (rxwin->vinst->virq)
> > -		winctx->irq_port = rxwin->vinst->irq_port;
> > +	vinst = rxwin->pnv.vinst;
> > +	if (vinst->virq)
> > +		winctx->irq_port = vinst->irq_port;
> >  }
> >  
> >  static bool rx_win_args_valid(enum vas_cop_type cop,
> > @@ -874,9 +881,9 @@ struct vas_window *vas_rx_win_open(int vasid,
> > enum vas_cop_type cop,
> >  		return rxwin;
> >  	}
> >  
> > -	rxwin->tx_win = false;
> > -	rxwin->nx_win = rxattr->nx_win;
> > -	rxwin->user_win = rxattr->user_win;
> > +	rxwin->pnv.tx_win = false;
> > +	rxwin->pnv.nx_win = rxattr->nx_win;
> > +	rxwin->pnv.user_win = rxattr->user_win;
> >  	rxwin->cop = cop;
> >  	rxwin->wcreds_max = rxattr->wcreds_max;
> >  
> > @@ -910,6 +917,8 @@ static void init_winctx_for_txwin(struct
> > vas_window *txwin,
> >  			struct vas_tx_win_attr *txattr,
> >  			struct vas_winctx *winctx)
> >  {
> > +	struct vas_instance *vinst = txwin->pnv.vinst;
> > +
> >  	/*
> >  	 * We first zero all fields and only set non-zero ones.
> > Following
> >  	 * are some fields set to 0/false for the stated reason:
> > @@ -930,7 +939,7 @@ static void init_winctx_for_txwin(struct
> > vas_window *txwin,
> >  	winctx->wcreds_max = txwin->wcreds_max;
> >  
> >  	winctx->user_win = txattr->user_win;
> > -	winctx->nx_win = txwin->rxwin->nx_win;
> > +	winctx->nx_win = txwin->pnv.rxwin->pnv.nx_win;
> >  	winctx->pin_win = txattr->pin_win;
> >  	winctx->rej_no_credit = txattr->rej_no_credit;
> >  	winctx->rsvd_txbuf_enable = txattr->rsvd_txbuf_enable;
> > @@ -947,23 +956,23 @@ static void init_winctx_for_txwin(struct
> > vas_window *txwin,
> >  
> >  	winctx->lpid = txattr->lpid;
> >  	winctx->pidr = txattr->pidr;
> > -	winctx->rx_win_id = txwin->rxwin->winid;
> > +	winctx->rx_win_id = txwin->pnv.rxwin->winid;
> >  	/*
> >  	 * IRQ and fault window setup is successful. Set fault window
> >  	 * for the send window so that ready to handle faults.
> >  	 */
> > -	if (txwin->vinst->virq)
> > -		winctx->fault_win_id = txwin->vinst->fault_win->winid;
> > +	if (vinst->virq)
> > +		winctx->fault_win_id = vinst->fault_win->winid;
> >  
> >  	winctx->dma_type = VAS_DMA_TYPE_INJECT;
> >  	winctx->tc_mode = txattr->tc_mode;
> >  	winctx->min_scope = VAS_SCOPE_LOCAL;
> >  	winctx->max_scope = VAS_SCOPE_VECTORED_GROUP;
> > -	if (txwin->vinst->virq)
> > -		winctx->irq_port = txwin->vinst->irq_port;
> > +	if (vinst->virq)
> > +		winctx->irq_port = vinst->irq_port;
> >  
> >  	winctx->pswid = txattr->pswid ? txattr->pswid :
> > -			encode_pswid(txwin->vinst->vas_id, txwin-
> > >winid);
> > +			encode_pswid(vinst->vas_id, txwin->winid);
> >  }
> >  
> >  static bool tx_win_args_valid(enum vas_cop_type cop,
> > @@ -1031,10 +1040,10 @@ struct vas_window *vas_tx_win_open(int
> > vasid, enum vas_cop_type cop,
> >  	}
> >  
> >  	txwin->cop = cop;
> > -	txwin->tx_win = 1;
> > -	txwin->rxwin = rxwin;
> > -	txwin->nx_win = txwin->rxwin->nx_win;
> > -	txwin->user_win = attr->user_win;
> > +	txwin->pnv.tx_win = 1;
> > +	txwin->pnv.rxwin = rxwin;
> > +	txwin->pnv.nx_win = txwin->pnv.rxwin->pnv.nx_win;
> > +	txwin->pnv.user_win = attr->user_win;
> >  	txwin->wcreds_max = attr->wcreds_max ?: VAS_WCREDS_DEFAULT;
> >  
> >  	init_winctx_for_txwin(txwin, attr, &winctx);
> > @@ -1049,10 +1058,10 @@ struct vas_window *vas_tx_win_open(int
> > vasid, enum vas_cop_type cop,
> >  	 * NOTE: If kernel ever resubmits a user CRB after handling a
> > page
> >  	 *	 fault, we will need to map this into kernel as well.
> >  	 */
> > -	if (!txwin->user_win) {
> > -		txwin->paste_kaddr = map_paste_region(txwin);
> > -		if (IS_ERR(txwin->paste_kaddr)) {
> > -			rc = PTR_ERR(txwin->paste_kaddr);
> > +	if (!txwin->pnv.user_win) {
> > +		txwin->pnv.paste_kaddr = map_paste_region(txwin);
> > +		if (IS_ERR(txwin->pnv.paste_kaddr)) {
> > +			rc = PTR_ERR(txwin->pnv.paste_kaddr);
> >  			goto free_window;
> >  		}
> >  	} else {
> > @@ -1104,9 +1113,9 @@ int vas_paste_crb(struct vas_window *txwin,
> > int offset, bool re)
> >  	 * report-enable flag is set for NX windows. Ensure software
> >  	 * complies too.
> >  	 */
> > -	WARN_ON_ONCE(txwin->nx_win && !re);
> > +	WARN_ON_ONCE(txwin->pnv.nx_win && !re);
> >  
> > -	addr = txwin->paste_kaddr;
> > +	addr = txwin->pnv.paste_kaddr;
> >  	if (re) {
> >  		/*
> >  		 * Set the REPORT_ENABLE bit (equivalent to writing
> > @@ -1153,7 +1162,7 @@ static void poll_window_credits(struct
> > vas_window *window)
> >  	int count = 0;
> >  
> >  	val = read_hvwc_reg(window, VREG(WINCTL));
> > -	if (window->tx_win)
> > +	if (window->pnv.tx_win)
> >  		mode = GET_FIELD(VAS_WINCTL_TX_WCRED_MODE, val);
> >  	else
> >  		mode = GET_FIELD(VAS_WINCTL_RX_WCRED_MODE, val);
> > @@ -1161,7 +1170,7 @@ static void poll_window_credits(struct
> > vas_window *window)
> >  	if (!mode)
> >  		return;
> >  retry:
> > -	if (window->tx_win) {
> > +	if (window->pnv.tx_win) {
> >  		val = read_hvwc_reg(window, VREG(TX_WCRED));
> >  		creds = GET_FIELD(VAS_TX_WCRED, val);
> >  	} else {
> > @@ -1277,7 +1286,7 @@ int vas_win_close(struct vas_window *window)
> >  	if (!window)
> >  		return 0;
> >  
> > -	if (!window->tx_win && atomic_read(&window->num_txwins) != 0) {
> > +	if (!window->pnv.tx_win && atomic_read(&window->pnv.num_txwins) 
> > != 0) {
> >  		pr_devel("Attempting to close an active Rx window!\n");
> >  		WARN_ON_ONCE(1);
> >  		return -EBUSY;
> > @@ -1296,11 +1305,11 @@ int vas_win_close(struct vas_window
> > *window)
> >  	poll_window_castout(window);
> >  
> >  	/* if send window, drop reference to matching receive window */
> > -	if (window->tx_win) {
> > -		if (window->user_win)
> > +	if (window->pnv.tx_win) {
> > +		if (window->pnv.user_win)
> >  			vas_drop_reference_pid_mm(&window->task_ref);
> >  
> > -		put_rx_win(window->rxwin);
> > +		put_rx_win(window->pnv.rxwin);
> >  	}
> >  
> >  	vas_window_free(window);
> > @@ -1384,12 +1393,12 @@ struct vas_window
> > *vas_pswid_to_window(struct vas_instance *vinst,
> >  	 * since their CRBs are ignored (not queued on FIFO or
> > processed
> >  	 * by NX).
> >  	 */
> > -	if (!window->tx_win || !window->user_win || !window->nx_win ||
> > -			window->cop == VAS_COP_TYPE_FAULT ||
> > -			window->cop == VAS_COP_TYPE_FTW) {
> > +	if (!window->pnv.tx_win || !window->pnv.user_win ||
> > +		!window->pnv.nx_win || window->cop ==
> > VAS_COP_TYPE_FAULT ||
> > +		window->cop == VAS_COP_TYPE_FTW) {
> >  		pr_err("PSWID decode: id %d, tx %d, user %d, nx %d, cop
> > %d\n",
> > -			winid, window->tx_win, window->user_win,
> > -			window->nx_win, window->cop);
> > +			winid, window->pnv.tx_win, window-
> > >pnv.user_win,
> > +			window->pnv.nx_win, window->cop);
> >  		WARN_ON(1);
> >  	}
> >  
> > diff --git a/arch/powerpc/platforms/powernv/vas.h
> > b/arch/powerpc/platforms/powernv/vas.h
> > index f354dd5c51bd..f2d9daff3d82 100644
> > --- a/arch/powerpc/platforms/powernv/vas.h
> > +++ b/arch/powerpc/platforms/powernv/vas.h
> > @@ -345,34 +345,6 @@ struct vas_instance {
> >  	struct dentry *dbgdir;
> >  };
> >  
> > -/*
> > - * In-kernel state a VAS window. One per window.
> > - */
> > -struct vas_window {
> > -	/* Fields common to send and receive windows */
> > -	struct vas_instance *vinst;
> > -	int winid;
> > -	bool tx_win;		/* True if send window */
> > -	bool nx_win;		/* True if NX window */
> > -	bool user_win;		/* True if user space window */
> > -	void *hvwc_map;		/* HV window context */
> > -	void *uwc_map;		/* OS/User window context */
> > -	int wcreds_max;		/* Window credits */
> > -
> > -	struct vas_user_win_ref task_ref;
> > -	char *dbgname;
> > -	struct dentry *dbgdir;
> > -
> > -	/* Fields applicable only to send windows */
> > -	void *paste_kaddr;
> > -	char *paste_addr_name;
> > -	struct vas_window *rxwin;
> > -
> > -	/* Feilds applicable only to receive windows */
> > -	enum vas_cop_type cop;
> > -	atomic_t num_txwins;
> > -};
> > -
> >  /*
> >   * Container for the hardware state of a window. One per-window.
> >   *
> > @@ -449,8 +421,8 @@ static inline void vas_log_write(struct
> > vas_window *win, char *name,
> >  {
> >  	if (val)
> >  		pr_debug("%swin #%d: %s reg %p, val 0x%016llx\n",
> > -				win->tx_win ? "Tx" : "Rx", win->winid,
> > name,
> > -				regptr, val);
> > +				win->pnv.tx_win ? "Tx" : "Rx", win-
> > >winid,
> > +				name, regptr, val);
> >  }
> >  
> >  static inline void write_uwc_reg(struct vas_window *win, char
> > *name,
> > @@ -458,7 +430,7 @@ static inline void write_uwc_reg(struct
> > vas_window *win, char *name,
> >  {
> >  	void *regptr;
> >  
> > -	regptr = win->uwc_map + reg;
> > +	regptr = win->pnv.uwc_map + reg;
> >  	vas_log_write(win, name, regptr, val);
> >  
> >  	out_be64(regptr, val);
> > @@ -469,7 +441,7 @@ static inline void write_hvwc_reg(struct
> > vas_window *win, char *name,
> >  {
> >  	void *regptr;
> >  
> > -	regptr = win->hvwc_map + reg;
> > +	regptr = win->pnv.hvwc_map + reg;
> >  	vas_log_write(win, name, regptr, val);
> >  
> >  	out_be64(regptr, val);
> > @@ -478,7 +450,7 @@ static inline void write_hvwc_reg(struct
> > vas_window *win, char *name,
> >  static inline u64 read_hvwc_reg(struct vas_window *win,
> >  			char *name __maybe_unused, s32 reg)
> >  {
> > -	return in_be64(win->hvwc_map+reg);
> > +	return in_be64(win->pnv.hvwc_map + reg);
> >  }
> >  
> >  /*
> > -- 
> > 2.18.2
> > 
> > 
> > 

