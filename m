Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 098A74CB675
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 06:34:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8KRt73qdz3c1G
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 16:34:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qoAv00jz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qoAv00jz; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8KQb0t5bz3bNs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 16:33:25 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 139so3611026pge.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 21:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6DVSjOcz/6+4vGfXcL8vRybiV6ZECEwV9gw+k3jtyU4=;
 b=qoAv00jzHOspw3/wxKODtZtNYsG+ASI2pi5mxDSmXcIbab2N/Ew7puVYitDwbtofsW
 AldeVSeNHpnOPShMjmAFS7Is6b/ohOuDnSxfZ+ZZVHOCRJWwlLmLuhd7z3DRXYb5/yJy
 /61CAxcAprtoSq8LEmZzRySqC/lhY6LB9yBRdIl/E0+o4oE5LQAiEw+Clx0O6C7Rdmls
 KF0IK9JyKhyJPmxnZfUnBW6YSRJT/CdkpikG/BoSK+8sfOwrYi/zhFxk1VLQS+Xlm8Wn
 BylmFIJ9x+sTnLh/V4/jbwQDbA4JeNKRGEZlBNr4Nhc1m7WIdhvp+LsTG8L48mw5f2o5
 PlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6DVSjOcz/6+4vGfXcL8vRybiV6ZECEwV9gw+k3jtyU4=;
 b=bHteCSwX3peTMg2Uih6Ax28IMeBNg1ktsIOSi65CKTeK7Y8dy3eFXhnqzDK3U6SGSj
 ebON5CUPw4//RRAvCJuXam4rqNms8ZjtmXJwDIWZC4Mk01v8Mw5XMq24/8rskn7G8L7k
 RRCpI/U1G4icXVewdo5H/P53EvtfH0nC3aRRF0YysgRopL69lxJZRK4bnP2QBSym13Eq
 FEF4aAnX+OEQylsu8aN0PF3Hz/6SKEvnrdY1wJ+1G9muUfVAVUdRI7d/UBgscPvFJuRQ
 g1FCkHzWOcu+Abte1Tur2TuqXUObA4nMofL99HzpEPWk3p40m0zSZAi9UCtYSWnb9FIQ
 03mQ==
X-Gm-Message-State: AOAM533idKhOWpQLRCf7R2gcUSY2YhJW9LOF7rEb1ScN7tZ+KrSpgg6E
 Gug5Mvu3q9uZ0ohNI4zkkAo659w5Yb95gw==
X-Google-Smtp-Source: ABdhPJxJnuBSCd8HBv8nAmTsTJmGQLYiLZssx/N0/WHN0znulINqaedXXyvv/H9+LIs8ld+XCVP7Jw==
X-Received: by 2002:a63:921a:0:b0:373:df77:ee5d with SMTP id
 o26-20020a63921a000000b00373df77ee5dmr28396089pgd.90.1646285601498; 
 Wed, 02 Mar 2022 21:33:21 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-90-129.tpgi.com.au.
 [193.116.90.129]) by smtp.gmail.com with ESMTPSA id
 t7-20020a17090a024700b001bf12386db4sm170300pje.47.2022.03.02.21.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 21:33:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] KVM: PPC: Book3S HV interrupt fixes
Date: Thu,  3 Mar 2022 15:33:09 +1000
Message-Id: <20220303053315.1056880-1-npiggin@gmail.com>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series fixes up a bunch of little interrupt issues which were found
by inspection haven't seem to have caused big problems but possibly
could or could cause the occasional latency spike from a temporarily lost
interrupt.

The big thing is the xive context change. Currently we run an L2 with
its L1's xive OS context pushed. I'm proposing that we instead treat
that as an escalation similar to cede.

Thanks,
Nick

Nicholas Piggin (6):
  KVM: PPC: Book3S HV P9: Fix "lost kick" race
  KVM: PPC: Book3S HV P9: Inject pending xive interrupts at guest entry
  KVM: PPC: Book3S HV P9: Move cede logic out of XIVE escalation
    rearming
  KVM: PPC: Book3S HV P9: Split !nested case out from guest entry
  KVM: PPC: Book3S HV Nested: L2 must not run with L1 xive context
  KVM: PPC: Book3S HV Nested: L2 LPCR should inherit L1 LPES setting

 arch/powerpc/include/asm/kvm_ppc.h  |  4 +-
 arch/powerpc/kvm/book3s_hv.c        | 97 ++++++++++++++++++++++++-----
 arch/powerpc/kvm/book3s_hv_nested.c |  3 +-
 arch/powerpc/kvm/book3s_xive.c      | 11 ++--
 4 files changed, 90 insertions(+), 25 deletions(-)

-- 
2.23.0

