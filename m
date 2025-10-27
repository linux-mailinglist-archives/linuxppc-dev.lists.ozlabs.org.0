Return-Path: <linuxppc-dev+bounces-13323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFC2C0C646
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:46:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6YN1PDNz3btd;
	Mon, 27 Oct 2025 19:46:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761554776;
	cv=none; b=IKYYoT//a9myf+BYfzm9DHSbnonTvIeJ60/NOl2VXa4HkQIvYts65XMTRoRBG7MYOQpC3SwKUixV1+Sw2Otp5m8NBMexzgMfs+4pharD9v8haJBXkAaBErXu0gPal5tVu/RHqwV3XOoxIRzb9Xhs/xatzV0TvdeFybzN5UGvnC3jhf32Rt7XsM2mTQ58xou/kcoTwQ60WRWyDBcDjDEeiyE53/ISSltUovUFxg/PdhljbDJj5RzKGcXfttvD0m8OkrWFHR1yBKeUXMdVFe47Jok3HWEMwQkvoE/06Md9ybG/wbHyJnzRvD0OH95vOAd7j+9t6FTFV13P8T9fR9TRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761554776; c=relaxed/relaxed;
	bh=KYXicRyMzFG54clHK8f3TeDGrtRhrioeKCXtreOKP9c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dvWt+k+xgRJs6VoiliWzwLsPlLukKB6v0s4Y+hUz0AF3S69YEIlTuMjVMdQ+GNeVedhKMk+ggtGAUbPjc4Hcz5utA9a5uEwjYhlAaFp8ynSUuwm/uEMQW9aDOvxjKX75WLBcXgAl2WXdRmssWuzWoXBUq7sIqzEMUAAhmJw4Axh8UhYFzeeFyAq9slsyIdJ7GMxaJFJKntKJL4q9no6JjGJZby88Tww7fD9+UsO2tuH4L5p9Kq5N8vB6Ocu3XIrSPp+cXfKFbk6hed67oyzyFrXIvt1sS0UoeY3NailTMh/2eIo9CpejhVTq3235uiRlSyMPaLFvnlZZKuR5214yIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VpDLK1yZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VpDLK1yZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6YL38nqz2yw7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:46:13 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so4145296a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 01:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761554771; x=1762159571; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KYXicRyMzFG54clHK8f3TeDGrtRhrioeKCXtreOKP9c=;
        b=VpDLK1yZ1YU4JM843OKwesxikOIJHlf9vaaICIGkDqedeEJ8drO5W+201+u3PcW1if
         5LZ2Wh12xhGTYxKNiCXM2mogPZvB+kwN5ZsjfS+1aqU9QDOHR9YvgfqzLdvFJAp8TtCg
         Ue1OqTg4GARG5CPArPYvijT8lXCdg3aD/d3og721XBfMFTJntNWDXSTGnzuqz6fb1I1s
         f9gWuzzJ+r+NVI3XAfSktHiIPi8EHuP4Atxy/PBC08vtTjcAbP3w/ksZttHKVQKpPpor
         1M5YGNRXDTYHY2lvP6fKy5b374yH3ZD9LUajq5TocdZQZ1TX3IVAGhjri0MovsfUMXhF
         2few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554771; x=1762159571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYXicRyMzFG54clHK8f3TeDGrtRhrioeKCXtreOKP9c=;
        b=qwc1QByuCDdY95tNnH38/ATSrGJ+lkvTisjqpK0My8iNgUEedAAZ5jaYsmdizLl5AX
         3jpQekYcgnU3F/tRlf+HBunsPX/gwj/t/kbmT14QTO7e/K9OLkjjh9HaMYvpzd5sQ3Gi
         VstGTQjLTwwYmdrmlietFQw/3dPPI3StlNc8/zV/hfEyFHnwMBtgrz4uixfc7Wrkppq5
         lq64c+dJXu3aoLLfW0UathWF6m1V9KL6gyDcUe7m6g7JrLm+meECsDQYDBSxcFwECM/N
         B7ePLeOEj/yS8/A82pn2uoPCOEeu475NNDFEuCUxh446PFEDm/v7yYLQ4Vx7efTd96Dt
         YoEw==
X-Forwarded-Encrypted: i=1; AJvYcCWsjySSXDBVu95MdnTFaCHmaqrrObAQpiE/OlgBSjsPnOaj7iUeAZw+aXccJ+FTxz8hbVsr2prqHSE0PpM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyKlKGo3wmnL5YTbu5d0z69h/dwEmPbeOl1tNCHSua5x7ufIKPo
	p+n5XOg9MPcTqW1r/k5SfGLlHfLjqe0Y5sidQnvLExP0om3RGN+XvPeO
X-Gm-Gg: ASbGncsreOBm0SPzBhUxAfUprwQQz9EKxJ5djxhct+lze+7BfFYaR9HQShQIDH41+t8
	GOZnSN5q7w98W8UesMSQcfLfTW0GLUHY5pd1PGdymwtVWaxp35FaPJP5WjX+OLmMx77BEhEmldN
	+anpD9sl2uxi9+ODD44FCK0VCdC+ha5/XXw+p/aqWHYQtI2eMaZdcSVEiiZk4x3eguy7MDO9doI
	XxyQ9Wm3XNASNapgXv50XYED1/T+We6FQm1FRLkkkoKmSm/NqeozSqYSaNv+4USkrCM5OPOvmgz
	kvPkEOOGzUcSipB3zgWSzmc86O+KyUnij3nsilF8MJmSgb/7DwR/Wgss4KDQ48fGTcTkESJ+XEn
	fqvQy4jxBMyqvoJlX1MaTBPhGXemtjHNjs0l8Sh9LmuY7xWgxbsiJSb+6E1ELiyBTbUXcnqyIO0
	o0rZT1wsxG55EnjTa7czCBSvvGmlcJrQmE
X-Google-Smtp-Source: AGHT+IFtc9o9JCh/bKZQgDfAtOs/Qjpo1vXU+pF6273boM1sbWl2NHlxbrCZc5bY8n8bBNjS0zBNHg==
X-Received: by 2002:a17:90b:55cf:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-33bcf874448mr42762102a91.15.1761554771534;
        Mon, 27 Oct 2025 01:46:11 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33fed7d27b2sm7703951a91.4.2025.10.27.01.46.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 01:46:11 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@ozlabs.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] powerpc/powermac: Fix reference count leak in i2c probe functions
Date: Mon, 27 Oct 2025 16:45:53 +0800
Message-Id: <20251027084556.80287-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The of_find_node_by_name() function returns a device tree node with its
reference count incremented. The caller is responsible for calling
of_node_put() to release this reference when done.

Fixes: 730745a5c450 ("[PATCH] 1/5 powerpc: Rework PowerMac i2c part 1")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index 02474e27df9b..f04dbb93bbfa 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -802,8 +802,10 @@ static void __init pmu_i2c_probe(void)
 	for (channel = 1; channel <= 2; channel++) {
 		sz = sizeof(struct pmac_i2c_bus) + sizeof(struct adb_request);
 		bus = kzalloc(sz, GFP_KERNEL);
-		if (bus == NULL)
+		if (bus == NULL) {
+			of_node_put(busnode);
 			return;
+		}
 
 		bus->controller = busnode;
 		bus->busnode = busnode;
@@ -928,6 +930,7 @@ static void __init smu_i2c_probe(void)
 		bus = kzalloc(sz, GFP_KERNEL);
 		if (bus == NULL) {
 			of_node_put(busnode);
+			of_node_put(controller);
 			return;
 		}
 
-- 
2.39.5 (Apple Git-154)


