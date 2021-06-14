Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B9A3A5B90
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 04:27:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3FhV03hRz3091
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 12:27:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Hw79FTl7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Hw79FTl7; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3Fh23xZ4z2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 12:26:42 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id k7so8847493pjf.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 19:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Pzfjc4O6KHzz7wfkK6svrF6fyMKOd6y0yIKqmxKC9WY=;
 b=Hw79FTl7Wb+6J4FqoHFhlB7WiELdLbzd8dcaqf4bNQL7rSMxHkRPmFVPimaZuQ0IcW
 wP3McilTt1MriykfRIhlqYMhEs9twIIhwbSMcjMiCrLJhbW44htZS13kC+4su8g+FpCl
 qI8PJrAZCSzzB7hkmVLIfLjpxElmb0+N69+Bd9H1t97USUSXld6tWvYIWqykGNMud24l
 anWIuuvUHHdfJOGnTinPTWAn8orq73vMwy+7Wbz9RjABn92ivH8Oi1YJ1CwkK2HY6VH3
 TOKbUNAP+Eon3BMd254YE9UJoC0s5W/dcBUetOY0+VCdNIoZi4YjRTU8kzUJ2Krhtk7T
 bOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Pzfjc4O6KHzz7wfkK6svrF6fyMKOd6y0yIKqmxKC9WY=;
 b=YFPskEkmFffUHQDh8iT1pouWDSvn/6IpCQ0Gp+DTUZilSWZMzJn9zeaHviVUtTj2R4
 lspUwYMQRQ6dyllOFAH8vwMFRykOkW0CToia1y2VpRknaoV0GHujJ5t5rWJ2Cs+lgFkv
 uKx1YcHjSRK/xDnNLkTs+fGmqTExJgOYvIN9ZbFP+BmY81N7gJZa5uL7ftUTLaX+/1Ff
 DPvRY7Nv99zYD/a3Awt6ucJBfU9uHbA7rvArMbsauD+g+79AxLjiguD7GnMa9mwcKjj7
 7QDZ5kCmBiT5veeQk7KTaK/aGE0tlYIRPIfPyjvLxnZyoqeIj2tNnhdoOkqMwqIZPW5T
 grqQ==
X-Gm-Message-State: AOAM532mDgGWSd6h3Y/R3P54pS992INJPYc6EgDG8imsqu3+ry/RdWg1
 V7tdtT6v2C6l1R9lNAzT4dY=
