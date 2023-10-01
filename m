Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B246E7B44C2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Oct 2023 02:02:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aY50vHx/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rykm04jqWz3cf4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Oct 2023 11:02:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rykkx3pB5z3bwb
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Oct 2023 11:01:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8JOzdz2MFv/hofQCEiBSlk+fe2zZYPTTLqOrgrgxTrs=; b=aY50vHx/8TJHs4pwYHtSuo1O5S
	1EsyaGWg4BrtrGszYUgzlr94t/eiQPICWutIAGdZZy9IKRehjHBzzxmCDLkqWzlIf6iP8KFd0udpB
	3WXed1UDAYg6Q6G3ge7aU988Lj7LrBFwJFCju8L0sl9B4FOzn6PTMbeBzYHRFOCMkXhhqix1lm+yU
	1K+4l2iHJYcF9dAmvkxI7LtSkj9596mou/lgKTCPXfUo2l0f4SRzrfkTKLdIfVk7EHQIdQLwq8jtc
	90J/rJkHzUDqVI6GuKZ5HEoY7IXmm4mCnmXSQ8+pmc+43mCSmkykt1icHrSJUG1cCFxvhefb64oD6
	PjceNw7w==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qmjtR-00AFOE-2u;
	Sun, 01 Oct 2023 00:01:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] soc: fsl: dpio: fix kernel-doc typos
Date: Sat, 30 Sep 2023 17:01:05 -0700
Message-ID: <20231001000105.26766-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231001000105.26766-1-rdunlap@infradead.org>
References: <20231001000105.26766-1-rdunlap@infradead.org>
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
Cc: Roy Pledge <Roy.Pledge@nxp.com>, Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Correct spelling of 2 words.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Roy Pledge <Roy.Pledge@nxp.com>
---
 include/soc/fsl/dpaa2-io.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/include/soc/fsl/dpaa2-io.h b/include/soc/fsl/dpaa2-io.h
--- a/include/soc/fsl/dpaa2-io.h
+++ b/include/soc/fsl/dpaa2-io.h
@@ -22,7 +22,7 @@ struct device;
  * DOC: DPIO Service
  *
  * The DPIO service provides APIs for users to interact with the datapath
- * by enqueueing and dequeing frame descriptors.
+ * by enqueueing and dequeueing frame descriptors.
  *
  * The following set of APIs can be used to enqueue and dequeue frames
  * as well as producing notification callbacks when data is available
@@ -33,7 +33,7 @@ struct device;
 
 /**
  * struct dpaa2_io_desc - The DPIO descriptor
- * @receives_notifications: Use notificaton mode. Non-zero if the DPIO
+ * @receives_notifications: Use notification mode. Non-zero if the DPIO
  *                  has a channel.
  * @has_8prio:      Set to non-zero for channel with 8 priority WQs.  Ignored
  *                  unless receives_notification is TRUE.
