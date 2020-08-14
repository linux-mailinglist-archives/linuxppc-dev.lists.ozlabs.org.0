Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEBA244F3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 22:38:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSwHt2wyczDqly
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Aug 2020 06:38:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DlqXSHIe; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSwCY0qYWzDqlJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Aug 2020 06:34:33 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id b79so9517194qkg.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 13:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0tCwyvW5oJi3+fd8DkB+q50b0Tjqm7/wtCrAYO6TtQ=;
 b=DlqXSHIeNUn+k+y4GUv2n90i1iXNw31C5SM2vjI6LGehWCgQiIpFIMCAhT+54FRH6D
 W8uIjLZcOOyWeOhBzbeeYr2dzsuo6fJ5jvQrnRuK/pk5NMfdt/xierGvqYjz66JU+YQP
 uwQqOjnAjSNUX5yoiIFBpJWlaEVvo/4yOlmSukAQxJ5XKL1HPIK7G73em4u1QyGmnjDF
 0LDIDneRMlScmwPgmRilB2RjY2oKDHFA6uIgrA30ENFEYDUVHBJ8Tacsj99nL6zg6vBH
 k0KPrNtJTDwGf4toW7pGvzJCwWluW7yfkvtQf6H+NtQ2MLi+Q+Eb3ViGRkLWzdEBEvsj
 e6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0tCwyvW5oJi3+fd8DkB+q50b0Tjqm7/wtCrAYO6TtQ=;
 b=mJIl2syAmXFd8dNsvWUcQUb4b7LLnt6g2aSCXCIgCQDo9IkRlCNBQdff/Aye5LZ6W1
 8iB4xFGAt0jUtLqtWZULpgxXWyyQbtiNPNC7ixacd9MZveYbV9ybIsvVfOI3wHFlQUs/
 xmvmu2K9O2igBNcAWiKl1YqysgdWLEvzNfafbqRJOzb7lCNERT3ROCj4cqwKUtns2AlY
 vdAzvjcfK4my0+SNu4yCh5VI6Y8VbW4tfc8R9RMm4kLvNWYOo4hqqc8x1HFC0+DBd2tV
 Fobpr9N9Wqk3j/1dEHJLkllD2nzbvgDG6gK5dp+fn9VkQgVHCIrb8nuuaugSrJ8pUkRC
 Cstw==
X-Gm-Message-State: AOAM533fdb/nBXuXpsVrMv7VSJFXtRBWb6FeHHIwxHBdS6XyMllk5RLJ
 FYFYyZycAxQm7qJF6oqVoHbDVI8oMai+oQ==
X-Google-Smtp-Source: ABdhPJy46M6SC0fls9ltsZTuCwxudGTYzc/di5Hq/KcqkiAbIvtqRXhlNY2+Ppk/07rebJWGEHHaFg==
X-Received: by 2002:ae9:e882:: with SMTP id a124mr3500933qkg.24.1597437270046; 
 Fri, 14 Aug 2020 13:34:30 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:303f:d1dc:35d8:e9f6:c8b])
 by smtp.gmail.com with ESMTPSA id l29sm11395121qtu.88.2020.08.14.13.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 13:34:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] powerpc/numa: do not skip node 0 when init lookup table
Date: Fri, 14 Aug 2020 17:34:13 -0300
Message-Id: <20200814203413.542050-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814203413.542050-1-danielhb413@gmail.com>
References: <20200814203413.542050-1-danielhb413@gmail.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

associativity_to_nid() is skipping node 0 when initializing
the distance lookup table. This has no practical effect when
the associativity of node 0 is always zero, which seems to
be case for a long time. As such, this line got introduced in
commit 41eab6f88f24 from 2010 and never revisited.

However, QEMU is making an effort to allow user input to configure
NUMA topologies, and this behavior got exposed when testing
that work. With the existing code, this is what happens with a
4 node NUMA guest with distance = 80 to each other:

$ numactl -H
(...)
node distances:
node   0   1   2   3
  0:  10  160  160  160
  1:  160  10  80  80
  2:  160  80  10  80
  3:  160  80  80  10

With this patch, this is the result:

$ numactl -H
(...)
node distances:
node   0   1   2   3
  0:  10  80  80  80
  1:  80  10  80  80
  2:  80  80  10  80
  3:  80  80  80  10

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/mm/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 1f61fa2148b5..c11aabad1090 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -239,7 +239,7 @@ static int associativity_to_nid(const __be32 *associativity)
 	if (nid == 0xffff || nid >= nr_node_ids)
 		nid = NUMA_NO_NODE;
 
-	if (nid > 0 &&
+	if (nid >= 0 &&
 		of_read_number(associativity, 1) >= distance_ref_points_depth) {
 		/*
 		 * Skip the length field and send start of associativity array
-- 
2.26.2

