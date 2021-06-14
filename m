Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BCA3A5B93
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 04:29:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3FlG262xz3bV0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 12:29:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EzLypxom;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EzLypxom; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3Fkp34TNz2xYp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 12:29:06 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id k7so8849697pjf.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 19:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=mTzYFZ3XHfNOIQiUrFYYYeGZ1EO8rG7A1+ihdtunf/4=;
 b=EzLypxomip3/6RxTwSbFbqtsRTflxYb5adsRf3KNGPgFH/DzFrJzAIXlM1c/vcVfJP
 Qut0AIif4XMYMrn/33koQ/ctlTsqAjV2cXuT86K9qunZSMj2sL29Vr621cnvDItdIPsK
 cK7s8IhmNSKKYkQWOG0lJZ0g0Gtr9kL4i70jmnzIiRebtJmAyL1LYLe2GLWmlJb+i37g
 aJsoawYImM/+Aj5/NSYsXXbhatBEIYkvw8vhNUaW7+I805DxiQyn909DDBzCWlz0km4g
 bCYnoDZmgeykygzHRsHyx9caLCmPvte0P1a2jviUr5a/Ui+kfM4ANu+P8BBjquqAbWLK
 oiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mTzYFZ3XHfNOIQiUrFYYYeGZ1EO8rG7A1+ihdtunf/4=;
 b=LlCrS6rpOClZ0cg2F1fUm2Gq++aN7Oy9PsiXSbxS5aw4Uo/ysTcHoYbv1iUS63Ql6B
 +PyR7OIYDrkuqKeB22attoKXLDRNBYNcECorOPju1usNb8YLlk2NaG6Y/4m3294K0Z38
 mSb578LyhPTcIlFKLQznoqDPGutgbuhxhQBV86epwW3DWqSxE1giYqaWjNzE3sVawvr2
 95A6fcjU2dozv7voXmya1Eww03YP1hsXuna0nJDQ6UxcjnDsD432Xo5ugdk63KZFhcTB
 iCYMvtw86qtgkTIa6tRkr6ZlrsTfhh4pbNo8NKk0HhtB7/NHbOMBP2fA1G1U6ePxVccY
 Bg7w==
X-Gm-Message-State: AOAM533FuwY7NadO3Q9x/5JZqxYkSWEolaNUQVEKBQM7xcRpUgZaQZv9
 DmWw2kkH2KQYtN5Njt6HTh0=
