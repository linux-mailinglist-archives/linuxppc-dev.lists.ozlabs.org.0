Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F90399938
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 06:38:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwY7M1X9lz309F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 14:38:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JlXJNXqw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JlXJNXqw; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwY6q534Cz2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 14:38:10 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso2751138pjz.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 21:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Yrm3mjB8ZTZK3MsFqf/EWgctn1OH7AOfgqFWLFd/xIc=;
 b=JlXJNXqwI2w619gxkpsCSIr0KewrZTnHZ/FD+dSa1v7QH76TnOLIV5c+97tWzpJ6bZ
 tRVsG1UAesUDfW/WPzwzjKdHDpHaLz2bOdJCAeEzjMzJj3ofLCcYYipmpfJ4wuVEMQ2p
 xoTHhGr+XjD6uhf/raQ8Kx0scmMDFvwbTpQwDjqWRtkR0X+rnuwLN4rDSTjTe3w+dlv/
 SxLyXGsAOgGeGPEL0B1GLp6I/LtNcz3Ft0DDB9ZolKsRFB7zR0IAc3lGxUYGHf8PQdBY
 vVzfawg3fJoVix/OTQNXkGjn+eBH50/VPejGS0AUjwptB3ggQ0UWi8z3RLOnLkQ8M7GA
 FRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Yrm3mjB8ZTZK3MsFqf/EWgctn1OH7AOfgqFWLFd/xIc=;
 b=JF13wVm0i5Cy9pNYR+bt1GVjTLD4Lx23YycmNY5j8yN/QRjWIJrFYx+hv1Iw/nKHCm
 /TTBfgIC5+BZfJ0AwJJYDIrfI+UKREpezraNDSfG6mk7+BlPMkysVW7g/V1KIAFF3nNe
 fTXGS8gQxEP0aljIAFHPpScSUy7i4VofwFIUPTipu7Z1G3cJbVsN6l8yeLGqb5XMrVr0
 rywwU6Qs/5yuw0WY5h7NFyDYRoMZbf80x+zv9XZlJT0c5Wvf0UzGjygbKilYce/qJ3lA
 2TEWaHxGEF/cgPOrbyB+VDMMhyNpv4j7os9eaIp65oH1Cruh2mJhRPXUfmk4GwxqZkYT
 rzMw==
X-Gm-Message-State: AOAM531wlkeHrjNIujPXG6/mmuSK5Hks3U/APj/gTL7doiFn3E6T3JXi
 vRF7+vXjcGoWb+XQBVSUYzc=
X-Google-Smtp-Source: ABdhPJy49uYg+W/sDZY7uQ7d1jRZUqnvnle9h6UUi6GWac9uj0b0YtQRvj8J4/HofkRQD/s/J6jhXw==
X-Received: by 2002:a17:90a:b28d:: with SMTP id
 c13mr8998250pjr.80.1622695086779; 
 Wed, 02 Jun 2021 21:38:06 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id 18sm988153pfx.71.2021.06.02.21.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 21:38:06 -0700 (PDT)
