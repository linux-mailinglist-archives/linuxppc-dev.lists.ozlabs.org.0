Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A098EB369
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 16:08:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473pcc2QmszF5Zv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 02:08:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="F+szpagc"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473nmy3FHvzF5nS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 01:30:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572532249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3uHvg33rwPlPRCxf/m+cOILLBTWaeVOjTL8FLK1Jdwk=;
 b=F+szpagciOV6mnbZeY4VJ1+BCxaSRYcn8UQNqDSV/MXO74zOtxDfrbOXgPCVdaeXUMQthc
 dpuBUiSsG0we33bdCkGAsh1WWrrJYwuSKgKxkYwis5UleOqtV0uOThOAhv2DuN7ZHfPnba
 w8NxNq/UjZzgvddRVcCkHwffqwDVhQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-un3msZ7TMHuVJlrekTsnvA-1; Thu, 31 Oct 2019 10:30:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C844C8017E0;
 Thu, 31 Oct 2019 14:30:38 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC3125D6D6;
 Thu, 31 Oct 2019 14:30:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/12] powerpc/pseries: CMM: Simulation mode
Date: Thu, 31 Oct 2019 15:29:31 +0100
Message-Id: <20191031142933.10779-11-david@redhat.com>
In-Reply-To: <20191031142933.10779-1-david@redhat.com>
References: <20191031142933.10779-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: un3msZ7TMHuVJlrekTsnvA-1
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
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Richard Fontana <rfontana@redhat.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Arun KS <arunks@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's allow to test the implementation without needing HW support. When
"simulate=3D1" is specified when loading the module, we bypass all HW
checks and HW calls. The sysfs file "simulate_loan_target_kb" can be
used to simulate HW requests.

The simualtion mode can be activated using
=09modprobe cmm debug=3D1 simulate=3D1
And the requested loan target can be changed using
=09echo X > /sys/devices/system/cmm/cmm0/simulate_loan_target_kb

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Richard Fontana <rfontana@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arun KS <arunks@codeaurora.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 38 ++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/=
pseries/cmm.c
index a6ec2bbb1f91..63bb576b05da 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -51,6 +51,8 @@ static unsigned int oom_kb =3D CMM_OOM_KB;
 static unsigned int cmm_debug =3D CMM_DEBUG;
 static unsigned int cmm_disabled =3D CMM_DISABLE;
 static unsigned long min_mem_mb =3D CMM_MIN_MEM_MB;
+static bool __read_mostly simulate;
+static unsigned long simulate_loan_target_kb;
 static struct device cmm_dev;
=20
 MODULE_AUTHOR("Brian King <brking@linux.vnet.ibm.com>");
@@ -74,6 +76,8 @@ MODULE_PARM_DESC(min_mem_mb, "Minimum amount of memory (i=
n MB) to not balloon. "
 module_param_named(debug, cmm_debug, uint, 0644);
 MODULE_PARM_DESC(debug, "Enable module debugging logging. Set to 1 to enab=
le. "
 =09=09 "[Default=3D" __stringify(CMM_DEBUG) "]");
+module_param_named(simulate, simulate, bool, 0444);
+MODULE_PARM_DESC(simulate, "Enable simulation mode (no communication with =
hw).");
=20
 #define cmm_dbg(...) if (cmm_debug) { printk(KERN_INFO "cmm: "__VA_ARGS__)=
; }
=20
@@ -94,6 +98,9 @@ static long plpar_page_set_loaned(struct page *page)
 =09long rc =3D 0;
 =09int i;
=20
+=09if (unlikely(simulate))
+=09=09return 0;
+
 =09for (i =3D 0; !rc && i < PAGE_SIZE; i +=3D cmo_page_sz)
 =09=09rc =3D plpar_hcall_norets(H_PAGE_INIT, H_PAGE_SET_LOANED, vpa + i, 0=
);
=20
@@ -111,6 +118,9 @@ static long plpar_page_set_active(struct page *page)
 =09long rc =3D 0;
 =09int i;
=20
+=09if (unlikely(simulate))
+=09=09return 0;
+
 =09for (i =3D 0; !rc && i < PAGE_SIZE; i +=3D cmo_page_sz)
 =09=09rc =3D plpar_hcall_norets(H_PAGE_INIT, H_PAGE_SET_ACTIVE, vpa + i, 0=
);
=20
@@ -234,13 +244,17 @@ static void cmm_get_mpp(void)
 =09signed long active_pages_target, page_loan_request, target;
 =09signed long min_mem_pages =3D (min_mem_mb * 1024 * 1024) / PAGE_SIZE;
=20
-=09rc =3D h_get_mpp(&mpp_data);
-
-=09if (rc !=3D H_SUCCESS)
-=09=09return;
-
-=09page_loan_request =3D div_s64((s64)mpp_data.loan_request, PAGE_SIZE);
-=09target =3D page_loan_request + __loaned_pages;
+=09if (likely(!simulate)) {
+=09=09rc =3D h_get_mpp(&mpp_data);
+=09=09if (rc !=3D H_SUCCESS)
+=09=09=09return;
+=09=09page_loan_request =3D div_s64((s64)mpp_data.loan_request,
+=09=09=09=09=09    PAGE_SIZE);
+=09=09target =3D page_loan_request + __loaned_pages;
+=09} else {
+=09=09target =3D KB2PAGES(simulate_loan_target_kb);
+=09=09page_loan_request =3D target - __loaned_pages;
+=09}
=20
 =09if (target < 0 || total_pages < min_mem_pages)
 =09=09target =3D 0;
@@ -362,6 +376,9 @@ static struct device_attribute *cmm_attrs[] =3D {
 =09&dev_attr_oom_freed_kb,
 };
=20
+static DEVICE_ULONG_ATTR(simulate_loan_target_kb, 0644,
+=09=09=09 simulate_loan_target_kb);
+
 static struct bus_type cmm_subsys =3D {
 =09.name =3D "cmm",
 =09.dev_name =3D "cmm",
@@ -396,6 +413,11 @@ static int cmm_sysfs_register(struct device *dev)
 =09=09=09goto fail;
 =09}
=20
+=09if (!simulate)
+=09=09return 0;
+=09rc =3D device_create_file(dev, &dev_attr_simulate_loan_target_kb.attr);
+=09if (rc)
+=09=09goto fail;
 =09return 0;
=20
 fail:
@@ -589,7 +611,7 @@ static int cmm_init(void)
 {
 =09int rc;
=20
-=09if (!firmware_has_feature(FW_FEATURE_CMO))
+=09if (!firmware_has_feature(FW_FEATURE_CMO) && !simulate)
 =09=09return -EOPNOTSUPP;
=20
 =09rc =3D cmm_balloon_compaction_init();
--=20
2.21.0

