Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167740B35D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 17:43:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H871B0hpNz2ynQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 01:43:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ph5ZqVPK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ph5ZqVPK; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H870T6tf2z2xtY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 01:43:05 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E15D761130
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631634182;
 bh=mvuoWRdgyktEZkP8N46MKfVzy+eYPbk3NccSIQmsP8g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ph5ZqVPKz60iK9jbnMMHsjXBaQdrXwsBRBP/oY5ViglsSMBFV5powNMaVQ4auKrPu
 QouXKtu79CVgLsg/mn5aflQKHJ9fUrSCeIu3pbr+WyLQjAKfPdgNS+Sjg2X/WlBO4G
 PcjQkfG1Fcg2nBfE13CR4dyTMAxKe2ztH6ZA1Dv8eLGebuSdXy+pyZabacWreW+GXI
 At43/HWkltAtpCwRjPg35I8OB3vlAy3GejIF+k5ffTYzztvv4KINQiZ/t7L16MrUma
 RwKnqC1ex9R/oO5e2xfgu0pxrFVnklawppeNa6CLjU+LWNeEKGusdGDH4O/mV075PP
 vt/m867HPNEgw==
Received: by mail-ot1-f52.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso19078733ots.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 08:43:02 -0700 (PDT)
X-Gm-Message-State: AOAM531PFedsCfXQXEP3nnfvUMIW+jLoXvtSVOd9ArtoMaauaYG02ALP
 SUpHfK30lpEKxExiVRWaCPo72QJ522VvI8zSRwQ=
X-Google-Smtp-Source: ABdhPJwx57mZePF/+fKNrTKtnKV+7kzFgjzys0SKRPzR4omYEyny9bMvp54Zq3YK48l3ZGnV9SP3mhoLYT9teXG8qeY=
X-Received: by 2002:a9d:200b:: with SMTP id n11mr15190375ota.30.1631634171520; 
 Tue, 14 Sep 2021 08:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-2-ardb@kernel.org>
 <CAHk-=whkCzP-wyZ08r9RDJRx9cbANVHy-jy=vJAGTkSbXm50iA@mail.gmail.com>
In-Reply-To: <CAHk-=whkCzP-wyZ08r9RDJRx9cbANVHy-jy=vJAGTkSbXm50iA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Sep 2021 17:42:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHK74XKWWs4C9zckOZsJP4cD+=B8gMx8QoohYVN61CJ-g@mail.gmail.com>
Message-ID: <CAMj1kXHK74XKWWs4C9zckOZsJP4cD+=B8gMx8QoohYVN61CJ-g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] arm64: add CPU field to struct thread_info
To: Linus Torvalds <torvalds@linux-foundation.org>
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
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Keith Packard <keithpac@amazon.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Sept 2021 at 17:41, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 14, 2021 at 5:10 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > The CPU field will be moved back into thread_info even when
> > THREAD_INFO_IN_TASK is enabled, so add it back to arm64's definition of
> > struct thread_info.
>
> The series looks sane to me, but it strikes me that it's inconsistent
> - here for arm64, you make it unconditional, but for the other
> architectures you end up putting it inside a #ifdef CONFIG_SMP.
>
> Was there some reason for this odd behavior?
>

Yes. CONFIG_SMP is a 'def_bool y' on arm64.
