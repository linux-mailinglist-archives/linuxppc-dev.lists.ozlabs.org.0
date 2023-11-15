Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 871737EC32D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 14:01:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3PY4trJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3PY4trJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVjwR2CXsz3dJ0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 00:01:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3PY4trJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3PY4trJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVjvY197Gz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 00:00:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700053237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MsmoLDm3Vg05W8pfD2SPdYXQ50SnWlB0SUHodkqBzuQ=;
	b=Q3PY4trJXywaZqiurR8JUqdn1l87WYZ4+FXY4+N/shP3k1E/txXt8unU3LWfNuxxljNIGr
	ruXs6exAMFRIIZ8T21kkgSL0pJPFe4ppMmc2qjn7MRHCU8hpFFvA/44yFbaiQPOO81WFCI
	nMZVymfWFyMhWau75NovMbh+1AfyzYw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700053237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MsmoLDm3Vg05W8pfD2SPdYXQ50SnWlB0SUHodkqBzuQ=;
	b=Q3PY4trJXywaZqiurR8JUqdn1l87WYZ4+FXY4+N/shP3k1E/txXt8unU3LWfNuxxljNIGr
	ruXs6exAMFRIIZ8T21kkgSL0pJPFe4ppMmc2qjn7MRHCU8hpFFvA/44yFbaiQPOO81WFCI
	nMZVymfWFyMhWau75NovMbh+1AfyzYw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-1eLEqSY3OeWVW86v4Tny6A-1; Wed, 15 Nov 2023 08:00:32 -0500
X-MC-Unique: 1eLEqSY3OeWVW86v4Tny6A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3AC4810FC1;
	Wed, 15 Nov 2023 13:00:31 +0000 (UTC)
Received: from localhost (unknown [10.72.112.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA6FF492BFD;
	Wed, 15 Nov 2023 13:00:30 +0000 (UTC)
Date: Wed, 15 Nov 2023 21:00:27 +0800
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] resource: add walk_system_ram_res_rev()
Message-ID: <ZVTA6z/06cLnWKUz@MiWiFi-R3L-srv>
References: <20231114091658.228030-1-bhe@redhat.com>
 <20231114091658.228030-2-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114091658.228030-2-bhe@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
Cc: linux-s390@vger.kernel.org, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, takahiro.akashi@linaro.org, ebiederm@xmission.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This function, being a variant of walk_system_ram_res() introduced in
commit 8c86e70acead ("resource: provide new functions to walk through
resources"), walks through a list of all the resources of System RAM
in reversed order, i.e., from higher to lower.

It will be used in kexec_file code to load kernel, initrd etc when
preparing kexec reboot.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Baoquan He <bhe@redhat.com>
---
v1->v2:
- Use kvrealloc() to reallocate memory instead of kvcalloc(), this
  simplifies code. Suggested by Andrew.

 include/linux/ioport.h |  3 +++
 kernel/resource.c      | 57 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 14f5cfabbbc8..db7fe25f3370 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -331,6 +331,9 @@ extern int
 walk_system_ram_res(u64 start, u64 end, void *arg,
 		    int (*func)(struct resource *, void *));
 extern int
+walk_system_ram_res_rev(u64 start, u64 end, void *arg,
+			int (*func)(struct resource *, void *));
+extern int
 walk_iomem_res_desc(unsigned long desc, unsigned long flags, u64 start, u64 end,
 		    void *arg, int (*func)(struct resource *, void *));
 
diff --git a/kernel/resource.c b/kernel/resource.c
index 866ef3663a0b..e8a244300e5b 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -27,6 +27,8 @@
 #include <linux/mount.h>
 #include <linux/resource_ext.h>
 #include <uapi/linux/magic.h>
+#include <linux/string.h>
+#include <linux/vmalloc.h>
 #include <asm/io.h>
 
 
@@ -429,6 +431,61 @@ int walk_system_ram_res(u64 start, u64 end, void *arg,
 				     func);
 }
 
+/*
+ * This function, being a variant of walk_system_ram_res(), calls the @func
+ * callback against all memory ranges of type System RAM which are marked as
+ * IORESOURCE_SYSTEM_RAM and IORESOUCE_BUSY in reversed order, i.e., from
+ * higher to lower.
+ */
+int walk_system_ram_res_rev(u64 start, u64 end, void *arg,
+				int (*func)(struct resource *, void *))
+{
+	struct resource res, *rams;
+	int rams_size = 16, i;
+	unsigned long flags;
+	int ret = -1;
+
+	/* create a list */
+	rams = kvcalloc(rams_size, sizeof(struct resource), GFP_KERNEL);
+	if (!rams)
+		return ret;
+
+	flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+	i = 0;
+	while ((start < end) &&
+		(!find_next_iomem_res(start, end, flags, IORES_DESC_NONE, &res))) {
+		if (i >= rams_size) {
+			/* re-alloc */
+			struct resource *rams_new;
+
+			rams_new = kvrealloc(rams, rams_size * sizeof(struct resource),
+					     (rams_size + 16) * sizeof(struct resource),
+					     GFP_KERNEL);
+			if (!rams_new)
+				goto out;
+
+			rams = rams_new;
+			rams_size += 16;
+		}
+
+		rams[i].start = res.start;
+		rams[i++].end = res.end;
+
+		start = res.end + 1;
+	}
+
+	/* go reverse */
+	for (i--; i >= 0; i--) {
+		ret = (*func)(&rams[i], arg);
+		if (ret)
+			break;
+	}
+
+out:
+	kvfree(rams);
+	return ret;
+}
+
 /*
  * This function calls the @func callback against all memory ranges, which
  * are ranges marked as IORESOURCE_MEM and IORESOUCE_BUSY.
-- 
2.41.0

