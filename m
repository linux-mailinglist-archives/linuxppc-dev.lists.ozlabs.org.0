Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAA26A79F6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 04:19:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRxCX1VQxz3cj3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 14:19:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=It4hmxTE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=It4hmxTE;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRx9b5XBkz3cFN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 14:17:22 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id n6so14807002plf.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 19:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677727040;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=On9It+4zdvXePGpqvCCrKF4Zz8YWrxnIbxTBVMgkuCs=;
        b=It4hmxTEAyg7hPQnG8xuSpgz+jJKrlOhrcoQbLU4P/YxhalWRyom0ZRJ9msu/DO/86
         AiIsktubYrvwpRFNifmG+BrBU8v6Yala4vW9pwjX/bv47kqdaFRBl58uJ5bIBRTWVMBT
         NEWSeyJD4fgG+iWneC8bOvtxcO0rBYIjkLBer1PgLGvr/r+TBMTp8+ncLKFkUa5GBOHq
         LyRA8ug4TwsdvYR3u1GIAGW60jHpBModJwHYh1E3SbElOIomsRGv1pXdHkKrQoLtx60j
         B+LSax1q+0/Z9R4mu/KI8ChOEX0yXbPBPiNHSvaszPAfYNONdpL5L3WAXmTh1suUklGm
         5kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677727040;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=On9It+4zdvXePGpqvCCrKF4Zz8YWrxnIbxTBVMgkuCs=;
        b=jzufbfq7jwuIE3QknOkASrTLsJnI+xDfDeIq1X8hcNyvuDDTpjScrvM3MB7rShtPlQ
         vMeu6tfBNdEi2oyBG8+zT5GCku9osPTQ9mYAd0Hz7N6yijNHqvQUAO2DvYHXvEQYuKAp
         CY4ay3ONy+x0QwNFNJgDY5jWapkWS821gwDv5Z481PLp42BgWawfYdgdlbiNYNqXEOLU
         79O8ppVy8CGjkHA8sxTBaf0zy/0KeEBI6Fk9CfjEFu7vJX1Ih7KknEni7picctUhgdIW
         J/tvkhfDeamkG+Dg/DDWO8mW2E9S8AC5cnFPWpJ5DzObdmcFhMUNcbnlDkITAYxEo5CK
         hhCQ==
X-Gm-Message-State: AO0yUKWJ1A7z8OLGFCPHG2VwCLri0p85Nt9vXAoDSqExo+6NdGfu5nvZ
	z7y6QoONYueLaI+SOyzgs0pITQ==
X-Google-Smtp-Source: AK7set9NlkpYiMNjk7pdCtbLbxqSj79/p1ppAGwB6F9HvsUOQ5DEbSCAxLqrZ/Sx9hwWvoGz24uxIQ==
X-Received: by 2002:a17:90b:1c8d:b0:236:76cb:99d2 with SMTP id oo13-20020a17090b1c8d00b0023676cb99d2mr10274539pjb.8.1677727039843;
        Wed, 01 Mar 2023 19:17:19 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090a498700b002340b2c62e7sm437605pjh.55.2023.03.01.19.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 19:17:18 -0800 (PST)
Date: Wed, 01 Mar 2023 19:17:18 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 19:04:58 PST (-0800)
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
In-Reply-To: <Y+tSBlSsQBQF/Ro2@osiris>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hca@linux.ibm.com
Message-ID: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, dave.hansen@linux.intel.com, x86@kernel.org, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, Will Deacon <will@kernel.org>, agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, corbet@lwn.net, linux-sh@vger.kernel.org, deller@gmx.de, chenhuacai@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, geert@linux-m68k.org, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, linux-xtensa@linux-xtensa.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, gor@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>, npiggin@gmail.com, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, loongarch@lists.linux.dev, Paul Walmsley <pau
 l.walmsley@sifive.com>, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, svens@linux.ibm.com, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Feb 2023 01:19:02 PST (-0800), hca@linux.ibm.com wrote:
> On Tue, Feb 14, 2023 at 09:58:17AM +0100, Geert Uytterhoeven wrote:
>> Hi Heiko,
>>
>> On Tue, Feb 14, 2023 at 9:39 AM Heiko Carstens <hca@linux.ibm.com> wrote:
>> > On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
>> > > This all came up in the context of increasing COMMAND_LINE_SIZE in the
>> > > RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
>> > > maximum length of /proc/cmdline and userspace could staticly rely on
>> > > that to be correct.
>> > >
>> > > Usually I wouldn't mess around with changing this sort of thing, but
>> > > PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
>> > > to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
>> > > increasing, but they're from before the UAPI split so I'm not quite sure
>> > > what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
>> > > asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
>> > > boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
>> > > and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
>> > > asm-generic/setup.h.").
>> > >
>> > > It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
>> > > part of the uapi to begin with, and userspace should be able to handle
>> > > /proc/cmdline of whatever length it turns out to be.  I don't see any
>> > > references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
>> > > search, but that's not really enough to consider it unused on my end.
>> > >
>> > > The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
>> > > shouldn't be part of uapi, so this now touches all the ports.  I've
>> > > tried to split this all out and leave it bisectable, but I haven't
>> > > tested it all that aggressively.
>> >
>> > Just to confirm this assumption a bit more: that's actually the same
>> > conclusion that we ended up with when commit 3da0243f906a ("s390: make
>> > command line configurable") went upstream.

Thanks, I guess I'd missed that one.  At some point I think there was 
some discussion of making this a Kconfig for everyone, which seems 
reasonable to me -- our use case for this being extended is syzkaller, 
but we're sort of just picking a value that's big enough for now and 
running with it.

Probably best to get it out of uapi first, though, as that way at least 
it's clear that it's not uABI.

>> Commit 622021cd6c560ce7 ("s390: make command line configurable"),
>> I assume?
>
> Yes, sorry for that. I got distracted while writing and used the wrong
> branch to look this up.

Alex: Probably worth adding that to the list in the cover letter as it 
looks like you were planning on a v4 anyway (which I guess you now have 
to do, given that I just added the issue to RISC-V).
