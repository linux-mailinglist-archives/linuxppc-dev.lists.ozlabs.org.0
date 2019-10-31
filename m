Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC34FEB34C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 15:59:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473pPN4RN2zF50r
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 01:59:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="R9JDC38g"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473nmW2vyrzF5nK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 01:30:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572532232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXgmR6g2tIZfYZi6fS/3SBKnBgtJVR9MnRCGBfCykuE=;
 b=R9JDC38gwH3RFw9VQa8rHhU5AWXxOGHgpS8o5NLs4kzay+9PdFGtyshvmFc/e0sjgw2F0r
 i1MYYXsTt8VId0+ks26qePofiOUz6fWzU5ln+sY4I7hFrF5/49QXwz7opVfPD9Gv2Je0D1
 JNMvFZvyc2o909UK0MZauJ5VjCG/Z5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-siY2niPOPGummLNb_s4kvg-1; Thu, 31 Oct 2019 10:30:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E829A107ACC2;
 Thu, 31 Oct 2019 14:30:26 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 818A55D6D8;
 Thu, 31 Oct 2019 14:30:22 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/12] powerpc/pseries: CMM: Implement balloon compaction
Date: Thu, 31 Oct 2019 15:29:29 +0100
Message-Id: <20191031142933.10779-9-david@redhat.com>
In-Reply-To: <20191031142933.10779-1-david@redhat.com>
References: <20191031142933.10779-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: siY2niPOPGummLNb_s4kvg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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
Cc: David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>,
 Greg Hackmann <ghackmann@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian Brauner <christian@brauner.io>, Gao Xiang <xiang@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arun KS <arunks@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Todd Kjos <tkjos@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We can now get rid of the cmm_lock and completely rely on the balloon
compaction internals, which now also manage the page list and the lock.

Inflated/"loaned" pages are now movable. Memory blocks that contain
such apges can get offlined. Also, all such pages will be marked
PageOffline() and can therefore be excluded in memory dumps using recent
versions of makedumpfile.

Don't switch to balloon_page_alloc() yet (due to the GFP_NOIO). Will
do that separately to discuss this change in detail.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Anshuman Khandual <khandual@linux.vnet.ibm.com>
Cc: "Oliver O'Halloran" <oohall@gmail.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Allison Randal <allison@lohutok.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Arun KS <arunks@codeaurora.org>
Cc: Todd Kjos <tkjos@google.com>
Cc: Christian Brauner <christian@brauner.io>
Cc: Gao Xiang <xiang@kernel.org>
Cc: Greg Hackmann <ghackmann@google.com>
Cc: David Howells <dhowells@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/Kconfig |   1 +
 arch/powerpc/platforms/pseries/cmm.c   | 132 ++++++++++++++++++++++---
 include/uapi/linux/magic.h             |   1 +
 3 files changed, 120 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platform=
s/pseries/Kconfig
index 9e35cddddf73..595e9f8a6539 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -108,6 +108,7 @@ config PPC_SMLPAR
 config CMM
 =09tristate "Collaborative memory management"
 =09depends on PPC_SMLPAR
+=09select MEMORY_BALLOON
 =09default y
 =09help
 =09  Select this option, if you want to enable the kernel interface
diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/=
pseries/cmm.c
index 3a55dd1fdd39..235fd7fe9df1 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -19,6 +19,10 @@
 #include <linux/stringify.h>
 #include <linux/swap.h>
 #include <linux/device.h>
+#include <linux/mount.h>
+#include <linux/pseudo_fs.h>
+#include <linux/magic.h>
+#include <linux/balloon_compaction.h>
 #include <asm/firmware.h>
 #include <asm/hvcall.h>
 #include <asm/mmu.h>
@@ -77,13 +81,11 @@ static atomic_long_t loaned_pages;
 static unsigned long loaned_pages_target;
 static unsigned long oom_freed_pages;
