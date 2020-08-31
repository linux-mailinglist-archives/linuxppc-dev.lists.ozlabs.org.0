Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2BC25815F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 20:53:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgK8p52SpzDqRf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 04:53:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HtH0lp3X; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgK4T20gXzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 04:49:29 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id u3so7109065qkd.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 11:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gW/GAJk+DvNLvyuRynw+O+IEgqlrjmTs4zN1XyER6Kc=;
 b=HtH0lp3X0B/IS4VslB7oJRNKkUSwHZbrZzhCYTa72DLJK++qOMuVnZh6yqZ+utyxOq
 4OhDcdNjzjXKxN6Vm3TUFSVNgnUSbkWYLGK5QGDwWsEhj30Z3BNZJuUfLXsGRjcmeoyp
 iKd8kDTuPt1TEnq8CQq+Yj2sYCVwLNyGLFdmgwQ6tdeR9nwNa/RxzpSsKVO0laXQGbR4
 BCnRqlbMR4QqY8SZQ3ILTC78tBYf/OoXpUsGw/a1Br8QvNPAhizAGLn6x9MlBoZfm86X
 8JdaQOuhbRka/IMWaQlFWKsmR1bf92NRGHxvLjPt/U+WwNHrCLzcxT+xnhDip8aUw4LH
 wA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gW/GAJk+DvNLvyuRynw+O+IEgqlrjmTs4zN1XyER6Kc=;
 b=GK59Q6sqstUzacgLU2HKPKVz5ed2lG9UyrK/tnzbN+xNhtsAhsxb48Rz2svxVZSI00
 lCiD6C/QY/FSjPyaXoB3TAF2Z38C02rNgcg03+Fx7iYJlgHv2NmrLVyrre2v/Rq1oGDf
 pmMlTO6FZUbPmKGCqLay+nsfTZY4jRTYCL8/pbXQJX1l8o1OeTev1BIt5ns3yK9ab1Xb
 ge5Z11XvKAZbERkRdVvX1m8ay4Q9mIRqxB+no3wSz6EtXize716RDNbgtInYq5wVy9ij
 6Z0qQI1dzHp4ReVM3oe8oLjqzQhPGz+lQOwBvxPZMbAkzFX46lUQUfVEeqOlXf9efiPy
 XmYg==
X-Gm-Message-State: AOAM530OvAJHSBGbPMwAzL5FPiiGjusGX0SNlLgqSFMeGseXxy+t0kVY
 ZFHTkjpKc7atCSgNSZXKvFQ=
X-Google-Smtp-Source: ABdhPJyEZji/0NQ0lddMUAajB37hmn05TsE/kDQTtJhzrMavyxL5DTi9z+BFEEgG0MmkLnxlUC7Fog==
X-Received: by 2002:a37:b307:: with SMTP id c7mr2852539qkf.33.1598899766644;
 Mon, 31 Aug 2020 11:49:26 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id s17sm11779070qte.50.2020.08.31.11.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 11:49:26 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Nayna Jain <nayna@linux.ibm.com>, Eric Richter <erichte@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>, Matthew Wilcox <willy@infradead.org>
Subject: [RFC PATCH 1/2] dma-direction: Add DMA_DIR_COMPAT() macro to test
 direction compability
Date: Mon, 31 Aug 2020 15:48:58 -0300
Message-Id: <20200831184859.110660-2-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200831184859.110660-1-leobras.c@gmail.com>
References: <20200831184859.110660-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Given a existing mapping with 'current' direction, and a 'wanted'
direction for using that mapping, check if 'wanted' is satisfied by
'current'.

current			accepts
DMA_BIDIRECTIONAL	DMA_BIDIRECTIONAL, DMA_TO_DEVICE,
			DMA_FROM_DEVICE, DMA_NONE
DMA_TO_DEVICE		DMA_TO_DEVICE, DMA_NONE
DMA_FROM_DEVICE		DMA_FROM_DEVICE, DMA_NONE
DMA_NONE		DMA_NONE

This macro is useful for checking if a DMA mapping can be reused.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 include/linux/dma-direction.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/dma-direction.h b/include/linux/dma-direction.h
index 9c96e30e6a0b..caf3943a21f4 100644
--- a/include/linux/dma-direction.h
+++ b/include/linux/dma-direction.h
@@ -9,4 +9,7 @@ enum dma_data_direction {
 	DMA_NONE = 3,
 };
 
+/* Checks if wanted direction is satisfied by current mapping direction*/
+#define DMA_DIR_COMPAT(current, wanted)	(((current) & ~(wanted)) == 0)
+
 #endif
-- 
2.25.4

