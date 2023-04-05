Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D676D8B36
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 01:46:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsLr51CW4z3fBL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 09:46:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MmFH3Zf2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MmFH3Zf2;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsLqF3Skvz3cBP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 09:45:43 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-500349a5139so4299245a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Apr 2023 16:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1680738339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kzqf201an38ArCTju9fdnnRDIzPUKA5H25bQRmA6lYA=;
        b=MmFH3Zf2aD4FRFjsu3xr8cxuOm2Ne8U8sdkhVR5NLMAywiZTfd2MwVx2GhT3rWHkM+
         pR9ZtMV3lQwVcgtvjp85kGVs+90wQRoHj2LpSL/AP8/ZOhq8VVLXPt2YLZ944CM4SE9q
         iit9vR853TWKK6S752NGOXKPiyoEHzWhcGtNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680738339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kzqf201an38ArCTju9fdnnRDIzPUKA5H25bQRmA6lYA=;
        b=G37c+Inuwi7ovLZoPfp3VTY+GaAaLUTQdDdRsBwnE+C8RKhn6MfvXCEYD+ycjulZr4
         /OLJQ4I0+eqXJz+qNQTGFK3nZJ7f4yxL1iqLu31Q0HMr4us4suh0PjsqhDZjfgiS3Blt
         LA2y4RnXn8nUDj6siyXFGqLU/WpwVDbQuNofDHtKcdT/RYljroh5ykWmIl2KxvA4M5Bo
         5tcT6C5wZpX2P7yXcu9bLybyOkM4CXgmcp8M586FN1uhp5a/VodKXlaFjMox+fzzjlMm
         S4Wp3n9gzW+RUbLDiwRxmjB9KdhYFYKF1ZI3pKTaTol8cHifNdLxK2LmOmtYXenOrsTZ
         naLA==
X-Gm-Message-State: AAQBX9e+1C2+eHdUvrTpXHdmMvxBR0Sr3nxmRmqeMz48rMMxT+aFp/PJ
	w8W17+skQNNg+d0S6Q7a9/o4phn2YNz3RzjBEJw=
X-Google-Smtp-Source: AKy350YCwHg6lOWS/NQyziUctmuLoShEo2Jl0H/kt3uyA/4hYAhlwuwBdMYrufJYRGZROr/W23Os0KviCW51xixVo/8=
X-Received: by 2002:a50:9e09:0:b0:4fb:7ccf:337a with SMTP id
 z9-20020a509e09000000b004fb7ccf337amr2002627ede.3.1680738339150; Wed, 05 Apr
 2023 16:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230327124520.2707537-1-npiggin@gmail.com> <20230327124520.2707537-11-npiggin@gmail.com>
In-Reply-To: <20230327124520.2707537-11-npiggin@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Apr 2023 23:45:27 +0000
Message-ID: <CACPK8Xfpsn7QoSUCZM_z7yaG5hda409ZhehXyzsgEnwOXagNwQ@mail.gmail.com>
Subject: Re: [kvm-unit-tests v3 10/13] powerpc: Add support for more
 interrupts including HV interrupts
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

On Mon, 27 Mar 2023 at 12:55, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Interrupt vectors were not being populated for all architected
> interrupt types, which could lead to crashes rather than a message for
> unhandled interrupts.
>
> 0x20 sized vectors require some reworking of the code to fit. This
> also adds support for HV / HSRR type interrupts which will be used in
> a later change.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  powerpc/cstart64.S | 79 ++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 65 insertions(+), 14 deletions(-)
>
> diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S

> +handler_trampoline:
> +       mfctr   r0
> +       std     r0,_CTR(r1)
> +
> +       ld      r0, P_HANDLER(0)
> +       mtctr   r0
> +
> +       /* nip and msr */
> +       mfsrr0  r0

I tried building the tests on a power8 box with binutils 2.34 and gas complains:

powerpc/cstart64.S: Assembler messages:
powerpc/cstart64.S:337: Error: unrecognized opcode: `mfhsrr0'
powerpc/cstart64.S:340: Error: unrecognized opcode: `mfhsrr1'

It appears this mnemonic is only supported for power10 (and were only
added in binutils 2.36):

$ git grep -i mfhsrr
opcodes/ppc-opc.c:{"mfhsrr0",   XSPR(31,339,314), XSPR_MASK, POWER10,
 EXT,            {RS}},
opcodes/ppc-opc.c:{"mfhsrr1",   XSPR(31,339,315), XSPR_MASK, POWER10,
 EXT,            {RS}},

I replaced it with mfspr and the tests ran fine:

@@ -334,10 +338,10 @@ handler_htrampoline:
        mtctr   r0

        /* nip and msr */
-       mfhsrr0 r0
+       mfspr   r0, SPRN_HSRR0
        std     r0, _NIP(r1)

-       mfhsrr1 r0
+       mfspr   r0, SPRN_HSRR1
        std     r0, _MSR(r1)

Cheers,

Joel