X-Google-Smtp-Source: ABdhPJy7wzj+Gc2YLChdyL2qe7Yjdu/vph3LKfuwCkPEcCnbyUI+mPjWC6oW53ClhXnuWWN8c/tueQ==
X-Received: by 2002:a17:902:e289:b029:10c:97e9:2c74 with SMTP id
 o9-20020a170902e289b029010c97e92c74mr14638034plc.34.1623637598585; 
 Sun, 13 Jun 2021 19:26:38 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id h18sm11123469pgl.87.2021.06.13.19.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 19:26:38 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:26:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 05/17] powerpc/vas: Create take/drop pid and mm
 reference functions
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <3d5873e775ae3c3a5dc9a62298a42d3f190f8d21.camel@linux.ibm.com>
In-Reply-To: <3d5873e775ae3c3a5dc9a62298a42d3f190f8d21.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623637580.djxbdbnwh0.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 13, 2021 8:57 pm:
>=20
> Take pid and mm references when each window opens and drops during
> close. This functionality is needed for powerNV and pseries. So
> this patch defines the existing code as functions in common book3s
> platform vas-api.c
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> ---
>  arch/powerpc/include/asm/vas.h              | 40 +++++++++++++++
>  arch/powerpc/platforms/book3s/vas-api.c     | 39 +++++++++++++++
>  arch/powerpc/platforms/powernv/vas-fault.c  | 10 ++--
>  arch/powerpc/platforms/powernv/vas-window.c | 55 ++-------------------
>  arch/powerpc/platforms/powernv/vas.h        |  6 +--
>  5 files changed, 91 insertions(+), 59 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 85318d7446c7..163460cff59b 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -5,6 +5,9 @@
> =20
>  #ifndef _ASM_POWERPC_VAS_H
>  #define _ASM_POWERPC_VAS_H
> +#include <linux/sched/mm.h>
> +#include <linux/mmu_context.h>
> +#include <asm/icswx.h>
>  #include <uapi/asm/vas-api.h>
> =20
>  struct vas_window;
> @@ -49,6 +52,17 @@ enum vas_cop_type {
>  	VAS_COP_TYPE_MAX,
>  };
> =20
> +/*
> + * User space VAS windows are opened by tasks and take references
> + * to pid and mm until windows are closed.
> + * Stores pid, mm, and tgid for each window.
> + */
> +struct vas_user_win_ref {
> +	struct pid *pid;	/* PID of owner */
> +	struct pid *tgid;	/* Thread group ID of owner */
> +	struct mm_struct *mm;	/* Linux process mm_struct */
> +};
> +
>  /*
>   * User space window operations used for powernv and powerVM
>   */
> @@ -59,6 +73,31 @@ struct vas_user_win_ops {
>  	int (*close_win)(struct vas_window *);
>  };
> =20
> +static inline void put_vas_user_win_ref(struct vas_user_win_ref *ref)
> +{
> +	/* Drop references to pid, tgid, and mm */
> +	put_pid(ref->pid);
> +	put_pid(ref->tgid);
> +	if (ref->mm)
> +		mmdrop(ref->mm);
> +}
> +
> +static inline void vas_user_win_add_mm_context(struct vas_user_win_ref *=
ref)
> +{
> +	mm_context_add_vas_window(ref->mm);
> +	/*
> +	 * Even a process that has no foreign real address mapping can
> +	 * use an unpaired COPY instruction (to no real effect). Issue
> +	 * CP_ABORT to clear any pending COPY and prevent a covert
> +	 * channel.
> +	 *
> +	 * __switch_to() will issue CP_ABORT on future context switches
> +	 * if process / thread has any open VAS window (Use
> +	 * current->mm->context.vas_windows).
> +	 */
> +	asm volatile(PPC_CP_ABORT);
> +}
> +
>  /*
>   * Receive window attributes specified by the (in-kernel) owner of windo=
w.
>   */
> @@ -190,4 +229,5 @@ int vas_register_coproc_api(struct module *mod, enum =
vas_cop_type cop_type,
>  			    const struct vas_user_win_ops *vops);
>  void vas_unregister_coproc_api(void);
> =20
> +int get_vas_user_win_ref(struct vas_user_win_ref *task_ref);
>  #endif /* __ASM_POWERPC_VAS_H */
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index 7cfc4b435ae8..1d7d3273d34b 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -55,6 +55,45 @@ static char *coproc_devnode(struct device *dev, umode_=
t *mode)
>  	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
>  }
> =20
> +/*
> + * Take reference to pid and mm
> + */
> +int get_vas_user_win_ref(struct vas_user_win_ref *task_ref)
> +{
> +	/*
> +	 * Window opened by a child thread may not be closed when
> +	 * it exits. So take reference to its pid and release it
> +	 * when the window is free by parent thread.
> +	 * Acquire a reference to the task's pid to make sure
> +	 * pid will not be re-used - needed only for multithread
> +	 * applications.
> +	 */
> +	task_ref->pid =3D get_task_pid(current, PIDTYPE_PID);
> +	/*
> +	 * Acquire a reference to the task's mm.
> +	 */
> +	task_ref->mm =3D get_task_mm(current);
> +	if (!task_ref->mm) {
> +		put_pid(task_ref->pid);
> +		pr_err("VAS: pid(%d): mm_struct is not found\n",
> +				current->pid);
> +		return -EPERM;
> +	}
> +
> +	mmgrab(task_ref->mm);
> +	mmput(task_ref->mm);
> +	/*
> +	 * Process closes window during exit. In the case of
> +	 * multithread application, the child thread can open
> +	 * window and can exit without closing it. So takes tgid
> +	 * reference until window closed to make sure tgid is not
> +	 * reused.
> +	 */
> +	task_ref->tgid =3D find_get_pid(task_tgid_vnr(current));
> +
> +	return 0;
> +}
> +
>  static int coproc_open(struct inode *inode, struct file *fp)
>  {
>  	struct coproc_instance *cp_inst;
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/pl=
atforms/powernv/vas-fault.c
> index 3d21fce254b7..ac3a71ec3bd5 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -73,7 +73,7 @@ static void update_csb(struct vas_window *window,
>  	 * NX user space windows can not be opened for task->mm=3DNULL
>  	 * and faults will not be generated for kernel requests.
>  	 */
> -	if (WARN_ON_ONCE(!window->mm || !window->user_win))
> +	if (WARN_ON_ONCE(!window->task_ref.mm || !window->user_win))
>  		return;
> =20
>  	csb_addr =3D (void __user *)be64_to_cpu(crb->csb_addr);
> @@ -92,7 +92,7 @@ static void update_csb(struct vas_window *window,
>  	csb.address =3D crb->stamp.nx.fault_storage_addr;
>  	csb.flags =3D 0;
> =20
> -	pid =3D window->pid;
> +	pid =3D window->task_ref.pid;
>  	tsk =3D get_pid_task(pid, PIDTYPE_PID);
>  	/*
>  	 * Process closes send window after all pending NX requests are
> @@ -111,7 +111,7 @@ static void update_csb(struct vas_window *window,
>  	 * a window and exits without closing it.
>  	 */
>  	if (!tsk) {
> -		pid =3D window->tgid;
> +		pid =3D window->task_ref.tgid;
>  		tsk =3D get_pid_task(pid, PIDTYPE_PID);
>  		/*
>  		 * Parent thread (tgid) will be closing window when it
> @@ -127,7 +127,7 @@ static void update_csb(struct vas_window *window,
>  		return;
>  	}
> =20
> -	kthread_use_mm(window->mm);
> +	kthread_use_mm(window->task_ref.mm);
>  	rc =3D copy_to_user(csb_addr, &csb, sizeof(csb));
>  	/*
>  	 * User space polls on csb.flags (first byte). So add barrier
> @@ -139,7 +139,7 @@ static void update_csb(struct vas_window *window,
>  		smp_mb();
>  		rc =3D copy_to_user(csb_addr, &csb, sizeof(u8));
>  	}
> -	kthread_unuse_mm(window->mm);
> +	kthread_unuse_mm(window->task_ref.mm);
>  	put_task_struct(tsk);
> =20
>  	/* Success */
> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/p=
latforms/powernv/vas-window.c
> index 5162e95c4090..4222c9bdb8fe 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -1065,51 +1065,11 @@ struct vas_window *vas_tx_win_open(int vasid, enu=
m vas_cop_type cop,
>  			rc =3D -ENODEV;
>  			goto free_window;
>  		}
> -
> -		/*
> -		 * Window opened by a child thread may not be closed when
> -		 * it exits. So take reference to its pid and release it
> -		 * when the window is free by parent thread.
> -		 * Acquire a reference to the task's pid to make sure
> -		 * pid will not be re-used - needed only for multithread
> -		 * applications.
> -		 */
> -		txwin->pid =3D get_task_pid(current, PIDTYPE_PID);
> -		/*
> -		 * Acquire a reference to the task's mm.
> -		 */
> -		txwin->mm =3D get_task_mm(current);
> -
> -		if (!txwin->mm) {
> -			put_pid(txwin->pid);
> -			pr_err("VAS: pid(%d): mm_struct is not found\n",
> -					current->pid);
> -			rc =3D -EPERM;
> +		rc =3D get_vas_user_win_ref(&txwin->task_ref);
> +		if (rc)
>  			goto free_window;
> -		}
> =20
> -		mmgrab(txwin->mm);
> -		mmput(txwin->mm);
> -		mm_context_add_vas_window(txwin->mm);
> -		/*
> -		 * Process closes window during exit. In the case of
> -		 * multithread application, the child thread can open
> -		 * window and can exit without closing it. so takes tgid
> -		 * reference until window closed to make sure tgid is not
> -		 * reused.
> -		 */
> -		txwin->tgid =3D find_get_pid(task_tgid_vnr(current));
> -		/*
> -		 * Even a process that has no foreign real address mapping can
> -		 * use an unpaired COPY instruction (to no real effect). Issue
> -		 * CP_ABORT to clear any pending COPY and prevent a covert
> -		 * channel.
> -		 *
> -		 * __switch_to() will issue CP_ABORT on future context switches
> -		 * if process / thread has any open VAS window (Use
> -		 * current->mm->context.vas_windows).
> -		 */
> -		asm volatile(PPC_CP_ABORT);
> +		vas_user_win_add_mm_context(&txwin->task_ref);
>  	}
> =20
>  	set_vinst_win(vinst, txwin);
> @@ -1340,13 +1300,8 @@ int vas_win_close(struct vas_window *window)
>  	/* if send window, drop reference to matching receive window */
>  	if (window->tx_win) {
>  		if (window->user_win) {
> -			/* Drop references to pid. tgid and mm */
> -			put_pid(window->pid);
> -			put_pid(window->tgid);
> -			if (window->mm) {
> -				mm_context_remove_vas_window(window->mm);
> -				mmdrop(window->mm);
> -			}
> +			put_vas_user_win_ref(&window->task_ref);
> +			mm_context_remove_vas_window(window->task_ref.mm);
>  		}
>  		put_rx_win(window->rxwin);
>  	}
> diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platform=
s/powernv/vas.h
> index c7db3190baca..f354dd5c51bd 100644
> --- a/arch/powerpc/platforms/powernv/vas.h
> +++ b/arch/powerpc/platforms/powernv/vas.h
> @@ -357,11 +357,9 @@ struct vas_window {
>  	bool user_win;		/* True if user space window */
>  	void *hvwc_map;		/* HV window context */
>  	void *uwc_map;		/* OS/User window context */
> -	struct pid *pid;	/* Linux process id of owner */
> -	struct pid *tgid;	/* Thread group ID of owner */
> -	struct mm_struct *mm;	/* Linux process mm_struct */
>  	int wcreds_max;		/* Window credits */
> =20
> +	struct vas_user_win_ref task_ref;
>  	char *dbgname;
>  	struct dentry *dbgdir;
> =20
> @@ -443,7 +441,7 @@ extern void vas_win_paste_addr(struct vas_window *win=
dow, u64 *addr,
> =20
>  static inline int vas_window_pid(struct vas_window *window)
>  {
> -	return pid_vnr(window->pid);
> +	return pid_vnr(window->task_ref.pid);
>  }
> =20
>  static inline void vas_log_write(struct vas_window *win, char *name,
> --=20
> 2.18.2
>=20
>=20
>=20
