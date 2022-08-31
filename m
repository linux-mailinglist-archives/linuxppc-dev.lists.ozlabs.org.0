Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8655A72E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 02:46:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHQTG57m9z3cDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 10:45:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=bg4.exmail.qq.com; envelope-from=yuanjilin@cdjrlc.com; receiver=<UNKNOWN>)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHQSn31FFz3bc8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 10:45:20 +1000 (AEST)
X-QQ-mid: bizesmtp89t1661906702tacmp2wv
Received: from localhost.localdomain ( [182.148.13.26])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 31 Aug 2022 08:45:01 +0800 (CST)
X-QQ-SSF: 01000000000000D0E000000A0000000
X-QQ-FEAT: ILHsT53NKPgLPSHQc+3alBEDo3E+b66UsNeloFQYZyjTsUQP+GBcWJ8GsC2+T
	3uoK1s805FksAjqgfvKZEXtbX+6opyFPYfV69z/8hI0gfMbV4U7+vpUSaUBRWrmeGdfgaJW
	0xWPnsEl+EDQ6M551sw0XhWBok3eDSAne2LBrrlSA+mrOOnPwr2pQnbKRIITbwIXErk/PxC
	UFCpg9RAZlTrilqS39yQVgTkXBGRWIB4C4DAu93UYPIeEBHNwoUXXNSNaYygrzPGxyGd2at
	rDzMQfXO6Hp41IsXd/kxasNcKnFdRIwLcR/PXC7M1OOiWjka6kC5hNOZ9uyc5OvCGJ6K+1g
	rpVt5c/GpSO+mP5HtI=
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com
Subject: [PATCH] KVM: fix repeated words in comments
Date: Wed, 31 Aug 2022 08:44:54 +0800
Message-Id: <20220831004454.33921-1-yuanjilin@cdjrlc.com>
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

Delete the redundant word 'that'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index e9744b41a226..8e4b42b5f37f 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -1601,7 +1601,7 @@ long kvm_vm_ioctl_resize_hpt_commit(struct kvm *kvm,
  * is valid, it is written to the HPT as if an H_ENTER with the
  * exact flag set was done.  When the invalid count is non-zero
  * in the header written to the stream, the kernel will make
- * sure that that many HPTEs are invalid, and invalidate them
+ * sure that many HPTEs are invalid, and invalidate them
  * if not.
  */
 
-- 
2.36.1

