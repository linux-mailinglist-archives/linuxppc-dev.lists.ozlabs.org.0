Return-Path: <linuxppc-dev+bounces-1944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 692E3997E61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKn38Mqz3bx1;
	Thu, 10 Oct 2024 18:02:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543741;
	cv=none; b=jMkk9UcrkZZ0tGlm3ROAKYFutUYU2cHH9MtrdbnXXxleBDqlonEStFFmrXqTvzR14wEvqHehnRDzHuypzXgKNHjPe8e2G/5KEj4oKt+HplYPpb6kmUcvYam6RZWt9a8zfK49eyJEfA8kDU8gsbNIim3auAf5BByZg2ekv9cmiYSJxGJCgjxmOlStG4CLhBZapL9499NCG2yy20EUrDdW0ZYMHQwIJNXxz/cxiTIhur3/j3lYt3JNoM9+a6K/6/4iQ1nY2C4sFqDXn7uXqtKgHbfXPozH0PntB69KUMAi13KApv8MQJ4IeWFAImML6jprD+txHpZ/8hxK+IBo2TE5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543741; c=relaxed/relaxed;
	bh=LP0hk2FuVWMkIH2lJtKmZQH6c1LDdfDQst6rCNa4pzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhbKe8JG9ZRBCDXA+jn5UNmQL7xyKn0Rwy83MQ6WUWM+aBVgMv14r/h0q0tyMRq3j1QJFhwvK0/Wvh3hsDExIt7KzDIdGy3UokKZxHIopPAEQWKtse4Qt5JiL7Ypz31CY6/iWHTvkjRM9DMxeeQHEFex7v2oz25c3E99kcwldgUlIEoSIeEa++jxvkccTn0GcETdiuPduIT5JwjsIyXL6EEWDPKaxTVI9RRpvoFBWhuvyfSFFFE4Zj6bXzGc2sUClhkCLQd/qtFAJWRL8uu0YqQx3zFkjoNszmzI8iNCaaPOgwnjr0VLZZcQByJTIdZkD36t/bmXqzFQ+/D2lytT1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OsPDoj04; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uZQ0blBW; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OsPDoj04;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uZQ0blBW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKm5h1vz3bwd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:20 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LP0hk2FuVWMkIH2lJtKmZQH6c1LDdfDQst6rCNa4pzU=;
	b=OsPDoj04Z4RSZNlsLV888deerj4w+hB2Ln35SeNDjwL7sNeyYHjNN2Lzl8ME+keSBorRON
	3Ea/C8rmiBf/B3NDxRRsVjvO1fNDiWPmj8/UfvYa/uIPgo1B9ckMhEaDqb0OSqR83WCqZg
	BEq7UWOFJGyXZyiT/fI1tH8AoHR2Of18EGKoXEFM1Txke+ntHd7/AXNUQ8USw9wCkzzCYa
	9R2Uunlf/zn+dtWEUrwRK9APM7O5JwfbEkPx/OJJ5gY41VFWBKJdRt0qbRQkAWPbdnDp89
	AKrY9GEaMohgJe/N7gZmJBbs9zQwLcg/O+4AsDbUcDWgHbIN/pKUwGgfGKGWnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LP0hk2FuVWMkIH2lJtKmZQH6c1LDdfDQst6rCNa4pzU=;
	b=uZQ0blBW9HT2ulSu6F1O3z7gz72EApU+rDi5lIMk2OHLEbZEv1p3LQYxwNCByu6BpYIV2f
	k0UV01jPmr6yXIBQ==
Date: Thu, 10 Oct 2024 09:01:26 +0200
Subject: [PATCH 24/28] powerpc/pseries/lparcfg: Use num_possible_cpus() for
 potential processors
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-24-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1399;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xl8NslvwmgdUlYXKqMSBkSIGo+Q6/TRE4tpTp6tPB6g=;
 b=i8N6VHR2dbk5BpKAW6jdHV8EjNkjT4udcZOMDwp1LfatWcSVkcJxtoTEMbI/wewMKiZ4UKRoS
 eQdEKwsbAlmCVbvp6A79N8+6Eo28lxI4ZbMuDyNT+01NBDCPxLLJAX4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The systemcfg processorCount variable tracks currently online variables,
not possible ones, so the stored value is wrong.
The code preferably tries to use the ibm,lrdr-capacity field 4 which
"represents the maximum number of processors that the guest can have."
Switch from processorCount to the better matching num_possible_cpus().

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index acc640fccca17b54c42eca1a242b37ad4299f685..cc22924f159f50416130f2dcd8f9d0ba0dc0973f 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -29,7 +29,6 @@
 #include <asm/firmware.h>
 #include <asm/rtas.h>
 #include <asm/time.h>
-#include <asm/vdso_datapage.h>
 #include <asm/vio.h>
 #include <asm/mmu.h>
 #include <asm/machdep.h>
@@ -530,7 +529,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 		lrdrp = of_get_property(rtas_node, "ibm,lrdr-capacity", NULL);
 
 	if (lrdrp == NULL) {
-		partition_potential_processors = vdso_data->processorCount;
+		partition_potential_processors = num_possible_cpus();
 	} else {
 		partition_potential_processors = be32_to_cpup(lrdrp + 4);
 	}

-- 
2.47.0


