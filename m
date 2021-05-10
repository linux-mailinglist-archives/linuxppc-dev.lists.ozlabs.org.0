Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C94377B93
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 07:37:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdqZV5cKFz3068
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 15:37:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oAGq8/YN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oAGq8/YN; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdqZ13bbnz2yXj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 15:37:12 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id k19so12845669pfu.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 22:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=NzhVoKmqHHMnG/Q9A4Jmkq1w2M/F5uJL8CFCHkIVomU=;
 b=oAGq8/YNiKxfb6pY9Y3zRRtodpHVOEAWPHq7vSS14CwLEyOBluZA46fh7dOhGYT+bL
 pvuqHl8GVzE1X2txchQvz47kvrm5KMToB8BRnB3oNopl7pcNd+WCpQqf5UWfXoUEPArk
 XAFXzDkz+q7Jrz0D4ittZawRyTURRx3scofHdOBLdjgq0gET8XnQdAIPJzfpdvLoBMgA
 Qqlex24ZQhMSHS6IenWWBAtsQHVM7mkVMAM6nvJlCR3Sb7TvCdXNY1J0Vho/GiMmk68a
 inxkmictwgpgqqAE9zJnq5EE2eHtUyBb8ENQT8ONACLPNbmDprhdGQ0gY286iGwk026K
 o5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NzhVoKmqHHMnG/Q9A4Jmkq1w2M/F5uJL8CFCHkIVomU=;
 b=e65vQalgfEKZDC/CMSghtU39jyEAvIplTqtCOCKXJ9GXI3yJSwWnGojOI7wtLeiiSq
 OBrS8RcxsJDNih6qvk+GF5POzjxrH939FMDvNGjwI5aP1+nhFzwL7crqUAYuJ/E4/aoW
 +wmBqYlrjlO3lEUQRj6+SzK4EySqAbZRmyQXc6ExPX4oHHLwGdxxzYO64cC/+DnuWwVZ
 xhbVN8oRMX6AJWVmeeGhsy7f7+acTKSZf+UkPEHZ+GRV3wGyiBMVvA9LS2JkUHnKoSVv
 vF6T65FHc9Y7m9ZpspvQK5TkyAFyJeSKvQo/CFQLgYuf6quctP+H005b+gU3iMRhd91r
 /TXg==
X-Gm-Message-State: AOAM530yVicM9fdRE3xAYl2d0byM/+cPS6cMs0ZDJkDLlnm0sFv+5gRC
 whMzbY6caHly9llqLYTsujw=
X-Google-Smtp-Source: ABdhPJxXyDHeMEDijOyuVYIZTrDmb65nMkxxzTi6sSSfK2y6F7Jgim1y2V62evoAVjAjmx/TzF3xUQ==
X-Received: by 2002:a65:420d:: with SMTP id c13mr23554177pgq.370.1620625030390; 
 Sun, 09 May 2021 22:37:10 -0700 (PDT)
Received: from localhost (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id 1sm9903754pfv.159.2021.05.09.22.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 22:37:10 -0700 (PDT)
Date: Mon, 10 May 2021 15:37:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3 PATCH 04/16] powerpc/vas: Move update_csb/dump_crb to common
 book3s platform
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <f20654f88f746fe1dd26d27a783a04ae036e8833.camel@linux.ibm.com>
In-Reply-To: <f20654f88f746fe1dd26d27a783a04ae036e8833.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620624520.2d55hpp9yh.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of April 18, 2021 7:03 am:
>=20
> NX issues an interrupt when sees fault on user space buffer.

If a coprocessor encounters an error translating an address, the VAS=20
will cause an interrupt in the host.


