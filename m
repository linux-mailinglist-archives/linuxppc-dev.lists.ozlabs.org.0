Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C20143D025
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:03:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NYDH1bLkzDqYn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:03:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p+GvA/EH"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZ53qdjzDqcF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:04 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id j2so7562587pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnKr7BDBmRsQRMGBTBUWFjslhckVJUguzYPCN/7SQhU=;
 b=p+GvA/EHvilOhRd74rAOIKAZ7UMlBXVLwoBr2ytrjrjzgxXn8VTxRws5bd5e8ReY6h
 +03jRugJcI/Vwa0bltB69Z7UcTd/3/lnG2s3T3cOJ9O9mLXUESd850lemtLAEmkkxeqm
 RCMoe5GiGjllQPSH+PMOywEWCUWD913BMYPDTv4Op2lx3VsKMCcqy3g2dMJV9eEX71JF
 WVWvkzLrJ279tEmNmv9Ul4AqjuNsneIXLu1uQ5XDxaLvskLRf2TqNEZvxKz9yWQfpx8d
 TpJTHkPy/0Fq2kiqn8riszhIo+JJ9wVZ81dxy3ib+aHegw2SW8LRwCWYerNOv6PL2nAu
 Jz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnKr7BDBmRsQRMGBTBUWFjslhckVJUguzYPCN/7SQhU=;
 b=MFjB7ZsccoKFPi/fYUTSeY4puBx7A7y1cgYpQ0YRU9+oyVAakgkHfmPkvC5fHJ3s0l
 bsXMgg21VlyewXMUuUIy6Olf7nK+SaUrhbq7prbpWlyQbhgUZFsHI2hPrg/jkxg22CaO
 sWWykY9k4/DX2HEwxe/2JtYHdfRWHg4KnbcW9xmRcaKOSGN27DwTn/lGHvpaxu/vTSIL
 waR9AxXE0ritGuB7/43mRR+g3B4ub7HDstMdeaWK5p79zFXID/+IESvKAS2wp1qhWpzN
 MtCziCurZ3baSQRltwaShyQbL/kZBQ4ySVZlzrZGYThAx7wrEqusmmc0tMwIx9s6YxkD
 7r9A==
X-Gm-Message-State: APjAAAWZpgVgqIZZHq8Ij+oFUl486tOuAl7XPuoj+trB4ektyL7Sx3DG
 LuEg4552fqWQ0Wg1M0+QSjxmjlko
X-Google-Smtp-Source: APXvYqwbHJNtXRtLO2r5DnlpmMWAY+zLJYbwTaJy9fVNo4GN9nMgKzoy3hCCfm2gnGb3zcDt9Hc2Yg==
X-Received: by 2002:a62:2506:: with SMTP id l6mr80237739pfl.250.1560263641855; 
 Tue, 11 Jun 2019 07:34:01 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.33.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/28] powerpc/64s/exception: KVM handler can set the HSRR
 trap bit
Date: Wed, 12 Jun 2019 00:30:21 +1000
Message-Id: <20190611143040.7834-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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

Move the KVM trap HSRR bit into the KVM handler, which can be
conditionally applied when hsrr parameter is set.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 5 +++++
 arch/powerpc/include/asm/head-64.h       | 7 ++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 737c37d1df4b..1d8fc085e845 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -449,7 +449,12 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	ld	r10,\area+EX_R10(r13)
 	std	r12,HSTATE_SCRATCH0(r13)
 	sldi	r12,r9,32
+	/* HSRR variants have the 0x2 bit added to their trap number */
+	.if \hsrr
+	ori	r12,r12,(\n + 0x2)
+	.else
 	ori	r12,r12,(\n)
+	.endif
 	/* This reloads r9 before branching to kvmppc_interrupt */
 	__BRANCH_TO_KVM_EXIT(\area, kvmppc_interrupt)
 
diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index 518d9758b41e..bdd67a26e959 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -393,16 +393,13 @@ end_##sname:
 	TRAMP_KVM_BEGIN(do_kvm_##n);					\
 	KVM_HANDLER area, EXC_STD, n, 1
 
-/*
- * HV variant exceptions get the 0x2 bit added to their trap number.
- */
 #define TRAMP_KVM_HV(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER area, EXC_HV, n + 0x2, 0
+	KVM_HANDLER area, EXC_HV, n, 0
 
 #define TRAMP_KVM_HV_SKIP(area, n)					\
 	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER area, EXC_HV, n + 0x2, 1
+	KVM_HANDLER area, EXC_HV, n, 1
 
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
-- 
2.20.1

