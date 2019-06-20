Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3D94C51C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 03:51:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TlCt3VqQzDqcW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 11:51:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X04L84mG"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tl7962NczDqrZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 11:47:17 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id t16so663810pfe.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=l3iU69UdUouImGD/C1rzkHrdhSDtisQup2hMO2eAkIQ=;
 b=X04L84mGDtOAPUYF9lvUCCJDr5J/yI5sqdvwmTUZiaJBHii63YGira00ZHhI/klAIP
 wYrj1EsaS0Pt+ceZMTSCddNIN946VfJl7c1Dobgnhj8y48oF+DgIZddEoDs3sCo46Fdd
 ZCFv5s1OeSU2OOriXBJGRqKX/kEiXRZv0Apf8Q6TOHPSd3sopqZ2ZR1o/jBxJmZ0ruRZ
 DvCAlvIz6CKsVoQ5V0uQtkTVCCjHLad59EaIHROKZ2E3Mj5kCH2of28q09Pr9ecziTtg
 FS2Ja7+OApeRBWpbAQYgXj6xLnvngVFA74AKrUv6oQQbIygtsWZJ8pTy2kefCAM/3QQQ
 OenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=l3iU69UdUouImGD/C1rzkHrdhSDtisQup2hMO2eAkIQ=;
 b=uEici2YqFJVf7QQtC0dDDh0aMf6Zks5LBBo3WzeTgEkaXMTPNqcLVDYIlVj9UDmRvf
 L/21mwGVfgOddigeQkc5xv1TKI/1kw7D/N/zO/raqx4ZuSxLJvvgW80qy4a8FFtXITDs
 tn+eag2CBfi+1XuPpnI0lKkPFMA/LtfSMxcsalG45zaQPrxWvtIMH46nXfOTIghfbrLD
 vymHh+5jHV3+PZPyk4R0IiTJ/JNo4EOAqttiu+Fivj4dgYdPYuFXJ7LRPkGsStTURRhQ
 9szYfx2oBGkgUc2DSI3ajh8YXQobBDhGvf5yMmjgCFCfIMSkMA0Hrtm9N9tiBWDaTW+k
 y+7g==
X-Gm-Message-State: APjAAAUZPklGjNpKpXt5hGmuSwQByFxWi3O5Xchnj0/WrzWIc8FpgTOt
 XT80IdhUOkk6iCtMXtlKnRc6RZnQ
X-Google-Smtp-Source: APXvYqxMJLWywIo3gBdN535Tn+IYUHBPX4rEbPXeczQStY5K2tm8qniTlv5Y4gN+h8bTWG691puyqQ==
X-Received: by 2002:a17:90a:3210:: with SMTP id
 k16mr268761pjb.13.1560995234135; 
 Wed, 19 Jun 2019 18:47:14 -0700 (PDT)
Received: from surajjs2.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 23sm20763528pfn.176.2019.06.19.18.47.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 18:47:13 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] KVM: PPC: Book3S HV: Invalidate ERAT when flushing guest
 TLB entries
Date: Thu, 20 Jun 2019 11:46:49 +1000
Message-Id: <20190620014651.7645-1-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.13.6
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
Cc: clg@kaod.org, kvm-ppc@vger.kernel.org, sjitindarsingh@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a guest vcpu moves from one physical thread to another it is
necessary for the host to perform a tlb flush on the previous core if
another vcpu from the same guest is going to run there. This is because the
guest may use the local form of the tlb invalidation instruction meaning
stale tlb entries would persist where it previously ran. This is handled
on guest entry in kvmppc_check_need_tlb_flush() which calls
flush_guest_tlb() to perform the tlb flush.

Previously the generic radix__local_flush_tlb_lpid_guest() function was
used, however the functionality was reimplemented in flush_guest_tlb()
to avoid the trace_tlbie() call as the flushing may be done in real
mode. The reimplementation in flush_guest_tlb() was missing an erat
invalidation after flushing the tlb.

This lead to observable memory corruption in the guest due to the
caching of stale translations. Fix this by adding the erat invalidation.

Fixes: 70ea13f6e609 "KVM: PPC: Book3S HV: Flush TLB on secondary radix threads"

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 6035d24f1d1d..a46286f73eec 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -833,6 +833,7 @@ static void flush_guest_tlb(struct kvm *kvm)
 		}
 	}
 	asm volatile("ptesync": : :"memory");
+	asm volatile(PPC_INVALIDATE_ERAT : : :"memory");
 }
 
 void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu,
-- 
2.13.6

