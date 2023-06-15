Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD07732195
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 23:23:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=xQ0UEfbe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhwJ10602z3bmh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 07:23:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=xQ0UEfbe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhwH42K5fz309J
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 07:22:23 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5701810884aso1428017b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 14:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686864139; x=1689456139;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S2y2ag2VSA5iJWjnLMJgW21sD26IXOkwRb84bIEjNFc=;
        b=xQ0UEfbeHsvyF9P9GSzV8sPaDnCduWem82QRocOPVTimyNaz+TtzXunPSdeRzXvvAi
         vai/I3V4xnGwkuPBK2C8BxgXmG/grI3PNJPpvIXErHwA9uzmeBRdld+oVJisQfogsxl0
         vGLKSwM0YFacwx/AmX5Id6XW9gRfBLJoOHHDKed5GhoMi63Kk25c1kBjAvC4IVlUHe3e
         oelGGGI8RCOSrTPLR5K32xFZslyRFLZPbM5b3aFNmrO++aNzcuug8bpdMx1IF1HOO2ol
         NHDhCqI2eK44IOXmk4glSuyplwnvkIK/n7XkQCIImv5fgRh6qF4f64HAb8zfCbRE0z7D
         2CQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686864139; x=1689456139;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2y2ag2VSA5iJWjnLMJgW21sD26IXOkwRb84bIEjNFc=;
        b=ckRjXvJlWiPg/ffKkGXiXrFpTChKoW29kTVE3qeqqnYHfx+NoZxuaOEkBf1FrTKpRo
         tSojQ2fcE94We5odgpQsj0w1DssREngUCxTpl6XtvfX+C64LuAiRG22Ib/z218e1ABVi
         CGFbIWlvfkTEOD9OSaQC9wXi8EXgwJZULu2e9hTelBm9Iu232J3mmp4q1BdeQldL1pdc
         JP89qbR/CrZdVF/M0ML1YdxmdSPWTM3vwCqXNkP/79BDQFq12AokrPieXBPx88vUbSW/
         bTnHmz1fZaez8/MmBeHYuorUdEByV0UHtKSoBV+LyrZmhZ0zcDc5rUm4BBT8UM4gpBtv
         QxlA==
X-Gm-Message-State: AC+VfDzPkBSuNYKF31K0/zs9E2GsmiVV0kJKeRJbq8Ll4zdX4fdoGDMe
	Mu01izqSHHxeGDcJdT9pBSwSJg==
X-Google-Smtp-Source: ACHHUZ7Wn443nNp7TXnOUS1g0CwvPfeS1ec2zVwJBnOAceqd4kD8IQUnTLQfS40NfWgzNKeH64ll/A==
X-Received: by 2002:a81:83d3:0:b0:56c:ea2c:5cb2 with SMTP id t202-20020a8183d3000000b0056cea2c5cb2mr5787878ywf.49.1686864139515;
        Thu, 15 Jun 2023 14:22:19 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id s189-20020a0de9c6000000b0054f80928ea4sm4626438ywe.140.2023.06.15.14.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 14:22:19 -0700 (PDT)
Date: Thu, 15 Jun 2023 14:22:15 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 07/23] mips: update_mmu_cache() can replace
 __update_tlb()
In-Reply-To: <20230615155059.GB3665766@dev-arch.thelio-3990X>
Message-ID: <76b41825-30fa-b9e8-d043-2affcba24317@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com> <178970b0-1539-8aac-76fd-972c6c46ec17@google.com> <20230614231758.GA1503611@dev-arch.thelio-3990X> <f5526f17-9d78-f7ea-427a-7e76bfeb6b8@google.com> <344a4da-3890-45fd-607e-b5f85ca6ad48@google.com>
 <20230615155059.GB3665766@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 15 Jun 2023, Nathan Chancellor wrote:
> On Wed, Jun 14, 2023 at 10:43:30PM -0700, Hugh Dickins wrote:
> > 
> > I do hope that you find the first fixes the breakage; but if not, then
> 
> I hate to be the bearer of bad news but the first patch did not fix the
> breakage, I see the same issue.

Boo!

> 
> > I even more fervently hope that the second will, despite my hating it.
> > Touch wood for the first, fingers crossed for the second, thanks,
> 
> Thankfully, the second one does. Thanks for the quick and thoughtful
> responses!

Hurrah!

Thanks a lot, Nathan.  I'll set aside my disappointment and curiosity,
clearly I'm not going to have much of a future as a MIPS programmer.

I must take a break, then rush Andrew the second patch, well, not
exactly that second patch, since most of that is revert: I'll just
send the few lines of replacement patch (with a new Subject line, as
update_mmu_cache() goes back to being separate from __update_tlb()).

Unless you object, I'll include a Tested-by: you.  I realize that
your testing is limited to seeing it running; but that's true of
most of the testing at this stage - it gets to be more interesting
when the patch that adds the rcu_read_lock() and rcu_read_unlock()
is added on top later.

Thanks again,
Hugh