Date: Thu, 03 Jun 2021 14:38:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 06/16] powerpc/vas:  Define and use common vas_window
 struct
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <6ba07d742db8db2666f4972f02467cc2c6b789ad.camel@linux.ibm.com>
In-Reply-To: <6ba07d742db8db2666f4972f02467cc2c6b789ad.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1622694591.mzoa5k71xz.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from Haren Myneni's message of May 21, 2021 7:33 pm:
>=20
> Same vas_window struct is used on powerNV and pseries. So this patch
> changes in struct vas_window to support both platforms and also the
> corresponding modifications in powerNV vas code.
>=20
> On powerNV, vas_window is used for both TX and RX windows, whereas
> only for TX windows on powerVM. So some elements are specific to
> these platforms.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h              |  50 +++++++-
>  arch/powerpc/platforms/powernv/vas-debug.c  |  12 +-
>  arch/powerpc/platforms/powernv/vas-fault.c  |   4 +-
>  arch/powerpc/platforms/powernv/vas-trace.h  |   6 +-
>  arch/powerpc/platforms/powernv/vas-window.c | 129 +++++++++++---------
>  arch/powerpc/platforms/powernv/vas.h        |  38 +-----
>  6 files changed, 135 insertions(+), 104 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 2c1040f399d9..49bfb5be896d 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -10,8 +10,6 @@
>  #include <asm/icswx.h>
>  #include <uapi/asm/vas-api.h>
> =20
> -struct vas_window;
> -
>  /*
>   * Min and max FIFO sizes are based on Version 1.05 Section 3.1.4.25
>   * (Local FIFO Size Register) of the VAS workbook.
> @@ -63,6 +61,54 @@ struct vas_user_win_ref {
>  	struct mm_struct *mm;	/* Linux process mm_struct */
>  };
> =20
> +/*
> + * In-kernel state a VAS window. One per window.
> + * powerVM: Used only for Tx windows.
> + * powerNV: Used for both Tx and Rx windows.
> + */
> +struct vas_window {
> +	u32 winid;
> +	u32 wcreds_max;	/* Window credits */
> +	enum vas_cop_type cop;
> +	struct vas_user_win_ref task_ref;
> +	char *dbgname;
> +	struct dentry *dbgdir;
> +	union {
> +		/* powerNV specific data */
> +		struct {
> +			void *vinst;	/* points to VAS instance */
> +			bool tx_win;	/* True if send window */
> +			bool nx_win;	/* True if NX window */
> +			bool user_win;	/* True if user space window */
> +			void *hvwc_map;	/* HV window context */
> +			void *uwc_map;	/* OS/User window context */
> +
> +			/* Fields applicable only to send windows */
> +			void *paste_kaddr;
> +			char *paste_addr_name;
> +			struct vas_window *rxwin;
> +
> +			atomic_t num_txwins;	/* Only for receive windows */
> +		} pnv;
> +		struct {
> +			u64 win_addr;	/* Physical paste address */
> +			u8 win_type;	/* QoS or Default window */
> +			u8 status;
> +			u32 complete_irq;	/* Completion interrupt */
> +			u32 fault_irq;	/* Fault interrupt */
> +			u64 domain[6];	/* Associativity domain Ids */
> +					/* this window is allocated */
> +			u64 util;
> +
> +			/* List of windows opened which is used for LPM */
> +			struct list_head win_list;
> +			u64 flags;
> +			char *name;
> +			int fault_virq;
> +		} lpar;
> +	};
> +};

The more typical way to do code like this is have the common bit as its=20
own struct, and then have the users embed it into their own structs.


struct vas_window {
	u32 winid;
	u32 wcreds_max;	/* Window credits */
	enum vas_cop_type cop;
	struct vas_user_win_ref task_ref;
	char *dbgname;
	struct dentry *dbgdir;
};

struct pnv_vas_window {
	struct vas_window vas_window;

	void *vinst;	/* points to VAS instance */
	bool tx_win;	/* True if send window */
	bool nx_win;	/* True if NX window */
	bool user_win;	/* True if user space window */
	void *hvwc_map;	/* HV window context */
	void *uwc_map;	/* OS/User window context */

	/* Fields applicable only to send windows */
	void *paste_kaddr;
	char *paste_addr_name;
	struct vas_window *rxwin;

	atomic_t num_txwins;	/* Only for receive windows */
};

Which helps reusability / avoids churn (don't have to update the same=20
structure to add new functionality), slightly helps naming and union=20
size mismatches, helps with type checking, etc.

Maybe not a great benefit for your code as is which may not grow more
users, but unless there are some good reasons for the unions I would=20
really consider changing to this style.

Thanks,
Nick

> +		struct {
> +			u64 win_addr;	/* Physical paste address */
> +			u8 win_type;	/* QoS or Default window */
> +			u8 status;
> +			u32 complete_irq;	/* Completion interrupt */
> +			u32 fault_irq;	/* Fault interrupt */
> +			u64 domain[6];	/* Associativity domain Ids */
> +					/* this window is allocated */
> +			u64 util;
> +
> +			/* List of windows opened which is used for LPM */
> +			struct list_head win_list;
> +			u64 flags;
> +			char *name;
> +			int fault_virq;
> +		} lpar;
> +	};
> +};

