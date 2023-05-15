Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65600702374
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 07:47:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKT0P3rJNz3f7L
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 15:47:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sUUrx9ne;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sUUrx9ne;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKSzW0X5nz2xvF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 15:46:29 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5307502146aso3161728a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 22:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684129584; x=1686721584;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJuPoS2sV4i6aL/f7rsukx7YhFh5BAPZ2omycG8O9NU=;
        b=sUUrx9neXpbkgbuSLStZbtkV/4rpHkScmBbosnxtyhapqrpHKTXGvQRh8K3ibCdQRE
         3hDb9eRTU3lMVf8ygJNjqUT22su0wpwBA6r5lkuwfLdUwTlHnw4CeYKly5VooFZYgGO0
         bkRYZD5gA/sesM0TSMZaVbirf5gSXqZZuvavkW4QsKw6flPI8zCtxkiM5OlHd2yJwp8c
         HMdq0DFJaTGOnV7wPJq6lv30WT6dy2ux/ni9jFoSG0nbztpPet9B3EFnPzfrfgYYpeLw
         bpQmDwrxGT3F/Tw0e1+hboF2A6hIPuunVgMCTMExhXQ/MhE7mG4mJ5elVajI4qPm4dOA
         rhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129584; x=1686721584;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJuPoS2sV4i6aL/f7rsukx7YhFh5BAPZ2omycG8O9NU=;
        b=EIK7GurKsew44JmMZ1NL5hoSxZOZQnuaXexGN1Gcv3ILiBnQVjtxS8lnAqTbUpgR8K
         bosjzjsB5YqjE+wN1D4G91DXUpQDXoPfwFTvFhjO7vDIMw5B8GS2EbvQ2W0Zk3WCZFbg
         Jkjgk1QblO/K1KGLkAfoiZRWI6jZ+2C8+j149Ean0MTacI3owKVyfMqW6y5nHTBShu1P
         tn24PZo8zeFq7i729n6cvUjLYhNsdL9L/d5ek6Y2CDM7MdH/k//NIumiHeP1Iyhhqwc2
         nTBQIjBxbE94ksVbMsKpcaChQrCB+rvA3/w9o8uZHzduRx2DnNqJ/0hmzjEKIMtun5/G
         RQqw==
X-Gm-Message-State: AC+VfDxl3oaO7gCPjlSyiy5wTVk5EBVaCm18ZGxcoc6nip3gudV0ZlJB
	TnuKhqFHE9a6RKSyAJ9ALZI=
X-Google-Smtp-Source: ACHHUZ4tyUjP9Xuu84EhgEDAnF/0HsOMb9hEH6Lyz/rFkTT10beR2FnCX3pnKtxhiZWV0QUY/lXo4A==
X-Received: by 2002:a17:903:234b:b0:1ad:eeea:32d7 with SMTP id c11-20020a170903234b00b001adeeea32d7mr11971536plh.48.1684129584235;
        Sun, 14 May 2023 22:46:24 -0700 (PDT)
Received: from localhost ([1.146.119.84])
        by smtp.gmail.com with ESMTPSA id bc3-20020a170902930300b001aaf92130b2sm12415783plb.115.2023.05.14.22.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 22:46:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 15:46:17 +1000
Message-Id: <CSMM3YXOSM6H.1CTGIVEFVY6V3@wheely>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 02/11] powerpc: qspinlock: Enforce qnode writes prior
 to publishing to queue
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
 <20230510033117.1395895-3-rmclure@linux.ibm.com>
In-Reply-To: <20230510033117.1395895-3-rmclure@linux.ibm.com>
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
Cc: gautam@linux.ibm.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed May 10, 2023 at 1:31 PM AEST, Rohan McLure wrote:
> Annotate the release barrier and memory clobber (in effect, producing a
> compiler barrier) in the publish_tail_cpu call. These barriers have the
> effect of ensuring that qnode attributes are all written to prior to
> publish the node to the waitqueue.
>
> Even while the initial write to the 'locked' attribute is guaranteed to
> terminate prior to the node being visible, KCSAN still complains that
> the write is reorderable by the compiler. Issue a kcsan_release() to
> inform KCSAN of the release barrier contained in publish_tail_cpu().
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> v2: Remove extraneous compiler barrier, but annotate release-barrier
> contained in call publish_tail_cpu(), and include kcsan_release().
> ---
>  arch/powerpc/lib/qspinlock.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index b76c1f6acce5..253620979d0c 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -161,6 +161,8 @@ static __always_inline u32 publish_tail_cpu(struct qs=
pinlock *lock, u32 tail)
>  {
>  	u32 prev, tmp;
> =20
> +	kcsan_release();
> +
>  	asm volatile(
>  "\t"	PPC_RELEASE_BARRIER "						\n"
>  "1:	lwarx	%0,0,%2		# publish_tail_cpu			\n"
> @@ -570,6 +572,11 @@ static __always_inline void queued_spin_lock_mcs_que=
ue(struct qspinlock *lock, b
> =20
>  	tail =3D encode_tail_cpu(node->cpu);
> =20
> +	/*
> +	 * Assign all attributes of a node before it can be published.
> +	 * Issues an lwsync, serving as a release barrier, as well as a
> +	 * compiler barrier.
> +	 */
>  	old =3D publish_tail_cpu(lock, tail);

Possibly better to be with the publish function, hopefully the name
gives away it has a release barrier then store that makes it visible.
But that's nitpicking.

Thanks for the qspinlock fixes.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
