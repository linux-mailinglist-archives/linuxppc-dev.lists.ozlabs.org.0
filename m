Return-Path: <linuxppc-dev+bounces-13564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F6C20CCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:01:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6jr4PJ6z3dWF;
	Fri, 31 Oct 2025 02:00:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836432;
	cv=none; b=E78dFLA5Uk3jaEQkmRv8fG2wIOY0WD1eO56OCjdrFotDeaYijzFOllv+jQgWbNLV6wR2Vadep/6yPzPzMlR/GNw48WFU1K9drsxqSOuUPBQqxO95MwxUUqsWf3Zd8Ui/HuottuewYl7Qqynap9oX5i8HqwZ+SUh9ut4vnCLH63JlM7h9jp04OOuzyLGNcf4rHf8Z4LPxEpxLqc8A/xsSA4yOrYDq/+OaiB3qWOcPR9tkLJEi8qY+pYvOCrWdMszBiXAAgLTjUkDJLOvU9r423TVpI+7NawIHHh7AtE5uoPchMzn//q03/eVwuygFvAJvOtdIJZhXf4GtEZ+pkyGcDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836432; c=relaxed/relaxed;
	bh=kIlPt9KRBw4FZyQHabGOvoC63oKzmGfQ4blNV6pbIfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GEoI3Z8QlHEzDUVKwSZT7Df/QjLj8YPDM/VCm2p5w7sHbtnf+IkaF3UG3nsJ8CIDpNpKEtDnTefqGiU/wX7A+5Bxm0wbEptSaeTzI8q9UrLEIzMyqlavfkGCP9XNBh+E5xcnPlT598VCcSFFZgNFwQMV1YfCtkWqjXDzYfhDVRe3lx29qyewVxB816fycyNfcqPzf8U9ao74LNy44sZVJsLqurlsyHQu2eV7A0beZJ7Tm7IqRxLEFZSPWYUBPFRhs9zF7VO1QkT2DQeAABTFGDJoFYblPGhYnj0fQo9Ror/of1NOc07uP3Ci5kiSXE6Sj8n0OLoTsJjwFJpl2VY+BA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S3sl9d8D; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S3sl9d8D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6jq6tgTz3dV4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:00:31 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7a27053843bso1894052b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836429; x=1762441229; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIlPt9KRBw4FZyQHabGOvoC63oKzmGfQ4blNV6pbIfU=;
        b=S3sl9d8DWr+gUmi+O9zDNPZf2fzVeCSjDpJQTtVsKm+cE6Zu0DPn3lTRmwsi8lipqq
         pV42n/RXn9XCq0SILloAWUyd6eQhxa/7KLvBYlZ9FAi4tno/m7xT6dEcBSkJ5/02HR5X
         AiMR3u3Y5NF4jJSj11FxriKGqTAn3SbAzK1nxFdMvzh9Qw58TYpQCCvF9bow+2JIDKqK
         ok/eTh/3vYeat8zmjpIeBvr7mJsDk3lxbiKunxW2GiUvcIqLAvvjkdRz/BzgMQGLkF9D
         urPG8V5pqG7eWhXrVjuOL0WGkwjINakwAQYLJOUs5061U2VWCf5mHR5u/gqPfC0Py8V+
         oK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836429; x=1762441229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIlPt9KRBw4FZyQHabGOvoC63oKzmGfQ4blNV6pbIfU=;
        b=GBvR3hBtSG7yWjOItfbCQO/mgmEFswLQ4ZDMHHkY0XNVfYtcAjyBtKKQMMwR/2YXa1
         zDJhY0wKMxESLzTJ0e9E9sCQ11t43+0i3xahtmNKPgwA56KxSagRbKo+T1mAgFKwJDAh
         IJDsOuOsdO49T5RvDuTvAqVUPym8nok0fJ4XGlfzgIN/U+hYfoSp58ENI8LMSXNaTnXs
         GGy5EUilNemrzvp0ebOGPrbjc/+sKY4mNT9hAsTD34iJJYRvH+sMeNSEVpv9rfd7n9Ur
         a2/Q56UgUmEBAa5pkN/T7YsZIv0n4DU53hSwAdDONI0uW6flnNSypUW3RAuFr72dALuy
         6O4w==
X-Gm-Message-State: AOJu0Yw8KTohqWfxsx4l6rga6Ov7U/xLka44ONG0PfxRwHqEphqzGuA5
	jEA4FxHUz5ggKzHPTsRIFyojP1q6lwXwHbUdFyQPCYQLycupaquqiQA6kt4zXGxg
