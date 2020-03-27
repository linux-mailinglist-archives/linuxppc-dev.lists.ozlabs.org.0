Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15848195FC6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 21:32:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ptnn28WGzDrM8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 07:32:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=FOvb4p2Y; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ptg91yKrzDrJq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 07:26:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OruPWN1Ixj5tRGMNiuRZtwhGfvIx99X0Y9SIRjmLMDE=; b=FOvb4p2YSreYESeiRLZD1bxmMN
 cJfp0e8UMQtxqwh4LoSlIoVxZV7SstEnhT8AhAVkNGWzqSSrBvrEE9uHbH52u6d14QDezdKIPWOVy
 1LCIyIY8KJUWRThD0nNnRIz6zP1jxgKQ+sC0PvHwjzH0L0lFeWBh9BK2RzhE3eTVpWlJ87KN7DeOB
 v7aMELRPzORi5owiHY7t87Or/AzaY7mvot+l+FZZW4YVyuFeXR1Z+0JyYjulLA2Utv2w9v3xWAio3
 XPWJ8r4MCu3v5hNhIvwyD48hN8SnlaF+0rNUZhvfS0PolDhMIlBzx15b7Bs509y/1nLwglEW13Lq0
 rq5y7cKQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHvYd-0003Ih-EL; Fri, 27 Mar 2020 20:26:23 +0000
Message-Id: <ddc3513dc54d15456692c80df49287fe3babe40a.1585340156.git.geoff@infradead.org>
In-Reply-To: <cover.1585340156.git.geoff@infradead.org>
References: <cover.1585340156.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Tue, 23 Jan 2018 11:33:18 +0300
Subject: [PATCH 4/9] powerpc/ps3: remove an unneeded NULL check
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Mar 2020 20:26:23 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

Static checkers don't like the inconsistent NULL checking on "ops".
This function is only called once and "ops" isn't NULL so the check can
be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 drivers/ps3/sys-manager-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ps3/sys-manager-core.c b/drivers/ps3/sys-manager-core.c
index 24709c572c0c..e061b7d0632b 100644
--- a/drivers/ps3/sys-manager-core.c
+++ b/drivers/ps3/sys-manager-core.c
@@ -31,7 +31,7 @@ void ps3_sys_manager_register_ops(const struct ps3_sys_manager_ops *ops)
 {
 	BUG_ON(!ops);
 	BUG_ON(!ops->dev);
-	ps3_sys_manager_ops = ops ? *ops : ps3_sys_manager_ops;
+	ps3_sys_manager_ops = *ops;
 }
 EXPORT_SYMBOL_GPL(ps3_sys_manager_register_ops);
 
-- 
2.20.1


