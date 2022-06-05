Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA253DA46
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 07:33:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LG4z352kjz3byk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 15:33:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DC8iPQcO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=linmq006@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DC8iPQcO;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LG4yR5F4Qz3bkC
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jun 2022 15:32:45 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id j7so10367679pjn.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Jun 2022 22:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nS6GixGg0X/K0hARwKVVjwZtlk3sOYNjMOr3Fp274I=;
        b=DC8iPQcOCYF6u8bsWeP5y1eXm1SdBW9Xw5KxTrNQ36MGP6Qt6ueiiKz4w4P48A8oQ4
         iFLNeAxpdqoDvVEmlnJgh6N5A7fhMwvDu/rkFdS6ahCREBeMIh09E+vnIN6ICfjCrmry
         Xy6N0MxWc3yJvleJzGu3TLOJwKKXxCGqdDneF8aXiV1zZO5h0jXdHR7RlAIvzE09hkKe
         0jvtAROlvxBa9WmV+WuvzCP3JSMpFuLrs6c+hkvGuhO2od7sgYNXH8pBCHuDp27QDopt
         TZeDTykzML5stnA1b925cRN4L81egGsUINn8VJ9mUgZnpB9Chj/Af2MsfYD8TjJ14BpJ
         +37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nS6GixGg0X/K0hARwKVVjwZtlk3sOYNjMOr3Fp274I=;
        b=O8BzfQl5DM2QMIkiBncgnshV0we+rjCjo5PAlbXeJKYHiJKxqC0cEghV3NJt8RXUck
         DBpNU++sHzyXs5gjSbARpxEm7vATQk88t13EB7U4Kj7bXN+xNbmdRBmedadWkQjlfIRS
         yVazR6dNtjNhXb8QfZ6H8cgfNk4my+m/hQhuMKLX4V3C02KrO09TMg8ZazGR374OkW2q
         cIvB5twu/1evIi4qWzUC/e8fZpjA7oHIOSwSiek2mI+OIfprMtnh92jYFwFSX1NLIGaJ
         PdAbw7Wx5HVcVcbSTvB08z6TE0dbGGVWxwjVM0sF8M5RRgeQC5PDYewlaji6O3TRRPCm
         8g5A==
X-Gm-Message-State: AOAM530Me7GwcgZTwMDtiAFZMaSvpl32L/lVibu4FF96Q98vN50Pe7yL
	i9vZiNcUflcQo52NC8fVaCY=
X-Google-Smtp-Source: ABdhPJy8kLoluj27W3hJN/R+Mte0wZHenNHtyFccibnXmjSpD+q7PklVpGrImgzUnmAOhCUDR0wgrw==
X-Received: by 2002:a17:902:e1cc:b0:164:1517:e8bf with SMTP id t12-20020a170902e1cc00b001641517e8bfmr18236330pla.98.1654407160432;
        Sat, 04 Jun 2022 22:32:40 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id m6-20020a1709026bc600b0016370e1af6bsm5262068plt.128.2022.06.04.22.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 22:32:39 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Ammar Faizi <ammarfaizi2@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Nick Child <nick.child@ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/xive: Fix refcount leak in xive_get_max_prio
Date: Sun,  5 Jun 2022 09:32:23 +0400
Message-Id: <20220605053225.56125-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_find_node_by_path() returns a node pointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: eac1e731b59e ("powerpc/xive: guest exploitation of the XIVE interrupt controller")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/sysdev/xive/spapr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 7d5128676e83..d398823d138e 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -717,6 +717,7 @@ static bool __init xive_get_max_prio(u8 *max_prio)
 	}
 
 	reg = of_get_property(rootdn, "ibm,plat-res-int-priorities", &len);
+	of_node_put(rootdn);
 	if (!reg) {
 		pr_err("Failed to read 'ibm,plat-res-int-priorities' property\n");
 		return false;
-- 
2.25.1

