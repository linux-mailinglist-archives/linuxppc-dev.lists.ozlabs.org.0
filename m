Return-Path: <linuxppc-dev+bounces-1975-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 852BF998C12
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 17:45:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPYwr0ZX2z2yXm;
	Fri, 11 Oct 2024 02:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728575100;
	cv=none; b=kGta2VvximPdOUlVoKXjiFvxoqq5qUC4ZKIEcA9TCnoaBZlaJmXxWvVnZ4Uyt15MGs/OoOEcMfA+kb6YC8eNvxDid9dNaYCh9ZTGAQ+9G1frLivzIEiEMWpeekwaJ/XSlzZMRiXuMKAUBguRejcmfc2Uc87zJUo253r2Kg58HKdvr0si59qCpjVsDROr5JoRPI2WdI2dwUqayPJEa6gOp0ZP1CWMetiA/TBNN98qmBv1pFqNbqcObwWTtb02bivOuDqVrME4Ktk4H2jn3gYfbhLG6BZ5o/WQq++aaM6TfRb1QUWuL7BcadNKR/QslizgSdQB0+GUAQKSekdLsmyQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728575100; c=relaxed/relaxed;
	bh=Tbw860Y8cRi5xxA/qi1H6FVRcI5Ca4sRKMG/9Wo+Ih8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJWZkwBade7FWTph9hOXtI+r6AFOcx3zkh5Yf3uomLAyC1figbojekj6qDxUDO256MTWtHfk0DKi6N0cps6j9xF1LA7dOiZqZ9OntSBlVI3Q9VJGqLaITZ3P7jPNIshxK0hjpYZ3sgJEnPuSo4NAvp8QUq10Z4n571ICcZsm+CARa35n5mAd7QjdDQKA5h0CNxw75oti7HcS96z+8wwSU+HZXz/2oy9VUS4arUEs3aB9l+Zm8MSa7iIGvBm82C4jQmFbc3xHpWeDV+BjgXOeFZsv8SCahV1QWpV4R54tTObwiZ5t0QgBE/LUtceBdXlm5kVXxfpJKIOFt5y4Yer9cA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UJo35Z9S; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8B7wL2Et; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UJo35Z9S;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8B7wL2Et;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPYwp0ClLz2yfj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 02:44:57 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbw860Y8cRi5xxA/qi1H6FVRcI5Ca4sRKMG/9Wo+Ih8=;
	b=UJo35Z9SJbVvJPEtwXQTx640hZGNYd0yx369ZyIlfIt49f3c0x/SjL/N6mlKrtSjlg4mKm
	j/sqpAyhDBuAugTWJ8KWafd7X3EtfHEGBGQ6ptpv3Ls8pkj/g8+l9PlsANmS6SvFRkN97D
	Kon3OvbvB8U59sEuUrx8hhkTfCDfXvtQ5EixPaFMir23HXlcss3yflyAqw1HsFZ/Uwn4zB
	MT2EsHiPspQHHSAmEwOCTRHoE3fDziowLWBbuGwQT0zkhNYyBUe4V0FVlPnMXwtRrADaLX
	Mq6zst83FF1WS0p0ObFMXC0E+hEqbmyU/BYYxdVPrnBo+DSn/+03qzP+zKeZZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbw860Y8cRi5xxA/qi1H6FVRcI5Ca4sRKMG/9Wo+Ih8=;
	b=8B7wL2EthakSTpTkhWHWWbhqFPddFlgbdTyAxK8V1/rzHtm4Gdl+zZqr3iY43yE3KnKYV6
	XvBPZpKZ/PJfdTAw==
Date: Thu, 10 Oct 2024 17:44:44 +0200
Subject: [PATCH 1/9] vdso: Remove timekeeper argument of
 __arch_update_vsyscall()
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
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-1-7fe5a3ea4382@linutronix.de>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=2431;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=P9OFc8LoZinuHPdD6G8mUCCAPZekDQoc9eNGYe6RM5M=;
 b=rRX2lt1HBT3/u9x9JvlnflNmRDWsy5jscJ4NTC/lrOHnd2lofDJUSy4Brb/2qyoNuIuirmMpQ
 EQ5r/daGrFlB91mXesIGTiy54olcuu6phkOtEZCAbUlBJIlrxz2PwJG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

No implementation of this hook uses the passed in timekeeper anymore.

This avoids including a non-VDSO header while building the VDSO,
which can lead to compilation errors.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/vsyscall.h | 3 +--
 include/asm-generic/vdso/vsyscall.h    | 3 +--
 kernel/time/vsyscall.c                 | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/vsyscall.h b/arch/arm64/include/asm/vdso/vsyscall.h
index 5b6d0dd3cef5483ab8166a24ab3c7ca956927350..eea51946d45a2f8c7eebfff971d74878be53a798 100644
--- a/arch/arm64/include/asm/vdso/vsyscall.h
+++ b/arch/arm64/include/asm/vdso/vsyscall.h
@@ -6,7 +6,6 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/timekeeper_internal.h>
 #include <vdso/datapage.h>
 
 enum vvar_pages {
@@ -37,7 +36,7 @@ struct vdso_rng_data *__arm64_get_k_vdso_rnd_data(void)
 #define __arch_get_k_vdso_rng_data __arm64_get_k_vdso_rnd_data
 
 static __always_inline
-void __arm64_update_vsyscall(struct vdso_data *vdata, struct timekeeper *tk)
+void __arm64_update_vsyscall(struct vdso_data *vdata)
 {
 	vdata[CS_HRES_COARSE].mask	= VDSO_PRECISION_MASK;
 	vdata[CS_RAW].mask		= VDSO_PRECISION_MASK;
diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
index c835607f78ae990e7479878767b05cccd3a99837..01dafd604188fb0512d21c4ce4b027f7da54f5a0 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -12,8 +12,7 @@ static __always_inline struct vdso_data *__arch_get_k_vdso_data(void)
 #endif /* __arch_get_k_vdso_data */
 
 #ifndef __arch_update_vsyscall
-static __always_inline void __arch_update_vsyscall(struct vdso_data *vdata,
-						   struct timekeeper *tk)
+static __always_inline void __arch_update_vsyscall(struct vdso_data *vdata)
 {
 }
 #endif /* __arch_update_vsyscall */
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 9193d6133e5d688342be8485b9a0efb7af9ee148..28706a13c222df29635fd22d23f21eacb068855c 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -119,7 +119,7 @@ void update_vsyscall(struct timekeeper *tk)
 	if (clock_mode != VDSO_CLOCKMODE_NONE)
 		update_vdso_data(vdata, tk);
 
-	__arch_update_vsyscall(vdata, tk);
+	__arch_update_vsyscall(vdata);
 
 	vdso_write_end(vdata);
 

-- 
2.47.0


