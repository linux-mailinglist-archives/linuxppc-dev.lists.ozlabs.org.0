Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB25578604
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 17:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmlcx4xcKz3c7l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 01:05:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fBsqow0z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=sudipm.mukherjee@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fBsqow0z;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmlcK4JK1z3bXZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 01:04:31 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2ef5380669cso110184957b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rakaPpsPKgr9AgFMH3FHQ8xHpUEGCDbjnvgcfF2K4JQ=;
        b=fBsqow0znUWojma1Lsk0S+PJx+5XL0wfUd0UPlymTCrv3bfRh7NPXytp2ROtibNxN0
         HytHpYDYPy9ulEnHjZY+Mwt1Wfs6JLbsQVOkzOMNeNkKcmeENegS8uns5et4DqIWuzej
         hS/KQpw8627eD434QYT3ECi+qsMWO1A7k906k4sbK3CzhKePLp6koh2kFto429GYnUfs
         fbeU5/QBYesXHv7DlcwL7wftxjEWqweJcVy/fDtO4qgfk1ZVpaUXuSzeuOVJl7QukpCe
         AE1jCFhY0/P/H0yF4Nm3FdJX2yb2vsTFIkOe+TcbnqSzjKhX9FElu29jpggBvWcrdEqu
         q3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rakaPpsPKgr9AgFMH3FHQ8xHpUEGCDbjnvgcfF2K4JQ=;
        b=pQM+gv05pzr0ONWDCP6MSGAB+acnjZwzwNdBlDoo6mWXzy1+W0+baTsNfPFI0coGfq
         PHqek6n/Kno2ogUG5bPLUrqvtVJMgjR4wEOj/JcnuRLEswwhGQHzrAE0aNCfKMJQ85X3
         liK9j86XLbDBSaFTcKUwAXXVWl49aKCitrU+9UUuoIPDuxASK4DRyP5GCQyspTO9V9QG
         lRXSO1V6uDgt5+r0iPjszL7k04Km1xPynG3PNhtORDUV30umPIiIIlNjSFeZ0L7TZ4E7
         yAY1at7AQxgIEAk/dpucltmubH2Arrs/iiUFbQqm1pXtccZ7YMeaXl6sgIyqebSVzVqO
         IIsQ==
X-Gm-Message-State: AJIora88E5t0RLNt6iUgxgoVvDpEG5jusmBs6jEWf9xOIg113ErqWDhS
	fXqJo1S3H2NNGGOhXRcsTxRz27K0377loEOSEAg=
X-Google-Smtp-Source: AGRyM1uGK3eLFjBPcF0mu+w72ff/Z7ywlzrtunWw4TZDrDrxILLteA+JNelu9+dTfiK70sbdMZFhgW72cYBfe/mJHjw=
X-Received: by 2002:a81:158a:0:b0:31c:a84a:d772 with SMTP id
 132-20020a81158a000000b0031ca84ad772mr30375657ywv.233.1658156667940; Mon, 18
 Jul 2022 08:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <87cze3docs.fsf@mpe.ellerman.id.au> <20220718134418.354114-1-mpe@ellerman.id.au>
In-Reply-To: <20220718134418.354114-1-mpe@ellerman.id.au>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Mon, 18 Jul 2022 16:03:51 +0100
Message-ID: <CADVatmMSKT6yYU5bBa48DWffOBysnONRPXvoiVZnxQGj+bVQaA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/64s: Disable stack variable initialisation for prom_init
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-hardening@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Kees Cook <keescook@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 2:44 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> With GCC 12 allmodconfig prom_init fails to build:
>
>   Error: External symbol 'memset' referenced from prom_init.c
>   make[2]: *** [arch/powerpc/kernel/Makefile:204: arch/powerpc/kernel/prom_init_check] Error 1
>

<snip>

>
> Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

And, this has fixed the build failure.
Thanks Michael.


-- 
Regards
Sudip
