Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E96B7F28DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 10:25:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XMaaAFxt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZJqy3gmfz3vnc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 20:25:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XMaaAFxt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZJp01vzTz3vg5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 20:23:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F44E6175F;
	Tue, 21 Nov 2023 09:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1A6C433C8;
	Tue, 21 Nov 2023 09:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700558595;
	bh=1ot3xOBoOP7h0U8F/4uFP8Qnn04pPCBCsYAQSIl1nS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XMaaAFxtaDDQ56o7fXs0QGyJcFgyPvsmGh4mwdScBGVHv6QbGWvjUyLtBXJ/f+KuA
	 ES0RVOIH2egtSF87/OHQecYS33l9Spw874MqkkK61gISBS5zFMgvG9tTjmiWBAvPTB
	 ATJPBITN4yxZB9bPfXrJfbnzHQp0FdmotvxpyqJW/ocA/UfrLslKHaIQbbAdaby4zp
	 QwjGZqMr4CZ0qPCu/+NaBP2kBb4DFEHQZBwpcBaIN2IJ8SaG75NZWm/MJfKYBLjObi
	 uCBIjbzCMh+ZNi5Z6jiBQQRevsVtxJ8GWrV4auGzSjcn5+SL6YORjtdCp56fcZ1ApB
	 ockXOFliS6RKQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 07/17] tty: ehv_bytecha: use memcpy_and_pad() in local_ev_byte_channel_send()
Date: Tue, 21 Nov 2023 10:22:48 +0100
Message-ID: <20231121092258.9334-8-jirislaby@kernel.org>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121092258.9334-1-jirislaby@kernel.org>
References: <20231121092258.9334-1-jirislaby@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a helper for memcpy(buffer)+memset(the_rest). Use it for
simplicity.

And add a comment why we are doing the copy in the first place.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
 drivers/tty/ehv_bytechan.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
index a067628e01c8..cc9f4338da60 100644
--- a/drivers/tty/ehv_bytechan.c
+++ b/drivers/tty/ehv_bytechan.c
@@ -143,9 +143,12 @@ static unsigned int local_ev_byte_channel_send(unsigned int handle,
 	char buffer[EV_BYTE_CHANNEL_MAX_BYTES];
 	unsigned int c = *count;
 
+	/*
+	 * ev_byte_channel_send() expects at least EV_BYTE_CHANNEL_MAX_BYTES
+	 * (16 B) in the buffer. Fake it using a local buffer if needed.
+	 */
 	if (c < sizeof(buffer)) {
-		memcpy(buffer, p, c);
-		memset(&buffer[c], 0, sizeof(buffer) - c);
+		memcpy_and_pad(buffer, sizeof(buffer), p, c, 0);
 		p = buffer;
 	}
 	return ev_byte_channel_send(handle, count, p);
-- 
2.42.1

