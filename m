Return-Path: <linuxppc-dev+bounces-17112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOzMOFPEnWnORwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 16:31:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0050189078
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 16:31:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL1sX1QBcz3cPk;
	Wed, 25 Feb 2026 02:31:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771947088;
	cv=none; b=SPvEdh+4jjowkr+683IgxRmC7UtNZzKfzXyW/0LoyfPDiFlIJoHQxmNBHndqmNzm9dZUSPVDpb3JczQVALjf6LaqiwjaXxc3FzkGv2OohHhq9Ti2WdUMBhNhM13Sz14CUXEISgM0IIurgKXR99zhUSILSrsLTmD3ocZL7U5mqvIOj8eMrhA857LZ6a3NH5dSgkNMR4MoPsoaMJeryPaosqrINy7Ry3dtL+sVUqN3P3L00l2aeImjM7GQBwLO6AANcJeuI4G61s74kfXViTPjVZi2FNP9KvNbQdGaI4W3BIC4H9KSMt6kkE2LPmKLF3JSVAcNzn2Q8p/iRvWUmgzPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771947088; c=relaxed/relaxed;
	bh=J0m5QrjYNnqHXl9e832+w13ILtwNiaT2S5RFUJztWJo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A1ChGGLPAxjRsw2n6nwdHJheDNw8KNU1Jzi2F4EywSrP6jZ8cBYZFn/EB4lIdz6RNctLK9+8pG/iTDEca4bwhT8v+HNeksVksn662vJPXfRl7JCPIdiKkZVMLXyCJBfI8VDxY9tGbAyfI6cF3rFk18N4yd0N8+IGC3g1b3l7ZvEEnQJ6xEj8J+m9RVZX63axGXCDlO+0gj5alQ/Ruo2Iq+PWvWuc31O3hWtZwqAWveEXBbYYKnXTj1Odlz0wfEoCxUNSgeh9fhffkxbI6xZuuvjQE8NehZEWh9F1OFt4c59HoVABn3/SkB3X2RJmGEnsc0n6cwk5CFmAS9pc0TWpDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K9KCFW+Z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=abhindeka@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K9KCFW+Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=abhindeka@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL1sV5rBKz3cND
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 02:31:25 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso3070092b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 07:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947084; x=1772551884; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0m5QrjYNnqHXl9e832+w13ILtwNiaT2S5RFUJztWJo=;
        b=K9KCFW+ZhQp3nerB9Q+knIf5WJhfuBiLORuKVMmSUAwsZd1ui+uhJ3donfOnQ1OlRJ
         zj5KvP4V5KQqc13NwtmfLJx/73WFGS2W8VJYxBdt7i5YLH3herP5YGqoxXI+Hnv2FEPh
         GgCD9owXuwiYQZGVE0QIG+xkROvGwykWxjlmE1rr1xV7+PsMbVGZrILGyc2BielHMFqw
         I/oZo08VxWdA4rWzTbvMmbIs/iXpyGohB5BBChAMVLFya6N0cSDGjhGNVYbvszlGn9nE
         7zQQWfGgMCf+8X+FHrpxlwZTyqdmvtoahzR47ht1qMsQPenEj8XMbCWoJQvs815Zr9SL
         A9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947084; x=1772551884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0m5QrjYNnqHXl9e832+w13ILtwNiaT2S5RFUJztWJo=;
        b=SAGMsOrDEB3jGKa0U8zFytgWqdZcY02JE9QC63g5Ezw7CfHm07ArWufIIfhsnpF0lk
         cLqKhMSOM32pT92QAmr+fDNYVapHkRVCUpvAvpoBJ2rsc5hy9VIGdcpEGR4gHnfMIke4
         uefJH2iJtKolBChh+IjHCVbt+8cbUEsr1YBMHD1RLihT2yQ7T0fUuZL4B8OYiCQQhgi/
         jGZJ/PY2vJAjFPdeeDGoE3SMn5uP3ZKp7oy99Qp7VfZmYxKd2da+g/RY2Fg9tm1v62Gf
         uqaP4EkVn78vsVLR+yj3dAXsuBL1Tfh2IHQ5JBoxxT2b6Zj3RuobFv91azCy4nR39P1D
         aRCw==
X-Forwarded-Encrypted: i=1; AJvYcCV4X8r6e2lyN9M/CGTdzdy9puk1HLUaa80SHy4MIc66ScJYo2hjURB9t7FGkFjS+bNRUkDnq0vp5pRD6NQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtzF4HQLu5TkBoqyjfJ5Vh1NabwfEjOPTTF25V5+Xxl9Tg01E9
	V/69W3dzuBcJY/ArKwputIo1wbKUvBaxd6y4EBzLTbbJl9rP8y0oW6wv
X-Gm-Gg: AZuq6aIMX/wU35xk+RT1ak1uxSZmdc27e17DX91dgWcz01heoRCWlV/dn8PTR0pwjqr
	whUWekJOKmcYkjD3DIJIYA/LCGAO7QF0XjeP9auG2pfD45OfNmTYyfB1UlnEfb0pFuKvP8Sa4Ms
	sUHzqL4+WL9vISx8T3zyY4ltUkTc3RsSiyWMaYmLcp3Ao78UsN7QQC1yW/uUBGGX4p1Z2H6Wf1+
	Gj2g7j6bp7XFH7ebhsoWW4GB+m5LljLjWAfem3XyWBw6muqefUQ0dP8pye2kq2IHxyJBobQfwlP
	jfh5SreXyHXYXH0otZh7LdwpoEwGYbHNz86jX+Hk1KkwZzolszB1LaJWgje++8nUP1+bFukwn/c
	IDx9oMpnySszK82q+Rhpr1CHKz6AHk2rcfUjCHk/lQSS/I1M1sIv8CyiEFEr32WGjKYg5ECyJ8w
	VwGTze25tKaKxAwZfDgzAr3F0L0u7h9QR9nBv7DOKfdodp04yp/BjIhg7b
X-Received: by 2002:a05:6a21:4002:b0:363:e4d7:2c34 with SMTP id adf61e73a8af0-39545faba5emr10493737637.57.1771947083953;
        Tue, 24 Feb 2026 07:31:23 -0800 (PST)
Received: from Ubuntu-Kernel-2204.local.tld ([49.207.50.26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b7243c24sm11028389a12.22.2026.02.24.07.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:31:23 -0800 (PST)
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
Subject: [PATCH v2] net/ibmveth: fix comment typos in imbveth.c
Date: Tue, 24 Feb 2026 21:01:01 +0530
Message-Id: <20260224153101.16935-1-abhindeka@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-17112-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F0050189078
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


