Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BBF3C9F35
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 15:15:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQZc16SCtz3bXF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 23:15:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Voha/AtE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Voha/AtE; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQZbR6LBxz2yWL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 23:14:41 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id d12so6227633pgd.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 06:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bRUBKr+pcQvTSq7JQJ+usk7fg5wenAu/IEJC6e2X31Y=;
 b=Voha/AtEN8cfpYgNnmoHS4zRmfLt/Ky0HJGjI0qXteIW4qBKxxex7m4/4NTRwOvQaf
 ziDv25763qa/m7unNtszzXVQbdl/DC63sKVWXbC4AtqZ2xusQXf/FRHnjkGjhj7eW6pb
 X9UiEH/ie7Ag6jBfF21MMyQgszoaA+FZX5WUWTty7JAqW7xUg5vT8LsTqYcTIzkzRaOe
 HNKSuZGHFkUy9Vl3A9iDOqCX7ElLnBlc4GwGmLF8LCPVJE2Hav99JVmLRkDO6BA4hxNx
 S/ZwAbHAV/XrQ4S8FPDmtEy5+uZhTl0/lih3H2/mpnwNqxHyqd/8LC2o4dop1tMrDTeH
 9wLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bRUBKr+pcQvTSq7JQJ+usk7fg5wenAu/IEJC6e2X31Y=;
 b=IVg5kPzjwzNTEcBdv/q0b60rPV9ADBX+peWR4cfQ5S20ml9Fv7ytXNSjeKLiI2mMb2
 7HSofoM6WizW9Tj1mxx2O9RQ6KcxDx/lVXHhiaRCNHo6wxektWk6GnXcaJwMakwTvki+
 nrna+N/oTzKmDqXgODe1lyjVLDG4miFKOqs0PZ9pnAhVYd4nwF+/k7tmQfMEbWWpxvv3
 Tb165MM3WnFb2lXAID2Ly6zq6zn4Yl0NSzT70w58ZlahcphUlnRUdvG+iodssX60mKCA
 7MRiV6oKw5/JwKUuK4/ZlopoFbMfm7qDxtd/nkk4uJ6r4v76ej3weZ/fTH7UZmVq85js
 OObQ==
X-Gm-Message-State: AOAM5331wEAj1FK6zGXWPiUHLn7/Gmvd+L4gMiu5XadS6MKjEAB+PmKU
 up2WtBfF3nsu8i3sRh859M0=
X-Google-Smtp-Source: ABdhPJzEUOyF67eFyKKF84MjZFlh7BZrh93X3lDArRwdckxRXBw4UQgZQXDedO7G19bVjn7Iedwr+g==
X-Received: by 2002:a63:4750:: with SMTP id w16mr4546776pgk.229.1626354878486; 
 Thu, 15 Jul 2021 06:14:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-33-83-114.tpgi.com.au. [27.33.83.114])
 by smtp.gmail.com with ESMTPSA id
 g18sm6357670pfi.199.2021.07.15.06.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 06:14:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 0/6] KVM: PPC: Book3S HV P9: Reduce guest entry/exit
Date: Thu, 15 Jul 2021 23:14:24 +1000
Message-Id: <20210715131424.146850-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This goes on top of the previous speedup series. The previous series is
mostly invovled with reducing the cost of SPR accesses. This one starts
to look beyond those, to atomics, barriers, and other logic that can be
reduced. After this series the P9 path uses very few things from the
vcore structure. This saves several hundred cycles for guest entry/exit
on a POWER9.

Thanks,
Nick

Nicholas Piggin (6):
  KVM: PPC: Book3S HV P9: Add unlikely annotation for !mmu_ready
  KVM: PPC: Book3S HV P9: Avoid cpu_in_guest atomics on entry and exit
  KVM: PPC: Book3S HV P9: Remove most of the vcore logic
  KVM: PPC: Book3S HV P9: Tidy kvmppc_create_dtl_entry
  KVM: PPC: Book3S HV P9: Stop using vc->dpdes
  KVM: PPC: Book3S HV P9: Remove subcore HMI handling

 arch/powerpc/include/asm/kvm_book3s_64.h |   1 -
 arch/powerpc/include/asm/kvm_host.h      |   1 -
 arch/powerpc/kvm/book3s_hv.c             | 250 +++++++++++++----------
 arch/powerpc/kvm/book3s_hv_builtin.c     |   2 +
 arch/powerpc/kvm/book3s_hv_hmi.c         |   7 +-
 arch/powerpc/kvm/book3s_hv_p9_entry.c    |  35 +++-
 arch/powerpc/kvm/book3s_hv_ras.c         |   4 +
 7 files changed, 185 insertions(+), 115 deletions(-)

-- 
2.23.0

