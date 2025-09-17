Return-Path: <linuxppc-dev+bounces-12329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 665D2B7FB5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:04:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSQ2mbSz3dJZ;
	Thu, 18 Sep 2025 00:02:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117734;
	cv=none; b=LbPKu89/Xh5XJnHDD/2yKLHjQzIaG2IAuA/RuYPvJcZ5UwfHUD15Fr/11lm5f6kNh2kd98mizmwtA70GMf60xoc36pNUzbYnk3po8epvclfLayM5f06zgV4/dAQcz+Ot9gOaINDN536PLzysCWDryxVFMmTqH3C+oXXuF+2mF5aHV4onl4AwiEv4JRdBcBWMX/d49UNqkNL5Xb+rvbH3s8SgmTxvtJxPNZxd5wtUt/rJN8tlfma8HEAfdH9+IzcbB4Zy1EirrLKpLh2GF05sRrUeR6gF6DtapvlGc2H9KxcC8aTR2w5USO/DlP0kZHp/j73CZzXKvu1gKhu9ZB+V5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117734; c=relaxed/relaxed;
	bh=VDshTHDdyOS+4oK6msGdvXtwIDG3+AYYE2weZr1dlWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFtlBUkgQYWw5PCbMy2CvK6l/pbre09SGEIbHkOrm7KRzvshAOPgHN1Si0sC26hcbr5kXyT7I4LD71VTaqNxre8hGB1Ofk3AopWXGolRy0wndHHH+SrZHT7V82/E9ZREN1vnQN7Ax3qGu9coTxuFWlzyWXxqr86QeFJ8J+lrx42RZvcjVZuM2RvG0GNrKr376zQ1j4P3jVk2UdPemdoPl5G3OZdyHN85M7DLCRLyffBQDP+aVWC2qYv3ZZdTiG52aQhvd5SGAmsS0y3ucYyv8of5DmoMPdMZ0pkqhtAOyQq6HeQ4HWFPv4H4N+Lwnx/v3PyTLwrgsrRDRhPCUsVWdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ez6n5UPp; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rwGdc1qs; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ez6n5UPp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rwGdc1qs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSP543Rz3dJ9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:13 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDshTHDdyOS+4oK6msGdvXtwIDG3+AYYE2weZr1dlWw=;
	b=ez6n5UPpSQ6ZNmJCDfByMelo2B56twKfod8kCsWJQ7H0Rg0ZW0/Ul0dS2w0TX1HFZvYyJM
	mEusXN/bf0OLci8Tv/czFl+DWKUDKkEiNSC3oI7sU9+X9C4qrR2RTy//iNi6xTAGeWhR+8
	N6HtEWYvlhpISUAf+PatIXLh47z14HottZvBLFYMLSlcUhulpHR9adRvn5VAMASBw6fC3J
	1jqyzvLJKD+NC5UDF/wKQb4Ft7QAkt+cUiiwUG2z9Oamo3QHUzJJMkbOU+1wCEYo3W4/6S
	4HdadsAXQrjt8cZPWE106Y3qZG9+ZxNyQoJ8u6ecTOpbRMpzjOyh6juy4dr3NQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDshTHDdyOS+4oK6msGdvXtwIDG3+AYYE2weZr1dlWw=;
	b=rwGdc1qsu5S5j65PJ7t2hIXwy/yfQ7c2e3ZkcHB66LdLp6bgVTNqEuT/ekKgkLImxxJ9a2
	y8SM6YWr76MjHxCQ==
Date: Wed, 17 Sep 2025 16:00:25 +0200
Subject: [PATCH v3 23/36] vdso/datastore: Map pages through struct page
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-23-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=3281;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=h36fVH5emtVkv73ZElXIXZ6NtrpKkOFLq+ychKgkihU=;
 b=1Q87PG88XCaYX4KGyp+D/lWyMrgzA9tTWURtmpJ3RbXmhrluuZY5yKr1xn7icSsFx1nd1JDK8
 Kfy4uo7mq3hB2beBjRr5EjdOngk6IDs5iYv4FiU/CAfCeAodj3ikfdB
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

An upcoming change will allocate the datapages dynamically instead of as
part of the kernel image. Such pages can only be mapped through
'struct page' and not through PFNs.

Prepare for the dynamic allocation by mapping through 'struct page'.

VM_MIXEDMAP is necessary for the call to vmf_insert_page() in the timens
prefault path to work.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/datastore.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index 7377fcb6e1dfe31d02ffcae371fdf9da069ae4c1..6e5feb4a95b85f5a1cbdced7cdeddc593fcbad40 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -39,14 +39,15 @@ struct vdso_arch_data *vdso_k_arch_data = &vdso_arch_data_store.data;
 static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf)
 {
-	struct page *timens_page = find_timens_vvar_page(vma);
-	unsigned long pfn;
+	struct page *page, *timens_page;
+
+	timens_page = find_timens_vvar_page(vma);
 
 	switch (vmf->pgoff) {
 	case VDSO_TIME_PAGE_OFFSET:
 		if (!IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY))
 			return VM_FAULT_SIGBUS;
-		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
+		page = virt_to_page(vdso_k_time_data);
 		if (timens_page) {
 			/*
 			 * Fault in VVAR page too, since it will be accessed
@@ -56,10 +57,10 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			vm_fault_t err;
 
 			addr = vmf->address + VDSO_TIMENS_PAGE_OFFSET * PAGE_SIZE;
-			err = vmf_insert_pfn(vma, addr, pfn);
+			err = vmf_insert_page(vma, addr, page);
 			if (unlikely(err & VM_FAULT_ERROR))
 				return err;
-			pfn = page_to_pfn(timens_page);
+			page = timens_page;
 		}
 		break;
 	case VDSO_TIMENS_PAGE_OFFSET:
@@ -72,24 +73,25 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 		 */
 		if (!IS_ENABLED(CONFIG_TIME_NS) || !timens_page)
 			return VM_FAULT_SIGBUS;
-		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
+		page = virt_to_page(vdso_k_time_data);
 		break;
 	case VDSO_RNG_PAGE_OFFSET:
 		if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
 			return VM_FAULT_SIGBUS;
-		pfn = __phys_to_pfn(__pa_symbol(vdso_k_rng_data));
+		page = virt_to_page(vdso_k_rng_data);
 		break;
 	case VDSO_ARCH_PAGES_START ... VDSO_ARCH_PAGES_END:
 		if (!IS_ENABLED(CONFIG_ARCH_HAS_VDSO_ARCH_DATA))
 			return VM_FAULT_SIGBUS;
-		pfn = __phys_to_pfn(__pa_symbol(vdso_k_arch_data)) +
-			vmf->pgoff - VDSO_ARCH_PAGES_START;
+		page = virt_to_page(vdso_k_arch_data) + vmf->pgoff - VDSO_ARCH_PAGES_START;
 		break;
 	default:
 		return VM_FAULT_SIGBUS;
 	}
 
-	return vmf_insert_pfn(vma, vmf->address, pfn);
+	get_page(page);
+	vmf->page = page;
+	return 0;
 }
 
 const struct vm_special_mapping vdso_vvar_mapping = {
@@ -101,7 +103,7 @@ struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned
 {
 	return _install_special_mapping(mm, addr, VDSO_NR_PAGES * PAGE_SIZE,
 					VM_READ | VM_MAYREAD | VM_IO | VM_DONTDUMP |
-					VM_PFNMAP | VM_SEALED_SYSMAP,
+					VM_MIXEDMAP | VM_SEALED_SYSMAP,
 					&vdso_vvar_mapping);
 }
 

-- 
2.51.0


