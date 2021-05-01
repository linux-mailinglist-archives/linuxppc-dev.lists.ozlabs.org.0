Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D14CA370655
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 10:16:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXMWh5Qz2z302l
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 18:16:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXMWJ5Z8dz2yR7
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 18:15:53 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FXMWB4wshz9sRr;
 Sat,  1 May 2021 10:15:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMIzFJMW1339; Sat,  1 May 2021 10:15:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FXMWB41GFz9sRq;
 Sat,  1 May 2021 10:15:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 686338B76F;
 Sat,  1 May 2021 10:15:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Y2T5rQuBPH_a; Sat,  1 May 2021 10:15:50 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 33A598B763;
 Sat,  1 May 2021 10:15:50 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 05CE0642A5; Sat,  1 May 2021 08:15:49 +0000 (UTC)
Message-Id: <f148cffa418ca0e6e4d79657fc8a9108917291ce.1619856556.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH RESEND] iov_iter: Use user_read_access_begin() instead of
 user_access_begin()
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Sat,  1 May 2021 08:15:49 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

copy_compat_iovec_from_user() only do unsafe_get_user(),
it only requires read access.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Resending with mm list in addition

 lib/iov_iter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 61228a6c69f8..fd9bd229d51d 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1932,7 +1932,7 @@ static int copy_compat_iovec_from_user(struct iovec *iov,
 		(const struct compat_iovec __user *)uvec;
 	int ret = -EFAULT, i;
 
-	if (!user_access_begin(uiov, nr_segs * sizeof(*uiov)))
+	if (!user_read_access_begin(uiov, nr_segs * sizeof(*uiov)))
 		return -EFAULT;
 
 	for (i = 0; i < nr_segs; i++) {
@@ -1953,7 +1953,7 @@ static int copy_compat_iovec_from_user(struct iovec *iov,
 
 	ret = 0;
 uaccess_end:
-	user_access_end();
+	user_read_access_end();
 	return ret;
 }
 
-- 
2.25.0

