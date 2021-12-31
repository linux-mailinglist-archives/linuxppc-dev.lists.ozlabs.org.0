Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E088D48264B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jan 2022 03:14:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JQlvS62fRz3c5l
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jan 2022 13:14:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LjsOP7dt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=schmitzmic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LjsOP7dt; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JQf8v6zDfz2xTC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jan 2022 08:55:57 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id gj24so24397656pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Dec 2021 13:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=T1hx50UVDERByCQtA2jPhEceIqEPV53U/9yB8e5/FYk=;
 b=LjsOP7dtkJk8TTLzgH2x733jvWKdpcNmqgEkJGbhcliBN3P4mGcoa4RHGyc7AE+uv0
 1q6IiTtA1Dj+hFT4fbo5YFfHQJP3D3q9epLhg2FMsybdbsOcLxZAwPm0457fBAaRsDqQ
 IL99rj8gfeLcMykifXB/Gt0fb/qQevJBIrut1EB236pdFPwlsYQCiXgvL1uR2c1NkIEI
 s9mlOS/JU5lFDS2xWEDijv28JBOklmN0+7s5aGmoNcQDKeGvOeymMRfNiZGGdhERxmTx
 AwTYJpI5KYZX0tSyGEY8pkdXLvzdxOJEnG3qvPabZ4r2I9OhjOAaaBl0S4GhUjhjIInk
 c95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=T1hx50UVDERByCQtA2jPhEceIqEPV53U/9yB8e5/FYk=;
 b=IrP5GgpAw8HBj5gqqegOwXY9RQRNtTcHlfBx7287v/G8u4t1GXwBktUkulBzMrzQxZ
 S1Y1o0cZTbKqhAPtn4rpITOdNSzxQRrYcNdDc+WUWuUVhWnDane4wwIsCsnBKr3TwORK
 LtEcZ4PQQkWTYXTMgIg4kzz0kTi3y2/L0BLCiLw2z+MxH62r0VhqH7n8oLlbJOLo74oy
 QFou1R7susg/fO8gJGKcM4PyJinHkpuauhTRi62QCtvkvp6iy4VQCE/8fSDjpiifeQ/c
 9XxALt8nkImwqoPrwHcRRmYum5Apx3NdRRYx/XFelY0FED3AL/t7/Y71Zga0/EF0dpzA
 wLBA==
X-Gm-Message-State: AOAM530bODN1SB7wsc7jiCbRtDNasA5AvbvMXAZtVA7acuug2dRN6MRr
 x2XoPNb2o18shlD6oq+tbhg=
X-Google-Smtp-Source: ABdhPJz1F4nn7gYkCA3wVb/U0vH3yAlfu9Ov4LEv5tjkAkrde3xqL11hZ+AbHJ3jgiQyphWKkycvHA==
X-Received: by 2002:a17:902:bb97:b0:144:d5cb:969f with SMTP id
 m23-20020a170902bb9700b00144d5cb969fmr36731618pls.36.1640987753994; 
 Fri, 31 Dec 2021 13:55:53 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
 by smtp.gmail.com with ESMTPSA id
 p186sm13526661pfp.128.2021.12.31.13.55.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Dec 2021 13:55:53 -0800 (PST)
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
To: Arnd Bergmann <arnd@kernel.org>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
 <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
 <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
 <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
 <CAK8P3a2GGGuP0miLRy8w2+8vdSsGRNioBHEZ-ervSBrYbuZ+5w@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <a635e885-c365-8bdc-bf3c-e74d7d39a786@gmail.com>
Date: Sat, 1 Jan 2022 10:55:27 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2GGGuP0miLRy8w2+8vdSsGRNioBHEZ-ervSBrYbuZ+5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 01 Jan 2022 13:14:10 +1100
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux <sparclinux@vger.kernel.org>, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, John Garry <john.garry@huawei.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 alpha <linux-alpha@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

