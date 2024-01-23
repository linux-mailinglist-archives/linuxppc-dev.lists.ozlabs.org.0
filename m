Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3B8387AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 07:46:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2n7B0czH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJyKm4V5nz3cSL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 17:46:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2n7B0czH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJyJz4lT5z3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 17:45:39 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5ff821b9acfso35417997b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 22:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705992336; x=1706597136; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoTQEe2OLzexfh/hP6idvwNfJdYn+1MZAqnZalpJe8M=;
        b=2n7B0czH7IVi7gDCTmBZXCB4xzXe8mGKSJ18+T1fb7qo+iboTejM73EAo4rooDG2Kq
         BJ+pOmp1FZnhQa+V4oAh/JQaPuBg0Kj0edvwlVO9Ptb6nzdYxClB//dvHkBnPFEuDMav
         W/l/h7kh4vFGfORr+zgcn5NlnHitefn4apnYc+tvv7KVqKbiknZsgMG5RcG3VnUNSC1x
         nY4GDNwF/zg+KbGs5MePKNGzi6ZcBGP4CE/mvj6wsLrCKhQHvDPTsw9QiZZtrTnDhoMk
         3iadBwLKQeVb0SbTdyvyCm95o7tmOo3AjFCdxvGIDfS7Jo1oZD5TB2bAaLscTAp9raUB
         T6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705992336; x=1706597136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PoTQEe2OLzexfh/hP6idvwNfJdYn+1MZAqnZalpJe8M=;
        b=GmhoQ1tzjQ4mKze1GlhwbMlBfmUIb0uQi7OgaqRnrPQq9aUBUfO1Bud18Kbr7aR3+v
         s/xtHVYK06rURNVkK/7l9aJh4guMVEuci3u1twHxo6dfPOAY9eoUI1IKLJDNKwy+jCxm
         7LnY3j6lXRf5oelNqosPTzer6bgLsJrRim98qWDxjQ3ehavYioBNXrDweAIqTuQ69Jw7
         b4HwdE2GwGLQtXdeFBJR+ahKJMkKMB6tAwA2e2iYUuLrZNWasOZgWdhAQc56bB108v6h
         enUe1z0qGJqPG82dbEJE3Ll01PDkcYE3Xg+m2BVcy/HFuWF85zmf0H4EmC1oDqVfwx5B
         OoZA==
X-Gm-Message-State: AOJu0YzvF2S/g1BYLv41Pj4qPMDln6BWuTpIZQqMDjPudURMOLGNcNFt
	KpJE7m4+N0eel3rMULgT0uks6rL9OnECjKgMJXSOPZmc8GSmUHtF52WN65fu6bhMomCTxUQigui
	KafViViLo2ZMnmLPRIL+X9S54tYpZFmCNT5C+
X-Google-Smtp-Source: AGHT+IEBqXVQUIfO9mccqsYMSFKUq4apywgfGuA1NVIzT8EfPN/xT4990ujq0TPyyxp+o6U+5W7GppWF3JfUAOUZ4Rs=
X-Received: by 2002:a81:a090:0:b0:5ff:ae75:fe6f with SMTP id
 x138-20020a81a090000000b005ffae75fe6fmr3254872ywg.44.1705992336083; Mon, 22
 Jan 2024 22:45:36 -0800 (PST)
MIME-Version: 1.0
References: <20231226214610.109282-1-surenb@google.com> <170578498755.24348.16166096320323933297.git-patchwork-notify@kernel.org>
 <Zaw31DVa9q3JZASo@shell.armlinux.org.uk> <CAJuCfpGV_CwQm+PuiqRz3L1x7QnpgE9LQb4PPChqFv0mzbYeBw@mail.gmail.com>
In-Reply-To: <CAJuCfpGV_CwQm+PuiqRz3L1x7QnpgE9LQb4PPChqFv0mzbYeBw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 22 Jan 2024 22:45:25 -0800
Message-ID: <CAJuCfpHVCLB0+G0amOk8tC=+--aX39n_ZRbKfhqhvJjdqjTVag@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch/mm/fault: fix major fault accounting when
 retrying under per-VMA lock
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-s390@vger.kernel.org, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, willy@infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, palmer@dabbelt.com, luto@kernel.org, linux-riscv@lists.infradead.org, patchwork-bot+linux-riscv@kernel.org, will@kernel.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 21, 2024 at 11:38=E2=80=AFPM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Sat, Jan 20, 2024 at 1:15=E2=80=AFPM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Sat, Jan 20, 2024 at 09:09:47PM +0000, patchwork-bot+linux-riscv@ker=
nel.org wrote:
> > > Hello:
> > >
> > > This patch was applied to riscv/linux.git (fixes)
> > > by Andrew Morton <akpm@linux-foundation.org>:
> > >
> > > On Tue, 26 Dec 2023 13:46:10 -0800 you wrote:
> > > > A test [1] in Android test suite started failing after [2] was merg=
ed.
> > > > It turns out that after handling a major fault under per-VMA lock, =
the
> > > > process major fault counter does not register that fault as major.
> > > > Before [2] read faults would be done under mmap_lock, in which case
> > > > FAULT_FLAG_TRIED flag is set before retrying. That in turn causes
> > > > mm_account_fault() to account the fault as major once retry complet=
es.
> > > > With per-VMA locks we often retry because a fault can't be handled
> > > > without locking the whole mm using mmap_lock. Therefore such retrie=
s
> > > > do not set FAULT_FLAG_TRIED flag. This logic does not work after [2=
]
> > > > because we can now handle read major faults under per-VMA lock and
> > > > upon retry the fact there was a major fault gets lost. Fix this by
> > > > setting FAULT_FLAG_TRIED after retrying under per-VMA lock if
> > > > VM_FAULT_MAJOR was returned. Ideally we would use an additional
> > > > VM_FAULT bit to indicate the reason for the retry (could not handle
> > > > under per-VMA lock vs other reason) but this simpler solution seems
> > > > to work, so keeping it simple.
> > > >
> > > > [...]
> > >
> > > Here is the summary with links:
> > >   - [1/1] arch/mm/fault: fix major fault accounting when retrying und=
er per-VMA lock
> > >     https://git.kernel.org/riscv/c/46e714c729c8
> > >
> > > You are awesome, thank you!
> >
> > Now that 32-bit ARM has support for the per-VMA lock, does that also
> > need to be patched?
>
> Yes, I think so. I missed the ARM32 change that added support for
> per-VMA locks. Will post a similar patch for it tomorrow.

Fix for ARM posted at
https://lore.kernel.org/all/20240123064305.2829244-1-surenb@google.com/

> Thanks,
> Suren.
>
> >
> > --
> > RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> > FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
