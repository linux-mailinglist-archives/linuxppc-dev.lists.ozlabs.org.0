Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C839D03A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 19:43:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FykPp1kfVz309P
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 03:43:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FykPQ0M0pz2yWT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 03:43:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FykPD5sk3zBBbP;
 Sun,  6 Jun 2021 19:43:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCk2U_ulrj21; Sun,  6 Jun 2021 19:43:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FykPD4wNxzBBZn;
 Sun,  6 Jun 2021 19:43:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 987C28B770;
 Sun,  6 Jun 2021 19:43:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9H6RTjQbUkHE; Sun,  6 Jun 2021 19:43:12 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B1C98B763;
 Sun,  6 Jun 2021 19:43:12 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 15B9B64C49; Sun,  6 Jun 2021 17:43:11 +0000 (UTC)
Message-Id: <b175c35ce1596603bf321a5193e89400ae180057.1623001343.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] Fixup for "[v2] powerpc/8xx: Allow disabling KUAP at boot
 time"
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun,  6 Jun 2021 17:43:11 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel test robot reported:

>> ERROR: modpost: "disable_kuap_key" [net/phonet/pn_pep.ko] undefined!
>> ERROR: modpost: "disable_kuap_key" [net/phonet/phonet.ko] undefined!
>> ERROR: modpost: "disable_kuap_key" [net/decnet/decnet.ko] undefined!
>> ERROR: modpost: "disable_kuap_key" [drivers/tee/tee.ko] undefined!
>> ERROR: modpost: "disable_kuap_key" [drivers/input/evdev.ko] undefined!
>> ERROR: modpost: "disable_kuap_key" [drivers/input/joydev.ko] undefined!
>> ERROR: modpost: "disable_kuap_key" [drivers/input/mousedev.ko] undefined!
>> ERROR: modpost: "disable_kuap_key" [drivers/input/serio/serio_raw.ko] undefined!
>> ERROR: modpost: "disable_kuap_key" [drivers/fsi/fsi-scom.ko] undefined!
>> ERROR: modpost: "disable_kuap_key" [drivers/watchdog/mv64x60_wdt.ko] undefined!
WARNING: modpost: suppressed 13 unresolved symbol warnings because there were too many)

disable_kuap_key has to be exported. Use EXPORT_SYMBOL() as userspace
access function are not exported as GPL today.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/8xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index a8d44e9342f3..fc663322ba58 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -257,6 +257,7 @@ void __init setup_kuep(bool disabled)
 
 #ifdef CONFIG_PPC_KUAP
 struct static_key_false disable_kuap_key;
+EXPORT_SYMBOL(disable_kuap_key);
 
 void __init setup_kuap(bool disabled)
 {
-- 
2.25.0

