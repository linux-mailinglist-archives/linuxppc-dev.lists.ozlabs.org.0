Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6311BD4B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:36:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bpgs5kYVzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:36:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GO6Ij8cf; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BpSM6h20zDr2c
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:26:27 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id 7so2000393pjo.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qLGXGJfB1Kxz4TW1ENW4rnKz/McMbvO4oi+kq2PYQxQ=;
 b=GO6Ij8cf4Ye7/IVzKwvwOi0UtRUSnEE3Pr7ubQwwQjzYdCqj4RVM9vZr/nnZ3imOes
 vCBhP3QBE8TQ5nSN0pLFrBtLtW8DLjTen0qYqgmmhF1sLCrQdZqLD09zb1fdqbI5UBVJ
 fRhSGMnz3qRG0/NVfppJNJ7rWAaATfBbBw4d5dzT0MNJlwA5lIorOFkWftYRCbel65hC
 Ng8usWqfCxysAxilIEpRVi+Vlhhhju2GNj3u+UFKvC2Xc7R5/GSMknOke/Jqiczsu3iZ
 2GflPaaiA8STxl9VKdo59ufrmfvHoidURZTIRng5OIrG/7ZkCNgiAg+vbSph5ub8ZtiU
 4LXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qLGXGJfB1Kxz4TW1ENW4rnKz/McMbvO4oi+kq2PYQxQ=;
 b=Ezh5MekqS0trz0WExulrSKtvU1Uowr/XZLvLLR/U1lJK0ArmVxOr0dq1H6YDWs499X
 hcl4DOGj3TNhD8/T1uBzDKt8BJfmdhlFdLy/JUlWU3fPQfBvNFILmY/x+ecoy1u4S3em
 Tm4KRMwgN1M5AAQBTbouz7GnZMrQb8h3w/8wAG+fTKYeuEZFo026J2+LjIK9SZ9V7iAd
 QONLC69uPF9ch54DTv6yD3uR0Sh0cdxD0/IAEg+uf+GeA+ivVZHPfmOJch+SBoEXlYK7
 LGnvPAgIHoD/3PVwCfkUAXhl4BdrIaIeGkV0o68BqbbjmkGeIImfPCTFf0UTeHZVSMO5
 uayg==
X-Gm-Message-State: AGi0PuYE9UrS5w3jzQCodgNr0M4x3YhQpHYcL+z49VojKW+q5+9Wk6sk
 0HxRf8CONbRRIGLXscojrqRmwcmz
X-Google-Smtp-Source: APiQypKxW4RiNIRa66rIJ31gHqkzPC7KsOUS8S9cnQOYU/Pkfqsm1vahphR+baQ2yoZmOvjW1WcSDQ==
X-Received: by 2002:a17:902:6114:: with SMTP id
 t20mr21162500plj.324.1588141585002; 
 Tue, 28 Apr 2020 23:26:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id s76sm164373pgc.85.2020.04.28.23.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:26:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] rpc/64/kuap: restore AMR in system reset exception
Date: Wed, 29 Apr 2020 16:26:04 +1000
Message-Id: <20200429062607.1675792-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429062607.1675792-1-npiggin@gmail.com>
References: <20200429062607.1675792-1-npiggin@gmail.com>
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

system reset interrupt handler locks AMR and exits with
PTION_RESTORE_REGS without restoring AMR. Similarly to the soft-NMI
ler, it needs to restore.

ed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 728ccb0f560c..b0ad930cbae5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -971,6 +971,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
+	kuap_restore_amr r10
 	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
 
-- 
2.23.0

