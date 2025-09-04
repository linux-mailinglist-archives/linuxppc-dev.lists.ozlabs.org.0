Return-Path: <linuxppc-dev+bounces-11749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543AB4454E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 20:26:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHnxk1gsPz2yx8;
	Fri,  5 Sep 2025 04:26:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757010410;
	cv=none; b=XAsinU0CjBqRl4NgaX722kxIX8frjrYp9m4HlEC7Pe/xOMmqzGEa0qwDFgFzcuJmU1js1HyzcGX6WjAtxFgD5Am9MFIbBCwkex4D2yHgTe2v/5v8fxDJiVySKmHo1s331SG+L1MGfqLIt6Z5UWd3m/ex3vHgoGJXsdgjaatTfCClFOr1Xh2gaHtuWBZFSA32PoMiM/nvOiDltPsAlQdiPyQ4uPmcxFPbKdyWboBzws7z7TSzj0pjO9Zyo9zY3yMUoiy2t2ePDROEy7DUvCnWSMDA8zgBAjlVeKIHMPY7GTjEggrPha7pw4HEOSTllHKYFMWaQz0/Pl5bNdVWlng1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757010410; c=relaxed/relaxed;
	bh=5gdcw5+kk8GJYnq26nabHq+jr0MaRzxnpeLi3OPAGLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XrNi6dBQVV4SSE8ojWElAsmNt0b9gAFlv9jj0H+H3768C5jQu/D78T6ftkirZXDHE1ocL7t/DOwzgsCulX+h5ByVLNJC5mj/70zRY7MmuZHfHr8BUfKvVcsdiB2NbAsA2rE/Mv6mCESl8ABmlS5Xqbj0BZKkahht+zDnCJlCQESAyfHKLZbTrAcXMzH8ZiWH/WQKm6tMkthjNz5hDNEX+4V4p6cc6mY6hphaDvQJT8VXnp6u4Rl8o6drqXEn59vuOUxjkEZZ87GlJU6KiQaYIbDdet7/I43obL/Lw6ZwjujpKuFHy6NI47WtMRj19YHHjslYSa6BFmscRNXKkScdGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y+4H1o6Z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=vernon2gm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y+4H1o6Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=vernon2gm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHnxd57Htz2yr2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 04:26:45 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-77269d19280so1219981b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Sep 2025 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757010402; x=1757615202; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gdcw5+kk8GJYnq26nabHq+jr0MaRzxnpeLi3OPAGLE=;
        b=Y+4H1o6ZgqVxUV1ZR0OMAgjHZftrYBOvZ91g2/kfvFK1MEnc53tC5nj0CTBms3Omcr
         +bz7RR1thdy2UF8LsF+zzdzKeHZ7DPmywgvmYpi28nouSeXyAUWumRo92RG6pnIWwGhJ
         +JFtkUcT1LEpWr6RBoZ4h+5VsNLA4AfhKu7yg+X36MVLGzwhzkxHNch0N6oNHRFi+V/I
         FvwOzKoICswmC/VuE9UJ1zYdPG3c3fZqaNQutlxKWAcE8R5EEQwPXfMBLb886CKe3vpQ
         ktM74wLwQUgL3714iR0oSJsYL3L11eFtPX2y///UqxmDb/ns4idpZM8dyJIkQTmoBhKI
         v9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757010402; x=1757615202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gdcw5+kk8GJYnq26nabHq+jr0MaRzxnpeLi3OPAGLE=;
        b=BR4NQgrpB0GUZdQ+ohkabUaMkY59ljO17mG98Ef6fHiwwADYLmBqOMFwu/InyA1+nj
         p5ss+9aE45gLrbnpPn7M/DgpjExrjbmvNbfn2TVcVU/57/gashIFRlGRV85lZbDwNXls
         RD829pz0PZ9KsIudHHfRpZIKiPycQZ3Xx9qi+CYzbKv87H9aZNn3i1n5fKcSxPIMhSZn
         Qy35rTnrJvo/g9grmm4pFRk2vcOJryM42jrEjqsKQOvXRRAVTBUBTug1rUI3mvIDs2VO
         Colu6dW8dc/I87s/rGc7cGgzoqUgAUHFnpEcwMdpHZprPT2XRO38IXMdvWGop9gW+SHh
         0vRg==
X-Gm-Message-State: AOJu0YwZiUBqbQDukkvw3bI6NwyIF0zeAmlv5HAq1edOTAtBR3ymnWzt
	EpyMqcYkDARWfbjHIDOJmwjQAffN5e/LPyPWfYpnsncdi+KIWRm/8LWx
X-Gm-Gg: ASbGncs5lDzsjAgL0mjvniB9SoGjt7G6yoFuwuzidt5OyKo/GINa+jJJqXjOL0o4mCf
	XiTzCm/aNE55fGA3+u/3rYeMN1aLIZqg1+P7XNlwjZfaQjeVjktPygnGr0YNk3OK9jcOair9VWl
	v6WMnOV3Uws5rgkExuAXx0OQcoEoJnTL45nV/xskpN2U/3jWDO9aBEG8XMCY0CuXwTD9jAN8J8B
	RDQ095uA7Azr1BsdAAab96B69MKbnWopQccYNcL+CqTqd79HHLTYBv8rdT9BUqPGTFJcp/9zFsq
	T2kTu3IfjiEiZk/5vlPP9ifXKQIKl52Uf7n2TXFthn3kAYWtWA46Me0RI7+5ijv7SGPYowuu3xR
	OIgfyHaXS82o3K8On9mhV1fss3uUMaLrA+JXCdn8QFtjVBA==
X-Google-Smtp-Source: AGHT+IH81PMCdp/2u2qs34vVDtDTssGYFzTlxqvPTinJ+Y0m3QBdAADZkUB6nGb/7qYroCr76cYnXg==
X-Received: by 2002:a05:6a20:2588:b0:248:1d25:28b1 with SMTP id adf61e73a8af0-2481d2531demr10262298637.21.1757010402072;
        Thu, 04 Sep 2025 11:26:42 -0700 (PDT)
Received: from localhost.localdomain ([180.121.189.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006dd49sm17883117a12.5.2025.09.04.11.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 11:26:41 -0700 (PDT)
From: Vernon Yang <vernon2gm@gmail.com>
To: mahesh@linux.ibm.com,
	bhelgaas@google.com,
	oohall@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vernon Yang <yanglincheng@kylinos.cn>
Subject: [PATCH] PCI/AER: Fix NULL pointer access by aer_info
Date: Fri,  5 Sep 2025 02:25:27 +0800
Message-ID: <20250904182527.67371-1-vernon2gm@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Vernon Yang <yanglincheng@kylinos.cn>

The kzalloc(GFP_KERNEL) may return NULL, so all accesses to
aer_info->xxx will result in kernel panic. Fix it.

Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
---
 drivers/pci/pcie/aer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e286c197d716..aeb2534f50dd 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -383,6 +383,10 @@ void pci_aer_init(struct pci_dev *dev)
 		return;
 
 	dev->aer_info = kzalloc(sizeof(*dev->aer_info), GFP_KERNEL);
+	if (!dev->aer_info) {
+		dev->aer_cap = 0;
+		return;
+	}
 
 	ratelimit_state_init(&dev->aer_info->correctable_ratelimit,
 			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
-- 
2.51.0


