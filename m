Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF980689426
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 10:44:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7W2t6B4Nz3f62
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 20:44:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=in4F2xIv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e30XpZxY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=in4F2xIv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e30XpZxY;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7W0v1GYhz3f40
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 20:42:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675417371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DqDRH/0lCXChL6lF9FhJdEI9fG4ptLvUYJEw5ZtLX0Q=;
	b=in4F2xIv1xzMhiorAvuwVP6GrqYAIh1illXYcKd+JthuYaVGTNAQL/qjHlWOydfumsaGZg
	W9uOcrfzv6rkZn8Td5foIMlZ+u9wmx+8b9c1W3K687K1FiaUuuvknYL9ENFVktm270UolY
	sx1vfZXoJeWe6Ap4yImUhBGW6B0IXr0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675417372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DqDRH/0lCXChL6lF9FhJdEI9fG4ptLvUYJEw5ZtLX0Q=;
	b=e30XpZxYK54qfVWQyrMzbYncrWCvJ2gHz06DvfiHy5aMCfnKYfQCXpChHEijpxe4N9tvz6
	IARDUTrnT462ffiHK3uNRgeeJ/dgCF7EbvnOeMSL1trvowf9FxizegyhwKgrrenKeDgMnu
	6Xf9NFn7jyVLU2r6cJ+wNoJqEwifvK4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-55hyVc76NsCFjAV8PUgtUw-1; Fri, 03 Feb 2023 04:42:47 -0500
X-MC-Unique: 55hyVc76NsCFjAV8PUgtUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D6DB85CBED;
	Fri,  3 Feb 2023 09:42:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B417340C1423;
	Fri,  3 Feb 2023 09:42:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH 2/7] KVM: x86: Improve return type handling in kvm_vm_ioctl_get_nr_mmu_pages()
Date: Fri,  3 Feb 2023 10:42:25 +0100
Message-Id: <20230203094230.266952-3-thuth@redhat.com>
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

kvm_vm_ioctl_get_nr_mmu_pages() tries to return a "unsigned long" value,
but its caller only stores ther return value in an "int" - which is also
what all the other kvm_vm_ioctl_*() functions are returning. So returning
values that do not fit into a 32-bit integer anymore does not work here.
It's better to adjust the return type, add a sanity check and return an
error instead if the value is too big.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/x86/kvm/x86.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index da4bbd043a7b..caa2541833dd 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6007,8 +6007,11 @@ static int kvm_vm_ioctl_set_nr_mmu_pages(struct kvm *kvm,
 	return 0;
 }
 
-static unsigned long kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
+static int kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
 {
+	if (kvm->arch.n_max_mmu_pages > INT_MAX)
+		return -EOVERFLOW;
+
 	return kvm->arch.n_max_mmu_pages;
 }
 
-- 
2.31.1

