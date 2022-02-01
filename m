Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 437404A5467
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 02:02:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnmqy0gwJz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 12:02:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=clh1/HjQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=clh1/HjQ; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnmqC6d42z2xWd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 12:01:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 141BC61242
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 01:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790FBC340EC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 01:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643677316;
 bh=24FXUCIsHwKxxR+z8h2fdRjDdPuEdYGTAEhE92+MHoI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=clh1/HjQGb7FJU4zPzPLiisxkyHkQlnwEUc1A6WJVkLW9dIYHzQ0PXw4lW/Vg5DKn
 5onsZUt0vDOUMNoI9WfI6vQJXZKP178khvz7Rq/VRq50kAOsmLgiRpwDgWTf2d6Az7
 qLLypiHBxQ842LxMEUccZgMyk/XMUjcPBz93s3VdrNd5dv3a+NX+dhnLCXs8RsY6Ej
 szFyd6hEacAuk+xV4M1QXs0NlXsIc9Vh6ETIb6OW1MK4jno/HWBhJQ0lLshUp3jyTP
 p53YjCtDBYYTX1iJ4l0WOEvKEOBySalMQB06SHGlsy3K9zXrrAATm/rudnkdWX0ZNi
 JDIE41IDEur2Q==
Received: by mail-vs1-f43.google.com with SMTP id t20so14152540vsq.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 17:01:56 -0800 (PST)
X-Gm-Message-State: AOAM530TmZzouyIw+6u0p8u5QQONM5ZJfd8vFabSE8EsCPLEEkrqtp8l
 nFKrfav+ErY7hLqCzSp0o3aVmVow2HZeSpzrxt4=
X-Google-Smtp-Source: ABdhPJzvz8wBZE7e6h6dqVKudXyTop3viJjp7xMEZGl4tGQghEfTaAqS8qRRv1daCipOlRappkP5Ne/ctRPXJ89sRVI=
X-Received: by 2002:a67:e947:: with SMTP id p7mr9138694vso.59.1643677315521;
 Mon, 31 Jan 2022 17:01:55 -0800 (PST)
MIME-Version: 1.0
References: <20220131064933.3780271-1-hch@lst.de>
 <CAK8P3a1YzdC1ev0FP-Pe0YyjsY+H3dNWErPGtB=zfcs3kVmkyw@mail.gmail.com>
In-Reply-To: <CAK8P3a1YzdC1ev0FP-Pe0YyjsY+H3dNWErPGtB=zfcs3kVmkyw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Feb 2022 09:01:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRXiCKw8M2c10KVzn6CtLirsqx+3radkgqnKgN=H9Szzw@mail.gmail.com>
Message-ID: <CAJF2gTRXiCKw8M2c10KVzn6CtLirsqx+3radkgqnKgN=H9Szzw@mail.gmail.com>
Subject: Re: consolidate the compat fcntl definitions v2
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 1, 2022 at 6:19 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jan 31, 2022 at 7:49 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Hi all,
> >
> > currenty the compat fcnt definitions are duplicate for all compat
> > architectures, and the native fcntl64 definitions aren't even usable
> > from userspace due to a bogus CONFIG_64BIT ifdef.  This series tries
> > to sort out all that.
> >
> > Changes since v1:
> >  - only make the F*64 defines uapi visible for 32-bit architectures
>
> Looks all good to me,
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> I think it would be best to merge this through the risc-v tree along
> with the coming compat support
> that depends on it.
Okay, I would include it in my next version series.

> Alternatively, I can put it into my asm-generic
> tree for 5.18.
>
>          Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
