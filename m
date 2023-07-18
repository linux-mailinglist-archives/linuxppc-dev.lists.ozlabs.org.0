Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA77571B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:21:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=cygc5OSx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4jPY2580z30Qk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:21:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=cygc5OSx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=shijie001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4gyx1xzJz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 11:16:54 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4gyh3Pb1zBQsl5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 09:16:44 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689643004; x=1692235005; bh=J9z0K2+84DoDvde/ssEFJqweBjV
	qXi6Xd6ylgi3yydU=; b=cygc5OSx4DQqdNr/TS9dPcht/aJjAf0RzQxefAWwEUS
	mrYDNaurzcOvvqIbEm04d3O96WSoBKlGXjx3Xfc4KOKQEP5hvlMPIwapKMk5XCM4
	t9FC3LkNwdXFQ0+7DOwEEemUU0Oa4saxJ8PgLOfrN9vd+zWJrCtSKnUfPCJ8DRv2
	7oS+hnipJvIaKmhyfecBRbkUJ2cXPyJFqKQBvEfjQPAufYambmj+hvFtnoeXBOR6
	/TymHkfS4VrTsJnBHBha8KZ39+93xIlgvZYJqpcJgrG1wlSejMka4914CqkqYZn+
	egH2FuTs46zkox3QZZmEw2WJoPeoObvu/VfU+PB/p6g==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Jmgmpwf-ijkv for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 18 Jul 2023 09:16:44 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4gyh0c7lzBQsl6;
	Tue, 18 Jul 2023 09:16:44 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 09:16:44 +0800
From: shijie001@208suo.com
To: geoff@infradead.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ALSA: ps3: Fix errors in snd_ps3.h
In-Reply-To: <tencent_2130AC270179617F92DB16AC98CB57239507@qq.com>
References: <tencent_2130AC270179617F92DB16AC98CB57239507@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <4141ec70d3f6115eee4b14a914dc5e1c@208suo.com>
X-Sender: shijie001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 18 Jul 2023 12:20:04 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following checkpatch errors are removed:
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Jie Shi <shijie001@208suo.com>
---
  sound/ppc/snd_ps3.h | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/ppc/snd_ps3.h b/sound/ppc/snd_ps3.h
index 8b554a79bc14..63bdb8ee3953 100644
--- a/sound/ppc/snd_ps3.h
+++ b/sound/ppc/snd_ps3.h
@@ -69,11 +69,11 @@ struct snd_ps3_card_info {
      /* dma buffer management */
      spinlock_t dma_lock;
          /* dma_lock start */
-        void * dma_start_vaddr[2]; /* 0 for L, 1 for R */
+        void *dma_start_vaddr[2]; /* 0 for L, 1 for R */
          dma_addr_t dma_start_bus_addr[2];
          size_t dma_buffer_size;
-        void * dma_last_transfer_vaddr[2];
-        void * dma_next_transfer_vaddr[2];
+        void *dma_last_transfer_vaddr[2];
+        void *dma_next_transfer_vaddr[2];
          int    silent;
          /* dma_lock end */
