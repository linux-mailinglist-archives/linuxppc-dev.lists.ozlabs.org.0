Return-Path: <linuxppc-dev+bounces-17113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIBWOHPFnWkRSAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 16:36:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5374F18917B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 16:36:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL1z16Z53z3cPp;
	Wed, 25 Feb 2026 02:36:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771947373;
	cv=none; b=TqZADxxXLp66vhPIr9huHW2LMoS/kuASgGP7yd4QLp05410Cyc0ui8m4GLO9gtGVDmWJa3ASr+0ug1zhLuA9FCow4SziPJcseqWBShxxOx0UHjVMNvQ3nS9XQ5K1+XjDeVRZRatwL9gcJq+ui/uulH800ljRLvt0lrO5THT24kuIxtU/fMUVDyPpLAXNjpD6NTlf4rrq7YBgQY+XD3qFB+VjEXKTxtuymJWDYvPO6J7jhLA/6FDlGh+lOMUdhrnJPd6y4EzlGw7eWUUD06j2wl5Vhrr2iH7mULSg8s8is4/5oj9hTyUo7h49enhodtsaC49ktdfXOaPFvmw9ICRgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771947373; c=relaxed/relaxed;
	bh=J0m5QrjYNnqHXl9e832+w13ILtwNiaT2S5RFUJztWJo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OMkdfoezeWy0df1Qb1kbYaDo9l3ArTKSBbUtBYsn9pIQnUZ57LbXmXZ5IOudKrCQR5m1FFIActEL3v7aJhpTPzX9dgVovW+D2KSjZUF4q3vsodfYWJ6KL1QsB5PS5rn+DgNiS+dhUdBCF/1C2Jlha0pgY0SvlFlrg/YJBrKZQ01t2puheBXFoTUFVdDPN3CqVLvRf3D9C+cqlpvXds0986SRdG1uQdYgJ6l2ZYflZ8B8l09AYWgEy6m03IZCDIWe6YapmA7XkDj4cAoCYuXNkEgMK5EKObM/gQWsduEGbvCy8iYlbpRuu/e/1LcMYbJyqZCg88OYFITkfFIwnH8x7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ch4pkuOO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=abhindeka@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ch4pkuOO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=abhindeka@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL1z10zj5z3cPf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 02:36:12 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8230c2d3128so2383523b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 07:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947371; x=1772552171; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0m5QrjYNnqHXl9e832+w13ILtwNiaT2S5RFUJztWJo=;
        b=Ch4pkuOOzkZPl2q7xD8g0IDVyXy5K6Bt9kbnVowVBAKLxT3gGM80aZn0Byxv2gbVm0
         NS9J5Pw5ICh0P+3Mj8lgrPDPu6qGmcboLZ1KjT7N11xSQmmqhTjpFNIOOGOym7L6eb1k
         L8ycis2Q63N5ukUOF64z+1S7VO6d8GH/0xowpAvBbBEzzq5yxhk6pdllm5nidp/SWI3k
         TR0SlWhJjD7e4c+2RH4rbhINoict06sqIwbWLvAOz4dm25XVhoLzi3L7O6FDQlDvJCf1
         OGSmx5DjEAc9zprLy6ojO1udKEKIo2LtAlpXjCHvVud7LyyRof8EcS6hNgKFx0Fi1tll
         HP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947371; x=1772552171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0m5QrjYNnqHXl9e832+w13ILtwNiaT2S5RFUJztWJo=;
        b=Rml9g7KueosAEJL8iLECg7Mkuc773frUlOO0ScKKSQbIVKBq50RZqAU5whAdBmFx5R
         UWYvONCW6PEPXZO2DZI3f5QXr/XjI3tQmw/ECPY9uMOfZrfjqSZif0XmfmN6ut7Du1WT
         bDtm32qqAKF1/uzGOCDhrSa0oslLx4QmggZGs6beuXJjNUmeCtoVkBv0s+pHxlryv3re
         iuV1boCgJV+xJMLMKnEMexdP1z6IAeyGHHHl8VU+nKTgWk4axDS0OF87GmsXk5kS4Tfm
         Ne1bfgFglplSVu6z6RwppqrNvrQdHbxO769xDXrL4nHh9nXDTjWqtGPs/hdwPDM7yWFG
         U6xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQjgMqcV67rD0mGbkb1VOvIOvmFpgSnAsWBS7yoNXWX/WNspZo8PhdGNvrddbQlMW4r/y4EhBm6DCMewY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFHIbZmhhK66EHENOAmYzRGorLTtI7MeQUWT0Ox2aFzQtDz/bQ
	dfuvq/M1mP0vayjYg5tgpG9QaiEEImIYZ8LtVjt0r0tluKHcbxfsyhc9
