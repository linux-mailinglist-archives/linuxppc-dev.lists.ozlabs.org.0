Return-Path: <linuxppc-dev+bounces-5651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC8CA21229
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 20:24:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjFbl6XCmz30Ff;
	Wed, 29 Jan 2025 06:24:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.51 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738073010;
	cv=pass; b=h6xxEHq9nfidSr0YskbYuL/5kIyuBvrtCDoHQqdiUZ/6tgziwKa2CEjUyza/HJsxKK2x+xGpZmJ0w3NEtWduiQiWKK1ZJ3lW4XIL1HG2Hcw9M/fcBu72xTgr+0KMBn3XcthjM869guwpr7vJTJQ+XhTTh62lRfpyuxGJMXBt0ahiJrQjvNyebbbMq0iRARLjGaeXvE2rDBaiXccfndT+on0OOyDGUZ0zvcTpv9wczcWjNZsuvCQNfQZpnrDQ7QIGSvIV/kyi3tjJu6MW5VVEvpKSR0GFeZlo9mW+AkfgzILWxy+QUU8GpXf37J9EmzncKYO7zz+F7rrnB3cwBs57vg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738073010; c=relaxed/relaxed;
	bh=K8CbWCz4BeByGTYJffmsyyxE+TpEVpGoorpqL1lxDn8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OGNIeZi0JJfdO7TM3lCFql1uuuLrBJBoZBUi2WLRi8DnO1PbhNW8hw3z6Z7DfXhyVRvGCATWArD6pF/wZpyDCi0Zi3W1MzOdIJHuASSlDijBpTewb+OFR/FAvd2vhcv5Eg2lepA0B0SsvL62AWX2w2YliafnBaApEN29+SVNQ93oga37SwSyp7k8CJ4NP5gsigz4hmGKcMcVmy4EVv8+oNPJJVikfgqGF9ekZrjE4LCK5UmIIvcv/1WFenDRhKGZz5en687owufOjJzYOywCO9dkWjN9c6ChJlr2V2HZbqWRktAjdzxsEg4Z24rLSM5HhmCI2dcr2mwMu6VOOQuKeQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=outer-limits.org; dkim=pass (2048-bit key; unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AK1nVjqW; dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=3CmIJ/J4; dkim-atps=neutral; spf=pass (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=julian@outer-limits.org; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=outer-limits.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AK1nVjqW;
	dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=3CmIJ/J4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=julian@outer-limits.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 178 seconds by postgrey-1.37 at boromir; Wed, 29 Jan 2025 01:03:27 AEDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yj6Sv23dDz2xst
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 01:03:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1738072638; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tKy4umqoYrBY4Z96sZGrDS6Inivkl9rhNnGRbceUq+UtPwqxD1id/LKP0DkWhIVMgc
    vuYVdcPCwAGWLzmRi9qkGaHQOfVRdTVsJA39ZnJyGH5eqCtpzoO6DT6+u2NoJzj9sqUM
    Hhnidc7TUVVAqFxx756drSjmL2qOtfD0YBL8VPZu9BTAZs8f5BG+QB/O/Pimi3rODP2Y
    8cJ6+rLd5Z8vaHa70TUacgyt1ZWC5tqNM4cHETnfQP+WYsgLoW0UtRMxVRkaJX6BRrj+
    HakB2Bmz0CwK9UNDAapSTU152ou2U8aHD55lLwajKA4mN0rogpGaRjdGRbv/JDuMZthj
    A5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738072638;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=K8CbWCz4BeByGTYJffmsyyxE+TpEVpGoorpqL1lxDn8=;
    b=WCWMsWBzHJMh5p2IFVcQdQ4DzJaooDSJxIh2apaXtWGZBmFXVwz49PCAgx4xj7Tjtc
    07YTLvfyjDZHPq1dAuE6UpxacgEdrt8UHfRjsHtZncGk2QzR84C0o8NlYpxBovklZPgE
    6hL4vlcUBbXHJlzrQQBT3PxkMfQJlIYZLNEO4IyHjDTj5NAm9rxBwVB681Z3OrN4ics+
    EDVenIdvD3aVH9Rw8YK+Ekcmyhi5pL+nI7F409on0AYEzXhI+r9aO0wfMKrcNjnknjJp
    8MPx5QC9P13tOGgADZaEsFMLMXlkQQ3V+BYkx8rp6wLlVp3nnTNkyJERc3LzfDxwRtkp
    iWzA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738072638;
    s=strato-dkim-0002; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=K8CbWCz4BeByGTYJffmsyyxE+TpEVpGoorpqL1lxDn8=;
    b=AK1nVjqWO/x5xZAvHmvUWWvzRDsKp1OzHYr4EjptS5/1U8KtAd0ALohFtjyW2x9D11
    Gr01/OiRF8nTGGdYFr9s6/M2K4GqpZrMwp6H/9uUr0zTy/slpUFdR+s++aNIGzxIJYXV
    OFnEqRWqMhErs4k8ux5fWkJZ+2kAsZA04Bh04X8d0LRvbsElQGE433ixT2FaJvfRkSqN
    xNpEbFpBt/X1WCIUNAy8XM8H12bAvFIoz/f7c5ZTwB97R7BD9q4bwtBvI+CpmIbnnPXz
    vwv+CPhOu2xe/ahsb4SIRE9GA86VhRvYKqmCXTLY9w3ermrqqs5+At6HRVapC56ExOAn
    8LJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738072638;
    s=strato-dkim-0003; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=K8CbWCz4BeByGTYJffmsyyxE+TpEVpGoorpqL1lxDn8=;
    b=3CmIJ/J4dsksPpAMM6ajNfpt3yJG6mPMK9SLVEh2BhdfXVl1vqgq7v9ll5ilRJCT6T
    Th7jH2K/WzFmWu3jtiCw==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from ws2104.lan.kalrayinc.com
    by smtp.strato.de (RZmta 51.2.17 AUTH)
    with ESMTPSA id J1a25110SDvG4Cn
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 28 Jan 2025 14:57:16 +0100 (CET)
From: Julian Vetter <julian@outer-limits.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Julian Vetter <julian@outer-limits.org>
Subject: [PATCH] powerpc: Remove eieio in _memcpy_fromio
Date: Tue, 28 Jan 2025 14:57:11 +0100
Message-Id: <20250128135711.1625747-1-julian@outer-limits.org>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove the eieio() calls in _memcpy_fromio, to bring its implementation
closer to the one from lib/iomem_copy.c. These eieio() calls don't seem
to be necessary, because the _memcpy_toio completely omits them. Also
the legacy code from ppc was not doing them.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
 arch/powerpc/kernel/io.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/kernel/io.c b/arch/powerpc/kernel/io.c
index 6af535905984..81e5d54260a1 100644
--- a/arch/powerpc/kernel/io.c
+++ b/arch/powerpc/kernel/io.c
@@ -155,21 +155,18 @@ void _memcpy_fromio(void *dest, const volatile void __iomem *src,
 	__asm__ __volatile__ ("sync" : : : "memory");
 	while(n && (!IO_CHECK_ALIGN(vsrc, 4) || !IO_CHECK_ALIGN(dest, 4))) {
 		*((u8 *)dest) = *((volatile u8 *)vsrc);
-		eieio();
 		vsrc++;
 		dest++;
 		n--;
 	}
 	while(n >= 4) {
 		*((u32 *)dest) = *((volatile u32 *)vsrc);
-		eieio();
 		vsrc += 4;
 		dest += 4;
 		n -= 4;
 	}
 	while(n) {
 		*((u8 *)dest) = *((volatile u8 *)vsrc);
-		eieio();
 		vsrc++;
 		dest++;
 		n--;
-- 
2.34.1


