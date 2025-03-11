Return-Path: <linuxppc-dev+bounces-6899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 853AEA5C497
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 16:06:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBxsx6fBxz3brB;
	Wed, 12 Mar 2025 02:06:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741705573;
	cv=none; b=f5N/N53Ik1Q5iG99T4vx6lTfR0XWT0/DjvF5AIBlfOOWM7BGeKNNzBZevVFQXN4j+NrAAFh6LyP0mEY30MqxXXUbSZ1b6BW/bblNekNvmovxdDQQEGNWLdYWiAWjGfvwM5421vLJbqM9xcua8B2m1FkRk1gRsJGzjH1aPKebzOn4+vNWstfF8OJJFAlKiM2nyf5LmRsjb2u6jAlfvYSv+wVYqsdZ6pJwccmdFqvk69mbXvlaiJAuygqD2fS7fcMRNbQ0GZsUqziJCGQscHwKfACKB5sG/uMPZGvb5ABr22Z1csKuCV+G/5IT2knhE5CZj/mjmNY83wSsyLMM3nC7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741705573; c=relaxed/relaxed;
	bh=3ZERqBXdmzo1DqNbqnk/OjvO9FMTT2lMrUpjT1gRZbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6a5QjM7kHwOUB044zXxLQxxYy9F5yw1Y098pYmlG3HgZfF1kDtWcM9/uvWvTQ09PxYB2HK2DzM0ddyhl6xhS4u3z2ArECb5BG9wDCwu7JZwz0ynBu6KN9WUs6jlujuPIWuoHBGiPPfj4DZw9MY76DspkfW/ThxNK4SkghPu8BrKvw+OperDeHrG67cuM47RetJ5pmGoPBwYiCX8eXdV73h2RVIQqemHVxnGTcM5uctZOeES5eqeidEfLCcEgGEj1uWM3y0BgVqEHnVmx3k9Qtqj/h9PzEuON05EjEVnBtKMkj5I6FkVjHM28L+6g+67aJZ34qTYa2vSMRhyBhkwzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oBaIM/Bq; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oBaIM/Bq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBxss4gW3z2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 02:06:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DCE35C6482;
	Tue, 11 Mar 2025 15:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A29C4CEEA;
	Tue, 11 Mar 2025 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741705564;
	bh=teU+hXn+Myk6jvRF7qkBDarMFZ6al5Sl9daMvda9Ukc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oBaIM/Bqfh8/3MNUYVgxrIQJEhr6ZPeS/8BCrv5G8DdiayVywmIXTJkn3lDUoqxmj
	 6aX6/T6KHlZSvrLWCxCEqBK5qan1qguUumpD6WriYfqMGhYKZV8hqSWJGyxW/yxriR
	 Z4t6MvD1DXxlaQGpnFhBVM9cg4JtTijjp9QflCoE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.4 059/328] module: Extend the preempt disabled section in dereference_symbol_descriptor().
Date: Tue, 11 Mar 2025 15:57:09 +0100
Message-ID: <20250311145717.241367846@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311145714.865727435@linuxfoundation.org>
References: <20250311145714.865727435@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
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
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

5.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

[ Upstream commit a145c848d69f9c6f32008d8319edaa133360dd74 ]

dereference_symbol_descriptor() needs to obtain the module pointer
belonging to pointer in order to resolve that pointer.
The returned mod pointer is obtained under RCU-sched/ preempt_disable()
guarantees and needs to be used within this section to ensure that the
module is not removed in the meantime.

Extend the preempt_disable() section to also cover
dereference_module_function_descriptor().

Fixes: 04b8eb7a4ccd9 ("symbol lookup: introduce dereference_symbol_descriptor()")
Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Helge Deller <deller@gmx.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20250108090457.512198-2-bigeasy@linutronix.de
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/kallsyms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 1f96ce2b47df1..d84b677c728a9 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -63,10 +63,10 @@ static inline void *dereference_symbol_descriptor(void *ptr)
 
 	preempt_disable();
 	mod = __module_address((unsigned long)ptr);
-	preempt_enable();
 
 	if (mod)
 		ptr = dereference_module_function_descriptor(mod, ptr);
+	preempt_enable();
 #endif
 	return ptr;
 }
-- 
2.39.5




