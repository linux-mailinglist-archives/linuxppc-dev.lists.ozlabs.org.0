Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5567F4130F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 11:50:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDGrr2HS2z2xtf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 19:50:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=sk2.org
 (client-ip=188.165.48.182; helo=7.mo2.mail-out.ovh.net;
 envelope-from=steve@sk2.org; receiver=<UNKNOWN>)
X-Greylist: delayed 12004 seconds by postgrey-1.36 at boromir;
 Tue, 21 Sep 2021 19:50:23 AEST
Received: from 7.mo2.mail-out.ovh.net (7.mo2.mail-out.ovh.net [188.165.48.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDGrH1xRvz2xtf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 19:50:20 +1000 (AEST)
Received: from player774.ha.ovh.net (unknown [10.110.171.227])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id D1878219C67
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 08:12:27 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id 0922A226BB72E;
 Tue, 21 Sep 2021 06:12:10 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0016908d250-99cb-4482-a321-0c67d65b58e6,
 AD8BB38DA772752445877EBF36A4BA27E0A99954) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>
Subject: [PATCH] mm: Remove HARDENED_USERCOPY_FALLBACK
Date: Tue, 21 Sep 2021 08:11:49 +0200
Message-Id: <20210921061149.1091163-1-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8631993114208077446
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeifedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepgeevtdekjeekudevudevfeekgfehgeekgfetudfhjedtkeeltdffgeefvdefhfetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Stephen Kitt <steve@sk2.org>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This has served its purpose and is no longer used. All usercopy
violations appear to have been handled by now, any remaining
instances (or new bugs) will cause copies to be rejected.

This isn't a direct revert of commit 2d891fbc3bb6 ("usercopy: Allow
strict enforcement of whitelists"); since usercopy_fallback is
effectively 0, the fallback handling is removed too.

This also removes the usercopy_fallback module parameter on
slab_common.

Link: https://github.com/KSPP/linux/issues/153
Signed-off-by: Stephen Kitt <steve@sk2.org>
Suggested-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/configs/skiroot_defconfig |  1 -
 include/linux/slab.h                   |  2 --
 mm/slab.c                              | 13 -------------
 mm/slab_common.c                       |  8 --------
 mm/slub.c                              | 14 --------------
 security/Kconfig                       | 14 --------------
 6 files changed, 52 deletions(-)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index b806a5d3a695..c3ba614c973d 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -275,7 +275,6 @@ CONFIG_NLS_UTF8=y
 CONFIG_ENCRYPTED_KEYS=y
 CONFIG_SECURITY=y
 CONFIG_HARDENED_USERCOPY=y
-# CONFIG_HARDENED_USERCOPY_FALLBACK is not set
 CONFIG_HARDENED_USERCOPY_PAGESPAN=y
 CONFIG_FORTIFY_SOURCE=y
 CONFIG_SECURITY_LOCKDOWN_LSM=y
diff --git a/include/linux/slab.h b/include/linux/slab.h
index 0c97d788762c..5b21515afae0 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -142,8 +142,6 @@ struct mem_cgroup;
 void __init kmem_cache_init(void);
 bool slab_is_available(void);
 
-extern bool usercopy_fallback;
-
 struct kmem_cache *kmem_cache_create(const char *name, unsigned int size,
 			unsigned int align, slab_flags_t flags,
 			void (*ctor)(void *));
diff --git a/mm/slab.c b/mm/slab.c
index d0f725637663..4d826394ffcb 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -4207,19 +4207,6 @@ void __check_heap_object(const void *ptr, unsigned long n, struct page *page,
 	    n <= cachep->useroffset - offset + cachep->usersize)
 		return;
 
-	/*
-	 * If the copy is still within the allocated object, produce
-	 * a warning instead of rejecting the copy. This is intended
-	 * to be a temporary method to find any missing usercopy
-	 * whitelists.
-	 */
-	if (usercopy_fallback &&
-	    offset <= cachep->object_size &&
-	    n <= cachep->object_size - offset) {
-		usercopy_warn("SLAB object", cachep->name, to_user, offset, n);
-		return;
-	}
-
 	usercopy_abort("SLAB object", cachep->name, to_user, offset, n);
 }
 #endif /* CONFIG_HARDENED_USERCOPY */
diff --git a/mm/slab_common.c b/mm/slab_common.c
index a4a571428c51..925b00c1d4e8 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -37,14 +37,6 @@ LIST_HEAD(slab_caches);
 DEFINE_MUTEX(slab_mutex);
 struct kmem_cache *kmem_cache;
 
-#ifdef CONFIG_HARDENED_USERCOPY
-bool usercopy_fallback __ro_after_init =
-		IS_ENABLED(CONFIG_HARDENED_USERCOPY_FALLBACK);
-module_param(usercopy_fallback, bool, 0400);
-MODULE_PARM_DESC(usercopy_fallback,
-		"WARN instead of reject usercopy whitelist violations");
-#endif
-
 static LIST_HEAD(slab_caches_to_rcu_destroy);
 static void slab_caches_to_rcu_destroy_workfn(struct work_struct *work);
 static DECLARE_WORK(slab_caches_to_rcu_destroy_work,
diff --git a/mm/slub.c b/mm/slub.c
index 3f96e099817a..77f53e76a3c3 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4125,7 +4125,6 @@ void __check_heap_object(const void *ptr, unsigned long n, struct page *page,
 {
 	struct kmem_cache *s;
 	unsigned int offset;
-	size_t object_size;
 	bool is_kfence = is_kfence_address(ptr);
 
 	ptr = kasan_reset_tag(ptr);
@@ -4158,19 +4157,6 @@ void __check_heap_object(const void *ptr, unsigned long n, struct page *page,
 	    n <= s->useroffset - offset + s->usersize)
 		return;
 
-	/*
-	 * If the copy is still within the allocated object, produce
-	 * a warning instead of rejecting the copy. This is intended
-	 * to be a temporary method to find any missing usercopy
-	 * whitelists.
-	 */
-	object_size = slab_ksize(s);
-	if (usercopy_fallback &&
-	    offset <= object_size && n <= object_size - offset) {
-		usercopy_warn("SLUB object", s->name, to_user, offset, n);
-		return;
-	}
-
 	usercopy_abort("SLUB object", s->name, to_user, offset, n);
 }
 #endif /* CONFIG_HARDENED_USERCOPY */
diff --git a/security/Kconfig b/security/Kconfig
index 0ced7fd33e4d..d9698900c9b7 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -163,20 +163,6 @@ config HARDENED_USERCOPY
 	  or are part of the kernel text. This kills entire classes
 	  of heap overflow exploits and similar kernel memory exposures.
 
-config HARDENED_USERCOPY_FALLBACK
-	bool "Allow usercopy whitelist violations to fallback to object size"
-	depends on HARDENED_USERCOPY
-	default y
-	help
-	  This is a temporary option that allows missing usercopy whitelists
-	  to be discovered via a WARN() to the kernel log, instead of
-	  rejecting the copy, falling back to non-whitelisted hardened
-	  usercopy that checks the slab allocation size instead of the
-	  whitelist size. This option will be removed once it seems like
-	  all missing usercopy whitelists have been identified and fixed.
-	  Booting with "slab_common.usercopy_fallback=Y/N" can change
-	  this setting.
-
 config HARDENED_USERCOPY_PAGESPAN
 	bool "Refuse to copy allocations that span multiple pages"
 	depends on HARDENED_USERCOPY

base-commit: 368094df48e680fa51cedb68537408cfa64b788e
-- 
2.30.2

