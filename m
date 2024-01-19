Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8BA83309C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 23:04:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ALqxF4Ht;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGtv33qbWz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 09:04:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ALqxF4Ht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=palmer@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGttB1hJ3z2ykx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 09:03:44 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5cf87cdc4c5so1060736a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 14:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705701822; x=1706306622; darn=lists.ozlabs.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aaVzBMeeZblMbEUbDFmZomg/HzP8H1Gn+gnGtwevNs=;
        b=ALqxF4HtFbig4bzeKUVd9UOXExa7EsKY9NG98K4VP+iJ0TXaISbub6bYudYvh8X3uZ
         72IyxNNWadXKFxQ5E6TOkLZaNb8sxvbxPBt1m7pVxxD0stO5y+7FZSpxsXyMYwnuHjEo
         uynTH4E4I3ukzgHu8k4fWKadW/5hN1C3//yrR3ZKcqtHRLrQEsbgNJuHyKsFC2s2JF1a
         6Sl5sfW475UCY2qpBWLzOI0mwn13sV4NRe01t9rH7EuLCgX6GtfNYNXqgBgsKfhwFye6
         +UqxXYzsl9znV0nTdairSgYkRWF5EAaXTanQQa53DshNFwGHkANClm071tlANYaK2mhv
         i0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705701822; x=1706306622;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aaVzBMeeZblMbEUbDFmZomg/HzP8H1Gn+gnGtwevNs=;
        b=dHQ7bcjNLo0j6RDfluS0FN3eirz2Hbu2WDjjMsYhvLrbNJpLTlKXv6Awq9JWodtS4/
         8Bb7TE4tCPpmaiX/TMRn6f5vIbLyuIAmvguIwvgfKHfOjRT+NO20MPzhSAggGWGTxLpF
         ARkKF+yuHRbRmg/WaOXOV6T7++bBQv5vWzzna2AOkIdFsj1mcqvz7PiR+JFpiAi82IPD
         o6NAqIH7pSE9p8Q29pip4EZwjfgJYJbNIkXAQRyeOSpEVAVMCWKhdg+vMsHOI+nhB8Cj
         VYBmQzp4GGezNhiyS1VsRfYTpEuec60FxPBAsDiA6fvqUyo9T1maOECej7jd9K/gV1y7
         WpfA==
X-Gm-Message-State: AOJu0Yx7UOSbnlSVkOt8berwGm2r39YiBk4No6avp3Qm+rpZYQHtAfVK
	z4m44nrzfEfQRrZ6loxSz2wPPFWpEOL+owW5VU6A/e/9S60l/Sua2Z1SbXKNCNg=
X-Google-Smtp-Source: AGHT+IGftZP2Jl+VwJV08AVdkfiAwWPWCiEg5yYwDaS6Y+0pO5wM+PStwOKVnAiNRaDx+cdEX7oaxg==
X-Received: by 2002:a17:90b:30c6:b0:28f:f70f:ee60 with SMTP id hi6-20020a17090b30c600b0028ff70fee60mr415981pjb.8.1705701821779;
        Fri, 19 Jan 2024 14:03:41 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id e16-20020a170902cf5000b001d5c38bfa33sm3486111plg.307.2024.01.19.14.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 14:03:41 -0800 (PST)
Date: Fri, 19 Jan 2024 14:03:41 -0800 (PST)
X-Google-Original-Date: Fri, 19 Jan 2024 14:03:11 PST (-0800)
Subject: Re: [PATCH] tty: hvc: Fix the RISC-V SBI driver for a refactoring
In-Reply-To: <20240119215612.20529-2-palmer@rivosinc.com>
Message-ID: <mhng-dd8222be-f59f-4422-8cf5-dbefccf63f5f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, Greg KH <gregkh@linuxfoundation.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Jan 2024 13:56:13 PST (-0800), Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> I missed the int->size_t refactoring in f32fcbedbe92 ("tty: hvc: convert
> to u8 and size_t"), which causes the newly used ops in 88ead68e764c
> ("tty: Add SBI debug console support to HVC SBI driver") to fail to
> build due to a
>
> linux/drivers/tty/hvc/hvc_riscv_sbi.c:59:15: error: incompatible function pointer types initializing 'ssize_t (*)(uint32_t, const u8 *, size_t)' (aka 'long (*)(unsigned int, const unsigned char *, unsigned long)') with an expression of type 'int (uint32_t, const char *, int)' (aka 'int (unsigned int, const char *, int)') [-Wincompatible-function-pointer-types]
>         .put_chars = hvc_sbi_dbcn_tty_put,
>
> Fixes: f32fcbedbe92 ("tty: hvc: convert to u8 and size_t")
> Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI driver")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> I now remember Anup pointing this one out, but looks like I forgot about
> it.
> ---
>  drivers/tty/hvc/hvc_riscv_sbi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
> index 2f3571f17ecd..c08718be8e73 100644
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -15,7 +15,7 @@
>
>  #include "hvc_console.h"
>
> -static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
> +static size_t hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)

I got a little lost in my branches here, that should be "ssize_t".  I'll 
send a v2 when I figure out why my tester is acting oddly...

>  {
>  	int i;
>
> @@ -25,7 +25,7 @@ static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
>  	return i;
>  }
>
> -static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
> +static size_t hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
>  {
>  	int i, c;
