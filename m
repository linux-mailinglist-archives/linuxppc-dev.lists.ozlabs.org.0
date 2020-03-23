Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA718EE0C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 03:42:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lzFQ6r5yzDqqY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 13:42:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NUdQO1rJ; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lzCJ2yxmzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 13:41:00 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id t24so6424728pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 19:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=OhLMNKLxMrZ/uR4NUcPWzyBGh0EStNSTzGLwaGkRCaY=;
 b=NUdQO1rJyi/SmfboFAaXWtjgzOceRqGOGinmaHMmOl4gzOKB/IkoRL9psoTEgy2psp
 5Ad6qzpgbVR+g1i38FzS2KswKEpPt6w4/a+QcZGrr35foGenFV4Q03QTckSD+u5dUF99
 xzk9LsWjWFYhEHPXoGCbQ/PK5dBloOO4oPPeW2CAvOhDWr9ZF5jZ94HmV5JShoF8Oe9V
 vOBbeXKfnFAqxy8QYndLU8SFlsOf6JT0MHnYfqbRcMyHyzAJq/a5E5zWb77Brjw9w/Ka
 Fug/VP3K5zFu4cYVLZoVGVacFSUuBLh6ER0uLuYEAtmGX8zALRINEmrQxXSD9aWCuJtm
 qCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=OhLMNKLxMrZ/uR4NUcPWzyBGh0EStNSTzGLwaGkRCaY=;
 b=XisCHFMcU82Q8psidITHp/1cOs6Gekk6xdeSB7y4AVYhz7M2PoE7aQEUGILYg7Ncv1
 X/+K0DrDI/0AmNaEAN7T03e904VlSGGODjLLXyZXgcacYEhysIqJ6zexuMZtebG10iX+
 m/y0R0xYCkAJQnAa0XlcAogZkHmwUBWEHWzTET/TandNRDsl7E1WSa+4ovit3UkohuM3
 DeO55aRmTj4s+pzJ1XiUcNoSuoGoK85PzKgKjnV9HasggE7SoJQDyKirgnTsf5IXv0ae
 7VQhLuuS6xugAYYM8NK16tDUlzvBLW2KqLHCv9dvLEotNox7wsWt/2T0CTMCwGS0yHZ8
 dbfg==
X-Gm-Message-State: ANhLgQ0p6fbN3Qha1NDwcC9+fGCYSlfpz8128FqmXzeZ2Qu6r4HihiII
 9/ca688m9NtYtQY/Z/OxceQ=
X-Google-Smtp-Source: ADFU+vt2dYXujTiBSYWBC9tHX5dXl+5eAHH/pfFztPZ3EsUHIjNFnA8IkdTkMbGW1jzGxXFjES2nbw==
X-Received: by 2002:a63:334c:: with SMTP id z73mr20383830pgz.421.1584931257375; 
 Sun, 22 Mar 2020 19:40:57 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id k17sm11451335pfp.194.2020.03.22.19.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 19:40:56 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:37:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v8 09/14] powerpc/vas: Update CSB and notify process for
 fault CRBs
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598648.9256.15258.camel@hbabu-laptop>
In-Reply-To: <1584598648.9256.15258.camel@hbabu-laptop>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584930898.ip1un9v2ye.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, hch@infradead.org, oohall@gmail.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni's on March 19, 2020 4:17 pm:
>=20
> For each fault CRB, update fault address in CRB (fault_storage_addr)
> and translation error status in CSB so that user space can touch the
> fault address and resend the request. If the user space passed invalid
> CSB address send signal to process with SIGSEGV.

This is where the actual fault handling is done? Does this need to be=20
split from the other patch? Why not merge them and put it after the
reference counting one?

I'll wait until comments and questions on the first fault handling patch=20
are resolved before I look at this one.

Thanks,
Nick

