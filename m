Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DF42D1031
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 13:14:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqMgM1xsJzDqWj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:14:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.172;
 helo=mail-oi1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqMZ22THGzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 23:09:45 +1100 (AEDT)
Received: by mail-oi1-f172.google.com with SMTP id s75so12061622oih.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 04:09:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gf4f4C3kkK3xkC5PEHsF24NiLGtD172vjUD1vi5tQTc=;
 b=OPJisr/TP4dl0wORe6JMaCnlndx28p+8VjWZ6qUUCtLUTA6/pv9FPNMdz4J3Rj6WDP
 F9LrnmsgkxQewPgrK1FsSvzMbinSu4YpDaaAf0zNFVbLw4H74FLds2ekd6WBHSCo9Jcx
 0YIYXGuirg+/ddxGodaxKxkoxvCX9KrNUFtkMbvikhLPCUYL8M7Y/b3YMq/lH2lTTHyW
 yPu4wG8348n8DsJz/QmiobyWFanNuvgEPdh4Siq7OmGaLU9j8q7tN42Jtfkde/oP1rAA
 IPv8OVU50oN+V8EUEwyWOjEEgW122uRJ/zZpyquCG57Gukl3N+U8IlTFPAUmA0tlZY6o
 lcVw==
X-Gm-Message-State: AOAM530V3n3yHiakCbgiAXPRyzJQvHyOX+0Q8o+VsOlFxOc7gUlSvJTQ
 lDHfGU3zoeMgM1jpS0MK4xfuiONTKlWCvecZDBg=
X-Google-Smtp-Source: ABdhPJzYI6ZoWUYeRuiEWXBzV3L2dm+taMvez/yyxn0R4kK5f/y0seWKWMF7FQ1S68gN4HNmvqlbVLDaRfoSXkn00BI=
X-Received: by 2002:aca:4cd8:: with SMTP id
 z207mr12066693oia.148.1607342979004; 
 Mon, 07 Dec 2020 04:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20201207120611.1315807-1-geert@linux-m68k.org>
In-Reply-To: <20201207120611.1315807-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Dec 2020 13:09:28 +0100
Message-ID: <CAMuHMdWJVgWmAOVDVcLfA7Hsv5h1tzqOt6EfgyB_eO_Jn+ESZg@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.10-rc7
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 7, 2020 at 1:08 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> JFYI, when comparing v5.10-rc7[1] to v5.10-rc6[3], the summaries are:
>   - build errors: +1/-0

  + /kisskb/src/arch/powerpc/platforms/powermac/smp.c: error: implicit
declaration of function 'cleanup_cpu_mmu_context'
[-Werror=implicit-function-declaration]:  => 914:2

v5.10-rc7/powerpc-gcc4.9/pmac32_defconfig+SMP

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/0477e92881850d44910a7e94fc2c46f96faa131f/ (all 192 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/b65054597872ce3aefbc6a666385eabdf9e288da/ (all 192 configs)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
