Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A92D13998F0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 06:22:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwXmK5Lhpz3091
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 14:22:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IWkwZG5N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IWkwZG5N; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwXlq1PyMz2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 14:21:42 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id g24so2878524pji.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 21:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=t/G8ts/OsTfzZ2YcjxToq7b0TvLbNV1D7hhxkpokyx8=;
 b=IWkwZG5N0JiGkMMKDhrJN9ZGpgNfQZ8iMnAiXhPbaXK/gKaudoaRd64lPSk8rww+/A
 UPaceYY64viUcn7D6+q+qMzpPt9ex23vlyKu/Sq7Bt/ZLOEnr2MHDj9SDKlg18AklLrZ
 yiAC597idqw3WZTOvP3DiAAf0IWjiLfufz51i/g275GHrr6WUme67rcx4ijaNxXkpc5/
 Fxk/heJMgFyGT8GYcwgsesQ6xT2vqZKDLcu+iA5cBZCwCBJJVd3WK5pVkgs+YVW1SqoO
 bO07HsSkCXQnG5QnfLhLvaex5epTSpe2XeBSw1zquPWCvJ8V3AaHDeSQa0GzXA44NeM1
 2PLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=t/G8ts/OsTfzZ2YcjxToq7b0TvLbNV1D7hhxkpokyx8=;
 b=nd8GWhrWnPHhF/2e9KJFEtGwXix3iQBuzNwPCEwF+Rllova8DhGBPOUO5RzkMWA9tQ
 gDva/yrkncWtJPg6ylOHX2+egd9Mt9Xevkq3cpurOh2RAWM68kHn6OnRECGXuURQFqkE
 MtqanaQcch4xgSI+8UXfkG0eiWsK+ncFTiEsjZfFNxWwN4j7ish3O3kTSf4WKplpIeOT
 FF9H8rrcdVvPLe1XqUXEFJp38kLl/xB1N65Bwb7TQ6s1mmcz7h6zOc323gM0wVigfcfn
 azM3SfemM4XYzVrW1cl59Esm/BJ2YyL+3jWShBqhsoyVwWmsN99zl8InEvlSBnqx2C5U
 WnSQ==
X-Gm-Message-State: AOAM533PMy27AwEh6SL+zfCBmlYWQngpVyPeoX65nhfAYyxMHCRTBO7t
 7gp4oimQLu55NLdsBFclfzc=
X-Google-Smtp-Source: ABdhPJxP67T9jOdIqO7xSJRrJTFbT/U41fB1ffMQOiYKG71geKU07OBpeHOsLS0r0Flj9IB3BMwVMw==
X-Received: by 2002:a17:902:860b:b029:ef:46b8:886e with SMTP id
 f11-20020a170902860bb02900ef46b8886emr34068937plo.18.1622694098100; 
 Wed, 02 Jun 2021 21:21:38 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id n72sm959106pfd.8.2021.06.02.21.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 21:21:37 -0700 (PDT)
Date: Thu, 03 Jun 2021 14:21:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 04/16] powerpc/vas: Create take/drop pid and mm
 references
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <16a319614a7ab4ce843f42a49c3ecf68ed03dd36.camel@linux.ibm.com>
In-Reply-To: <16a319614a7ab4ce843f42a49c3ecf68ed03dd36.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1622693213.hz0uqko6dk.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of May 21, 2021 7:31 pm:
>=20
> Take pid and mm references when each window opens and drops during
> close. This functionality is needed for powerNV and pseries. So
> this patch defines the existing code as functions in common book3s
> platform vas-api.c
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Seems like a good idea to put these into their own helper functions.

