Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C685057722A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 01:10:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlkTb5DWzz3dpZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 09:10:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.154.54.12; helo=smtpbg.qq.com; envelope-from=dengshaomin@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 66 seconds by postgrey-1.36 at boromir; Sun, 17 Jul 2022 02:52:22 AEST
Received: from smtpbg.qq.com (biz-43-154-54-12.mail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LlZ5f3yPPz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 02:52:21 +1000 (AEST)
X-QQ-mid: bizesmtp87t1657990239teyjhwb7
Received: from dengVM.. ( [117.176.186.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 17 Jul 2022 00:50:29 +0800 (CST)
X-QQ-SSF: 01000000002000305000B00A0000000
X-QQ-FEAT: znfcQSa1hKYBdNSsPE0n0Ic6uyByVa0Q/4DcDgw9qHw/NFgyPR6dxtdIn5jps
	HTNaW63K+h6hAT/sp8tayZHTNut6qq1TjN2rxJzB4y4DjKy+ye8v19MVb1EK7GPwpsJQeaH
	l1VhJlgkyjS4JJVv70Hi1Hf2SvJ6iboEV9jeOpNjE6lQ7xAaq4a4EYfuf8LAmr+VoO0hMVj
	SisQXdjAzC8PWjalktzASvhMma8LJQCBt3rT8JwDXiD+7p2woxbCdb02sRo/foGWZx0uSHp
	xzb1+hC6LTlF3KHxDB1hnDujc61ZDSzWgpMWvrSz3/+1z2Qi806etD1yJP/i0NyXuicNIkt
	pLbCYC4/uC/XoOT7BY6P4kHoG/01v/imukJL+zo5x97fuwp/VM=
X-QQ-GoodBg: 0
From: shaom Deng <dengshaomin@cdjrlc.com>
To: mpe@ellerman.id.au,
	farosas@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	inux-kernel@vger.kernel.org
Subject: [PATCH] kvm:remove the unexpected word "that" in comments
Date: Sun, 17 Jul 2022 00:50:28 +0800
Message-Id: <20220716165028.17693-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Sun, 17 Jul 2022 09:09:19 +1000
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
Cc: shaom Deng <dengshaomin@cdjrlc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

delete the repeated word "that" in comments

Signed-off-by: shaom Deng <dengshaomin@cdjrlc.com>
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
2.34.1