=20
-static LIST_HEAD(cmm_page_list);
-static DEFINE_SPINLOCK(cmm_lock);
-
 static DEFINE_MUTEX(hotplug_mutex);
 static int hotplug_occurred; /* protected by the hotplug mutex */
=20
 static struct task_struct *cmm_thread_ptr;
+static struct balloon_dev_info b_dev_info;
=20
 static long plpar_page_set_loaned(struct page *page)
 {
@@ -149,19 +151,16 @@ static long cmm_alloc_pages(long nr)
 =09=09=09=09  __GFP_NOMEMALLOC);
 =09=09if (!page)
 =09=09=09break;
-=09=09spin_lock(&cmm_lock);
 =09=09rc =3D plpar_page_set_loaned(page);
 =09=09if (rc) {
 =09=09=09pr_err("%s: Can not set page to loaned. rc=3D%ld\n", __func__, rc=
);
-=09=09=09spin_unlock(&cmm_lock);
 =09=09=09__free_page(page);
 =09=09=09break;
 =09=09}
=20
-=09=09list_add(&page->lru, &cmm_page_list);
+=09=09balloon_page_enqueue(&b_dev_info, page);
 =09=09atomic_long_inc(&loaned_pages);
 =09=09adjust_managed_page_count(page, -1);
-=09=09spin_unlock(&cmm_lock);
 =09=09nr--;
 =09}
