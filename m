Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E727D77DB5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 09:47:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQgG05h7Fz3cVg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 17:47:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.175; helo=mail-qk1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQgFT1HnCz2xdt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 17:46:51 +1000 (AEST)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-76754b9eac0so424501085a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 00:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692172008; x=1692776808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkTNstwI73s4YFo3/SQhtE6/OXSa9yBSjbdY7mJiIyI=;
        b=MOLrvpdJhlbj4k1fIFbHlxwtUbG51/9nRkGQZAi8OwXQJw5Ph2emprlfq0Vfr4Jse8
         KfqQJC/lEVgj9CZQ1meteExqu8zbhdWyTcdjJq9ZhedrS9aV2vzXCYJ0PGN7BpSR+jZ/
         v4CFw7ahUD8PB5MLer8PxQ/1mSvWJuY1wif240jJeAAT7xk+pXv4HDtNGMceCx8fR+Hq
         nb7fVwIa3XNsqeI6g/gwtDJMFdkkJqyKpVYDGW8JDNjPb6HEaYs2qWllMeyXLv/FByGV
         VbXnFf4f0vpN3ZxT6oyZClNJOQJEG7/W3l3/ysLvJ+tbqks+yPURKZo/R1pILIeFyn+z
         z7WA==
X-Gm-Message-State: AOJu0YxgntjACN+eB5FVUIckQn63txW6ZQmaFj4+Nq9gz69FZnGKdhoY
	O6WKLt+7gHOLFhqixCPCx40Pkd5TRMIbQw==
X-Google-Smtp-Source: AGHT+IExXj1gIEbiqENN10wN+qbMxZPu40+YjR90JJNYnOXX8cVNGABGi3k5MVZgXzJ/p7bTMV1Uvg==
X-Received: by 2002:ac8:57d6:0:b0:400:9390:d129 with SMTP id w22-20020ac857d6000000b004009390d129mr1398658qta.36.1692172007742;
        Wed, 16 Aug 2023 00:46:47 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id ay24-20020a05622a229800b00403cc36f318sm4343098qtb.6.2023.08.16.00.46.47
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 00:46:47 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76d70fb1369so17488685a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 00:46:47 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:76c:5715:b4a3 with SMTP id
 de17-20020a05620a371100b0076c5715b4a3mr1484328qkb.13.1692171688197; Wed, 16
 Aug 2023 00:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230816055010.31534-1-rdunlap@infradead.org>
In-Reply-To: <20230816055010.31534-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2023 09:41:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWF0LseSGK6=aodXaoK9D16mxok4DDRs=gKoGox8k6zjg@mail.gmail.com>
Message-ID: <CAMuHMdWF0LseSGK6=aodXaoK9D16mxok4DDRs=gKoGox8k6zjg@mail.gmail.com>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Masahiro Yamada <masahiroy@kernel.org>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Boge
 ndoerfer <tsbogend@alpha.franken.de>, Max Filippov <jcmvbkbc@gmail.com>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Randy,

On Wed, Aug 16, 2023 at 7:50=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
> There is only one Kconfig user of CONFIG_EMBEDDED and it can be
> switched to EXPERT or "if !ARCH_MULTIPLATFORM" (suggested by Arnd).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Makes perfect sense to me.

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
