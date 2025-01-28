Return-Path: <linuxppc-dev+bounces-5644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D83A20EE9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 17:47:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjB5c3thSz2x9M;
	Wed, 29 Jan 2025 03:47:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738082820;
	cv=none; b=XweANGHkqUIBBI+YwHHz7l76jg+J/8CuSiWXnPYPObQv76eLMjXa2FyHpWZXfQICXKomatogU/mgwSCbJDQkP3MECfHLN6cCXEnbEQcb5ZNIk1bKpnT8hwB1/mZf0l3LVIGp2GIGhYCx8fbW7qkgmu3AnCrsIX2oYCLupacOO7e7o2zBpNEyo7BGkla0k1jAvOzYt3h4qPrpF1wssCQ+luPZNW9RWQSk/NVcb/SxdBoPa01vkE9yUhILgeC6rZKVzQqIbtA/2yu2mTxPYCEptx8ecHQo1SQa2SHz6bAThiIlnQZu/xwmm8k+CeaWBtUcVonarnfcxWlhnFAMSnf1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738082820; c=relaxed/relaxed;
	bh=3kAK//hhU6+Dq+Mdh8OblTFhw6zLSUBb3rmm8+LJHLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GoUe4+DnYDEU8H+K7Tr+sh7yH2yx8kZzvcqv5RjhCvLzPK5I6J8glQvAde191S6zy2uZSboGTzsCPUpPA5/CPWPzRAQbwkGqknIstPcYrSW96jTQUysMVODUo7BvABfHjoYOMRuiawBk4xN2sogPLLbechMY3tIMtGGAIqv+ULIW2E9nxiiksDv8TpmyftjaHwmt6RXqBC/BZ0IqX3E5+db3y3u+nzX9wVxAKhT5bpQFtqhhxBzeg4HbGRSuC7RTB5Y1yNiR5ccLbCZuPDEtlo2oGGaAA2AyX1G/KoDlfnS0yD59XrxMkn73r+yXu+oJI19icm+9SuMJeakq4MbvPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eWeuAqUO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eWeuAqUO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjB5b5m6Cz306S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 03:46:59 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e587cca1e47so3804117276.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 08:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738082817; x=1738687617; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kAK//hhU6+Dq+Mdh8OblTFhw6zLSUBb3rmm8+LJHLw=;
        b=eWeuAqUOmYE4suXR5hgBd9xngqQA0/kgx6+Wpk8lZo4PUXyg0347WAY13I/hfxbjdv
         TPd0RCmTasijgeqU3nrtlv38iMUUb3qXqRzon4MPKgfGBD0Vy7sumVC+k51NeC32Cbhx
         //jwu2L/e8ZlHOBfodagTczcgZkLbWQ41toacCCebdLS5nqLo6DclyNUsLDHkQARhhbP
         GjXFYm452JjBfPBf6i5BjlKuGxrXToacAuBDG20j37hF/SJG5U8rmsbwMILhjnuoXCoL
         O564qJQw1zUCoI3p2UNHbWOEgaRxqdRGCGWGtd/o24vGFKpNbVRyQU0m6ofUTwb5mgKe
         59yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082817; x=1738687617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kAK//hhU6+Dq+Mdh8OblTFhw6zLSUBb3rmm8+LJHLw=;
        b=wMDCjS4IHvTiYJwQ3UImHrFQBfq3DSr95W/2Wyzot0LspaC2OJN2pF0g+BNulPZShT
         10iIvtXlbPwjVFrkfh0iaA29MxKkb6s++pobenIeuNE6EeKy9oDXTzQfxatN4QCMaU9B
         gjaI0CWL4z1s2X2gHrEAdUkQAEgdKSR2/ERo6bP5Rid8KSJsoRAzRpyznwIDFnEuu+ru
         guoC8Qx/JzF6mge8RIb2aNbYknyyw2mSLqdxypESWBWAEcavbMfNZcDytz67p/i62NiS
         ztlP+sFUb3tbDTUgCfZ9m+EWgAiyc3w3K4OWp0NanhjLmL0XOO7usfBNuJQFedJzTbHJ
         Fbzg==
X-Forwarded-Encrypted: i=1; AJvYcCU5WU0xHF6dA8EkBcI5QqavAHUAJCqxoitfVGuh453gayBI13aBgfJN3S9RZ6kquxQhN1AIAiQs8mYdBBs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2U9i3O6s1Irk9TFCxB0MSroYpgJ28NXe4KOeVWqVJRUR1LCvn
	5kQMF3Ckh90fKTXb9ePxdP0Eyqlt2r6o5L0e9hqGpJwnT94ZB9uDWbm+nho9
X-Gm-Gg: ASbGncvbAZXg8gAaY+/mvMHc9HPuYgJM9lcXLn7PX22CWu6EOrwfcRE/Wc+oBkMBcc7
	jF6fQlJ9K5ZuHl/O24wbWlF/8O5Ib7L1ulQknaF8dt2UoJTkiZfBX4QvCZW28jT0xGYOnb7p/HA
	IuY3Q2K0oS9hBlTEp6uKy9qMZV0NPQw7jyv518IMqHdZJRWM/QIM5euTtAf21QZvktcujIyUKTp
	qFo5medmzmIzhdgtKTqwg6NTFFmVgQ3WzDuLXp0zkP+qmv/JIRlY8Z9DbZn2Ma6mrj5s7a2r+Ae
	aTcHv6xH3JtB7bojwqO+6rRO5t/F5ltzT20SdL4obdGVvR+znQrVoPgJ1mYQhw==
X-Google-Smtp-Source: AGHT+IFW7liCvZfwJc8JoJlI08CvPzHqyyKv7ENkjy6al6FScVaGGIFgBwK+m6vuvZqvkWpayyjrXw==
X-Received: by 2002:a05:6902:144c:b0:e58:3990:3f77 with SMTP id 3f1490d57ef6-e58399041e4mr15154060276.22.1738082817272;
        Tue, 28 Jan 2025 08:46:57 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e583b8907bcsm2099719276.56.2025.01.28.08.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 08:46:56 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 04/13] powerpc/xmon: simplify xmon_batch_next_cpu()
Date: Tue, 28 Jan 2025 11:46:33 -0500
Message-ID: <20250128164646.4009-5-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128164646.4009-1-yury.norov@gmail.com>
References: <20250128164646.4009-1-yury.norov@gmail.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The function opencodes for_each_cpu_wrap() macro. As a loop termination
condition it uses cpumask_empty(), which is O(N), and it makes the whole
algorithm O(N^2). Switching to for_each_cpu_wrap() simplifies the logic,
and makes the algorithm linear.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/xmon/xmon.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 268859e4df87..1acb53aab252 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1271,11 +1271,7 @@ static int xmon_batch_next_cpu(void)
 {
 	unsigned long cpu;
 
-	while (!cpumask_empty(&xmon_batch_cpus)) {
-		cpu = cpumask_next_wrap(smp_processor_id(), &xmon_batch_cpus,
-					xmon_batch_start_cpu, true);
-		if (cpu >= nr_cpu_ids)
-			break;
+	for_each_cpu_wrap(cpu, &xmon_batch_cpus, xmon_batch_start_cpu) {
 		if (xmon_batch_start_cpu == -1)
 			xmon_batch_start_cpu = cpu;
 		if (xmon_switch_cpu(cpu))
-- 
2.43.0


