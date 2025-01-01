Return-Path: <linuxppc-dev+bounces-4549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 925429FF329
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 07:49:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNL6v2J6vz2ydG;
	Wed,  1 Jan 2025 17:49:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735714183;
	cv=none; b=fnR2vS9z5AZOCza5kSBl3AUr5bAVpQcn7vv8CiPccOs4RB7d2nGQ/WY1JCVcw3QUJvT5IBX5dznZhPG1hC0cUine3O4HuG1VQjexUB8P+LBN7JYgH2Kd6ok5FwyAhGWsWXz5CM3NtEvICIykLSmz3TsZ9+Uc1emN4zY+MyPN9wORi0BEOCJJ/wzTYsMI3NoYPJ1dQudVEZ8fkLzzDf4yQzR7UtY0mIScbG7wk4lJG7HN+nQCKvdr0MDr7jW+eWTCGR/pE25zrxTRPF0dO/zHwivkYBiFuZlvIEiOj+itbxu4mLvtSa2cZZtCOhnkFY8iV9kuVqlJ00phJbbvbThhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735714183; c=relaxed/relaxed;
	bh=YRIIgCXg3JsYIvS3NMssQ9//coF9ig5NRKK0Y4BlSBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vw1MQm73Bj8SU/NtvyvjR2liRenvCsqNaKhlPwNgxofG8RGLq2WJA/SpMCySzMMBZjzykil6CODB4LPqLwHBfnGffhOKlcj2xOF+KxzODRS+mMW8aOpYG8zNW2Erz8v8lDowsUHECdnpjLJpOkBjR2rdbQhlMxh9GJtLVZbYwb02l95grmgu6xZEeB6z2KwjURKdM39tNE7tazKYuj0LCCsfppQzxJHqTVQtXhkfLbH4nhz/LmnDxZYjH+txXfsBUvDpYUNYdB2GDReVd+aObd7D73t3UAg/Thn1capTJCKX3ZkWaYHgeCsklbDm2XUCR/AOgYeYACii+ulVClNiEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cgb9DaKv; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cgb9DaKv; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cgb9DaKv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cgb9DaKv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNL6s6WPGz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jan 2025 17:49:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735714176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YRIIgCXg3JsYIvS3NMssQ9//coF9ig5NRKK0Y4BlSBg=;
	b=cgb9DaKvvNJUhDMctXLO68/NZDLEUZ+cCZxhqJfOVXVxlU9CsVZZ6D6bmNbaKqaHk/z0qs
	zQufTfqmC7s7WOgr/xA+gOwyVeR4wknX5ylfeVF0isSiMbmKdXdWQqfKJezQxhMoCYY90N
	s7+bG6AEoDk2Bjl/AcFkcOKEEZqblww=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735714176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YRIIgCXg3JsYIvS3NMssQ9//coF9ig5NRKK0Y4BlSBg=;
	b=cgb9DaKvvNJUhDMctXLO68/NZDLEUZ+cCZxhqJfOVXVxlU9CsVZZ6D6bmNbaKqaHk/z0qs
	zQufTfqmC7s7WOgr/xA+gOwyVeR4wknX5ylfeVF0isSiMbmKdXdWQqfKJezQxhMoCYY90N
	s7+bG6AEoDk2Bjl/AcFkcOKEEZqblww=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-hpPfv1w2NzOgUfkeFTMczg-1; Wed,
 01 Jan 2025 01:49:32 -0500
X-MC-Unique: hpPfv1w2NzOgUfkeFTMczg-1
X-Mimecast-MFC-AGG-ID: hpPfv1w2NzOgUfkeFTMczg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B92019560A3;
	Wed,  1 Jan 2025 06:49:31 +0000 (UTC)
Received: from virtlab1023.lab.eng.rdu2.redhat.com (virtlab1023.lab.eng.rdu2.redhat.com [10.8.1.187])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 426C6195394B;
	Wed,  1 Jan 2025 06:49:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev
Subject: [PATCH] KVM: allow NULL writable argument to __kvm_faultin_pfn
Date: Wed,  1 Jan 2025 01:49:28 -0500
Message-ID: <20250101064928.389504-1-pbonzini@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

kvm_follow_pfn() is able to work with NULL in the .map_writable field
of the homonymous struct.  But __kvm_faultin_pfn() rejects the combo
despite KVM for e500 trying to use it.  Indeed .map_writable is not
particularly useful if the flags include FOLL_WRITE and readonly
guest memory is not supported, so add support to __kvm_faultin_pfn()
for this case.

Fixes: 1c7b627e9306 ("KVM: Add kvm_faultin_pfn() to specifically service guest page faults")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: regressions@lists.linux.dev
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 virt/kvm/kvm_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de2c11dae231..5177e56fdbd5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2975,10 +2975,11 @@ kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
 		.refcounted_page = refcounted_page,
 	};
 
-	if (WARN_ON_ONCE(!writable || !refcounted_page))
+	if (WARN_ON_ONCE(!refcounted_page))
 		return KVM_PFN_ERR_FAULT;
 
-	*writable = false;
+	if (writable)
+		*writable = false;
 	*refcounted_page = NULL;
 
 	return kvm_follow_pfn(&kfp);
-- 
2.43.5


