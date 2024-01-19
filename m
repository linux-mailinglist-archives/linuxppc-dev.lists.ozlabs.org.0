Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261D833095
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 23:00:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=TFvhpA+B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGtpC3xxSz3cVd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 09:00:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=TFvhpA+B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGtnL41bfz2yky
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 08:59:34 +1100 (AEDT)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-59927972125so592862eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 13:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1705701571; x=1706306371; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5S7IqMYVGKNqJZ35fEQj0xzfnTIX8E84YBSqWvhnC0=;
        b=TFvhpA+B5uXwi5ERxJrsHO7kqh08gE1w0UC9VYpcFLgRMZHK804qEw5iOc6ziE6voD
         cKg+XDxifLtH/NTbujDKiG/QhJR4YlWolTOw5BHxOS2ksP380GZTnIRxIYfnQp0wGit3
         YwNJD1UNGewC0SUUJdUoOIhesKfM7JDocRm/usD0vwl9T/ET/FQRfRhvFLsTvZuv7EXE
         B6YbV3kzy+cTB8q1Nmlrcx/kEaP6Xq8d9p0QZOIgWwGub559z66uJNNv0qdR//Sk6FUD
         YWBXM/kVmXhI2BYC72UJMW30V9qwKeTeC2YnBcc9MsaCilEmr+3X43ZCSq3Dchz8yiTU
         ZfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705701571; x=1706306371;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5S7IqMYVGKNqJZ35fEQj0xzfnTIX8E84YBSqWvhnC0=;
        b=gVpQ7gKoBzvLkEy2lmaMSrKxGw5fwpnB1QIv3AfkfQ6ZfS9Gb8rtn9f1ty2ert0e0A
         hT2m2p3ewEMTbaxcMA3Ai8kVeyqVXFRp/ICmAx5DGEEAc6Q+XkpZEcJA0tg9Y8xwqADP
         bNiOQNnlkM4GRj88VCGFrqj0wYmGzUbI3ZKipuNj2YuxHvsu6PtaSV8yyZSwd4sfvAjR
         x/geswZ+XG4pAbKS932LvBaDfxXa0Ci7XD1gboR0lZ3smkrO1LsNFNtmv9r8HUPU0Om8
         tL3I5v3CZrZGpbML8SYX5BI0/JZYPXXJeND8MGwru8b5nFNm4z37YEO0epjFqqFBy/c1
         vW9A==
X-Gm-Message-State: AOJu0YzXSMwdpCrFLi0i54ybfUCkFN0ZznhRA8JVlhpXJvDeyfaVgAbu
	AXIgeEzf134MXyh708Zbwd+1ppRbHeH3YRa7PTa1lon5pbESv0gl4UlZJhSWjKU=
X-Google-Smtp-Source: AGHT+IESicOUtDUT+5BwgwqSfPXAdnKkq3SaMukVEeCzOBMaA+ge58Litoyb9vV7itnjx54Th0+h3w==
X-Received: by 2002:a05:6359:4290:b0:175:bf72:cfd4 with SMTP id kp16-20020a056359429000b00175bf72cfd4mr419654rwb.31.1705701570687;
        Fri, 19 Jan 2024 13:59:30 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 37-20020a630a25000000b005ceb4a6d72bsm3824521pgk.65.2024.01.19.13.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:59:30 -0800 (PST)
Date: Fri, 19 Jan 2024 13:59:30 -0800 (PST)
X-Google-Original-Date: Fri, 19 Jan 2024 13:58:56 PST (-0800)
Subject: Re: [PATCH v5 0/5] RISC-V SBI debug console extension support
In-Reply-To: <CAK9=C2UV8J52a1pZjsNpFNwpUKn5K3nhS-+bS-3pohDwi3HrfQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-f5f3ec82-ce6a-4e20-8799-f36fd82d74b6@palmer-ri-x1c9>
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
Cc: Greg KH <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, nathan@kernel.org, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Jan 2024 02:09:18 PST (-0800), apatel@ventanamicro.com wrote:
> On Sat, Jan 13, 2024 at 12:00 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Thu, 11 Jan 2024 06:50:37 PST (-0800), patchwork-bot+linux-riscv@kernel.org wrote:
>> > Hello:
>> >
>> > This series was applied to riscv/linux.git (for-next)
>> > by Palmer Dabbelt <palmer@rivosinc.com>:
>> >
>> > On Fri, 24 Nov 2023 12:39:00 +0530 you wrote:
>> >> The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
>> >> SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
>> >> functions sbi_console_putchar() and sbi_console_getchar().
>> >> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)
>> >>
>> >> This series adds support for SBI debug console (DBCN) extension in
>> >> Linux RISC-V.
>> >>
>> >> [...]
>> >
>> > Here is the summary with links:
>> >   - [v5,1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
>> >     https://git.kernel.org/riscv/c/f503b167b660
>> >   - [v5,2/5] RISC-V: Add SBI debug console helper routines
>> >     https://git.kernel.org/riscv/c/f43fabf444ca
>> >   - [v5,3/5] tty/serial: Add RISC-V SBI debug console based earlycon
>> >     https://git.kernel.org/riscv/c/c77bf3607a0f
>> >   - [v5,4/5] tty: Add SBI debug console support to HVC SBI driver
>> >     https://git.kernel.org/riscv/c/88ead68e764c
>> >   - [v5,5/5] RISC-V: Enable SBI based earlycon support
>> >     https://git.kernel.org/riscv/c/50942ad6ddb5
>> >
>> > You are awesome, thank you!
>>
>> Nathan points out that this has some semantic conflicts with a patch in
>> Greg's TTY tree: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?id=f32fcbedbe9290565e4eac3fd7c4c451d5478787
>>
>> So I think the best bet is to wait on Greg's patch to land in Linus'
>> tree, and then base a v6 of this patch set on that merged patch.  I'm
>> going to drop this one from for-next.
>
> Greg's patch is now available in upstream Linux so I will rebase and
> send out v6.

Sorry, I forgot about this one and merged it.  I just sent up a fixup: 
https://lore.kernel.org/all/20240119215612.20529-2-palmer@rivosinc.com/ 
.

>
> Thanks,
> Anup
