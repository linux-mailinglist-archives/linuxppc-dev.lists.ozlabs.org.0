Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A8C4B5AF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 21:31:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyG8w53KPz3cVP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 07:31:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JVRzXzob;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=JVRzXzob; 
 dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyG8C0ry2z3bTn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 07:31:05 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id qk11so19479372ejb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 12:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uV1vHLzIr83T8MOCn12tMQAgRRvl8B7jglczOSl4CII=;
 b=JVRzXzobglXSiT0bLuA7vSr1HiJLXJeQF0BO276l66RCTCZjx8953KmFOVPMErrs0l
 on/NKX4mjsS9TS9bqhorHzBzM+OjtKgBLqdNoyLvrA639t1A433SV7/dJ5dxrhaCdPXH
 bTp5UzrLKiAt8Y3WQUfvdICLgLXk8cVAfLq1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uV1vHLzIr83T8MOCn12tMQAgRRvl8B7jglczOSl4CII=;
 b=wwD3cEsSLmP+hcplRpGFMcPPncxhp26JjBIDqKOtBktFKRsDYcd7Mfu59sYPzJbMuK
 NtZGayWewNWJJj8isXHCBNenUToo/5qYxSv7CiucDtvy+stXp2WP4WlUp5UcgdjFs0f+
 VSAXSpyM0k0KQEMXOEDigCDn+HEI6A+j+nYf9Tc74Vfs72jbXnGIeMpFH9z69Y1Czwom
 S3ehqUJ71I9WvxYmM68omFJvJ7CpALQQchPkc6zw1CwnjIqOZ5Rqdj3KSNJs9Y4W6TeZ
 LAmTs1qMO1pSFkgkxrXS+DygiZdP8hueP56kMm3FRtLSOv9yOlNJaRAz8+c9ITTimWdJ
 BDOQ==
X-Gm-Message-State: AOAM5325N3P+6YiZiVZqpCo/Nzh57J/UztiqvxBMZUTzdvo9qCSeB9L9
 eA9172/auT9Yi1nCxRQFi+PphAx8JfiIFT5Fx20=
X-Google-Smtp-Source: ABdhPJy/vethY0V0en4+Yu4d07IXD3TpK5mbBd6zmCD0fq+DXYO8hG23G1s6Qk83zDGV7I4DfT7jBg==
X-Received: by 2002:a17:906:51d6:: with SMTP id
 v22mr436064ejk.446.1644870662185; 
 Mon, 14 Feb 2022 12:31:02 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48])
 by smtp.gmail.com with ESMTPSA id t5sm5424312edd.7.2022.02.14.12.31.01
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:31:01 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id b13so28978270edn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 12:31:01 -0800 (PST)
X-Received: by 2002:a05:651c:1543:: with SMTP id
 y3mr306548ljp.152.1644870269711; 
 Mon, 14 Feb 2022 12:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
 <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
 <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
In-Reply-To: <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Feb 2022 12:24:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYu67OwP4LhcrPdDVxv2mOsx-Xsc2DKoVW6GZwKFtOYQ@mail.gmail.com>
Message-ID: <CAHk-=wgYu67OwP4LhcrPdDVxv2mOsx-Xsc2DKoVW6GZwKFtOYQ@mail.gmail.com>
Subject: Re: [PATCH 04/14] x86: use more conventional access_ok() definition
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 14, 2022 at 12:01 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> x86-64 has always(*) used TASK_SIZE_MAX for access_ok(), and the
> get_user() assembler implementation does the same.

Side note: we could just check the sign bit instead, and avoid big
constants that way.

Right now we actually have this complexity in the x86-64 user access code:

  #ifdef CONFIG_X86_5LEVEL
  #define LOAD_TASK_SIZE_MINUS_N(n) \
        ALTERNATIVE __stringify(mov $((1 << 47) - 4096 - (n)),%rdx), \
                    __stringify(mov $((1 << 56) - 4096 - (n)),%rdx),
X86_FEATURE_LA57
  #else
  #define LOAD_TASK_SIZE_MINUS_N(n) \
          mov $(TASK_SIZE_MAX - (n)),%_ASM_DX
  #endif

just because the code tries to get that TASK_SIZE_MAX boundary just right.

And getting that boundary just right is important on 32-bit x86, but
it's *much* less important on x86-64.

There's still a (weak) reason to do it even for 64-bit code: page
faults outside the valid user space range don't actually cause a #PF
fault - they cause #GP - and then we have the #GP handler warn about
"this address hasn't been checked".

Which is nice and useful for doing syzbot kind of randomization loads
(ie user accesses that didn't go through access_ok() will stand out
nicely), but maybe it's not worth this. syzbot would be fine with only
the "sign bit set" case warning for the same thing.

So on x86-64, we could just check the sign of the address instead, and
simplify and shrink those get/put_user() code sequences (but
array_index_mask_nospec() currently uses the carry flag computation
too, so we'd have to change that part as well, maybe not worth it).

                  Linus
