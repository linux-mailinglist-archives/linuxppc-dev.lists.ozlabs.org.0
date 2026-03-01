Return-Path: <linuxppc-dev+bounces-17460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OLyJjaWo2lPHgUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Mar 2026 02:28:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748AF1CAB27
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Mar 2026 02:28:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fNkwK2t5Pz30MZ;
	Sun, 01 Mar 2026 12:28:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772328497;
	cv=none; b=GIcFTDChnVHi4kM1I3m3DgBv+kg4XitbXnTeP0KHCZAN3rTyKAgSxGnCaUIZcd8G9A2J0L9eD6HwmFOEJdBdppE58tohzs61hQnaycpaUZpDTwUQQ1HuIT8UXwPCqAN43dgN8c/+cnqQSHcPDcrkf+ieb9vrAhooyXZWoxbGHLKbhbmznzAVK8fhQTimWBAVx7YE5pf5DsBcqgjm1M42/8laiUCZlRPLbXMXipfyKN6aMP/dGq013OcK1q1PwZAc9/17aiKMQYUPH7BnxROYQcXM80aanxrzPluFcGWmF48kGH53JWYpLAOx1bWlZgIoEPoVRdBn+UwK3eKo5g8sGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772328497; c=relaxed/relaxed;
	bh=SSpUrKO3s0lYb3j7CKqp6Wl0C/OOc5UVBpY+DCd35tI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OqSZOr728Wz5/uLPM/pVXmEto04TDRsx3D0Xks8uGtscUPVJC6xj3DDPXMJjifEgGSRjYGG68cwm/hBBgkN5FIid+dSt+XVGR1ljCJ3qxdUiutzOQJbyGaQbtZH6N8F0JaGCHdVIE3Xm8QpS8skVkgTTkRuQoSgW+ePNjIio2wuG1t+BVHK448z+gRC0ZqBwMH/X0uT/XwP1b8Pty6WhZctVc1feD9UDweObzXMvdT3vFNGfZlAnXZvbIWRF6Er4/ZDGyh4BNESUGs34nhB7YmYla3cD5OWmZEp82Bo24LABhTM4k+bni/4hHC4xek8xdwZ8wibGgprGjb/Vj8chkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i8Vo+ttC; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i8Vo+ttC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNkwJ5KS0z2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2026 12:28:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78BCF433FB;
	Sun,  1 Mar 2026 01:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE031C19424;
	Sun,  1 Mar 2026 01:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328494;
	bh=caGLC4eiAMQuTnRrjh2L4wlwOWWY1jUeLUW3d4w/g0c=;
	h=From:To:Cc:Subject:Date:From;
	b=i8Vo+ttCsB09oz4w2xuwNtQViEoT+KhsJ/C5HycLyVfqP2jkEXs7Ru4/q5+Q5RRUR
	 OdwSaPXO523RMSljTiHwt/KjHw6jYv69KvVni9pm1o1aSxknD9gpLeIxPpdVAzSGJf
	 +VAU+N+zhoPd1P3l8wBkjmkTIFOpyI0z0JHODSEdG1ynla4xFlMgS2q40eSqB7OxUH
	 xYtQe9minaICWyUqSi0d+yd7Bkyw8Tu44cSdL3+UoHRD54UQaCa4DMR8WhBJCTjn7v
	 cB4sMo3e4srkld38A3wnE7pO6v+J4iPgW5YYSjGtnus4ZBsAcSp8rAx3iR+CDhUysV
	 T9w3EX3KOkLPw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	fourier.thomas@gmail.com
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: FAILED: Patch "net: wan/fsl_ucc_hdlc: Fix dma_free_coherent() in uhdlc_memclean()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:28:12 -0500
Message-ID: <20260301012812.1685923-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
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
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17460-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:fourier.thomas@gmail.com,m:chleroy@kernel.org,m:pabeni@redhat.com,m:netdev@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:fourierthomas@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sashal@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.931];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 748AF1CAB27
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 36bd7d5deef936c4e1e3cd341598140e5c14c1d3 Mon Sep 17 00:00:00 2001
From: Thomas Fourier <fourier.thomas@gmail.com>
Date: Fri, 6 Feb 2026 09:53:33 +0100
Subject: [PATCH] net: wan/fsl_ucc_hdlc: Fix dma_free_coherent() in
 uhdlc_memclean()

The priv->rx_buffer and priv->tx_buffer are alloc'd together as
contiguous buffers in uhdlc_init() but freed as two buffers in
uhdlc_memclean().

Change the cleanup to only call dma_free_coherent() once on the whole
buffer.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Fixes: c19b6d246a35 ("drivers/net: support hdlc function for QE-UCC")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Link: https://patch.msgid.link/20260206085334.21195-2-fourier.thomas@gmail.com
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index f999798a56127..dff84731343cc 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -790,18 +790,14 @@ static void uhdlc_memclean(struct ucc_hdlc_private *priv)
 
 	if (priv->rx_buffer) {
 		dma_free_coherent(priv->dev,
-				  RX_BD_RING_LEN * MAX_RX_BUF_LENGTH,
+				  (RX_BD_RING_LEN + TX_BD_RING_LEN) * MAX_RX_BUF_LENGTH,
 				  priv->rx_buffer, priv->dma_rx_addr);
 		priv->rx_buffer = NULL;
 		priv->dma_rx_addr = 0;
-	}
 
-	if (priv->tx_buffer) {
-		dma_free_coherent(priv->dev,
-				  TX_BD_RING_LEN * MAX_RX_BUF_LENGTH,
-				  priv->tx_buffer, priv->dma_tx_addr);
 		priv->tx_buffer = NULL;
 		priv->dma_tx_addr = 0;
+
 	}
 }
 
-- 
2.51.0





