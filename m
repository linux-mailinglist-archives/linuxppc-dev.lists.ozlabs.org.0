Return-Path: <linuxppc-dev+bounces-10321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FACFB0A529
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 15:28:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bk9bH4rMJz2y8W;
	Fri, 18 Jul 2025 23:28:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752845291;
	cv=none; b=PI2B9mEbsEpULFFR++46GMfsizY+US1FVYZMAbTALYLJJgG6H8j25dhupzE09ctZePjJ6h1EThOv24ipSBmBxZ2Gelzvbg2PxkALUkvsbGh6lOWK/CH7A49dJhus65J+n6bJgqSWz/oCuLhMMVCHwZvZvsz6EkWalz3ljAv/9TosOw1ji5jvXHNGJDZw98MSA3EFo5+/ZNZNPRyy6/yk6pFYWrmL0fbxuwZ9Xw4KM2DMU/NAG9tXcedm1lKl3U3YLYrK9z0GgySwmxPTBkGSaInBRi3rzwMt7V0RyRt29LPyN/K6uQpjRAIF16axxeB+uk686+Kl5Is/dUKGwkV/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752845291; c=relaxed/relaxed;
	bh=AJi5eRCOHkgj05XvqBKBpx0lRE1/cznkH+1lkoSsPzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eKKBhGfSCq9Cwkqge1SD6CYOT7neowSPnZK+V64Avc0naULYyj0/2uc3+PpaiKgG6976cT4tgc2xHy9yCKsIVIVnFq+atgcSX7+s9u3v5oWmWnlM5BY/u40UOk9/APy6KRN8wYMmFC8tcnr0uHRoyg0PFPYgmWDDJOpLKEQcCWcBcCihuYYfFrZuUu89JHh/DbSZ3ZaJZORuE7PYWJasWNRqjTcQ2CbS9L+6BSarvoL/0i9GcEnnnn2ZYIiP2bcuYx1oLgvPzDD76GKaiGAfVhVWF7Ku761imNpVUE/fkFuY1ekjjS3IpvxTimlVXTfovszsTngFYclzZpgCK4TQWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sd9d/caF; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Bs+VNj3M; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sd9d/caF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Bs+VNj3M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 447 seconds by postgrey-1.37 at boromir; Fri, 18 Jul 2025 23:28:08 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4bk9bD70j0z2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 23:28:08 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752844828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AJi5eRCOHkgj05XvqBKBpx0lRE1/cznkH+1lkoSsPzs=;
	b=sd9d/caF9udU3P1lVoo253ZjFrh8w6Y8SNWcoPbJhVUQqWQEgxQu29QygeJTHa/nqEj6cc
	jmQX8o29hpUVlcZs9+s6Z9KSTKkSMIdlIMa08k/UeSmHuzu0vNtop0QHDRMKSQaA1hSgAF
	UG6H0p74ym5Iz7z45m1ShSQ2gqEETBTncwQSO/MWMG3lckYI1yyfK+AKm4g92bZlY396j0
	LlAk6GR2hvF5ljdkqfJ1LZzkT8Le2qb5WmTuIryefv/Lh7ZFr38bMw9C4mouoQzxjMnDei
	vf9GP8+6XxNsj9hMS71BO2ESEETxM/u9D1C6gYT7VCBoUUUD60h7v696ftAkxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752844828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AJi5eRCOHkgj05XvqBKBpx0lRE1/cznkH+1lkoSsPzs=;
	b=Bs+VNj3MDUgJy7GSJim9k+gpb7y1apitkmVmvmWR+LYdKtZqrshTr4gW29hYPnhRmjO65g
	fAVJaRoBzcAQtVAw==
