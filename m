Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9229339B860
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 13:53:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxLk80Gr7z30DB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 21:53:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OifnCyeN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OifnCyeN; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxLjb0bCQz2yxS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 21:52:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FxLjR6bpDz9sSn;
 Fri,  4 Jun 2021 21:52:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622807549;
 bh=+42qJq4auXDoRIn7wNHqlDcQchXcXB42+N7I7kfINZU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OifnCyeNE4xTpSz4jzNB5G/TEsum4ZuIcA8mUQ9hs9YEYDFPMoSrsZASEN/4VQzRy
 LAKe1R/uLRjhOq2nTTymbtOn5lgZUdtn+iXfKGZArK/o/eqwgLICXm9p5aOYZWyBJX
 pyDkCtkANQ7WSd7ePlB7hhRWgQFjENGevfQ2qjY77s45WSqrBjiSrstuNS5EXaGMO3
 nNcDlw/ZASoED51jv1MtcT0M+nrJE6U0aPqAMu5sQlMSF8dFW8JPpytH39/3OoVV2v
 949ZjrYiuZaFw2eK+enLBqf6G+qxO4iQoJmjP/yZpiT6GwNNZRY0/VhCXMP26LJEM5
 eZL324MaHb/EQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 06/16] powerpc/vas:  Define and use common vas_window
 struct
In-Reply-To: <d4505652d8e5355075e3bb2436b1dcd243c64e10.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <6ba07d742db8db2666f4972f02467cc2c6b789ad.camel@linux.ibm.com>
 <1622694591.mzoa5k71xz.astroid@bobo.none>
 <d4505652d8e5355075e3bb2436b1dcd243c64e10.camel@linux.ibm.com>
