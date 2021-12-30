Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F5A481A9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 09:03:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPgkc4HmCz3drC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 19:03:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WbuJzdZv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=schmitzmic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WbuJzdZv; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPZ0v35dcz2ypX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 14:45:17 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id q3so15979826pfs.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 19:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=5E1c4uav1w29ypwAHwbdxz4O+xfES0SpMBM/hIdsoE0=;
 b=WbuJzdZv6QdxI4sm1uAN5RK2dB/vxRRAL3AviYD6SfM29AlUSb5I5hMDIqugVgl6q5
 V/7xuA/EOm2Dv0zChCOeqZsFvsMIm7UeuFMBWZAvuAVpy5VWIbHsXe0LO+k7wbZT9XA+
 bKo1QUX3kp7MeKzCaqX8Qy0FWsFH26Y65uXLR/vaqgIBvGoVcBkMmv2ha7gL/lhC+wsc
 9IDoT4MY3JFxvbdNQp9rzst5K+jmfgdTuMjjeHVOo5kymPqz9E6EMIfWlGg4R2VCRufH
 r5zUkrJO0E2MYAcArK0leS4VFV7M5hYte5KRuaiLgKGVmb4cT/v9GFrgNcGmE2q7OUEY
 IqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=5E1c4uav1w29ypwAHwbdxz4O+xfES0SpMBM/hIdsoE0=;
 b=4BFW1WqeuPW1cwPlQwxtOPyR9InQGnRcZiGU1VXUhR8xcLc8qI/m/yIa4zw6iZNiaT
 aXmkSgrKXxXuFpp99X37Hp/3Ilh3gNQM6yp/cPJrxb0LrcSNdeNMgFfuKnT40POkcDeU
 9Z/a5jXFgeKWiG6O7Uw/77HsJES1UlBmA9zbADOQFk7Mz2wlVoWhfNp18A+AXz9DiVJ7
 j1lAd8UQYAWUtE7ok6jMcAJ/NRSe/47TyMP1Bap38TkcaIfNfrCWTPD66W6w9NwhEjoh
 0duh5pXwFcxWa59szVhMWm918tQaqjF/hvus8vVVIS1n/1cZASVtlPvyhk82E+s6tyY6
 XrmQ==
X-Gm-Message-State: AOAM533IJX2EEwcSoUmrFLLQqzG5oMFnOMwt78fZSki0eQCt1hoLTH1F
 LduVamu/ThkNCuT4rl0Ho60=
X-Google-Smtp-Source: ABdhPJzhu0vR0ubHbZDDMdnE240kX84aNyi3i3N9D1mBlwe522lCZMc1R9id41niT15FZfmjs4s+bA==
X-Received: by 2002:a63:10a:: with SMTP id 10mr26111733pgb.170.1640835913587; 
 Wed, 29 Dec 2021 19:45:13 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
 by smtp.gmail.com with ESMTPSA id
 pg12sm29480602pjb.4.2021.12.29.19.44.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Dec 2021 19:45:12 -0800 (PST)
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
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <0211719b-8402-9865-8e5d-5c0a35715816@gmail.com>
Date: Thu, 30 Dec 2021 16:44:45 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
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

Am 30.12.2021 um 14:48 schrieb Arnd Bergmann:
> On Tue, Dec 28, 2021 at 11:15 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 29.12.2021 um 16:41 schrieb Arnd Bergmann:
>>> On Tue, Dec 28, 2021 at 8:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> I'd hope not - we spent some effort to make sure setting ATARI_ROM_ISA
>> does not affect other m68k platforms when e.g. building multiplatform
>> kernels.
>
> Ok
>
>> Replacing inb() by readb() without any address translation won't do much
>> good for m68k though - addresses in the traditional ISA I/O port range
>> would hit the (unmapped) zero page.
>
> Correct, this is exactly the problem that Niklas is trying to solve here:
> we do have drivers that hit this bug, and on s390 clang actually produces
> a compile-time error for drivers that cause a NULL pointer dereference
> this way.

Thanks for clarifying - I only saw Geert's CC and failed to go back to 
the start of the thread.

> What some other architectures do is to rely on inb()/outb() to have a
> zero-based offset, and use an io_offset in PCI buses to ensure that a
> low port number on the bus gets translated into a pointer value for the
> virtual mapping in the kernel, which is then represented as an unsigned
> int.

M54xx does just that for Coldfire:

arch/m68k/include/asm/io_no.h:
#define PCI_IO_PA	0xf8000000		/* Host physical address */

(used to set PCI BAR mappings, so matches your definition above).

All other (MMU) m68k users of inb()/outb() apply an io_offset in the 
platform specific address translation:

arch/m68k/include/asm/io_mm.h:

#define q40_isa_io_base  0xff400000
#define enec_isa_read_base  0xfffa0000
#define enec_isa_write_base 0xfffb0000

arch/m68k/include/asm/amigayle.h:

#define GAYLE_IO                (0xa20000+zTwoBase)     /* 16bit and 
even 8bit registers */
#define GAYLE_IO_8BITODD        (0xa30000+zTwoBase)     /* odd 8bit 
registers */

(all constants used in address translation inlines that are used by the 
m68k inb()/outb() macros - you can call that the poor man's version of 
PCI BAR mappings ...).

So as long as support for any of the m68k PCI or ISA bridges is selected 
in the kernel config, the appropriate IO space mapping is applied. If no 
support for PCI or ISA bridges is selected, we already fall back to zero 
offset mapping (but as far as I can tell, it shouldn't be possible to 
build a kernel without bridge support but drivers that require it).

>
> As this is indistinguishable from architectures that just don't have
> a base address for I/O ports (we unfortunately picked 0 as the default
> PCI_IOBASE value), my suggestion was to start marking architectures
> that may have this problem as using HAS_IOPORT in order to keep
> the existing behavior unchanged. If m68k does not suffer from this,
> making HAS_IOPORT conditional on those config options that actually
> need it would of course be best.

Following your description, HAS_IOPORT would be required for neither of 
PCI, ISA or ATARI_ROM_ISA ??

Cheers,

	Michael


>
>          Arnd
>
