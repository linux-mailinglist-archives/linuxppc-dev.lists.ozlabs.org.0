Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE92757D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 07:32:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458dSQ08gjzDqcg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 15:32:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="vdCmLaOW"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458dHH5hDTzDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 15:24:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458dH937cGz9v05h;
 Thu, 23 May 2019 07:24:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=vdCmLaOW; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ehlel0s348Kf; Thu, 23 May 2019 07:24:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458dH926wKz9v05D;
 Thu, 23 May 2019 07:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558589093; bh=6Ko+9E7SIAp3yklxmRiFbx8heEltPezFmo0J/CKDZ4o=;
 h=From:In-Reply-To:Subject:To:Cc:Date:From;
 b=vdCmLaOWm/IS+n9pyr6myq4bvRcjhbD56xa5ejxPz9ho8EQuIYj0B9rD1Uezp/DQL
 eyoyLjqobzwOQ2hroIcfBZTloCVqy07reTVWRpo8Ddz+epoAatjX8x94vDm3hJGchz
 5l3wv+8ZmuIXtJmcWQ1yDIh0r8yePeMkt3a1PxFo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 249E28B77D;
 Thu, 23 May 2019 07:24:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id frMX2fPSVt-H; Thu, 23 May 2019 07:24:54 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 084A58B75A;
 Thu, 23 May 2019 07:24:54 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B373E684F0; Thu, 23 May 2019 05:24:53 +0000 (UTC)
Message-Id: <a6c5749a4297daa9a89f8573b4893aa8f1b96c93.1558588355.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
In-Reply-To: <20190522211724.GC456@darkstar.musicnaut.iki.fi>
Subject: [RFC PATCH] powerpc: fix kexec failure on book3s/32
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Date: Thu, 23 May 2019 05:24:53 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes: 63b2bc619565 ("powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/machine_kexec_32.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/machine_kexec_32.c b/arch/powerpc/kernel/machine_kexec_32.c
index affe5dcce7f4..b6a4250b9ee0 100644
--- a/arch/powerpc/kernel/machine_kexec_32.c
+++ b/arch/powerpc/kernel/machine_kexec_32.c
@@ -54,6 +54,8 @@ void default_machine_kexec(struct kimage *image)
 	memcpy((void *)reboot_code_buffer, relocate_new_kernel,
 						relocate_new_kernel_size);
 
+	mtsrin(mfsrin(reboot_code_buffer) & ~SR_NX, reboot_code_buffer);
+
 	flush_icache_range(reboot_code_buffer,
 				reboot_code_buffer + KEXEC_CONTROL_PAGE_SIZE);
 	printk(KERN_INFO "Bye!\n");
-- 
2.13.3

