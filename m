Return-Path: <linuxppc-dev+bounces-3241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E09579CD64D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 05:55:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqPpb39mMz2yPD;
	Fri, 15 Nov 2024 15:55:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731646519;
	cv=none; b=Pjbhrojxr+DkFtUQZaOUgTEuT7bWTvNjy+c/N/b0c+PKkckrhsk+csrujOVqknpWhoE5M6iCSHAV6ilW9f9UF14ChxN126M80WKayo8eWVGWMz3d1Wh6rYT9drDNiwkRmzQtgrVhk/jgZoaR1bZmFx9Ge6huKkTO2Xkps/Swgmt+rkTpf05O82J/OoXrRMrV0/DiZP3tFbZwtKYWs9kyKPwMkgtjr+T0bBP0OuxEODGmpdWehs3MH2Pvs8OEbHRW1kmEPCBe4uLc9t4wbU1WNy/B2eE1i2vTbTyIEL3al5ErKSY9YDvDdtjeqzoQ3w+vsowvXxOvA7doYyl0GWL/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731646519; c=relaxed/relaxed;
	bh=jNeH3olMvMs99YRfKyFmeKO96xEzBxTGQzyamLYOqus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EM3NwgIA8cCjIJEWd15WDkj1ilJakaPKXSW8FxGHMYzZVPHvjvew+DrMf/GW/Ob0qwTAxk5s9+xPHiF7g54Hs38y4Q5CU+W4oX0IAuwPgFbHXp5F3YeHUgt2S0K8QiLmHxmLeKw5JrR5hNpgNhmjn/r0A83BdEvgZB+v2BED1o76okAGGKkEmKkqvl4WcqKJ0Uw/m8UrWiFLQ8ePVrT/OpQn5E6Ak/jJuPurpZypNE8dL2tKm503Xz7eRw3tVCHQj3OaBbjzf1gSLbdvB1675Sl8J04yq7A6drX06PM24P+ZKuX4SUy3YK4NP1PmKvb4vLaeC4DbIhkJdtx1otymaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lj98q6Ar; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lj98q6Ar;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqPpY1Q83z2yMP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 15:55:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731646509;
	bh=jNeH3olMvMs99YRfKyFmeKO96xEzBxTGQzyamLYOqus=;
	h=From:To:Cc:Subject:Date:From;
	b=lj98q6ArEZ167H8D6GkLpfQmMeAEpWeiKuGLepuHNEmAyddxxmnXbANKCPFCoqGt5
	 hcoHqKfZWuqeYb/FZBGTUACpOnWS2RrYGPvqOgBpVHhH0duWRbI1J6ZwpfZhG03rd9
	 ipGxIUxs311sJZ1mQPfAj0V3AH+D/n/G5I+krXnEw97JXJm3dpXRKxFU0q3qaE6arX
	 IwIE5pLy9qUPhlHu5rDCK+ASw1Bnt/K42ir1BcoeK+Cvq6VPJoMuVk29S8/Zo/xbxh
	 vyQSQg9SAN9MKX3U9uyeJ8SplgTopOFabys+XHf0hqW5NgXV9aY9FkSZ1JZ4lg62GJ
	 tLoYSblRib7lw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XqPpN386Dz4wcD;
	Fri, 15 Nov 2024 15:55:08 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <maddy@linux.ibm.com>,
	<christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>,
	<npiggin@gmail.com>
Subject: [PATCH] MAINTAINERS: powerpc: Mark Maddy as "M"
Date: Fri, 15 Nov 2024 15:54:42 +1100
Message-ID: <20241115045442.675721-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Mark Maddy as a co-maintainer, so that he can get a kernel.org account
and help manage the powerpc tree on kernel.org.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21fdaa19229a..4fdb9759f37d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13071,7 +13071,7 @@ M:	Michael Ellerman <mpe@ellerman.id.au>
 R:	Nicholas Piggin <npiggin@gmail.com>
 R:	Christophe Leroy <christophe.leroy@csgroup.eu>
 R:	Naveen N Rao <naveen@kernel.org>
-R:	Madhavan Srinivasan <maddy@linux.ibm.com>
+M:	Madhavan Srinivasan <maddy@linux.ibm.com>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
 W:	https://github.com/linuxppc/wiki/wiki
-- 
2.47.0


