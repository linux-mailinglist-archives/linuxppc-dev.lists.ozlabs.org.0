Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA90C18EE09
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 03:39:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lz9q55j3zDqcy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 13:39:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pxcbo8DF; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lz7p2bJKzDqfk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 13:37:56 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id u68so6763591pfb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 19:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=wrYmM30/Ou+H+RQn0BuEipFA2fcaLO8uUBBF0hGw8gE=;
 b=pxcbo8DFXNLhrafQ/ZkB4E3qMB2U15jweqfbtM+oFAgFsbMjl9QKiFm/bzU4pA35of
 pR4mjt/lRLGZuJCLYuzeF3MNqeut1jXEvJ8qu/xb/Ph5BUm3OAJpAfL1XBO9ZwASk4c5
 NM/OoyDqOzHhTLSrrNJtH3sSAFIGrHEVEjFk6UWcXxvZbHt3ZPenjJNe9Buq55Cp2zDh
 RNLpIdk7azPttFD+AoHaV5evlCAf5j63Fs4hOGDn/mRVZACaMDmZ/9jOaxE7/5PaTbKE
 nz63J5fnzXjBXC0RLzlogtIzhEaPlGH80SFSalHrZ802h9Pawi15gx7ntiP0yR92Rtk4
 t/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=wrYmM30/Ou+H+RQn0BuEipFA2fcaLO8uUBBF0hGw8gE=;
 b=hsw3UPkodqO5EoezA6qwCNCH0lrU8ou8NzMdsXxReTReqsI+NtQyl0ZB05ETpXYjzF
 dFe7LEHZpMsVG5yfc8fwS6JfaI/ilYVZydoikv32HmZA7coYEz/LsDvtRYutFzSFwDUK
 XbGenMUAjkFDShsmoKN94ulk/IVbbgFZbNcEiWgJatRwgFv3lv2Aiuic3T3ZvsfCCyF2
 ARH3sty58vYGMLSf887xbviC2Y2ki5J/FgjYTTad5icJ+0xZMwG+lpNzEpVuxorCoFb8
 pJ/RQTRHaaTZgxSI4IZeHUUupZP1kl5+kz9n+9HgayzaciuZ6gBV0bc7dlz0O70LFfP5
 9saw==
X-Gm-Message-State: ANhLgQ2RWPk4CYUQjMg4b3oahRBrucV7Utj+V4RoNZn17MAS9kbjErqz
 X+H33LXZi906OWY3x2Iqvpo=
X-Google-Smtp-Source: ADFU+vtOAgZZnF/33v0BhBBcRGccNjKNntwtxasOGsQNZbrNflvk8a6t4GkAFKaIEIf7jG/3iOhOvw==
X-Received: by 2002:a62:7c8b:: with SMTP id
 x133mr21461221pfc.229.1584931074250; 
 Sun, 22 Mar 2020 19:37:54 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id s14sm10885666pgl.4.2020.03.22.19.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 19:37:53 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:34:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v8 08/14] powerpc/vas: Take reference to PID and mm for
 user space windows
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598613.9256.15257.camel@hbabu-laptop>
In-Reply-To: <1584598613.9256.15257.camel@hbabu-laptop>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584930278.h2919cnl67.astroid@bobo.none>
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

Haren Myneni's on March 19, 2020 4:16 pm:
>=20
> When process opens a window, its pid and tgid will be saved in vas_window
> struct. This window will be closed when the process exits. Kernel handles
> NX faults by updating CSB or send SEGV signal to pid if user space csb_ad=
dr
> is invalid.

Bit of a nitpick, but can you use articles consistently ("the", "a")? I
won't keep nitpicking changelogs but I think they could be made easier=20
to read. I'm happy to help proof read and suggest things offline when=20
you're happy with the technical content of them, let me know.

>=20
> In multi-thread applications, a window can be opened by child thread, but
> it will not be closed when this thread exits. Expects parent to clean up
> all resources including NX windows. Child thread can send requests using
> this window and can be killed before they are completed. But the pid
> assigned to this thread can be reused for other task while requests are
> pending. If the csb_addr passed in these requests is invalid, kernel will
> end up sending signal to the wrong task.
>=20
> To prevent reusing the pid, take references to pid and mm when the window
> is opened and release them during window close.

We went over this together a while back, but task management isn't=20
something I look at every day and it's complicated and easy to introduce
bugs. I suggest if we can get the changelog and comments written well
and understandable for someone who does not know or care about vas,=20
then cc linux-kernel and the maintainers, and hopefully someone will=20
take a look. It's not a large patch so if assumptions and concurrency
etc is documented, then it shouldn't be too much work.

