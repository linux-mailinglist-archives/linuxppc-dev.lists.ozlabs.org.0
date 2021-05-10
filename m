Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BECCA377B85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 07:28:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdqNQ5sDZz3023
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 15:28:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bH5pmDBc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bH5pmDBc; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdqMx5gmbz2yXK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 15:28:28 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id p4so12865859pfo.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 22:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=2VbFkIdqBQxH26BVP9oIWdsN+5IFXGUTwRy6ERH1Tpw=;
 b=bH5pmDBc8pBK2qVKWRfnveZ5sLIOXxVMTvJTMH01IsGC1vGiGU1iFxURm99zmbIau5
 vYok6oysBrq7ez+F9eIOkMZr9KWKn1Ovj9x8ZGkKgWSAStVTv4/n4dlsCISoQSGgYhYT
 w00V9dtjLyLgWlKsMNYsvSxsC5UIeJgkyRXRcDRySz9yZQNmG/49AvU1YDMaxokoDxLt
 KlOsVRIOkKD5xYngehTRUXJxytsom2PqGEGmik9lTDF5ow6x6ueHG90Du+kcddX63zv8
 s3Ys//P9PyA2j6ldOpu+gcEtK0yqNj4oUXi5LDqeugJwFtzXqhDmmuc+OE1nhAgaInXh
 dmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=2VbFkIdqBQxH26BVP9oIWdsN+5IFXGUTwRy6ERH1Tpw=;
 b=EVMYeo+p8+9rr9KCcIdc+o3gsr4CJnNWGfx0FD80agUqPg/R3namf4zJsu3J1VX4mc
 L+ABg6Gx6sGivTQ0nK2XOjT6VluxBxy7HNNRsN+oFis8K4jmlNhH7URMYwOwh2W/w3J0
 ix//YU2P6QEFtEhnnLPf/ihn301ZtQ4Ab/VrDqz9yj7T4AibTkErV6b9C4g2XCscLJ5r
 HhQ+DzyPaJXEJHheGsXxQTrSza5IlKwinMipqQ7+0ZRD+QtbAqOH/+lF0TdeyWbNcGoB
 LY+YjDglFL/4b98NvCYHcnLYAqK63umTP9l3jJaQyAOJDtjjyRL7qL57FxxG+GqYKeud
 nKzw==
X-Gm-Message-State: AOAM533sEFKS4EKA7/Nbm+ylEWs4ULA96CSEBrgSYJMCrKuNGISa9zrs
 JZwBtxgL+dP5dV8OmiDfOjU=
X-Google-Smtp-Source: ABdhPJyW3WImWl4HiUkBRa1xA9WOXxfEAHMN2f8/tsEIXOhS+5hd7g42J5+ohxHnSzjr6TTyKxElKw==
X-Received: by 2002:a63:8f17:: with SMTP id n23mr23748027pgd.82.1620624505405; 
 Sun, 09 May 2021 22:28:25 -0700 (PDT)
Received: from localhost (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id n8sm10018704pgm.7.2021.05.09.22.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 22:28:25 -0700 (PDT)
Date: Mon, 10 May 2021 15:28:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3 PATCH 03/16] powerpc/vas: Create take/drop task reference
 functions
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <3d634fb22a1d3d87f3172b23414a48650fc9a366.camel@linux.ibm.com>
In-Reply-To: <3d634fb22a1d3d87f3172b23414a48650fc9a366.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620624047.yy8sqcrk40.astroid@bobo.none>
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
> Take task reference when each window opens and drops during close.
> This functionality is needed for powerNV and pseries. So this patch
> defines the existing code as functions in common book3s platform
> vas-api.c
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h              | 20 ++++++++
>  arch/powerpc/platforms/book3s/vas-api.c     | 51 ++++++++++++++++++
>  arch/powerpc/platforms/powernv/vas-fault.c  | 10 ++--
>  arch/powerpc/platforms/powernv/vas-window.c | 57 ++-------------------
>  arch/powerpc/platforms/powernv/vas.h        |  6 +--
>  5 files changed, 83 insertions(+), 61 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 6bbade60d8f4..2daaa1a2a9a9 100644
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
> =20
> @@ -60,6 +63,22 @@ struct vas_user_win_ops {
>  	int (*close_win)(void *);
>  };
> =20
> +struct vas_win_task {
> +	struct pid *pid;	/* Thread group ID of owner */
> +	struct pid *tgid;	/* Linux process mm_struct */
> +	struct mm_struct *mm;	/* Linux process mm_struct */
> +};

Looks okay, happy with struct vas_win_task? (and vas_user_win_ops)?

I'd be happier to have everything related to vas windows prefixed with=20
vas_window_ consistently, and have _user be present always for userspace
windows, but you have to read and type it.

> +
> +static inline void vas_drop_reference_task(struct vas_win_task *task)

This is not dropping a reference task, but a task reference. And it's=20
not really a task reference as far as Linux understands, but a
reference on pid (not task) and mm related to an open vas window. And
specifically a user window (with corresponding vas_user_win_ops).

Could it be called a 'struct vas_window_user_ref' instead?

Thanks,
Nick

> +{
> +	/* Drop references to pid and mm */
> +	put_pid(task->pid);
> +	if (task->mm) {
> +		mm_context_remove_vas_window(task->mm);
> +		mmdrop(task->mm);
> +	}
