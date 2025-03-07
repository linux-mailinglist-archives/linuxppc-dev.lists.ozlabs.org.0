Return-Path: <linuxppc-dev+bounces-6796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E278A562B5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 09:40:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8KVZ5bTlz3cBZ;
	Fri,  7 Mar 2025 19:40:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ac"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741336822;
	cv=none; b=PhdCVopVUvw27wfChGBtx5UzDTNHosGn4ADpammmKro4Q/gf95IM5ufqbKFYx1O4+HslEDZJO8dkdt89IeJ9o1c1ezh2guqmU5wYJWCihg+6JKhxA5hCsvQPng7EKvljhxxhRE3DBtUpRddWyaiCe3szIJ/hRDP1Hnqx8VnrK6N88VuO/OYhbmSt0oQqWUAfPpCYh8UaM/g230Pzp47DAt9YVsswTc7eNU+MPpdcT9MeAh6kQj40xWgfDtjp/tI9iSQsm2yA9IgFi7o8oZ226PnXfTz1l+X6RyOEQu/Wzcj1H+99Pk62YoX3ZdSyfw+FUihyxh/J8qWVwg9OBXsmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741336822; c=relaxed/relaxed;
	bh=ot48F+Ve1vTrXZ61ljmBh73Pm4QJUyONFwUOGHruh9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/efbnFr2z/q1EXBRVdjMjT8SVpOTFnwOBqEeC5Jri7zc/mueJbJk/zrmkGga7+vCCLGNQG4qB9BDL+2Mpjl/GMfTDWAN4JuAcYvXZsrKCI/QzaZEBgSsC+ON0EZeudi+bFOy9cfMWKRCVDmUJKGxsdxyqi+YqiRH5NQ8jh1j3iD5wvWF5a+t5OI8qX22TevAhUmxFC5ZZpzF95YGjsTOEeS3+67P4f5Bq1PM82Bg8+5vFsxhdtWxOYIYooBkhVYU1A6XiRUJVKrW/ra0VrOEra39d4kJYORM83hg0Cipu3h7jMGNAzBeD9rYl4yPYTQkuJYjgd/b53J3D8+DLDw6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uz4wq5ym; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::ac; helo=out-172.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uz4wq5ym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ac; helo=out-172.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8KVV6sZGz30CN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 19:40:16 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741336795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ot48F+Ve1vTrXZ61ljmBh73Pm4QJUyONFwUOGHruh9o=;
	b=uz4wq5yml4bmviCBIVS+qNlIPWdX8G0qk2oBudCA+96zNxBWVX0jW+ZZi+gq6jM9mau98n
	0ZmPooVKJ+98CB4Ir9+/pi/nNi95nj+HS4vXbSqKUlS/hSDdRCoDn/T9S+I1jVnPei45vX
	ksY713N+KzlansYB20ZNEc4DAy7hs74=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com,
	thuth@redhat.com,
	alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	lvivier@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com
Subject: [kvm-unit-tests PATCH] Makefile: Use CFLAGS in cc-option
Date: Fri,  7 Mar 2025 09:39:53 +0100
Message-ID: <20250307083952.40999-2-andrew.jones@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

When cross compiling with clang we need to specify the target in
CFLAGS and cc-option will fail to recognize target-specific options
without it. Add CFLAGS to the CC invocation in cc-option.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 78352fced9d4..9dc5d2234e2a 100644
--- a/Makefile
+++ b/Makefile
@@ -21,7 +21,7 @@ DESTDIR := $(PREFIX)/share/kvm-unit-tests/
 
 # cc-option
 # Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
-cc-option = $(shell if $(CC) -Werror $(1) -S -o /dev/null -xc /dev/null \
+cc-option = $(shell if $(CC) $(CFLAGS) -Werror $(1) -S -o /dev/null -xc /dev/null \
               > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
 
 libcflat := lib/libcflat.a
-- 
2.48.1


