Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AE37F0885
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 20:42:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYLdD3nc3z3dKX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 06:42:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.176; helo=mail-vk1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYLch3KQJz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 06:41:54 +1100 (AEDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4ac28cab4efso1111553e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 11:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700422910; x=1701027710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adTtj6Nuat+3kPZs0twhHhp0MgcrTsqJHcTyGQnaplM=;
        b=oVsuO5HstUmtJhg1ctAIPEIlmHjqsY4xlz5YWmpR9HBJRcjLdf4xyGu73oHEpTZRNi
         HKNpC16PBd2f27vNPMIKPriQJhmixnIxrVL0bL0nLDQpHUNUuKhdp3f3r7oK6WeEwQIH
         F8MZdJD9O5lGkzIMqg0a80UaLdlLmmY5DtJC1bugvAXuytIy6RhbRAw6bugC37Q3SkTa
         TMbqb4DmjiirMvFKRMchgYNo7b8XdPsm+n2YXqCoPf61QDEK/QUY2CxNvKCb64hnkfG6
         4a+lS/ImanKOHKSLEHsTnOjY0B4HnskRPXstFQW/RS8QHrI+tfmSvSQMoPed9rUqtN6/
         dLkQ==
X-Gm-Message-State: AOJu0YzAW0e0WAmatyG1EFBoE3384YGyVHp532jsyBI3z8XWuD9jTSBk
	W8as0C6E3wHf/C0CP4o6TkJFB2bQeXezAA==
X-Google-Smtp-Source: AGHT+IETGYGRQ+MqaMKS5J1r5oGT9vYstvKQoT+LqHFPVMKcw9wDeoqcC1vZNxe/X5C3TdhF3YkCfA==
X-Received: by 2002:a1f:4807:0:b0:4a4:680:bfad with SMTP id v7-20020a1f4807000000b004a40680bfadmr3367927vka.7.1700422909486;
        Sun, 19 Nov 2023 11:41:49 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id o9-20020a1f5a09000000b0049d4f588b1asm1021062vkb.49.2023.11.19.11.41.48
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Nov 2023 11:41:48 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7c1a4a97144so959414241.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 11:41:48 -0800 (PST)
X-Received: by 2002:a0d:e004:0:b0:5a8:207b:48d with SMTP id
 j4-20020a0de004000000b005a8207b048dmr5075104ywe.11.1700422467692; Sun, 19 Nov
 2023 11:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20231118100827.1599422-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20231118100827.1599422-1-wangkefeng.wang@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 19 Nov 2023 20:34:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+MMiogx6TcBwxFL7AODZYhiAZpVHiafEBfnRsDaXTog@mail.gmail.com>
Message-ID: <CAMuHMdU+MMiogx6TcBwxFL7AODZYhiAZpVHiafEBfnRsDaXTog@mail.gmail.com>
Subject: Re: [PATCH] asm/io: remove unnecessary xlate_dev_mem_ptr() and unxlate_dev_mem_ptr()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 18, 2023 at 11:09=E2=80=AFAM Kefeng Wang <wangkefeng.wang@huawe=
i.com> wrote:
> The asm-generic/io.h already has default definition, remove unnecessary
> arch's defination.
>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Brian Cain <bcain@quicinc.com>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>  arch/m68k/include/asm/io_mm.h  | 6 ------

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

>  arch/sh/include/asm/io.h       | 7 -------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/mips/include/asm/io.h
> +++ b/arch/mips/include/asm/io.h
> @@ -548,13 +548,6 @@ extern void (*_dma_cache_inv)(unsigned long start, u=
nsigned long size);
>  #define csr_out32(v, a) (*(volatile u32 *)((unsigned long)(a) + __CSR_32=
_ADJUST) =3D (v))
>  #define csr_in32(a)    (*(volatile u32 *)((unsigned long)(a) + __CSR_32_=
ADJUST))
>
> -/*
> - * Convert a physical pointer to a virtual kernel pointer for /dev/mem
> - * access
> - */
> -#define xlate_dev_mem_ptr(p)   __va(p)
> -#define unxlate_dev_mem_ptr(p, v) do { } while (0)
> -
>  void __ioread64_copy(void *to, const void __iomem *from, size_t count);

Missing #include <asm-generic/io.h>, according to the build bot report.

>  #endif /* _ASM_IO_H */

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
