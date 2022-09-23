Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C715E7503
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYkc064wFz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:41:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=msgDYcr9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=msgDYcr9;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYkbN0gBMz3c21
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:40:47 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id o99-20020a17090a0a6c00b002039c4fce53so4925975pjo.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=GufhPk6nJUJqYHHDsQQD55L9wMBn5sJyHWmnfrXEHic=;
        b=msgDYcr9RBBPP7aaaCgwwcf+dedOGygjFEdByhAeTb65PNfInqaRHx1sPZMEN19CGp
         XxJyxIt7YfBrBh5UzDcSv2IlWSK/IE26cEG/yYS19iW1naerZcugwCUTMytBCMzDPj1s
         +AU5CQ8o/ccswkShYqnt9HmcMgHm03fI234VvX81RRbxYoDx1khzZ9+inwBZj8K7tvUy
         kT/822IAFIt/VJ74bzmvld3bWO+pnjo56H5MJY/l+yuNL423kXexlrhEQ3xRB9PkE+rg
         OKYjt+ahx350nFRNvFx0ZxnMAeCtytvBpNNZiXffQDxnTjIetKNGARfc72NENJAjyLz0
         kmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=GufhPk6nJUJqYHHDsQQD55L9wMBn5sJyHWmnfrXEHic=;
        b=D8bqdpiuH80cGJ2yGPLBim9vKJ06As/8KthkquR34fpDRZdEB5bRbvIdTufKHdOYWr
         KlHeJ6HjDAc8ZXb7UghfUE/U6iHc3IlqPqJsNGhdiZbC412DcWgfHLPJOQhLcyUogBgI
         M5MHO242e4LiRp4qlWwPXJdwrIdzDnGhQJGrpvKTZUvEa/DTdszgs6AknDstShUF+2DR
         qGjq5o+S0++s4sb2J6v7rrFPLIqIb7W+250I4mHC8lOmYQqHPaVuPxIgA5Rcdfx8uAS2
         UEkqzcQu7792KESWk8tlZUN+MEQP9xqXSxxyChuLdYbbu+19bi3gq8Oxy0DBofGJWr+d
         oD9Q==
X-Gm-Message-State: ACrzQf0U7EXT1Bze2mTWEfReDeWS2fd8GGfT61GLDXmD/YpFruWOTn/n
	yUbnkKOlqfH9k4GTRJVfLsA0r4TyodI=
X-Google-Smtp-Source: AMsMyM7nWZ8hP7eXp5R8eSw2fGuNgf7lHZYU7N/1F80VYKxtrh9Gy8CwBb+3za+SFsQ1FMXypTqZiQ==
X-Received: by 2002:a17:902:e88b:b0:176:c37f:511c with SMTP id w11-20020a170902e88b00b00176c37f511cmr7377037plg.2.1663918844455;
        Fri, 23 Sep 2022 00:40:44 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id y3-20020aa793c3000000b005383988ec0fsm5693304pff.162.2022.09.23.00.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 00:40:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Sep 2022 17:40:38 +1000
Message-Id: <CN3M021T7X4H.3S6Y9H3RNSLOK@bobo>
Subject: Re: [PATCH v6 19/25] powerpc: Remove high-order word clearing on
 compat syscall entry
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-20-rmclure@linux.ibm.com>
In-Reply-To: <20220921065605.1051927-20-rmclure@linux.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Sep 21, 2022 at 4:55 PM AEST, Rohan McLure wrote:
> Remove explicit clearing of the high order-word of user parameters when
> handling compatibility syscalls in system_call_exception. The
> COMPAT_SYSCALL_DEFINEx macros handle this clearing through an
> explicit cast to the signature type of the target handler.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reported-by: Nicholas Piggin <npiggin@gmail.com>

Thanks for digging through it to make sure things will work right
without this. Some handlers look problematic without the rest of your
series, right? e.g., upstream compat_sys_mmap2 has long arguments.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> V6: New patch
> ---
>  arch/powerpc/kernel/syscall.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.=
c
> index 9875486f6168..15af0ed019a7 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -157,14 +157,6 @@ notrace long system_call_exception(long r3, long r4,=
 long r5,
> =20
>  	if (unlikely(is_compat_task())) {
>  		f =3D (void *)compat_sys_call_table[r0];
> -
> -		r3 &=3D 0x00000000ffffffffULL;
> -		r4 &=3D 0x00000000ffffffffULL;
> -		r5 &=3D 0x00000000ffffffffULL;
> -		r6 &=3D 0x00000000ffffffffULL;
> -		r7 &=3D 0x00000000ffffffffULL;
> -		r8 &=3D 0x00000000ffffffffULL;
> -
>  	} else {
>  		f =3D (void *)sys_call_table[r0];
>  	}
> --=20
> 2.34.1

