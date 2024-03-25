Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1106889553
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 09:25:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V35bM4SWxz3vYV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 19:25:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.181; helo=mail-yw1-f181.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V35Zw1hClz2xTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 19:24:54 +1100 (AEDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-609ff069a40so46203587b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 01:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711355090; x=1711959890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEfLIiCMu33AlwMloMoi4ICYWpFuuaEkY/DY4cDIgmE=;
        b=wslpDbZR/o07DP3HCe4A4R/1TrdON3qy63O+gLB/+rImYQTatSEoRl+pxUpn1T0JLz
         SVbdY3KzvtwKHPZH5nFs6lbwzRrMfWem/j76hnW/wM7NTRB0VP3+wQVCHFJW8cbfJqAa
         4XFb3yTB6QFp7JAaNi3ca0uOF9w5rLBaux3GN9mY8Fm4fg6zN0Ggfw2Au6h4MK/JG1UF
         Ja22O52ILgaoJFr+w+R86Rhy2qLatcBaI7NX8x2YketB1iJPyUNjabBYRPdBgqr2Xile
         WYC9tdCtxZ4khufwIdTBVj/pgTrZfmE9CXNxaRbxWkXna4aKHwzLGZWytissO+EIb8Yk
         7gAw==
X-Forwarded-Encrypted: i=1; AJvYcCUhXGbIxGhMvUUx+3F3B1U1gMI+tOu5PNb7pce16/k0qKK4ZVzsvd6CplMtVxVabYpAhXqkW4FpqebUdsBlxOHgPVs/zRE9CW5FUHSM7w==
X-Gm-Message-State: AOJu0YyI26zkyl7G6TZ3E+x/LHSckVQI47U8jl/4TfDxqW5mwV5hsK+l
	Jl6NCIbQOJM5YX5nVxzJQtLfczT42URP6IdKgKy1YNLt2Ers4F4W7ALy3+QuMFU=
X-Google-Smtp-Source: AGHT+IGUn8iSHWQsO/roH3CGYfGQv35fETDqNUd8YsK/xOhbZDipzjvvA27jG2gAikditexv+bCUnQ==
X-Received: by 2002:a81:8394:0:b0:611:2960:e52b with SMTP id t142-20020a818394000000b006112960e52bmr5120439ywf.47.1711355090169;
        Mon, 25 Mar 2024 01:24:50 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id fb1-20020a05690c310100b0060cd2266205sm936527ywb.133.2024.03.25.01.24.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 01:24:49 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-ddaad2aeab1so2209781276.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 01:24:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLwgxMYIeY4tSnhkEwyjb4J5j8heTqSONx1f0i9+Dqqz2eJ/Ng80LNOPhSQuA0gWrEukPy8LsaapsevV592rBYnW9Vhws4cNZMzi63VQ==
X-Received: by 2002:a25:a2cf:0:b0:dcc:f0a:e495 with SMTP id
 c15-20020a25a2cf000000b00dcc0f0ae495mr4291545ybn.3.1711355089475; Mon, 25 Mar
 2024 01:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240124051254.67105-1-bhe@redhat.com> <20240124051254.67105-3-bhe@redhat.com>
In-Reply-To: <20240124051254.67105-3-bhe@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Mar 2024 09:24:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxKEGYj9C1=P-493vcrN_HmLNx8gS6i1nheXO9gH46oA@mail.gmail.com>
Message-ID: <CAMuHMdVxKEGYj9C1=P-493vcrN_HmLNx8gS6i1nheXO9gH46oA@mail.gmail.com>
Subject: Re: [PATCH linux-next v3 02/14] crash: split vmcoreinfo exporting
 code out from crash_core.c
To: Baoquan He <bhe@redhat.com>
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
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baoquan,

On Wed, Jan 24, 2024 at 6:13=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
> Now move the relevant codes into separate files:
> kernel/crash_reserve.c, include/linux/crash_reserve.h.
>
> And add config item CRASH_RESERVE to control its enabling.
>
> And also update the old ifdeffery of CONFIG_CRASH_CORE, including of
> <linux/crash_core.h> and config item dependency on CRASH_CORE
> accordingly.
>
> And also do renaming as follows:
>  - arch/xxx/kernel/{crash_core.c =3D> vmcore_info.c}
> because they are only related to vmcoreinfo exporting on x86, arm64,
> riscv.
>
> And also Remove config item CRASH_CORE, and rely on CONFIG_KEXEC_CORE to
> decide if build in crash_core.c.
>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
> v2->v3:
> - There's conflict when rebasing to linux-next in kernel/crash_core.c
>   because of below commits from Uladzislau:
>   commit 699d9351822e ("mm: vmalloc: Fix a warning in the crash_save_vmco=
reinfo_init()")
>   commit 5f4c0c1e2a51 (:mm/vmalloc: remove vmap_area_list")

Thanks for your patch, which is now commit 443cbaf9e2fdbef7
("crash: split vmcoreinfo exporting code out from
crash_core.c") in v6.9-rc1.

After this, there are still two references left to CRASH_CORE:

  1. Documentation/admin-guide/kdump/kdump.rst:

         Subsequently, CRASH_CORE is selected by KEXEC_CORE::

  2. arch/loongarch/Kconfig

         config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
             def_bool CRASH_CORE

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
