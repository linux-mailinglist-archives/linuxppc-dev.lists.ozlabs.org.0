Return-Path: <linuxppc-dev+bounces-354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D631595B7A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 15:57:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqPs45bh3z2yZ4;
	Thu, 22 Aug 2024 23:57:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724331989;
	cv=none; b=GiskqytnmrBoBA7cW4Nmizumgn9BlkNlzu4Fq22ElUPX3tb6HekeHCd+F6gctKfb1gRQLTszwQ/dAcJxOjHp36RCWZGipIm1DuwcWWkKOP1vg6Tqb1rwPDakOplQW8E3L9aTYyczc58HUR0ETVB+TG3LQ0+azWZkF7c/ZSKhKDEct0PhXGfJmVqlBcuGl4Cc+bSG62loA4g/Rn7CA8Ew3Igx3KImjpNtkc5VwUNZ5Q7oRwaYXFH6ieyefELvEjknD2hb3Lb9ksRtJ1cMANOgcqiDTQ3pxMYJHKZs421Ly5F8o8ic4vFc7y7kHQeTXqudkBceONKWpoybhFNQb/up/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724331989; c=relaxed/relaxed;
	bh=7AZe7hcXM70RvjBX60MWw8wnqetCyARPo/0RbgTd2xg=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy; b=GbOP7vPdxUnKoIvN2BpNQFIplg4hmmwR4ykboAQlnnr5dNja6fupj33hVF0zHqwqVUgYHOBuZv8H931lJBpQwWDGMGz8OQdkco6CGvuHbcUFEiPpoWizCQYt/lmNRFECKscg5HELR8IAfEA1u/OyXIgazZIIFliRx7WRJF8KiFe1ShPsEvJ5NA1DL5b6s8wsW3H9kziBEQ3HroCi+t2j6Puvv6KLWVuDbWwPW8BHAOrQV3K9c7XAj4yiyjqUblMPQTcZrDlNmpu/X9suRNguMM7Q1iZXu67kCpd/E4aRan8vpZpxYVY/LgcCFj6LCuTkRLdj3Q3HxlgfmUAMAwevFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqNkY1cFqz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 23:06:29 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WqNh70Zh7z1xvn9;
	Thu, 22 Aug 2024 21:04:23 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 293B31A0188;
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
Subject: [PATCH -next 0/4] Remove obsoleted declaration for powerpc
Date: Thu, 22 Aug 2024 21:06:05 +0800
Message-ID: <20240822130609.786431-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
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

Remove obsoleted declaration for powerpc, thanks!

Gaosheng Cui (4):
  powerpc: Remove obsoleted declaration for _get_SP
  powerpc: Remove obsoleted declaration for maple_calibrate_decr
  powerpc: Remove obsoleted declaration for pas_pci_irq_fixup
  powerpc: Remove obsoleted declarations for use_cop and drop_cop

 arch/powerpc/include/asm/mmu_context.h | 3 ---
 arch/powerpc/kernel/process.c          | 2 --
 arch/powerpc/platforms/maple/maple.h   | 1 -
 arch/powerpc/platforms/pasemi/pasemi.h | 1 -
 4 files changed, 7 deletions(-)

-- 
2.25.1


