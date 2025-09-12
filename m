Return-Path: <linuxppc-dev+bounces-12091-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEFDB55165
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 16:28:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNcGS5Fg7z3dRS;
	Sat, 13 Sep 2025 00:28:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757687280;
	cv=none; b=f8MWxGPveI4EyAow0JOaOYXICSGq6Mknb704orXNpPnKKs3gseEoepLicqP41zTDIM7uX+UlIKsu6jJt4QNIpUw6Hn/BfFhKcYPQpoSQLVOj+sAbjo6CN3ZTbBoIwhcjhAcnz21j6IHijFRFNK7K8GmFedYpoi1fLh/KjmEtUJVmCwMEly2WauAkk3OX9pcOnDZwYyKiqjy9Ar3kFBB7jMHyt3qU3ERHzLx1jxtXWtDzDLgGAjY3ddtN9BAGZUcaqYiKLGvBrOPcng+/neNLORx+IWTSzSOQgXKBPdcnfJqjgoQcM9OhfmmoE/DHNrib/hkSWZr8BXFsWz8Dy3oarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757687280; c=relaxed/relaxed;
	bh=stx2VrfzaBsnc/jAGNYjJWhUFVHawzyDw+ZsgOSjXaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ju0H8N3hljQgB3IXRhWJFFVjnbKejGXLh3X+NduQJ8ilPCFyLd4d76tV5YVg8aI70UNdAsWunDwIO3pSfY8+eZ5oG5dDNbTg0sJmMZOS+eKTKSkrJUVjIH8MR151CnHa3HcvmjZ1P67aElAni+4n8PZGQOh8nvRVDzL685SkPSo3klmG2G7rw3FrAaoQZCiavY5VGj6H3boYAStj6sEB/SaSzeRGz2mGfE7jXhdGHWjQZrK3qDh22AlkyWgQ9Ruz536ji3WW3YXcuY0HUB1GJBlABp6x8K6FrUYbchPShdnx3TQZjMAtToKJTNQjzSommlpE8N2XN6Hj68DLYUWPVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GFP3sW9c; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U6DzdkgD; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GFP3sW9c;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U6DzdkgD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNcGR67Cbz3dJd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 00:27:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757687276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stx2VrfzaBsnc/jAGNYjJWhUFVHawzyDw+ZsgOSjXaw=;
	b=GFP3sW9cLkmLa/+K8Qw1C1HKTxmBupF0N5JDNhDR7yDodc0AS9qG7hTfaLJYvuYVHecjfb
	GBjJy9m4mQRAwD023VCUZTlE/ld6pebYgMwkF1WvHuY0vRvUMdUBQA6k/geG3BlXkKkxv7
	SkCZUf0gAwx0DsWJ1+I4FQdpS2bGpHE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757687277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stx2VrfzaBsnc/jAGNYjJWhUFVHawzyDw+ZsgOSjXaw=;
	b=U6DzdkgDxVCCxLymSA3uG3OJqolQ/xE4Q1WONdHGg1wtg1Qgr3fd+Efljnb/EoM0Oi1czl
	pk9lWjGxbmWdp2PRUO43Bgz6vAjvAqRRJnBEjeN7c+uTnv6UO84RqpHApJcymgzVNHmfHT
	XbPnD6YbmqMGifrXZOktQnnXSreZjj8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-690-9Ah1jaShOdWwEaz5hdcmuw-1; Fri,
 12 Sep 2025 10:27:54 -0400
X-MC-Unique: 9Ah1jaShOdWwEaz5hdcmuw-1
X-Mimecast-MFC-AGG-ID: 9Ah1jaShOdWwEaz5hdcmuw_1757687272
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B8CC18005AA;
	Fri, 12 Sep 2025 14:27:52 +0000 (UTC)
Received: from jolawren-thinkpadp1gen7.ibmlowe.csb (unknown [10.22.81.60])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1B3071800576;
	Fri, 12 Sep 2025 14:27:49 +0000 (UTC)
From: Joe Lawrence <joe.lawrence@redhat.com>
To: linuxppc-dev@lists.ozlabs.org,
	live-patching@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v2 2/3] powerpc64/modules: correctly iterate over stubs in setup_ftrace_ool_stubs
Date: Fri, 12 Sep 2025 10:27:39 -0400
Message-ID: <20250912142740.3581368-3-joe.lawrence@redhat.com>
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

CONFIG_PPC_FTRACE_OUT_OF_LINE introduced setup_ftrace_ool_stubs() to
extend the ppc64le module .stubs section with an array of
ftrace_ool_stub structures for each patchable function.

Fix its ppc64_stub_entry stub reservation loop to properly write across
all of the num_stubs used and not just the first entry.

Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
---
 arch/powerpc/kernel/module_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 126bf3b06ab7..0e45cac4de76 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -1139,7 +1139,7 @@ static int setup_ftrace_ool_stubs(const Elf64_Shdr *sechdrs, unsigned long addr,
 
 	/* reserve stubs */
 	for (i = 0; i < num_stubs; i++)
-		if (patch_u32((void *)&stub->funcdata, PPC_RAW_NOP()))
+		if (patch_u32((void *)&stub[i].funcdata, PPC_RAW_NOP()))
 			return -1;
 #endif
 
-- 
2.51.0


