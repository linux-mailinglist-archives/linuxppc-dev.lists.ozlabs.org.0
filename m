Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD9E438441
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 18:05:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hc5fq5nP4z2yP7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Oct 2021 03:05:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YcA0X7ZJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YcA0X7ZJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hc5f64F4Wz2xXC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Oct 2021 03:05:18 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A8826112D
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635005115;
 bh=a0FullCysk1UJY/SuwNW+JkwKz1DX5zFsZR7u65jCCk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YcA0X7ZJT9KPq++0vy4Zc9YPjW55ngCXT3XYqy0oc0V32YWSyFzKjWH46Wfk6JUB6
 PCIDwfEBeDkcsFDGtdhqthdSSccuQ4eBo6P/LqmrXl9bChhrw5voAlYoYh7iNIzAji
 I/i5bgtEUMvO3AEqG3qlH4MZ1DNT15pXqUIREZ0Yj9fWIMtdEKWa5Dl0hx2Av4mXBx
 aZYfYYaL5Ja4lDViVX9MnZlv3E1cOX3kebEmYI6h4HSEkK5Cu3dI3EbNPUElSQ0S/m
 arVBv2qit0AEO2JDL2ItsVAj0xcsKg0bg0oX/nPHGUknfGsiTy2YfqGtAARZUCZBYT
 WlW6qCwcUiNFA==
Received: by mail-wm1-f46.google.com with SMTP id
 j2-20020a1c2302000000b0032ca9b0a057so1618574wmj.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 09:05:15 -0700 (PDT)
X-Gm-Message-State: AOAM5322i49CQRsgvR3w3lruELuav8sUNtDDhn23Y5cp4F6U0ZJHJDpL
 IwAIPOkuKs7dsA3guJABiAbjNMGwHIG5EZFqGbY=
X-Google-Smtp-Source: ABdhPJzw9bHMXdBR8sTpnXzuM1z62QqWWvXCArLgXmJmvR/CFzjvKRNvYnRPFIYed1aqogH5ms1MCPnMvzTwp0uq874=
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr36618604wmq.82.1635005113773; 
 Sat, 23 Oct 2021 09:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
In-Reply-To: <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 23 Oct 2021 18:04:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
Message-ID: <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
Subject: Re: [PATCH] locking: remove spin_lock_flags() etc
To: Waiman Long <longman@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Openrisc <openrisc@lists.librecores.org>, Stafford Horne <shorne@gmail.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 23, 2021 at 3:37 AM Waiman Long <longman@redhat.com> wrote:
>> On 10/22/21 7:59 AM, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > As this is all dead code, just remove it and the helper functions built
> > around it. For arch/ia64, the inline asm could be cleaned up, but
> > it seems safer to leave it untouched.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Does that mean we can also remove the GENERIC_LOCKBREAK config option
> from the Kconfig files as well?

 I couldn't figure this out.

What I see is that the only architectures setting GENERIC_LOCKBREAK are
nds32, parisc, powerpc, s390, sh and sparc64, while the only architectures
implementing arch_spin_is_contended() are arm32, csky and ia64.

The part I don't understand is whether the option actually does anything
useful any more after commit d89c70356acf ("locking/core: Remove break_lock
field when CONFIG_GENERIC_LOCKBREAK=y").

      Arnd
