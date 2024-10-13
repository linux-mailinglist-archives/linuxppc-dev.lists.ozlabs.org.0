Return-Path: <linuxppc-dev+bounces-2168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D1C99B99B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 15:29:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRLnF3QP7z2yGN;
	Mon, 14 Oct 2024 00:29:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728826177;
	cv=none; b=PU6p6gLFKx3Hoa7Y/itI38Xa51b0309jBLh+dBdM/0wMNpqyPGR7aTDIsegIubPWQHb/rOmEsIHxrwnuYp83NuaD4GUiYx872wHrkCRCNncDIp0rxT9cApqWGaX5Q0G0YWq/P7plebhX4gErEQgWMBhT3q0uqGuwQLsTWFt0jEc0qQb4y7t1xJ9RBCBeDvDnfVezFmpLqnfeYxYkt5OFmWwiWwPoB7pgH1YtqYRbpQSdOwPvIVjwbkIMdUrmH5V9LvhujMHUQEACu3bWzeF4qLgKEYo1C+yjjcH1V1weeoCODAjNfKFUbfksLCjZMhVLTw5LdqN0S6rqit997aRrDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728826177; c=relaxed/relaxed;
	bh=NGlXEzSiP5z6yP6nCSdenZ8uyY+JlklNBTVpENkMXes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SeM0fA9XAXnbwZt2JLAqXnzx1TKYzmSQYshQecqor7iSs0t7UCDkfO6BC3aX+Nz/vzr0K7UkVApJCBn4EbJZ7hjt7C3uY3VyuXyDt8tDpzqdH9PbN7LpCmNGRYEHIdaZCFP4lYNFY6NsiFVEkEk27lH9tEDdDORdKA3LLn9Jpur8V+amYgxNILUtN8W4Wzozcpq0TasRmSdANuoe4TGOxCcV54EaH9QMY10/YQWyUulnUbvi+a6txOwIa1Fi4m+VpeM+jBZHI1AaH05d8aMY0fBrn9DnqxBIqbDAC5q6C89Smz+utooz2QQGUU0C+2YFWYaPihC0tj3iATc9XUS5hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WQ/kyqm6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WQ/kyqm6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRLnC2FzHz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 00:29:34 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d495d217bso2952508f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728826166; x=1729430966; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NGlXEzSiP5z6yP6nCSdenZ8uyY+JlklNBTVpENkMXes=;
        b=WQ/kyqm6byTnr7QLizRA5HYh9b7xgtnMXbhjkdMu9OARyts4mrBz9tlwIePcuVe74C
         +QsrYVs7sX76HWqWGcFdyci7MTW/VvlOx3vG0iJbTRW8FgZFR1vO/fepMs6ODzoGmeY1
         D8Ha2z5//Fu9h5ivbkd2/50hsIp92ALBKUfzERSkHSSRPxn7SsdShlmtyGj4Q9rmUukO
         0mhGMLJunhQ8hEIEGG6z//qwJlwLGImIpQptfRdJ0TowrU7y9+CLHVN1XrGjVXHHbr93
         KZP9i/R8sTiFlMHopxFI2nvwY37AU+hPHybgZ0pnehSHLTz6bbK591CHVczTWtaFP11D
         X01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728826166; x=1729430966;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGlXEzSiP5z6yP6nCSdenZ8uyY+JlklNBTVpENkMXes=;
        b=csnCtx12lGXhmT8Ds3qFOENfb/O+CmLHO2IXn42RqLql+PIw+3hjEdY91FwXtyTnXm
         CteP116trfyjtmVgRTOtAq5EKKJB1n2e5bnC9rlCsQvFZMzPAwhA2aZeoD5cJfWUoDsK
         6z1KS0loaRHZdD/LH9aOXMOuwr2so/wV4+aYL6GMHPsJ+RFK+gZs9PNG0WE580XUMeTl
         6+37TyqfzMw5IjKn/6dY9SSbJo5awmZOZlCZik45PTvwgH3r753G76PY76hDjOjGJzII
         mbSBU3/liBP65bA7YdhcM3CsDmTRpQqxY+K2eOBf7xmjIi+SO2kMDaJbIcdM6W6d6mzQ
         LIyw==
X-Gm-Message-State: AOJu0YyeSNWU5am4N0xMyK33Hby0EirzYwa3KzFI8t2wXTCEfZUZmXd0
	K4AVC/+1i2bZ7ZiTe8RGGcO/TwUuowA9sb8PqkKFoa1aUqgxY543
X-Google-Smtp-Source: AGHT+IE8fC2geMshENVGb1hea7AhB6LAexPh3d8xXlpLs/ktse8QKUVqQH3fLCN/Mpne6NvatqohrQ==
X-Received: by 2002:a5d:6a42:0:b0:37d:4cf9:e08b with SMTP id ffacd0b85a97d-37d5ffa36e1mr5005643f8f.31.1728826166513;
        Sun, 13 Oct 2024 06:29:26 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-a034-352b-6ceb-bf05.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:a034:352b:6ceb:bf05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b9190f7sm8655165f8f.114.2024.10.13.06.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 06:29:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 13 Oct 2024 15:29:17 +0200
Subject: [PATCH] soc: fsl: rcpm: fix missing of_node_put() in
 copy_ippdexpcr1_setting()
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-rcpm-of_node_put-v1-1-9a8e55a01eae@gmail.com>
X-B4-Tracking: v=1; b=H4sIACzLC2cC/x3MTQqAIBBA4avErBP8qUVdJUJKx5pFKloRSHdPW
 n6L9wpkTIQZxqZAwpsyBV8h2gbMvvgNGdlqkFx2ggvFkokHC077YFHH62Q9Dh32qxNScahZTOj
 o+ZfT/L4fhLKd9GIAAAA=
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Li Yang <leoyang.li@nxp.com>, Ran Wang <ran.wang_1@nxp.com>, 
 Biwen Li <biwen.li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728826165; l=985;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=SAEC5JBEGvTQMw649wbR32F7xQSAMSlWb1WlKc8U8S0=;
 b=Tzw1jc++TZAlsNFa2eLf/X1m6vznngoB7tdjupyfxfOzpZpnbegGJ4VkNZYJOxkT0Cb1leguC
 4SfKNsaEQt4A+fLcXtT7kBPAK+pcVcJPdx+ZMr699dS8TLODbjBzgk3
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

of_find_compatible_node() requires a call to of_node_put() when the
pointer to the node is not required anymore to decrement its refcount
and avoid leaking memory.

Add the missing call to of_node_put() after the node has been used.

Cc: stable@vger.kernel.org
Fixes: e95f287deed2 ("soc: fsl: handle RCPM errata A-008646 on SoC LS1021A")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/soc/fsl/rcpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index 3d0cae30c769..06bd94b29fb3 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -36,6 +36,7 @@ static void copy_ippdexpcr1_setting(u32 val)
 		return;
 
 	regs = of_iomap(np, 0);
+	of_node_put(np);
 	if (!regs)
 		return;
 

---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241013-rcpm-of_node_put-5e94e5bf1230

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


