Return-Path: <linuxppc-dev+bounces-1705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C677C98B8F8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 12:09:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHtvl4s62z2yDr;
	Tue,  1 Oct 2024 20:09:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727777362;
	cv=none; b=Q/Io8XVfwj+1oyMwgQdzi0ajMmVq968JkMKS/5w5buY6ZVrr4Tp0tXZXYElOyNp8FR3Wn+2+ougQX3eP/qRkB6XFCs6SFvO8aDIPk9Q8U8ARNZn17uM4HLB2ZSKDfwF5py1sMvi11BpDgTB6sz/axXD0LYaALp5jeLfod91eKLMR3hAwP8XSowlphQe6oOA3uNSxQ/vMsRxtfGWatowe5osPYDNaNWbHgRNRYwZNq5BON2k4T+WlpXXQL4/ze0qrVdMYsyHl8l/ozgyQhIvz6h/uYoWYSDEtWbH0fW0vmM7JojzKSNZ0v/e/sRS2mkgfxaz/5cp+lfn21Hy/FsDJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727777362; c=relaxed/relaxed;
	bh=vsLdevLuxWWZZcQWZ6K460x6RCmyx9r/j4uIM4zeFJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JNDoB3gJHE65tnMlvJIXHEPTNqdlrcXcBCxMu5hRiJTIW81+Sed5ZmztkIq/WNHajRFSWx2KrfDN32ODvvBkBZ7KvqBO/OFB5cDF2OPa7Jm2CoKQ/IE/PNM6RQGObjt9LW5rbXVqn6fbPxOfygsoCzZICu+efzj+4/6myLGaAxOc7x3u6cHjWdQG+aH8ifY4+WvicqKZddIyJD7U64TP9GgZjiae9deMvMtcI5AxTxWzkGuVdYjzJgyeIQ8EwtrK4rF358WFMb/tcdUPXtkTVC/e9ElDkgJfKC4UogagOhzo5ZCuULn3ozh6ULoJoscJ5scbyA4c6FdhVn5ZFTiVbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zGRANYJe; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=uv6WRnNs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zGRANYJe; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=uv6WRnNs; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zGRANYJe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=uv6WRnNs;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zGRANYJe;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=uv6WRnNs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHtvk02yKz2xpf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 20:09:21 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	by smtp-out1.suse.de (Postfix) with ESMTP id 3437421AE6;
	Tue,  1 Oct 2024 10:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727777357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vsLdevLuxWWZZcQWZ6K460x6RCmyx9r/j4uIM4zeFJY=;
	b=zGRANYJePyCLq6fKuTYj+Hj7if3j15l3x7wsOjfAcoDbR/x8G92ZH6jYdPJPkoanQoKKmv
	M47VBZq92JPunSVo1ep0qrMwxLo7YJUpP7MCdGRsBOU6HAjbU6bgIdeu1OMjuLLNmkdFfV
	Xhpxm3/CXHwc/LGTh2xZvK/ExaUqTuY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727777357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vsLdevLuxWWZZcQWZ6K460x6RCmyx9r/j4uIM4zeFJY=;
	b=uv6WRnNsRi/weQxvtZxFKNW3vjfvW/BmBxyk6drDdJ7sx38j2ijVLPKOr6NJaMqGVmqtQk
	AyayX+fhj7KHOUCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727777357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vsLdevLuxWWZZcQWZ6K460x6RCmyx9r/j4uIM4zeFJY=;
	b=zGRANYJePyCLq6fKuTYj+Hj7if3j15l3x7wsOjfAcoDbR/x8G92ZH6jYdPJPkoanQoKKmv
	M47VBZq92JPunSVo1ep0qrMwxLo7YJUpP7MCdGRsBOU6HAjbU6bgIdeu1OMjuLLNmkdFfV
	Xhpxm3/CXHwc/LGTh2xZvK/ExaUqTuY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727777357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vsLdevLuxWWZZcQWZ6K460x6RCmyx9r/j4uIM4zeFJY=;
	b=uv6WRnNsRi/weQxvtZxFKNW3vjfvW/BmBxyk6drDdJ7sx38j2ijVLPKOr6NJaMqGVmqtQk
	AyayX+fhj7KHOUCA==
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michal Suchanek <msuchanek@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Mackerras <paulus@ozlabs.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] powerpc/sstep: Unexport analyze_instr, emulate_vsx_load, emulate_vsx_store
Date: Tue,  1 Oct 2024 12:08:47 +0200
Message-ID: <8ecdbd907a8a92cbf9c7308df13f9d19f5ba5621.1727777273.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
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
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_ZERO(0.00)[0];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[suse.de,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com,ozlabs.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

There is no modular user of analyze_instr, and the latter two are only
used by sstep itself.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/lib/sstep.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index e65f3fb68d06..a0557b0d9a24 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -863,7 +863,6 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 		break;
 	}
 }
-EXPORT_SYMBOL_GPL(emulate_vsx_load);
 NOKPROBE_SYMBOL(emulate_vsx_load);
 
 void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
@@ -955,7 +954,6 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
 		break;
 	}
 }
-EXPORT_SYMBOL_GPL(emulate_vsx_store);
 NOKPROBE_SYMBOL(emulate_vsx_store);
 
 static nokprobe_inline int do_vsx_load(struct instruction_op *op,
@@ -3172,7 +3170,6 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	op->val = SRR1_PROGTRAP;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(analyse_instr);
 NOKPROBE_SYMBOL(analyse_instr);
 
 /*
-- 
2.46.0


