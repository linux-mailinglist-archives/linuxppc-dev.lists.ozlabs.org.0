Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC484CF89A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 10:57:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBv5N6LMQz3bWm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 20:57:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.179;
 helo=mail-qk1-f179.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBv4w4BNHz2yws
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 20:57:03 +1100 (AEDT)
Received: by mail-qk1-f179.google.com with SMTP id g24so11442388qkl.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Mar 2022 01:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y5/GrbGP30m/mBAfAcX6vDwX2g44JqlyQq0dC+zaJsw=;
 b=aXmPB7Jr2/yVEP32SG3K7rOpR5Pa/wNB9I3OY8S5Yg0lOgFLA+mmN3v+a6AyFHlEcP
 nKwCJsul4SfAbiGbRRw/peQPDuC2Pu2dblDTexOnl83iI2qnDbug2I/r0jCRWZNi58+6
 WcdM/go83RaCm0/2B6uluUfbD/AKt/+Nj06DwQEFScuCHf6+IfCaoeKS/ZG0FCPjJ32A
 ieDiE5h050Th4aWk9wXzVQ2NT4DYthblovYEsypV+L3yy9JpGZ7xU4PWVCOVJdHLKj/2
 CtkLSmufAK4x1qM69VMB1QRO9MFTrCacMyeiEviB7lRY+TculA/JDJ8MtAeBUU8XLCnL
 jZPw==
X-Gm-Message-State: AOAM530Rvrxh49EiacmtXgFAGeE8vDeNJ0gQ0SJ6C4cES1B73EztNOgs
 am5gT6M37ZZJ04940C3U0j8tNjMznS/wxA==
X-Google-Smtp-Source: ABdhPJxFbWk4vZBGXKJGB6uz0wUwlilfEY74puJBImfDFdanjkwzS1bHeMn+cddqbvqgDjl4Fx0SXg==
X-Received: by 2002:a05:620a:f13:b0:47a:e669:8806 with SMTP id
 v19-20020a05620a0f1300b0047ae6698806mr6269747qkl.323.1646647020506; 
 Mon, 07 Mar 2022 01:57:00 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 x23-20020a05620a14b700b00648eb7f4ce5sm5742202qkj.35.2022.03.07.01.57.00
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 01:57:00 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2dc28791ecbso143362217b3.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Mar 2022 01:57:00 -0800 (PST)
X-Received: by 2002:a0d:f1c7:0:b0:2db:d2bc:be11 with SMTP id
 a190-20020a0df1c7000000b002dbd2bcbe11mr7687812ywf.62.1646647019946; Mon, 07
 Mar 2022 01:56:59 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wjkkYX8OvTv60+XvQkAK4Pg0QC0Hn-4+n7Q0t1+QWw7Sw@mail.gmail.com>
 <20220307081540.2716107-1-geert@linux-m68k.org>
In-Reply-To: <20220307081540.2716107-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Mar 2022 10:56:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=S=BJouptLGw12CbAqeYbBYwnsdrn90C_04n6s4H7bg@mail.gmail.com>
Message-ID: <CAMuHMdW=S=BJouptLGw12CbAqeYbBYwnsdrn90C_04n6s4H7bg@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.17-rc7
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
Cc: sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 7, 2022 at 10:21 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> JFYI, when comparing v5.17-rc7[1] to v5.17-rc6[3], the summaries are:
>   - build errors: +4/-1

  + /kisskb/src/arch/powerpc/kernel/stacktrace.c: error: implicit
declaration of function 'nmi_cpu_backtrace'
[-Werror=implicit-function-declaration]: 171:2 => 171:9, 171:2
  + /kisskb/src/arch/powerpc/kernel/stacktrace.c: error: implicit
declaration of function 'nmi_trigger_cpumask_backtrace'; did you mean
'arch_trigger_cpumask_backtrace'?
[-Werror=implicit-function-declaration]:  => 226:9

powerpc-gcc11/skiroot_defconfig (this is a new config)
Seen before with powerpc-gcc5/skiroot_defconfig.

  + /kisskb/src/crypto/blake2b_generic.c: error: the frame size of
2288 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  =>
109:1

sparc64-gcc11/sparc-allmodconfig

  + error: arch/powerpc/kvm/book3s_64_entry.o: relocation truncated to
fit: R_PPC64_REL14 (stub) against symbol `machine_check_common'
defined in .text section in arch/powerpc/kernel/head_64.o:  =>
(.text+0x3e4)

powerpc-gcc5/powerpc-allyesconfig

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/ffb217a13a2eaf6d5bd974fc83036a53ca69f1e2/ (all 100 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/7e57714cd0ad2d5bb90e50b5096a0e671dec1ef3/ (99 out of 100 configs)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
