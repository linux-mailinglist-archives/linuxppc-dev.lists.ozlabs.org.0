Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A1970238E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 07:51:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKT4j5s61z3cND
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 15:51:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hg3Xo3Fl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hg3Xo3Fl;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKT3v3btkz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 15:50:19 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso6450578a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 22:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684129817; x=1686721817;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMBDwhS9a31QvlVQIOBtYu2UDCJG7pWeuBhnEp9GO1c=;
        b=hg3Xo3Fl6W2sCM0cbHrJ3KBEDXvC3f7h/BpouNDBi79rjPjAvEYqQEylcW0ZAk10UM
         nqXasASyvCD4z/bLNPf7+8wqTKDnCnM2GpaMV0MVoCfzFoTPmbdaCuCgm10cDyqBmsw7
         5sB/E6BcO8DPDVhRL4P8sw/nFskvj1DkD2PSOb7b9dtWXSWsheYZQsfY6ufG0Xq3/xf+
         gTkaAlSnKLl33bf63YC2fnQufNtK7x4CJzcc6xo9ch7JvTuI6ADQXLvUrMFOyaK1aa0s
         ZrTYhuksvAf1Ze1fq64NAm8RiDLX4Uy5HIJka+fKM6R9fHAx4fKUEo2ZodJwRMKNiLh4
         ht8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129817; x=1686721817;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bMBDwhS9a31QvlVQIOBtYu2UDCJG7pWeuBhnEp9GO1c=;
        b=KbdIPC0pLsXQzdC3u/q//g230jF+zBqcwqgy/F8ADmsPf/6wbBjOBJ8PF7EdNR1vlz
         ArqCWR5zbVfZBjCVLZ30mcDuVgX8PDcNp0JGQdvzQ5N+ObExwcN6oqJ4Xy8I22G4xk+J
         03Zfrn8wmI9Hn3CdtbgNluITrh+t+eqJBDlbDmmf2lC1CruONMuD9hfoGmzqp11v7oDN
         +bSJXYbF2iOSfK5jA+A6o3dxleo+ugKKqVYUF6dF6AewxYwokim+VsaaFGPJ2BEOfUT5
         sx4MkY44qyEP4DT08dFLgzLAZ8i6g6EeqGoLXBvgOMzaF1VMkDYzf/s+BH7ODniGugFm
         lDzQ==
X-Gm-Message-State: AC+VfDzp9be7v8WvmZc8q9mdc4eOwS5SsxUWA/zX70RIwHDZ+VoLORx+
	P31WGFxam6alXJhglOE0iaoOkf2xRiY3Uw==
X-Google-Smtp-Source: ACHHUZ7tT9H7Or7mgSUcLQHPy1t7T2ks+kHsVfFhN4AVZnYKmmc7AVqXQVmOdVl16xPCd/i2mGvcjA==
X-Received: by 2002:a05:6a20:7f8a:b0:f5:c6e5:e65 with SMTP id d10-20020a056a207f8a00b000f5c6e50e65mr43583272pzj.7.1684129817431;
        Sun, 14 May 2023 22:50:17 -0700 (PDT)
Received: from localhost ([1.146.119.84])
        by smtp.gmail.com with ESMTPSA id y24-20020aa78558000000b00634a96493f7sm8556334pfn.128.2023.05.14.22.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 22:50:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 15:50:10 +1000
Message-Id: <CSMM6YE0FGF9.SG52DCRHZ35E@wheely>
Subject: Re: [PATCH v2 05/11] powerpc: Mark accesses to power_save callback
 in arch_cpu_idle
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
 <20230510033117.1395895-6-rmclure@linux.ibm.com>
In-Reply-To: <20230510033117.1395895-6-rmclure@linux.ibm.com>
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
> The power_save callback can be overwritten by another core at boot time.
> Specifically, null values will be replaced exactly once with the callback
> suitable for the particular platform (PowerNV / pseries lpars), making
> this value a good candidate for __ro_after_init.
>
> Even with this the case, KCSAN sees unmarked reads to the callback
> variable, and notices that unfortunate compiler reorderings could lead
> to distinct function pointers being read. In reality this is impossible,
> so don't instrument at this read.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> v2: Mark instances at init where the callback is written to, and
> data_race() read as there is no capacity for the value to change
> underneath.
> ---
>  arch/powerpc/kernel/idle.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
> index b1c0418b25c8..43d96c0e3b96 100644
> --- a/arch/powerpc/kernel/idle.c
> +++ b/arch/powerpc/kernel/idle.c
> @@ -35,7 +35,7 @@ EXPORT_SYMBOL(cpuidle_disable);
> =20
>  static int __init powersave_off(char *arg)
>  {
> -	ppc_md.power_save =3D NULL;
> +	WRITE_ONCE(ppc_md.power_save, NULL);
>  	cpuidle_disable =3D IDLE_POWERSAVE_OFF;
>  	return 1;
>  }

Shouldn't need the WRITE_ONCE if you don't need a READ_ONCE. Does
data_race work here too? What about the other writers? Does
KCSAN know it's single threaded in early boot so skips marking,
but perhaps this comes later? Would be good to have a little
comment if so.

Thanks,
Nick

> @@ -43,10 +43,13 @@ __setup("powersave=3Doff", powersave_off);
> =20
>  void arch_cpu_idle(void)
>  {
> +	/* power_save callback assigned only at init so no data race */
> +	void (*power_save)(void) =3D data_race(ppc_md.power_save);
> +
>  	ppc64_runlatch_off();
> =20
> -	if (ppc_md.power_save) {
> -		ppc_md.power_save();
> +	if (power_save) {
> +		power_save();
>  		/*
>  		 * Some power_save functions return with
>  		 * interrupts enabled, some don't.
> --=20
> 2.37.2