Date: Fri, 18 Jul 2025 15:20:25 +0200
Subject: [PATCH v2] powerpc: Don't use %pK through printk
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250718-restricted-pointers-powerpc-v2-1-fd7bddd809f3@linutronix.de>
X-B4-Tracking: v=1; b=H4sIABlKemgC/42NQQ6CMBBFr0JmbQ0ttYgr72FYYJnKJKYl04oY0
 rtbOYG7//7ivQ0iMmGES7UB40KRgi+gDhXYafAPFDQWBlWrU61kKxhjYrIJRzEH8gk5lvFGnq1
 wUp5bozujjYZimBkdrbv91heeKKbAnz22yN/7n3eRQopGWXN3zjS2G65P8q/EwdN6HBH6nPMXo
 3zQhcoAAAA=
X-Change-ID: 20250217-restricted-pointers-powerpc-f11876496464
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752844827; l=3449;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=5fjrxPHAoQtyI5IPxtt8zqtsvNl25sK12wDGitaCwuM=;
 b=V+z2HPPuxpcpGsXdLpuiMaBAh1OBAb8tDYhyz8Si49K5rFQpba3PCu1+hA0LwZoXZth+grP+9
 eW2fO6/jLZJBHNkwFqmg5oNjJTevg2WjgVkuNUiett13AibNZcgrb3Q
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rework commit message
- Link to v1: https://lore.kernel.org/r/20250217-restricted-pointers-powerpc-v1-1-32c6bff63c9a@linutronix.de
---
 arch/powerpc/kernel/eeh_driver.c | 2 +-
 arch/powerpc/perf/hv-24x7.c      | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 7efe04c68f0fe3fb1c3c13d97d58e79e47cf103b..10ce6b3bd3b7c54f91544ae7f7fd3f32a51ee09a 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -907,7 +907,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		/* FIXME: Use the same format as dump_stack() */
 		pr_err("EEH: Call Trace:\n");
 		for (i = 0; i < pe->trace_entries; i++)
-			pr_err("EEH: [%pK] %pS\n", ptrs[i], ptrs[i]);
+			pr_err("EEH: [%p] %pS\n", ptrs[i], ptrs[i]);
 
 		pe->trace_entries = 0;
 	}
diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 681cf85af2b327785acfa64bfce13c37cabacba3..e42677cc254a9a048ca20a34b654132b810bef22 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -713,12 +713,12 @@ static ssize_t catalog_event_len_validate(struct hv_24x7_event_data *event,
 	ev_len = be16_to_cpu(event->length);
 
 	if (ev_len % 16)
-		pr_info("event %zu has length %zu not divisible by 16: event=%pK\n",
+		pr_info("event %zu has length %zu not divisible by 16: event=%p\n",
 				event_idx, ev_len, event);
 
 	ev_end = (__u8 *)event + ev_len;
 	if (ev_end > end) {
-		pr_warn("event %zu has .length=%zu, ends after buffer end: ev_end=%pK > end=%pK, offset=%zu\n",
+		pr_warn("event %zu has .length=%zu, ends after buffer end: ev_end=%p > end=%p, offset=%zu\n",
 				event_idx, ev_len, ev_end, end,
 				offset);
 		return -1;
@@ -726,14 +726,14 @@ static ssize_t catalog_event_len_validate(struct hv_24x7_event_data *event,
 
 	calc_ev_end = event_end(event, end);
 	if (!calc_ev_end) {
-		pr_warn("event %zu has a calculated length which exceeds buffer length %zu: event=%pK end=%pK, offset=%zu\n",
+		pr_warn("event %zu has a calculated length which exceeds buffer length %zu: event=%p end=%p, offset=%zu\n",
 			event_idx, event_data_bytes, event, end,
 			offset);
 		return -1;
 	}
 
 	if (calc_ev_end > ev_end) {
-		pr_warn("event %zu exceeds its own length: event=%pK, end=%pK, offset=%zu, calc_ev_end=%pK\n",
+		pr_warn("event %zu exceeds its own length: event=%p, end=%p, offset=%zu, calc_ev_end=%p\n",
 			event_idx, event, ev_end, offset, calc_ev_end);
 		return -1;
 	}

---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250217-restricted-pointers-powerpc-f11876496464

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


