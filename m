Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40800782BCE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 16:30:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=G3N0xAP6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTvyK0W6Lz3bVS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 00:30:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=G3N0xAP6;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTvwV4qnxz30f4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 00:28:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692628106;
	bh=JSQz2fnPPdxJ2xAhLIxqj2VO0cxHotDMQFfkCUC23Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G3N0xAP6Jpohw92DQHlOpN9/b1ogbYyb6COFatVwBgvI2f7w7/ZBn69JODJIgz5ZN
	 7a+z4f47ZsgIRlvzgFSbHDu5zjWP7daxwIC9Tz0IiRcKral9gmEFeo3JLty4HNIjHr
	 BkHcSGHH92osgzi1toRvOB478iNfiEVJujtzXZmVDCvB00lWIvIazJk7YJG9C/MSU9
	 ZV0/EwCfrk5r+vZxGanz7bInLjPc+zpxim3GwFJFjxIaCQkov50Vd0e9O+n6sRoP9/
	 hM4EcA9ikZP3w4VJ10jU39JQmcEyutPQjZN+HDcjhf3a9KvTKTL3xvCszth5nRlCE0
	 p1h587Iy9r4Lw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RTvwV3N8tz4wxQ;
	Tue, 22 Aug 2023 00:28:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/powernv: Use struct opal_prd_msg in more places
Date: Tue, 22 Aug 2023 00:28:20 +1000
Message-ID: <20230821142820.497107-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821142820.497107-1-mpe@ellerman.id.au>
References: <20230821142820.497107-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: jniethe5@gmail.com, mahesh@linux.ibm.com, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the newly added struct opal_prd_msg in some other functions that
operate on opal_prd messages, rather than using other types.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/powernv/opal-prd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index 40e26e9f318f..327e2f76905d 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -221,8 +221,8 @@ static ssize_t opal_prd_write(struct file *file, const char __user *buf,
 		size_t count, loff_t *ppos)
 {
 	struct opal_prd_msg_header hdr;
+	struct opal_prd_msg *msg;
 	ssize_t size;
-	void *msg;
 	int rc;
 
 	size = sizeof(hdr);
@@ -254,12 +254,12 @@ static ssize_t opal_prd_write(struct file *file, const char __user *buf,
 
 static int opal_prd_release(struct inode *inode, struct file *file)
 {
-	struct opal_prd_msg_header msg;
+	struct opal_prd_msg msg;
 
-	msg.size = cpu_to_be16(sizeof(msg));
-	msg.type = OPAL_PRD_MSG_TYPE_FINI;
+	msg.header.size = cpu_to_be16(sizeof(msg));
+	msg.header.type = OPAL_PRD_MSG_TYPE_FINI;
 
-	opal_prd_msg((struct opal_prd_msg *)&msg);
+	opal_prd_msg(&msg);
 
 	atomic_xchg(&prd_usage, 0);
 
-- 
2.41.0

