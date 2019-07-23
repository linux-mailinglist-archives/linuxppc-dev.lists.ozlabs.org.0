Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBDB725A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 06:01:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thTq1SxXzDqBh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 14:01:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.194; helo=mail-oi1-f194.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tN2l5Th5zDqMH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 01:39:53 +1000 (AEST)
Received: by mail-oi1-f194.google.com with SMTP id l12so32652993oil.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 08:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3LRI5UFjq44LBBsGkyZn0c1iwjTBwJ4UTljGvj/dw6Y=;
 b=awJTj8TxRJsoZzSD398iuE6fVSayLWBRbtJBzk7TNrqbuhfPioYl7qcSNdFz//nzMr
 iLC5xe/JVd9fpzkdGVjT+ZOkdJcCrHkRz9iBl92jKvMSO8Mdgtp7MECh+eRF6aPPGcFz
 Mxh6I+rFguzHH0mDBcAOZfLfDBfrNBglVI0OQ+RyAjA/BTolWfwHHo9b1sQbLEXw3IM+
 bMpa7Lg/Oxtg6g5UEhpbGaDOvOSynyMWcEsW/BghzbnFkppwY9HwGUBFT1mLmrQWxjcp
 jgcBk85JdVH2rAseI0X8/BGiLX3M5ymI5rryho0gdFXprtzEvlE0h1DI/slaJgjcMNA3
 lpGg==
X-Gm-Message-State: APjAAAULzfYkntOlTjxjj1jfWlL0z/r29nWTD63bjMo/VFi6KEacuEBm
 2zFHcrK+hp/OWuB5/cJtLFkcOesFYhZ/A1H5YuI=
X-Google-Smtp-Source: APXvYqwCaeRX0/ukewQLWY9NtFhKzlFerKVFsRpBXybOEA8aU+bcGmK/xxtuS8ZeOR85kl+PHrPdml7b97UouubKPrk=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr34013805oif.148.1563896390666; 
 Tue, 23 Jul 2019 08:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190723080441.19110-1-geert@linux-m68k.org>
In-Reply-To: <20190723080441.19110-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jul 2019 17:39:39 +0200
Message-ID: <CAMuHMdVuVqXnW8SEnpcbvh8agYvPh775rv9tmV9kGUa6Q2wcwA@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.3-rc1
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, Parisc List <linux-parisc@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 23, 2019 at 5:22 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.3-rc1[1] compared to v5.2[2].

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/5f9e832c137075045d15cd6899ab0505cfb2ca4b/ (241 out of 242 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/0ecfebd2b52404ae0c54a878c872bb93363ada36/ (all 242 configs)
>
>
> *** ERRORS ***
>
> 11 error regressions:
>   + /kisskb/src/drivers/misc/lkdtm/bugs.c: error: 'X86_CR4_SMEP' undeclared (first use in this function):  => 281:13
>   + /kisskb/src/drivers/misc/lkdtm/bugs.c: error: implicit declaration of function 'native_read_cr4' [-Werror=implicit-function-declaration]:  => 279:8
>   + /kisskb/src/drivers/misc/lkdtm/bugs.c: error: implicit declaration of function 'native_write_cr4' [-Werror=implicit-function-declaration]:  => 288:2

um-all{mod,yes}config

>   + /kisskb/src/drivers/net/wireless/intel/iwlwifi/fw/dbg.c: error: call to '__compiletime_assert_2446' declared with attribute error: BUILD_BUG_ON failed: err_str[sizeof(err_str) - 2] != '\n':  => 2445:3
>   + /kisskb/src/drivers/net/wireless/intel/iwlwifi/fw/dbg.c: error: call to '__compiletime_assert_2452' declared with attribute error: BUILD_BUG_ON failed: err_str[sizeof(err_str) - 2] != '\n':  => 2451:3
>   + /kisskb/src/drivers/net/wireless/intel/iwlwifi/fw/dbg.c: error: call to '__compiletime_assert_2790' declared with attribute error: BUILD_BUG_ON failed: invalid_ap_str[sizeof(invalid_ap_str) - 2] != '\n':  => 2789:5
>   + /kisskb/src/drivers/net/wireless/intel/iwlwifi/fw/dbg.c: error: call to '__compiletime_assert_2801' declared with attribute error: BUILD_BUG_ON failed: invalid_ap_str[sizeof(invalid_ap_str) - 2] != '\n':  => 2800:5

powerpc-all{mod,yes}config{,+64K_PAGES}
mips-allmodconfig

>   + /kisskb/src/include/linux/kprobes.h: error: implicit declaration of function 'kprobe_fault_handler'; did you mean 'kprobe_page_fault'? [-Werror=implicit-function-declaration]:  => 477:9

parisc-allmodconfig

>   + /kisskb/src/mm/hmm.c: error: implicit declaration of function 'pud_pfn' [-Werror=implicit-function-declaration]:  => 753:3, 753:9
>   + /kisskb/src/mm/hmm.c: error: implicit declaration of function 'pud_pfn'; did you mean 'pte_pfn'? [-Werror=implicit-function-declaration]:  => 753:9

ppc64_book3e_allmodconfig
um-all{mod,yes}config

>   + error: "vmf_insert_mixed" [drivers/gpu/drm/exynos/exynosdrm.ko] undefined!:  => N/A

sh-all{mod,yes}config (fix available)


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
