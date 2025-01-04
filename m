Return-Path: <linuxppc-dev+bounces-4668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB82A01780
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2025 01:28:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQdTM6Hdfz3020;
	Sun,  5 Jan 2025 11:28:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736001545;
	cv=none; b=g4DFdszY8zOY7ljiaFQMhWEqmbbZgNWtC0jqNZLhjfCUy6OzTFBOfgQsp6PjY8cV/6k093UDWGPTI3UeHgMeqc+49eEimZhNyzCBsUVurcB0LSzykn37HiPbiMX3wppLtli9gbjeHm27+wXvyOf6BgMkCDqZBu1VRIXR9VTSSYTx/tYD6fMbIGTZXzkD6NsjfOQr3WbI1Nb+13myAQG1j4WmITRH0HB/TKtuabw7PBMD8ndT46YVsWvS81QFnRpC22NqTGvW3/x8i1WyvkS5FzGAyRZGEYOo/AFdO+gUryIREg5OuAfp5OKERq3WMr9wJbJgn5KLTc0HMJIPBM/QkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736001545; c=relaxed/relaxed;
	bh=ffgGfa1tRdbMu1hKTw9Yyv/ZhjBJNeWsWiWpVjLRBnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SU07N0vTnM/cX4QlNwZvz3UYnFBjZvyUBbWZK7G0xy+4zren7HuSBkEE45UOkQL7TDwdRXJRBtpTgq65ppk0cSMS05C5EfeRvwduwDKRsF4Gnox3JnKTcjBRAlgYTkCSu9Wq8nTYglLioeufvjezpV8AMXJ4inBl2wD2Q9h5qZj0thnyi4DGvoZftE6IyxbH7IHYUMlTzFtTqP5jwsd06WaaJvh1I0Qy77+flWHAKZmCw9VWIwjS7EXcfdCebucBPOl2keJWQfL+Wld0D5LL4KNo5orJMolVAO1vGKfFrB5GJBGwCb2Ks1lbqKUv5ebh46YKdAhC9stvJfUdH7c2YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=d1kr/M34; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=d1kr/M34;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQNP50RM1z2y33
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 01:39:04 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2165448243fso219670025ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Jan 2025 06:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736001542; x=1736606342; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffgGfa1tRdbMu1hKTw9Yyv/ZhjBJNeWsWiWpVjLRBnw=;
        b=d1kr/M34jkZtIM+o7U0bAM/xzFbpTHRIv7xw8HyhBvcXjxlGIwlmM8QYn6BMgqyIi4
         mTq8NVO/tSmMiy7pB6DnnOyZh+BOpYzpLyIME+fLsiWoL/lAVQhQCKgrhUE9czJR1zJX
         mmMU14flbaV3j/oqatijmZVxUvD0vazN+UvZNEm+Ozz5jzyUNvFZEPjynuNkzRxJ9X38
         8CLyZK3gFb/uuFqRPz4UKF4aCn5mE7/Mf6Bo024ol4Z6ZnBVUlxRfk1YHDxIGooMjXB/
         ndOJCoe+51Zi5Qlkt4WjVpw027vub2N2tu6MXDPXXwoc+Ge/sJt1CMJAaH1J5npeM4BJ
         FtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736001542; x=1736606342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffgGfa1tRdbMu1hKTw9Yyv/ZhjBJNeWsWiWpVjLRBnw=;
        b=ccDv/jWiN5cslHjafpVevOTkHxWHVm3KazEwR7ap0DSjZg7aV/YPnh79/sPgJRXaB1
         9PEs1qgJ8SXGC232wp7Lr4K/goE9wyw5wq0RozO4PnFxBP2wtmJoY79ekL6/O2Tv+aO+
         Zn/GDDa2wWqpSllCZPfmwnbmKZoPeEpB9JavlaaJfzw8ysEPlDB1al5i6RSE04kqGsjA
         R6AEhxFhGo0nOrKrFNX3ukmaQMK6TZRb90aZefa3u+JzTVfWslP+GsKoqC9evwCNca3X
         UKtVeef4eJFMNfABFEl6cV5xOaJBzWm04ce9rh3HbRPu0npQ7pZlnMvonTMWR0Ms+o5a
         5rZA==
