Return-Path: <linuxppc-dev+bounces-5851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F20FA27FC2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 00:42:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnfzV4YkWz302D;
	Wed,  5 Feb 2025 10:42:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738711117;
	cv=none; b=RamXma6Vr/PS3m/wc4ru2OMg6l/6RUoMo+JiYi8U3dcuQRdB1SN8z3Wkud0cER5iLh4Z577UC6wB/XetoKMos3q3eP01QSY9DXQ5JoyvyfveAYWjDMb1t98QoFsijx5wxxFtCyUeiI3HzBEsB6WR1rFfMKrIQvjTCjvqWndyJfLQh5MlaeD/CfPMA8+Ocl8VNdcJFRzM9si0CHNGlyzCCSqC5qquVFLISEM5ghEOMViaOAJK8ekq5OZO2ym5DvyxvdZp4ZkERhGddA4pFV/ZiOV4ZnmnqqsNXtRyXA6crTHxFsOkfeWwuugkegrOTWircJ8W+DKTc8XY2VGmDGpSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738711117; c=relaxed/relaxed;
	bh=W2zDfhuqWd+jazrB8zXGTb+ziTtldHXymsK1G6Xuz4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=imaV51r9ThFiosCzqt3k5dBdh9OY0YfJ+P57F5nZI2cg9npf8OIw3LMnAq6fPfN1W03YmM6i7lWKqkBpr/Ox3JjK50YpoOptmrldyMS5yQ9MwOB9oqLXcD7M4TlhRd0b4tIjs3whE5DVgcO5DmX+gAbnuFcv+q8cpH1b6YJuu1Z+56KPqDoNntLyCeUUC9SQSmWntbuVTagr+ByUbNQ3EjM/JQkece/FFDy4vIc8GLJ/jqKH/s8jN/uDayp39tPmzarx6xVdBmWDtZjRdDwf9gNAAweJsYPwfy09EX2iIzRIzxuchUapbwDV5s3WHcizFmZ4s/nZG1AyUAdr6iWNag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=oXtRpJ/d; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=oXtRpJ/d; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=ailiop@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=oXtRpJ/d;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=oXtRpJ/d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=ailiop@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnfSD5JRLz30BG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 10:18:36 +1100 (AEDT)
Received: from kunlun.arch.suse.cz (unknown [10.100.128.76])
	by smtp-out2.suse.de (Postfix) with ESMTP id 70C861F381;
	Tue,  4 Feb 2025 23:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738711112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W2zDfhuqWd+jazrB8zXGTb+ziTtldHXymsK1G6Xuz4E=;
	b=oXtRpJ/dOPnRyXjk93k2nX9ZWhTrLZQEcJ4ipHU6UExkYYywGX6a6HwNNAIT9FZRfICkAJ
	0WfDABpNwYVO+WJTmuJoK0SXfCabSWRXSezKnvSj7AEZMkgzeT1k77LI77xM6qKJWIaDOK
	3hFfbTbGrElm/XbU+GGYvLlK3+ZqyR8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738711112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W2zDfhuqWd+jazrB8zXGTb+ziTtldHXymsK1G6Xuz4E=;
	b=oXtRpJ/dOPnRyXjk93k2nX9ZWhTrLZQEcJ4ipHU6UExkYYywGX6a6HwNNAIT9FZRfICkAJ
	0WfDABpNwYVO+WJTmuJoK0SXfCabSWRXSezKnvSj7AEZMkgzeT1k77LI77xM6qKJWIaDOK
	3hFfbTbGrElm/XbU+GGYvLlK3+ZqyR8=
From: Anthony Iliopoulos <ailiop@suse.com>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH] powerpc64/ftrace: fix module loading without patchable function entries
Date: Wed,  5 Feb 2025 00:18:21 +0100
Message-ID: <20250204231821.39140-1-ailiop@suse.com>
X-Mailer: git-send-email 2.47.0
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

get_stubs_size assumes that there must always be at least one patchable
function entry, which is not always the case (modules that export data
but no code), otherwise it returns -ENOEXEC and thus the section header
sh_size is set to that value. During module_memory_alloc() the size is
passed to execmem_alloc() after being page-aligned and thus set to zero
which will cause it to fail the allocation (and thus module loading) as
__vmalloc_node_range() checks for zero-sized allocs and returns null:

[  115.466896] module_64: cast_common: doesn't contain __patchable_function_entries.
[  115.469189] ------------[ cut here ]------------
[  115.469496] WARNING: CPU: 0 PID: 274 at mm/vmalloc.c:3778 __vmalloc_node_range_noprof+0x8b4/0x8f0
...
[  115.478574] ---[ end trace 0000000000000000 ]---
[  115.479545] execmem: unable to allocate memory

Fix this by removing the check completely, since it is anyway not
helpful to propagate this as an error upwards.

Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
---
 arch/powerpc/kernel/module_64.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 34a5aec4908f..126bf3b06ab7 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -258,10 +258,6 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 			break;
 		}
 	}
-	if (i == hdr->e_shnum) {
-		pr_err("%s: doesn't contain __patchable_function_entries.\n", me->name);
-		return -ENOEXEC;
-	}
 #endif
 
 	pr_debug("Looks like a total of %lu stubs, max\n", relocs);
-- 
2.47.0