X-Gm-Gg: ASbGncula1MGvXLRy/W4icO62jOH9QwgHo783yRiQEOBncZV4RcoZg79+kA5rQMXCPp
	iPUuE+hd8RYBq7SxVwzaioIMPcJ8EeGFcpu2xTqzzqQyVamUQ0mR/ZU6HRBfNjqxfj1AZ2ui9Mp
	VaSr4m8twlzUriThLCvt18KCK5/WfZhIko79/RzTLk8F5nDjEZQvyMx+Js9CH7kmBaNre9ksO5A
	3EOsY/19pTluG5ffLHvOvvBMcTSkrJWTZqTer8DwM7qw15AbZubW5rm+FTpVEzl6Cv4Qjl/NsZH
	/ed45c9HXb6r7bwP1e6lzIf5isT8FRQC+BnVQjzHeWR6P148YfZ8hA0Or+QqwjJOLE6l5y5h5gB
	enmmTV/kn/PHBGJGfgM+5fatz7ngRKtVOCKk7v6Owo0X8uSuUt9XBYwxzQ68nNieMPef2vxYXwe
	SI69Kr
X-Google-Smtp-Source: AGHT+IFvpX+i4YV4cDjx4DgR1apxSSOPXQwZrQW5X7hnSwEx5TpqiylyuuoxP5DJAZWZlmcpe8LMXw==
X-Received: by 2002:aa7:91c3:0:b0:7a5:396d:76be with SMTP id d2e1a72fcca58-7a5396d7c24mr6018329b3a.27.1761836429363;
        Thu, 30 Oct 2025 08:00:29 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.08.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:00:28 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 08/11] powerpc/64s/pgtable: Enable directMap counters in meminfo for Hash
Date: Thu, 30 Oct 2025 20:27:33 +0530
Message-ID: <ffe47912e17075649b6ce5b2ee5d7f3eb5352e0b.1761834163.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761834163.git.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com>
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

This patch enables the directMap counters to be printed in proc/meminfo
for Hash mmu. With this patch on a system with 8G of DRAM we can see the
entire RAM mapped with 16M pagesize:

cat /proc/meminfo |grep -i direct
DirectMap4k:           0 kB
DirectMap64k:          0 kB
DirectMap16M:    8388608 kB
DirectMap16G:          0 kB

Tested with devdax too:
root@buildroot:/# ndctl create-namespace -r region0 -m devdax -s 2G
{
  "dev":"namespace0.0",
  "mode":"devdax",
  "map":"dev",
  "size":"2032.00 MiB (2130.71 MB)",
  "uuid":"aa383ded-cd99-43a0-979f-5225467cfb40",
  "daxregion":{
    "id":0,
    "size":"2032.00 MiB (2130.71 MB)",
    "align":16777216,
    "devices":[
      {
        "chardev":"dax0.0",
        "size":"2032.00 MiB (2130.71 MB)",
        "target_node":0,
        "align":"16.00 MiB (16.78 MB)",
        "mode":"devdax"
      }
    ]
  },
  "align":16777216
}
root@buildroot:/# cat /proc/meminfo |grep -i direct
DirectMap4k:           0 kB
DirectMap64k:          0 kB
DirectMap16M:   10485760 kB
DirectMap16G:          0 kB

root@buildroot:/# ndctl destroy-namespace -f all
destroyed 1 namespace
root@buildroot:/# cat /proc/meminfo |grep -i direct
DirectMap4k:           0 kB
DirectMap64k:          0 kB
DirectMap16M:    8388608 kB
DirectMap16G:          0 kB

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/pgtable.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index c9431ae7f78a..e3485db7de02 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -510,20 +510,21 @@ atomic_long_t direct_pages_count[MMU_PAGE_COUNT];
 
 void arch_report_meminfo(struct seq_file *m)
 {
-	/*
-	 * Hash maps the memory with one size mmu_linear_psize.
-	 * So don't bother to print these on hash
-	 */
-	if (!radix_enabled())
-		return;
 	seq_printf(m, "DirectMap4k:    %8lu kB\n",
 		   atomic_long_read(&direct_pages_count[MMU_PAGE_4K]) << 2);
-	seq_printf(m, "DirectMap64k:    %8lu kB\n",
+	seq_printf(m, "DirectMap64k:   %8lu kB\n",
 		   atomic_long_read(&direct_pages_count[MMU_PAGE_64K]) << 6);
-	seq_printf(m, "DirectMap2M:    %8lu kB\n",
-		   atomic_long_read(&direct_pages_count[MMU_PAGE_2M]) << 11);
-	seq_printf(m, "DirectMap1G:    %8lu kB\n",
-		   atomic_long_read(&direct_pages_count[MMU_PAGE_1G]) << 20);
+	if (radix_enabled()) {
+		seq_printf(m, "DirectMap2M:    %8lu kB\n",
+			   atomic_long_read(&direct_pages_count[MMU_PAGE_2M]) << 11);
+		seq_printf(m, "DirectMap1G:    %8lu kB\n",
+			   atomic_long_read(&direct_pages_count[MMU_PAGE_1G]) << 20);
+	} else {
+		seq_printf(m, "DirectMap16M:   %8lu kB\n",
+			   atomic_long_read(&direct_pages_count[MMU_PAGE_16M]) << 14);
+		seq_printf(m, "DirectMap16G:   %8lu kB\n",
+			   atomic_long_read(&direct_pages_count[MMU_PAGE_16G]) << 24);
+	}
 }
 #endif /* CONFIG_PROC_FS */
 
-- 
2.51.0


