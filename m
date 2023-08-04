Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67521770199
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 15:31:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHRSy1tTsz3dBc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 23:31:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHRRt0MMVz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 23:30:49 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RHRRj1Z67z9tG1;
	Fri,  4 Aug 2023 15:30:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FgkrcVIQj0Ix; Fri,  4 Aug 2023 15:30:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RHRRh2ysSz9tG0;
	Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FA3C8B779;
	Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wWXsQFPE5NmN; Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 196828B776;
	Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 374DUWgq693291
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 4 Aug 2023 15:30:32 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 374DUWoO693290;
	Fri, 4 Aug 2023 15:30:32 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, robh@kernel.org
Subject: [PATCH net-next v2 01/10] net: fs_enet: Remove set but not used variable
Date: Fri,  4 Aug 2023 15:30:11 +0200
Message-ID: <90b72c1708bb8ba2b7a1a688e8259e428968364d.1691155346.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691155346.git.christophe.leroy@csgroup.eu>
References: <cover.1691155346.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691155809; l=1161; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=1XAaJLMONzSd2iIwcw4mWmUDcjud5RsErtzfQSfgx6Y=; b=yv0dpbhhdGmEy3AcHzzFkyL4OQo4TlEOSX+SAZVT1CVRoJrB7hMRpQUk3KDv65H8dGeLbEkuL UsFUO/sc9QKB92srVn8ZaZTgPKRpTmmAZgovE8KXlTU/G248rf5GGPM
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  CC      drivers/net/ethernet/freescale/fs_enet/fs_enet-main.o
drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c: In function 'fs_enet_interrupt':
drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c:321:40: warning: variable 'fpi' set but not used [-Wunused-but-set-variable]

Remove that variable.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index f9f5b28cc72e..a6dfc8807d3d 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -318,14 +318,12 @@ fs_enet_interrupt(int irq, void *dev_id)
 {
 	struct net_device *dev = dev_id;
 	struct fs_enet_private *fep;
-	const struct fs_platform_info *fpi;
 	u32 int_events;
 	u32 int_clr_events;
 	int nr, napi_ok;
 	int handled;
 
 	fep = netdev_priv(dev);
-	fpi = fep->fpi;
 
 	nr = 0;
 	while ((int_events = (*fep->ops->get_int_events)(dev)) != 0) {
-- 
2.41.0