X-Forwarded-Encrypted: i=1; AJvYcCWEbrDuXRln584kWKfnjVXHV1EwZene6eyGZSzYXlQwBhHM8KDb0X55cEg/57E7I6TTj32eoGn+J/4thhc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzzgahTr9QDctJqA7fgQ2kY9e93/6Uqp1qv53GK9unWja9hnVIO
	+eVAPTCoMgQClnSC0dOh3TtXfJIfaqQJFTiydB3/9vGEXofLhrMSRGChRpcHPco=
X-Gm-Gg: ASbGncvV7IxIvYlli2A/aDy6I4mCQadMc0vg68QNsZ1I3U1GcpB8di0s5YgvnEFlg6D
	aXrrYchshcFBJq98P8XVrv+1YTv8fDxId+ZJmfymYGO2M7e1YeDZMOKqk403go7RyKP2jM9OUZ8
	DwGFBw9nHtiyMZPAGt0AsMdnthIvv6BacYuZOt6aWmfVWdcKT4JxJKlJ5msvWm63uBVDcfFYc6H
	MjasWExSNXjwcL6xSEIFcCV31G0sfdnzDJOGweqwOBKx8ceVP11YH3Cbc8OaOg=
X-Google-Smtp-Source: AGHT+IFOWxSlU7LboQeYrGu1ZapBf19hzzItaS6bjgdVpBMRFBzVa4lgIENsB6ZfRDlcb/evlyTHrw==
X-Received: by 2002:a05:6a20:2d1f:b0:1e1:b1e4:e750 with SMTP id adf61e73a8af0-1e5e04717a2mr77843013637.18.1736001542441;
        Sat, 04 Jan 2025 06:39:02 -0800 (PST)
Received: from localhost ([2400:4050:b783:b00:4952:3c52:120a:27e9])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72aad8fd7b0sm17288107b3a.139.2025.01.04.06.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 06:39:02 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 04 Jan 2025 23:38:36 +0900
Subject: [PATCH v2 3/5] powwerpc: Use note name macros
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-elf-v2-3-77dc2e06db4e@daynix.com>
References: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
In-Reply-To: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 kexec@lists.infradead.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use note name macros to match with the userspace's expectation.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/powerpc/kernel/fadump.c               | 2 +-
 arch/powerpc/platforms/powernv/opal-core.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b371c738213..d44349fe8e2b 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -751,7 +751,7 @@ u32 *__init fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
 	 * prstatus.pr_pid = ????
 	 */
 	elf_core_copy_regs(&prstatus.pr_reg, regs);
-	buf = append_elf_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
+	buf = append_elf_note(buf, NN_PRSTATUS, NT_PRSTATUS,
 			      &prstatus, sizeof(prstatus));
 	return buf;
 }
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index c9a9b759cc92..a379ff86c120 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -149,7 +149,7 @@ static Elf64_Word *__init auxv_to_elf64_notes(Elf64_Word *buf,
 	/* end of vector */
 	bufp[idx++] = cpu_to_be64(AT_NULL);
 
-	buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME, NT_AUXV,
+	buf = append_elf64_note(buf, NN_AUXV, NT_AUXV,
 				oc_conf->auxv_buf, AUXV_DESC_SZ);
 	return buf;
 }
@@ -252,7 +252,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
 	 * crashing CPU's prstatus.
 	 */
 	first_cpu_note = buf;
-	buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
+	buf = append_elf64_note(buf, NN_PRSTATUS, NT_PRSTATUS,
 				&prstatus, sizeof(prstatus));
 
 	for (i = 0; i < oc_conf->num_cpus; i++, bufp += size_per_thread) {
@@ -279,7 +279,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
 		fill_prstatus(&prstatus, thread_pir, &regs);
 
 		if (thread_pir != oc_conf->crashing_cpu) {
-			buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME,
+			buf = append_elf64_note(buf, NN_PRSTATUS,
 						NT_PRSTATUS, &prstatus,
 						sizeof(prstatus));
 		} else {
@@ -287,7 +287,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
 			 * Add crashing CPU as the first NT_PRSTATUS note for
 			 * GDB to process the core file appropriately.
 			 */
-			append_elf64_note(first_cpu_note, CRASH_CORE_NOTE_NAME,
+			append_elf64_note(first_cpu_note, NN_PRSTATUS,
 					  NT_PRSTATUS, &prstatus,
 					  sizeof(prstatus));
 		}

-- 
2.47.1


