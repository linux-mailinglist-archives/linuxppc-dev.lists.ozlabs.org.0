Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC5246386B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 15:58:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3QMH50yxz3cjq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 01:58:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aziqfQYu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aziqfQYu; 
 dkim-atps=neutral
X-Greylist: delayed 324 seconds by postgrey-1.36 at boromir;
 Wed, 01 Dec 2021 01:57:14 AEDT
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3QL25hfkz3c6Y
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 01:57:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id ED59ACE1A46;
 Tue, 30 Nov 2021 14:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0B8C53FC7;
 Tue, 30 Nov 2021 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283905;
 bh=HnNEGH4yNQGvklDjY2eQMfGoP//aAe4wVVZXymkNzJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aziqfQYupOUJR7kxEdK9QqSLKI2Ml6H9oB2B7Lee33PhVOSVDXRZiJ/9TSYlvsgf0
 xYaO1+k6xdO/yBBS/7AFihN/ZMplv9pAcZDeB5Knfade2xOaHVxvIdfcUuotV2p3Hy
 bsRntE7qmo7duutHxnHPpJZ+iOz86+s/YTX23WA3KYHNyJhIWLb5clZFqa1ENxaNj3
 ntg8pwlo6YRyR+5PdGfzqJwk8ODzUlQU+5jElPijDSA7XT/N6szuql/z8GEjiGK4Ix
 QNcHDoo5PfEHpFTTEuVU2D4MZNb0hv2HbhT1W5SsfmRLaSuOfO9j9wb0Y6OQp2gOhZ
 7wQvzE3zth6CQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 36/43] xen: flag hvc_xen to be not essential for
 system boot
Date: Tue, 30 Nov 2021 09:50:13 -0500
Message-Id: <20211130145022.945517-36-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130145022.945517-1-sashal@kernel.org>
References: <20211130145022.945517-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, jbeulich@suse.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, jirislaby@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Juergen Gross <jgross@suse.com>

[ Upstream commit 0239143490a9fa1344955dde93527b09f5576dac ]

The Xen pv console driver is not essential for boot. Set the respective
flag.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Link: https://lore.kernel.org/r/20211022064800.14978-4-jgross@suse.com
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/hvc/hvc_xen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 92c9a476defc9..55a435e329470 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -511,6 +511,7 @@ static struct xenbus_driver xencons_driver = {
 	.remove = xencons_remove,
 	.resume = xencons_resume,
 	.otherend_changed = xencons_backend_changed,
+	.not_essential = true,
 };
 #endif /* CONFIG_HVC_XEN_FRONTEND */
 
-- 
2.33.0

