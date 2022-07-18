Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFCB577BF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 08:56:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmXmt5qH0z3cjC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 16:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=smtpbg.qq.com; envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 128 seconds by postgrey-1.36 at boromir; Mon, 18 Jul 2022 16:55:36 AEST
Received: from smtpbg.qq.com (unknown [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmXm818sRz3c3s
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 16:55:34 +1000 (AEST)
X-QQ-mid: bizesmtp77t1658127135tqg7psaz
Received: from localhost.localdomain ( [182.148.15.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Jul 2022 14:52:13 +0800 (CST)
X-QQ-SSF: 01000000002000E0U000B00A0000000
X-QQ-FEAT: 7jw2iSiCazrpAmasGQ+fEzHMqngiHAVkye+mDbco5m3HTtQMnqfHCd56zl2xI
	/sN7EoYT1AQvGFKDxpt1+xLBdRjibneM+QjRAJCepCekBAQ2uHURgYc8jwyxnqlmdnEu8Y6
	Lc/YIW9SF9PTyOr8pEh2HcNkB/RRxyqAni+p6j+jfjyGnyoEofzaBWe7NUPpQwnkc0LW5k2
	GATyvZ833lYJf/CV8WpOKkLw7bj9x3iTZZ3iAq1F0xv0TUcx1fmt4Ac0g30yp6qYqR4rH5G
	7rWEFNTO+y3fzWlZCacpkl6PNIj0/IYQHiecil+h3RNgd1VL5siZYBRcrRPJ3YcohlM9EL2
	Qbh3oTiYXnmMV2bi0SDQfdI9lq8POKkq6pmygeKERYpKD91ZdUk8247dc3J25fr+yMrqgm6
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] KVM: PPC: Fix comment typo
Date: Mon, 18 Jul 2022 14:51:42 +0800
Message-Id: <20220718065142.24640-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
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
Cc: Jason Wang <wangborong@cdjrlc.com>, farosas@linux.ibm.com, aik@ozlabs.ru, linux-kernel@vger.kernel.org, npiggin@gmail.com, Julia.Lawall@inria.fr, paulus@samba.org, clg@kaod.org, liubo03@inspur.com, maciej.szmigiero@oracle.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The double `that' in line 1604 is duplicated, removed one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 514fd45c1994..73c6db20cd8a 100644
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
2.35.1

