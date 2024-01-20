Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 881638332AD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 05:00:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l99+XTIl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TH2nS4n5gz3cMH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 15:00:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l99+XTIl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TH2mf1T6Cz3bXk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 14:59:27 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3608aa647bfso7026575ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 19:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1705723163; x=1706327963; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUdj33zU6WPp9NMXR1jDLao5OoMg89mIJNooFVUpnh0=;
        b=l99+XTIlH/3WjMt1OVORZ95mSXpl4zcpqIRjgKZoKC5o8+1B1AvHkcfgi2BHU68Ydz
         vZp0qkTL2ZccsOjGRjkGTePomAbzIxt+j3/xQxMb7ViAHomVmLmyOCWzY+gEb4fNCcDW
         Cr3Kxs9UnYi4gMehSwcx9SCsD6Y+AmzImEIGxQavVxRVAKQYMO2BfYiuxLfG5j+q9XbH
         zN1xVqPnoZW0hxj1fe4QSroccWOXCjXzu8ft02DJHtYeD2jrSZodOn3JT3iNrcaxeCoh
         Wdg2LVNDpiTs+59tA/X4xdC9CfHqhexVO26FSvvlGfXsff8DW+fJmWYO1CEPu0pLzNWX
         hM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705723163; x=1706327963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUdj33zU6WPp9NMXR1jDLao5OoMg89mIJNooFVUpnh0=;
        b=Wuy7YJ2kb96zwxz/B4w1QxpCp8Q1ZvSy1FsnxgfhD+GqeYHaWTP6w9xuhYRuv6clW1
         srdvVNvAAHLE99PsKIAgoKPw0BBU74Nd0ogxJW9D9L+IoOjw3Boxamoz1Xk4LDgSB6ov
         DhczWp8Kxyw27mTDZV24cNdd5VFZ3ClsOJDVefVy/8cM+hA5upc+3UfaLu4ZYVM3Qrm8
         39ep0Z+1acI4uZn/+IU2AkBwEbRv45/e4cAkViL8x6diUrm9nO7Np+kXH7lI8aX4ZlDQ
         DMfoIAEFIsdMUHojhXrtM9MdWGQS0Jfo2eMBB95Cxo30ZDjbSX6uFyGXRl6Y2ukEd+Lb
         3ytg==
X-Gm-Message-State: AOJu0Yxk/59C49WMSwtI7wOAj8FQAxAO9WMp3hCQNqCA1uS2DJBe/pc2
	FciwYs0mbRLHxjJITH65Uyk7nhtub3TKfC2dYK5RQFxveaM34XOZUVWuf8XxuJ80++dOjJlwOMx
	oOXbMGpiRM1uPz+/hd7AGtJ/AbqUJEmXK+fvXXA==
X-Google-Smtp-Source: AGHT+IE/vAYx8mnNdDKMAblUXSdltL/8n5TCQTrCXmLC8zaNaqz1vAs/Oe/IS8XQjJqKfiNn3hNoFDPDJZHtazYV8Ls=
X-Received: by 2002:a92:b70a:0:b0:360:7190:f895 with SMTP id
 k10-20020a92b70a000000b003607190f895mr854939ili.52.1705723162955; Fri, 19 Jan
 2024 19:59:22 -0800 (PST)
MIME-Version: 1.0
References: <20240119224404.26695-2-palmer@rivosinc.com>
In-Reply-To: <20240119224404.26695-2-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Jan 2024 09:29:11 +0530
Message-ID: <CAAhSdy0naZf8aKkAH6MgYyLior3rZEjx0WWWgp4Ljakrb5q5XQ@mail.gmail.com>
Subject: Re: [PATCH v2] tty: hvc: Fix the RISC-V SBI driver for a refactoring
To: Palmer Dabbelt <palmer@rivosinc.com>
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, Greg KH <gregkh@linuxfoundation.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 20, 2024 at 4:15=E2=80=AFAM Palmer Dabbelt <palmer@rivosinc.com=
> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> I missed the int->size_t refactoring in f32fcbedbe92 ("tty: hvc: convert
> to u8 and size_t"), which causes the newly used ops in 88ead68e764c
> ("tty: Add SBI debug console support to HVC SBI driver") to fail to
> build due to a
>
> linux/drivers/tty/hvc/hvc_riscv_sbi.c:59:15: error: incompatible function=
 pointer types initializing 'ssize_t (*)(uint32_t, const u8 *, size_t)' (ak=
a 'long (*)(unsigned int, const unsigned char *, unsigned long)') with an e=
xpression of type 'int (uint32_t, const char *, int)' (aka 'int (unsigned i=
nt, const char *, int)') [-Wincompatible-function-pointer-types]
>         .put_chars =3D hvc_sbi_dbcn_tty_put,
>
> Fixes: f32fcbedbe92 ("tty: hvc: convert to u8 and size_t")
> Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI drive=
r")
> Link: https://lore.kernel.org/r/20240119215612.20529-2-palmer@rivosinc.co=
m
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> Changes since v1 <20240119215612.20529-2-palmer@rivosinc.com>:
> * Fix the return and arguments correctly.
> * Also fix the hvc_sbi_dbcn_tty_{get,put}().
> ---
>  drivers/tty/hvc/hvc_riscv_sbi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_=
sbi.c
> index 2f3571f17ecd..f8cd3310ef35 100644
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -15,7 +15,7 @@
>
>  #include "hvc_console.h"
>
> -static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
> +static ssize_t hvc_sbi_tty_put(uint32_t vtermno, const u8 *buf, size_t c=
ount)
>  {
>         int i;
>
> @@ -25,7 +25,7 @@ static int hvc_sbi_tty_put(uint32_t vtermno, const char=
 *buf, int count)
>         return i;
>  }
>
> -static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
> +static ssize_t hvc_sbi_tty_get(uint32_t vtermno, u8 *buf, size_t count)

The hvc_sbi_tty_put() and hvc_sbi_tty_get() functions are already
updated in Linus's tree. We only need to fix hvc_sbi_dbcn_tty_put()
and hvc_sbi_dbcn_tty_get()

Please rebase this fix upon Linux-6.8-rc1 whenever that is available.

>  {
>         int i, c;
>
> @@ -44,12 +44,12 @@ static const struct hv_ops hvc_sbi_v01_ops =3D {
>         .put_chars =3D hvc_sbi_tty_put,
>  };
>
> -static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int c=
ount)
> +static ssize_t hvc_sbi_dbcn_tty_put(uint32_t vtermno, const u8 *buf, siz=
e_t count)
>  {
>         return sbi_debug_console_write(buf, count);
>  }
>
> -static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
> +static ssize_t hvc_sbi_dbcn_tty_get(uint32_t vtermno, u8 *buf, size_t co=
unt)
>  {
>         return sbi_debug_console_read(buf, count);
>  }
> --
> 2.43.0
>
>

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup
