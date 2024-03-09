Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E034877055
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 11:20:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lJpthpL8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TsJvH2sGGz3vZq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 21:20:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lJpthpL8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=jstultz@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ts61S0FNDz3bmN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 13:09:47 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-566b160f6eeso2649a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Mar 2024 18:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709950180; x=1710554980; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iA/O5FAuZIkkJpLARXGwTKQU7mlJK2bNxZqfqbSr2E=;
        b=lJpthpL82PQ6UojVp7grZI4IzbslPl3rNQ2HNIJxsbUN0DJR9okIgl6loBUacjyqP8
         l1K8dtM1wTZ0IAYy7gxkJcayGEAZl22hYwaCDiwgRUHSF/SszvDCuYppAQ9VNMbqSeyN
         bDaICZwS/HhaiJBrx7uvidqoad924rFR+4XBBBcyTHcEObZiL22POQKDD3pyhUknt26y
         MVzJe6mj9e6XgQliyau4agFPM2xMXsUgZezXJ6+Elo5LCKnU+Y+elKZw8kKCDHVjer28
         mFmLj4lC3YOlreP2rsXUtdci0/l6n/Sv165KrKcBGyM5wtEzy5u1rgTSirVWtCg2slDx
         G9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709950180; x=1710554980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iA/O5FAuZIkkJpLARXGwTKQU7mlJK2bNxZqfqbSr2E=;
        b=X+4e/DLDGFfl9j1q8A67MWlidgiXHT04noGAjST/MipIsDCekrvAB5E2JEZ4RcGUNG
         +/UuzAw/OaDa2OP/rzdfdmzhwhjb89iRNl0wccUdDImROxVmQfpTLygLsnZHCKeKdl5z
         bwg6YosvtjWUjzSq5ZPewSdahgUJZNn/guSvq3t01oe8V3+nd2i0dPxnkH0n/BF2edVM
         w2Tr08SZKJysGQJdPP8zDptd5txH0ZYOLqHPLNXlkP/NAOkkQPv+FFawXWOEtgpVOGAg
         EHBf7tJ8iUIKSEHfGpkTNIKR5U1Fgrs0fg9l9n1ndr4/nN+cJyo4GAV9fOgYm8v8Ou2t
         3TOA==
X-Forwarded-Encrypted: i=1; AJvYcCUQZmCzlVQ2ggNPrxzM/oGPROA+eAU4BdTbCzmSxVCv4/ISMPpplISjpqRG0W8MdYAvAjHzTcmM5Q2OoZfqXTVv56YOMrlJluqNVnUJQQ==
X-Gm-Message-State: AOJu0Yyr938QRkynvwCpDE9v4Y9EL5eLRt6RXx9d82ag0Q9LcmjDhHAP
	7hGlGHsdBrgK0mq0qzNyaBGRoA3IeRer5CtL7tT98Uxtfh4u81qglfn182vVWqIqHP/LU7r32tp
	2cjXqongex7Hj9NxOE8VFKnE01nhKFakeNrY=
X-Google-Smtp-Source: AGHT+IH1wfEsl3zKB9H3Vyi4xiJuc8O27VmE0VqduNPgWy5WeVV80OQIL23LnY8tOoMP/pNpbewIu2F/rKRc58j5SR0=
X-Received: by 2002:aa7:cb57:0:b0:568:2a4d:9881 with SMTP id
 w23-20020aa7cb57000000b005682a4d9881mr247846edt.7.1709950180312; Fri, 08 Mar
 2024 18:09:40 -0800 (PST)
MIME-Version: 1.0
References: <20240308131512.44324-1-adrian.hunter@intel.com> <20240308131512.44324-2-adrian.hunter@intel.com>
In-Reply-To: <20240308131512.44324-2-adrian.hunter@intel.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 8 Mar 2024 18:09:27 -0800
Message-ID: <CANDhNCppmiSEGXErDZ5=gpWFNrS5+Y_vY3e76vhqCwpxKZ+bnw@mail.gmail.com>
Subject: Re: [PATCH 01/19] vdso: Consolidate vdso_calc_delta()
To: Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 09 Mar 2024 21:19:35 +1100
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 8, 2024 at 5:15=E2=80=AFAM Adrian Hunter <adrian.hunter@intel.c=
om> wrote:
>
> Consolidate vdso_calc_delta(), in preparation for further simplification.
>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  arch/powerpc/include/asm/vdso/gettimeofday.h | 17 ++---------------
>  arch/s390/include/asm/vdso/gettimeofday.h    |  7 ++-----
>  lib/vdso/gettimeofday.c                      |  4 ++++
>  3 files changed, 8 insertions(+), 20 deletions(-)
>
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -13,7 +13,11 @@
>  static __always_inline
>  u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
>  {
> +#ifdef VDSO_DELTA_NOMASK
> +       return (cycles - last) * mult;
> +#else
>         return ((cycles - last) & mask) * mult;
> +#endif
>  }

Nit: Just for readability, usually we avoid #ifdefs inside of functions.

Instead maybe:
#ifdef VDSO_DELTA_NOMASK
static __always_inline
u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
 {
       return (cycles - last) * mult;
 }
#else
static __always_inline
u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
 {
      return ((cycles - last) & mask) * mult;
 }
#endif
