Return-Path: <linuxppc-dev+bounces-10184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD6B0148C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 09:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdjts1BR4z30Qk;
	Fri, 11 Jul 2025 17:26:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752218773;
	cv=none; b=WkjckMxNFrZDw1eRzeGLbqjaAWM0w/IZPRrNq2vqTxmVXKWjAMTDBVlxgroSWMgoZzr7tWtJ9jOg4wJlHzEkogN9rgazvrgc4i8thv3i4LWZZcrVZNGvwFisQgG7E8Umih9ZzRre3NBsjnViXra5hO+RJh7iaVlSUvPxINJ+OveKnd6cepg53vLKNWz97hcalCCEQf+LeV7Z50uJvPFTQMAL6mXwp3O4BHeZYaWTqm/t6DtOGoTS3HZy0wrIk4ILrB/v4bWuz0db3OqYppb/t2TVOQOVUsk389er96VlzuoKPw0ZvNEWJ1Su+P37cydUp0nzV6ghc6Fvgn/bPVZkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752218773; c=relaxed/relaxed;
	bh=QSPK6pFRzoDLrBX1H6YdlGjEz0PyKwAT8n2cjPzr4Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o1VfCCNEsy945QBkFwJaNTVQHNqx1q51HoSJCCpIWgJi7vCm/fUUwa+w/USD3V6CYbYMvEXRSXb85JDJf2JOjoSbhgT47aQZomMnSGV56ZKOeaj9d2jDnSXME10hfsY+DtSo2dvL1CCamogYN3MwqR0gg2bipbHHFiSkZ4K7lKHIufM9rHVapfO8PGzi+LZWlEh2onz4dj1T8RTK+rK4RAfdLeRX5gDsAVB4IadLoJoN51Ju86LMNYW3CWn0KXFBcQKj359Z6P3uHpcsKBZXIrpqAi6gfd/bVzHkcACku0BBV4iUiOdq0h+EHt6CWpmmMrMp8l+YNCP6GDfULEHOsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lz/JZlO5; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdhraVeW; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lz/JZlO5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdhraVeW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdjtr1ByHz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 17:26:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752218767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QSPK6pFRzoDLrBX1H6YdlGjEz0PyKwAT8n2cjPzr4Lo=;
	b=Lz/JZlO5l4u4UJuV4Oayzdfv4zTLwx1SYA1n8cVkHmeTmRTduuF5NVWHOXNG+XHY7NX87I
	G5rxIMkoNCsrbR4LF+G8YNniRfg21YfP8zRJIwny2D6PZVkqY0pZ87qNmLT6wfGvNX2T8G
	ZlNMxCBgCQHhqDDNzZwiK3jsR+gahRc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752218768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QSPK6pFRzoDLrBX1H6YdlGjEz0PyKwAT8n2cjPzr4Lo=;
	b=HdhraVeWd7m+MbOJVd6mY1DTIbtW1/3G12weIJDtIe/ofO81WDihfdw88KD5E6BxgmiBu7
	47WEAeunOsUaLlN+naVUZkwdlXcK/GYb9U3mQe/zIWEQ08AgxHzOjJ3Y4g3g3jAv8CfE8R
	DqNgTTTNrRXuS0L3ZvKKLERXZEspYps=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-WWcPSqBrOKO-WQ_t2gZxcg-1; Fri,
 11 Jul 2025 03:26:03 -0400
X-MC-Unique: WWcPSqBrOKO-WQ_t2gZxcg-1
X-Mimecast-MFC-AGG-ID: WWcPSqBrOKO-WQ_t2gZxcg_1752218762
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13FEA180034E;
	Fri, 11 Jul 2025 07:26:02 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.54])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5EE0E30001A1;
	Fri, 11 Jul 2025 07:25:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-spdx@vger.kernel.org
Subject: [PATCH v3] powerpc: Drop GPL boilerplate text with obsolete FSF address
Date: Fri, 11 Jul 2025 09:25:53 +0200
Message-ID: <20250711072553.198777-1-thuth@redhat.com>
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
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thomas Huth <thuth@redhat.com>

The FSF does not reside in the Franklin street anymore, so we should not
request the people to write to this address. Fortunately, these header
files already contain a proper SPDX license identifier, so it should be
fine to simply drop all of this license boilerplate code here.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v3: Renamed the patch from "powerpc: Replace the obsolete address of
     the FSF" and drop the boilerplate text instead of replacing the
     address.

 arch/powerpc/include/uapi/asm/eeh.h      | 13 -------------
 arch/powerpc/include/uapi/asm/kvm.h      | 13 -------------
 arch/powerpc/include/uapi/asm/kvm_para.h | 13 -------------
 arch/powerpc/include/uapi/asm/ps3fb.h    | 13 -------------
 4 files changed, 52 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/eeh.h b/arch/powerpc/include/uapi/asm/eeh.h
index 28186071fafc4..3b5c47ff3fc4b 100644
--- a/arch/powerpc/include/uapi/asm/eeh.h
+++ b/arch/powerpc/include/uapi/asm/eeh.h
@@ -1,18 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License, version 2, as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
- *
  * Copyright IBM Corp. 2015
  *
  * Authors: Gavin Shan <gwshan@linux.vnet.ibm.com>
diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
index eaeda001784eb..077c5437f5219 100644
--- a/arch/powerpc/include/uapi/asm/kvm.h
+++ b/arch/powerpc/include/uapi/asm/kvm.h
@@ -1,18 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License, version 2, as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
- *
  * Copyright IBM Corp. 2007
  *
  * Authors: Hollis Blanchard <hollisb@us.ibm.com>
diff --git a/arch/powerpc/include/uapi/asm/kvm_para.h b/arch/powerpc/include/uapi/asm/kvm_para.h
index a809b1b44ddfe..ac596064d4c76 100644
--- a/arch/powerpc/include/uapi/asm/kvm_para.h
+++ b/arch/powerpc/include/uapi/asm/kvm_para.h
@@ -1,18 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License, version 2, as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
- *
  * Copyright IBM Corp. 2008
  *
  * Authors: Hollis Blanchard <hollisb@us.ibm.com>
diff --git a/arch/powerpc/include/uapi/asm/ps3fb.h b/arch/powerpc/include/uapi/asm/ps3fb.h
index fd7e3a0d35d57..b1c6b0cd9e802 100644
--- a/arch/powerpc/include/uapi/asm/ps3fb.h
+++ b/arch/powerpc/include/uapi/asm/ps3fb.h
@@ -2,19 +2,6 @@
 /*
  * Copyright (C) 2006 Sony Computer Entertainment Inc.
  * Copyright 2006, 2007 Sony Corporation
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published
- * by the Free Software Foundation; version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 
 #ifndef _ASM_POWERPC_PS3FB_H_
-- 
2.50.0


