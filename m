Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFA273B84B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 14:57:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UZmqge38;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UZmqge38;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnchG4Cvcz3c3f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 22:57:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UZmqge38;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UZmqge38;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qncdl4tgQz3bmp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 22:54:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687524888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMJsEqZxFDEiOpUmf5NTUaCgnapiJoAxYbiFoSk82wQ=;
	b=UZmqge38PD/Glp2nnW7D0nuwZy+cC4HwY86QtQFR1c4Og3EzMRUM+S7lGnqAIHNYoDlX2z
	wGc/PhstdCHxkuuE8GYylJvsG/xOgYCj+HnYbXMH+qIqp6kVPzbNGnCfGxRGzCzy07tMTh
	D4FJplMgg5gjhsd1yvTikHcDIP+7xCU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687524888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMJsEqZxFDEiOpUmf5NTUaCgnapiJoAxYbiFoSk82wQ=;
	b=UZmqge38PD/Glp2nnW7D0nuwZy+cC4HwY86QtQFR1c4Og3EzMRUM+S7lGnqAIHNYoDlX2z
	wGc/PhstdCHxkuuE8GYylJvsG/xOgYCj+HnYbXMH+qIqp6kVPzbNGnCfGxRGzCzy07tMTh
	D4FJplMgg5gjhsd1yvTikHcDIP+7xCU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-UhauKGHCN2CMcbORgDFUJg-1; Fri, 23 Jun 2023 08:54:43 -0400
X-MC-Unique: UhauKGHCN2CMcbORgDFUJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 965728CC200;
	Fri, 23 Jun 2023 12:54:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AD80F5AC5;
	Fri, 23 Jun 2023 12:54:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Nico=20B=C3=B6hr?= <nrb@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH 2/2] Link with "-z noexecstack" to avoid warning from newer versions of ld
Date: Fri, 23 Jun 2023 14:54:16 +0200
Message-Id: <20230623125416.481755-3-thuth@redhat.com>
In-Reply-To: <20230623125416.481755-1-thuth@redhat.com>
References: <20230623125416.481755-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: kvmarm@lists.linux.dev, linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Laurent Vivier <lvivier@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Newer versions of ld (from binutils 2.40) complain on s390x and x86:

 ld: warning: s390x/cpu.o: missing .note.GNU-stack section implies
              executable stack
 ld: NOTE: This behaviour is deprecated and will be removed in a
           future version of the linker

We can silence these warnings by using "-z noexecstack" for linking
(which should not have any real influence on the kvm-unit-tests since
the information from the ELF header is not used here anyway, so it's
just cosmetics).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0e5d85a1..20f7137c 100644
--- a/Makefile
+++ b/Makefile
@@ -96,7 +96,7 @@ CFLAGS += -Woverride-init -Wmissing-prototypes -Wstrict-prototypes
 
 autodepend-flags = -MMD -MF $(dir $*).$(notdir $*).d
 
-LDFLAGS += -nostdlib
+LDFLAGS += -nostdlib -z noexecstack
 
 $(libcflat): $(cflatobjs)
 	$(AR) rcs $@ $^
-- 
2.39.3

