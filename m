Return-Path: <linuxppc-dev+bounces-12854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51529BD989B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 15:06:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmDx2676Gz3cdR;
	Wed, 15 Oct 2025 00:05:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760447158;
	cv=none; b=fGnFzPdbyJOfS/QAkal5G7EbB8Q2jBdEaKuL07DuUcTJY0Q9F/wNPEQF2yzAli9zEQP/aJgjyWCxLqNcKxYWXLVzva+UcmikYXo+H2OokJJAsBexxI9dJVGbzswuYqbTeL7NNE6IvbG4lnnOuw+S8p0yK4MS9FO7T0m+6Xkw+Q81HXIgBdfMQf7RmMPHpaw6bY67ssKmate/9nu4EziI6ee2MaiU9faz7k3857YIZw2L9ccMsWo8ZjxAwKA6OaQx4X922482pwsR/GZcrUrgzsVdJ44W6n7jbYboSXWY/NRgUCPUNc4MkR010vkf66VMt69ah2vKHGTiSPjfg03TbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760447158; c=relaxed/relaxed;
	bh=rmWsgXe/EUJlh3Oqic3jAEqEyRP4824MK4HzVDJVrYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEgkSFlC8gwbBJ2z9nFc/WNpOETRFUIfmegrkVQ3rmb7oCd+hazKH220gVTDA9THfRZB1O9Kdbbq5fFzs8AMyfAGs6HrH+1pJPBnWRFfsNxuXCLsxxEptkGTyok0PN6hYwdZEzDPGtOSHQZQBa95Zh0A4D7SaeLfQJZzNPJnzgKQpb3XHT6QcDPKYFRttBu1pndhI6IMfS092lHcc0QXuU6oTjlx8b5pU3wG3tlcK04bfrXc8dqPeUqMwEA/shcAo51yiOCf9GtD5yzIHOAX5MzU+gz7mpHlxmHWpaJh5kwr91bk0T6ceWMrjQt5FGCHNXex5R06GX/5H45l+amOFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L6TpQNh7; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=C8AAY+K/; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L6TpQNh7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=C8AAY+K/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cmDwz55Y6z3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 00:05:55 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmWsgXe/EUJlh3Oqic3jAEqEyRP4824MK4HzVDJVrYI=;
	b=L6TpQNh7Vb8hlDonYQwENXkD64j52H59yc/Kb8VjJ6hEGCsGrURA/TSoLYPqPKPy+v7+CF
	i5QpAoY/QaDuIQtziFgIqe3wuE7blMwjVWQ3xuxQYy9vzsoiT1LWrkdUbSOTZ8sR1FjDtZ
	fKLXrqO7/b4QvE/vyglIm6iTxIzdRvaA7+7nv32D75VtEcv9SS4GfR8Fw5lhnzsd8BRwuR
	7F87BGld5J/KWnpMWzEXYt03tOWSrAxX1xUG9y/pDcBeAlVS9SaqFzm53ra9MB+ObiCjID
	9AVH20CII2f5VWgO0tZAZwwbzbhuWa4CIEyVtaoyndKBAsU9wOXROlw3UyK1HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmWsgXe/EUJlh3Oqic3jAEqEyRP4824MK4HzVDJVrYI=;
	b=C8AAY+K/Vpov18nnCiOgJypH4XE/Z4j8vzRNImlx/xoZGX4JCR77rgTkUawUW8aIh3iarf
	XBuD81oOW8Hum1DA==
Date: Tue, 14 Oct 2025 15:05:16 +0200
Subject: [PATCH v2 01/10] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1486;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=IDhCA1BagrOzAKjk7RuNtb+m/Zg87sOWHgJNO4N/lzs=;
 b=2GBDxIG9QU3kONJteRcQFaut1ha2ZM7A46rDztSe+RBbZ/fhVoTctHwgcHlR3TApjkzsEu0sX
 faVc067JB5BDIb+TLHZhVg0TdYAJhlc1qUyldatX+RhG2bGSRhmA55P
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

It is possible that the kernel toolchain generates warnings when used
together with the system toolchain. This happens for example when the
older kernel toolchain does not handle new versions of sframe debug
information. While these warnings where ignored during the evaluation
of CC_CAN_LINK, together with CONFIG_WERROR the actual userprog build
will later fail.

Example warning:

.../x86_64-linux/13.2.0/../../../../x86_64-linux/bin/ld:
error in /lib/../lib64/crt1.o(.sframe); no .sframe will be created
collect2: error: ld returned 1 exit status

Make sure that the very simple example program does not generate
warnings already to avoid breaking the userprog compilations.

Fixes: ec4a3992bc0b ("kbuild: respect CONFIG_WERROR for linker and assembler")
Fixes: 3f0ff4cc6ffb ("kbuild: respect CONFIG_WERROR for userprogs")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/cc-can-link.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/cc-can-link.sh b/scripts/cc-can-link.sh
index 6efcead3198989d2ab2ab6772c72d8bb61c89c4e..e67fd8d7b6841e53341045b28dc5196cc1327cbe 100755
--- a/scripts/cc-can-link.sh
+++ b/scripts/cc-can-link.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
-cat << "END" | $@ -x c - -o /dev/null >/dev/null 2>&1
+cat << "END" | $@ -Werror -Wl,--fatal-warnings -x c - -o /dev/null >/dev/null 2>&1
 #include <stdio.h>
 int main(void)
 {

-- 
2.51.0