> +
>  /*
>   * User space window operations used for powernv and powerVM
>   */
> diff --git a/arch/powerpc/platforms/powernv/vas-debug.c b/arch/powerpc/pl=
atforms/powernv/vas-debug.c
> index 41fa90d2f4ab..80f735449ab8 100644
> --- a/arch/powerpc/platforms/powernv/vas-debug.c
> +++ b/arch/powerpc/platforms/powernv/vas-debug.c
> @@ -9,6 +9,7 @@
>  #include <linux/slab.h>
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
> +#include <asm/vas.h>
>  #include "vas.h"
> =20
>  static struct dentry *vas_debugfs;
> @@ -33,11 +34,11 @@ static int info_show(struct seq_file *s, void *privat=
e)
>  	mutex_lock(&vas_mutex);
> =20
>  	/* ensure window is not unmapped */
> -	if (!window->hvwc_map)
> +	if (!window->pnv.hvwc_map)
>  		goto unlock;
> =20
>  	seq_printf(s, "Type: %s, %s\n", cop_to_str(window->cop),
> -					window->tx_win ? "Send" : "Receive");
> +				window->pnv.tx_win ? "Send" : "Receive");
>  	seq_printf(s, "Pid : %d\n", vas_window_pid(window));
> =20
>  unlock:
> @@ -60,7 +61,7 @@ static int hvwc_show(struct seq_file *s, void *private)
>  	mutex_lock(&vas_mutex);
> =20
>  	/* ensure window is not unmapped */
> -	if (!window->hvwc_map)
> +	if (!window->pnv.hvwc_map)
>  		goto unlock;
> =20
>  	print_reg(s, window, VREG(LPID));
> @@ -115,9 +116,10 @@ void vas_window_free_dbgdir(struct vas_window *windo=
w)
> =20
>  void vas_window_init_dbgdir(struct vas_window *window)
>  {
> +	struct vas_instance *vinst =3D window->pnv.vinst;
>  	struct dentry *d;
> =20
> -	if (!window->vinst->dbgdir)
> +	if (!vinst->dbgdir)
>  		return;
> =20
>  	window->dbgname =3D kzalloc(16, GFP_KERNEL);
> @@ -126,7 +128,7 @@ void vas_window_init_dbgdir(struct vas_window *window=
)
> =20
>  	snprintf(window->dbgname, 16, "w%d", window->winid);
> =20
> -	d =3D debugfs_create_dir(window->dbgname, window->vinst->dbgdir);
> +	d =3D debugfs_create_dir(window->dbgname, vinst->dbgdir);
>  	window->dbgdir =3D d;
> =20
>  	debugfs_create_file("info", 0444, d, window, &info_fops);
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/pl=
atforms/powernv/vas-fault.c
> index 2729ac541fb3..faaf5b110645 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -152,10 +152,10 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data=
)
>  			/*
>  			 * NX sees faults only with user space windows.
>  			 */
> -			if (window->user_win)
> +			if (window->pnv.user_win)
>  				vas_update_csb(crb, &window->task_ref);
>  			else
> -				WARN_ON_ONCE(!window->user_win);
> +				WARN_ON_ONCE(!window->pnv.user_win);
> =20
>  			/*
>  			 * Return credit for send window after processing
> diff --git a/arch/powerpc/platforms/powernv/vas-trace.h b/arch/powerpc/pl=
atforms/powernv/vas-trace.h
> index a449b9f0c12e..843aae37c07a 100644
> --- a/arch/powerpc/platforms/powernv/vas-trace.h
> +++ b/arch/powerpc/platforms/powernv/vas-trace.h
> @@ -95,9 +95,11 @@ TRACE_EVENT(	vas_paste_crb,
> =20
>  		TP_fast_assign(
>  			__entry->pid =3D tsk->pid;
> -			__entry->vasid =3D win->vinst->vas_id;
> +			__entry->vasid =3D
> +				((struct vas_instance *)win->pnv.vinst)->vas_id;
>  			__entry->winid =3D win->winid;
> -			__entry->paste_kaddr =3D (unsigned long)win->paste_kaddr
> +			__entry->paste_kaddr =3D
> +				(unsigned long)win->pnv.paste_kaddr;
>  		),
> =20
>  		TP_printk("pid=3D%d, vasid=3D%d, winid=3D%d, paste_kaddr=3D0x%016lx\n"=
,
> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/p=
latforms/powernv/vas-window.c
> index ffd619e5a218..6ce8ee4b3371 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -31,9 +31,10 @@ void vas_win_paste_addr(struct vas_window *window, u64=
 *addr, int *len)
>  {
>  	int winid;
>  	u64 base, shift;
> +	struct vas_instance *vinst =3D window->pnv.vinst;
> =20
> -	base =3D window->vinst->paste_base_addr;
> -	shift =3D window->vinst->paste_win_id_shift;
> +	base =3D vinst->paste_base_addr;
> +	shift =3D vinst->paste_win_id_shift;
>  	winid =3D window->winid;
> =20
>  	*addr  =3D base + (winid << shift);
> @@ -46,9 +47,10 @@ void vas_win_paste_addr(struct vas_window *window, u64=
 *addr, int *len)
>  static inline void get_hvwc_mmio_bar(struct vas_window *window,
>  			u64 *start, int *len)
>  {
> +	struct vas_instance *vinst =3D window->pnv.vinst;
>  	u64 pbaddr;
> =20
> -	pbaddr =3D window->vinst->hvwc_bar_start;
> +	pbaddr =3D vinst->hvwc_bar_start;
>  	*start =3D pbaddr + window->winid * VAS_HVWC_SIZE;
>  	*len =3D VAS_HVWC_SIZE;
>  }
> @@ -56,9 +58,10 @@ static inline void get_hvwc_mmio_bar(struct vas_window=
 *window,
>  static inline void get_uwc_mmio_bar(struct vas_window *window,
>  			u64 *start, int *len)
>  {
> +	struct vas_instance *vinst =3D window->pnv.vinst;
>  	u64 pbaddr;
> =20
> -	pbaddr =3D window->vinst->uwc_bar_start;
> +	pbaddr =3D vinst->uwc_bar_start;
>  	*start =3D pbaddr + window->winid * VAS_UWC_SIZE;
>  	*len =3D VAS_UWC_SIZE;
>  }
> @@ -74,13 +77,14 @@ static void *map_paste_region(struct vas_window *txwi=
n)
>  	void *map;
>  	char *name;
>  	u64 start;
> +	struct vas_instance *vinst =3D txwin->pnv.vinst;
> =20
> -	name =3D kasprintf(GFP_KERNEL, "window-v%d-w%d", txwin->vinst->vas_id,
> +	name =3D kasprintf(GFP_KERNEL, "window-v%d-w%d", vinst->vas_id,
>  				txwin->winid);
>  	if (!name)
>  		goto free_name;
> =20
> -	txwin->paste_addr_name =3D name;
> +	txwin->pnv.paste_addr_name =3D name;
>  	vas_win_paste_addr(txwin, &start, &len);
> =20
>  	if (!request_mem_region(start, len, name)) {
> @@ -138,12 +142,12 @@ static void unmap_paste_region(struct vas_window *w=
indow)
>  	int len;
>  	u64 busaddr_start;
> =20
> -	if (window->paste_kaddr) {
> +	if (window->pnv.paste_kaddr) {
>  		vas_win_paste_addr(window, &busaddr_start, &len);
> -		unmap_region(window->paste_kaddr, busaddr_start, len);
> -		window->paste_kaddr =3D NULL;
> -		kfree(window->paste_addr_name);
> -		window->paste_addr_name =3D NULL;
> +		unmap_region(window->pnv.paste_kaddr, busaddr_start, len);
> +		window->pnv.paste_kaddr =3D NULL;
> +		kfree(window->pnv.paste_addr_name);
> +		window->pnv.paste_addr_name =3D NULL;
>  	}
>  }
> =20
> @@ -163,11 +167,11 @@ static void unmap_winctx_mmio_bars(struct vas_windo=
w *window)
> =20
>  	mutex_lock(&vas_mutex);
> =20
> -	hvwc_map =3D window->hvwc_map;
> -	window->hvwc_map =3D NULL;
> +	hvwc_map =3D window->pnv.hvwc_map;
> +	window->pnv.hvwc_map =3D NULL;
> =20
> -	uwc_map =3D window->uwc_map;
> -	window->uwc_map =3D NULL;
> +	uwc_map =3D window->pnv.uwc_map;
> +	window->pnv.uwc_map =3D NULL;
> =20
>  	mutex_unlock(&vas_mutex);
> =20
> @@ -193,12 +197,12 @@ static int map_winctx_mmio_bars(struct vas_window *=
window)
>  	u64 start;
> =20
>  	get_hvwc_mmio_bar(window, &start, &len);
> -	window->hvwc_map =3D map_mmio_region("HVWCM_Window", start, len);
> +	window->pnv.hvwc_map =3D map_mmio_region("HVWCM_Window", start, len);
> =20
>  	get_uwc_mmio_bar(window, &start, &len);
> -	window->uwc_map =3D map_mmio_region("UWCM_Window", start, len);
> +	window->pnv.uwc_map =3D map_mmio_region("UWCM_Window", start, len);
> =20
> -	if (!window->hvwc_map || !window->uwc_map) {
> +	if (!window->pnv.hvwc_map || !window->pnv.uwc_map) {
>  		unmap_winctx_mmio_bars(window);
>  		return -1;
>  	}
> @@ -523,7 +527,7 @@ static int vas_assign_window_id(struct ida *ida)
>  static void vas_window_free(struct vas_window *window)
>  {
>  	int winid =3D window->winid;
> -	struct vas_instance *vinst =3D window->vinst;
> +	struct vas_instance *vinst =3D window->pnv.vinst;
> =20
>  	unmap_winctx_mmio_bars(window);
> =20
> @@ -547,7 +551,7 @@ static struct vas_window *vas_window_alloc(struct vas=
_instance *vinst)
>  	if (!window)
>  		goto out_free;
> =20
> -	window->vinst =3D vinst;
> +	window->pnv.vinst =3D vinst;
>  	window->winid =3D winid;
> =20
>  	if (map_winctx_mmio_bars(window))
> @@ -566,9 +570,9 @@ static struct vas_window *vas_window_alloc(struct vas=
_instance *vinst)
>  static void put_rx_win(struct vas_window *rxwin)
>  {
>  	/* Better not be a send window! */
> -	WARN_ON_ONCE(rxwin->tx_win);
> +	WARN_ON_ONCE(rxwin->pnv.tx_win);
> =20
> -	atomic_dec(&rxwin->num_txwins);
> +	atomic_dec(&rxwin->pnv.num_txwins);
>  }
> =20
>  /*
> @@ -591,7 +595,7 @@ static struct vas_window *get_user_rxwin(struct vas_i=
nstance *vinst, u32 pswid)
> =20
>  	rxwin =3D vinst->windows[winid];
> =20
> -	if (!rxwin || rxwin->tx_win || rxwin->cop !=3D VAS_COP_TYPE_FTW)
> +	if (!rxwin || rxwin->pnv.tx_win || rxwin->cop !=3D VAS_COP_TYPE_FTW)
>  		return ERR_PTR(-EINVAL);
> =20
>  	return rxwin;
> @@ -616,7 +620,7 @@ static struct vas_window *get_vinst_rxwin(struct vas_=
instance *vinst,
>  		rxwin =3D vinst->rxwin[cop] ?: ERR_PTR(-EINVAL);
> =20
>  	if (!IS_ERR(rxwin))
> -		atomic_inc(&rxwin->num_txwins);
> +		atomic_inc(&rxwin->pnv.num_txwins);
> =20
>  	mutex_unlock(&vinst->mutex);
> =20
> @@ -649,7 +653,7 @@ static void set_vinst_win(struct vas_instance *vinst,
>  	 * There should only be one receive window for a coprocessor type
>  	 * unless its a user (FTW) window.
>  	 */
> -	if (!window->user_win && !window->tx_win) {
> +	if (!window->pnv.user_win && !window->pnv.tx_win) {
>  		WARN_ON_ONCE(vinst->rxwin[window->cop]);
>  		vinst->rxwin[window->cop] =3D window;
>  	}
> @@ -667,11 +671,11 @@ static void set_vinst_win(struct vas_instance *vins=
t,
>  static void clear_vinst_win(struct vas_window *window)
>  {
>  	int id =3D window->winid;
> -	struct vas_instance *vinst =3D window->vinst;
> +	struct vas_instance *vinst =3D window->pnv.vinst;
> =20
>  	mutex_lock(&vinst->mutex);
> =20
> -	if (!window->user_win && !window->tx_win) {
> +	if (!window->pnv.user_win && !window->pnv.tx_win) {
>  		WARN_ON_ONCE(!vinst->rxwin[window->cop]);
>  		vinst->rxwin[window->cop] =3D NULL;
>  	}
> @@ -686,6 +690,8 @@ static void init_winctx_for_rxwin(struct vas_window *=
rxwin,
>  			struct vas_rx_win_attr *rxattr,
>  			struct vas_winctx *winctx)
>  {
> +	struct vas_instance *vinst;
> +
>  	/*
>  	 * We first zero (memset()) all fields and only set non-zero fields.
>  	 * Following fields are 0/false but maybe deserve a comment:
> @@ -750,8 +756,9 @@ static void init_winctx_for_rxwin(struct vas_window *=
rxwin,
> =20
>  	winctx->min_scope =3D VAS_SCOPE_LOCAL;
>  	winctx->max_scope =3D VAS_SCOPE_VECTORED_GROUP;
> -	if (rxwin->vinst->virq)
> -		winctx->irq_port =3D rxwin->vinst->irq_port;
> +	vinst =3D rxwin->pnv.vinst;
> +	if (vinst->virq)
> +		winctx->irq_port =3D vinst->irq_port;
>  }
> =20
>  static bool rx_win_args_valid(enum vas_cop_type cop,
> @@ -874,9 +881,9 @@ struct vas_window *vas_rx_win_open(int vasid, enum va=
s_cop_type cop,
>  		return rxwin;
>  	}
> =20
> -	rxwin->tx_win =3D false;
> -	rxwin->nx_win =3D rxattr->nx_win;
> -	rxwin->user_win =3D rxattr->user_win;
> +	rxwin->pnv.tx_win =3D false;
> +	rxwin->pnv.nx_win =3D rxattr->nx_win;
> +	rxwin->pnv.user_win =3D rxattr->user_win;
>  	rxwin->cop =3D cop;
>  	rxwin->wcreds_max =3D rxattr->wcreds_max;
> =20
> @@ -910,6 +917,8 @@ static void init_winctx_for_txwin(struct vas_window *=
txwin,
>  			struct vas_tx_win_attr *txattr,
>  			struct vas_winctx *winctx)
>  {
> +	struct vas_instance *vinst =3D txwin->pnv.vinst;
> +
>  	/*
>  	 * We first zero all fields and only set non-zero ones. Following
>  	 * are some fields set to 0/false for the stated reason:
> @@ -930,7 +939,7 @@ static void init_winctx_for_txwin(struct vas_window *=
txwin,
>  	winctx->wcreds_max =3D txwin->wcreds_max;
> =20
>  	winctx->user_win =3D txattr->user_win;
> -	winctx->nx_win =3D txwin->rxwin->nx_win;
> +	winctx->nx_win =3D txwin->pnv.rxwin->pnv.nx_win;
>  	winctx->pin_win =3D txattr->pin_win;
>  	winctx->rej_no_credit =3D txattr->rej_no_credit;
>  	winctx->rsvd_txbuf_enable =3D txattr->rsvd_txbuf_enable;
> @@ -947,23 +956,23 @@ static void init_winctx_for_txwin(struct vas_window=
 *txwin,
> =20
>  	winctx->lpid =3D txattr->lpid;
>  	winctx->pidr =3D txattr->pidr;
> -	winctx->rx_win_id =3D txwin->rxwin->winid;
> +	winctx->rx_win_id =3D txwin->pnv.rxwin->winid;
>  	/*
>  	 * IRQ and fault window setup is successful. Set fault window
>  	 * for the send window so that ready to handle faults.
>  	 */
> -	if (txwin->vinst->virq)
> -		winctx->fault_win_id =3D txwin->vinst->fault_win->winid;
> +	if (vinst->virq)
> +		winctx->fault_win_id =3D vinst->fault_win->winid;
> =20
>  	winctx->dma_type =3D VAS_DMA_TYPE_INJECT;
>  	winctx->tc_mode =3D txattr->tc_mode;
>  	winctx->min_scope =3D VAS_SCOPE_LOCAL;
>  	winctx->max_scope =3D VAS_SCOPE_VECTORED_GROUP;
> -	if (txwin->vinst->virq)
> -		winctx->irq_port =3D txwin->vinst->irq_port;
> +	if (vinst->virq)
> +		winctx->irq_port =3D vinst->irq_port;
> =20
>  	winctx->pswid =3D txattr->pswid ? txattr->pswid :
> -			encode_pswid(txwin->vinst->vas_id, txwin->winid);
> +			encode_pswid(vinst->vas_id, txwin->winid);
>  }
> =20
>  static bool tx_win_args_valid(enum vas_cop_type cop,
> @@ -1031,10 +1040,10 @@ struct vas_window *vas_tx_win_open(int vasid, enu=
m vas_cop_type cop,
>  	}
> =20
>  	txwin->cop =3D cop;
> -	txwin->tx_win =3D 1;
> -	txwin->rxwin =3D rxwin;
> -	txwin->nx_win =3D txwin->rxwin->nx_win;
> -	txwin->user_win =3D attr->user_win;
> +	txwin->pnv.tx_win =3D 1;
> +	txwin->pnv.rxwin =3D rxwin;
> +	txwin->pnv.nx_win =3D txwin->pnv.rxwin->pnv.nx_win;
> +	txwin->pnv.user_win =3D attr->user_win;
>  	txwin->wcreds_max =3D attr->wcreds_max ?: VAS_WCREDS_DEFAULT;
> =20
>  	init_winctx_for_txwin(txwin, attr, &winctx);
> @@ -1049,10 +1058,10 @@ struct vas_window *vas_tx_win_open(int vasid, enu=
m vas_cop_type cop,
>  	 * NOTE: If kernel ever resubmits a user CRB after handling a page
>  	 *	 fault, we will need to map this into kernel as well.
>  	 */
> -	if (!txwin->user_win) {
> -		txwin->paste_kaddr =3D map_paste_region(txwin);
> -		if (IS_ERR(txwin->paste_kaddr)) {
> -			rc =3D PTR_ERR(txwin->paste_kaddr);
> +	if (!txwin->pnv.user_win) {
> +		txwin->pnv.paste_kaddr =3D map_paste_region(txwin);
> +		if (IS_ERR(txwin->pnv.paste_kaddr)) {
> +			rc =3D PTR_ERR(txwin->pnv.paste_kaddr);
>  			goto free_window;
>  		}
>  	} else {
> @@ -1104,9 +1113,9 @@ int vas_paste_crb(struct vas_window *txwin, int off=
set, bool re)
>  	 * report-enable flag is set for NX windows. Ensure software
>  	 * complies too.
>  	 */
> -	WARN_ON_ONCE(txwin->nx_win && !re);
> +	WARN_ON_ONCE(txwin->pnv.nx_win && !re);
> =20
> -	addr =3D txwin->paste_kaddr;
> +	addr =3D txwin->pnv.paste_kaddr;
>  	if (re) {
>  		/*
>  		 * Set the REPORT_ENABLE bit (equivalent to writing
> @@ -1153,7 +1162,7 @@ static void poll_window_credits(struct vas_window *=
window)
>  	int count =3D 0;
> =20
>  	val =3D read_hvwc_reg(window, VREG(WINCTL));
> -	if (window->tx_win)
> +	if (window->pnv.tx_win)
>  		mode =3D GET_FIELD(VAS_WINCTL_TX_WCRED_MODE, val);
>  	else
>  		mode =3D GET_FIELD(VAS_WINCTL_RX_WCRED_MODE, val);
> @@ -1161,7 +1170,7 @@ static void poll_window_credits(struct vas_window *=
window)
>  	if (!mode)
>  		return;
>  retry:
> -	if (window->tx_win) {
> +	if (window->pnv.tx_win) {
>  		val =3D read_hvwc_reg(window, VREG(TX_WCRED));
>  		creds =3D GET_FIELD(VAS_TX_WCRED, val);
>  	} else {
> @@ -1277,7 +1286,7 @@ int vas_win_close(struct vas_window *window)
>  	if (!window)
>  		return 0;
> =20
> -	if (!window->tx_win && atomic_read(&window->num_txwins) !=3D 0) {
> +	if (!window->pnv.tx_win && atomic_read(&window->pnv.num_txwins) !=3D 0)=
 {
>  		pr_devel("Attempting to close an active Rx window!\n");
>  		WARN_ON_ONCE(1);
>  		return -EBUSY;
> @@ -1296,11 +1305,11 @@ int vas_win_close(struct vas_window *window)
>  	poll_window_castout(window);
> =20
>  	/* if send window, drop reference to matching receive window */
> -	if (window->tx_win) {
> -		if (window->user_win)
> +	if (window->pnv.tx_win) {
> +		if (window->pnv.user_win)
>  			vas_drop_reference_pid_mm(&window->task_ref);
> =20
> -		put_rx_win(window->rxwin);
> +		put_rx_win(window->pnv.rxwin);
>  	}
> =20
>  	vas_window_free(window);
> @@ -1384,12 +1393,12 @@ struct vas_window *vas_pswid_to_window(struct vas=
_instance *vinst,
>  	 * since their CRBs are ignored (not queued on FIFO or processed
>  	 * by NX).
>  	 */
> -	if (!window->tx_win || !window->user_win || !window->nx_win ||
> -			window->cop =3D=3D VAS_COP_TYPE_FAULT ||
> -			window->cop =3D=3D VAS_COP_TYPE_FTW) {
> +	if (!window->pnv.tx_win || !window->pnv.user_win ||
> +		!window->pnv.nx_win || window->cop =3D=3D VAS_COP_TYPE_FAULT ||
> +		window->cop =3D=3D VAS_COP_TYPE_FTW) {
>  		pr_err("PSWID decode: id %d, tx %d, user %d, nx %d, cop %d\n",
> -			winid, window->tx_win, window->user_win,
> -			window->nx_win, window->cop);
> +			winid, window->pnv.tx_win, window->pnv.user_win,
> +			window->pnv.nx_win, window->cop);
>  		WARN_ON(1);
>  	}
> =20
> diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platform=
s/powernv/vas.h
> index f354dd5c51bd..f2d9daff3d82 100644
> --- a/arch/powerpc/platforms/powernv/vas.h
> +++ b/arch/powerpc/platforms/powernv/vas.h
> @@ -345,34 +345,6 @@ struct vas_instance {
>  	struct dentry *dbgdir;
>  };
> =20
> -/*
> - * In-kernel state a VAS window. One per window.
> - */
> -struct vas_window {
> -	/* Fields common to send and receive windows */
> -	struct vas_instance *vinst;
> -	int winid;
> -	bool tx_win;		/* True if send window */
> -	bool nx_win;		/* True if NX window */
> -	bool user_win;		/* True if user space window */
> -	void *hvwc_map;		/* HV window context */
> -	void *uwc_map;		/* OS/User window context */
> -	int wcreds_max;		/* Window credits */
> -
> -	struct vas_user_win_ref task_ref;
> -	char *dbgname;
> -	struct dentry *dbgdir;
> -
> -	/* Fields applicable only to send windows */
> -	void *paste_kaddr;
> -	char *paste_addr_name;
> -	struct vas_window *rxwin;
> -
> -	/* Feilds applicable only to receive windows */
> -	enum vas_cop_type cop;
> -	atomic_t num_txwins;
> -};
> -
>  /*
>   * Container for the hardware state of a window. One per-window.
>   *
> @@ -449,8 +421,8 @@ static inline void vas_log_write(struct vas_window *w=
in, char *name,
>  {
>  	if (val)
>  		pr_debug("%swin #%d: %s reg %p, val 0x%016llx\n",
> -				win->tx_win ? "Tx" : "Rx", win->winid, name,
> -				regptr, val);
> +				win->pnv.tx_win ? "Tx" : "Rx", win->winid,
> +				name, regptr, val);
>  }
> =20
>  static inline void write_uwc_reg(struct vas_window *win, char *name,
> @@ -458,7 +430,7 @@ static inline void write_uwc_reg(struct vas_window *w=
in, char *name,
>  {
>  	void *regptr;
> =20
> -	regptr =3D win->uwc_map + reg;
> +	regptr =3D win->pnv.uwc_map + reg;
>  	vas_log_write(win, name, regptr, val);
> =20
>  	out_be64(regptr, val);
> @@ -469,7 +441,7 @@ static inline void write_hvwc_reg(struct vas_window *=
win, char *name,
>  {
>  	void *regptr;
> =20
> -	regptr =3D win->hvwc_map + reg;
> +	regptr =3D win->pnv.hvwc_map + reg;
>  	vas_log_write(win, name, regptr, val);
> =20
>  	out_be64(regptr, val);
> @@ -478,7 +450,7 @@ static inline void write_hvwc_reg(struct vas_window *=
win, char *name,
>  static inline u64 read_hvwc_reg(struct vas_window *win,
>  			char *name __maybe_unused, s32 reg)
>  {
> -	return in_be64(win->hvwc_map+reg);
> +	return in_be64(win->pnv.hvwc_map + reg);
>  }
> =20
>  /*
> --=20
> 2.18.2
>=20
>=20
>=20
