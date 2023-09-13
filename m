Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED18B79E356
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 11:16:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UZnU9q9Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlvvr5YFbz3cX7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 19:16:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UZnU9q9Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlvpJ4JGrz3bTn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 19:11:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0CEBDCE2119;
	Wed, 13 Sep 2023 09:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D91D0C433B7;
	Wed, 13 Sep 2023 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694596290;
	bh=bsiAkaMvKHJ8sfxsJeVn258mkWA5FSw33dTSUOWHas8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UZnU9q9QFDvXlXG7WRocQh52frUAROYYIH8tkS0hiZyenSjvEFpyC1xg0xhej6S+w
	 oOVelyXIVu/CTu/v+ben0u5z8q7Gb9D3Sj7D6KkGivNRN7mrHDv7D6pGYlqe5nNvfk
	 RX1wRi2rw9sefO3Blb/ODAR+fdSP4vVS8vBistGbN5lQBhvl3kqc5MOoTzCpyRNSJQ
	 Ncb0X+jtheS73ITYh2XjksAkw6IV5ZauGe7tQza52Rgf4Xu6iDQZ2rY67Lg5jXCv7p
	 8VpjeO+lFg82Xgo/6KVqj7TrLW49i4MxFpQBiTupD9mMcxoNDKCE7gnK5zvEEiNhY9
	 wJMLQ9Yzt/K1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23D2CA551A;
	Wed, 13 Sep 2023 09:11:30 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 13 Sep 2023 11:10:58 +0200
Subject: [PATCH v2 4/8] x86/vdso: Remove now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230913-jag-sysctl_remove_empty_elem_arch-v2-4-d1bd13a29bae@samsung.com>
References:  <20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com>
In-Reply-To:  <20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com>
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
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>, 
 Alexey Gladkov <legion@kernel.org>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=mobvr+1RgXQsfarnPqkIwzTWvcFKWXaq/pj/RSIk4eU=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlAXy+NsgXY5S9mwVEQGhj4lM9wRuJzSo3tbcRP
 WD9kEpUcv+JAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZQF8vgAKCRC6l81St5ZB
 TxObC/9Z4dNEvfnMP1bUXWKfUoJirbjQe+i6TcQ6EY2ZoXS0+6CjRcjGOnh11RNPS4YBwzf6u+O
 mXPr1yV6j5IazDCs+LXcgb7XhWpvHgGOE4+DuAXD/hvf+fDEKkSYxxFmJXLNtk/PQ9e+8NGxQUx
 7kwnx9OpemaKoBQpRVr7M/Nodalu52YPoyNwE377qdVdES+l0p9lUzR+019muavTD6q3IEhV17b
 sJAQhhOzSSySjyIAX/+tvd7NS3cBfT0tk9NaoKeg9wtyNkcedTqKgUg5Z6pPi7wq26YSI5cizb1
 aIKJtE/YvtJDkq/qkbYjon4fMarirUWNOxO5BO9EzR4zihF+QxTYMTw4fdHO7uTeWxxvHXIAUpX
 EenIpLPD2kxY1m2yuSvY+gQ0tQDPtHZ/vpF3ZB08YDZYJ2ra4dHQ37KlDSsrjCjXLdBbZAzC75x
 mwBVBmEnYN4uf9TFa8H3zRLf+nlvlG7jNFi7QFKWEEVI8pTKMXEKALUjbeRpCzok85jHQ=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received:  by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
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

Remove sentinel element from abi_table2. This removal is safe because
register_sysctl implicitly uses ARRAY_SIZE() in addition to checking for
the sentinel.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/x86/entry/vdso/vdso32-setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso32-setup.c b/arch/x86/entry/vdso/vdso32-setup.c
index f3b3cacbcbb0..37b761802181 100644
--- a/arch/x86/entry/vdso/vdso32-setup.c
+++ b/arch/x86/entry/vdso/vdso32-setup.c
@@ -66,8 +66,7 @@ static struct ctl_table abi_table2[] = {
 		.proc_handler	= proc_dointvec_minmax,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
-	},
-	{}
+	}
 };
 
 static __init int ia32_binfmt_init(void)

-- 
2.30.2

