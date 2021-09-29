Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC7B41C6EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 16:38:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKJrY6TJfz2yRS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 00:38:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oe1WGVC0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oe1WGVC0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Oe1WGVC0; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oe1WGVC0; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKJqW35gmz305j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 00:37:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632926228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNKyy7DaBqRqZV4jzziHHtYfT7+Eb7HK7caNxBbuDP4=;
 b=Oe1WGVC0aH3S5K7NhT0lyUwFXvAWZ7pBvOUFmGq2mmgF7CxzdV5xGQcv8hDMghada0GCUb
 oAgQjnkyv9Ti5YIKfD+dbmRcXpMCjYvlbJFXc/xjplYjH4bA1q9hohf4rDu0/F0ZaBFqlu
 XIwmhIIz923X9/WImA4r1LzWhA8I1X0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632926228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNKyy7DaBqRqZV4jzziHHtYfT7+Eb7HK7caNxBbuDP4=;
 b=Oe1WGVC0aH3S5K7NhT0lyUwFXvAWZ7pBvOUFmGq2mmgF7CxzdV5xGQcv8hDMghada0GCUb
 oAgQjnkyv9Ti5YIKfD+dbmRcXpMCjYvlbJFXc/xjplYjH4bA1q9hohf4rDu0/F0ZaBFqlu
 XIwmhIIz923X9/WImA4r1LzWhA8I1X0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-4nEqwsN3NmWJ6OxW4sg39Q-1; Wed, 29 Sep 2021 10:37:05 -0400
X-MC-Unique: 4nEqwsN3NmWJ6OxW4sg39Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7A2C8064A5;
 Wed, 29 Sep 2021 14:37:01 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8700810016F4;
 Wed, 29 Sep 2021 14:36:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/6] mm/memory_hotplug: remove CONFIG_X86_64_ACPI_NUMA
 dependency from CONFIG_MEMORY_HOTPLUG
Date: Wed, 29 Sep 2021 16:35:55 +0200
Message-Id: <20210929143600.49379-2-david@redhat.com>
In-Reply-To: <20210929143600.49379-1-david@redhat.com>
References: <20210929143600.49379-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Hildenbrand <david@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SPARSEMEM is the only possible memory model for x86-64, FLATMEM is not
possible:
	config ARCH_FLATMEM_ENABLE
		def_bool y
		depends on X86_32 && !NUMA

And X86_64_ACPI_NUMA (obviously) only supports x86-64:
	config X86_64_ACPI_NUMA
		def_bool y
		depends on X86_64 && NUMA && ACPI && PCI

Let's just remove the CONFIG_X86_64_ACPI_NUMA dependency, as it does no
longer make sense.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index d16ba9249bc5..b7fb3f0b485e 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -123,7 +123,7 @@ config ARCH_ENABLE_MEMORY_HOTPLUG
 config MEMORY_HOTPLUG
 	bool "Allow for memory hot-add"
 	select MEMORY_ISOLATION
-	depends on SPARSEMEM || X86_64_ACPI_NUMA
+	depends on SPARSEMEM
 	depends on ARCH_ENABLE_MEMORY_HOTPLUG
 	depends on 64BIT || BROKEN
 	select NUMA_KEEP_MEMINFO if NUMA
-- 
2.31.1

