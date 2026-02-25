Return-Path: <linuxppc-dev+bounces-17185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEn9KJXXnmkTXgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E331963BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWwF16S5z3fHQ;
	Wed, 25 Feb 2026 22:05:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772017533;
	cv=none; b=RgNFBVdxsDDaQxlIbIAfEkINcIBDm4s1Cy18SCbqTQXApZIObUPrcWvc3GqqQ7rgqrH+acMoPJEWtm0yoOeGAmbmW2G5ftoiB/ta1tpeGNNwJD6xGEqus21EWZIHCfX469MdDIuuY2R4rNBmndTh+ZS45qh7WnMiO+ZB8pDhLE1Hl0ALD/sGvyI4WmNvAzXNEdS/dJDj6EVEasUvz/j5qWPkdCIe0COBpaHKzHIhsPzWvYBcRQusSnTSg/YHjaBgd/7AmrZDTEaMnx0nqHjKffkmGPVeKFVsIsqF8u6rGQJUCJPPy8UhPO1W7F5q1JrNn0bYzrN9XrVDbQzVlXQI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772017533; c=relaxed/relaxed;
	bh=MmnNCbfSwbXJVlcc7ToRrddmEn5JYiYLNZaSrZR850Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yj9LPCizD11M+GeZQH8Kn78+ejB/7VZ53Eh7vvt/kyER5nMrAQtg6pqJgZEZXkXKZmYl0nlxSchrbxJPjJYcE/uGZnoZASZytQlohulV3syVxuEo3gcQjJ2aiciKFG0tLDX+u/59kqsDcHLYSLTUgqtymuRxhPYJLAdq1fE4HCV1aG9poKzr/Yzs1rMx1dfmaXVqUCR9yoU6XDRFesY0Dombfzbv+HOJA0fBEwlYyZUgs475nglPnk29Vb4qT3+pq4sdcJ+VqjKXsI3DL5aUUJLVYpmL3uHbDlZFkextBszu7feQJyoXGj1h5Fg5gdvlm8t53Lltzrk45on+Lw+fLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OQAAKGXY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OQAAKGXY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWwD30CJz3f1Z
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 22:05:32 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c70bb8ffb24so1430003a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 03:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017530; x=1772622330; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmnNCbfSwbXJVlcc7ToRrddmEn5JYiYLNZaSrZR850Y=;
        b=OQAAKGXYtQtDF/U42DxhLBWNilU2ucqBTF29DorDBcqXcnPaj73lzmM6zOz4jlsd5e
         w+JAgMoURI1VXOZ0eOVkt1littPgLK29F07QP+1QJMLTFEccVhWcOehO2BJ19JUtDyXD
         qErjthmpYdF3YT4bE2nMD4eCIB6Q1+/JEHvcjFa0liL44skKHeesdc/SKPQdl9fLXrkN
         tAwGszdkbQmeuWhTrYSIKa9pO8sMXkI0JnkTHSNX3zrzE3v5iN1B+Z+jrdS3EdICGR5E
         /QFPwQVze+xYNa4L1eNw9I7Wm0cNfsVkdF4JP4Z61QEMLNAYQIj6XfZE+5TaSQH1BJ4w
         M4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017530; x=1772622330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmnNCbfSwbXJVlcc7ToRrddmEn5JYiYLNZaSrZR850Y=;
        b=DAflb34KGUyrUpt3/Max+m5aa77sM53+Nx8OtnVOCliAgE6vAR0ZgJFqXB3VnOtMNR
         c8qhcJoORoncQOcwb7VeMxnbrooENhKcnc4hhl8WtZdnBrrRT3Zt8+3fsILHXBf8Mxl6
         A2TMrwOiGo0x5G9xTPXczRWrKmevnIkLbOS0UR34JJsdxvLmnIrrABi56Z5ZdfKdCKd6
         X5UENIfH3YgwEFPzCu1Pavu00QTHlhRU/GJQ9eUs5EiK7SGwci2845noyDivN/+ECfg/
         KgxSNK6Um0ucqR0deHucsT1mHNg7Q8E7BtwSalpW8nvj8Cfa1r9Kcgj4oKfCj43hk3B2
         Cr6w==
X-Gm-Message-State: AOJu0Yyz1xbHgw2elfkm3W+IxtyyZ0ACMcTq+MfxHJbt3ZczEFYakSUW
	FnIxF1nLlgd2TQpjqhsBVFpBoFn9flW5uMBUrVzJwlXZgyl+KRmZmMD3fsHq/A==
X-Gm-Gg: ATEYQzwe0YeyHaIYevZk2oMm7T53IXZHN9ihC67H+praW/a910IlgGaZ8ooxXNTpiR9
	W8yHoSjjEjYuvdAS3ZTRVP3Gzcb0OrH4rjs/Lp800IQIGz1DOvn9fCQnciDs85LF4/IxV9owYaL
	Umf5J+tSWKjhwVWLAllC7EtJy/f02Igq+LV7827JaJRT4Gd7OphDWhrOxGetXI5EctEq+ZOK7an
	9gUDG42wg+SUcSq2DZKmwZyZjMKjpyokWSB8sz5MCRLsiUVGMN+ChGzjft4CxcgTZt234SWX9eE
	WdGakJ+pGdI+IoH0/P/54WhuGD335XUo/Z7CM/Tw9oa2fqXYWM+Xwl2SxbeI0vqXXH1iK6UpD8q
	DfmKwWQirGlGJP3coM7sbuO1buKpr0/gZxAfH4FF3k7v1Mg/38fsB2VIOCCTBUtNwL5sHc2XEoU
	IQ6ZSgDjgP/vZik12b/+qFRaoqSg601Lg=
X-Received: by 2002:a17:903:3c0c:b0:2a0:8e35:969d with SMTP id d9443c01a7336-2add13bda24mr20779715ad.39.1772017530108;
        Wed, 25 Feb 2026 03:05:30 -0800 (PST)
Received: from dw-tp.ibmuc.com ([203.81.242.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f9f5sm138365975ad.77.2026.02.25.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:05:29 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v1 10/10] powerpc: Add MMU_FTRS_POSSIBLE & MMU_FTRS_ALWAYS
Date: Wed, 25 Feb 2026 16:34:31 +0530
Message-ID: <c57b1c00145a2db1a1b4feec94cfc2917e4877af.1772013273.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772013273.git.ritesh.list@gmail.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17185-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 00E331963BD
X-Rspamd-Action: no action

Similar to CPU_FTRS_[POSSIBLE|ALWAYS], let's also print
MMU_FTRS_[ALWAYS|ALWAYS]. This has some useful data to capture during
bootup.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kernel/setup-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index cb5b73adc250..002b312eb7e9 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -866,6 +866,10 @@ static __init void print_system_info(void)
 		cur_cpu_spec->cpu_user_features,
 		cur_cpu_spec->cpu_user_features2);
 	pr_info("mmu_features      = 0x%08x\n", cur_cpu_spec->mmu_features);
+	pr_info("  possible        = 0x%016lx\n",
+		(unsigned long)MMU_FTRS_POSSIBLE);
+	pr_info("  always          = 0x%016lx\n",
+		(unsigned long)MMU_FTRS_ALWAYS);
 #ifdef CONFIG_PPC64
 	pr_info("firmware_features = 0x%016lx\n", powerpc_firmware_features);
 #ifdef CONFIG_PPC_BOOK3S
--
2.53.0


