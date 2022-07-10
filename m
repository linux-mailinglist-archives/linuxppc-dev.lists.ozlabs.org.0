Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CD856D0E9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 20:56:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lgx823WJ0z3cdC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 04:56:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.187; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lgx7Z2cmzz3blB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 04:56:25 +1000 (AEST)
Received: from mail-yb1-f177.google.com ([209.85.219.177]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MeTwa-1ncenI3XXQ-00aW4F for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul
 2022 20:56:21 +0200
Received: by mail-yb1-f177.google.com with SMTP id l11so5579311ybu.13
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 11:56:19 -0700 (PDT)
X-Gm-Message-State: AJIora/6U8Df4tKKHTaumrMSdGDR5AAaTD3q+bzS71Iwn4muy0OXU5Mi
	hin3Nz2aaJo6nx22qQRLEEk3oeDIoa2dH6YznmQ=
X-Google-Smtp-Source: AGRyM1vC8Psjq8TKqTYophNIDYGT63nbqvav729u+ibTi3lCuwuf8F4ff1EERlfLRC55htVqfUGVKk+aL3IGcrOWv8U=
X-Received: by 2002:a05:6902:120f:b0:668:2228:9627 with SMTP id
 s15-20020a056902120f00b0066822289627mr15013108ybu.134.1657479378691; Sun, 10
 Jul 2022 11:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <e547df86b7195bb9cc5558afb4c74aeefe286849.1657474606.git.christophe.leroy@csgroup.eu>
In-Reply-To: <e547df86b7195bb9cc5558afb4c74aeefe286849.1657474606.git.christophe.leroy@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 10 Jul 2022 20:56:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Wd_CR8EPqdPEp6kgjrymvw3cEuHCZZ8AvoT-sHVX2nQ@mail.gmail.com>
Message-ID: <CAK8P3a2Wd_CR8EPqdPEp6kgjrymvw3cEuHCZZ8AvoT-sHVX2nQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/32: Don't always pass -mcpu=powerpc to the compiler
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UBZRLPbwkDBUTFC7Hm1gyC4sg29kQ6ZiTgvJbPN/YIB2KjouSoY
 TJ7DZ76duZrNUI7vM3HsgMvBAEOk92LACD8beyRETm1UswQp2+L5ut67nQUO2SrA3DsJaGX
 3RvQ64DJ1eP1W+VVs5yEoHgC8KC18ndZu0Pse/UbQmkMfmEjA6STd0CmfnArx3b/ctfXGP9
 h1TOyRiZgxYHIbbX8BqmQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4E6C/SBV7VY=:ukldQrMjXTNFlsi1IIe+SS
 Y2iq8qBmyKfU7eL/u7LCukwIgelZpk1epQQZH6arN4/ohE+IsafrWoGY9v99Q0LM0hyULnme4
 re+AjOjYS0KjiFp9D0mHfrwvd0c/NfPj442WnXeoEwLQG13c0zxdFLlCMKdCed6QDrpH/DSID
 8Jn48ZIyh9QESegQffmnjbzYCagCO12ViOzeJvp9gxi67OyGzldF6Ohg+aUYThT9/SX7dl9I6
 XME7u7eG12KpzIfq1Jfa7S9ZCD2WzyH7C2TNDW8Gel2Nz5h6pfv7Bq0SXHO0tD/6YcnqkWmNr
 IO5bSaKNauJvUyHFWoarwRrlIYUaRDEr0dBGI3nshMZHf3g1KaImeDHg08LhD7z77yh2JR4bS
 Xcue2XB32zPk/Ejg0FsUeCrQutHXkRlSFoJZeqshg5YKiVEX5+xnHk35UljliirJ88+/JiQD5
 NZgeh8Rz5rNtXTY8x5XocuKSx+zrdMFsI2O3+4F0NAWNApNkQtHOM+iWupGnx8UioUH2ues1N
 nmO9ODrsfOd2o+pGsDW8YG/AfheZQlPDsnQQXlAmvhSjrSUuUSk6vfc9VME9K4Q3D7diGjjB0
 Naiy2sF7DqixmlVVyQigukmmGoQsF4bMHESBR4XSxQcbjNceP7ZsHCueF9YtUk8Qj8NeMN6BR
 ceEvTcSCtJIoUAzDUCF7N5c19TENcmgTSEHVT9s2gYvGNuO8FuFITVg674SF2x9nI09E/mhEi
 2xmtC5dpKXSpVAqO9hU7tsYsvEYm/k9nmoqyUlHDX5HOy/dBZRN26D4MeWxb+aKdkLyiBEujx
 PCbGKhzKuG60jkizICCIFgPzxFpfADeTGObUhl4PdqRwFM9feWCntS6dWwvmkPDwt9GkeXCsh
 dwaXZjxb7pkT8hTExkZQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 10, 2022 at 7:36 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Since commit 4bf4f42a2feb ("powerpc/kbuild: Set default generic
> machine type for 32-bit compile"), when building a 32 bits kernel
> with a bi-arch version of GCC, or when building a book3s/32 kernel,
> the option -mcpu=3Dpowerpc is passed to GCC at all time, relying on it
> being eventually overriden by a subsequent -mcpu=3Dxxxx.
>
> But when building the same kernel with a 32 bits only version of GCC,
> that is not done, relying on gcc being built with the expected default
> CPU.
>
> This logic has two problems. First, it is a bit fragile to rely on
> whether the GCC version is bi-arch or not, because today we can have
> bi-arch versions of GCC configured with a 32 bits default. Second,
> there are some versions of GCC which don't support -mcpu=3Dpowerpc,
> for instance for e500 SPE-only versions.
>
> So, stop relying on this approximative logic and allow the user to
> decide whether he/she wants to use the toolchain's default CPU or if
> he/she wants to set one, and allow only possible CPUs based on the
> selected target.
>
> Reported-by: Pali Roh=C3=A1r <pali@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Looks good to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
