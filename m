Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C148B399921
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 06:27:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwXsx6Mwhz3090
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 14:27:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nlgSXqG4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nlgSXqG4; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwXsV1hZjz2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 14:26:37 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id n12so4115503pgs.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 21:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=hadN1zKWfMzs8CNVqhf3si3r1zptnb25lQyw1l4DEJo=;
 b=nlgSXqG4KLQpB0O0mupGwzaKX0KxGlZssCJFbzlrDZMaaJl7NGSLiG7dBfKx7Xlbc5
 cypvQXE0ODiFXHu3vK/TNLt57BRW7Fx1lmSWfkog+OflJ2qjPtaoU1QMvqqB6EX0U6Tp
 LZSj5SUzf54Mj/LwrEkNG9eqWV0eOZzLo/Wtn0YTWMRAEtlsTKSLPumDi40o/pgaOzLy
 7TSwcyXLkvPpNJzWw+gSWTo20R6ISEnKz+pbcwQuAVWbZv9+5XMTTIMTaEVS98RVtwCK
 N2td55lji2rY9LcHZAE8dm+9TZ3zPaTdmDOTu8pso2WV0Sf1Zfo2cBP7d0ESwgxaEt1r
 ciSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=hadN1zKWfMzs8CNVqhf3si3r1zptnb25lQyw1l4DEJo=;
 b=l/RlguKoAsgp5QlVzWjJWKCWMXUNLx49qfXvmu6JpM33aiKxon1VfB09OxNY8HXLiX
 9ljlYC6w9qBg6rVzGVViazpZ/alHQ+zhUeilkoe4xTJX4DrwZ2QE57CymfFPuulhF0Ht
 PKuTpsExGI5RgTXu68zYLqy73WEjlawZVp6RmXUhMWhfHG5+vlfADd49FuMV4gpHdB0n
 Ja/G5EC/sM81yISLNa2L+LTvHigQt8u9ghZlan1g/10a/8QJYIyA8jNNP3p/xHkCZn+u
 R+2K4quCzXD6sD/4rglPIB8BIk+pCCZzgvSX4CaN8k0hYtGHD7IBRdCZVvCrgAWEqA2F
 idHg==
X-Gm-Message-State: AOAM530cRpyU9MyiBYMw4np3u4dIaWaN3+7MKqZgU4q9t97hLCGuAiQr
 h0pSXpkkiQVheVIQu+wRkgw=
X-Google-Smtp-Source: ABdhPJw9xulYWMtCGTR8p5sCoVzQhygQRWw5b7lFmCWGeU36P/jdRGvSy6mz1tqOmNNUa+M/Xn7gAg==
X-Received: by 2002:a63:f615:: with SMTP id m21mr37851279pgh.282.1622694394117; 
 Wed, 02 Jun 2021 21:26:34 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id j12sm1158876pgs.83.2021.06.02.21.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 21:26:33 -0700 (PDT)
Date: Thu, 03 Jun 2021 14:26:28 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/16] powerpc/vas: Move update_csb/dump_crb to common
 book3s platform
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <b1c0661b5ff896b2ce7b1202a5e6efeb2dae68a8.camel@linux.ibm.com>
In-Reply-To: <b1c0661b5ff896b2ce7b1202a5e6efeb2dae68a8.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1622694146.br4czu7jza.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of May 21, 2021 7:32 pm:
> +
> +	pid =3D task_ref->pid;
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
> +		pid =3D task_ref->tgid;
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

Just as an aside, I know this is existing code, after this series it=20
might be good to think about factoring out this above chunk of code=20
(possibly +/- the kthread_use_mm() bit), and put it together with the=20
rest of the task/mm refcounting stuff.

Thanks,
Nick

> +
> +	kthread_use_mm(task_ref->mm);
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
> +	kthread_unuse_mm(task_ref->mm);
> +	put_task_struct(tsk);
> +
