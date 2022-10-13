Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BA5FDED4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 19:20:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpGVr6X76z3ds4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 04:20:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=RwP93R0i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=RwP93R0i;
	dkim-atps=neutral
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpGTv2S8rz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 04:19:29 +1100 (AEDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1364357a691so3053892fac.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j1qTz+oYugF8Lf770mKCIrdepvqmBbCEzwy+EaukMrM=;
        b=RwP93R0i/58OL7LRD+//xbsGSpXEvsNfrhi2GXL/rRnIR0fEBr1hhf0AxtH9ySaIuq
         fxnBUs5tBFF0nv+sS5fXPWTFdyDQIQyfW3oaIHCHCny57nHo+jkN3VT1oW56ATf0pSAn
         /cXKnAs4MWRb/mczWEGT2NYOdgosHqzbcK1Ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1qTz+oYugF8Lf770mKCIrdepvqmBbCEzwy+EaukMrM=;
        b=esnsDu/DSpe8TAMBYhKKgQXcpOR3dXscfVtcfIk/j02QJ/MauwkHHPW6mqPeE098Z3
         X8YazFKgY519W0PdWa71ysWqHxpw114a/P2EIdQ+xCd8qL6U/rMlYeHiYgD2NoG55wHp
         9jVfDdGC1Xu8f7WfEZve0xKtdWyL9WC4byqmLAvtSvB9GMOMxxQZTdxcSe/41bT+BDaI
         gT8YVw2DKyEx0ObNrm4sPtwJtZAkYi+yE1CkDsucHWIv2Yv3FhfuPatnIlhh/2diIAGi
         cEPEVmlGsNbCoRZ7PlFirp5B0dKTkvcDhoApPJw9MJAApg76pGDjQcOCR5bAazC8PhJX
         Ldvw==
X-Gm-Message-State: ACrzQf0+9WZE6Hpf498yzfzsEb4iPFCsuXJkVEY3JIShqU7QB3CQJRrr
	EFGUDQr6p5dk4W/R8LEy2Lh5PjFd4ody9A==
X-Google-Smtp-Source: AMsMyM6Vu3jJDMxmzE48w1hSi6kJZoxgCPdFB9YCtR6tLiLd68t/3mBDdnPuMbGcUOccsvU3UgYZ/A==
X-Received: by 2002:a05:6870:e0c9:b0:132:2090:20f7 with SMTP id a9-20020a056870e0c900b00132209020f7mr409438oab.277.1665681562749;
        Thu, 13 Oct 2022 10:19:22 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id d24-20020a056830045800b006618b23df05sm202853otc.21.2022.10.13.10.19.19
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 10:19:19 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id cb2-20020a056830618200b00661b6e5dcd8so425173otb.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 10:19:19 -0700 (PDT)
X-Received: by 2002:a05:6830:4421:b0:661:8fdd:81e9 with SMTP id
 q33-20020a056830442100b006618fdd81e9mr528782otv.69.1665681558964; Thu, 13 Oct
 2022 10:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221010132030-mutt-send-email-mst@kernel.org>
 <87r0zdmujf.fsf@mpe.ellerman.id.au> <20221012070532-mutt-send-email-mst@kernel.org>
 <87mta1marq.fsf@mpe.ellerman.id.au> <87edvdm7qg.fsf@mpe.ellerman.id.au>
 <20221012115023-mutt-send-email-mst@kernel.org> <CAHk-=wg2Pkb9kbfbstbB91AJA2SF6cySbsgHG-iQMq56j3VTcA@mail.gmail.com>
 <38893b2e-c7a1-4ad2-b691-7fbcbbeb310f@app.fastmail.com> <20221012180806-mutt-send-email-mst@kernel.org>
 <a35fd31b-0658-4ac1-8340-99cdf4c75bb7@app.fastmail.com>
In-Reply-To: <a35fd31b-0658-4ac1-8340-99cdf4c75bb7@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 13 Oct 2022 10:19:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLv3MO0Tvc62zJ+=4yvSfKMK17C0wfpbXBwUJqSjKbYA@mail.gmail.com>
Message-ID: <CAHk-=whLv3MO0Tvc62zJ+=4yvSfKMK17C0wfpbXBwUJqSjKbYA@mail.gmail.com>
Subject: Re: [GIT PULL] virtio: fixes, features
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: xiujianfeng@huawei.com, kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, alvaro.karsz@solid-run.com, linux-pci@vger.kernel.org, Jason Wang <jasowang@redhat.com>, wangdeming@inspur.com, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, Netdev <netdev@vger.kernel.org>, angus.chen@jaguarmicro.com, Bjorn Helgaas <bhelgaas@google.com>, lingshan.zhu@intel.com, linuxppc-dev@lists.ozlabs.org, gavinl@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 11:29 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Oct 13, 2022, at 12:08 AM, Michael S. Tsirkin wrote:
> >
> > Do these two boxes even have pci?
>
> Footbridge/netwinder has PCI and PC-style ISA on-board devices
> (floppy, ps2 mouse/keyboard, parport, soundblaster, ...), RiscPC
> has neither.

It's worth noting that changing a driver that does

        if (dev->irq == NO_IRQ)
                return -ENODEV;

to use

        if (!dev->irq)
                return -ENODEV;

should be pretty much always fine.

Even *if* that driver is then compiled and used on an architecture
where NO_IRQ is one of the odd values, you end up having only two
cases

 (a) irq 0 was actually a valid irq after all

 (b) you just get the error later when actually trying to use the odd
NO_IRQ interrupt with request_irq() and friends

and here (a) basically never happens - certainly not for any PCI setup
- and (b) is harmless unless the driver was already terminally broken
anyway.

The one exception for (a) might be some platform irq code. On x86,
that would be the legacy timer interrupt, of course.

So if some odd platform actually has a "real" interrupt on irq0, that
platform should either just fix the irq number mapping, or should
consider that interrupt to be a platform-specific thing and handle it
very very specially.

On x86, for example, we do

        if (request_irq(0, timer_interrupt, flags, "timer", NULL))

early in boot, and that's basically what then makes sure that no
driver can get that irq. It's done through the platform "timer_init"
code at the "late_time_init()" call.

(And that "late_time_init()" - despite the name - isn't very late at
all. It's just later than the very early timekeeping init - after
interrupts have been enabled at all.

             Linus