> ---
>  arch/powerpc/include/asm/vas.h              | 25 +++++++++
>  arch/powerpc/platforms/book3s/vas-api.c     | 51 ++++++++++++++++++
>  arch/powerpc/platforms/powernv/vas-fault.c  | 10 ++--
>  arch/powerpc/platforms/powernv/vas-window.c | 57 ++-------------------
>  arch/powerpc/platforms/powernv/vas.h        |  6 +--
>  5 files changed, 88 insertions(+), 61 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 668303198772..3f2b02461a76 100644
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
> @@ -59,6 +73,16 @@ struct vas_user_win_ops {
>  	int (*close_win)(void *);
>  };
> =20
> +static inline void vas_drop_reference_pid_mm(struct vas_user_win_ref *re=
f)
> +{
> +	/* Drop references to pid and mm */
> +	put_pid(ref->pid);
> +	if (ref->mm) {
> +		mm_context_remove_vas_window(ref->mm);
> +		mmdrop(ref->mm);
> +	}
> +}

You don't have to make up a new name for such a thing because you=20
already have one

put_vas_user_win_ref(struct vas_user_win_ref *ref)


> +
>  /*
>   * Receive window attributes specified by the (in-kernel) owner of windo=
w.
>   */
> @@ -192,4 +216,5 @@ int vas_register_coproc_api(struct module *mod, enum =
vas_cop_type cop_type,
>  			    struct vas_user_win_ops *vops);
>  void vas_unregister_coproc_api(void);
> =20
> +int vas_reference_pid_mm(struct vas_user_win_ref *task_ref);
>  #endif /* __ASM_POWERPC_VAS_H */
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index 6c39320bfb9b..a0141bfb2e4b 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -55,6 +55,57 @@ static char *coproc_devnode(struct device *dev, umode_=
t *mode)
>  	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
>  }
> =20
> +/*
> + * Take reference to pid and mm
> + */
> +int vas_reference_pid_mm(struct vas_user_win_ref *task_ref)
> +{

So this is quite different from a typical refcount object in that it's=20
opening it for access as well. I would split it in two functions, one
matching put_vas_user_win_ref() and appearing in the same place in code,
which is up to about mmput and another function that adds the window and
does the CP_ABORT etc... hmm, where do you release tgid?

Thanks,
Nick

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
> +	mm_context_add_vas_window(task_ref->mm);
> +	/*
> +	 * Process closes window during exit. In the case of
> +	 * multithread application, the child thread can open
> +	 * window and can exit without closing it. Expects parent
> +	 * thread to use and close the window. So do not need
> +	 * to take pid reference for parent thread.
> +	 */
> +	task_ref->tgid =3D find_get_pid(task_tgid_vnr(current));
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
> index 3ccd3edcaf1a..ffd619e5a218 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -1065,51 +1065,9 @@ struct vas_window *vas_tx_win_open(int vasid, enum=
 vas_cop_type cop,
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
> +		rc =3D vas_reference_pid_mm(&txwin->task_ref);
> +		if (rc)
>  			goto free_window;
> -		}
> -
> -		mmgrab(txwin->mm);
> -		mmput(txwin->mm);
> -		mm_context_add_vas_window(txwin->mm);
> -		/*
> -		 * Process closes window during exit. In the case of
> -		 * multithread application, the child thread can open
> -		 * window and can exit without closing it. Expects parent
> -		 * thread to use and close the window. So do not need
> -		 * to take pid reference for parent thread.
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
>  	}
> =20
>  	set_vinst_win(vinst, txwin);
> @@ -1339,14 +1297,9 @@ int vas_win_close(struct vas_window *window)
> =20
>  	/* if send window, drop reference to matching receive window */
>  	if (window->tx_win) {
> -		if (window->user_win) {
> -			/* Drop references to pid and mm */
> -			put_pid(window->pid);
> -			if (window->mm) {
> -				mm_context_remove_vas_window(window->mm);
> -				mmdrop(window->mm);
> -			}
> -		}
> +		if (window->user_win)
> +			vas_drop_reference_pid_mm(&window->task_ref);
> +
>  		put_rx_win(window->rxwin);
>  	}
> =20
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
