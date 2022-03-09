Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FF94D325B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 17:01:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDH4P3zW5z3bl5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 03:01:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDH3z6bFFz30R0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 03:01:02 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KDH3w1Cbbz9sSX;
 Wed,  9 Mar 2022 17:01:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRnn4hWTF2dx; Wed,  9 Mar 2022 17:01:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KDH3l1YmVz9sSp;
 Wed,  9 Mar 2022 17:00:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 242978B780;
 Wed,  9 Mar 2022 17:00:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ybvdwAuHuPGL; Wed,  9 Mar 2022 17:00:51 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E6EAC8B763;
 Wed,  9 Mar 2022 17:00:50 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 229G0gYf3615079
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 9 Mar 2022 17:00:42 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 229G0fsj3615077;
 Wed, 9 Mar 2022 17:00:41 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [v4,1/2] Revert "powerpc: Set max_mapnr correctly"
Date: Wed,  9 Mar 2022 17:00:28 +0100
Message-Id: <20220309160028.3614979-1-christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216121109.157605-1-wangkefeng.wang@huawei.com>
References: <20220216121109.157605-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646841598; l=61; s=20211009;
 h=from:subject; bh=K/GHGLFqpS3SqWCl68PupQPxce6PL/KQQ3V/MSamcZI=;
 b=xouoc7Mtevf3NPUlFZPoGaBj5hEom+2raD/qXBo3bZ6CRG4ITbGTp4WxOfCGKA4wSk9z9mNsi7RJ
 YMjzDC0JAHHz2D3bnphlUSLJhpBWkiMKD4qkOtPGOhj35BpH3Nq8
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
