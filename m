Return-Path: <linuxppc-dev+bounces-11646-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6C7B41101
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 01:53:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGjGy2xWcz2yr1;
	Wed,  3 Sep 2025 09:52:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756857178;
	cv=none; b=g76R8OwI7aQX0WSak9sk6mcHLjehRgi5b9jthgfW5c814v/zx0NjyPUypIVNuJ7tFMV4noc3x3LcWy5OzBjlqqCZynO5lUgpCgfdMv+uknLJm0EIeksg007UmjT3XZzKj9je2CsUAOXFq8rJrIpryo2NHlSiZ6zwP3SRlZelYaH9/fsCGx1zG5rBey7RmyL3fPQM9pbM75AjuRhBkxniFdAeKv6Q06B/Z5tcW2L1N9D6wJfqQX8FO9qZ9+b7PtAvm87gf4ErL+aS0Ou3LP8zOhqxNvoOdi5EFYymHqUM8VKUUWRPd6TinNRzuqjdMp4ArGo16avykWcSQA9geJdLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756857178; c=relaxed/relaxed;
	bh=mPEoKxppaclPgthhrAwpZ2otUbemFlXjZEPevQ0K8KA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jGeBI2VaZFxXk5rQa4BkmdRD7zoRP9y3ejyoEOtFwQGo5pp1LF6fKe1aYXt1JLxljxg2IaHdek+Q5mcQofpsDinTf2lzhTSqbQNPWJAjyb8kxyOw9VcItuzs6oUKEpO9BGIhRvpTvazgsHtZVxvnIHYunz6+i7oIjD3RNGU5g+XlmuZ5PEgU8wS8BwSzHansWB/GuOP6Js8Gpf0YQAEDZL1b2xZZcsKB3zvX42/bEhB+LSmA+mysXOYUSMIsgB056tqpTa2NOUUl88DW24lPfiJRJ4RH6OXGdbtZfyM0p8Z0+F2RTxfgB0e64qLeuvTNJJsyDuWphsUq2ePGhH1dyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HSr7D5h+; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HSr7D5h+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGjGx1Zghz2xcG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 09:52:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF7AC6013C;
	Tue,  2 Sep 2025 23:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF25C4CEF7;
	Tue,  2 Sep 2025 23:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756857174;
	bh=6givWJeo2KbjB4vPFl536ZK/TBqk0kofHXgNZGIJA7Y=;
	h=From:To:Cc:Subject:Date:From;
	b=HSr7D5h+2t7T6w5sEZcnMb9TqV2Zh1xHWp4tg3ZmEOu0pjgDtXzx6JQSEMTd1eH2F
	 ajrL34w603laEBpRXbPAZgcWwZ1fU8PHltOQNjZTYsRMJkFIN/jRV1ko4QjTlW3jx7
	 8YTGvTpzBj56HBHu/vFwXTfbMN+yNakOJuSHJPVNfmaDlUk1UUkkYuW5H6hNnohvVY
	 nFxHqpDEIjO3ltHGVwX2vKiCUc2dXOJfUGQaztk2IL3K8C43hW5HVFvCgbhi302uNr
	 pPj0YwXTj0Y82ZJ5NltplVQnq0G4zz3sL7WOWndHwmagpjGmdOZO13Zrjb7PI/b034
	 uKiMCUK5e/xQw==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 5.4 only] powerpc: boot: Remove unnecessary zero in label in udelay()
Date: Tue,  2 Sep 2025 16:52:34 -0700
Message-ID: <20250902235234.2046667-1-nathan@kernel.org>
X-Mailer: git-send-email 2.51.0
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When building powerpc configurations in linux-5.4.y with binutils 2.43
or newer, there is an assembler error in arch/powerpc/boot/util.S:

  arch/powerpc/boot/util.S: Assembler messages:
  arch/powerpc/boot/util.S:44: Error: junk at end of line, first unrecognized character is `0'
  arch/powerpc/boot/util.S:49: Error: syntax error; found `b', expected `,'
  arch/powerpc/boot/util.S:49: Error: junk at end of line: `b'

binutils 2.43 contains stricter parsing of certain labels [1].

Remove the unnecessary leading zero to fix the build. This is only
needed in linux-5.4.y because commit 8b14e1dff067 ("powerpc: Remove
support for PowerPC 601") removed this code altogether in 5.10.

Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=226749d5a6ff0d5c607d6428d6c81e1e7e7a994b [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/boot/util.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/util.S b/arch/powerpc/boot/util.S
index f11f0589a669..5ab2bc864e66 100644
--- a/arch/powerpc/boot/util.S
+++ b/arch/powerpc/boot/util.S
@@ -41,12 +41,12 @@ udelay:
 	srwi	r4,r4,16
 	cmpwi	0,r4,1		/* 601 ? */
 	bne	.Ludelay_not_601
-00:	li	r0,86	/* Instructions / microsecond? */
+0:	li	r0,86	/* Instructions / microsecond? */
 	mtctr	r0
 10:	addi	r0,r0,0 /* NOP */
 	bdnz	10b
 	subic.	r3,r3,1
-	bne	00b
+	bne	0b
 	blr
 
 .Ludelay_not_601:

base-commit: c25f780e491e4734eb27d65aa58e0909fd78ad9f
-- 
2.51.0


