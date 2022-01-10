Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0825F4891B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 08:39:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXQgb55cJz2yMt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 18:39:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZJWFgCw9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZJWFgCw9; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXQfw3ZFWz2xTC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 18:38:32 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id j27so1941444pgj.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jan 2022 23:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=q/dzvf8yvsnwgKw/boK35Xq8HUaXN1Q2ifLzXvICyGk=;
 b=ZJWFgCw9ctx2a/KzuYmu0+EYnCD7bgzxvDFdKWEZ9EpTOzK5x8yCUJR0sA0WZZZpco
 Un77gJ8ltdg+r5FGWJTBo3+pwZkAcE0toP4yQJRaZPDbM33W2ZhpmPb+Jumc/v2zEFhn
 QXpF6iQFu7D+GprL3PS5g8jTtKTqq0hl3gEvRpGyBk3/4ZZqUe9kqSHRY9yI6Sswn/Hf
 XWfDEQfE283YSPcUmUpfflYh2M/br6WrgVMu/jnYPGGeS3O1tSDbWQeaqjOu5U0Aie6S
 6wUxfTA1UZvtsu51fdUA+WMGQ8Xmze+a/GWsEygBLtAtdj/ALCRUh3L29v/DiEoyurHL
 3x8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=q/dzvf8yvsnwgKw/boK35Xq8HUaXN1Q2ifLzXvICyGk=;
 b=TQvAdmFnR4N6ygQ2YVsSRzCi+tkP9nFGpnyA2PtiYovNLjZ0JuFlnRPb1L1hn1Xzzw
 pxPpsTw4PpaqxKs5O9fXAUf0Qr4EmuGCNKRJui5ZhFq7qXuPfWB/EyNcuRJV6L8pndO8
 UNbiXVt13wtWUl+AF3M2Ajqasr6WJgGxyxXM+Gbl2PM6hI/cK3s511JmTsYedgyBOiiX
 JiIHILnsV/LlOIiWrkY/try+Adcpx85rsgZy7LxDT4/IxXea4F1p4mJEgjcSzlSFkQbl
 6djtIGGnpB3gBxNp+KVzz+NxGs9dqDSUrgKiArdZ5opqhoMv/+O3HVwkcz0bZnle5seH
 dh7g==
X-Gm-Message-State: AOAM533AAXEJ8x1V5/2FPpJVVtFAsOSNfm2vL4gN9y+84n/YxDfOwBoy
 tTI4GFdaqEcslidpXUC/ITA=
X-Google-Smtp-Source: ABdhPJyJ2ADFojpZ85SOqBqnQ6pzRvvd6/nLgfYJrOajVgZ8p4dL+0rxhDB66VCapKQWdhUOd4lCeQ==
X-Received: by 2002:aa7:91c3:0:b0:4b0:eebe:49c0 with SMTP id
 z3-20020aa791c3000000b004b0eebe49c0mr74999524pfa.6.1641800309528; 
 Sun, 09 Jan 2022 23:38:29 -0800 (PST)
Received: from localhost (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id 10sm8264735pjc.6.2022.01.09.23.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:38:29 -0800 (PST)
Date: Mon, 10 Jan 2022 17:38:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 6/6] KVM: PPC: mmio: Reject instructions that access
 more than mmio.data size
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220107210012.4091153-1-farosas@linux.ibm.com>
 <20220107210012.4091153-7-farosas@linux.ibm.com>
In-Reply-To: <20220107210012.4091153-7-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1641800177.nr6ngd1fot.astroid@bobo.none>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of January 8, 2022 7:00 am:
> The MMIO interface between the kernel and userspace uses a structure
> that supports a maximum of 8-bytes of data. Instructions that access
> more than that need to be emulated in parts.
>=20
> We currently don't have generic support for splitting the emulation in
> parts and each set of instructions needs to be explicitly included.
>=20
> There's already an error message being printed when a load or store
> exceeds the mmio.data buffer but we don't fail the emulation until
> later at kvmppc_complete_mmio_load and even then we allow userspace to
> make a partial copy of the data, which ends up overwriting some fields
> of the mmio structure.
>=20
> This patch makes the emulation fail earlier at kvmppc_handle_load|store,
> which will send a Program interrupt to the guest. This is better than
> allowing the guest to proceed with partial data.
>=20
> Note that this was caught in a somewhat artificial scenario using
> quadword instructions (lq/stq), there's no account of an actual guest
> in the wild running instructions that are not properly emulated.
>=20
> (While here, fix the error message to check against 'bytes' and not
> 'run->mmio.len' which at this point has an old value.)

This looks good to me

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/kvm/powerpc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 56b0faab7a5f..a1643ca988e0 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -1246,7 +1246,8 @@ static int __kvmppc_handle_load(struct kvm_vcpu *vc=
pu,
> =20
>  	if (bytes > sizeof(run->mmio.data)) {
>  		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
> -		       run->mmio.len);
> +		       bytes);

I wonder though this should probably be ratelimited, informational (or=20
at least warning because it's a host message), and perhaps a bit more
explanatory that it's a guest problem (or at least lack of host support
for particular guest MMIO sizes).

Thanks,
Nick
