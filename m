Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3950E3A5B7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 04:12:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3FML65H4z3095
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 12:12:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ot2i+lwA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ot2i+lwA; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3FLt1DhJz2ymM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 12:11:50 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso9610054pjx.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 19:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=v4Fu4xxoDiWhZlH1o8ZlqZuR7cYM6Y8M/w4ESBKxI2k=;
 b=ot2i+lwAav7/lXoGb0mcnPRLXIp3V9XIixu9sg5RpjuhXl9dX20/jtczYdpVW+TfnI
 T7WyuZuKMAYuZdz8G0eBvPXKI+qlSBH/We324I4lS8TQSDmL+t2eTrIwMtePnmAO+nFt
 3LCrYiJL4717KDHQpGzfraX2xIgOQSXcL7vsPrxcTofPNS6iskeKi7iX4pO2PmzEk8G4
 hwtXjm3CxquGFn6eplMI6MxXr9UUMK+eTNV7r3v5z6GJm3im+6F7Z5s6klcRno24jClu
 J/XUCwmkauW7+bkMUGx95PotYYrBbQ0UOBh2+PeWyHyX6Dv1JRRAfbBP+sEiIsLoddYI
 vV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=v4Fu4xxoDiWhZlH1o8ZlqZuR7cYM6Y8M/w4ESBKxI2k=;
 b=tn+q8/hIjN9//H1GeMm48q55cGFWjYJPx04lffsx+FmER8rfNJD0YbDTGfAaa49Hhi
 AjPamwaQG6E8xz8BDDxwM2ftlbBOSYngfA1PnKDFdvt8RNl5dbRiSQ1O+oe3EOHV5MZ2
 zrs5/pIw4ZAMenLXzZc0TIKUCqq4xJ2uv4BvaW5+/LwwvZR0owPcrdI9lfA55CQ96fX+
 1srJwi9onjoVSpYgilGk0XdNXzhvEdPVac+CcKVEm9ApW5BpMJnaq/Bp7vEGaCY0lAAc
 d6bG8m6RQYmqgVADTZIzixtWMrND4202YzzGlU+bIjY3ec2oMIU8GV2PCgD43Px7/dzv
 o9zA==
X-Gm-Message-State: AOAM533lI0/AOXyfzjBC/5sSPHYtjswHvmUNfXbVVufgdP5/YHudincb
 07YeqC3ahN720zmDPCF+jUQ=
X-Google-Smtp-Source: ABdhPJyvdMC56vD9BKqOT9vwycvqRSg53YgaRKzDvMSXqee7ZI1q656wEAqUjMGc8yiO9Nmzr4Xhxg==
X-Received: by 2002:a17:90a:4503:: with SMTP id
 u3mr16743381pjg.210.1623636706302; 
 Sun, 13 Jun 2021 19:11:46 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id y66sm11176653pfb.91.2021.06.13.19.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 19:11:46 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:11:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 01/17] powerpc/powernv/vas: Release reference to tgid
 during window close
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <4c769385e96a9b7022a4fd22938310550ceba5e1.camel@linux.ibm.com>
In-Reply-To: <4c769385e96a9b7022a4fd22938310550ceba5e1.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623636630.ja53s1iki0.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 13, 2021 8:54 pm:
>=20
> The kernel handles the NX fault by updating CSB or sending
> signal to process. In multithread applications, children can
> open VAS windows and can exit without closing them. But the
> parent can continue to send NX requests with these windows. To
> prevent pid reuse, reference will be taken on pid and tgid
> when the window is opened and release them during window close.
>=20
> The current code is not releasing the tgid reference which can
> cause pid leak and this patch fixes the issue.
>=20
> Fixes: db1c08a740635 ("powerpc/vas: Take reference to PID and mm for user=
 space windows")
> Cc: stable@vger.kernel.org # 5.8+
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reported-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> ---
>  arch/powerpc/platforms/powernv/vas-window.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/p=
latforms/powernv/vas-window.c
> index 5f5fe63a3d1c..7ba0840fc3b5 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -1093,9 +1093,9 @@ struct vas_window *vas_tx_win_open(int vasid, enum =
vas_cop_type cop,
>  		/*
>  		 * Process closes window during exit. In the case of
>  		 * multithread application, the child thread can open
> -		 * window and can exit without closing it. Expects parent
> -		 * thread to use and close the window. So do not need
> -		 * to take pid reference for parent thread.
> +		 * window and can exit without closing it. so takes tgid
> +		 * reference until window closed to make sure tgid is not
> +		 * reused.
>  		 */
>  		txwin->tgid =3D find_get_pid(task_tgid_vnr(current));
>  		/*
> @@ -1339,8 +1339,9 @@ int vas_win_close(struct vas_window *window)
>  	/* if send window, drop reference to matching receive window */
>  	if (window->tx_win) {
>  		if (window->user_win) {
> -			/* Drop references to pid and mm */
> +			/* Drop references to pid. tgid and mm */
>  			put_pid(window->pid);
> +			put_pid(window->tgid);
>  			if (window->mm) {
>  				mm_context_remove_vas_window(window->mm);
>  				mmdrop(window->mm);
> --=20
> 2.18.2
>=20
>=20
>=20