>=20
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/vas-fault.c | 115 +++++++++++++++++++++++=
++++++
>  1 file changed, 115 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/pl=
atforms/powernv/vas-fault.c
> index 1c6d5cc..6eceac5d 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/kthread.h>
> +#include <linux/sched/signal.h>
>  #include <linux/mmu_context.h>
>  #include <asm/icswx.h>
> =20
> @@ -26,6 +27,119 @@
>  #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
> =20
>  /*
> + * Update the CSB to indicate a translation error.
> + *
> + * If we are unable to update the CSB means copy_to_user failed due to
> + * invalid csb_addr, send a signal to the process.
> + *
> + * Remaining settings in the CSB are based on wait_for_csb() of
> + * NX-GZIP.
> + */
> +static void update_csb(struct vas_window *window,
> +			struct coprocessor_request_block *crb)
> +{
> +	struct coprocessor_status_block csb;
> +	struct kernel_siginfo info;
> +	struct task_struct *tsk;
> +	void __user *csb_addr;
> +	struct pid *pid;
> +	int rc;
> +
> +	/*
> +	 * NX user space windows can not be opened for task->mm=3DNULL
> +	 * and faults will not be generated for kernel requests.
> +	 */
> +	if (WARN_ON_ONCE(!window->mm || !window->user_win))
> +		return;
> +
> +	csb_addr =3D (void __user *)be64_to_cpu(crb->csb_addr);
> +
> +	memset(&csb, 0, sizeof(csb));
> +	csb.cc =3D CSB_CC_TRANSLATION;
> +	csb.ce =3D CSB_CE_TERMINATION;
> +	csb.cs =3D 0;
> +	csb.count =3D 0;
> +
> +	/*
> +	 * NX operates and returns in BE format as defined CRB struct.
> +	 * So return fault_storage_addr in BE as NX pastes in FIFO and
> +	 * expects user space to convert to CPU format.
> +	 */
> +	csb.address =3D crb->stamp.nx.fault_storage_addr;
> +	csb.flags =3D 0;
> +
> +	pid =3D window->pid;
> +	tsk =3D get_pid_task(pid, PIDTYPE_PID);
> +	/*
> +	 * Send window will be closed after processing all NX requests
> +	 * and process exits after closing all windows. In multi-thread
> +	 * applications, thread may not exists, but does not close FD
> +	 * (means send window) upon exit. Parent thread (tgid) can use
> +	 * and close the window later.
> +	 * pid and mm references are taken when window is opened by
> +	 * process (pid). So tgid is used only when child thread opens
> +	 * a window and exits without closing it in multithread tasks.
> +	 */
> +	if (!tsk) {
> +		pid =3D window->tgid;
> +		tsk =3D get_pid_task(pid, PIDTYPE_PID);
> +		/*
> +		 * Parent thread will be closing window during its exit.
> +		 * So should not get here.
> +		 */
> +		if (WARN_ON_ONCE(!tsk))
> +			return;
> +	}
> +
> +	/* Return if the task is exiting. */
> +	if (tsk->flags & PF_EXITING) {
> +		put_task_struct(tsk);
> +		return;
> +	}
> +
> +	use_mm(window->mm);
> +	rc =3D copy_to_user(csb_addr, &csb, sizeof(csb));
> +	/*
> +	 * User space polls on csb.flags (first byte). So add barrier
> +	 * then copy first byte with csb flags update.
> +	 */
> +	if (!rc) {
> +		csb.flags =3D CSB_V;
> +		smp_mb();
> +		rc =3D copy_to_user(csb_addr, &csb, sizeof(u8));
> +	}
> +	unuse_mm(window->mm);
> +	put_task_struct(tsk);
> +
> +	/* Success */
> +	if (!rc)
> +		return;
> +
> +	pr_debug("Invalid CSB address 0x%p signalling pid(%d)\n",
> +			csb_addr, pid_vnr(pid));
> +
> +	clear_siginfo(&info);
> +	info.si_signo =3D SIGSEGV;
> +	info.si_errno =3D EFAULT;
> +	info.si_code =3D SEGV_MAPERR;
> +	info.si_addr =3D csb_addr;
> +
> +	/*
> +	 * process will be polling on csb.flags after request is sent to
> +	 * NX. So generally CSB update should not fail except when an
> +	 * application does not follow the process properly. So an error
> +	 * message will be displayed and leave it to user space whether
> +	 * to ignore or handle this signal.
> +	 */
> +	rcu_read_lock();
> +	rc =3D kill_pid_info(SIGSEGV, &info, pid);
> +	rcu_read_unlock();
> +
> +	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
> +			pid_vnr(pid), rc);
> +}
> +
> +/*
>   * Process valid CRBs in fault FIFO.
>   */
>  irqreturn_t vas_fault_thread_fn(int irq, void *data)
> @@ -111,6 +225,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
>  			return IRQ_HANDLED;
>  		}
> =20
> +		update_csb(window, crb);
>  	} while (true);
>  }
> =20
> --=20
> 1.8.3.1
>=20
>=20
>=20
>=20
=
