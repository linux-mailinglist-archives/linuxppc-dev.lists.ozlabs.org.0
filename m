Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3B023B21B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 03:09:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLGqp0vJGzDqWR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 11:09:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AWz9F0s4; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLGVr1zJ4zDqSy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 10:54:44 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id k18so12038261pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 17:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gCggWDJmmZiEpdFvZXOJd9pzebHi529tEcDc58/8THU=;
 b=AWz9F0s4q5b82e5zUy0cwTglCaiDhE4g/Ceooy98m0ZclFUvDXYQCvs/Nb8o1GG62w
 lr5CJUKzD4YPf6hSSwrrXB25gY+cq7vCEAG5j10e4jj4zyx/f9s40+1aG8wdblJSgE+F
 2afRywYdn5UtVjY7EkLfqF2BebPjvcz5PYX2jJXnhewsHuK3nvE5Oy87DQIpihufkGxI
 5GeQXk/ja2P2ahZGJkj/S24z8x5VAbbwvDSWg5TkmRNqx7wbR5jrL9snZ+4yCrKuvy6N
 DrS1Ji0h6emMeQalwc5Dh/2WvX3N+SXxv1IGmirkiC/PMI9DGIkP2AeYeQxyHiXFHJYP
 iAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gCggWDJmmZiEpdFvZXOJd9pzebHi529tEcDc58/8THU=;
 b=Z0ZPKCGVN0N7cvRAUCNPVDFqiNoBEBtdHCT39NOuwqpqdYkEiIu9xBICLlOlk6Lhju
 1E9EcWT40uagB5lB7CylBiBnVg0XJCTijmOKOs1+p5KUoVeWNr1g0rZlZa/bK191g8of
 Q/xHxWPg6ef5AKFvhIsEmRs6spcYwXAm+KsWlVnoMvjOzme1o5NvMoOFjI4mSIJBvlYf
 FCRHaT8mkdaTzBpiiS9PbHcqsInDavFfk43oP6YTkGZiNRqme5O4zy2qpQHy0dTotuwF
 7zGpgTU7aS9rDsGiOnbH1gR3PwqpBq86AC3sHjjkXk/CndCx7VoGt2McegWSqtU6/qlc
 3jiA==
X-Gm-Message-State: AOAM532WBiMWUrtogXf38a1jzRyaE6knHXm1jLiPDl/ci9FfrB3XIW34
 ZF8HaZgr626NZEyyK9T+9PCJ0/IW
X-Google-Smtp-Source: ABdhPJwcTzkRdxk9an8DTqnAXdlz+PO9ZC0r9AhK7jco6szcmSX+9/gH+cRfP1AWziFUJgGTJy8bZw==
X-Received: by 2002:a62:ee03:: with SMTP id e3mr17099194pfi.10.1596502481885; 
 Mon, 03 Aug 2020 17:54:41 -0700 (PDT)
Received: from localhost.ibm.com ([120.17.110.210])
 by smtp.gmail.com with ESMTPSA id 80sm10381327pfy.147.2020.08.03.17.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 17:54:41 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/nx: Don't pack struct coprocessor_request_block
Date: Tue,  4 Aug 2020 10:54:10 +1000
Message-Id: <20200804005410.146094-7-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804005410.146094-1-oohall@gmail.com>
References: <20200804005410.146094-1-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 Haren Myneni <haren@linux.vnet.ibm.com>, Dan Streetman <ddstreet@ieee.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building with W=1 results in the following warning:

In file included from arch/powerpc/platforms/powernv/vas-fault.c:16:
./arch/powerpc/include/asm/icswx.h:159:1: error: alignment 1 of ‘struct
	coprocessor_request_block’ is less than 16 [-Werror=packed-not-aligned]
  159 | } __packed;
      | ^
./arch/powerpc/include/asm/icswx.h:159:1: error: alignment 1 of ‘struct
	coprocessor_request_block’ is less than 16 [-Werror=packed-not-aligned]
./arch/powerpc/include/asm/icswx.h:159:1: error: alignment 1 of ‘struct
	coprocessor_request_block’ is less than 16 [-Werror=packed-not-aligned]
./arch/powerpc/include/asm/icswx.h:159:1: error: alignment 1 of ‘struct
	coprocessor_request_block’ is less than 16 [-Werror=packed-not-aligned]
cc1: all warnings being treated as errors

This happens because coprocessor_request_block includes several
sub-structures with an alignment specified using the __aligned(XX)
attribute. The problem comes from coprocessor_request_block having the
__packed attribute. Packing the structure causes the preferred alignment of
the nested structures to be ignored and we get the warnings as a result.

This isn't a problem in practice since the struct is defined with explicit
padding in the form of reserved fields, but we'd like to get rid of the
spurious warnings. The simplest solution is to remove the packed attribute
and use a BUILD_BUG_ON() to ensure the struct is the correct (expected by
HW) size compile time.

Also add a __aligned(128) to the request block structure since Book4 for P8
suggests the HW requires it to be aligned to a 128 byte boundary. There's a
similar requirement for P9 since the COPY and PASTE instructions used to
invoke VAS/NX accelerators operates on a cache line boundary.

Cc: Dan Streetman <ddstreet@ieee.org>
Cc: Haren Myneni <haren@linux.vnet.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/icswx.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/icswx.h b/arch/powerpc/include/asm/icswx.h
index b0c70a35fd0e..f6599ccb3012 100644
--- a/arch/powerpc/include/asm/icswx.h
+++ b/arch/powerpc/include/asm/icswx.h
@@ -156,8 +156,7 @@ struct coprocessor_request_block {
 	u8 reserved[32];
 
 	struct coprocessor_status_block csb;
-} __packed;
-
+} __aligned(128);
 
 /* RFC02167 Initiate Coprocessor Instructions document
  * Chapter 8.2.1.1.1 RS
@@ -188,6 +187,9 @@ static inline int icswx(__be32 ccw, struct coprocessor_request_block *crb)
 	__be64 ccw_reg = ccw;
 	u32 cr;
 
+	/* NB: the same structures are used by VAS-NX */
+	BUILD_BUG_ON(sizeof(*crb) != 128);
+
 	__asm__ __volatile__(
 	PPC_ICSWX(%1,0,%2) "\n"
 	"mfcr %0\n"
-- 
2.26.2

