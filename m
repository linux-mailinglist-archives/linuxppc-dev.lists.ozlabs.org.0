Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A843A714C7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 16:51:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVJQ63RD0z3fBb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 00:51:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OmhRTIWK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OmhRTIWK;
	dkim-atps=neutral
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVJPJ1WFrz3bck
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 00:50:59 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-565ba6aee5fso39618197b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 07:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685371857; x=1687963857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkEVYGTJUZLFC58767MzB3G1DJSBq+gVyG1W6RWmlbg=;
        b=OmhRTIWKrDsYJ3rUntEtfxHtHZFmjJNL/2Y9uhSCFac/J5jZcmQRgSWBb5S2LQ2mdh
         duMLDq7I6cBIR9Ck7Ohj7Gpe0ETo+iNl7otudyBpDBu+drz/siEmGBPqVIHbDhUCHtX6
         4SZkVCbgKpfU+p25VNSqPYJz93dhEiAv4cPsWu8zkiu1xRWPY3GypqjaAwT1eVqXinwn
         +Fsy/NIZeOxwdvvxZBQdiVQn4k64Frn/315+u+Gbx9DDK6JEk5cwmvbiRHl92rhcCEjK
         ceaBdsANLZWN3eYRfz/T6+azlqxVPxCsX9tNkhGLg5G34XxO1ry1YjaVIvy7cC47vLwJ
         XLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685371857; x=1687963857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkEVYGTJUZLFC58767MzB3G1DJSBq+gVyG1W6RWmlbg=;
        b=OpwNJkrx9spI50UV5MXOpXLUT3GzBEd+uitnk9l6qGKzA+XHMloiPfAz2fQpdY2mKi
         uY1C9QJbNuPlpPgeQTj6pjwcJyd0MCcxTYd02pnFO87thBg1vhzz18MeOW+An2kLTeI2
         pVRF3kswMrJo5YcS9o8o+c4peD+tRP0Zr8XhSOjwsGGgtkdzFYn30tIllgMuN+d+L+Jm
         TBZR5mcg6IgyNnO5O/bGMJtIAIZ38tL0IePCCp51OQgtirlA8jkNhh7aoChdv/8JhYAI
         8/McUiBceXFNcGQJjZ+kp7wxUTJjL2zT8ATn+iqPZJ8zsgeLIJVuOoA4Ft2O+uCz7aUZ
         I04A==
X-Gm-Message-State: AC+VfDx7e6Ha+iatvWVNtGPvqtKo7LIJcTncGQFr12LIhW6ixPJl74p7
	DI6YmuA1CBHcDjbo2swSdnG6nVj6nC+ACc58ZUI=
X-Google-Smtp-Source: ACHHUZ4rA0teGRMDGuJZYpJ+GFmlEtn7TRGDLCIQSWMud+MUpT/Tia6X8InL7vZ8KEiVQ32oJgojT/fMedJxY939slI=
X-Received: by 2002:a81:6dd7:0:b0:565:2d3d:cd07 with SMTP id
 i206-20020a816dd7000000b005652d3dcd07mr11200613ywc.35.1685371856906; Mon, 29
 May 2023 07:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230529052821.58175-1-maninder1.s@samsung.com>
 <CGME20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3@epcms5p1>
 <CANiq72ncDr68qeahrHuQ63dj1Va3=Us6ZSjGRkr6Zp8j+=yH_Q@mail.gmail.com> <20230529105707epcms5p1418eac680ebe1736196706b0db80dd39@epcms5p1>
In-Reply-To: <20230529105707epcms5p1418eac680ebe1736196706b0db80dd39@epcms5p1>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 May 2023 16:50:45 +0200
Message-ID: <CANiq72n_eso7_pgna8ukmEnuCQPsKYPr0NU-Ss9Nwv0VzX=etg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch:hexagon/powerpc: use KSYM_NAME_LEN in array size
To: maninder1.s@samsung.com, "keescook@chromium.org" <keescook@chromium.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>, "bcain@quicinc.com" <bcain@quicinc.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>, "pmladek@suse.com" <pmladek@suse.com>, "ustavoars@kernel.org" <ustavoars@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Onkarnath <onkarnath.1@samsung.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 29, 2023 at 1:08=E2=80=AFPM Maninder Singh <maninder1.s@samsung=
.com> wrote:
>
> I Will add co-developed-by` tag.
> because this change was identified while we were working on kallsyms some=
 time back.
> https://lore.kernel.org/lkml/YonTOL4zC4CytVrn@infradead.org/t/
>
> this patch set is pending and we will start working on that again, so i t=
hought better
> to send bugfix first.

Sounds good to me!

(Fixed Wedson's email address)

> Yes, I think second buffer was not related to kallsyms, so I have not tou=
ched that.

Kees: what is the current stance on `[static N]` parameters? Something like=
:

    const char *kallsyms_lookup(unsigned long addr,
                                unsigned long *symbolsize,
                                unsigned long *offset,
    -                           char **modname, char *namebuf);
    +                           char **modname, char namebuf[static
KSYM_NAME_LEN]);

makes the compiler complain about cases like these (even if trivial):

    arch/powerpc/xmon/xmon.c:1711:10: error: array argument is too small;
        contains 128 elements, callee requires at least 512
[-Werror,-Warray-bounds]
            name =3D kallsyms_lookup(pc, &size, &offset, NULL, tmpstr);
                 ^                                           ~~~~~~
    ./include/linux/kallsyms.h:86:29: note: callee declares array
parameter as static here
            char **modname, char namebuf[static KSYM_NAME_LEN]);
                                 ^      ~~~~~~~~~~~~~~~~~~~~~~

But I only see 2 files in the kernel using `[static N]` (from 2020 and
2021). Should something else be used instead (e.g. `__counted_by`),
even if constexpr-sized?.

Also, I went through the other callers to `kallsyms_lookup` to see
other issues -- one I am not sure about is `fetch_store_symstring` in
`kernel/trace/trace_probe_tmpl.h`. Steven/Masami: is that "with max
length" in the function docs enough? Is it 0xffff?

Thanks!

Cheers,
Miguel
