Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E9E793C8B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 14:23:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BTOvay+l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RghP84V8fz3bTP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 22:23:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BTOvay+l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgdJG1B8xz2xm6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Sep 2023 20:04:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C89360FDE;
	Wed,  6 Sep 2023 10:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE7CEC433BD;
	Wed,  6 Sep 2023 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693994649;
	bh=4qu6gNf1P779rn1wd4BnvavbHAx8Qh/H9OngrcT0avw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BTOvay+ljaBED9elt4djmeJQK4mwQhiBE2AFfBF+/Wba07j+eCNKbDlUWbg3RpBDw
	 hGmvsrZBZRQN6ojN6QuRL90gXHQ+S77viY+Jvpn1Zazw8J4hBnNjQ1X6wDu6RGm2aX
	 AT3/yya8ZgE+dq5MrLZZAwB8zm9nJjCGkcw+6J4Ums1J4F21+rxmhb8CnLXJ2qN9Dk
	 UNa5hTht1yl2vR5HK/8m2/4Us34yldYRFwpdsUf+oLFdiPUgJMas4iJPFr0DnvYDET
	 cdKEB0Q9J7lPiBpgo3FsBxD/iR4gzuy6loxD29M4zow3QzJOcIO4xsZUdExd/kTpTg
	 xhBKv1/AiWH2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D673BEB8FB6;
	Wed,  6 Sep 2023 10:04:08 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 06 Sep 2023 12:03:25 +0200
Subject: [PATCH 4/8] x86 vdso: rm sentinel element from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230906-jag-sysctl_remove_empty_elem_arch-v1-4-3935d4854248@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=vL1EzsjYbFXKFrtK9nHJVvAi8tmBe++iatkzXK58byA=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBk+E6VLWSScWJxr1IbmgKPa1RZW7ObxI6WU/TSb
 /w1xzkBrsGJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZPhOlQAKCRC6l81St5ZB
 T411C/4nYVxay01MI0fYlh2tXeRCZT4XrLhFpLHSsLO88W+1QBZQtZ8gO2vM+93YWSmHFkQoCsR
 KcoJwZ+EkkMf8WsQfME5NZZe9QqAWa0BuN3fag7YtX7JeDKjC5MraH/M3Zm35qVZ29hSCd/4mDY
 8DDTvWypGbwepR7WT38A30v9LrG80iOyooAB06kaGaxwXBA3ii+b2P6VHUVMlvMLuWkUOyok6/z
 nA2x0x83Wvsq170HlyQKHOBwap14ZhJ6OPoFSyTWUr6U983PpnqsfDmTcYgdE+OARYk8x4Ngmcx
 IRZjjJbvj2Sm+tgS6ENeITYZVJd8V0y0m8MU6xbC9ZLpoWEJGxj6JLAvO/ZSPaiRekoLloMAteJ
 es6duh9rqCsTesV5rsulOZIo6tufJTM0rY9CFw8vaGH/f/Kt3xBuSdy2fhgoBSo+hfeoGpSsKyE
 sbPcJ2atpAF8XbaZ3GdfKliG0jmCzxzi14sxh9li2gbxkwNwKNDKPBCYFUWsOqoMQezN8=
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

Remove sentinel element from abi_table2.

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

