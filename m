Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6752CA636
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 15:50:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CllPv3ScdzDqm9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 01:50:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=c0gnLvuB; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CllGh6xYRzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 01:43:54 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id s2so1233512plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 06:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0aYG3UpBYgEAoRcoDJDBDWKuJDs4AUd0cit5mP8DrA=;
 b=c0gnLvuBtNf1H3u0fKZLuWoJlJ0DbmB89OC+p2t+Q0i9u9j8xm2GLLjQjnd5BStUWL
 X8QLU/Dr/jIuajDn9qujz0JyeZKNluoDHhTXjvllK7x7SR4zWJbEyZutBAzJ1W//uZMc
 DaRImT6VqaVyPIF1cNS52e40X7RTheaMBta4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0aYG3UpBYgEAoRcoDJDBDWKuJDs4AUd0cit5mP8DrA=;
 b=U1bfDKLStsRcqJbQOKAqaMPDMfdu2nUollTsMAqFQJKIc5t1o0sbi0+uhm95ose/qZ
 h9OROUfvd9ehjtJecVAElbABGNX16OS8fRM6duhrX8GQxz5sexeXKlQnMBfblAMbDFbO
 HXS6PZY7iGW0V6RJ0iyXLEqXutMEICh2QeqdQczJIls8ZlCfj7iCZAFIklZPDDe3Rq8g
 KaB+Yqt/CvNsLmFai4yU/bBZ1PiFmpvi4F9aL5xcBIADiOdLAGmTDjvPzKzpvhtEGFGS
 A2MN3I4i1kgs0nwEE556lDi2jspdQynV4GWUm/CWAhwX4GyfcYXLJ7tD8zw3v4ALoy+9
 cXEg==
X-Gm-Message-State: AOAM530kz6o7g6frisFv7PNrVBnDC+E1gmw/sb579H387/JQaFj1PoqJ
 PaB0rVfJMbnfUMps1kgq0R2rDyqfXGDT3g==
X-Google-Smtp-Source: ABdhPJxTngJ+73CMNbyZnAzTLF/r9oLANxzfNdbF8qWKpf3OV+uRVvtxrxaFMxS9eoSj70eCkHhA2w==
X-Received: by 2002:a17:90a:8d17:: with SMTP id
 c23mr3084047pjo.192.1606833830127; 
 Tue, 01 Dec 2020 06:43:50 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-f932-2db6-916f-25e2.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:f932:2db6:916f:25e2])
 by smtp.gmail.com with ESMTPSA id g26sm3051785pfo.57.2020.12.01.06.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 06:43:49 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/feature-fixups: use a semicolon rather than a comma
Date: Wed,  2 Dec 2020 01:43:44 +1100
Message-Id: <20201201144344.1228421-1-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
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
Cc: Nick Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In a bunch of our security flushes, we use a comma rather than
a semicolon to 'terminate' an assignment. Nothing breaks, but
checkpatch picks it up if you copy it into another flush.

Switch to semicolons for ending statements.

Cc: Nick Piggin <npiggin@gmail.com>
Cc: Russell Currey <ruscur@russell.cc>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/lib/feature-fixups.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 321c12a9ef6b..47821055b94c 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -124,7 +124,7 @@ static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 	long *start, *end;
 	int i;
 
-	start = PTRRELOC(&__start___stf_entry_barrier_fixup),
+	start = PTRRELOC(&__start___stf_entry_barrier_fixup);
 	end = PTRRELOC(&__stop___stf_entry_barrier_fixup);
 
 	instrs[0] = 0x60000000; /* nop */
@@ -176,7 +176,7 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 	long *start, *end;
 	int i;
 
-	start = PTRRELOC(&__start___stf_exit_barrier_fixup),
+	start = PTRRELOC(&__start___stf_exit_barrier_fixup);
 	end = PTRRELOC(&__stop___stf_exit_barrier_fixup);
 
 	instrs[0] = 0x60000000; /* nop */
@@ -344,7 +344,7 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 	long *start, *end;
 	int i;
 
-	start = PTRRELOC(&__start___rfi_flush_fixup),
+	start = PTRRELOC(&__start___rfi_flush_fixup);
 	end = PTRRELOC(&__stop___rfi_flush_fixup);
 
 	instrs[0] = 0x60000000; /* nop */
@@ -417,7 +417,7 @@ void do_barrier_nospec_fixups(bool enable)
 {
 	void *start, *end;
 
-	start = PTRRELOC(&__start___barrier_nospec_fixup),
+	start = PTRRELOC(&__start___barrier_nospec_fixup);
 	end = PTRRELOC(&__stop___barrier_nospec_fixup);
 
 	do_barrier_nospec_fixups_range(enable, start, end);
-- 
2.25.1

