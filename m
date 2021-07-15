Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B153C9F3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 15:15:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQZcm5vBvz3blD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 23:15:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tRvbZW90;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tRvbZW90; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQZcH5dQcz2yMD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 23:15:27 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id 21so5216811pfp.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bRUBKr+pcQvTSq7JQJ+usk7fg5wenAu/IEJC6e2X31Y=;
 b=tRvbZW90L/vB4s+bsXld1ARwLyxpo+jD4hsD1j2g7P5xN3PdNy5QS07jKnyULuAK//
 0D4Pn/r/Ljd6Ej2TCm5lhSQFpurpXIoNRJYVVXRw7iP6uoVPMMcypYix4GON1NMDTpVp
 WWj4HmnjX06s/CM45nc+uL8Y7OvgBiwsgSDkW/jyF0ZeuJu6WpT1BtiSEauh6Tm6LKHM
 F5gHE8aCEYFeQeHTApvXbq1Nke267SVp6K2q8cUmvP68bCSMygzGyV3dohgWp6DidEWw
 2lklO2RhLdv7/KSysj0QqxvWguxIRegnnpffrRVk/fCRGNik88sisDg2VUbfUwxt3YpT
 ZrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bRUBKr+pcQvTSq7JQJ+usk7fg5wenAu/IEJC6e2X31Y=;
 b=Kg6ekHZhXCAW3BM5lYHoghqNnhnVtSeJC0YF2odNcccIusscv3tdFANRxVQXe6PNjv
 S5HlQUBdWLSnJby6h9qG5EnQu3v7k/918Xve6B9K9mQyndE78lqrGjl44rl4FYn5B+3+
 M1HlxqzyBTMyiX9kQvLPNEmfnjhL4Jx4/MOb1PxXD/loAqiDuIduzc9sTeALN2fiMhOb
 WBL7twO60P6Aask1eF6txqXT1WjbOLJSWi/bg6cKlNGbmgNLyLI4EW/YrNIIwMQi1YvW
 deeokzXxspeUC8Ao+KW8n7gEgBLiD1xv7uQUwCD0UmgMrt039+qmOwm1jEoANettqVh8
 e8EA==
X-Gm-Message-State: AOAM531LoYiU1zikS7V6RYK0Ti9O4p50PxSauLOo5dhIvd0igk/2vYcL
 EtLYww7ziqVY6TXkGOLAB4Q=
X-Google-Smtp-Source: ABdhPJzZUSN9nK3A2xJ0js4cQ6ax2FRFwvS8cedldMlHU8p4M0ZPNKMxzRKyRznGgpSOpH6Cd/aZyA==
X-Received: by 2002:a62:442:0:b029:31d:2e52:f1c4 with SMTP id
 63-20020a6204420000b029031d2e52f1c4mr4732354pfe.14.1626354925098; 
 Thu, 15 Jul 2021 06:15:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-33-83-114.tpgi.com.au. [27.33.83.114])
 by smtp.gmail.com with ESMTPSA id
 k6sm4864216pju.8.2021.07.15.06.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 06:15:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 0/6] KVM: PPC: Book3S HV P9: Reduce guest entry/exit
Date: Thu, 15 Jul 2021 23:15:12 +1000
Message-Id: <20210715131518.146917-1-npiggin@gmail.com>
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

