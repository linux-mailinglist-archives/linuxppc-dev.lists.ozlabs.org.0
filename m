Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9019039D7F8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 10:53:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz6bv0hvNz3bsW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 18:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.47; helo=mail-ua1-f47.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz6bS391Vz2yWs
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 18:53:22 +1000 (AEST)
Received: by mail-ua1-f47.google.com with SMTP id c17so9277950uao.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 01:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y7XwbZyFAy9rqQo5J7t8DRS+d/mueoOLl5p+cSQb+8Y=;
 b=Z/TUQ2CMtkBVSGrtqbbWlOq7KNf6ZbtbaXb3q9Upbt2vdF03tjzqA6hPohCgAX0l6O
 RFieWN2WdYnk1Oy00WDWt2oGMvHQCcH1G9wDP7ectpOlMBL4E6Ey8R/PHX2eIVYf9elP
 YcwpaH1xjYaGYnywn+fj9kCOHpdD+YdoZm8smxYcBaHH8NbDoaVfpe5hT7ZbmMS7IW2f
 ZIJaFlOS7cDEYgxnWTk3fWvByFpROIkZCF+fSF+Soi+hHFo39TQJVpI16dJ+FguCHTb6
 h6AIe90yjenr25Z8+jDMZ0WPgd95Tg2AUHoQ25LZhTzMvkewMrPxDFI5hjQj2BlbDaKh
 cnhg==
X-Gm-Message-State: AOAM530I7PVKQ6nCikIg7ykbBckbRLJJKuZts+Xnj2gFy/WG9TIMcL1a
 zzMYRM8xue1F1Nx9R5nOnW2jqbuq7ryCplMytPw=
X-Google-Smtp-Source: ABdhPJw70xfmNroh3KIu5QGmqKsYwQ+PKLyHQ50n7DeatYgE4iGl6TNz+FWGTOL2BBcrgRRRH99rMYwIPPT469OpB6M=
X-Received: by 2002:ab0:63d9:: with SMTP id i25mr6682382uap.106.1623055999326; 
 Mon, 07 Jun 2021 01:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210604064916.26580-1-rppt@kernel.org>
 <20210604064916.26580-9-rppt@kernel.org>
In-Reply-To: <20210604064916.26580-9-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jun 2021 10:53:08 +0200
Message-ID: <CAMuHMdVa29gUQAdHjKh-qDNpOJaoGwXtUkBM2qnOTi1DWV70xA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] mm: replace CONFIG_NEED_MULTIPLE_NODES with
 CONFIG_NUMA
To: Mike Rapoport <rppt@kernel.org>
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Vineet Gupta <vgupta@synopsys.com>,
 kexec@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

On Fri, Jun 4, 2021 at 8:50 AM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> After removal of DISCINTIGMEM the NEED_MULTIPLE_NODES and NUMA
> configuration options are equivalent.
>
> Drop CONFIG_NEED_MULTIPLE_NODES and use CONFIG_NUMA instead.
>
> Done with
>
>         $ sed -i 's/CONFIG_NEED_MULTIPLE_NODES/CONFIG_NUMA/' \
>                 $(git grep -wl CONFIG_NEED_MULTIPLE_NODES)
>         $ sed -i 's/NEED_MULTIPLE_NODES/NUMA/' \
>                 $(git grep -wl NEED_MULTIPLE_NODES)
>
> with manual tweaks afterwards.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks for your patch!

As you dropped the following hunk from v2 of PATCH 5/9, there's now
one reference left of CONFIG_NEED_MULTIPLE_NODES
(plus the discontigmem comment):

-diff --git a/mm/memory.c b/mm/memory.c
-index f3ffab9b9e39157b..fd0ebb63be3304f5 100644
---- a/mm/memory.c
-+++ b/mm/memory.c
-@@ -90,8 +90,7 @@
- #warning Unfortunate NUMA and NUMA Balancing config, growing
page-frame for last_cpupid.
- #endif
-
--#ifndef CONFIG_NEED_MULTIPLE_NODES
--/* use the per-pgdat data instead for discontigmem - mbligh */
-+#ifdef CONFIG_FLATMEM
- unsigned long max_mapnr;
- EXPORT_SYMBOL(max_mapnr);
-

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
