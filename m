Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC797401B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 18:53:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qr9lC1Z1zz3bpp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 02:53:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.182; helo=mail-vk1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qr9kh61Zqz2y1d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 02:52:59 +1000 (AEST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-460eb67244eso1590327e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 09:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687884775; x=1690476775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lIZI96K9vdLoSwUwpQZZH+ZWrx3VsFWqYpi3+69yqU=;
        b=U2Oe6CGjeu4D62Xq745bapg6QbPEiWTzWMJ6DylSkSGKmmRpKtm48fyxfco0T/fCBK
         CteS7sNJcGWkf0CMuNNCaPEFIC1NBeXB8vjSIwgjsarlfFv5gSgiuGhKQQwQipFw8Rij
         7kgKVqVeEr7KtIIliM7kMkbhVEPRWJjAqIgho43r3kd/DTeblC7K4LqcDctlJopAEnSo
         gMoEkzZZ4cnhubmw3kI0oJkMFpD4Jzs1mykpOKvxACXueBjXjqRBSm+JsU2S8vq8mV6+
         A+4xXTPvEKI/+rjjIh0gfWmmaUfz8q7Qnc/Rho6LZQ4TwjiWOd+kxxtweXyA/Yq680wZ
         jttg==
X-Gm-Message-State: AC+VfDxEmdNLAL2j8tcQqW9RVjKkPlO6eJIE5m3krMHwxUyXG1qPEjVz
	V0i/C2MAxZIB8dhzU2eAbiqdYNZN89wU5D3r
X-Google-Smtp-Source: ACHHUZ7tXEZ+9xso6ZcRhFtLDXuEkTGfeF4DWTU+0t2X6buanho6xJyqF+s2CftRYsgdgoqzYEAo0Q==
X-Received: by 2002:a1f:5cd8:0:b0:470:5862:90c0 with SMTP id q207-20020a1f5cd8000000b00470586290c0mr15963274vkb.5.1687884774948;
        Tue, 27 Jun 2023 09:52:54 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id j81-20020a1fa054000000b0047720d2aba1sm1529704vke.36.2023.06.27.09.52.54
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 09:52:54 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-440c14d6a5eso1536041137.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 09:52:54 -0700 (PDT)
X-Received: by 2002:a05:6358:f55:b0:132:d3b1:c34a with SMTP id
 c21-20020a0563580f5500b00132d3b1c34amr12105551rwj.7.1687884753801; Tue, 27
 Jun 2023 09:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-22-arnd@kernel.org>
 <OS0PR01MB5922EDAFCD6DA0313DB99C5E86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <66899d69-1339-4a61-8612-6f8e452b0b26@app.fastmail.com>
In-Reply-To: <66899d69-1339-4a61-8612-6f8e452b0b26@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jun 2023 18:52:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5gT1GDLODsUe0XibPRsRHazF4K-UhxTOQCjtC9Ba4mQ@mail.gmail.com>
Message-ID: <CAMuHMdV5gT1GDLODsUe0XibPRsRHazF4K-UhxTOQCjtC9Ba4mQ@mail.gmail.com>
Subject: Re: [PATCH 21/21] dma-mapping: replace custom code with generic implementation
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Rich Felker <dalias@libc.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, "l
 inux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Paul Walmsley <paul.walmsley@sifive.com>, Biju Das <biju.das.jz@bp.renesas.com>, Stafford Horne <shorne@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Brian Cain <bcain@quicinc.com>, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 13, 2023 at 2:52=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Thu, Apr 13, 2023, at 14:13, Biju Das wrote:
> > FYI, this patch breaks on RZ/G2L SMARC EVK board and Arnd will send V2
> > for fixing this issue.
> >
> > [10:53] <biju> [    3.384408] Unable to handle kernel paging request at
> > virtual address 000000004afb0080
>
> Right, sorry about this, I accidentally removed the 'phys_to_virt()'
> conversion on arm64.

Meh, I missed that, so I ended up bisecting this same failure...

This patch is now commit 801f1883c4bb70cc ("dma-mapping: replace
custom code with generic implementation") in esmil/jh7100-dmapool,
and broke booting on R-Car Gen3.

The following gmail-whitespace-damaged patch fixes that:

diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 97b7cea5eb23aedd..77e0b68b43e5849a 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -15,17 +15,23 @@

 static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-       dcache_clean_poc(paddr, paddr + size);
+       unsigned long start =3D (unsigned long)phys_to_virt(paddr);
+
+       dcache_clean_poc(start, start + size);
 }

 static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
-       dcache_inval_poc(paddr, paddr + size);
+       unsigned long start =3D (unsigned long)phys_to_virt(paddr);
+
+       dcache_inval_poc(start, start + size);
 }

 static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size=
)
 {
-       dcache_clean_inval_poc(paddr, paddr + size);
+       unsigned long start =3D (unsigned long)phys_to_virt(paddr);
+
+       dcache_clean_inval_poc(start, start + size);
 }

 static inline bool arch_sync_dma_clean_before_fromdevice(void)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
