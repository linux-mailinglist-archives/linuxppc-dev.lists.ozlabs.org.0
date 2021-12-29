Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4609481A99
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 09:02:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPgjB5jtGz3djh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 19:02:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SgUGGN6V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=schmitzmic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SgUGGN6V; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNykf0rRdz2xsq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 15:15:53 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so23422738pjj.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 20:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=oo7gGMOkpKZtsifyQrF9uAkP4p/YBx2m/GIQa4Tq0YE=;
 b=SgUGGN6VhsGuSJ4+x7BV8WmUFGnq6AU/S3MGIbRuvgcmK5iemLDPInHX4HtGqsDBOP
 X+ShdKiY6WGvZxZzGll6Lp9gXc9Iofh3zmxzNCmw3Dn3KgxWg++og+5/hcFLsP9lz2Xr
 2GF2kpRya+BTKsokuDFYluzgdLN+9R6oDmfEeq5seHlKkuDQoWmHZpB5lsfFQJLsHHhA
 J+6fOy7KSqTSf4RHl5+/z/3kvG8PPaQjjUrbxIO/1twWStmOPd1O5hfeFSFRI+7/1KDQ
 V6duyLcOszOYryU8sc+sZAK9TuMnZyNEumxgE9K0xpEM2ht/1sy9t9bhV6U0QsHIl9qG
 4r0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=oo7gGMOkpKZtsifyQrF9uAkP4p/YBx2m/GIQa4Tq0YE=;
 b=IcS6pXXtgeeDtusl2ex5Irte4KZsLGSmOzGOioDJkA3OKeWgWKDFp3HfGRf+Ij4L80
 GpY41VX5JQ2dq8UoYG5Ij6H6lgbGVTh/Fgxm8C1ZWoOaBbBEvYMqUMNgunJAP98ZgYWg
 /uyaxpnwP0V67iwGoed5IFLE2N2QX+QsR5xw0w7TtqI6Ru3Fsweo6hD97I+R5DCIJW27
 +7e3JIfU5LdRI5o7Snm3bpBuTry1wf7fcZb/13FnclF2X/FVNx6mv0rw5httejxANc9c
 Fl036O0i7G5T+hAXcI/+VRqucXeomWxE+Kts9Km6+h9Smn8s90NuWb4t92rcxkqZgTeo
 fRAg==
X-Gm-Message-State: AOAM5333aNZGviHR8fPpbcr2eVDVJwfKsfW7hrT5HCxViq83aLRw65/k
 HJOshKFVirjTbQI0hsk3cWw=
X-Google-Smtp-Source: ABdhPJyjCqGNhQip5lk1bKe/Q9ifrO91rL0XFrD4WiMDGXXaVLZjRe+Yr2Tq1lIfNgSSQkzYLSFwkQ==
X-Received: by 2002:a17:902:d48a:b0:148:a8ae:7ab7 with SMTP id
 c10-20020a170902d48a00b00148a8ae7ab7mr24900237plg.171.1640751350387; 
 Tue, 28 Dec 2021 20:15:50 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
 by smtp.gmail.com with ESMTPSA id
 k9sm13406563pgr.47.2021.12.28.20.15.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Dec 2021 20:15:49 -0800 (PST)
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
To: Arnd Bergmann <arnd@kernel.org>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
Date: Wed, 29 Dec 2021 17:15:23 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 30 Dec 2021 18:58:16 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 John Garry <john.garry@huawei.com>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

Am 29.12.2021 um 16:41 schrieb Arnd Bergmann:
> On Tue, Dec 28, 2021 at 8:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 28.12.2021 um 23:08 schrieb Geert Uytterhoeven:
>>> On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>>>> We introduce a new HAS_IOPORT Kconfig option to gate support for
>>>> I/O port access. In a future patch HAS_IOPORT=n will disable compilation
>>>> of the I/O accessor functions inb()/outb() and friends on architectures
>>>> which can not meaningfully support legacy I/O spaces. On these platforms
>>>> inb()/outb() etc are currently just stubs in asm-generic/io.h which when
>>>> called will cause a NULL pointer access which some compilers actually
>>>> detect and warn about.
>>>>
>>>> The dependencies on HAS_IOPORT in drivers as well as ifdefs for
>>>> HAS_IOPORT specific sections will be added in subsequent patches on
>>>> a per subsystem basis. Then a final patch will ifdef the I/O access
>>>> functions on HAS_IOPORT thus turning any use not gated by HAS_IOPORT
>>>> into a compile-time warning.
>>>>
>>>> Link: https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
>>>> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
>>>> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
>>>> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/arch/m68k/Kconfig
>>>> +++ b/arch/m68k/Kconfig
>>>> @@ -16,6 +16,7 @@ config M68K
>>>>         select GENERIC_CPU_DEVICES
>>>>         select GENERIC_IOMAP
>>>>         select GENERIC_IRQ_SHOW
>>>> +       select HAS_IOPORT
>>>>         select HAVE_AOUT if MMU
>>>>         select HAVE_ASM_MODVERSIONS
>>>>         select HAVE_DEBUG_BUGVERBOSE
>>>
>>> This looks way too broad to me: most m68k platform do not have I/O
>>> port access support.
>>>
>>> My gut feeling says:
>>>
>>>     select HAS_IOPORT if PCI || ISA
>>>
>>> but that might miss some intricate details...
>>
>> In particular, this misses the Atari ROM port ISA adapter case -
>>
>>         select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA
>>
>> might do instead.
>
> Right, makes sense. I had suggested to go the easy way and assume that
> each architecture would select HAS_IOPORT if any configuration supports
> it, but it looks like for m68k there is a clearly defined set of platforms that
> do.
>
> Note that for the platforms that don't set any of the three symbols, the
> fallback makes inb() an alias for readb() with a different argument type,
> so there may be m68k specific drivers that rely on this, but those would
> already be broken if ATARI_ROM_ISA is set.

I'd hope not - we spent some effort to make sure setting ATARI_ROM_ISA 
does not affect other m68k platforms when e.g. building multiplatform 
kernels.

Replacing inb() by readb() without any address translation won't do much 
good for m68k though - addresses in the traditional ISA I/O port range 
would hit the (unmapped) zero page.

Cheers,

	Michael

>
>           Arnd
>
