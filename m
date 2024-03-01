Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A26A86EA59
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 21:31:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L2d4C7Nl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EvZ7jDVl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tmfr40WDmz3vbv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 07:31:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L2d4C7Nl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EvZ7jDVl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsavitz@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmfqG66mtz3dVv
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Mar 2024 07:30:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709325029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p4HV6m6g6G800ZFnvQF0dUMRRFs2reQboirIXeVEjws=;
	b=L2d4C7NlvxzoHxWvHgpS3n6DRpNh4moMU0er/KcxJgBKfa/wpNoj5lJGU4Ex703DxwjlJp
	jlHKK1EZVhWxA6K0+aGWtqgxJgokPaLfw1tzeAJtvhh9Q1Ex9ziSA8uzrVn/9UjWM6Qo19
	HWLWZcJ5PL8F7AX5Dg0pG+Qxw+dQpac=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709325030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p4HV6m6g6G800ZFnvQF0dUMRRFs2reQboirIXeVEjws=;
	b=EvZ7jDVlbXaBg+I7nxZ9LqELNN1i+hw6JaSXQPTizRgODKRaBeBc2tfZdnYpTtsL1PT3nI
	XrsV0f1qViszX5Rpv5LM8Civboxi3Gh79qde6ehEFfzlr2tCl+Bf0jdVj0n+2qzCDDS7Rn
	jcoH3wIYWIw2Vkfo7QM6f6vfY1YX9zg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-6Y1hDfuoONGk5m_HhEMYUQ-1; Fri,
 01 Mar 2024 15:30:28 -0500
X-MC-Unique: 6Y1hDfuoONGk5m_HhEMYUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 320F0380406D;
	Fri,  1 Mar 2024 20:30:27 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.8.150])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC07A39D6D;
	Fri,  1 Mar 2024 20:30:25 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: align memory_limit to 16MB in early_parse_mem
Date: Fri,  1 Mar 2024 15:30:23 -0500
Message-ID: <20240301203023.2197451-1-jsavitz@redhat.com>
MIME-Version: 1.0
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
Cc: Gonzalo Siero <gsierohu@redhat.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Joel Savitz <jsavitz@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 64-bit powerpc, usage of a non-16MB-aligned value for the mem= kernel
cmdline parameter results in a system hang at boot.

For example, using 'mem=4198400K' will always reproduce this issue.

This patch fixes the problem by aligning any argument to mem= to 16MB
corresponding with the large page size on powerpc.

Fixes: 2babf5c2ec2f ("[PATCH] powerpc: Unify mem= handling")
Co-developed-by: Gonzalo Siero <gsierohu@redhat.com>
Signed-off-by: Gonzalo Siero <gsierohu@redhat.com>
Signed-off-by: Joel Savitz <jsavitz@redhat.com>
---
 arch/powerpc/kernel/prom.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0b5878c3125b..8cd3e2445d8a 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -82,8 +82,12 @@ static int __init early_parse_mem(char *p)
 {
 	if (!p)
 		return 1;
-
+#ifdef CONFIG_PPC64
+	/* Align to 16 MB == size of ppc64 large page */
+	memory_limit = ALIGN(memparse(p, &p), 0x1000000);
+#else
 	memory_limit = PAGE_ALIGN(memparse(p, &p));
+#endif
 	DBG("memory limit = 0x%llx\n", memory_limit);
 
 	return 0;
-- 
2.43.0

