Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C5F7FEE4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 12:54:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VyVI0vWE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AnKSLCFl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgvkP53DSz3cZm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 22:54:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VyVI0vWE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AnKSLCFl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgr2C478Wz2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 20:08:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701335277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2BrihdLe4pGZEbs5jmiizmBAK+7Wuy8kKIYMt7+5/c=;
	b=VyVI0vWEv/VDaTxS9TDkT4DuNJIHSAdCFZdhbL7rNaTrVqzjukMpXQ3ck7bTJ93iej2Rhc
	UkWd9gusJBwB4mDjWxuNaPDffgW8NmwNPis1ubpO6xyQ6kcHI37+x/uS8psN3zuBoa1lxJ
	CRvRqK56NnCiUJjmf/5i6uanQLyesrg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701335278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2BrihdLe4pGZEbs5jmiizmBAK+7Wuy8kKIYMt7+5/c=;
	b=AnKSLCFlGfc8HtmH1+bejXBDCgKnmB2BAYgWZ0pep8STR+DGPJ/rQnfTSDlrLCq/1DQ/QN
	xh8UvJZhvgARHuht0FLM5Je82CHjYUfZ+aU3LYK9owgcoRohhS98wUuZfn04aGd9tGq+ha
	3EnOv3gyJp/2s9HDTolxaIAYsI6ocS0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615--bdy0aOIPie9UH3lJtZuIg-1; Thu, 30 Nov 2023 04:07:56 -0500
X-MC-Unique: -bdy0aOIPie9UH3lJtZuIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7DA084ACA0;
	Thu, 30 Nov 2023 09:07:55 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6BE61C060AE;
	Thu, 30 Nov 2023 09:07:55 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: Andrew Jones <andrew.jones@linux.dev>,
	kvmarm@lists.linux.dev
Subject: [kvm-unit-tests PATCH v1 01/18] Makefile: Define __ASSEMBLY__ for assembly files
Date: Thu, 30 Nov 2023 04:07:03 -0500
Message-Id: <20231130090722.2897974-2-shahuang@redhat.com>
In-Reply-To: <20231130090722.2897974-1-shahuang@redhat.com>
References: <20231130090722.2897974-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mailman-Approved-At: Thu, 30 Nov 2023 22:53:06 +1100
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, Eric Auger <eric.auger@redhat.com>, Nadav Amit <namit@vmware.com>, Alexandru Elisei <alexandru.elisei@arm.com>, David Woodhouse <dwmw@amazon.co.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexandru Elisei <alexandru.elisei@arm.com>

There are 25 header files today (found with grep -r "#ifndef __ASSEMBLY__)
with functionality relies on the __ASSEMBLY__ prepocessor constant being
correctly defined to work correctly. So far, kvm-unit-tests has relied on
the assembly files to define the constant before including any header
files which depend on it.

Let's make sure that nobody gets this wrong and define it as a compiler
constant when compiling assembly files. __ASSEMBLY__ is now defined for all
.S files, even those that didn't set it explicitely before.

Reviewed-by: Nikos Nikoleris <nikos.nikoleris@arm.com>
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
---
 Makefile           | 5 ++++-
 arm/cstart.S       | 1 -
 arm/cstart64.S     | 1 -
 powerpc/cstart64.S | 1 -
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 602910dd..27ed14e6 100644
--- a/Makefile
+++ b/Makefile
@@ -92,6 +92,9 @@ CFLAGS += -Woverride-init -Wmissing-prototypes -Wstrict-prototypes
 
 autodepend-flags = -MMD -MP -MF $(dir $*).$(notdir $*).d
 
+AFLAGS  = $(CFLAGS)
+AFLAGS += -D__ASSEMBLY__
+
 LDFLAGS += -nostdlib $(no_pie) -z noexecstack
 
 $(libcflat): $(cflatobjs)
@@ -113,7 +116,7 @@ directories:
 	@mkdir -p $(OBJDIRS)
 
 %.o: %.S
-	$(CC) $(CFLAGS) -c -nostdlib -o $@ $<
+	$(CC) $(AFLAGS) -c -nostdlib -o $@ $<
 
 -include */.*.d */*/.*.d
 
diff --git a/arm/cstart.S b/arm/cstart.S
index 3dd71ed9..b24ecabc 100644
--- a/arm/cstart.S
+++ b/arm/cstart.S
@@ -5,7 +5,6 @@
  *
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
-#define __ASSEMBLY__
 #include <auxinfo.h>
 #include <asm/assembler.h>
 #include <asm/thread_info.h>
diff --git a/arm/cstart64.S b/arm/cstart64.S
index bc2be45a..a8ad6dc8 100644
--- a/arm/cstart64.S
+++ b/arm/cstart64.S
@@ -5,7 +5,6 @@
  *
  * This work is licensed under the terms of the GNU GPL, version 2.
  */
-#define __ASSEMBLY__
 #include <auxinfo.h>
 #include <asm/asm-offsets.h>
 #include <asm/assembler.h>
diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index 34e39341..fa32ef24 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -5,7 +5,6 @@
  *
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
-#define __ASSEMBLY__
 #include <asm/hcall.h>
 #include <asm/ppc_asm.h>
 #include <asm/rtas.h>
-- 
2.40.1

