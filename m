Return-Path: <linuxppc-dev+bounces-12092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70CB55169
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 16:28:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNcGT48p4z3dSf;
	Sat, 13 Sep 2025 00:28:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757687281;
	cv=none; b=SrmeAqMpdYa/zIuU3qkcB5+T+y49Cd8CRwH2CDsTKy4nh2J6Z1X7dLhQxwydGwXLBb0DE46chmeCe50xQIvA1nW81/WQM1wEm/5GOgR+eG/N9BU6JTjFnTy9WEEPNIB007b1YhSYHo4p6NGIx1MQ0BOHif8r2sFhL2j1kJMmV6vdADK65v119gqXJPFhcYn9bABGL3vsTcqK6MuDrs1SwiUl1a65703dgUNinAhAgTTVv45YpcypfR4tnFITQu54Io93pNzv4XX3l5pk/LQtoUq6hDcgg0EIrxOVb5Vn3otCBlWoJclgv3OkPIcQjg9A5dFrTD5gaCjMgpULh88nVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757687281; c=relaxed/relaxed;
	bh=aZPvyy/AKMXkhDZNYow1h1stF46QQDZbnLwLHlg6QM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=EPtPW8nBag5RiRI7r8UZWuuj0soPVuqBlzQva0YEwlafQRPsT75b7aCOv76HZ0n/+fzKpnnieomuT/DrvbOLdIeaXUVLeJ5nPGqgYssH/F9COO5pkC+tXnGjncFpGIvtHHqwtUYhveZFAZ5HY/XpOxvJNEb6WO2jry8tNUqlagDu+kKEfXXFcQT1XkDWRLgj4F5RgY6s3W4Pf6MlOzXF2JLk64Y8Ozcy8LhEsLiTWr/fmkXpXJGpzS7/4vl4FKrs1wG6d5DCIzR3/iot2mVQEzBpiPm+AvKeBeiLnuGj2l8SIUZ2D8/RfiUrPPdkMxpnUjLDapgFKFg8Xl9x7fqngQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NcXr1bj/; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NR9944CC; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NcXr1bj/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NR9944CC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNcGS569Lz3dRQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 00:28:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757687276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aZPvyy/AKMXkhDZNYow1h1stF46QQDZbnLwLHlg6QM8=;
	b=NcXr1bj/H+5krQ4qnBIJAg08FpdSx2z2KKfvHuEZwc7dPnmFezfiRazo/3zCA9fjYQJtp5
	xPG+cQHm4abx7RITNVeRbz3aG6eHkeiIeZAVxZMjXkX/5LVUoSsJYLfAMPc6BErL2uOxj9
	HxLB3SXibsvx2T3In9JjsSv1VhYUsto=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757687277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aZPvyy/AKMXkhDZNYow1h1stF46QQDZbnLwLHlg6QM8=;
	b=NR9944CCjB2c6GNzBnUYqcFONcGjU4jIUa3BGiQ1xjJvrcEyqQeljlQjB/lEy2Y6Txv2s3
	uW068AvKYCjgqSR9kdwLDeKHf5m2chrcOpHIvmo47qE2CDpnGROCxykdg2Abl3PKojoD41
	oi6zWPuluc1ygxxnBGWJmeBhw/yBXiA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-mg6a9mulNxG3LU0iggUvtg-1; Fri,
 12 Sep 2025 10:27:51 -0400
X-MC-Unique: mg6a9mulNxG3LU0iggUvtg-1
X-Mimecast-MFC-AGG-ID: mg6a9mulNxG3LU0iggUvtg_1757687269
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B1EA4180057A;
	Fri, 12 Sep 2025 14:27:49 +0000 (UTC)
Received: from jolawren-thinkpadp1gen7.ibmlowe.csb (unknown [10.22.81.60])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C366E1800452;
	Fri, 12 Sep 2025 14:27:47 +0000 (UTC)
From: Joe Lawrence <joe.lawrence@redhat.com>
To: linuxppc-dev@lists.ozlabs.org,
	live-patching@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v2 1/3] powerpc/ftrace: ensure ftrace record ops are always set for NOPs
Date: Fri, 12 Sep 2025 10:27:38 -0400
Message-ID: <20250912142740.3581368-2-joe.lawrence@redhat.com>
In-Reply-To: <20250912142740.3581368-1-joe.lawrence@redhat.com>
References: <20250912142740.3581368-1-joe.lawrence@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When an ftrace call site is converted to a NOP, its corresponding
dyn_ftrace record should have its ftrace_ops pointer set to
ftrace_nop_ops.

Correct the powerpc implementation to ensure the
ftrace_rec_set_nop_ops() helper is called on all successful NOP
initialization paths. This ensures all ftrace records are consistent
before being handled by the ftrace core.

Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
Suggested-by: Naveen N Rao <naveen@kernel.org>
Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 6dca92d5a6e8..841d077e2825 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -488,8 +488,10 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 		return ret;
 
 	/* Set up out-of-line stub */
-	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
-		return ftrace_init_ool_stub(mod, rec);
+	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
+		ret = ftrace_init_ool_stub(mod, rec);
+		goto out;
+	}
 
 	/* Nop-out the ftrace location */
 	new = ppc_inst(PPC_RAW_NOP());
@@ -520,6 +522,10 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 		return -EINVAL;
 	}
 
+out:
+	if (!ret)
+		ret = ftrace_rec_set_nop_ops(rec);
+
 	return ret;
 }
 
-- 
2.51.0