X-Gm-Gg: AZuq6aKk3yq9O4FCflTsJAnL0pKvQU2j6PE1/64BaAQsmKeFtclJ14zIG1QnFBF/JoK
	1s37cmGsEfQl1j8KUo7Mnj0YFqxKPLx3E6xx+33JTfq+MtyqF0LvmKZJKnp5wIJZDkGU1gd12ew
	6ufdSqYZWnBeYqdMRBT9aWGU79EOjvDVqfsZDJ4aLozwrkaX9rZJeev713TSpGXZkKwFdDnwFm/
	ipZvuhfFAHuVeocziUObWFEXHV64147pz9KhMAsNIKO0GoJX6AMEGB6uKsfAH3d8NvMzKWi0j4m
	XfhN5/RZi9dwzcgpHn5LFuQst8ZV5iYE3SDoxS3YoFZTH/FyR5TSz62WsW6+PexjRl6svWZvp8j
	deGDrrtWtbOdoAvM+eNa5Xyn7rATQCSmg83cwOKK+da3mzjdsEOfDIPGL2QM6wodmuKHzGagRVh
	RCMqObuao4nkjBwuvLxBELxOj8UnV7D6RlgrQkdZWDzYk1Wn7+Wej8XuU4oRLSz+AxRkM=
X-Received: by 2002:a05:6a21:38e:b0:38d:f745:4d5f with SMTP id adf61e73a8af0-39545ecc333mr11285126637.24.1771947371007;
        Tue, 24 Feb 2026 07:36:11 -0800 (PST)
Received: from Ubuntu-Kernel-2204.local.tld ([49.207.50.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd64111csm10698181b3a.6.2026.02.24.07.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:36:10 -0800 (PST)
From: Abhilekh Deka <abhindeka@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	nnac123@linux.ibm.com
Cc: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhilekh Deka <abhindeka@gmail.com>
Subject: [PATCH v3] net/ibmveth: fix comment typos in ibmveth.c
Date: Tue, 24 Feb 2026 21:06:01 +0530
Message-Id: <20260224153601.17534-1-abhindeka@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-17113-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,lists.ozlabs.org,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[abhindeka@gmail.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:kuba@kernel.org,m:pabeni@redhat.com,m:nnac123@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abhindeka@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[abhindeka@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5374F18917B
X-Rspamd-Action: no action

Correct spelling mistakes in comments:
- Fix misspelling of gro_receive
- Fix misspelling of Partition

Signed-off-by: Abhilekh Deka <abhindeka@gmail.com>
---
 drivers/net/ethernet/ibm/ibmveth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 3108bf50576f..b2a578e6ff31 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -355,7 +355,7 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
 
 		/*
 		 * If multi rx buffers hcall is no longer supported by FW
-		 * e.g. in the case of Live Parttion Migration
+		 * e.g. in the case of Live Partition Migration
 		 */
 		if (batch > 1 && lpar_rc == H_FUNCTION) {
 			/*
@@ -480,7 +480,7 @@ static int ibmveth_remove_buffer_from_pool(struct ibmveth_adapter *adapter,
 	 */
 	if (!reuse) {
 		/* remove the skb pointer to mark free. actual freeing is done
-		 * by upper level networking after gro_recieve
+		 * by upper level networking after gro_receive
 		 */
 		adapter->rx_buff_pool[pool].skbuff[index] = NULL;
 
-- 
2.34.1


