Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B203A474
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jun 2019 11:21:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45M9k43FdCzDqJ8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jun 2019 19:21:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.66; helo=mail-lf1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45M9hK2Br7zDqBx
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jun 2019 19:19:44 +1000 (AEST)
Received: by mail-lf1-f66.google.com with SMTP id q26so4594592lfc.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jun 2019 02:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tm1kUkU8K0xP+6qbFcyeQd6hDSnbqz5Xinvig3WgCVk=;
 b=jupRz0csDdbFdql6TAIg4RF1GuryFryAa7FJxXa6s9RrhUg8/NkjhWsttGAJvnvIG5
 iZy9oKSmDZqM5/G7/l+dqQwhyKS7iNMX+4qtLIxZBickmx0Hi1L4GtYToV6ukc5X9egL
 GhrQrDNNe0e/RbqUjG9708dgv3mH2wfpxg1T/hCPiYCMbO2tzR0iqPplDRQRfpBv0hPu
 WxRUvG4rm2AwkYruQReNWWtYFIEivDFTtdySnSsQRrV+h7ySNaKX7K3bQMMdIGj4NWse
 W8hIyErEsvUWM/iUfJxv14X/G5vDKkKQCu3lLWFjB4UjDWHtf0P+ipZtFvdd9Z87Ssfn
 EFIw==
X-Gm-Message-State: APjAAAWyaBfFlPJeEK+YaZ801r4Zq4Kz1/7eHPK2LjeQudtp7UlqtwUf
 K+ZFvmYdwCyI6gqQqll4hLHxc+v7jeyhAQb7sTm5Vdzn
X-Google-Smtp-Source: APXvYqxnnYV8kl5R90oD40qadn5h+TZeP7RkBZTi+rdt/dFdy/gyUH8r8MQ2aYrIT1EQJA6MQAqc14471W+iVtoVwcY=
X-Received: by 2002:ac2:546a:: with SMTP id e10mr31848175lfn.75.1560071980695; 
 Sun, 09 Jun 2019 02:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <4948a096397bb86cebf489b8ac4f623797257fe7.1559933665.git.mchehab+samsung@kernel.org>
In-Reply-To: <4948a096397bb86cebf489b8ac4f623797257fe7.1559933665.git.mchehab+samsung@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 9 Jun 2019 11:19:28 +0200
Message-ID: <CAMuHMdVnBP-CJ5S0+D_H4RedkHV5m8m8wGXy-PRzaFk0JWdW8Q@mail.gmail.com>
Subject: Re: [PATCH v3 15/20] docs: move protection-keys.rst to the core-api
 book
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
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
Cc: the arch/x86 maintainers <x86@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mauro,

On Fri, Jun 7, 2019 at 9:38 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
> This document is used by multiple architectures:

Indeed it is...

>
>         $ echo $(git grep -l  pkey_mprotect arch|cut -d'/' -f 2|sort|uniq)
>         alpha arm arm64 ia64 m68k microblaze mips parisc powerpc s390 sh sparc x86 xtensa

... but not because we now have a unified space for new syscall numbers ;-)

$ git grep -w ARCH_HAS_PKEYS -- "*Kconf*"
arch/powerpc/Kconfig:   select ARCH_HAS_PKEYS
arch/x86/Kconfig:       select ARCH_HAS_PKEYS
mm/Kconfig:config ARCH_HAS_PKEYS

I.e. limited to x86 and powerpc.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
