Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 170E34A48B0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 14:51:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnTxz5zGcz2xtb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 00:51:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VB1HtyLz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VB1HtyLz; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnTxK48xWz2xMQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 00:51:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 441A0B82B2E
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 13:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F44C340F9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643637070;
 bh=Zm6bqi0OhyogvNh7aVMw7s3EunV9nSGhxKYNcbdO5KQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VB1HtyLzdS8WyvTpKJiOpoPPxcoguxNbLzYv4abyqilCHSyogINouv1glvQJZFH4Q
 klN9Wf3wTM0XCcb+sbaTp/p8xQ3BGlv3yDFVAn7mISzfv+RJ6uwysKLrZqcIeuZsV0
 BafaHReeaiYXGCqOvoDbXH50/QdF/KmcOkwUxcC6z5s7S+ynuf4rtQHXbffR8BjGLb
 OitbrZLld31AnRz+oX2yFY1TO1RrEA5ZhTTBsfnzjWQo8vsm9Slf91RTtqGsq68Oz9
 hbWbewIN8h4nsorfwtz6FBkTHNk15L724FloIzYmecGANavOB6kIoQwYSRDlSCKONR
 zPKyniu/L1/aw==
Received: by mail-vs1-f47.google.com with SMTP id a19so11839484vsi.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 05:51:10 -0800 (PST)
X-Gm-Message-State: AOAM532IaMEN67PMdovw85rzkc4exNxlQhEompBOOpH8hPTfcZ9Nvzc/
 sdJXyL0iH/g+muKUDwwzMkGK1ZbNLYqnkKiOxMY=
X-Google-Smtp-Source: ABdhPJz6ty+HfMaRNZhEmkeOc11XYS0No2YCxA7dV1DvlPk1ApPFjUS4E1RUl7Xx1jtPl3XXvKrXpTneiT3oAugpR68=
X-Received: by 2002:a67:e947:: with SMTP id p7mr7921986vso.59.1643637069468;
 Mon, 31 Jan 2022 05:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
 <YffVZZg9GNcjgVdm@infradead.org>
In-Reply-To: <YffVZZg9GNcjgVdm@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 31 Jan 2022 21:50:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
Message-ID: <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
To: Christoph Hellwig <hch@infradead.org>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 31, 2022 at 8:26 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> Given that most rv64 implementations can't run in rv32 mode, what is the
> failure mode if someone tries it with the compat mode enabled?
A static linked simple hello_world could still run on a non-compat
support hardware. But most rv32 apps would meet different userspace
segment faults.

Current code would let the machine try the rv32 apps without detecting
whether hw support or not.


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
