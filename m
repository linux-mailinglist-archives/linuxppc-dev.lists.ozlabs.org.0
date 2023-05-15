Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A29D702DDE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 15:18:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKg1661n6z3f6V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 23:18:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r6+1eHXq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r6+1eHXq;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKg0D6ggjz3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 23:17:48 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-643990c5319so9194035b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684156665; x=1686748665;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0tJkuk31cCBlZvEOM+JrHqUgoWRc+pu5rHsHy4vtdM=;
        b=r6+1eHXqlQ+IasIh4jpDRrEIQYRp3hgNi2grwCqYbmuNwyFZfNK75zQBUPzuNPXL1n
         OyfSYEle0mHPWMe7voOHeNIvrkTxLb9J1GFEYWcvoBHvySXmWKB/GAezQtFDqn1SkC9J
         VWMTZ8D6KzsiwTfJtbqcmGH2hsu88ZuEQ0sOg04FOSUjXSh4Po+stkCYTG2ysIUFRGLu
         zvwW8oep593Vb3c+pgNjVE/sJdqGm/XFO9uvK9FGUO2hkjpcrBcyW2PuLZz0XsNpeqfc
         pNLAv3WdTn0dEFIO3ouFTP+gv8QrD7toxRHCutJgn8tqXMVwgihPmeUKIlae8kbQJxl5
         9VYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684156665; x=1686748665;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U0tJkuk31cCBlZvEOM+JrHqUgoWRc+pu5rHsHy4vtdM=;
        b=FZSeb4VTgXvQnLOX5LLDinocg/rxa7FqkQuMMiSTVipW+Tut7ew0MvfNEnhpyFJVwa
         YO9Dh9R9dYxsR9i2OZmBocDOImOfqpah6uXxZHI06wh7wbaub1PRx3Idz1pP4M1F+WZA
         UWkwYfbIfdiCRXVccn+GpL4YjEFylAGLaBFGgtHfggdqtdwXNg4sKYXiHMpMmF5EhowB
         R7vJBAh5kmP3tuuICkNxf3BwiyW6caA0ew/17B0FmGWlQ3rlgJPN9wmyJwp0st0iyb8D
         gdayod2JhU/Y3HhdqcGvklf0KBFiVtfPGTbgFKVWL6WwxkhPX2FKN+ZtUchSuvlaxh69
         SXkA==
X-Gm-Message-State: AC+VfDz4FIDGPcuR9rH0BHY4dk6/4FgR1DyH+CzhqtheP/YmOc59LC+i
	nQ/Sjny7N61dWJqxfab+SYY=
X-Google-Smtp-Source: ACHHUZ7weR1YIYVqrDmYRGph9/ygafe/djAvvBUv3jyOFXFKLe7jvOnzv2aWPmkqIsirjDSI2OpyIw==
X-Received: by 2002:a05:6a00:189a:b0:646:7234:cbfc with SMTP id x26-20020a056a00189a00b006467234cbfcmr36493454pfh.27.1684156664979;
        Mon, 15 May 2023 06:17:44 -0700 (PDT)
Received: from localhost ([202.168.30.146])
        by smtp.gmail.com with ESMTPSA id p24-20020a62ab18000000b0063b5776b073sm11801277pff.117.2023.05.15.06.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 06:17:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 23:17:39 +1000
Message-Id: <CSMVPKLWONBY.2X37RTHC6OCNB@wheely>
Subject: Re: [PATCH v2 6/6] powerpc/64: Rename entry_64.S to prom_entry_64.S
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nicholas Piggin" <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230515044543.78903-1-npiggin@gmail.com>
 <20230515044543.78903-7-npiggin@gmail.com>
In-Reply-To: <20230515044543.78903-7-npiggin@gmail.com>
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

On Mon May 15, 2023 at 2:45 PM AEST, Nicholas Piggin wrote:
> This file contains only the enter_prom implementation now.
> Trim includes and update header comment while we're here.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/Makefile                  |  8 +++--
>  .../kernel/{entry_64.S =3D> prom_entry_64.S}    | 30 ++-----------------
>  scripts/head-object-list.txt                  |  2 +-
>  3 files changed, 9 insertions(+), 31 deletions(-)
>  rename arch/powerpc/kernel/{entry_64.S =3D> prom_entry_64.S} (73%)
>
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index ec70a1748506..f94c893e014d 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -209,10 +209,12 @@ CFLAGS_paca.o			+=3D -fno-stack-protector
> =20
>  obj-$(CONFIG_PPC_FPU)		+=3D fpu.o
>  obj-$(CONFIG_ALTIVEC)		+=3D vector.o
> -obj-$(CONFIG_PPC64)		+=3D entry_64.o
> -obj-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)	+=3D prom_init.o
> =20
> -extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)	+=3D prom_init_check
> +ifdef CONFIG_PPC_OF_BOOT_TRAMPOLINE
> +obj-y				+=3D prom_init.o
> +obj64-y				+=3D prom_entry_64.o
> +extra-y				+=3D prom_init_check
> +endif

Oops that doesn't work, obj64-y is merged into obj-y before this. Need
to move that merge down below here.

Thanks,
Nick
