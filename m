Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A973728E9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 12:27:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZGHs0X5Gz30Cn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 20:27:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NtyKivJU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NtyKivJU; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZGHQ6Rdnz2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 20:27:13 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id h127so2217923pfe.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Zqh05lRWSnfcWXVqNuZ/m5JnGxiFrmeUlPOabQos2nc=;
 b=NtyKivJUWDohEBzjVjmiXarADZ7fCklTdAqCqjwYHH9osxCPOCCnO63YB03KE51wS4
 31SkmwXSS9x6g+tUZ8k0Cliz8uSMRZVGUowlu+v3aGwRPUUs6IGQZl/4JufxtKvCtL29
 4CrQVgm7PWIVOfzyQca/0Iltua6pOc5xdpG7xyu1SP6YKB0VyY5SnELOYq7mFpqQlSEk
 5wSBhxxJlYUSN/b0inM2b2/i/H50SZJNJpr/gmrGApMlYj9cyt2OIc7E/xoZT87KrrHY
 FU19OyXO4fXtOiZegEG+EKtq2O/ZQi21SHGwdaDx+85nFJhXSkKZdNJbsLb1pBzPNXic
 Al+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Zqh05lRWSnfcWXVqNuZ/m5JnGxiFrmeUlPOabQos2nc=;
 b=GAwZYknGHL2auIEc+PKBgCSHoOYBPEqBTQK/pc3RSRuZgiDFX3lLBGjYL6OzXockwQ
 efrALX7JqHl4CivDUPYjP6J5MRuLgX8uR3KRHSwqQ+lLxVdDPMXodS4xmltNmKPJf323
 8g9GdDTFjFRNYDi6N/vvN+5lUQfjZXPnAuWdXEGdfQPpLTROqLexpMsYcU5+6DbXZnMy
 2nke+p+JBBDUj0G5xhEjQyDtdfOW4xTgw6965HFzywaktCqtCAUr5RhppvPoGmOfmfnX
 8lr3pQvH410fB+gLQUcwBo0FwwVNWP5PcRnJg63tQRfCAx1bhEz0GNgRs5Gh9XKb3KRV
 AMGg==
X-Gm-Message-State: AOAM5306gUzL8OQSi/j7dt4nwKZI6kjAkVWAUg7/HS983AzdpXr8l5Pc
 GNSLmT4KX1xKhX0mlpASC6jV/aZKYq0=
X-Google-Smtp-Source: ABdhPJxEgwaGPwsZStRWkfvSY/8uStjH1CQgQXmGEln2olFUeeVjMc85gwTYhpSZsoIdXTB8oqhjwQ==
X-Received: by 2002:a63:4b21:: with SMTP id y33mr14482394pga.287.1620124031915; 
 Tue, 04 May 2021 03:27:11 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id 206sm2848628pga.44.2021.05.04.03.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:27:11 -0700 (PDT)
Date: Tue, 04 May 2021 20:27:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3] powerpc/64: Option to use ELFv2 ABI for big-endian
 kernels
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>, Andreas Schwab
 <schwab@linux-m68k.org>
References: <20210503110713.751840-1-npiggin__45037.8389026568$1620040079$gmane$org@gmail.com>
 <87eeeooxnu.fsf@igel.home> <20210503143841.GN6564@kitsune.suse.cz>
In-Reply-To: <20210503143841.GN6564@kitsune.suse.cz>
MIME-Version: 1.0
Message-Id: <1620123343.089lvgtr1s.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michal Such=C3=A1nek's message of May 4, 2021 12:38 am:
> On Mon, May 03, 2021 at 01:37:57PM +0200, Andreas Schwab wrote:
>> Should this add a tag to the module vermagic?

Good question.

>=20
> Would the modues link even if the vermagic was not changed?
>=20
> I suppose something like this might do it.

Yeah I don't know how robust the loader would be to a mismatch. We could=20
add this patch.

Thanks,
Nick

>=20
> Thanks
>=20
> Michal
>=20
> diff --git a/arch/powerpc/include/asm/vermagic.h b/arch/powerpc/include/a=
sm/vermagic.h
> index b054a8576e5d..3fdaacd7a743 100644
> --- a/arch/powerpc/include/asm/vermagic.h
> +++ b/arch/powerpc/include/asm/vermagic.h
> @@ -14,7 +14,14 @@
>  #define MODULE_ARCH_VERMAGIC_RELOCATABLE	""
>  #endif
> =20
> +
> +#ifdef CONFIG_PPC64_BUILD_BIG_ENDIAN_ELF_V2_ABI
> +#define MODULE_ARCH_VERMAGIC_ELF_V2_ABI	"abi-elfv2 "
> +#else
> +#define MODULE_ARCH_VERMAGIC_ELF_V2_ABI	""
> +#endif
> +
>  #define MODULE_ARCH_VERMAGIC \
> -		MODULE_ARCH_VERMAGIC_FTRACE MODULE_ARCH_VERMAGIC_RELOCATABLE
> +		MODULE_ARCH_VERMAGIC_FTRACE MODULE_ARCH_VERMAGIC_RELOCATABLE MODULE_AR=
CH_VERMAGIC_ELF_V2_ABI
> =20
>  #endif /* _ASM_VERMAGIC_H */
>=20
