Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8D689446
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 10:47:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7W5x4Fhcz3f8y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 20:47:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NOuOoEWA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NOuOoEWA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NOuOoEWA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NOuOoEWA;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7W151JHkz3f6L
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 20:43:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675417382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tHFJYodS+GlZliPPBpSywnTgXG8QiYZdzMEcCQFBMZk=;
	b=NOuOoEWAK3LcfoSpnCKnT2hNU/eakM/BP8y7Wo2/cWXZsCTA9/dDzQeccr3si31vIJZPI+
	3jmehBQb0JXlwkbN0qkJtLqTaOvHuZKNRS83hZf3bcsmGKzvQDgJ42OokizYJoFx+AIIJD
	sTd8QQGIUxhxbX1hWtUnUJP2XjiF0jU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675417382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tHFJYodS+GlZliPPBpSywnTgXG8QiYZdzMEcCQFBMZk=;
	b=NOuOoEWAK3LcfoSpnCKnT2hNU/eakM/BP8y7Wo2/cWXZsCTA9/dDzQeccr3si31vIJZPI+
	3jmehBQb0JXlwkbN0qkJtLqTaOvHuZKNRS83hZf3bcsmGKzvQDgJ42OokizYJoFx+AIIJD
	sTd8QQGIUxhxbX1hWtUnUJP2XjiF0jU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-JjRiMZkKNgqIaOgbneMQ2A-1; Fri, 03 Feb 2023 04:42:56 -0500
X-MC-Unique: JjRiMZkKNgqIaOgbneMQ2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3DB029AB3F7;
	Fri,  3 Feb 2023 09:42:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9C46408573E;
	Fri,  3 Feb 2023 09:42:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH 5/7] KVM: s390: Use "int" as return type for kvm_s390_get/set_skeys()
Date: Fri,  3 Feb 2023 10:42:28 +0100
Message-Id: <20230203094230.266952-6-thuth@redhat.com>
In-Reply-To: <20230203094230.266952-1-thuth@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These two functions only return normal integers, so it does not
make sense to declare the return type as "long" here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/s390/kvm/kvm-s390.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index e4890e04b210..8ad1972b8a73 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -1992,7 +1992,7 @@ static int kvm_s390_vm_has_attr(struct kvm *kvm, struct kvm_device_attr *attr)
 	return ret;
 }
 
-static long kvm_s390_get_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
+static int kvm_s390_get_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
 {
 	uint8_t *keys;
 	uint64_t hva;
@@ -2040,7 +2040,7 @@ static long kvm_s390_get_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
 	return r;
 }
 
-static long kvm_s390_set_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
+static int kvm_s390_set_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
 {
 	uint8_t *keys;
 	uint64_t hva;
-- 
2.31.1

