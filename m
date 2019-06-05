Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF36035B5A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 13:35:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jmtf1lVXzDqgb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 21:35:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X02Atdsy"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jmqv1MwhzDqZb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 21:32:59 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id s3so1905210wms.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fq/0HsgXoB1nRHLPZXI7UXo7HjgNA7LU3koFGqmSqD0=;
 b=X02Atdsy3C681HA7JnuQxaqDhg61yuUhbr8iS1xU6xK+Arr2PqhvIuh0WycWfVgIhp
 HmrNAkepa0D4UruAwoYD6EvA9JmlnIaXHR1XLpWZDu75Lcg3CwlqgBJejRxutBGv5XhP
 T1XbiftNpigtfyb3COuKo+NQanxEeWFTOzTJWw4NKIhVobdYpn1zApSPeXOFrURdVsh0
 e0fR05EKOF07GGAdl21KTimoDxpqElfFAHVGJIhczTCt5IcWUea4X1I7Gq5gqhxEtBcL
 MF/pU0i9YHCRNLhjg0gMeYyafrUg4yCSn75JEFT9olxNwTzhmrt/7Vwy/I9T5mhKgrL8
 L/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fq/0HsgXoB1nRHLPZXI7UXo7HjgNA7LU3koFGqmSqD0=;
 b=Tom0fIbav6l4BCvfkTd25ag8fXaigS9i77MTFYDMz4PbB6qxCcUD04wPDsq1FunB4H
 7zQQ5nhAde+Dj9WR76Nmyz6cusTtJsp4qxHq6E6IfV+svd//8s+OKuaMqzhM3OSspG2g
 /bN93IPN2FAa4nTwqrQ62OKtvSUtBOZSM6rPtOVRMjCK0Q5IP5IhQfY4Thaf/EH2Z88C
 NYndvO9cGPf/1Aq1jzSc3goaGcwahBBBfrzK6Y+moXNlqoA9JmESot2QW+mthxY0OSej
 sVnsLM96meSzyJ1N9JJ+cgjdBYndl+XFfPra8AnjNpz7kZUdfjb3h/c4yxb96BjbzVl1
 XTSg==
X-Gm-Message-State: APjAAAXORnCJYQXThu3XOEezS/DxItbcGIPwxdbycFB2oCvfLd24/ZZj
 jRMAauaNw9BiPPTG8WNVQhc=
X-Google-Smtp-Source: APXvYqzWt6QuVEa1032Ix8EW1hazJDm93XbWIDyaTHSiw9pvdPOjaH0uOtFp0SxILKZ2uRhwdIc8wA==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr21075203wmb.110.1559734373241; 
 Wed, 05 Jun 2019 04:32:53 -0700 (PDT)
Received: from macbookpro.malat.net ([2a01:e34:ee1e:860:6f23:82e6:aa2d:bbd1])
 by smtp.gmail.com with ESMTPSA id
 b8sm15985257wrr.88.2019.06.05.04.32.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 04:32:52 -0700 (PDT)
Received: by macbookpro.malat.net (Postfix, from userid 1000)
 id 07434114590C; Wed,  5 Jun 2019 13:32:51 +0200 (CEST)
From: Mathieu Malaterre <malat@debian.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/32: Add .data..LASAN* sections explicitly
Date: Wed,  5 Jun 2019 13:32:49 +0200
Message-Id: <20190605113249.6393-1-malat@debian.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When both `CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y` and `CONFIG_KASAN=y`
are set, link step typically produce numberous warnings about orphan
section:

  powerpc-linux-gnu-ld: warning: orphan section `.data..LASAN0' from `net/core/filter.o' being placed in section `.data..LASAN0'
  powerpc-linux-gnu-ld: warning: orphan section `.data..LASANLOC1' from `net/core/filter.o' being placed in section `.data..LASANLOC1'

This commit remove those warnings produced at W=1.

Reported-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/powerpc/kernel/vmlinux.lds.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 060a1acd7c6d..c74f4cb6ec3a 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -307,6 +307,9 @@ SECTIONS
 #ifdef CONFIG_PPC32
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {
 		DATA_DATA
+#ifdef CONFIG_KASAN
+		*(.data..LASAN*)
+#endif
 #ifdef CONFIG_UBSAN
 		*(.data..Lubsan_data*)
 		*(.data..Lubsan_type*)
-- 
2.20.1

