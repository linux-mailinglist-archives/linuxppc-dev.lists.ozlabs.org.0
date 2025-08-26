Return-Path: <linuxppc-dev+bounces-11287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2310AB3542A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:19:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yCQ0knSz3dHp;
	Tue, 26 Aug 2025 16:18:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189105;
	cv=none; b=FZLC1CPGm6LBLUeHiKwWox+MPguqt3kOuUFVfyPxSaa5JjdMfcVYvLF2ZKJ6t/0MwhYaem6AXiaFSH42rw/6qkuOyJHGcrrq6qmS7gau2pNS6XZUro1c7FnQXViB984sRbb/e6W77UEdMThfVvy+FWmbR0v9Lhhbv2r1trwRCR407KyfVresQCAaE8ASHzkVQCKGcPNxBO+ID46aN3IEiQYDOAso3MGhFDOvd54PjTEaPHHgXislhCqpvHuU/YcjgwiEQ7goMAyTn0X1JwWOtKjOAkAjzV6Ul7dYJ115aiNXafai3Cp4H1jmFQAMsF0PalQK9uqCmtqrfRpfynJiOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189105; c=relaxed/relaxed;
	bh=RkAC4wHTvttqFMA6WXB8e/iq2KZu43nm9iAolOlePoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=az6GyB+dsRsLd0PdEoGGh9Sf4RbaGPDKXOkDgutP7Fl39KFANf1JYfnAYK7I62FpDgXm0VTcspP5BxKLY76h3wPk8yXI+/P0a5rDFXBtjVleb5B0ZqJC36qCQ8OQRm73RmgwvHv6UWwUbehnhGREn08Io/p9Qwdz9s5beFIPtfQFYJTBlQ/500xXg4T+3/a9KehPteSciAb/EFa96Q43IGy+7v+ZOm6a2r8yUHqc91FdVssTGI1358PGmQpNKpmc4XnCq/+fZD5qPtT666Hh2MUKMCURWjg7iTP3KS4QLhz58sEN0m4fgNz46y5TWXuNRK4JbQm1umBvuntS11oP7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ftFG8SBn; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q8mSoKdi; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ftFG8SBn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q8mSoKdi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c9yCN1NBqz3dHV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:18:23 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RkAC4wHTvttqFMA6WXB8e/iq2KZu43nm9iAolOlePoo=;
	b=ftFG8SBnHpOXRL9VAVhckxZYgwanzsVDNpjzugioUWi5H/xnB9LILcjisXIrzH2R+dazDg
	ZNjj2RdlNZx0OSz5vn6HERSvn8UwHlr7Q5cgeUXzSPD/sDRnQfG0ssQC5o9mys+jB6sDJk
	z4w6mODqzHiWZ8+UWGykNpJQh+5rXhZlF6+Sa6lPM1KttWeNNlu8lZXimTskuj80uPVBPS
	FopsXitSUPuUlbMt1Gw/VB/4vy9bj93+g1D7QgcBGF4K5Rs8Zjy0QPAnw0UCOBX5dxoxbz
	Afa6WIqDtpB2KnfHuFb7U8fOJqpiVBknxb225gAJVwnWK2Be0r1onSEP5TwAsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RkAC4wHTvttqFMA6WXB8e/iq2KZu43nm9iAolOlePoo=;
	b=Q8mSoKdiRiKW506l9WVulESL+9134C7qwVPD/h56gDK4cLn2hQDvtAscD0+Y7vY2LhTQCC
	HHH6+qGbv0QACRBg==
Date: Tue, 26 Aug 2025 08:17:04 +0200
Subject: [PATCH 01/11] vdso/datastore: Gate time data behind
 CONFIG_GENERIC_GETTIMEOFDAY
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-vdso-cleanups-v1-1-d9b65750e49f@linutronix.de>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
In-Reply-To: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=1494;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Xwfsdm0ZK9C/lpd9jqhqOkaZcVVPlOC5pvjRYhkmXtE=;
 b=tlV3av9IKVXt0yWBFrF5Xv8jBNjjBxHO+JuqtOgaexNgBMaGIsCaUqqbuFYpe8hxCfE7QWU0D
 myFUv/1mGoXDr2ckk35aDR7U4NUTuoYXHLDHdqVI/Wbr6WCebWnlLLC
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When the generic vDSO does not provide time functions, as for example on
riscv32, then the time data store is not necessary.

Avoid allocating these time data pages when not used.

Fixes: df7fcbefa710 ("vdso: Add generic time data storage")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/datastore.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index 3693c6caf2c4d41a526613d5fb746cb3a981ea2e..a565c30c71a04ff4116c14f43f4450210eba99c5 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -11,14 +11,14 @@
 /*
  * The vDSO data page.
  */
-#ifdef CONFIG_HAVE_GENERIC_VDSO
+#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 static union {
 	struct vdso_time_data	data;
 	u8			page[PAGE_SIZE];
 } vdso_time_data_store __page_aligned_data;
 struct vdso_time_data *vdso_k_time_data = &vdso_time_data_store.data;
 static_assert(sizeof(vdso_time_data_store) == PAGE_SIZE);
-#endif /* CONFIG_HAVE_GENERIC_VDSO */
+#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
 
 #ifdef CONFIG_VDSO_GETRANDOM
 static union {
@@ -46,7 +46,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 
 	switch (vmf->pgoff) {
 	case VDSO_TIME_PAGE_OFFSET:
-		if (!IS_ENABLED(CONFIG_HAVE_GENERIC_VDSO))
+		if (!IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY))
 			return VM_FAULT_SIGBUS;
 		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
 		if (timens_page) {

-- 
2.50.1


