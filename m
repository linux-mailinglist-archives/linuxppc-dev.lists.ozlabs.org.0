Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E92B630EE42
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 09:23:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWWlY6KWZzDrdj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 19:23:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LxvPH9bB; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWWjc12NkzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 19:21:37 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id g15so1571238pgu.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 00:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=XXkvcBKboNN7LGIeynhgZT6EpSB86akvi9IwRytyAz8=;
 b=LxvPH9bB5kAaZOYcJLU2iOG2OormPkekcFLSUlN6cpK/oqo551ZRevlJQSdTj9CxB1
 rCfZlOPlLe/FAdkjd2tYzWS9LBxKvSFzufueWwEGAGkcWFAqv25IWvqpQyhSiMt4SAVS
 IpwD9JkOriCnJ+Q2+N5mwql7JWGZEvEdu+lsUSo2ZjViWm0HoCSwf31f0+Si9XG/N8Y+
 ctZRHcpTf6yjXhE1LnhjgMfKCvchelCV6B1Rd/DFlkGhGVypKY6ORTk+GdVvtVOW0AFN
 N/inRTqZVWOdJbPmt5xeAky+ZVODprxaeWovrbG6up5GSTM5MOdsUH7PHg5NhFEcKaQX
 F6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=XXkvcBKboNN7LGIeynhgZT6EpSB86akvi9IwRytyAz8=;
 b=IjswIUKtiDDmsNLkmEJhv2PsW2wrNGnXVP+gfiusTd/ZezFDEzvpdWGr3HzpACX2wB
 zOdfRbAexFMv8YSFfiEArpiFLnbKizi9R7U9xFehHRlfqmRXeWiuucu09hY+twUlhKGs
 a9I56F2Io0/VHjPFcdzqVyQnT94euopr6b2r/uumtnx68oiXVszNK9hTlNkQ/nQqwwnY
 8xX4ki3i/tQC6eiFULrSWYrdXl93vIoDjjE/3WlGAaJu4fTd9S/MJ64qoBzMnWr7DnKh
 sAhZEGY+lkNHC+XLnNsETeGUXparc74ceTKUmy40CtogSgpNaHr8QnorkZtamzDRf+aw
 AU1g==
X-Gm-Message-State: AOAM532zZU8DRjmcn8CVlkmqKcDZcKMysuG8Iv2Xp2pvUS4uSus9YOsx
 5km+J6PEZF5PmdEGCwl+9kQR0cMa7G8=
X-Google-Smtp-Source: ABdhPJyFh2UIalFWfH9S0Gigao8PrBaKb3QduCZYTwG0z0xvXFRe3aj70yzjXDYS3R0QrYEyG2SNLA==
X-Received: by 2002:a63:1c13:: with SMTP id c19mr7570212pgc.359.1612426893809; 
 Thu, 04 Feb 2021 00:21:33 -0800 (PST)
Received: from localhost ([1.132.253.145])
 by smtp.gmail.com with ESMTPSA id 72sm4819621pfw.170.2021.02.04.00.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 00:21:33 -0800 (PST)
Date: Thu, 04 Feb 2021 18:21:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/5] shoot lazy tlbs
To: linux-kernel@vger.kernel.org
References: <20201214065312.270062-1-npiggin@gmail.com>
In-Reply-To: <20201214065312.270062-1-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1612426668.622xblt2lx.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Andy Lutomirski <luto@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I'll ask Andrew to put this in -mm if no objections.

The series now doesn't touch other archs in non-trivial ways, and core code
is functionally not changed much / at all if the option is not selected so
it's actually pretty simple aside from the powerpc change.

Thanks,
Nick

Excerpts from Nicholas Piggin's message of December 14, 2020 4:53 pm:
> This is another rebase, on top of mainline now (don't need the
> asm-generic tree), and without any x86 or membarrier changes.
> This makes the series far smaller and more manageable and
> without the controversial bits.
>=20
> Thanks,
> Nick
>=20
> Nicholas Piggin (5):
>   lazy tlb: introduce lazy mm refcount helper functions
>   lazy tlb: allow lazy tlb mm switching to be configurable
>   lazy tlb: shoot lazies, a non-refcounting lazy tlb option
>   powerpc: use lazy mm refcount helper functions
>   powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
>=20
>  arch/Kconfig                         | 30 ++++++++++
>  arch/arm/mach-rpc/ecard.c            |  2 +-
>  arch/powerpc/Kconfig                 |  1 +
>  arch/powerpc/kernel/smp.c            |  2 +-
>  arch/powerpc/mm/book3s64/radix_tlb.c |  4 +-
>  fs/exec.c                            |  4 +-
>  include/linux/sched/mm.h             | 20 +++++++
>  kernel/cpu.c                         |  2 +-
>  kernel/exit.c                        |  2 +-
>  kernel/fork.c                        | 52 ++++++++++++++++
>  kernel/kthread.c                     | 11 ++--
>  kernel/sched/core.c                  | 88 ++++++++++++++++++++--------
>  kernel/sched/sched.h                 |  4 +-
>  13 files changed, 184 insertions(+), 38 deletions(-)
>=20
> --=20
> 2.23.0
>=20
>=20
