Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 520D7603435
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 22:47:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsQsp1svfz3dt0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 07:47:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.41; helo=mail-qv1-f41.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ms5KN6wl2z2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 18:36:55 +1100 (AEDT)
Received: by mail-qv1-f41.google.com with SMTP id i9so8837109qvu.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 00:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mwq8mRE5qiqVJEFTV8PMaTxlxiFl0HRvXCI1ESDIAgA=;
        b=6bv5iKb4bGjIUnOrFcPFVu6vfMRMf03XuLlXJNnyrDP0fuS5nS+dXy6UlfMU21wUII
         wn+vL8o7DJNJi15P5U87+8cXAUFF+vcCDoySwi8X8VpxL2UEhyhX/jCof/qrnhEmdQ2o
         zsP4A8JRTbFiE/ZhQ3ft2wB2rJGkCprfauTo5IO7i1k4GPe3quCvwoU6n5wvb/cv9QzL
         h9wlUWNJOmSPHErJTdbVD21FiMYtb6gkU9OaSNCW6gCSJb17VjGlX1Q8tryJrsgYplCR
         1DdNy2b4uFhTQytHe4/e7vmfydVf4KYvDAXXeAiBNKRXPBXBxW9jNTM5K7lNzuy6vQHQ
         B5hQ==
X-Gm-Message-State: ACrzQf2F332CYOHxoKJFgOR3zB7O4kYTZA4Piz2c+lfC16FFw/mnNQ5X
	TfYPJU8piYD6OZvWGb5xVsi7w+El9rmtdz6z
X-Google-Smtp-Source: AMsMyM4TO2rohnsNqn8RjbdpvaS+eeG/dGtzAOZL55Bt+p3Hp1/LkC+LSgijf7fNuYQz9+fEkL6KXQ==
X-Received: by 2002:a0c:a9d0:0:b0:4b4:3f85:f282 with SMTP id c16-20020a0ca9d0000000b004b43f85f282mr1356936qvb.24.1666078611673;
        Tue, 18 Oct 2022 00:36:51 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id w18-20020a05620a425200b006eeb25369e9sm1866673qko.25.2022.10.18.00.36.51
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 00:36:51 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 126so16010495ybw.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 00:36:51 -0700 (PDT)
X-Received: by 2002:a81:848c:0:b0:356:e173:2c7a with SMTP id
 u134-20020a81848c000000b00356e1732c7amr1276352ywf.502.1666078253767; Tue, 18
 Oct 2022 00:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221018074014.185687-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20221018074014.185687-1-wangkefeng.wang@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2022 09:30:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwAgPkifAkah7MoBKBoyB4tb+HM5cgvenwNFaAfbg+UQ@mail.gmail.com>
Message-ID: <CAMuHMdWwAgPkifAkah7MoBKBoyB4tb+HM5cgvenwNFaAfbg+UQ@mail.gmail.com>
Subject: Re: [PATCH] mm: remove kern_addr_valid() completely
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 19 Oct 2022 07:46:46 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, linux-sh@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Greg Ungerer <gerg
 @linux-m68k.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Richard Henderson <richard.henderson@linaro.org>, Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, x86@kernel.org, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, li
 nux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 18, 2022 at 9:25 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> Most architectures(except arm64/x86/sparc) simply return 1 for
> kern_addr_valid(), which is only used in read_kcore(), and it
> calls copy_from_kernel_nofault() which could check whether the
> address is a valid kernel address, so no need kern_addr_valid(),
> let's remove unneeded kern_addr_valid() completely.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>  arch/m68k/include/asm/pgtable_mm.h        |  2 -
>  arch/m68k/include/asm/pgtable_no.h        |  1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
