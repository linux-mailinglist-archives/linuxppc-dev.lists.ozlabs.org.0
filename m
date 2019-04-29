Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CD3DB3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 06:49:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ssdx0NQ1zDqP1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 14:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pqKkSoBe"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sscV2jTmzDqNB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 14:48:39 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id h26so7875726ioj.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 21:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CobcNFcnItV1Fwxra/QSyVNCgIAThoo3aC2sCuN9HA8=;
 b=pqKkSoBe+RPQkwYeXmonMZ6J5GKAgxBM+dBipqllBf4tORdH8yrCh2/gWNSBtQtOhK
 NAcI0cym0+07yNrGwVXlnw4744MbdMz8N1k1tMC0HvlKh/R5fWBxWhTKMxl8iyr7O8iR
 Myt/usC017uXm+Au0xau06xUhMS0dp0MdtnaMvMyDExTfi77ypqs+QXyZMup18XLEocU
 wYRhpQ2PHYYrJpBZjIOLgTRPLtLjC3Q/vbEI66QK8eypLFYcIkK0XZjNYozQWQPRbWpe
 g/MgMvmpVPa3drOwtuqsufShNXe1eD5C5CwpBWLFm5oTJNUO4WN8UoUmrM0hksF/ttMD
 OfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CobcNFcnItV1Fwxra/QSyVNCgIAThoo3aC2sCuN9HA8=;
 b=l/HVV3PJeQXk0uz+c0Xrk3mv/LGh5PbAaVzLpiyvp3WS9RXs3OzViMjLFxNwi9/MZ7
 XXWdPR8Iqpu/a0XbwWhptzgBYl9nHvE/AwHKT76TLhPtPqVXxO/oZvchhGHgkCAWdotA
 Nc0U6PBkAG8TGDbT9vzp5Ts400gWr1B3jKpNz7AIeqg0gyQIdyBpMiQLBeSIfCX5ScH8
 9BeuL8ivjTMuJqbcxMDpSwpV5bjVowVBLB7OwUZBQCIqIDnRBXatrwqLqN4F86efxVl3
 yEAuU34VIMFgg69ub9r4RAabF++uNspxz6kbILg82lNDCuIy7cDMGIveYBwBOMswDB97
 6KTw==
X-Gm-Message-State: APjAAAUNWJuVVB5WHGJC/10ERpAYpDDX+JZ9GVfrdaKbcr2V1DljFHHV
 Dgn1KRyekl96pgiNjwe2ndXs18DUjmTLfWdMAQ==
X-Google-Smtp-Source: APXvYqw2FeNsPMhV5IEOMRwTyxZfZxZOFNEF0Wjt5ScivSjEZPH3rCOROvQdLIHKWZSPo7LRseWzFm4cKsBEU6/GIJo=
X-Received: by 2002:a6b:b54b:: with SMTP id e72mr15178094iof.106.1556513317684; 
 Sun, 28 Apr 2019 21:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <1556087581-14513-1-git-send-email-kernelfans@gmail.com>
 <10dc5468-6cd9-85c7-ba66-1dfa5aa922b7@suse.com>
 <CAFgQCTstd667wP6g+maxYekz4u3iBR2R=FHUiS1V=XxTs6MKUw@mail.gmail.com>
 <20190428083710.GA11981@dhcp-128-65.nay.redhat.com>
 <CAFgQCTvQezGM7xgY2Q1RSUiQ7wLdxtUAeztrO3AqDfjx8f2kdg@mail.gmail.com>
In-Reply-To: <CAFgQCTvQezGM7xgY2Q1RSUiQ7wLdxtUAeztrO3AqDfjx8f2kdg@mail.gmail.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Mon, 29 Apr 2019 12:48:26 +0800
Message-ID: <CAFgQCTszGixzH5ZrwOzjbp7W91Wxo3XvA+EeEx0ErVVcYMr0FA@mail.gmail.com>
Subject: Re: [PATCHv2] kernel/crash: make parse_crashkernel()'s return value
 more indicant
To: Dave Young <dyoung@redhat.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Julien Thierry <julien.thierry@arm.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Logan Gunthorpe <logang@deltatee.com>,
 linux-s390@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Will Deacon <will.deacon@arm.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Borislav Petkov <bp@alien8.de>, David Hildenbrand <david@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Matthias Brugger <mbrugger@suse.com>, Baoquan He <bhe@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, kexec@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>,
 Thomas Bogendoerfer <tbogendoerfer@suse.de>,
 Paul Burton <paul.burton@mips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Greg Hackmann <ghackmann@android.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 11:04 AM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> On Sun, Apr 28, 2019 at 4:37 PM Dave Young <dyoung@redhat.com> wrote:
> >
> > On 04/25/19 at 04:20pm, Pingfan Liu wrote:
> > > On Wed, Apr 24, 2019 at 4:31 PM Matthias Brugger <mbrugger@suse.com> wrote:
> > > >
> > > >
> > > [...]
> > > > > @@ -139,6 +141,8 @@ static int __init parse_crashkernel_simple(char *cmdline,
> > > > >               pr_warn("crashkernel: unrecognized char: %c\n", *cur);
> > > > >               return -EINVAL;
> > > > >       }
> > > > > +     if (*crash_size == 0)
> > > > > +             return -EINVAL;
> > > >
> > > > This covers the case where I pass an argument like "crashkernel=0M" ?
> > > > Can't we fix that by using kstrtoull() in memparse and check if the return value
> > > > is < 0? In that case we could return without updating the retptr and we will be
> > > > fine.
> > > >
> > > It seems that kstrtoull() treats 0M as invalid parameter, while
> > > simple_strtoull() does not.
> > >
> > > If changed like your suggestion, then all the callers of memparse()
> > > will treats 0M as invalid parameter. This affects many components
> > > besides kexec.  Not sure this can be done or not.
> >
> > simple_strtoull is obsolete, move to kstrtoull is the right way.
> >
> > $ git grep memparse|wc
> >     158     950   10479
> >
> > Except some documentation/tools etc there are still a log of callers
> > which directly use the return value as the ull number without error
> > checking.
> >
> > So it would be good to mark memparse as obsolete as well in
> > lib/cmdline.c, and introduce a new function eg. kmemparse() to use
> > kstrtoull,  and return a real error code, and save the size in an
> > argument like &size.  Then update X86 crashkernel code to use it.
> >
> Thank for your good suggestion.
>
Go through the v5.0 kernel code, I think it will be a huge job.

The difference between unsigned long long simple_strtoull(const char
*cp, char **endp, unsigned int base) and int _kstrtoull(const char *s,
unsigned int base, unsigned long long *res) is bigger than expected,
especially the output parameter @res. Many references to
memparse(const char *ptr, char **retptr) rely on @retptr to work. A
typical example from arch/x86/kernel/e820.c
        mem_size = memparse(p, &p);
        if (p == oldp)
                return -EINVAL;

        userdef = 1;
        if (*p == '@') {  <----------- here
                start_at = memparse(p+1, &p);
                e820__range_add(start_at, mem_size, E820_TYPE_RAM);
        } else if (*p == '#') {
                start_at = memparse(p+1, &p);
                e820__range_add(start_at, mem_size, E820_TYPE_ACPI);
        } else if (*p == '$') {
                start_at = memparse(p+1, &p);
                e820__range_add(start_at, mem_size, E820_TYPE_RESERVED);
        }

So we need to resolve the prototype of kstrtoull() firstly, and maybe
kstrtouint() etc too. All of them have lots of references in kernel.

Any idea about this?

Thanks,
Pingfan
