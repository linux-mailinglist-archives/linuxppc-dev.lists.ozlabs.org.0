Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E52495A6E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 08:13:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jg9bG2nMPz3c9h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 18:13:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k3uRWzp0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k3uRWzp0; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jg9Zb2cH7z30L4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 18:13:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D154161779
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 07:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A97C340E8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 07:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642749188;
 bh=SYu90Dv3l/L+64SNcy50aiw16Lnx3umbKRTsGOMrQkg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k3uRWzp0SWvrQt4wpv0wp6HqoqMuube0dVeHTED+DvTqJqQ9JteKgAHFuRzMK7La9
 hdnPtmnF2+6oHL0sMYFETK3B/JMjsOW1iHomI2Xxura1sskJ+xnkPbfy35KWaVO1oF
 26rdD0dYwJ3PYFSq+U3dWovrDZcwDzLVyfSAEZDEYRmJINM8Tmg0Ctmu12Rf81s5Ac
 gTKy8KVDZlLocphtUaf3ZDWDQa7DnN48hoqfKvLktVOOCow1KTrdDLQoLL6djNiLnt
 IAwyIbddJ0s5SrRTLwybw+lS0U5xtFSYhGyprgDLn7Xl/Wos5XISZ+lA6JoDVYmrwQ
 LJ4wkPbrGtrCw==
Received: by mail-ua1-f47.google.com with SMTP id f24so15217215uab.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 23:13:08 -0800 (PST)
X-Gm-Message-State: AOAM530fxxxxdBZ9NqlcZnP6AH3gt+dMX8V9cNT23NBziSrnsvEJvlOW
 NwN4FgzO7qdGiATvzv1KVTcBcAwYagMjWpQ3lvU=
X-Google-Smtp-Source: ABdhPJx6xNJuRVb4aLVlJ7P9bbeDPtJXSmXNRd3kkpQg8PkHlzrym8B0ENWLs0YxpXjFKvxlitpnKg+MIWjsd2Jznqg=
X-Received: by 2002:a67:c89e:: with SMTP id v30mr1186161vsk.2.1642749187280;
 Thu, 20 Jan 2022 23:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-14-guoren@kernel.org>
 <CAK8P3a03-3QTC-vxmnbouK7wBd8iunPGZpX0-Jf6ntS1DY0E=w@mail.gmail.com>
In-Reply-To: <CAK8P3a03-3QTC-vxmnbouK7wBd8iunPGZpX0-Jf6ntS1DY0E=w@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jan 2022 15:12:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRMWj0yVLn2=16Gu1O-6tuqLaxcdduw0YnDK6vrizJEsQ@mail.gmail.com>
Message-ID: <CAJF2gTRMWj0yVLn2=16Gu1O-6tuqLaxcdduw0YnDK6vrizJEsQ@mail.gmail.com>
Subject: Re: [PATCH V3 13/17] riscv: compat: signal: Add rt_frame
 implementation
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 gregkh <gregkh@linuxfoundation.org>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, inux-parisc@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 20, 2022 at 6:31 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement compat_setup_rt_frame for sigcontext save & restore. The
> > main process is the same with signal, but the rv32 pt_regs' size
> > is different from rv64's, so we needs convert them.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
>
> I hope someone else can properly review this part, it's not my area
> but it looks complex enough that it could bring subtle bugs.
Here are ltp signal test results:

sigaction01                                        PASS       0
sigaction02                                        PASS       0
sigaltstack01                                      PASS       0
sigaltstack02                                      PASS       0
sighold02                                          PASS       0
signal01                                           PASS       0
signal02                                           PASS       0
signal03                                           PASS       0
signal04                                           PASS       0
signal05                                           PASS       0
signal06                                           CONF       32
signalfd01                                         PASS       0
signalfd4_01                                       PASS       0
signalfd4_02                                       PASS       0
sigpending02                                       PASS       0
sigprocmask01                                      PASS       0
sigrelse01                                         PASS       0
sigsuspend01                                       PASS       0
sigtimedwait01                                     PASS       0
sigwait01                                          PASS       0
sigwaitinfo01                                      CONF       32


>
>        Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