X-Google-Smtp-Source: ABdhPJy6cuMVIwA2YFviU18m367w7ypzdJF5bTHM/nZLhde9ifuyAnNwYX4JcOjnAP/VlavFyl3EPQ==
X-Received: by 2002:a17:90a:bf03:: with SMTP id
 c3mr16670889pjs.196.1623637743190; 
 Sun, 13 Jun 2021 19:29:03 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id x2sm10704507pfp.155.2021.06.13.19.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 19:29:02 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:28:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 07/17] powerpc/vas:  Define and use common vas_window
 struct
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <e717c0370a9c8e7853cbe474c51b01b43566699f.camel@linux.ibm.com>
In-Reply-To: <e717c0370a9c8e7853cbe474c51b01b43566699f.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623637639.l0y9tfxqvd.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 13, 2021 8:58 pm:
>=20
> Many elements in vas_struct are used on PowerNV and PowerVM
> platforms. vas_window is used for both TX and RX windows on
> PowerNV and for TX windows on PowerVM. So some elements are
> specific to these platforms.
>=20
> So this patch defines common vas_window and platform
> specific window structs (pnv_vas_window on PowerNV). Also adds
> the corresponding changes in PowerNV vas code.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Thanks for making this change, it must have been a lot of churn. Again,=20
apologies for not picking up on it earlier. I think the end result is
nicer.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> ---
>  arch/powerpc/include/asm/vas.h              |  14 +-
>  arch/powerpc/platforms/powernv/vas-debug.c  |  27 ++--
>  arch/powerpc/platforms/powernv/vas-fault.c  |  20 +--
>  arch/powerpc/platforms/powernv/vas-trace.h  |   4 +-
>  arch/powerpc/platforms/powernv/vas-window.c | 161 +++++++++++---------
>  arch/powerpc/platforms/powernv/vas.h        |  44 +++---
>  6 files changed, 144 insertions(+), 126 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index c1daab4cc205..1acf2b18c2d1 100644
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
> @@ -63,6 +61,18 @@ struct vas_user_win_ref {
>  	struct mm_struct *mm;	/* Linux process mm_struct */
>  };
> =20
> +/*
> + * Common VAS window struct on PowerNV and PowerVM
> + */
> +struct vas_window {
> +	u32 winid;
> +	u32 wcreds_max;	/* Window credits */
> +	enum vas_cop_type cop;
> +	struct vas_user_win_ref task_ref;
> +	char *dbgname;
> +	struct dentry *dbgdir;
> +};
> +
>  /*
>   * User space window operations used for powernv and powerVM
>   */
> diff --git a/arch/powerpc/platforms/powernv/vas-debug.c b/arch/powerpc/pl=
atforms/powernv/vas-debug.c
> index 41fa90d2f4ab..3ce89a4b54be 100644
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
> @@ -28,7 +29,7 @@ static char *cop_to_str(int cop)
> =20
>  static int info_show(struct seq_file *s, void *private)
>  {
> -	struct vas_window *window =3D s->private;
> +	struct pnv_vas_window *window =3D s->private;
> =20
>  	mutex_lock(&vas_mutex);
> =20
> @@ -36,9 +37,9 @@ static int info_show(struct seq_file *s, void *private)
>  	if (!window->hvwc_map)
>  		goto unlock;
> =20
> -	seq_printf(s, "Type: %s, %s\n", cop_to_str(window->cop),
> +	seq_printf(s, "Type: %s, %s\n", cop_to_str(window->vas_win.cop),
>  					window->tx_win ? "Send" : "Receive");
> -	seq_printf(s, "Pid : %d\n", vas_window_pid(window));
> +	seq_printf(s, "Pid : %d\n", vas_window_pid(&window->vas_win));
> =20
>  unlock:
>  	mutex_unlock(&vas_mutex);
> @@ -47,7 +48,7 @@ static int info_show(struct seq_file *s, void *private)
> =20
>  DEFINE_SHOW_ATTRIBUTE(info);
> =20
> -static inline void print_reg(struct seq_file *s, struct vas_window *win,
> +static inline void print_reg(struct seq_file *s, struct pnv_vas_window *=
win,
>  			char *name, u32 reg)
>  {
>  	seq_printf(s, "0x%016llx %s\n", read_hvwc_reg(win, name, reg), name);
> @@ -55,7 +56,7 @@ static inline void print_reg(struct seq_file *s, struct=
 vas_window *win,
> =20
>  static int hvwc_show(struct seq_file *s, void *private)
>  {
> -	struct vas_window *window =3D s->private;
> +	struct pnv_vas_window *window =3D s->private;
> =20
>  	mutex_lock(&vas_mutex);
> =20
> @@ -103,8 +104,10 @@ static int hvwc_show(struct seq_file *s, void *priva=
te)
> =20
>  DEFINE_SHOW_ATTRIBUTE(hvwc);
> =20
> -void vas_window_free_dbgdir(struct vas_window *window)
> +void vas_window_free_dbgdir(struct pnv_vas_window *pnv_win)
>  {
> +	struct vas_window *window =3D  &pnv_win->vas_win;
> +
>  	if (window->dbgdir) {
>  		debugfs_remove_recursive(window->dbgdir);
>  		kfree(window->dbgname);
> @@ -113,21 +116,21 @@ void vas_window_free_dbgdir(struct vas_window *wind=
ow)
>  	}
>  }
> =20
> -void vas_window_init_dbgdir(struct vas_window *window)
> +void vas_window_init_dbgdir(struct pnv_vas_window *window)
>  {
>  	struct dentry *d;
> =20
>  	if (!window->vinst->dbgdir)
>  		return;
> =20
> -	window->dbgname =3D kzalloc(16, GFP_KERNEL);
> -	if (!window->dbgname)
> +	window->vas_win.dbgname =3D kzalloc(16, GFP_KERNEL);
> +	if (!window->vas_win.dbgname)
>  		return;
> =20
> -	snprintf(window->dbgname, 16, "w%d", window->winid);
> +	snprintf(window->vas_win.dbgname, 16, "w%d", window->vas_win.winid);
> =20
> -	d =3D debugfs_create_dir(window->dbgname, window->vinst->dbgdir);
> -	window->dbgdir =3D d;
> +	d =3D debugfs_create_dir(window->vas_win.dbgname, window->vinst->dbgdir=
);
> +	window->vas_win.dbgdir =3D d;
> =20
>  	debugfs_create_file("info", 0444, d, window, &info_fops);
>  	debugfs_create_file("hvwc", 0444, d, window, &hvwc_fops);
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/pl=
atforms/powernv/vas-fault.c
> index 2729ac541fb3..a7aabc18039e 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -68,7 +68,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
>  	struct vas_instance *vinst =3D data;
>  	struct coprocessor_request_block *crb, *entry;
>  	struct coprocessor_request_block buf;
> -	struct vas_window *window;
> +	struct pnv_vas_window *window;
>  	unsigned long flags;
>  	void *fifo;
> =20
> @@ -153,7 +153,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
>  			 * NX sees faults only with user space windows.
>  			 */
>  			if (window->user_win)
> -				vas_update_csb(crb, &window->task_ref);
> +				vas_update_csb(crb, &window->vas_win.task_ref);
>  			else
>  				WARN_ON_ONCE(!window->user_win);
> =20
> @@ -199,6 +199,7 @@ irqreturn_t vas_fault_handler(int irq, void *dev_id)
>  int vas_setup_fault_window(struct vas_instance *vinst)
>  {
>  	struct vas_rx_win_attr attr;
> +	struct vas_window *win;
> =20
>  	vinst->fault_fifo_size =3D VAS_FAULT_WIN_FIFO_SIZE;
>  	vinst->fault_fifo =3D kzalloc(vinst->fault_fifo_size, GFP_KERNEL);
> @@ -227,18 +228,17 @@ int vas_setup_fault_window(struct vas_instance *vin=
st)
>  	attr.lnotify_pid =3D mfspr(SPRN_PID);
>  	attr.lnotify_tid =3D mfspr(SPRN_PID);
> =20
> -	vinst->fault_win =3D vas_rx_win_open(vinst->vas_id, VAS_COP_TYPE_FAULT,
> -					&attr);
> -
> -	if (IS_ERR(vinst->fault_win)) {
> -		pr_err("VAS: Error %ld opening FaultWin\n",
> -			PTR_ERR(vinst->fault_win));
> +	win =3D vas_rx_win_open(vinst->vas_id, VAS_COP_TYPE_FAULT, &attr);
> +	if (IS_ERR(win)) {
> +		pr_err("VAS: Error %ld opening FaultWin\n", PTR_ERR(win));
>  		kfree(vinst->fault_fifo);
> -		return PTR_ERR(vinst->fault_win);
> +		return PTR_ERR(win);
>  	}
> =20
> +	vinst->fault_win =3D container_of(win, struct pnv_vas_window, vas_win);
> +
>  	pr_devel("VAS: Created FaultWin %d, LPID/PID/TID [%d/%d/%d]\n",
> -			vinst->fault_win->winid, attr.lnotify_lpid,
> +			vinst->fault_win->vas_win.winid, attr.lnotify_lpid,
>  			attr.lnotify_pid, attr.lnotify_tid);
> =20
>  	return 0;
> diff --git a/arch/powerpc/platforms/powernv/vas-trace.h b/arch/powerpc/pl=
atforms/powernv/vas-trace.h
> index a449b9f0c12e..ca2e08f2ddc0 100644
> --- a/arch/powerpc/platforms/powernv/vas-trace.h
> +++ b/arch/powerpc/platforms/powernv/vas-trace.h
> @@ -80,7 +80,7 @@ TRACE_EVENT(	vas_tx_win_open,
>  TRACE_EVENT(	vas_paste_crb,
> =20
>  		TP_PROTO(struct task_struct *tsk,
> -			struct vas_window *win),
> +			struct pnv_vas_window *win),
> =20
>  		TP_ARGS(tsk, win),
> =20
> @@ -96,7 +96,7 @@ TRACE_EVENT(	vas_paste_crb,
>  		TP_fast_assign(
>  			__entry->pid =3D tsk->pid;
>  			__entry->vasid =3D win->vinst->vas_id;
> -			__entry->winid =3D win->winid;
> +			__entry->winid =3D win->vas_win.winid;
>  			__entry->paste_kaddr =3D (unsigned long)win->paste_kaddr
>  		),
> =20
> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/p=
latforms/powernv/vas-window.c
> index 4222c9bdb8fe..95ee13f81bdc 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -27,14 +27,14 @@
>   * Compute the paste address region for the window @window using the
>   * ->paste_base_addr and ->paste_win_id_shift we got from device tree.
>   */
> -void vas_win_paste_addr(struct vas_window *window, u64 *addr, int *len)
> +void vas_win_paste_addr(struct pnv_vas_window *window, u64 *addr, int *l=
en)
>  {
>  	int winid;
>  	u64 base, shift;
> =20
>  	base =3D window->vinst->paste_base_addr;
>  	shift =3D window->vinst->paste_win_id_shift;
> -	winid =3D window->winid;
> +	winid =3D window->vas_win.winid;
> =20
>  	*addr  =3D base + (winid << shift);
>  	if (len)
> @@ -43,23 +43,23 @@ void vas_win_paste_addr(struct vas_window *window, u6=
4 *addr, int *len)
>  	pr_debug("Txwin #%d: Paste addr 0x%llx\n", winid, *addr);
>  }
> =20
> -static inline void get_hvwc_mmio_bar(struct vas_window *window,
> +static inline void get_hvwc_mmio_bar(struct pnv_vas_window *window,
>  			u64 *start, int *len)
>  {
>  	u64 pbaddr;
> =20
>  	pbaddr =3D window->vinst->hvwc_bar_start;
> -	*start =3D pbaddr + window->winid * VAS_HVWC_SIZE;
> +	*start =3D pbaddr + window->vas_win.winid * VAS_HVWC_SIZE;
>  	*len =3D VAS_HVWC_SIZE;
>  }
> =20
> -static inline void get_uwc_mmio_bar(struct vas_window *window,
> +static inline void get_uwc_mmio_bar(struct pnv_vas_window *window,
>  			u64 *start, int *len)
>  {
>  	u64 pbaddr;
> =20
>  	pbaddr =3D window->vinst->uwc_bar_start;
> -	*start =3D pbaddr + window->winid * VAS_UWC_SIZE;
> +	*start =3D pbaddr + window->vas_win.winid * VAS_UWC_SIZE;
>  	*len =3D VAS_UWC_SIZE;
>  }
> =20
> @@ -68,7 +68,7 @@ static inline void get_uwc_mmio_bar(struct vas_window *=
window,
>   * space. Unlike MMIO regions (map_mmio_region() below), paste region mu=
st
>   * be mapped cache-able and is only applicable to send windows.
>   */
> -static void *map_paste_region(struct vas_window *txwin)
> +static void *map_paste_region(struct pnv_vas_window *txwin)
>  {
>  	int len;
>  	void *map;
> @@ -76,7 +76,7 @@ static void *map_paste_region(struct vas_window *txwin)
>  	u64 start;
> =20
>  	name =3D kasprintf(GFP_KERNEL, "window-v%d-w%d", txwin->vinst->vas_id,
> -				txwin->winid);
> +				txwin->vas_win.winid);
>  	if (!name)
>  		goto free_name;
> =20
> @@ -133,7 +133,7 @@ static void unmap_region(void *addr, u64 start, int l=
en)
>  /*
>   * Unmap the paste address region for a window.
>   */
> -static void unmap_paste_region(struct vas_window *window)
> +static void unmap_paste_region(struct pnv_vas_window *window)
>  {
>  	int len;
>  	u64 busaddr_start;
> @@ -154,7 +154,7 @@ static void unmap_paste_region(struct vas_window *win=
dow)
>   * path, just minimize the time we hold the mutex for now. We can add
>   * a per-instance mutex later if necessary.
>   */
> -static void unmap_winctx_mmio_bars(struct vas_window *window)
> +static void unmap_winctx_mmio_bars(struct pnv_vas_window *window)
>  {
>  	int len;
>  	void *uwc_map;
> @@ -187,7 +187,7 @@ static void unmap_winctx_mmio_bars(struct vas_window =
*window)
>   * OS/User Window Context (UWC) MMIO Base Address Region for the given w=
indow.
>   * Map these bus addresses and save the mapped kernel addresses in @wind=
ow.
>   */
> -static int map_winctx_mmio_bars(struct vas_window *window)
> +static int map_winctx_mmio_bars(struct pnv_vas_window *window)
>  {
>  	int len;
>  	u64 start;
> @@ -215,7 +215,7 @@ static int map_winctx_mmio_bars(struct vas_window *wi=
ndow)
>   *	 registers are not sequential. And, we can only write to offsets
>   *	 with valid registers.
>   */
> -static void reset_window_regs(struct vas_window *window)
> +static void reset_window_regs(struct pnv_vas_window *window)
>  {
>  	write_hvwc_reg(window, VREG(LPID), 0ULL);
>  	write_hvwc_reg(window, VREG(PID), 0ULL);
> @@ -271,7 +271,7 @@ static void reset_window_regs(struct vas_window *wind=
ow)
>   * want to add fields to vas_winctx and move the initialization to
>   * init_vas_winctx_regs().
>   */
> -static void init_xlate_regs(struct vas_window *window, bool user_win)
> +static void init_xlate_regs(struct pnv_vas_window *window, bool user_win=
)
>  {
>  	u64 lpcr, val;
> =20
> @@ -336,7 +336,7 @@ static void init_xlate_regs(struct vas_window *window=
, bool user_win)
>   *
>   * TODO: Reserved (aka dedicated) send buffers are not supported yet.
>   */
> -static void init_rsvd_tx_buf_count(struct vas_window *txwin,
> +static void init_rsvd_tx_buf_count(struct pnv_vas_window *txwin,
>  				struct vas_winctx *winctx)
>  {
>  	write_hvwc_reg(txwin, VREG(TX_RSVD_BUF_COUNT), 0ULL);
> @@ -358,7 +358,7 @@ static void init_rsvd_tx_buf_count(struct vas_window =
*txwin,
>   *	as a one-time task? That could work for NX but what about other
>   *	receivers?  Let the receivers tell us the rx-fifo buffers for now.
>   */
> -static void init_winctx_regs(struct vas_window *window,
> +static void init_winctx_regs(struct pnv_vas_window *window,
>  			     struct vas_winctx *winctx)
>  {
>  	u64 val;
> @@ -520,10 +520,10 @@ static int vas_assign_window_id(struct ida *ida)
>  	return winid;
>  }
> =20
> -static void vas_window_free(struct vas_window *window)
> +static void vas_window_free(struct pnv_vas_window *window)
>  {
> -	int winid =3D window->winid;
>  	struct vas_instance *vinst =3D window->vinst;
> +	int winid =3D window->vas_win.winid;
> =20
>  	unmap_winctx_mmio_bars(window);
> =20
> @@ -534,10 +534,10 @@ static void vas_window_free(struct vas_window *wind=
ow)
>  	vas_release_window_id(&vinst->ida, winid);
>  }
> =20
> -static struct vas_window *vas_window_alloc(struct vas_instance *vinst)
> +static struct pnv_vas_window *vas_window_alloc(struct vas_instance *vins=
t)
>  {
>  	int winid;
> -	struct vas_window *window;
> +	struct pnv_vas_window *window;
> =20
>  	winid =3D vas_assign_window_id(&vinst->ida);
>  	if (winid < 0)
> @@ -548,7 +548,7 @@ static struct vas_window *vas_window_alloc(struct vas=
_instance *vinst)
>  		goto out_free;
> =20
>  	window->vinst =3D vinst;
> -	window->winid =3D winid;
> +	window->vas_win.winid =3D winid;
> =20
>  	if (map_winctx_mmio_bars(window))
>  		goto out_free;
> @@ -563,7 +563,7 @@ static struct vas_window *vas_window_alloc(struct vas=
_instance *vinst)
>  	return ERR_PTR(-ENOMEM);
>  }
> =20
> -static void put_rx_win(struct vas_window *rxwin)
> +static void put_rx_win(struct pnv_vas_window *rxwin)
>  {
>  	/* Better not be a send window! */
>  	WARN_ON_ONCE(rxwin->tx_win);
> @@ -579,10 +579,11 @@ static void put_rx_win(struct vas_window *rxwin)
>   *
>   * NOTE: We access ->windows[] table and assume that vinst->mutex is hel=
d.
>   */
> -static struct vas_window *get_user_rxwin(struct vas_instance *vinst, u32=
 pswid)
> +static struct pnv_vas_window *get_user_rxwin(struct vas_instance *vinst,
> +					     u32 pswid)
>  {
>  	int vasid, winid;
> -	struct vas_window *rxwin;
> +	struct pnv_vas_window *rxwin;
> =20
>  	decode_pswid(pswid, &vasid, &winid);
> =20
> @@ -591,7 +592,7 @@ static struct vas_window *get_user_rxwin(struct vas_i=
nstance *vinst, u32 pswid)
> =20
>  	rxwin =3D vinst->windows[winid];
> =20
> -	if (!rxwin || rxwin->tx_win || rxwin->cop !=3D VAS_COP_TYPE_FTW)
> +	if (!rxwin || rxwin->tx_win || rxwin->vas_win.cop !=3D VAS_COP_TYPE_FTW=
)
>  		return ERR_PTR(-EINVAL);
> =20
>  	return rxwin;
> @@ -603,10 +604,10 @@ static struct vas_window *get_user_rxwin(struct vas=
_instance *vinst, u32 pswid)
>   *
>   * See also function header of set_vinst_win().
>   */
> -static struct vas_window *get_vinst_rxwin(struct vas_instance *vinst,
> +static struct pnv_vas_window *get_vinst_rxwin(struct vas_instance *vinst=
,
>  			enum vas_cop_type cop, u32 pswid)
>  {
> -	struct vas_window *rxwin;
> +	struct pnv_vas_window *rxwin;
> =20
>  	mutex_lock(&vinst->mutex);
> =20
> @@ -639,9 +640,9 @@ static struct vas_window *get_vinst_rxwin(struct vas_=
instance *vinst,
>   * window, we also save the window in the ->rxwin[] table.
>   */
>  static void set_vinst_win(struct vas_instance *vinst,
> -			struct vas_window *window)
> +			struct pnv_vas_window *window)
>  {
> -	int id =3D window->winid;
> +	int id =3D window->vas_win.winid;
> =20
>  	mutex_lock(&vinst->mutex);
> =20
> @@ -650,8 +651,8 @@ static void set_vinst_win(struct vas_instance *vinst,
>  	 * unless its a user (FTW) window.
>  	 */
>  	if (!window->user_win && !window->tx_win) {
> -		WARN_ON_ONCE(vinst->rxwin[window->cop]);
> -		vinst->rxwin[window->cop] =3D window;
> +		WARN_ON_ONCE(vinst->rxwin[window->vas_win.cop]);
> +		vinst->rxwin[window->vas_win.cop] =3D window;
>  	}
> =20
>  	WARN_ON_ONCE(vinst->windows[id] !=3D NULL);
> @@ -664,16 +665,16 @@ static void set_vinst_win(struct vas_instance *vins=
t,
>   * Clear this window from the table(s) of windows for this VAS instance.
>   * See also function header of set_vinst_win().
>   */
> -static void clear_vinst_win(struct vas_window *window)
> +static void clear_vinst_win(struct pnv_vas_window *window)
>  {
> -	int id =3D window->winid;
> +	int id =3D window->vas_win.winid;
>  	struct vas_instance *vinst =3D window->vinst;
> =20
>  	mutex_lock(&vinst->mutex);
> =20
>  	if (!window->user_win && !window->tx_win) {
> -		WARN_ON_ONCE(!vinst->rxwin[window->cop]);
> -		vinst->rxwin[window->cop] =3D NULL;
> +		WARN_ON_ONCE(!vinst->rxwin[window->vas_win.cop]);
> +		vinst->rxwin[window->vas_win.cop] =3D NULL;
>  	}
> =20
>  	WARN_ON_ONCE(vinst->windows[id] !=3D window);
> @@ -682,7 +683,7 @@ static void clear_vinst_win(struct vas_window *window=
)
>  	mutex_unlock(&vinst->mutex);
>  }
> =20
> -static void init_winctx_for_rxwin(struct vas_window *rxwin,
> +static void init_winctx_for_rxwin(struct pnv_vas_window *rxwin,
>  			struct vas_rx_win_attr *rxattr,
>  			struct vas_winctx *winctx)
>  {
> @@ -703,7 +704,7 @@ static void init_winctx_for_rxwin(struct vas_window *=
rxwin,
> =20
>  	winctx->rx_fifo =3D rxattr->rx_fifo;
>  	winctx->rx_fifo_size =3D rxattr->rx_fifo_size;
> -	winctx->wcreds_max =3D rxwin->wcreds_max;
> +	winctx->wcreds_max =3D rxwin->vas_win.wcreds_max;
>  	winctx->pin_win =3D rxattr->pin_win;
> =20
>  	winctx->nx_win =3D rxattr->nx_win;
> @@ -852,7 +853,7 @@ EXPORT_SYMBOL_GPL(vas_init_rx_win_attr);
>  struct vas_window *vas_rx_win_open(int vasid, enum vas_cop_type cop,
>  			struct vas_rx_win_attr *rxattr)
>  {
> -	struct vas_window *rxwin;
> +	struct pnv_vas_window *rxwin;
>  	struct vas_winctx winctx;
>  	struct vas_instance *vinst;
> =20
> @@ -871,21 +872,21 @@ struct vas_window *vas_rx_win_open(int vasid, enum =
vas_cop_type cop,
>  	rxwin =3D vas_window_alloc(vinst);
>  	if (IS_ERR(rxwin)) {
>  		pr_devel("Unable to allocate memory for Rx window\n");
> -		return rxwin;
> +		return (struct vas_window *)rxwin;
>  	}
> =20
>  	rxwin->tx_win =3D false;
>  	rxwin->nx_win =3D rxattr->nx_win;
>  	rxwin->user_win =3D rxattr->user_win;
> -	rxwin->cop =3D cop;
> -	rxwin->wcreds_max =3D rxattr->wcreds_max;
> +	rxwin->vas_win.cop =3D cop;
> +	rxwin->vas_win.wcreds_max =3D rxattr->wcreds_max;
> =20
>  	init_winctx_for_rxwin(rxwin, rxattr, &winctx);
>  	init_winctx_regs(rxwin, &winctx);
> =20
>  	set_vinst_win(vinst, rxwin);
> =20
> -	return rxwin;
> +	return &rxwin->vas_win;
>  }
>  EXPORT_SYMBOL_GPL(vas_rx_win_open);
> =20
> @@ -906,7 +907,7 @@ void vas_init_tx_win_attr(struct vas_tx_win_attr *txa=
ttr, enum vas_cop_type cop)
>  }
>  EXPORT_SYMBOL_GPL(vas_init_tx_win_attr);
> =20
> -static void init_winctx_for_txwin(struct vas_window *txwin,
> +static void init_winctx_for_txwin(struct pnv_vas_window *txwin,
>  			struct vas_tx_win_attr *txattr,
>  			struct vas_winctx *winctx)
>  {
> @@ -927,7 +928,7 @@ static void init_winctx_for_txwin(struct vas_window *=
txwin,
>  	 */
>  	memset(winctx, 0, sizeof(struct vas_winctx));
> =20
> -	winctx->wcreds_max =3D txwin->wcreds_max;
> +	winctx->wcreds_max =3D txwin->vas_win.wcreds_max;
> =20
>  	winctx->user_win =3D txattr->user_win;
>  	winctx->nx_win =3D txwin->rxwin->nx_win;
> @@ -947,13 +948,13 @@ static void init_winctx_for_txwin(struct vas_window=
 *txwin,
> =20
>  	winctx->lpid =3D txattr->lpid;
>  	winctx->pidr =3D txattr->pidr;
> -	winctx->rx_win_id =3D txwin->rxwin->winid;
> +	winctx->rx_win_id =3D txwin->rxwin->vas_win.winid;
>  	/*
>  	 * IRQ and fault window setup is successful. Set fault window
>  	 * for the send window so that ready to handle faults.
>  	 */
>  	if (txwin->vinst->virq)
> -		winctx->fault_win_id =3D txwin->vinst->fault_win->winid;
> +		winctx->fault_win_id =3D txwin->vinst->fault_win->vas_win.winid;
> =20
>  	winctx->dma_type =3D VAS_DMA_TYPE_INJECT;
>  	winctx->tc_mode =3D txattr->tc_mode;
> @@ -963,7 +964,8 @@ static void init_winctx_for_txwin(struct vas_window *=
txwin,
>  		winctx->irq_port =3D txwin->vinst->irq_port;
> =20
>  	winctx->pswid =3D txattr->pswid ? txattr->pswid :
> -			encode_pswid(txwin->vinst->vas_id, txwin->winid);
> +			encode_pswid(txwin->vinst->vas_id,
> +			txwin->vas_win.winid);
>  }
> =20
>  static bool tx_win_args_valid(enum vas_cop_type cop,
> @@ -994,8 +996,8 @@ struct vas_window *vas_tx_win_open(int vasid, enum va=
s_cop_type cop,
>  			struct vas_tx_win_attr *attr)
>  {
>  	int rc;
> -	struct vas_window *txwin;
> -	struct vas_window *rxwin;
> +	struct pnv_vas_window *txwin;
> +	struct pnv_vas_window *rxwin;
>  	struct vas_winctx winctx;
>  	struct vas_instance *vinst;
> =20
> @@ -1021,7 +1023,7 @@ struct vas_window *vas_tx_win_open(int vasid, enum =
vas_cop_type cop,
>  	rxwin =3D get_vinst_rxwin(vinst, cop, attr->pswid);
>  	if (IS_ERR(rxwin)) {
>  		pr_devel("No RxWin for vasid %d, cop %d\n", vasid, cop);
> -		return rxwin;
> +		return (struct vas_window *)rxwin;
>  	}
> =20
>  	txwin =3D vas_window_alloc(vinst);
> @@ -1030,12 +1032,12 @@ struct vas_window *vas_tx_win_open(int vasid, enu=
m vas_cop_type cop,
>  		goto put_rxwin;
>  	}
> =20
> -	txwin->cop =3D cop;
> +	txwin->vas_win.cop =3D cop;
>  	txwin->tx_win =3D 1;
>  	txwin->rxwin =3D rxwin;
>  	txwin->nx_win =3D txwin->rxwin->nx_win;
>  	txwin->user_win =3D attr->user_win;
> -	txwin->wcreds_max =3D attr->wcreds_max ?: VAS_WCREDS_DEFAULT;
> +	txwin->vas_win.wcreds_max =3D attr->wcreds_max ?: VAS_WCREDS_DEFAULT;
> =20
>  	init_winctx_for_txwin(txwin, attr, &winctx);
> =20
> @@ -1065,16 +1067,16 @@ struct vas_window *vas_tx_win_open(int vasid, enu=
m vas_cop_type cop,
>  			rc =3D -ENODEV;
>  			goto free_window;
>  		}
> -		rc =3D get_vas_user_win_ref(&txwin->task_ref);
> +		rc =3D get_vas_user_win_ref(&txwin->vas_win.task_ref);
>  		if (rc)
>  			goto free_window;
> =20
> -		vas_user_win_add_mm_context(&txwin->task_ref);
> +		vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
>  	}
> =20
>  	set_vinst_win(vinst, txwin);
> =20
> -	return txwin;
> +	return &txwin->vas_win;
> =20
>  free_window:
>  	vas_window_free(txwin);
> @@ -1093,12 +1095,14 @@ int vas_copy_crb(void *crb, int offset)
>  EXPORT_SYMBOL_GPL(vas_copy_crb);
> =20
>  #define RMA_LSMP_REPORT_ENABLE PPC_BIT(53)
> -int vas_paste_crb(struct vas_window *txwin, int offset, bool re)
> +int vas_paste_crb(struct vas_window *vwin, int offset, bool re)
>  {
> +	struct pnv_vas_window *txwin;
>  	int rc;
>  	void *addr;
>  	uint64_t val;
> =20
> +	txwin =3D container_of(vwin, struct pnv_vas_window, vas_win);
>  	trace_vas_paste_crb(current, txwin);
> =20
>  	/*
> @@ -1128,7 +1132,7 @@ int vas_paste_crb(struct vas_window *txwin, int off=
set, bool re)
>  	else
>  		rc =3D -EINVAL;
> =20
> -	pr_debug("Txwin #%d: Msg count %llu\n", txwin->winid,
> +	pr_debug("Txwin #%d: Msg count %llu\n", txwin->vas_win.winid,
>  			read_hvwc_reg(txwin, VREG(LRFIFO_PUSH)));
> =20
>  	return rc;
> @@ -1148,7 +1152,7 @@ EXPORT_SYMBOL_GPL(vas_paste_crb);
>   *	user space. (NX-842 driver waits for CSB and Fast thread-wakeup
>   *	doesn't use credit checking).
>   */
> -static void poll_window_credits(struct vas_window *window)
> +static void poll_window_credits(struct pnv_vas_window *window)
>  {
>  	u64 val;
>  	int creds, mode;
> @@ -1178,7 +1182,7 @@ static void poll_window_credits(struct vas_window *=
window)
>  	 *       and issue CRB Kill to stop all pending requests. Need only
>  	 *       if there is a bug in NX or fault handling in kernel.
>  	 */
> -	if (creds < window->wcreds_max) {
> +	if (creds < window->vas_win.wcreds_max) {
>  		val =3D 0;
>  		set_current_state(TASK_UNINTERRUPTIBLE);
>  		schedule_timeout(msecs_to_jiffies(10));
> @@ -1189,7 +1193,8 @@ static void poll_window_credits(struct vas_window *=
window)
>  		 */
>  		if (!(count % 1000))
>  			pr_warn_ratelimited("VAS: pid %d stuck. Waiting for credits returned =
for Window(%d). creds %d, Retries %d\n",
> -				vas_window_pid(window), window->winid,
> +				vas_window_pid(&window->vas_win),
> +				window->vas_win.winid,
>  				creds, count);
> =20
>  		goto retry;
> @@ -1201,7 +1206,7 @@ static void poll_window_credits(struct vas_window *=
window)
>   * short time to queue a CRB, so window should not be busy for too long.
>   * Trying 5ms intervals.
>   */
> -static void poll_window_busy_state(struct vas_window *window)
> +static void poll_window_busy_state(struct pnv_vas_window *window)
>  {
>  	int busy;
>  	u64 val;
> @@ -1221,7 +1226,8 @@ static void poll_window_busy_state(struct vas_windo=
w *window)
>  		 */
>  		if (!(count % 1000))
>  			pr_warn_ratelimited("VAS: pid %d stuck. Window (ID=3D%d) is in busy s=
tate. Retries %d\n",
> -				vas_window_pid(window), window->winid, count);
> +				vas_window_pid(&window->vas_win),
> +				window->vas_win.winid, count);
> =20
>  		goto retry;
>  	}
> @@ -1243,7 +1249,7 @@ static void poll_window_busy_state(struct vas_windo=
w *window)
>   *	casting out becomes necessary we should consider offloading the
>   *	job to a worker thread, so the window close can proceed quickly.
>   */
> -static void poll_window_castout(struct vas_window *window)
> +static void poll_window_castout(struct pnv_vas_window *window)
>  {
>  	/* stub for now */
>  }
> @@ -1252,7 +1258,7 @@ static void poll_window_castout(struct vas_window *=
window)
>   * Unpin and close a window so no new requests are accepted and the
>   * hardware can evict this window from cache if necessary.
>   */
> -static void unpin_close_window(struct vas_window *window)
> +static void unpin_close_window(struct pnv_vas_window *window)
>  {
>  	u64 val;
> =20
> @@ -1274,11 +1280,15 @@ static void unpin_close_window(struct vas_window =
*window)
>   *
>   * Besides the hardware, kernel has some bookkeeping of course.
>   */
> -int vas_win_close(struct vas_window *window)
> +int vas_win_close(struct vas_window *vwin)
>  {
> -	if (!window)
> +	struct pnv_vas_window *window;
> +
> +	if (!vwin)
>  		return 0;
> =20
> +	window =3D container_of(vwin, struct pnv_vas_window, vas_win);
> +
>  	if (!window->tx_win && atomic_read(&window->num_txwins) !=3D 0) {
>  		pr_devel("Attempting to close an active Rx window!\n");
>  		WARN_ON_ONCE(1);
> @@ -1300,8 +1310,8 @@ int vas_win_close(struct vas_window *window)
>  	/* if send window, drop reference to matching receive window */
>  	if (window->tx_win) {
>  		if (window->user_win) {
> -			put_vas_user_win_ref(&window->task_ref);
> -			mm_context_remove_vas_window(window->task_ref.mm);
> +			put_vas_user_win_ref(&vwin->task_ref);
> +			mm_context_remove_vas_window(vwin->task_ref.mm);
>  		}
>  		put_rx_win(window->rxwin);
>  	}
> @@ -1334,7 +1344,7 @@ EXPORT_SYMBOL_GPL(vas_win_close);
>   * - The kernel with return credit on fault window after reading entry
>   *   from fault FIFO.
>   */
> -void vas_return_credit(struct vas_window *window, bool tx)
> +void vas_return_credit(struct pnv_vas_window *window, bool tx)
>  {
>  	uint64_t val;
> =20
> @@ -1348,10 +1358,10 @@ void vas_return_credit(struct vas_window *window,=
 bool tx)
>  	}
>  }
> =20
> -struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
> +struct pnv_vas_window *vas_pswid_to_window(struct vas_instance *vinst,
>  		uint32_t pswid)
>  {
> -	struct vas_window *window;
> +	struct pnv_vas_window *window;
>  	int winid;
> =20
>  	if (!pswid) {
> @@ -1388,11 +1398,11 @@ struct vas_window *vas_pswid_to_window(struct vas=
_instance *vinst,
>  	 * by NX).
>  	 */
>  	if (!window->tx_win || !window->user_win || !window->nx_win ||
> -			window->cop =3D=3D VAS_COP_TYPE_FAULT ||
> -			window->cop =3D=3D VAS_COP_TYPE_FTW) {
> +			window->vas_win.cop =3D=3D VAS_COP_TYPE_FAULT ||
> +			window->vas_win.cop =3D=3D VAS_COP_TYPE_FTW) {
>  		pr_err("PSWID decode: id %d, tx %d, user %d, nx %d, cop %d\n",
>  			winid, window->tx_win, window->user_win,
> -			window->nx_win, window->cop);
> +			window->nx_win, window->vas_win.cop);
>  		WARN_ON(1);
>  	}
> =20
> @@ -1418,10 +1428,12 @@ static struct vas_window *vas_user_win_open(struc=
t vas_tx_win_open_attr *uattr,
>  	return vas_tx_win_open(uattr->vas_id, cop_type, &txattr);
>  }
> =20
> -static u64 vas_user_win_paste_addr(struct vas_window *win)
> +static u64 vas_user_win_paste_addr(struct vas_window *txwin)
>  {
> +	struct pnv_vas_window *win;
>  	u64 paste_addr;
> =20
> +	win =3D container_of(txwin, struct pnv_vas_window, vas_win);
>  	vas_win_paste_addr(win, &paste_addr, NULL);
> =20
>  	return paste_addr;
> @@ -1429,7 +1441,6 @@ static u64 vas_user_win_paste_addr(struct vas_windo=
w *win)
> =20
>  static int vas_user_win_close(struct vas_window *txwin)
>  {
> -
>  	vas_win_close(txwin);
> =20
>  	return 0;
> diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platform=
s/powernv/vas.h
> index f354dd5c51bd..e7f54007dbd0 100644
> --- a/arch/powerpc/platforms/powernv/vas.h
> +++ b/arch/powerpc/platforms/powernv/vas.h
> @@ -334,11 +334,11 @@ struct vas_instance {
>  	int fifo_in_progress;	/* To wake up thread or return IRQ_HANDLED */
>  	spinlock_t fault_lock;	/* Protects fifo_in_progress update */
>  	void *fault_fifo;
> -	struct vas_window *fault_win; /* Fault window */
> +	struct pnv_vas_window *fault_win; /* Fault window */
> =20
>  	struct mutex mutex;
> -	struct vas_window *rxwin[VAS_COP_TYPE_MAX];
> -	struct vas_window *windows[VAS_WINDOWS_PER_CHIP];
> +	struct pnv_vas_window *rxwin[VAS_COP_TYPE_MAX];
> +	struct pnv_vas_window *windows[VAS_WINDOWS_PER_CHIP];
> =20
>  	char *name;
>  	char *dbgname;
> @@ -346,30 +346,24 @@ struct vas_instance {
>  };
> =20
>  /*
> - * In-kernel state a VAS window. One per window.
> + * In-kernel state a VAS window on PowerNV. One per window.
>   */
> -struct vas_window {
> +struct pnv_vas_window {
> +	struct vas_window vas_win;
>  	/* Fields common to send and receive windows */
>  	struct vas_instance *vinst;
> -	int winid;
>  	bool tx_win;		/* True if send window */
>  	bool nx_win;		/* True if NX window */
>  	bool user_win;		/* True if user space window */
>  	void *hvwc_map;		/* HV window context */
>  	void *uwc_map;		/* OS/User window context */
> -	int wcreds_max;		/* Window credits */
> -
> -	struct vas_user_win_ref task_ref;
> -	char *dbgname;
> -	struct dentry *dbgdir;
> =20
>  	/* Fields applicable only to send windows */
>  	void *paste_kaddr;
>  	char *paste_addr_name;
> -	struct vas_window *rxwin;
> +	struct pnv_vas_window *rxwin;
> =20
> -	/* Feilds applicable only to receive windows */
> -	enum vas_cop_type cop;
> +	/* Fields applicable only to receive windows */
>  	atomic_t num_txwins;
>  };
> =20
> @@ -428,15 +422,15 @@ extern struct mutex vas_mutex;
>  extern struct vas_instance *find_vas_instance(int vasid);
>  extern void vas_init_dbgdir(void);
>  extern void vas_instance_init_dbgdir(struct vas_instance *vinst);
> -extern void vas_window_init_dbgdir(struct vas_window *win);
> -extern void vas_window_free_dbgdir(struct vas_window *win);
> +extern void vas_window_init_dbgdir(struct pnv_vas_window *win);
> +extern void vas_window_free_dbgdir(struct pnv_vas_window *win);
>  extern int vas_setup_fault_window(struct vas_instance *vinst);
>  extern irqreturn_t vas_fault_thread_fn(int irq, void *data);
>  extern irqreturn_t vas_fault_handler(int irq, void *dev_id);
> -extern void vas_return_credit(struct vas_window *window, bool tx);
> -extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst=
,
> +extern void vas_return_credit(struct pnv_vas_window *window, bool tx);
> +extern struct pnv_vas_window *vas_pswid_to_window(struct vas_instance *v=
inst,
>  						uint32_t pswid);
> -extern void vas_win_paste_addr(struct vas_window *window, u64 *addr,
> +extern void vas_win_paste_addr(struct pnv_vas_window *window, u64 *addr,
>  					int *len);
> =20
>  static inline int vas_window_pid(struct vas_window *window)
> @@ -444,16 +438,16 @@ static inline int vas_window_pid(struct vas_window =
*window)
>  	return pid_vnr(window->task_ref.pid);
>  }
> =20
> -static inline void vas_log_write(struct vas_window *win, char *name,
> +static inline void vas_log_write(struct pnv_vas_window *win, char *name,
>  			void *regptr, u64 val)
>  {
>  	if (val)
>  		pr_debug("%swin #%d: %s reg %p, val 0x%016llx\n",
> -				win->tx_win ? "Tx" : "Rx", win->winid, name,
> -				regptr, val);
> +				win->tx_win ? "Tx" : "Rx", win->vas_win.winid,
> +				name, regptr, val);
>  }
> =20
> -static inline void write_uwc_reg(struct vas_window *win, char *name,
> +static inline void write_uwc_reg(struct pnv_vas_window *win, char *name,
>  			s32 reg, u64 val)
>  {
>  	void *regptr;
> @@ -464,7 +458,7 @@ static inline void write_uwc_reg(struct vas_window *w=
in, char *name,
>  	out_be64(regptr, val);
>  }
> =20
> -static inline void write_hvwc_reg(struct vas_window *win, char *name,
> +static inline void write_hvwc_reg(struct pnv_vas_window *win, char *name=
,
>  			s32 reg, u64 val)
>  {
>  	void *regptr;
> @@ -475,7 +469,7 @@ static inline void write_hvwc_reg(struct vas_window *=
win, char *name,
>  	out_be64(regptr, val);
>  }
> =20
> -static inline u64 read_hvwc_reg(struct vas_window *win,
> +static inline u64 read_hvwc_reg(struct pnv_vas_window *win,
>  			char *name __maybe_unused, s32 reg)
>  {
>  	return in_be64(win->hvwc_map+reg);
> --=20
> 2.18.2
>=20
>=20
>=20
