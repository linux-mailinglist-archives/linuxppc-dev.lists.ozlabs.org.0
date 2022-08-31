Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BDD5A72F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 02:50:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHQZB3xY3z3blS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 10:50:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=bg4.exmail.qq.com; envelope-from=yuanjilin@cdjrlc.com; receiver=<UNKNOWN>)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHQYq40Z3z2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 10:49:51 +1000 (AEST)
X-QQ-mid: bizesmtp69t1661906962thnq9p1l
Received: from localhost.localdomain ( [182.148.13.26])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 31 Aug 2022 08:49:21 +0800 (CST)
X-QQ-SSF: 01000000000000D0E000000A0000000
X-QQ-FEAT: E5VoqBf3byi/RxEYnkB0AwLa8zBDUlpRF2tTlzL8C1vwovpwf/jD96EJ9dEsN
	rAUsAmOkgimCuWj+/CRH8A8bVUW58V3xWFCYyJtC/rwUlodaeg/suIDT97A9SL/710f5br5
	sI8Nu38ci3nfLX2BIuJC44/1+c4X3f6JGHhjq+YocWXC6KQlmWEno03Wh0KWPiur/kKB+of
	InBmTCZTKjsIm0awul/2CcgfnAZDvgdshtGvVVTw25UV27MyQ7UGFZMPFJ7urBV8bkge2uI
	SA5qJO1qfpeA6tZZ2p1OyJ62VGsGhB6oPzSMOA28fVQur5AllFTPW4YhOBeRzGD54+yqbW2
	Pt44f3mey/Zj2jE/kxG2d0i0IAX8PDBRTYd4dW9QMs2J6mJW5A=
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	gustavoars@kernel.org,
	Julia.Lawall@inria.fr
Subject: [PATCH] powerpc/vas: fix repeated words in comments
Date: Wed, 31 Aug 2022 08:49:14 +0800
Message-Id: <20220831004914.37055-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Delete the redundant word 'the'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index c0799fb26b6d..40f5ae5e1238 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -431,7 +431,7 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
 	 * The window may be inactive due to lost credit (Ex: core
 	 * removal with DLPAR). If the window is active again when
 	 * the credit is available, map the new paste address at the
-	 * the window virtual address.
+	 * window virtual address.
 	 */
 	if (txwin->status == VAS_WIN_ACTIVE) {
 		paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
-- 
2.36.1

