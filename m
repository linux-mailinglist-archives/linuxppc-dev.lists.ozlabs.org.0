Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1375794C63B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 23:19:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=anfFgInF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=anfFgInF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wg0KM09WYz2yGd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 07:19:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=anfFgInF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=anfFgInF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rysulliv@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wg0Jg2hdVz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 07:18:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723151902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnjXGHCPUNPy6I5lbWUg1nMwDED9LsoqLpd8V9RhJ4g=;
	b=anfFgInFY4woLNGuwCL820bmBNW+LT2Sxfm4ktfZ/xiLqeX9wNGVNY668hTe/w00QVBQNb
	1StvpZqAfQq9H3EhTFRfL7GbWWfs8fcVOZk6S69bNJeDYSR5jm1d5VjdKFEj7JTHdQ41qp
	o1fTqlVWxIKLpw8soc0/ITvzY65zU0o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723151902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnjXGHCPUNPy6I5lbWUg1nMwDED9LsoqLpd8V9RhJ4g=;
	b=anfFgInFY4woLNGuwCL820bmBNW+LT2Sxfm4ktfZ/xiLqeX9wNGVNY668hTe/w00QVBQNb
	1StvpZqAfQq9H3EhTFRfL7GbWWfs8fcVOZk6S69bNJeDYSR5jm1d5VjdKFEj7JTHdQ41qp
	o1fTqlVWxIKLpw8soc0/ITvzY65zU0o=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-452--r30CwRLNoCB0RTJZ1w5hA-1; Thu,
 08 Aug 2024 17:18:18 -0400
X-MC-Unique: -r30CwRLNoCB0RTJZ1w5hA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F04FD1955F4A;
	Thu,  8 Aug 2024 21:18:15 +0000 (UTC)
Received: from sullivan-work.redhat.com (unknown [10.2.17.32])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6D44C300018D;
	Thu,  8 Aug 2024 21:18:11 +0000 (UTC)
From: Ryan Sullivan <rysulliv@redhat.com>
To: live-patching@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: RE: [PATCH v2] powerpc/ftrace: restore caller's toc on ppc64 livepatch sibling call
Date: Thu,  8 Aug 2024 17:17:40 -0400
Message-ID: <20240808211751.50746-1-rysulliv@redhat.com>
In-Reply-To: <79fffe34-ce0b-4937-a85a-0ce566684887@csgroup.eu>
References: <79fffe34-ce0b-4937-a85a-0ce566684887@csgroup.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
Cc: pmladek@suse.com, joe.lawrence@redhat.com, jikos@kernel.org, christophe.leroy@csgroup.eu, rysulliv@redhat.com, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, mbenes@suse.cz, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Restores caller's toc pointer to r2, on a sibling call this will
uncorrupt the caller's toc pointer and otherwise will be redundant

Signed-off-by: Ryan Sullivan <rysulliv@redhat.com>
---
 arch/powerpc/kernel/trace/ftrace_entry.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 76dbe9fd2c0f..4dfbe6076ad1 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -244,6 +244,9 @@ livepatch_handler:
 	mtlr	r12
 	ld	r2,  -24(r11)
 
+	/* Restore toc to caller's stack in case of sibling call */
+	std	r2, 24(r1)
+
 	/* Pop livepatch stack frame */
 	ld	r12, PACA_THREAD_INFO(r13)
 	subi	r11, r11, 24
-- 
2.44.0

