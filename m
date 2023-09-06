Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C38BB793CA3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 14:28:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZP55AfhY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RghVn4rYpz3c68
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 22:28:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZP55AfhY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgdJJ1qZJz2xq6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Sep 2023 20:04:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC43360FF2;
	Wed,  6 Sep 2023 10:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4748FC116A4;
	Wed,  6 Sep 2023 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693994649;
	bh=aS1CKaB6IFSQkKTbYW+1TFmWQDgffGuIc55cdYEnypg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZP55AfhYN50EjDrCcB8iW90YByCyC9iI7NvOypziRPiBsL36v4/AH2CIRK5jiBx71
	 FFnu77u00PPBrzOpwW99gzZlzkv0btytdQzqjvyoOQMjpDCaSorBYmJ4sO0dJv58qR
	 2jsxP3XA2cOYiZH/ihFSxL88c11EEngkf3G67jxi/kOsjw6H/q5EzwPVprfDKYmmq6
	 u+i3v4S2PaNE5NWxYG44kOk4AO/h9ykWOIx+gX9L+yO1LkgWLrmIvtAUQBmwg8N0aN
	 WDMRwKzn4CxUyIfjfdILa1m5J6Nmo6MdV6iHbPJN3zWpCnEvw5Qx/tqIe9MCcDonn4
	 Q/rnhxDsvinSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D19EB8FA5;
	Wed,  6 Sep 2023 10:04:09 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 06 Sep 2023 12:03:29 +0200
Subject: [PATCH 8/8] c-sky: rm sentinel element from ctl_talbe array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230906-jag-sysctl_remove_empty_elem_arch-v1-8-3935d4854248@samsung.com>
References:  <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
In-Reply-To:  <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=7bf5/tJGBhUQ9WK71ygDU4S0n97i+v0/NjwZE0o5pgU=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBk+E6WREfxGpSEon2IoEhHuwmPhd3lTNK0oImor
 fAfRY0k+XKJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZPhOlgAKCRC6l81St5ZB
 TyDwC/9FZEUSgEzlF7Ci/QWFlhzpOZwTgs6G1qVsDC2AsbhA0jgrplsVHcwsNKyVlmGgQ5vfrta
 AH8fSSOEcSJfoy1ev1mzCDfYY+AwZD0Iy9ga2WQ2skPBd9sjsJmzzsq01zWuRA3K8vELOvAmw5X
 5wDlhgg73sM7bY5QFpAvBOUwA0iCDvesjkqvKzOcDtOI7UHvrhvA4aU707BZq6KxCZ2sjHNMG7/
 L0mYjBGd9aLOWanKzP6FdWafWJZVG1SXFRLtfhYGo1kAHi0uSOYPGzvhR0TCbXXWVgwaFfJgjyJ
 CIDqEL5JsAA1uo9NErYbwccIFdf77G8k2faRS0nqc9bwzQkHIYpauUZZgzHkq7RlWXiMx+wiIsX
 ZNw2x+uXfqg2gDOa2PUzENunfeKSWXRdUUbLHyvQylboT6rPMLIct3GIuYh6cpwNTkzK886rmRn
 7/5Cf/CQU1gWgoVV9rRFdJSkFrYISwOHblDUKSVegiC+VPuuYfY+EPVPZcrT2S+IYb74U=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received:  by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-Mailman-Approved-At: Wed, 06 Sep 2023 22:22:58 +1000
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
Reply-To: j.granados@samsung.com
Cc: Joel Granados <j.granados@samsung.com>, linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove sentinel from alignment_tbl ctl_table array.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/csky/abiv1/alignment.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/csky/abiv1/alignment.c b/arch/csky/abiv1/alignment.c
index b60259daed1b..0d75ce7b0328 100644
--- a/arch/csky/abiv1/alignment.c
+++ b/arch/csky/abiv1/alignment.c
@@ -328,8 +328,7 @@ static struct ctl_table alignment_tbl[5] = {
 		.maxlen = sizeof(align_usr_count),
 		.mode = 0666,
 		.proc_handler = &proc_dointvec
-	},
-	{}
+	}
 };
 
 static int __init csky_alignment_init(void)

-- 
2.30.2

