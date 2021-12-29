Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB8A481A94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 09:00:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPggM19khz3cjt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 19:00:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HR4+5gEv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=schmitzmic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HR4+5gEv; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNts45G3Rz2yw5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 12:21:10 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 2so17171589pgb.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 17:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ce+QRujFh6Z6jXwpwj96Ajoqinq3qkVE1ootEg0tvM4=;
 b=HR4+5gEvbRK0rU8/dntHoBj1g+0X3qKpLMsP358svmvVe4LU0yAyJLNGs3fCG1IxN5
 M/QTR8OXVpknffzN/8b3pOWH0ImhkhbIhkjgUWsWwTRZMZ2woqwqIa5115FbA6Nf6xT4
 TiKsVnkG1OLJDDZ06iwYnbvfkz/MJz2DtOV5zSZDVPVN2jIRsDW3XOaMugqlveDm5gnG
 bFN6SiWtJfdMPi0YTy0yZg20PhHPIvQQsScpgCUPn8k9cu6v+natJ9ebpk8jSRGpwixK
 MiRCzMxl519LQW1SjZgL9Y49JFwBww9vU7/YKwkn2coaccmwFAJf32w2Pk2xT9akAsgc
 lavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=ce+QRujFh6Z6jXwpwj96Ajoqinq3qkVE1ootEg0tvM4=;
 b=EOl6tv9goQOaQ4inz7E1kYbqcPMNMxV+2wkE94SkzIwiEpDAqpwMuatU+9SuW8L+9h
 m/Xl/oCNNBQt066W7CjkDfH0paSBFcfz2mVE8wSHODfrSsgMFXvGT9txBPb84ArbdAN6
 gOHAkI1H3UEcCDS+1vBRzUZ5VWVcHP6/OP53hGoQyjP5o6ZYC84yKvdRw1M9hDLsRzdm
 VYNOP0UVFpWRFGQiky63TvkLa6TTJYIQsNL/rynkRLXV2RTR1S7UW/7eH+O+6zHKUgR7
 o2bgYy5452I4Gs4FWdgoTcxxtJoVeCMrmkPPmgS7g7wThWLGvpEagYb9UMvMeUlquLBV
 PI2g==
X-Gm-Message-State: AOAM533njyGX4bQ+B128J58RgbhVhJhAUt3a8/dSjpW5iexfpRF3RZ3g
 9KUY8EhbR0WI3MdtnSz7eXc=
X-Google-Smtp-Source: ABdhPJx/po46hxln8jdEFq24zHXmQfZv0rMy1a+pao1gS+//RcuuYa1+uO7C36+ZKnR8X7vS6LfebQ==
X-Received: by 2002:a05:6a00:cca:b0:4ba:f5cc:538c with SMTP id
 b10-20020a056a000cca00b004baf5cc538cmr24584430pfv.60.1640740867094; 
 Tue, 28 Dec 2021 17:21:07 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
 by smtp.gmail.com with ESMTPSA id
 cm20sm18920963pjb.28.2021.12.28.17.20.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Dec 2021 17:21:06 -0800 (PST)
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
Date: Wed, 29 Dec 2021 14:20:38 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
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
 linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Chris Zankel <chris@zankel.net>,
 Jeff Dike <jdike@addtoit.com>, John Garry <john.garry@huawei.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Arnd Bergmann <arnd@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert, Niklas,



Am 28.12.2021 um 23:08 schrieb Geert Uytterhoeven:
> Hi Niklas,
>
> On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>> We introduce a new HAS_IOPORT Kconfig option to gate support for
>> I/O port access. In a future patch HAS_IOPORT=n will disable compilation
>> of the I/O accessor functions inb()/outb() and friends on architectures
>> which can not meaningfully support legacy I/O spaces. On these platforms
>> inb()/outb() etc are currently just stubs in asm-generic/io.h which when
>> called will cause a NULL pointer access which some compilers actually
>> detect and warn about.
>>
>> The dependencies on HAS_IOPORT in drivers as well as ifdefs for
>> HAS_IOPORT specific sections will be added in subsequent patches on
>> a per subsystem basis. Then a final patch will ifdef the I/O access
>> functions on HAS_IOPORT thus turning any use not gated by HAS_IOPORT
>> into a compile-time warning.
>>
>> Link: https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
>> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
>> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
>> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
>
> Thanks for your patch!
>
>> --- a/arch/m68k/Kconfig
>> +++ b/arch/m68k/Kconfig
>> @@ -16,6 +16,7 @@ config M68K
>>         select GENERIC_CPU_DEVICES
>>         select GENERIC_IOMAP
>>         select GENERIC_IRQ_SHOW
>> +       select HAS_IOPORT
>>         select HAVE_AOUT if MMU
>>         select HAVE_ASM_MODVERSIONS
>>         select HAVE_DEBUG_BUGVERBOSE
>
> This looks way too broad to me: most m68k platform do not have I/O
> port access support.
>
> My gut feeling says:
>
>     select HAS_IOPORT if PCI || ISA
>
> but that might miss some intricate details...

In particular, this misses the Atari ROM port ISA adapter case -

	select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA

might do instead.

Cheers,

	Michael


>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
