Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50698893801
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Apr 2024 06:33:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gAXGdEkM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7J771kLKz3dWn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Apr 2024 15:33:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gAXGdEkM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=toblux.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=thorsten.blum@toblux.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V77vj0SGyz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Apr 2024 09:23:27 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a4e65dec03eso57681166b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Mar 2024 15:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1711923800; x=1712528600; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKPH+CLwGsJH9bz8FRiNgEaC+n8LNksILCOtIEZn2HY=;
        b=gAXGdEkMA/MaQP0A0hD+1PvCiPLFC2qesUV8MnD0xStSIXmXR3p7YLilczDb4HNqQS
         lUQDEP/oHFPFX2W9gjTcY3VMm3oo2bpbn1jNkyHKbVBUCfq7n6OG/XXmvtI9CDeROmlz
         YkLk3U7ekudQ3VYV18R9j33EJxgccWPHsznR2h/k/zPUuEPEUAN65sxuHdTp3vwlqZ1M
         kn3NBDVkK1HIndzK0+fI03U34sW14/u8RWRxODQtblQaLlmBBwuDkhyZcWekLzcnqtkD
         Ro28zRex69AIPSArw12HzcfHh8GeEkuJO/VyNN/qdXhUwvp5raWuxXuDAhENTF9OSdsg
         PZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711923800; x=1712528600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKPH+CLwGsJH9bz8FRiNgEaC+n8LNksILCOtIEZn2HY=;
        b=HKeUAdAqATnSXvUAe/k1ayH0TZl4riZj/8yPXXAS6sBhFqfsPnnKW0oGaXHQiuszr7
         VCgHz1MeddEh7FzcwjWG/5QOoRZC3aPZvmuoPKV/typRrsRucvtOTxKNgLt18KP9mqeO
         1bLZyTqDkrWff/pLWUBLumkQZgXbm4ct3h+kIcmGsC8kHxrOGBqmzfnwDijcmlL+MEZL
         Sgn+Q0bYrv3jAHHCJqPk1lmwMGuUyMHUR6xbga8TIhRk3QtVZ32Aliw5yYqX7vJLKPJK
         uw3cPN8dr6ChkGQnzeCBqHsWsYQ/L4PuSLRxnklNWrp8AHxo7bPargP39KftzwZaA0cN
         zOIg==
X-Forwarded-Encrypted: i=1; AJvYcCXQAq39BUzoYlK4UiwEjdT1ALQtds0JGrM47dtqeOqh23YuILxDztmVYQWH5JK/VHaj/Yihig8fUPzFWuhi0h+1Bq5nffFASS0omSjMhg==
X-Gm-Message-State: AOJu0YxfTHfImGsrNT+iHlzcpZSYK62iBebE3MScffv25GWNNZwQdNXh
	66yCsr2W9f73vbM4n55cK7yYLQAZ60SwaEnDffE/9tIpil8wM0ex1mhMQJWRoK0=
X-Google-Smtp-Source: AGHT+IHPfg6yS1tcXFsGv8kKdk85BHF7ZxtGqSA9n3HWWN8GQVYrb/JPaBBAFDt2iJayUc54A1rx4g==
X-Received: by 2002:a17:906:3644:b0:a4e:d5d:8fd6 with SMTP id r4-20020a170906364400b00a4e0d5d8fd6mr4645709ejb.60.1711923799952;
        Sun, 31 Mar 2024 15:23:19 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-212.dynamic.mnet-online.de. [82.135.80.212])
        by smtp.gmail.com with ESMTPSA id kf16-20020a17090776d000b00a46bf6d890bsm4664137ejc.91.2024.03.31.15.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 15:23:19 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH] powerpc: Use str_plural() to fix Coccinelle warning
Date: Mon,  1 Apr 2024 00:22:50 +0200
Message-ID: <20240331222249.107467-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Apr 2024 15:33:20 +1100
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
Cc: Rob Herring <robh@kernel.org>, Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following Coccinelle/coccicheck warning reported by
string_choices.cocci:

	opportunity for str_plural(tpc)

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 arch/powerpc/kernel/setup-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 01ed1263e1a9..4bd2f87616ba 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -405,7 +405,7 @@ static void __init cpu_init_thread_core_maps(int tpc)
 		cpumask_set_cpu(i, &threads_core_mask);
 
 	printk(KERN_INFO "CPU maps initialized for %d thread%s per core\n",
-	       tpc, tpc > 1 ? "s" : "");
+	       tpc, str_plural(tpc));
 	printk(KERN_DEBUG " (thread shift is %d)\n", threads_shift);
 }
 
-- 
2.44.0

