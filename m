Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E422832BFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 15:58:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hho+EuYM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hho+EuYM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGjR66nbBz3vfB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 01:58:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hho+EuYM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hho+EuYM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGjKx22GVz3cQm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 01:53:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=idAf8C8vEaEPhamo8i8Q+7QtJLmbWmmoc+K4mQqU0s4=;
	b=hho+EuYMnb3M3sbrv4lo1g1mZnuzK7+MzNzR1g5dXle3n4BAMV0aJ2nc3LudqYGbufx9OG
	y2WFKl7C6B/fKas339DPhAn1JHkV/Un8pzcs2Sg2ZS9jFG5bZZLJlVJEj0mIg+RQ67RT7R
	wdJry7O1Mri4QGUNWfMkt6u9c+IoVac=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=idAf8C8vEaEPhamo8i8Q+7QtJLmbWmmoc+K4mQqU0s4=;
	b=hho+EuYMnb3M3sbrv4lo1g1mZnuzK7+MzNzR1g5dXle3n4BAMV0aJ2nc3LudqYGbufx9OG
	y2WFKl7C6B/fKas339DPhAn1JHkV/Un8pzcs2Sg2ZS9jFG5bZZLJlVJEj0mIg+RQ67RT7R
	wdJry7O1Mri4QGUNWfMkt6u9c+IoVac=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-184-YH3KIHVePGC9OEG05Qcb4A-1; Fri,
 19 Jan 2024 09:53:33 -0500
X-MC-Unique: YH3KIHVePGC9OEG05Qcb4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A44A81C54032;
	Fri, 19 Jan 2024 14:53:32 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DE6951D5;
	Fri, 19 Jan 2024 14:53:26 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/14] crash: clean up kdump related config items
Date: Fri, 19 Jan 2024 22:52:32 +0800
Message-ID: <20240119145241.769622-6-bhe@redhat.com>
In-Reply-To: <20240119145241.769622-1-bhe@redhat.com>
References: <20240119145241.769622-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
Cc: linux-s390@vger.kernel.org, Baoquan He <bhe@redhat.com>, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

By splitting CRASH_RESERVE and VMCORE_INFO out from CRASH_CORE, cleaning
up the dependency of FA_DMUMP on CRASH_DUMP, and moving crash codes from
kexec_core.c to crash_core.c, now we can rearrange CRASH_DUMP to
depend on KEXEC_CORE, and make CRASH_DUMP select CRASH_RESERVE and
VMCORE_INFO.

KEXEC_CORE won't select CRASH_RESERVE and VMCORE_INFO any more because
KEXEC_CORE enables codes which allocate control pages, copy
kexec/kdump segments, and prepare for switching. These codes are shared
by both kexec reboot and crash dumping.

Doing this makes codes and the corresponding config items more
logical (the right item depends on or is selected by the left item).

PROC_KCORE -----------> VMCORE_INFO

           |----------> VMCORE_INFO
FA_DUMP----|
           |----------> CRASH_RESERVE

                                                ---->VMCORE_INFO
                                               /
                                               |---->CRASH_RESERVE
KEXEC      --|                                /|
             |--> KEXEC_CORE--> CRASH_DUMP-->/-|---->PROC_VMCORE
KEXEC_FILE --|                               \ |
                                               \---->CRASH_HOTPLUG

KEXEC      --|
             |--> KEXEC_CORE--> kexec reboot
KEXEC_FILE --|

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 kernel/Kconfig.kexec | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 8faf27043432..6c34e63c88ff 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -9,8 +9,6 @@ config VMCORE_INFO
 	bool
 
 config KEXEC_CORE
-	select VMCORE_INFO
-	select CRASH_RESERVE
 	bool
 
 config KEXEC_ELF
@@ -99,8 +97,11 @@ config KEXEC_JUMP
 
 config CRASH_DUMP
 	bool "kernel crash dumps"
+	default y
 	depends on ARCH_SUPPORTS_CRASH_DUMP
-	select KEXEC_CORE
+	depends on KEXEC_CORE
+	select VMCORE_INFO
+	select CRASH_RESERVE
 	help
 	  Generate crash dump after being started by kexec.
 	  This should be normally only set in special crash dump kernels
-- 
2.41.0