Date: Fri, 04 Jun 2021 21:52:22 +1000
Message-ID: <87r1hhg83t.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Haren Myneni <haren@linux.ibm.com> writes:
> On Thu, 2021-06-03 at 14:38 +1000, Nicholas Piggin wrote:
>> Excerpts from Haren Myneni's message of May 21, 2021 7:33 pm:
>> > Same vas_window struct is used on powerNV and pseries. So this
>> > patch
>> > changes in struct vas_window to support both platforms and also the
>> > corresponding modifications in powerNV vas code.
>> > 
>> > On powerNV, vas_window is used for both TX and RX windows, whereas
>> > only for TX windows on powerVM. So some elements are specific to
>> > these platforms.
>> > 
>> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> > ---
>> >  arch/powerpc/include/asm/vas.h              |  50 +++++++-
>> >  arch/powerpc/platforms/powernv/vas-debug.c  |  12 +-
>> >  arch/powerpc/platforms/powernv/vas-fault.c  |   4 +-
>> >  arch/powerpc/platforms/powernv/vas-trace.h  |   6 +-
>> >  arch/powerpc/platforms/powernv/vas-window.c | 129 +++++++++++-----
>> > ----
>> >  arch/powerpc/platforms/powernv/vas.h        |  38 +-----
>> >  6 files changed, 135 insertions(+), 104 deletions(-)
>> > 
>> > diff --git a/arch/powerpc/include/asm/vas.h
>> > b/arch/powerpc/include/asm/vas.h
>> > index 2c1040f399d9..49bfb5be896d 100644
>> > --- a/arch/powerpc/include/asm/vas.h
>> > +++ b/arch/powerpc/include/asm/vas.h
>> > @@ -10,8 +10,6 @@
>> >  #include <asm/icswx.h>
>> >  #include <uapi/asm/vas-api.h>
>> >  
>> > -struct vas_window;
>> > -
>> >  /*
>> >   * Min and max FIFO sizes are based on Version 1.05 Section
>> > 3.1.4.25
>> >   * (Local FIFO Size Register) of the VAS workbook.
>> > @@ -63,6 +61,54 @@ struct vas_user_win_ref {
>> >  	struct mm_struct *mm;	/* Linux process mm_struct */
>> >  };
>> >  
>> > +/*
>> > + * In-kernel state a VAS window. One per window.
>> > + * powerVM: Used only for Tx windows.
>> > + * powerNV: Used for both Tx and Rx windows.
>> > + */
>> > +struct vas_window {
>> > +	u32 winid;
>> > +	u32 wcreds_max;	/* Window credits */
>> > +	enum vas_cop_type cop;
>> > +	struct vas_user_win_ref task_ref;
>> > +	char *dbgname;
>> > +	struct dentry *dbgdir;
>> > +	union {
>> > +		/* powerNV specific data */
>> > +		struct {
>> > +			void *vinst;	/* points to VAS instance
>> > */
>> > +			bool tx_win;	/* True if send window */
>> > +			bool nx_win;	/* True if NX window */
>> > +			bool user_win;	/* True if user space
>> > window */
>> > +			void *hvwc_map;	/* HV window context */
>> > +			void *uwc_map;	/* OS/User window context
>> > */
>> > +
>> > +			/* Fields applicable only to send windows */
>> > +			void *paste_kaddr;
>> > +			char *paste_addr_name;
>> > +			struct vas_window *rxwin;
>> > +
>> > +			atomic_t num_txwins;	/* Only for receive
>> > windows */
>> > +		} pnv;
>> > +		struct {
>> > +			u64 win_addr;	/* Physical paste address
>> > */
>> > +			u8 win_type;	/* QoS or Default window */
>> > +			u8 status;
>> > +			u32 complete_irq;	/* Completion interrupt */
>> > +			u32 fault_irq;	/* Fault interrupt */
>> > +			u64 domain[6];	/* Associativity domain Ids
>> > */
>> > +					/* this window is allocated */
>> > +			u64 util;
>> > +
>> > +			/* List of windows opened which is used for LPM
>> > */
>> > +			struct list_head win_list;
>> > +			u64 flags;
>> > +			char *name;
>> > +			int fault_virq;
>> > +		} lpar;
>> > +	};
>> > +};
>> 
>> The more typical way to do code like this is have the common bit as
>> its own struct, and then have the users embed it into their own structs.
>> 
>> 
>> struct vas_window {
>> 	u32 winid;
>> 	u32 wcreds_max;	/* Window credits */
>> 	enum vas_cop_type cop;
>> 	struct vas_user_win_ref task_ref;
>> 	char *dbgname;
>> 	struct dentry *dbgdir;
>> };
>> 
>> struct pnv_vas_window {
>> 	struct vas_window vas_window;
>> 
>> 	void *vinst;	/* points to VAS instance */
>> 	bool tx_win;	/* True if send window */
>> 	bool nx_win;	/* True if NX window */
>> 	bool user_win;	/* True if user space window */
>> 	void *hvwc_map;	/* HV window context */
>> 	void *uwc_map;	/* OS/User window context */
>> 
>> 	/* Fields applicable only to send windows */
>> 	void *paste_kaddr;
>> 	char *paste_addr_name;
>> 	struct vas_window *rxwin;
>> 
>> 	atomic_t num_txwins;	/* Only for receive windows */
>> };
>> 
>> Which helps reusability / avoids churn (don't have to update the
>> same 
>> structure to add new functionality), slightly helps naming and union 
>> size mismatches, helps with type checking, etc.
>> 
>> Maybe not a great benefit for your code as is which may not grow more
>> users, but unless there are some good reasons for the unions I would 
>> really consider changing to this style.
>
> Defined platform specific data as union for the following reasons:
> - vas_window address is saved for each file descriptor
> (fp-private_data). If we define separate structs for PowerNV and
> PowerVM, 'struct vas_window' has to be the first element which can add
> confusion.

I don't follow.

I think what you're saying is you want to return a struct vas_window *
to the drive code, ie. you don't want the driver code to know if it's a
pnv window or a pseries one.

ie. you get a vas_window in open and stash it in fp->private_data:

static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
{
	...
	struct coproc_instance *cp_inst;
	struct vas_window *txwin;
	int rc;

	cp_inst = fp->private_data;

	...
	txwin = cp_inst->coproc->vops->open_win(&uattr, cp_inst->coproc->cop_type);
	...
	cp_inst->txwin = txwin;

	return 0;
}

And then you want to pass it back to the backend (powernv/pseries) code
in eg. mmap:

static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
{
	struct coproc_instance *cp_inst = fp->private_data;
	struct vas_window *txwin;
        ...

	txwin = cp_inst->txwin;

	...
	paste_addr = cp_inst->coproc->vops->paste_addr(txwin);


But that can work perfectly fine with Nick's suggestion. You just pass
the vas_window * in and out and the backend code is responsible for
using container_of() to get access to its backend-specific struct.

eg. for powernv it would be something like:

static u64 vas_user_win_paste_addr(struct vas_window *win)
{
	struct pnv_vas_window *pnv_win;
	u64 paste_addr;

	pnv_win = container_of(win, struct pnv_vas_window, vas_window);

	vas_win_paste_addr(pnv_win, &paste_addr, NULL);

	return paste_addr;
}


Another advantage which I don't think Nick mentioned is that you can
have the powernv specific parts private to the powernv code, and
similarly for pseries.

cheers
