Return-Path: <linuxppc-dev+bounces-13957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D1C422B6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 01:58:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3Hc11K9rz2yqh;
	Sat,  8 Nov 2025 11:58:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762526031;
	cv=none; b=gkSNCPs/JCfw7vzPSQdZkXapchiLboOGD7CaDPy6t3T+/qG1NlwFB5UXIAs6+ascXUXoV92xiBm3bBheJCCx3XtlCRrLFX+Y9xqK7j89iag58ZEAHuM0yFymZYQ5yV0ZAMtg+OFmnOAcXj/lmt29Tz5J8JnQnE4VFrE5zpod5iU+FzfUm4ujYx3Omo+LYgegOrRGukZg5bAoS75MCIUx4H9P3FY0RLXquIjAWr+n9CBTI51LcfLy7rvZoAm20WTETs02HdjknjUIp07pZj/T10ogAdMFYur5IloD6JJH3tlYmPKxMrZzwmDLrgxzsPUvBskOpFRqhDQqVaLbBpgQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762526031; c=relaxed/relaxed;
	bh=zZwooRdHB1TiRGXyDl2NtjlO6yhOj/8qnno438SS5o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YVPF98ijfxXL/d4QLUFSik6LOTCI65htJF2poj+kkRhCY9PhvMM4gKBNL2Bl6yu7PGcTFyNz6xkVLa6tS/CMlGAyQlqfThwffgjpdEGlsckGYWT8w3iYoBl4pQnNnOD366pVj/VBqEAl+N4xVgw+v92i8umM9xdfL5+6Ki7m/sHNGhrIHJYW6atjutLG5rdATGN3oLfhOrCjXXAiFxU5nEO/uuy0AG4XzxcIvj1YWwVhB8qLNSOhFMVBgrHK4Ygpqft3J/4QWqUCttzU01Hg8UyO0PuHj0opeeTxmta/kMj773U41dDBoRnO4BcE5WKys2qb3HLPhU4eCuEsPyOOOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SL7CIsF3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=marco.crivellari@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SL7CIsF3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=marco.crivellari@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d31lK71Xfz3bs7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 01:33:48 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-429c82bf86bso427780f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Nov 2025 06:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762526024; x=1763130824; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZwooRdHB1TiRGXyDl2NtjlO6yhOj/8qnno438SS5o4=;
        b=SL7CIsF3coCzDE41UfSSVUdwVc0wTGhXP5cARbrhViDRtAYv630r78ApMXAwcnmNE7
         pVAxn3GkJrSkPK6YdftHsHP6O5WOcpX3SopGywWoIEkcc8ju+Pwf3ZqatMmU339q7+He
         umbXyxqebg/h1dWmiygC9IIl49l2Gdlr1wmwcYTDrfUlwtCwV8BwbVkVBXKuZpWg5zWg
         LkAVg8gFz1/5kW91EA3IbrgW09AOCu6O0QGB1jvqd9rUa4W+UCqJyf6hxlYERX9sol69
         2Um4H/UNKpjoA0deVrvYQ1GBPfOKl4rgZenftk6aH3IhVVxNlPsm5QAr0QYuYkVQU0z/
         Llhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762526024; x=1763130824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZwooRdHB1TiRGXyDl2NtjlO6yhOj/8qnno438SS5o4=;
        b=iKtb/CHDqAar5ehJwUZ2ux4nnND86Tz7kbKZzbagwHs/5B024FJmpGTJlIcn5srWpN
         mLs90wRKpUC4iiwut/jMeXM2Db9skQY3kPnbzYKNocYfSiOFgXz4dUeZOoWXwaGZk211
         LnCod+row7Q/8Z1kouOVdOk8F+Dsb1IcsCIF1a6qT2kdRLzRxlH1U1OvqnfR/S0OLXt0
         ksKDmfBu2upZJaMxu6rcy7bQ658E2DLp5MlPv7FuVPDIBomIHMpeuBWoE7eWNghZJ6/q
         CeI4Fr2qzBAtCFXfqajqwz2X67FV8G4Z3tvwSrJozebdR4rhs3SbkoCdmo6JfNl30RJK
         x/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWtoq8K40nUK7fmZTgCNOr15uQWHBzCCC7AOgPpwKLJhH+ZYeSqEwGadx4V93V74cLPNzqLdyvgVFJp19g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFNpQulT38mf9w4CYSK9qCWXjDijJwnBHKQXIVHwDnZ6dGPjD9
	Y5HZkjWCxSFG9np9+UghZd7yVC2l7RJLH9zZ2tuDABzeHUW6wc9s9c9PtW6K7MPHlh0=
X-Gm-Gg: ASbGncst4AX8RZBptiMf+84xx9WvtbItoigjPWqzNlzQxaUJjDKkoXG7MeJ579/iGFu
	h+N3q273xxrGkaBkcUYoYgRYk6XKsXyOfYxWdlaMSbvQqsVShGer84YMibffld5eDNK3W15ZAuL
	usG8vcWUu/b3VI0F3HiwRnfR7t/iVGRhQaaa7D0HY1lWfgtTIK89KUQjbrmtZK8C7Dhs2vGX3MT
	3D4LZ0VN1xdWHSv1O7GwkMIKHinpJueDbzQ8YN4IC+Bh8oj7aCTjCs84hKtDSX0ikgqWeR0PPQF
	0Dj8VmMyDSinvwjS6AC+9x9Pq1oXj0qhHpPOpXkme+O0MFpUJxdyIPwRrYLz3ibTIFqUVBiq6PT
	AkBvUNZqlweo3VpA+osXOOHS0K7rJc15+ikNsguWvzGY8unLEtCaIxmjMTX3r2Jt/bhjeFzu3We
	3ziMgbHnfDbziZJSwtSJpFKDjv
X-Google-Smtp-Source: AGHT+IHKuyvTGNSoJsQ3fSAGflXQvX+4fyFLXoLOYbtCrxRpdLm0CfiflATW1SeGn2vQFdIECJYLiw==
X-Received: by 2002:a05:6000:1a8d:b0:429:cc01:c6a1 with SMTP id ffacd0b85a97d-42ae5888a25mr2897316f8f.28.1762526023562;
        Fri, 07 Nov 2025 06:33:43 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e126sm5647624f8f.16.2025.11.07.06.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:33:43 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI: pnv_php: add WQ_PERCPU to alloc_workqueue users
Date: Fri,  7 Nov 2025 15:33:35 +0100
Message-ID: <20251107143335.242342-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistency cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/pci/hotplug/pnv_php.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index c5345bff9a55..35f1758126c6 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -802,7 +802,7 @@ static struct pnv_php_slot *pnv_php_alloc_slot(struct device_node *dn)
 	}
 
 	/* Allocate workqueue for this slot's interrupt handling */
-	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
+	php_slot->wq = alloc_workqueue("pciehp-%s", WQ_PERCPU, 0, php_slot->name);
 	if (!php_slot->wq) {
 		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");
 		kfree(php_slot->name);
-- 
2.51.1


