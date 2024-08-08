Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B494C3FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 19:57:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZCTDfDtl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZCTDfDtl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfvrN4gQnz2xrb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 03:57:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZCTDfDtl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZCTDfDtl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rysulliv@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfvqj71TWz2xnH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 03:56:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723139788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnjXGHCPUNPy6I5lbWUg1nMwDED9LsoqLpd8V9RhJ4g=;
	b=ZCTDfDtlV34Qxbae7ihxKV3c9wRnum6DcWrEqeHznabeg7wOeNKKZSXFj8k7YYwhVbNgHk
	M7r16TuGvzgXkgvkVotzH4s0cRrHc3FQXsPICaU/bZ5p6jb6k+3F2wBB7WXJ7T3XSobS3n
	O8J3DLVhrOw+Do1YkseGG+Pp289+SAo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723139788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnjXGHCPUNPy6I5lbWUg1nMwDED9LsoqLpd8V9RhJ4g=;
	b=ZCTDfDtlV34Qxbae7ihxKV3c9wRnum6DcWrEqeHznabeg7wOeNKKZSXFj8k7YYwhVbNgHk
	M7r16TuGvzgXkgvkVotzH4s0cRrHc3FQXsPICaU/bZ5p6jb6k+3F2wBB7WXJ7T3XSobS3n
	O8J3DLVhrOw+Do1YkseGG+Pp289+SAo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-u4IinmdXPmO35KmYYBC5tg-1; Thu,
 08 Aug 2024 13:56:26 -0400
X-MC-Unique: u4IinmdXPmO35KmYYBC5tg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 503751934B88;
	Thu,  8 Aug 2024 17:56:24 +0000 (UTC)
Received: from sullivan-work.redhat.com (unknown [10.2.17.32])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 61D921955E99;
	Thu,  8 Aug 2024 17:56:19 +0000 (UTC)
From: Ryan Sullivan <rysulliv@redhat.com>
To: live-patching@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/ftrace: restore caller's toc on ppc64 livepatch sibling call
Date: Thu,  8 Aug 2024 13:55:32 -0400
Message-ID: <20240808175552.40661-1-rysulliv@redhat.com>
In-Reply-To: <79fffe34-ce0b-4937-a85a-0ce566684887@csgroup.eu>
References: <79fffe34-ce0b-4937-a85a-0ce566684887@csgroup.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

