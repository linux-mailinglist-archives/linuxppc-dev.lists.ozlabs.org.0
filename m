Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E0B160BBD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 08:39:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LbT301RBzDqdZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 18:38:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LbQW3m1bzDqck
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 18:36:30 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id l136so15829158oig.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2020 23:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SuOiO3WgSyJKnxTjJOQN1meORdYh4/iYGl3q0xfpi6g=;
 b=iPTZsqX0onAINK810wSM1+DnUGmCmWMO9eyw6v66wYKkzknRc9bRlJE/z0894bfOIO
 ieyw0ztRPBI7exTlUdxgljXVLT76rrcjhQmnGGoFbrsZuTk4X4NKsVcwel2tBSo8i6Mn
 kCiXxLQVKDGUK2r2qrh6WisBmY0jVYuq1qW0uRSWENaK8Wu43vOaKeyQxfWsm8PrIYMj
 sYMFENY+jI79tYrOTad1Xkw7vDSkXk+pDtkUiQL5t8rvW4IvrYSI3EaGWj6eTZdQo8pV
 6TR8PRIHYJvlwZu4epUJ5EpXKaq4m+ye31rifTHg7nepqg6e/N2M7RT8zkMGQnYNjpHC
 Q5wg==
X-Gm-Message-State: APjAAAVvkpMW7w+BrOMxHgN/PThE2Ji/TC4cqwMUaMAOFSRYbY/796hg
 7NdG0srJNNZ8+oswgtddpT3ptJN1v9f/WKYd3JE=
X-Google-Smtp-Source: APXvYqxKa9A1iXEoFtvs2SQx0wwpyI+D+8O+BpCQT5TTiBwESFO3k3MigqRo69thtGMj1kz+e9do4m1f9fB6IxLYpJM=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr8802173oia.148.1581924987398; 
 Sun, 16 Feb 2020 23:36:27 -0800 (PST)
MIME-Version: 1.0
References: <1581915833-21984-1-git-send-email-anshuman.khandual@arm.com>
 <1581915833-21984-3-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1581915833-21984-3-git-send-email-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2020 08:36:16 +0100
Message-ID: <CAMuHMdU0DSTZMn6akY8qZR3SDxVEruEsd3Q3sYf-tn_ooXDDBw@mail.gmail.com>
Subject: Re: [PATCH 2/5] mm/vma: Make vma_is_accessible() available for
 general use
To: Anshuman Khandual <anshuman.khandual@arm.com>
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Burton <paulburton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 17, 2020 at 6:04 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> Lets move vma_is_accessible() helper to include/linux/mm.h which makes it
> available for general use. While here, this replaces all remaining open
> encodings for VMA access check with vma_is_accessible().
>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/mm/fault.c    | 2 +-

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
