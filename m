Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA46FBD14
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 04:22:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFhlD750gz3fLD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 12:22:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OI/zPBh6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OI/zPBh6;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFhkQ4BcCz3c38
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 12:22:04 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-24e4f674356so4894594a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 19:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683598918; x=1686190918;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC2hvml/Ow/sWKo8wzAHtdzBFgW8QsP0jfyE9BkW+j4=;
        b=OI/zPBh6h5obFSstycbFnTcgzl/ZLaDYkbfWBBdEvbXsfJfLVr+I0gKmCV6aStV/1C
         AcWYQDcBWp64785XlVxOt6FAonnl5mXGpGH+AMcO0jnXgHhtbCmCCNevFSFWIVfyZaJi
         W3iGheysOSXUsPftqN9tS9Zwh6yWtATGYtBFsbepFKa37JTnpltzmSH5qqubGIpgXQHR
         iFGoyyFfIf5EEI/vF4x4LG8CwKzIKSUZWr/suT02TblYDoc+Tm5nhhNFpo9j0KiJhm06
         2rv2aseFFgU+T8dF6RDhIiEWe3D+lKOyoVxf5mC81I0A1DnPFJ+7q/mQZcySsDK0LDRT
         tamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683598918; x=1686190918;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KC2hvml/Ow/sWKo8wzAHtdzBFgW8QsP0jfyE9BkW+j4=;
        b=IIX5pv+fqtK99CsBQcOpuwja60cMdeJo/KfLVsHftAozJniXe14lWwdUilro+keBCF
         NNSF4IgxrHY+nD8OFxPhKMRNabm1Lk6nfUF4tBmRiXzba+aX5rgyhMkDBYMfuiuPBGUd
         jQ9U3hegHzeUI1PdC6sZ+jwd5Q47NQ/Cu+yJArRDhyrTAMJ96GLPa+ljRVZJBswH2yZC
         0wAKyLjOMgXaVEoWsG6e8eMCHNASi5M2ZCzTbGwB+niR674zo1skDY3TgmDjW6c3tJ4P
         7VCpLtoqYsWmyV2u9Si7Kstik/MJguQNOwHfPrbiVHqT+bGGGRAzabwIztMkiNKkJcOM
         xWtQ==
X-Gm-Message-State: AC+VfDxbk1M3+X4i9DDBUkh1SoA9LD2/4PLuBajTRK93PBXZYMQ2NoeS
	HJZGbcVK/SGf0zHvbcsnZC8=
X-Google-Smtp-Source: ACHHUZ7H4GnuGg8A1lMUY4nFHTAh0JqQuiSWd/DQ0eGsXWjIg/rXemzd2j2M94nMOwVXgqA0nDAFGg==
X-Received: by 2002:a17:90a:9c07:b0:250:1961:f6b0 with SMTP id h7-20020a17090a9c0700b002501961f6b0mr12631809pjp.32.1683598917757;
        Mon, 08 May 2023 19:21:57 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c10d00b001aaf1679c9fsm168462pli.221.2023.05.08.19.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 19:21:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 12:21:52 +1000
Message-Id: <CSHE06SCVDD0.I6GMBES2Q612@wheely>
Subject: Re: [PATCH 06/12] powerpc: Mark accesses to power_save callback in
 arch_cpu_idle
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-7-rmclure@linux.ibm.com>
In-Reply-To: <20230508020120.218494-7-rmclure@linux.ibm.com>
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
> The power_save callback can be overwritten by another core at boot time.
> Specifically, null values will be replaced exactly once with the callback
> suitable for the particular platform (PowerNV / pseries lpars). Mark
> reads to this variable with READ_ONCE to signal to KCSAN that this race
> is acceptable, as well as to rule-out the possibility for compiler reorde=
rings
> leading to calling a null pointer.

Is ppc_md readonly after init? Might be a good candidate if it is...
Maybe KCSAN doesn't recognise that though.

Unless the places that assign ppc_md.power_save need to be converted
to use WRITE_ONCE, you could just annotate this with data_race and
comment it's not really a race because it won't be called before the
structure is set up.

Thanks,
Nick
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
>  arch/powerpc/kernel/idle.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
> index b1c0418b25c8..a1589bb97c98 100644
> --- a/arch/powerpc/kernel/idle.c
> +++ b/arch/powerpc/kernel/idle.c
> @@ -43,10 +43,12 @@ __setup("powersave=3Doff", powersave_off);
> =20
>  void arch_cpu_idle(void)
>  {
> +	void (*power_save)(void) =3D READ_ONCE(ppc_md.power_save);
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

