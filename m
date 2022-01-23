Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678C7497164
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 13:01:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhWtJ1xpfz3bP1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 23:01:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g0fGj6Om;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=g0fGj6Om; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhWsh57B9z2yb5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 23:00:54 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 g9-20020a17090a67c900b001b4f1d71e4fso13653523pjm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 04:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s6ObeCNPk+SvKn3nt49svsyLck23z9+pgZQXLPyR544=;
 b=g0fGj6OmGCrs+/F2v3Y7CWh9fevDhm4ygrM2oNAsjw6Om7lH/4vIfI5T5yTTxykGLr
 UAP4YdX7apcTgqIm74rkkanghDjYeSkZa5EBUb4u3QELU2uYUKdRZseB1Sol8XK5VWlT
 25PagACFn/gH7N07jzI9CFi5QcHHezC5gOlxf0H9j7WE8A7r79hzL9SfIHuRctibCxPZ
 +pfxdhwcPhRBMZcv9uvY8k8wblVRlNNmzEJsocuSV4wuCdS+Q5NPYYO8nZgUzh0zDIiH
 /7ohOnUFsPkQfAybOgkpjLqEdRBEgV/z11fjf0rPx0NTMmmXAfQFBJWnYReMnAHtlFMa
 4jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s6ObeCNPk+SvKn3nt49svsyLck23z9+pgZQXLPyR544=;
 b=TaT0RbCqvFGhbtg5RoB+jFfQ61D9sBAQegF6y4g5APRwzdETncOxrLZFfu6nUwM88p
 OyT0pivqW3Pke3nhKo+/sWeRLZyq8WLO1tGsjl4QMyrVCpTyy5ysilAzgQ3kE5IAW8/j
 Y+zz4jcEtuUFiDnstAbJS54ST5Qi9bRjD09Ld3X6s3ZqQ32HTuvyYYgGk2rR4cINM9xk
 cPpwhkHEmejCWsg5bHaqd1nMmMbeKb++dmEPICL+IYkHWsBsx5z3J9pjd3yZIsG6nXZ6
 UJy+7hh9wouI8rZ0S3NPQMrkjjZLC3oEudn+DvISEiN3gJMwj53YYFK22gDBPfcvrX/N
 9+Hg==
X-Gm-Message-State: AOAM533drPJdZgEayPvqc8I/TIjO/7kEfJZmj3P4dKGtP8tbtS7xnGoO
 Zf2FwXWuFw2vyx5rizo9mJ31GEm2jZU=
X-Google-Smtp-Source: ABdhPJyCpgBcU0+WxVM9bkjqRvn8G5/63yGIeBEJUhBN+Cyy2WezTmRk88zeVFSeTq3kSjQtmjUj1w==
X-Received: by 2002:a17:90b:3b82:: with SMTP id
 pc2mr4519084pjb.234.1642939251814; 
 Sun, 23 Jan 2022 04:00:51 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id kx11sm9608213pjb.1.2022.01.23.04.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 04:00:51 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] KVM: PPC: Book3S: Make LPID/nested LPID allocations
 dynamic
Date: Sun, 23 Jan 2022 22:00:37 +1000
Message-Id: <20220123120043.3586018-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With LPID width plumbed through from firmware, LPID allocations can now
be dynamic, which requires changing the fixed sized bitmap. Rather than
just dynamically sizing it, switch to IDA allocator.

Nested KVM stays with a fixed 12-bit LPID width for now, but it is also
moved to a more dynamic allocator. In future if nested LPID width is
advertised to a guest it will be simple to take advantage of it.

Thanks,
Nick

Nicholas Piggin (6):
  KVM: PPC: Remove kvmppc_claim_lpid
  KVM: PPC: Book3S HV: Update LPID allocator init for POWER9, Nested
  KVM: PPC: Book3S HV: Use IDA allocator for LPID allocator
  KVM: PPC: Book3S HV Nested: Change nested guest lookup to use idr
  KVM: PPC: Book3S Nested: Use explicit 4096 LPID maximum
  KVM: PPC: Book3S HV: Remove KVMPPC_NR_LPIDS

 arch/powerpc/include/asm/kvm_book3s_asm.h |   3 -
 arch/powerpc/include/asm/kvm_host.h       |  10 +-
 arch/powerpc/include/asm/kvm_ppc.h        |   1 -
 arch/powerpc/include/asm/reg.h            |   2 -
 arch/powerpc/kvm/book3s_64_mmu_hv.c       |  34 +++---
 arch/powerpc/kvm/book3s_hv_nested.c       | 134 +++++++++++-----------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   |   8 ++
 arch/powerpc/kvm/e500mc.c                 |   1 -
 arch/powerpc/kvm/powerpc.c                |  30 +++--
 arch/powerpc/mm/init_64.c                 |   3 +
 10 files changed, 121 insertions(+), 105 deletions(-)

-- 
2.23.0

