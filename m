Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F582989C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 10:50:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKVT31jhLzDqK3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 20:50:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKVRD5YwNzDq5f
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 20:49:09 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id n15so7411602otl.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 02:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=314b+EPeJu8ztEUHKiEyh7Fe1KfnldWCCkTh7+28WEo=;
 b=gOqNYf1gujMqCIbN4nQiOgT+U7jP96+hv97SNlmsw+0q5mmSajrKVPPiAIOv8SJcJ0
 j7oH9EJNg2SiSSnR3IH1n/D44tNKlP6bNnokpjKB8Rp/v0Jv+mLRUA8YpldBug4bGmWt
 Rj4fh9ATukshj95B9iR1i7lCJ0+8pq4ppD9Ki0lCJa+8RjGzkdyMsBz8oGIV+iGwpDrm
 lU/626bC/GOiF0CKVQhqEDE05P1ljFtj5+hEr9E3zxKahVqnjsLuc/jynG/QosslIaag
 Bu5F3wnmJJpmgACYLT3pC/tns3Jsco9PkyZeC0BZxQemwHmtWLN+Rw2/g/qtLoyR4nLs
 um9g==
X-Gm-Message-State: AOAM531gZ0Al5t8hyS8HaXquOyULyMorvUN8HQQDofjwpyIPIeULDMBj
 0OEH0HDTNg2Sw3A7RW/1M1rxsSPTkIjsd525isc=
X-Google-Smtp-Source: ABdhPJz6Ac16eELMejGpA5pfteZH0S7xI3pqTk1GnO4kjTNW0lVeo7lq9J4RZJkz7zdoJDPT2VEy2pOJNu0QSN+3lS0=
X-Received: by 2002:a9d:3b76:: with SMTP id
 z109mr13819173otb.250.1603705746354; 
 Mon, 26 Oct 2020 02:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201026081811.3934205-1-geert@linux-m68k.org>
In-Reply-To: <20201026081811.3934205-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2020 10:48:55 +0100
Message-ID: <CAMuHMdXbsJPnsXg6bA_e32zJkBG1Zzqj-ja5WzHDKL0d9OcfPg@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.10-rc1
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
 arcml <linux-snps-arc@lists.infradead.org>,
 linux-um <linux-um@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 26, 2020 at 10:46 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.10-rc1[1] compared to v5.9[2].
>
> Summarized:
>   - build errors: +3/-7
>   - build warnings: +26/-28
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/3650b228f83adda7e5ee532e2b90429c03f7b9ec/ (all 192 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/bbf5c979011a099af5dc76498918ed7df445635b/ (all 192 configs)
>
>
> *** ERRORS ***
>
> 3 error regressions:
>   + /kisskb/src/arch/um/kernel/skas/clone.c: error: expected declaration specifiers or '...' before string constant:  => 24:16

um-all{mod,yes}config

>   + error: hotplug-memory.c: undefined reference to `of_drconf_to_nid_single':  => .text+0x5e0)

powerpc-gcc5/pseries_le_defconfig+NO_NUMA

>   + {standard input}: Error: inappropriate arguments for opcode 'adc':  => 170

arc-gcc10/axs101_defconfig

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