> The
> kernel processes the fault by updating CSB. This functionality is
> same for both powerNV and pseries. So this patch moves these
> functions to common vas-api.c and the actual functionality is not
> changed.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h             |   3 +
>  arch/powerpc/platforms/book3s/vas-api.c    | 146 ++++++++++++++++++-
>  arch/powerpc/platforms/powernv/vas-fault.c | 155 ++-------------------
>  3 files changed, 157 insertions(+), 147 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 2daaa1a2a9a9..66bf8fb1a1be 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -210,4 +210,7 @@ int vas_register_coproc_api(struct module *mod, enum =
vas_cop_type cop_type,
>  void vas_unregister_coproc_api(void);
> =20
>  int vas_reference_task(struct vas_win_task *vtask);
> +void vas_update_csb(struct coprocessor_request_block *crb,
> +		    struct vas_win_task *vtask);
> +void vas_dump_crb(struct coprocessor_request_block *crb);
>  #endif /* __ASM_POWERPC_VAS_H */
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index d98caa734154..dc131b2e4acd 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -111,6 +111,150 @@ int vas_reference_task(struct vas_win_task *vtask)
>  	return 0;
>  }
> =20
> +/*
> + * Update the CSB to indicate a translation error.
> + *
> + * User space will be polling on CSB after the request is issued.
> + * If NX can handle the request without any issues, it updates CSB.
> + * Whereas if NX encounters page fault, the kernel will handle the
> + * fault and update CSB with translation error.
> + *
> + * If we are unable to update the CSB means copy_to_user failed due to
> + * invalid csb_addr, send a signal to the process.
> + */
> +void vas_update_csb(struct coprocessor_request_block *crb,
> +		    struct vas_win_task *vtask)
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
> +	if (WARN_ON_ONCE(!vtask->mm))
> +		return;
> +
> +	csb_addr =3D (void __user *)be64_to_cpu(crb->csb_addr);
> +
> +	memset(&csb, 0, sizeof(csb));
> +	csb.cc =3D CSB_CC_FAULT_ADDRESS;
> +	csb.ce =3D CSB_CE_TERMINATION;
> +	csb.cs =3D 0;
> +	csb.count =3D 0;
> +
> +	/*
> +	 * NX operates and returns in BE format as defined CRB struct.
> +	 * So saves fault_storage_addr in BE as NX pastes in FIFO and
> +	 * expects user space to convert to CPU format.
> +	 */
> +	csb.address =3D crb->stamp.nx.fault_storage_addr;
> +	csb.flags =3D 0;
> +
> +	pid =3D vtask->pid;
> +	tsk =3D get_pid_task(pid, PIDTYPE_PID);
> +	/*
> +	 * Process closes send window after all pending NX requests are
> +	 * completed. In multi-thread applications, a child thread can
> +	 * open a window and can exit without closing it. May be some
> +	 * requests are pending or this window can be used by other
> +	 * threads later. We should handle faults if NX encounters
> +	 * pages faults on these requests. Update CSB with translation
> +	 * error and fault address. If csb_addr passed by user space is
> +	 * invalid, send SEGV signal to pid saved in window. If the
> +	 * child thread is not running, send the signal to tgid.
> +	 * Parent thread (tgid) will close this window upon its exit.
> +	 *
> +	 * pid and mm references are taken when window is opened by
> +	 * process (pid). So tgid is used only when child thread opens
> +	 * a window and exits without closing it.
> +	 */
> +	if (!tsk) {
> +		pid =3D vtask->tgid;
> +		tsk =3D get_pid_task(pid, PIDTYPE_PID);
> +		/*
> +		 * Parent thread (tgid) will be closing window when it
> +		 * exits. So should not get here.
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
> +	kthread_use_mm(vtask->mm);
> +	rc =3D copy_to_user(csb_addr, &csb, sizeof(csb));
> +	/*
> +	 * User space polls on csb.flags (first byte). So add barrier
> +	 * then copy first byte with csb flags update.
> +	 */
> +	if (!rc) {
> +		csb.flags =3D CSB_V;
> +		/* Make sure update to csb.flags is visible now */
> +		smp_mb();
> +		rc =3D copy_to_user(csb_addr, &csb, sizeof(u8));
> +	}
> +	kthread_unuse_mm(vtask->mm);
> +	put_task_struct(tsk);
> +
> +	/* Success */
> +	if (!rc)
> +		return;
> +
> +
> +	pr_debug("Invalid CSB address 0x%p signalling pid(%d)\n",
> +			csb_addr, pid_vnr(pid));
> +
> +	clear_siginfo(&info);
> +	info.si_signo =3D SIGSEGV;
> +	info.si_errno =3D EFAULT;
> +	info.si_code =3D SEGV_MAPERR;
> +	info.si_addr =3D csb_addr;
> +	/*
> +	 * process will be polling on csb.flags after request is sent to
> +	 * NX. So generally CSB update should not fail except when an
> +	 * application passes invalid csb_addr. So an error message will
> +	 * be displayed and leave it to user space whether to ignore or
> +	 * handle this signal.
> +	 */
> +	rcu_read_lock();
> +	rc =3D kill_pid_info(SIGSEGV, &info, pid);
> +	rcu_read_unlock();
> +
> +	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
> +			pid_vnr(pid), rc);
> +}
> +
> +void vas_dump_crb(struct coprocessor_request_block *crb)
> +{
> +	struct data_descriptor_entry *dde;
> +	struct nx_fault_stamp *nx;
> +
> +	dde =3D &crb->source;
> +	pr_devel("SrcDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
> +		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
> +		dde->count, dde->index, dde->flags);
> +
> +	dde =3D &crb->target;
> +	pr_devel("TgtDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
> +		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
> +		dde->count, dde->index, dde->flags);
> +
> +	nx =3D &crb->stamp.nx;
> +	pr_devel("NX Stamp: PSWID 0x%x, FSA 0x%llx, flags 0x%x, FS 0x%x\n",
> +		be32_to_cpu(nx->pswid),
> +		be64_to_cpu(crb->stamp.nx.fault_storage_addr),
> +		nx->flags, nx->fault_status);
> +}
> +
>  static int coproc_open(struct inode *inode, struct file *fp)
>  {
>  	struct coproc_instance *cp_inst;
> @@ -272,7 +416,7 @@ static struct file_operations coproc_fops =3D {
>   * extended to other coprocessor types later.
>   */
>  int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_ty=
pe,
> -			const char *name, struct vas_user_win_ops *vops)
> +			    const char *name, struct vas_user_win_ops *vops)
>  {
>  	int rc =3D -EINVAL;
>  	dev_t devno;

This change should go back where you added the code. But you've=20
brought back vas_register_corpoc_api? In... patch 2, by the looks
which just renames them back. Perhaps think about keeping the
vas_register_coproc_api in patch 1 in that case, and just adding
the new powernv specific wrapper over it.

But for this patch,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