Am 01.01.2022 um 05:04 schrieb Arnd Bergmann:
> On Wed, Dec 29, 2021 at 10:44 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 30.12.2021 um 14:48 schrieb Arnd Bergmann:
>>> On Tue, Dec 28, 2021 at 11:15 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>> What some other architectures do is to rely on inb()/outb() to have a
>>> zero-based offset, and use an io_offset in PCI buses to ensure that a
>>> low port number on the bus gets translated into a pointer value for the
>>> virtual mapping in the kernel, which is then represented as an unsigned
>>> int.
>>
>> M54xx does just that for Coldfire:
>>
>> arch/m68k/include/asm/io_no.h:
>> #define PCI_IO_PA       0xf8000000              /* Host physical address */
>>
>> (used to set PCI BAR mappings, so matches your definition above).
>
> I think coldfire gets it right here, using PCI_IOBASE to find the start of
> the window and a zero io_offset:
>
> #define PCI_IOBASE ((void __iomem *) PCI_IO_PA)

Good - I bear that in mind if I ever get around to reactivating my 060 
accelerator and the PCI board for that.

>> All other (MMU) m68k users of inb()/outb() apply an io_offset in the
>> platform specific address translation:
>>
>> arch/m68k/include/asm/io_mm.h:
>>
>> #define q40_isa_io_base  0xff400000
>> #define enec_isa_read_base  0xfffa0000
>> #define enec_isa_write_base 0xfffb0000
>>
>> arch/m68k/include/asm/amigayle.h:
>>
>> #define GAYLE_IO                (0xa20000+zTwoBase)     /* 16bit and
>> even 8bit registers */
>> #define GAYLE_IO_8BITODD        (0xa30000+zTwoBase)     /* odd 8bit
>> registers */
>>
>> (all constants used in address translation inlines that are used by the
>> m68k inb()/outb() macros - you can call that the poor man's version of
>> PCI BAR mappings ...).
>
> This still looks like the same thing to me, where you have inb() take a
> zero-based port number, not a pointer. The effect is the same as the
> coldfire version, it just uses a custom inline function instead of the
> version from asm-generic/io.h.

Right.

>> So as long as support for any of the m68k PCI or ISA bridges is selected
>> in the kernel config, the appropriate IO space mapping is applied. If no
>> support for PCI or ISA bridges is selected, we already fall back to zero
>> offset mapping (but as far as I can tell, it shouldn't be possible to
>> build a kernel without bridge support but drivers that require it).
>
> Right.
>
>>> As this is indistinguishable from architectures that just don't have
>>> a base address for I/O ports (we unfortunately picked 0 as the default
>>> PCI_IOBASE value), my suggestion was to start marking architectures
>>> that may have this problem as using HAS_IOPORT in order to keep
>>> the existing behavior unchanged. If m68k does not suffer from this,
>>> making HAS_IOPORT conditional on those config options that actually
>>> need it would of course be best.
>>
>> Following your description, HAS_IOPORT would be required for neither of
>> PCI, ISA or ATARI_ROM_ISA ??
>
> For these three options, we definitely need HAS_IOPORT, which would
> imply that some version of inb()/outb() is provided. The difference between

Thanks for clarifying that (and to Niklas as well). Did sound a little 
counter-intuitive to me...

> using a custom PCI_IOBASE (or an open-coded equivalent) and using
> a zero PCI_IOBASE in combination with registering PCI using a custom
> io_offset is whether we can use drivers with hardcoded port numbers.
> These should depend on a different Kconfig symbol to be introduced
> (CONFIG_HARDCODED_IOPORT or similar) once we introduce them,
> and you could decide for m68k whether to allow those or not, I would
> assume you do want them in order to use certain legacy ISA drivers.

That's exactly the purpose (though we're overmuch pushing the envelope 
trying to accomodate legacy ISA drivers on too many platforms).

Cheers,

	Michael


>        Arnd
>
