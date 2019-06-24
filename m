Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C72150396
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 09:34:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XLfK0blRzDqHK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 17:34:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="fr1nAfXR"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XLMW016czDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 17:21:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45XLML6hfCz9vBmm;
 Mon, 24 Jun 2019 09:21:50 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fr1nAfXR; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bVhUwPat72lk; Mon, 24 Jun 2019 09:21:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45XLML5gX7z9vBml;
 Mon, 24 Jun 2019 09:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561360910; bh=uqSyYAuIgffBR0A50tqUgIECoBVIQIvOhmxv2zbmqbg=;
 h=From:Subject:To:Cc:Date:From;
 b=fr1nAfXR5k6RCYhXpFmkXlofj/WpB8XH4YC/0LFO0OhP69azmMA6IGpHAfjGd+4m+
 tYsax/ac4Gu2NlzvTyIQTSEA8uy/GECXazhRwLKdFxxy0NBEeyyIUCDlHT67I+nh6O
 sZR6Ppy3Ror5TQufdkvkxgYv6F5SYIouDAGgjCFI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EC0A8B787;
 Mon, 24 Jun 2019 09:21:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id a_sM-AAY_GJE; Mon, 24 Jun 2019 09:21:55 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F2078B74C;
 Mon, 24 Jun 2019 09:21:55 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 44DB467424; Mon, 24 Jun 2019 07:21:55 +0000 (UTC)
Message-Id: <cover.1561360551.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 0/4] Additional fixes on Talitos driver
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Mon, 24 Jun 2019 07:21:55 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is the last set of fixes for the Talitos driver.

We now get a fully clean boot on both SEC1 (SEC1.2 on mpc885) and
SEC2 (SEC2.2 on mpc8321E) with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS:

[    3.385197] bus: 'platform': really_probe: probing driver talitos with device ff020000.crypto
[    3.450982] random: fast init done
[   12.252548] alg: No test for authenc(hmac(md5),cbc(aes)) (authenc-hmac-md5-cbc-aes-talitos-hsna)
[   12.262226] alg: No test for authenc(hmac(md5),cbc(des3_ede)) (authenc-hmac-md5-cbc-3des-talitos-hsna)
[   43.310737] Bug in SEC1, padding ourself
[   45.603318] random: crng init done
[   54.612333] talitos ff020000.crypto: fsl,sec1.2 algorithms registered in /proc/crypto
[   54.620232] driver: 'talitos': driver_bound: bound to device 'ff020000.crypto'

[    1.193721] bus: 'platform': really_probe: probing driver talitos with device b0030000.crypto
[    1.229197] random: fast init done
[    2.714920] alg: No test for authenc(hmac(sha224),cbc(aes)) (authenc-hmac-sha224-cbc-aes-talitos)
[    2.724312] alg: No test for authenc(hmac(sha224),cbc(aes)) (authenc-hmac-sha224-cbc-aes-talitos-hsna)
[    4.482045] alg: No test for authenc(hmac(md5),cbc(aes)) (authenc-hmac-md5-cbc-aes-talitos)
[    4.490940] alg: No test for authenc(hmac(md5),cbc(aes)) (authenc-hmac-md5-cbc-aes-talitos-hsna)
[    4.500280] alg: No test for authenc(hmac(md5),cbc(des3_ede)) (authenc-hmac-md5-cbc-3des-talitos)
[    4.509727] alg: No test for authenc(hmac(md5),cbc(des3_ede)) (authenc-hmac-md5-cbc-3des-talitos-hsna)
[    6.631781] random: crng init done
[   11.521795] talitos b0030000.crypto: fsl,sec2.2 algorithms registered in /proc/crypto
[   11.529803] driver: 'talitos': driver_bound: bound to device 'b0030000.crypto'

v2: dropped patch 1 which was irrelevant due to a rebase weirdness. Added Cc to stable on the 2 first patches.

v3:
 - removed stable reference in patch 1
 - reworded patch 1 to include name of patch 2 for the dependency.
 - mentionned this dependency in patch 2 as well.
 - corrected the Fixes: sha1 in patch 4
 
v4:
 - using scatterwalk_ffwd() instead of opencodying SG list forwarding.
 - Added a patch to fix sg_copy_to_buffer() when sg->offset() is greater than PAGE_SIZE,
 otherwise sg_copy_to_buffer() fails when the list has been forwarded with scatterwalk_ffwd().
 - taken the patch "crypto: talitos - eliminate unneeded 'done' functions at build time"
 out of the series because it is independent.
 - added a helper to find the header field associated to a request in flush_channe()
 
v5:
 - Replacing the while loop by a direct shift/mask operation, as suggested by Herbert in patch 1.

Christophe Leroy (4):
  lib/scatterlist: Fix mapping iterator when sg->offset is greater than
    PAGE_SIZE
  crypto: talitos - move struct talitos_edesc into talitos.h
  crypto: talitos - fix hash on SEC1.
  crypto: talitos - drop icv_ool

 drivers/crypto/talitos.c | 102 +++++++++++++++++++----------------------------
 drivers/crypto/talitos.h |  28 +++++++++++++
 lib/scatterlist.c        |   9 +++--
 3 files changed, 74 insertions(+), 65 deletions(-)

-- 
2.13.3

