Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB7CEE45
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 03:17:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tNtq5b8bzDqP4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 11:17:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=tobin@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="q7gOVqI+"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tNsN0089zDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 11:16:39 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D05DF21FED;
 Mon, 29 Apr 2019 21:10:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 29 Apr 2019 21:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=c8rP92N4ywgTy0CI4
 uV13/RhNnhdhHkkmq5K58OlFZg=; b=q7gOVqI+/OW320Nm92TAhwq6pdaQ8zFol
 r8B8hEsAab5FVpqHvg+kZQawXQ4J9IscJLVAZUEcRINko2QqM/iS6KyiVnOd8/Oq
 v6VRqVNokyhQ8YCYsij4bpKJmVMKSwG66OHSEGd5Ga5Zpa9EfYn8fsa/rnsY//KK
 2/JG5aMlzi1nvIZbiALrLpAc6NXnSXmBOT4PJqGHbHEqslC2ZfEemVSvwXsZXtX7
 ea2SOfaNXxI8B9fKJVL//u3CmSpLXNoowdG8KvZ8G1R6qnQulgK10B1j/rTOO998
 R7OxpG1OTBIDKD10+Diakn3l/azqWi/JnYFa/CCTswXBc1BJAuSCw==
X-ME-Sender: <xms:c6DHXJ26Gf0REUwV-rgOqPX6sdDNeCBQPD_UDLJUJSUMEWYeJ1IaQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieefgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepfdfvohgsihhnucev
 rdcujfgrrhguihhnghdfuceothhosghinheskhgvrhhnvghlrdhorhhgqeenucfkphepud
 dvuddrgeegrddvfedtrddukeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohgsihhn
 sehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:c6DHXHh6K8LNshbxjd2eOSHP5nlKus3t-tTTyrhUb_g86DI5rhVLOA>
 <xmx:c6DHXHT9qOd5AaT_RehwNRRLK6H9zYyhdDYpr2W134nBuJkqu7UVUQ>
 <xmx:c6DHXAimZJ4QN0SJHPrZ7LUMj15iYPgWhD3Jaz1D3dmZr7vLBR55mQ>
 <xmx:c6DHXEhKho_rLtAE4JA2wpWRhRPqwMPlYwHWqgeZkU2V2f0sh3D9lQ>
Received: from eros.localdomain (ppp121-44-230-188.bras2.syd2.internode.on.net
 [121.44.230.188])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6802FE4173;
 Mon, 29 Apr 2019 21:10:08 -0400 (EDT)
From: "Tobin C. Harding" <tobin@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Fix kobject memleak
Date: Tue, 30 Apr 2019 11:09:23 +1000
Message-Id: <20190430010923.17092-1-tobin@kernel.org>
X-Mailer: git-send-email 2.21.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, "Tobin C. Harding" <tobin@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently error return from kobject_init_and_add() is not followed by a
call to kobject_put().  This means there is a memory leak.

Add call to kobject_put() in error path of kobject_init_and_add().

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---

Untested, did not even build.  Bad Tobin, no biscuit.

No call to kobject_uevent()?  I'll be back to check usage of
kobject_create_and_add() later, then I intend to check all the uevent
stuff, feel free to leave this for me to check later if you don't know
the reasoning straight off the top of your head.

thanks,
Tobin.

arch/powerpc/kernel/cacheinfo.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 53102764fd2f..f2ed3ef4b129 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -759,23 +759,22 @@ static void cacheinfo_create_index_dir(struct cache *cache, int index,
 
 	index_dir = kzalloc(sizeof(*index_dir), GFP_KERNEL);
 	if (!index_dir)
-		goto err;
+		return;
 
 	index_dir->cache = cache;
 
 	rc = kobject_init_and_add(&index_dir->kobj, &cache_index_type,
 				  cache_dir->kobj, "index%d", index);
-	if (rc)
-		goto err;
+	if (rc) {
+		kobject_put(&index_dir->kobj);
+		kfree(index_dir);
+		return;
+	}
 
 	index_dir->next = cache_dir->index;
 	cache_dir->index = index_dir;
 
 	cacheinfo_create_index_opt_attrs(index_dir);
-
-	return;
-err:
-	kfree(index_dir);
 }
 
 static void cacheinfo_sysfs_populate(unsigned int cpu_id,
-- 
2.21.0

