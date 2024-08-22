Return-Path: <linuxppc-dev+bounces-353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA795B7A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 15:56:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqPrj5gNLz2yVP;
	Thu, 22 Aug 2024 23:56:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724331986;
	cv=none; b=Ba2qNumg8QkT2vcbevrtB8o6xd8t8UJGEQ+qYVIfRS19+roDsixLBPR9qloR13j0I8sgguNJl3F5ZkqhwJYWTWNoZzk1r/PQcHfEEvdnLaiBaXsRw4kZZNh99SBCL+cb64YqQ+lpUrA5wOePb5mvqj8GpJ5eTdlRAvXEnmXRUgOLquyJ64BjTsKmWym+5MlQBRoLckMJQv9oaBM+7uZlzRYJbLxvNO5++RUkoYToa+ghRABBrDCE2gOHTNFYX82MJxk60xCwRZWCcX+xgJ25LsS9/Qa1yGLaGZ4Sp29bNQzD+7s6GRmsMbhSnjdwDXFm3qU3ujVvsOBaSHOmr/D46g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724331986; c=relaxed/relaxed;
	bh=921j/24/Be4vV8u4s0X/UfL0Gpw3v5Tnzyehi4xGo78=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=E0YRzR+f7VaAGOb6gxyA9c+1lq3Gv8XvG4SsLP3cKiA69rX1hlczhRC+5ItEQV/40vxR2gjy715PcIJ56cug7Uut3cL/tuxpJw8f3JUrwWavgL8BFg6QogmdTipAR5ZLkg4X1cBTCjp0pAbmTVE+k8dxor0ZFxecnVd4CeUY12U1TCvYFN+cEmKLyFqyGEMqpl8+BZTTI24vPrMevr2n0+C5qoFCOgojN/xT/NtSjSi2pz9lNRIx7ZXKX6c/zJx6NKgxv6dQwRJP6ObVvH2Mb3/KGMZzP84gL6V2OBkZd8CkKEGPTzSHzngSABQ1bKFBdExRpzGDdz2oGkUpRza4Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqNkT6Z8nz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 23:06:25 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WqNkC4BB4z2CnJ4;
	Thu, 22 Aug 2024 21:06:11 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id A912B14044F;
	Thu, 22 Aug 2024 21:06:11 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 22 Aug 2024 21:06:10 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <akpm@linux-foundation.org>, <david@redhat.com>,
	<Liam.Howlett@oracle.com>, <tglx@linutronix.de>, <cuigaosheng1@huawei.com>,
	<bgray@linux.ibm.com>, <joel@jms.id.au>, <bhelgaas@google.com>
CC: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH -next 1/4] powerpc: Remove obsoleted declaration for _get_SP
Date: Thu, 22 Aug 2024 21:06:06 +0800
Message-ID: <20240822130609.786431-2-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822130609.786431-1-cuigaosheng1@huawei.com>
References: <20240822130609.786431-1-cuigaosheng1@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The _get_SP() have been removed since
commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc"),
and now it is useless, so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/powerpc/kernel/process.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 3b506d4c55f3..e7b70c2cc001 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -72,8 +72,6 @@
 #define TM_DEBUG(x...) do { } while(0)
 #endif
 
-extern unsigned long _get_SP(void);
-
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 /*
  * Are we running in "Suspend disabled" mode? If so we have to block any
-- 
2.25.1


