Return-Path: <linuxppc-dev+bounces-12540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 359CDB96966
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 17:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWP8B0WFLz3000;
	Wed, 24 Sep 2025 01:31:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758641465;
	cv=none; b=DhjX6p/3aXumASEzczKdKGsZiM74w9j+5A93dRg8+7o6jaWq8AYzA0tQ50entkj7jqTNp1CnFLd1ITVKNSHvMnQKRuaxec23qHavNgXRNNQfyL4hcO1t0RJEBRuumIBAgUNjsJWTa+NgK+ybr0q+VH7TXwoJQn03CuiGFci010YZhW4R4o6cKqEnUMiBy6bqiXSykTn+JDm6KMvRirBOud/+CnwP7GR11L3j3bC8bali62cASdGzgK/ubBZeXIOTds/NbnzBkDX5Cn7V5JxMXNVT1jQMsFZGLbt/OLySexALiZmADOByzpjP105fMnEjMJXXGNiiIaup2+MRwOI+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758641465; c=relaxed/relaxed;
	bh=Gepj0GovVH3AS/Kf3XZjwnwXf+WGuvdxszVKLwmSkUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=aaPxQnFG7Yo1INVfoXnPKAf4IdRKvO4XRCnlPQYcrQlWHy5lPlurUbf5pEZ3UcVAWNyaptjxWPGPOKnH0gBwi5G4p80DPkHB931DIyKZ0KckqDTbM0pAUzYrKlN6Is5gWey66UOyIHXoi/mo+z1lUaCmWctOuo+HF0GU6YcgWZA1bfGB68SFuj2uymouN8iZX9sb07BWDU1N4ABJ10hpWEnCnG7Cz/IXol8dwi9LPovS2cJeJWQS8wfUYKVaWIlnCqmVJo5P2cHUJG76/IdoQ05uR24R0S+dSmGm0w5nj87zVv+Vc3uWxtNeKj3Q6xsAK00pX0u7ysYBFoTSKHkNXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J+RrWLyc; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J+RrWLyc; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J+RrWLyc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J+RrWLyc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWP865cgXz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 01:31:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758641457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gepj0GovVH3AS/Kf3XZjwnwXf+WGuvdxszVKLwmSkUk=;
	b=J+RrWLycaFYQMkz3umMzoZQAoTcb/Skp6huicv3zx/hDA6RF/ntGg4pdFXERqdANhrQFlE
	xmb6H+PAaHkJR0/Uegnl9WzXmtap3HdmPh11k6KVHlwuYiyLJrjqbJZRRIYxQkcXjAmHRO
	kWBsPL0M23QxEzynPY334qkzvH19V7M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758641457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gepj0GovVH3AS/Kf3XZjwnwXf+WGuvdxszVKLwmSkUk=;
	b=J+RrWLycaFYQMkz3umMzoZQAoTcb/Skp6huicv3zx/hDA6RF/ntGg4pdFXERqdANhrQFlE
	xmb6H+PAaHkJR0/Uegnl9WzXmtap3HdmPh11k6KVHlwuYiyLJrjqbJZRRIYxQkcXjAmHRO
	kWBsPL0M23QxEzynPY334qkzvH19V7M=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-Is6LQT77NyiaptB_lKTIGQ-1; Tue,
 23 Sep 2025 11:30:53 -0400
X-MC-Unique: Is6LQT77NyiaptB_lKTIGQ-1
X-Mimecast-MFC-AGG-ID: Is6LQT77NyiaptB_lKTIGQ_1758641451
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1821019560BB;
	Tue, 23 Sep 2025 15:30:51 +0000 (UTC)
Received: from t14ultra.redhat.com (unknown [10.45.224.118])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C73B19560B8;
	Tue, 23 Sep 2025 15:30:47 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	jstancek@redhat.com,
	linux-kernel@vger.kernel.org,
	joe.lawrence@redhat.com
Subject: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check scripts
Date: Tue, 23 Sep 2025 17:32:16 +0200
Message-ID: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
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
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We've been observing rare non-deterministic kconfig failures during
olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
disabled and with it number of other config options that depend on it.

The reason is that gcc-check-fpatchable-function-entry.sh can fail
if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
there is still someone writing on other side of pipe. `pipefail`
propagates that error up to kconfig.

This can be seen for example with:
  # (set -e; set -o pipefail; yes | grep -q y); echo $?
  141

or by running the actual check script in loop extensively:
  ----------------------------- 8< -------------------------------
  function kconfig()
  {
    for i in `seq 1 100`; do
      arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh \
        ./scripts/dummy-tools/gcc -mlittle-endian \
        || { echo "Oops"; exit 1; }
    done
  }

  for ((i=0; i<$(nproc); i++)); do kconfig & done
  wait; echo "Done"
  ----------------------------- >8 -------------------------------

Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-function-entry")
Fixes: b71c9ffb1405 ("powerpc: Add arch/powerpc/tools directory")
Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh | 1 -
 arch/powerpc/tools/gcc-check-mprofile-kernel.sh           | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
index 06706903503b..baed467a016b 100755
--- a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
+++ b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
@@ -2,7 +2,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 set -e
-set -o pipefail
 
 # To debug, uncomment the following line
 # set -x
diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
index 73e331e7660e..6193b0ed0c77 100755
--- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
+++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
@@ -2,7 +2,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 set -e
-set -o pipefail
 
 # To debug, uncomment the following line
 # set -x
-- 
2.47.1