=20
@@ -178,21 +177,19 @@ static long cmm_alloc_pages(long nr)
  **/
 static long cmm_free_pages(long nr)
 {
-=09struct page *page, *tmp;
+=09struct page *page;
=20
 =09cmm_dbg("Begin free of %ld pages.\n", nr);
-=09spin_lock(&cmm_lock);
-=09list_for_each_entry_safe(page, tmp, &cmm_page_list, lru) {
-=09=09if (!nr)
+=09while (nr) {
+=09=09page =3D balloon_page_dequeue(&b_dev_info);
+=09=09if (!page)
 =09=09=09break;
 =09=09plpar_page_set_active(page);
-=09=09list_del(&page->lru);
 =09=09adjust_managed_page_count(page, 1);
 =09=09__free_page(page);
 =09=09atomic_long_dec(&loaned_pages);
 =09=09nr--;
 =09}
-=09spin_unlock(&cmm_lock);
 =09cmm_dbg("End request with %ld pages unfulfilled\n", nr);
 =09return nr;
 }
@@ -484,6 +481,105 @@ static struct notifier_block cmm_mem_nb =3D {
 =09.priority =3D CMM_MEM_HOTPLUG_PRI
 };
=20
+#ifdef CONFIG_BALLOON_COMPACTION
+static struct vfsmount *balloon_mnt;
+
+static int cmm_init_fs_context(struct fs_context *fc)
+{
+=09return init_pseudo(fc, PPC_CMM_MAGIC) ? 0 : -ENOMEM;
+}
+
+static struct file_system_type balloon_fs =3D {
+=09.name =3D "ppc-cmm",
+=09.init_fs_context =3D cmm_init_fs_context,
+=09.kill_sb =3D kill_anon_super,
+};
+
+static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
+=09=09=09   struct page *newpage, struct page *page,
+=09=09=09   enum migrate_mode mode)
+{
+=09unsigned long flags;
+
+=09/*
+=09 * loan/"inflate" the newpage first.
+=09 *
+=09 * We might race against the cmm_thread who might discover after our
+=09 * loan request that another page is to be unloaned. However, once
+=09 * the cmm_thread runs again later, this error will automatically
+=09 * be corrected.
+=09 */
+=09if (plpar_page_set_loaned(newpage)) {
+=09=09/* Unlikely, but possible. Tell the caller not to retry now. */
+=09=09pr_err_ratelimited("%s: Cannot set page to loaned.", __func__);
+=09=09return -EBUSY;
+=09}
+
+=09/* balloon page list reference */
+=09get_page(newpage);
+
+=09spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+=09balloon_page_insert(b_dev_info, newpage);
+=09balloon_page_delete(page);
+=09spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+
+=09/*
+=09 * activate/"deflate" the old page. We ignore any errors just like the
+=09 * other callers.
+=09 */
+=09plpar_page_set_active(page);
+
+=09/* balloon page list reference */
+=09put_page(page);
+
+=09return MIGRATEPAGE_SUCCESS;
+}
+
+static int cmm_balloon_compaction_init(void)
+{
+=09int rc;
+
+=09balloon_devinfo_init(&b_dev_info);
+=09b_dev_info.migratepage =3D cmm_migratepage;
+
+=09balloon_mnt =3D kern_mount(&balloon_fs);
+=09if (IS_ERR(balloon_mnt)) {
+=09=09rc =3D PTR_ERR(balloon_mnt);
+=09=09balloon_mnt =3D NULL;
+=09=09return rc;
+=09}
+
+=09b_dev_info.inode =3D alloc_anon_inode(balloon_mnt->mnt_sb);
+=09if (IS_ERR(b_dev_info.inode)) {
+=09=09rc =3D PTR_ERR(b_dev_info.inode);
+=09=09b_dev_info.inode =3D NULL;
+=09=09kern_unmount(balloon_mnt);
+=09=09balloon_mnt =3D NULL;
+=09=09return rc;
+=09}
+
+=09b_dev_info.inode->i_mapping->a_ops =3D &balloon_aops;
+=09return 0;
+}
+static void cmm_balloon_compaction_deinit(void)
+{
+=09if (b_dev_info.inode)
+=09=09iput(b_dev_info.inode);
+=09b_dev_info.inode =3D NULL;
+=09kern_unmount(balloon_mnt);
+=09balloon_mnt =3D NULL;
+}
+#else /* CONFIG_BALLOON_COMPACTION */
+static int cmm_balloon_compaction_init(void)
+{
+=09return 0;
+}
+
+static void cmm_balloon_compaction_deinit(void)
+{
+}
+#endif /* CONFIG_BALLOON_COMPACTION */
+
 /**
  * cmm_init - Module initialization
  *
@@ -497,9 +593,14 @@ static int cmm_init(void)
 =09if (!firmware_has_feature(FW_FEATURE_CMO))
 =09=09return -EOPNOTSUPP;
=20
-=09if ((rc =3D register_oom_notifier(&cmm_oom_nb)) < 0)
+=09rc =3D cmm_balloon_compaction_init();
+=09if (rc)
 =09=09return rc;
=20
+=09rc =3D register_oom_notifier(&cmm_oom_nb);
+=09if (rc < 0)
+=09=09goto out_balloon_compaction;
+
 =09if ((rc =3D register_reboot_notifier(&cmm_reboot_nb)))
 =09=09goto out_oom_notifier;
=20
@@ -527,6 +628,8 @@ static int cmm_init(void)
 =09unregister_reboot_notifier(&cmm_reboot_nb);
 out_oom_notifier:
 =09unregister_oom_notifier(&cmm_oom_nb);
+out_balloon_compaction:
+=09cmm_balloon_compaction_deinit();
 =09return rc;
 }
=20
@@ -545,6 +648,7 @@ static void cmm_exit(void)
 =09unregister_memory_notifier(&cmm_mem_nb);
 =09cmm_free_pages(atomic_long_read(&loaned_pages));
 =09cmm_unregister_sysfs(&cmm_dev);
+=09cmm_balloon_compaction_deinit();
 }
=20
 /**
diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
index 903cc2d2750b..3ac436376d79 100644
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@ -94,5 +94,6 @@
 #define ZSMALLOC_MAGIC=09=090x58295829
 #define DMA_BUF_MAGIC=09=090x444d4142=09/* "DMAB" */
 #define Z3FOLD_MAGIC=09=090x33
+#define PPC_CMM_MAGIC=09=090xc7571590
=20
 #endif /* __LINUX_MAGIC_H__ */
--=20
2.21.0

