Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FE547F6BF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 13:27:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMKnT5Y7xz3c7r
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 23:27:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O5ND8GZT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O5ND8GZT; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMKmm2tJVz2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Dec 2021 23:27:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E66260DF8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Dec 2021 12:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A33C36AF1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Dec 2021 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640521619;
 bh=Gt+sKS/vnEa5FGvBJkvK92fBrjRRtbp7Elv7vtB9T6Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O5ND8GZTzP37FqqW8YI2l78OPV1MEBsFN5w9qPpRnexGo+9xYaa1HFPkTv5Vsu5Gg
 ZPf9GHibAO3s/vFsmfwbLMgOVy4raObDtyaVspfPGUFDdzdBI8p1mCQpOg1EHdERyy
 Hj93UzgNK+XoMK1vH+ZdB63xCnx1w7FgAW/X2m8ta/2yDh6iE/q2igFWuioe2jKu2S
 ssSpUFwimZsymCnoWbPXh/BZIR5H8KjBH5KCmIZAmAEZ4QU+EWtYl1yLJQARHRQOoy
 cKltW5PrVUKXlhzuOwnQupQOwbbSnDJ5l5dOkmuXbai247xsv39sFiSx2v/Po9Ft3Z
 7MtB4KDlYriWA==
Received: by mail-ua1-f43.google.com with SMTP id p1so480320uap.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Dec 2021 04:26:59 -0800 (PST)
X-Gm-Message-State: AOAM5310P86OyNp73nxFLQ3Qs6ED5a1+E2BXWTO/k1Wn3+fSX28qRsV2
 ZKYar0d4RfWcDM1+gMFndHVO/lL1IFFMrFPTzpw=
X-Google-Smtp-Source: ABdhPJwhAjMl5vuVSY+e1MSrYZHNtN97FcWsuy4jm06VIDX71OU9nlYSpTUdTc6ASHpq06SMtAZBcytU0piDmRlLNi8=
X-Received: by 2002:a67:f2c6:: with SMTP id a6mr3560309vsn.59.1640521618234;
 Sun, 26 Dec 2021 04:26:58 -0800 (PST)
MIME-Version: 1.0
References: <20211225045430.2868608-1-guoren@kernel.org>
 <20211225045430.2868608-6-guoren@kernel.org>
 <YcdGC4ZNejSgZgRG@osiris>
In-Reply-To: <YcdGC4ZNejSgZgRG@osiris>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 26 Dec 2021 20:26:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSD-cUFzXLP4pdgkmZB=e54-uROvOFYUJDOP1ofX6_uzw@mail.gmail.com>
Message-ID: <CAJF2gTSD-cUFzXLP4pdgkmZB=e54-uROvOFYUJDOP1ofX6_uzw@mail.gmail.com>
Subject: Re: [PATCH V2 5/8] sched: s390: Remove unused TASK_SIZE_OF
To: Heiko Carstens <hca@linux.ibm.com>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-s390 <linux-s390@vger.kernel.org>,
 x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 inux-parisc@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 sparclinux@vger.kernel.or, Thomas Gleixner <tglx@linutronix.de>,
 linux-mips@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 26, 2021 at 12:26 AM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> On Sat, Dec 25, 2021 at 12:54:27PM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > This macro isn't used in Linux sched, now. Delete in
> > include/linux/sched.h and arch's include/asm.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/s390/include/asm/processor.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
>
> I could pick this up for s390, however sender (From: field) of this patch
> series does not match From: and Signed-off-by: fields above.
Thx.

>
> In general I don't pick up such patches, since this doesn't match the
> "Developer's Certificate of Origin" requirements.
> -> Documentation/process/submitting-patches.rst
I've updated .mailmap with:

Guo Ren <guoren@kernel.org> <guoren@linux.alibaba.com>
Guo Ren <guoren@kernel.org> <ren_guo@c-sky.com>

------

If you are still concerned, how about:

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux sched, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
