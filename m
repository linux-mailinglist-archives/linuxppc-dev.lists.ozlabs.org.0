Return-Path: <linuxppc-dev+bounces-12805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43765BD7252
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 05:12:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clzm50TNPz2ytg;
	Tue, 14 Oct 2025 14:12:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760411540;
	cv=none; b=LMt85NimMxWxCAd9g1JNfoGpfWwyiaRzGyi9pyTCDOC4btPlMUx0QtNe9Ob/tgfaA+rT+O/vYrmFNG+rg6s4/+LH8h5vG5s//4EPSQ2f2+IXiU+VS28ynFMuf110KztSTb8CqAG8X6FBFNEwRGeVn/F5nL7UUC30vxk3IM80NH3n4+al0L86CqgbwUUnBFIXLit5N8LKaQsDGx7Q64DtYR3PDuTmlQ0/czc8yL8XuOsFRfTOWu9baR9IXRSi0wkhAUvIYj+kADA500MwqPdkA2fLvYpbLKleVqNB5mbOpYoogKuSq0pz6rdryCuVn/yV+aM95ysM2zS3Z3cnsx9odg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760411540; c=relaxed/relaxed;
	bh=I4HeOQzfgCrWQcmEF2AnH59fhcej+PEy63wCuUrjulo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oKVRc9clL3MNbAUSanRKR6UMM18fc3hNmDjkdjk7CSysbub+Jtar6IMew58iZLf/eLQQsEEuz6CMnPj/h3egOkTdZGFG1ueSrWOcf1iTkgNWkkObGEkJ5CF4GSLc+jJRCIS5psXtkCBNNmppy5kpHz4+9H2WQErl9x2D75Tmp7qX781Q8jB8/YCZUEQjbUkaw2aWSFW5s3QglN6ttSY8jph/fKIFaVCJvbfCHD6QzvsnFNwhKGZKMptGk7boGKyscf6+giNlWRV5N4spirvhaUEAtsZ/lbfZnMVMN2n1HjIG7a6aFxDwk4zp6cZLlbooMzo6w3M/SNKFrAwJ0c37xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=eD85pTw5; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=eD85pTw5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clzm20BCMz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 14:12:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=I4HeOQzfgCrWQcmEF2AnH59fhcej+PEy63wCuUrjulo=; b=eD85pTw5f7k+i1H8tTGNRRyRH6
	/RGWbaizJDsYbr/NQ64bFMKJ6Ctkg/yoYz++QWHAH51QyJP0pCCoDm4xCglHWWl8TEy9XmvdHAPWM
	u069mvvo4qNyoy9rlxWaejOHpW9Dr3UURqLXW1sXv0qrgQqcIYoPYEl2C+deo/tleVbzSrQ7/uIln
	7Jpp9OA/61j0Mb2ogut8Or5sQgDz8jzUJxQQFC4JVFdolkLv9ljQYIf4xq87OEQp2WWlocIPN/5+k
	N7S6vo1XfTkS5N1fZbJqiL49uS5mxD3veW6hi86clqtm8syWrr14LHV8fwqlwVQCLDEEQjRk8e0Ay
	q1a8vYDQ==;
Received: from [50.53.43.113] (helo=smtpauth.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSD-00000001apR-2Obj;
	Tue, 14 Oct 2025 03:12:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Tiejun Chen <tiejun.chen@windriver.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: kgdb: fix kernel-doc warnings
Date: Mon, 13 Oct 2025 20:11:58 -0700
Message-ID: <20251014031158.762720-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove empty comment line at the beginning of a kernel-doc function
block. Add a "Return:" section for this function.

These changes prevent 2 kernel-doc warnings:

Warning: ../arch/powerpc/kernel/kgdb.c:103 Cannot find identifier on line:
 *
Warning: kgdb.c:113 No description found for return value of 'kgdb_skipexception'

Fixes: 949616cf2d30 ("powerpc/kgdb: Bail out of KGDB when we've been triggered")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Tiejun Chen <tiejun.chen@windriver.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/kgdb.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20251013.orig/arch/powerpc/kernel/kgdb.c
+++ linux-next-20251013/arch/powerpc/kernel/kgdb.c
@@ -101,7 +101,6 @@ static int computeSignal(unsigned int tt
 }
 
 /**
- *
  *	kgdb_skipexception - Bail out of KGDB when we've been triggered.
  *	@exception: Exception vector number
  *	@regs: Current &struct pt_regs.
@@ -109,6 +108,8 @@ static int computeSignal(unsigned int tt
  *	On some architectures we need to skip a breakpoint exception when
  *	it occurs after a breakpoint has been removed.
  *
+ *	Return: return %1 if the breakpoint for this address has been removed,
+ *		otherwise return %0
  */
 int kgdb_skipexception(int exception, struct pt_regs *regs)
 {