Thanks,
Nick

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/vas-debug.c  |  2 +-
>  arch/powerpc/platforms/powernv/vas-window.c | 53 +++++++++++++++++++++++=
+++---
>  arch/powerpc/platforms/powernv/vas.h        |  9 ++++-
>  3 files changed, 57 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/powernv/vas-debug.c b/arch/powerpc/pl=
atforms/powernv/vas-debug.c
> index 09e63df..ef9a717 100644
> --- a/arch/powerpc/platforms/powernv/vas-debug.c
> +++ b/arch/powerpc/platforms/powernv/vas-debug.c
> @@ -38,7 +38,7 @@ static int info_show(struct seq_file *s, void *private)
> =20
>  	seq_printf(s, "Type: %s, %s\n", cop_to_str(window->cop),
>  					window->tx_win ? "Send" : "Receive");
> -	seq_printf(s, "Pid : %d\n", window->pid);
> +	seq_printf(s, "Pid : %d\n", vas_window_pid(window));
> =20
>  unlock:
>  	mutex_unlock(&vas_mutex);
> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/p=
latforms/powernv/vas-window.c
> index acb6a22..e7641a5 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -12,6 +12,8 @@
>  #include <linux/log2.h>
>  #include <linux/rcupdate.h>
>  #include <linux/cred.h>
> +#include <linux/sched/mm.h>
> +#include <linux/mmu_context.h>
>  #include <asm/switch_to.h>
>  #include <asm/ppc-opcode.h>
>  #include "vas.h"
> @@ -876,8 +878,6 @@ struct vas_window *vas_rx_win_open(int vasid, enum va=
s_cop_type cop,
>  	rxwin->user_win =3D rxattr->user_win;
>  	rxwin->cop =3D cop;
>  	rxwin->wcreds_max =3D rxattr->wcreds_max ?: VAS_WCREDS_DEFAULT;
> -	if (rxattr->user_win)
> -		rxwin->pid =3D task_pid_vnr(current);
> =20
>  	init_winctx_for_rxwin(rxwin, rxattr, &winctx);
>  	init_winctx_regs(rxwin, &winctx);
> @@ -1027,7 +1027,6 @@ struct vas_window *vas_tx_win_open(int vasid, enum =
vas_cop_type cop,
>  	txwin->tx_win =3D 1;
>  	txwin->rxwin =3D rxwin;
>  	txwin->nx_win =3D txwin->rxwin->nx_win;
> -	txwin->pid =3D attr->pid;
>  	txwin->user_win =3D attr->user_win;
>  	txwin->wcreds_max =3D attr->wcreds_max ?: VAS_WCREDS_DEFAULT;
> =20
> @@ -1068,8 +1067,43 @@ struct vas_window *vas_tx_win_open(int vasid, enum=
 vas_cop_type cop,
>  			goto free_window;
>  	}
> =20
> -	set_vinst_win(vinst, txwin);
> +	if (txwin->user_win) {
> +		/*
> +		 * Window opened by child thread may not be closed when
> +		 * it exits. So take reference to its pid and release it
> +		 * when the window is free by parent thread.
> +		 * Acquire a reference to the task's pid to make sure
> +		 * pid will not be re-used - needed only for multithread
> +		 * applications.
> +		 */
> +		txwin->pid =3D get_task_pid(current, PIDTYPE_PID);
> +		/*
> +		 * Acquire a reference to the task's mm.
> +		 */
> +		txwin->mm =3D get_task_mm(current);
> =20
> +		if (!txwin->mm) {
> +			put_pid(txwin->pid);
> +			pr_err("VAS: pid(%d): mm_struct is not found\n",
> +					current->pid);
> +			rc =3D -EPERM;
> +			goto free_window;
> +		}
> +
> +		mmgrab(txwin->mm);
> +		mmput(txwin->mm);
> +		mm_context_add_copro(txwin->mm);
> +		/*
> +		 * Process closes window during exit. In the case of
> +		 * multithread application, child can open window and
> +		 * can exit without closing it. Expects parent thread
> +		 * to use and close the window. So do not need to take
> +		 * pid reference for parent thread.
> +		 */
> +		txwin->tgid =3D find_get_pid(task_tgid_vnr(current));
> +	}
> +
> +	set_vinst_win(vinst, txwin);
>  	return txwin;
> =20
>  free_window:
> @@ -1266,8 +1300,17 @@ int vas_win_close(struct vas_window *window)
>  	poll_window_castout(window);
> =20
>  	/* if send window, drop reference to matching receive window */
> -	if (window->tx_win)
> +	if (window->tx_win) {
> +		if (window->user_win) {
> +			/* Drop references to pid and mm */
> +			put_pid(window->pid);
> +			if (window->mm) {
> +				mm_context_remove_copro(window->mm);
> +				mmdrop(window->mm);
> +			}
> +		}
>  		put_rx_win(window->rxwin);
> +	}
> =20
>  	vas_window_free(window);
> =20
> diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platform=
s/powernv/vas.h
> index 310b8a0..16aa8ec 100644
> --- a/arch/powerpc/platforms/powernv/vas.h
> +++ b/arch/powerpc/platforms/powernv/vas.h
> @@ -353,7 +353,9 @@ struct vas_window {
>  	bool user_win;		/* True if user space window */
>  	void *hvwc_map;		/* HV window context */
>  	void *uwc_map;		/* OS/User window context */
> -	pid_t pid;		/* Linux process id of owner */
> +	struct pid *pid;	/* Linux process id of owner */
> +	struct pid *tgid;	/* Thread group ID of owner */
> +	struct mm_struct *mm;	/* Linux process mm_struct */
>  	int wcreds_max;		/* Window credits */
> =20
>  	char *dbgname;
> @@ -431,6 +433,11 @@ struct vas_winctx {
>  extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst=
,
>  						uint32_t pswid);
> =20
> +static inline int vas_window_pid(struct vas_window *window)
> +{
> +	return pid_vnr(window->pid);
> +}
> +
>  static inline void vas_log_write(struct vas_window *win, char *name,
>  			void *regptr, u64 val)
>  {
> --=20
> 1.8.3.1
>=20
>=20
>=20
>=20
=
