Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDF8413321
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 14:05:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDKrb3Dfmz2ywv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 22:05:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JJyTS/Ag;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JJyTS/Ag; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDKqw1JCWz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 22:05:16 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC70961183
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632225911;
 bh=DG9JNZQFvl7efc4nexOO4fg+5WMfNAZoucbjG4viZJY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JJyTS/Ag55xb5DaeQp7F/jXV/FBOFUAn8DPNofQFs1saJsZ9sCRXEj12daNeZ1Z3U
 IJy7rdLd28cfnkbFUIPx4l7a+jIPlBdCcqM4P3EccSTxfZw5ypMtQ4wJgi1clqmWah
 j9Ejl58vKka4j6aQrNPBU/aFzlnNh+0AQfmM4Ih6RjJZmAogI88Ui9hHtLFzYnYTjy
 /K2gKIXmjvfjrzLNRhsf7+kbOPs1N4Um/G5dQGUjJpf8KBG52ZNUGqVHWux9ZmKhl0
 6Erkeugudc5Kx2xaCACxztYTUSoys36n4wnpOGdktFllSKtMgVbKq4alyxOKGVfvib
 Zpyp6ZjfVtnaA==
Received: by mail-ot1-f48.google.com with SMTP id
 c42-20020a05683034aa00b0051f4b99c40cso28026667otu.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 05:05:10 -0700 (PDT)
X-Gm-Message-State: AOAM532Gwku9bjg7E9oGoM9r7X2OGEXgzYUv06IDYFl6MM0dmfPU9Yc8
 8LBqFUgQtU80UNv7UycPQt/HWbeTn1ChxXBoxjo=
X-Google-Smtp-Source: ABdhPJxUqmu5iQVr6fZ3TQM6eziNelFJiJn18TFwtwwTecybfc/0teebK58ixSK16CBCXGG0Y5zoMsZaVGfK1lcWdYI=
X-Received: by 2002:a05:6830:3189:: with SMTP id
 p9mr22365233ots.147.1632225899996; 
 Tue, 21 Sep 2021 05:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-2-ardb@kernel.org>
 <YUNXfWKZ7XYvw2EK@arm.com>
In-Reply-To: <YUNXfWKZ7XYvw2EK@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 21 Sep 2021 14:04:48 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFkJtVaT2CjigZHLT+AAjmCzU1OgTg+QS-ttJxmejGkRQ@mail.gmail.com>
Message-ID: <CAMj1kXFkJtVaT2CjigZHLT+AAjmCzU1OgTg+QS-ttJxmejGkRQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] arm64: add CPU field to struct thread_info
To: Catalin Marinas <catalin.marinas@arm.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Keith Packard <keithpac@amazon.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Sept 2021 at 16:41, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Tue, Sep 14, 2021 at 02:10:29PM +0200, Ard Biesheuvel wrote:
> > The CPU field will be moved back into thread_info even when
> > THREAD_INFO_IN_TASK is enabled, so add it back to arm64's definition of
> > struct thread_info.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks. I take it this applies to patch #5 as well?
