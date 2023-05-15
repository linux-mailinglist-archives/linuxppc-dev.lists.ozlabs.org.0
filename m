Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3821C7023CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 07:54:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKT980ktJz3f4S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 15:54:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UouKyr2b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UouKyr2b;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKT871n6Tz3f6T
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 15:53:58 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-643912bca6fso9617766b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 22:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684130035; x=1686722035;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSC+9W7DCz4lR9wWZ63D9yCHdH0WAkMn8SnHlRTFjMs=;
        b=UouKyr2bWW4XQmdByUrQ3nfTJjxVB2aB7AipgCUD0Hw2MPsFfS1qY0EeAUoOT09EH5
         P8wue1WYweq5AlbZe0iKGPUASMUc1quv7+l3I41Bg3wKezqwoMkh22ZfgED7QAcXbWPN
         OsIiXvlRC6m3N8jeEx2yklr+Ba/2ffSOPE00UiLpgRTbmP5qY9nuZ5tP3JK7fGlID5Tc
         SL4oVD+/9zDK2iVaXl7bqWQKM8Py6wTh7eUbUKj2utFv4IKLHFJMoGWdCPZNXkpv4Xn3
         uZ6xG5P+zbSPIoNGyqSAa227VV562bBDZuA8Fb2lqb1C0m8118RFCZEnByYCgCdy6qqx
         yaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684130035; x=1686722035;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TSC+9W7DCz4lR9wWZ63D9yCHdH0WAkMn8SnHlRTFjMs=;
        b=g+T3om2zdlN44QAYDpXzkrF9Cd7D5ELSfFO3n0fHwU4hvh7GCVbv6BaxOPxpLsUP+v
         7omleDuZQeOHKtg8AONnmLVT4Afi+YpMH4Xbor1pRyswMUOM2LbrH5PS7YcXcCMFE2TQ
         xb4N2ysCWeivTpbRLwa2RVhnEFTqlXO6juJ6f3192fJDe4910sSAOsJKOW+4m9bL1LWR
         v6iO7+pYNvzWaB/8e1eun23ukax+BHSX3ez+I5uMF5FiyyzQil6S7J7F4iGBjk6ejGJW
         PbUoEKmNzpC3bBWVNzxCdPwPL/2Lsg6Ou+XCsGedq+jDNNj3Co9ZP41MGk/txSs9gs1K
         Bj9g==
X-Gm-Message-State: AC+VfDxX7WEZyDm9AtY4ZZkVd5IGupKRzls9UecqwLnRz2ee0xZBapYq
	GeraO17ZPwV14kCsjzM9K1NFAVEHl2cNBQ==
X-Google-Smtp-Source: ACHHUZ5eANS8i29uWaVOGNluXP9j/Ops+Blo9QOA/rvz/uEU0Y7LIhB9bqNuZHRHdlqV+RAo+iDTYg==
X-Received: by 2002:a05:6a00:1391:b0:643:ba77:f265 with SMTP id t17-20020a056a00139100b00643ba77f265mr41919527pfg.25.1684130035282;
        Sun, 14 May 2023 22:53:55 -0700 (PDT)
Received: from localhost ([1.146.119.84])
        by smtp.gmail.com with ESMTPSA id k4-20020aa792c4000000b0063aa1763146sm11330075pfa.17.2023.05.14.22.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 22:53:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 15:53:49 +1000
Message-Id: <CSMM9QLH8BRM.37WYXBTRCYB23@wheely>
Subject: Re: [PATCH v2 08/11] powerpc: Mark writes registering ipi to host
 cpu through kvm and polling
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
 <20230510033117.1395895-9-rmclure@linux.ibm.com>
In-Reply-To: <20230510033117.1395895-9-rmclure@linux.ibm.com>
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
> Mark writes to hypervisor ipi state so that KCSAN recognises these
> asynchronous issue of kvmppc_{set,clear}_host_ipi to be intended, with
> atomic writes. Mark asynchronous polls to this variable in
> kvm_ppc_read_one_intr().
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

What's the go with accesses in asm? Does it just assume you know
what you're doing?

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> v2: Add read-side annotations to both polling locations in
> kvm_ppc_read_one_intr().
> ---
>  arch/powerpc/include/asm/kvm_ppc.h   | 4 ++--
>  arch/powerpc/kvm/book3s_hv_builtin.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/as=
m/kvm_ppc.h
> index bc57d058ad5b..d701df006c08 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -548,12 +548,12 @@ static inline void kvmppc_set_host_ipi(int cpu)
>  	 * pairs with the barrier in kvmppc_clear_host_ipi()
>  	 */
>  	smp_mb();
> -	paca_ptrs[cpu]->kvm_hstate.host_ipi =3D 1;
> +	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 1);
>  }
> =20
>  static inline void kvmppc_clear_host_ipi(int cpu)
>  {
> -	paca_ptrs[cpu]->kvm_hstate.host_ipi =3D 0;
> +	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 0);
>  	/*
>  	 * order clearing of host_ipi flag vs. processing of IPI messages
>  	 *
> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book=
3s_hv_builtin.c
> index da85f046377a..0f5b021fa559 100644
> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
> @@ -406,7 +406,7 @@ static long kvmppc_read_one_intr(bool *again)
>  		return 1;
> =20
>  	/* see if a host IPI is pending */
> -	host_ipi =3D local_paca->kvm_hstate.host_ipi;
> +	host_ipi =3D READ_ONCE(local_paca->kvm_hstate.host_ipi);
>  	if (host_ipi)
>  		return 1;
> =20
> @@ -466,7 +466,7 @@ static long kvmppc_read_one_intr(bool *again)
>  		 * meantime. If it's clear, we bounce the interrupt to the
>  		 * guest
>  		 */
> -		host_ipi =3D local_paca->kvm_hstate.host_ipi;
> +		host_ipi =3D READ_ONCE(local_paca->kvm_hstate.host_ipi);
>  		if (unlikely(host_ipi !=3D 0)) {
>  			/* We raced with the host,
>  			 * we need to resend that IPI, bummer
> --=20
> 2.37.2

