Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9448F577F55
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 12:06:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmd0S4SRvz3c5f
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 20:06:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=smtpbg.qq.com; envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg.qq.com (unknown [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmd04102rz2yJL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 20:06:11 +1000 (AEST)
X-QQ-mid: bizesmtp66t1658138720t60o43yy
Received: from localhost.localdomain ( [182.148.15.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Jul 2022 18:05:19 +0800 (CST)
X-QQ-SSF: 01000000002000E0U000B00A0000000
X-QQ-FEAT: J5JfekO1WsjnFRCaIrI9KYX73TsBVSpDrxrZytBTXGuBm4FsKT62YRtbKmS2l
	ybcFzHccw/BfsvUGYuYAjnVklOzxREmvfcNDfxMnPzZT3LSEcAC+gxSlvsfjXzFS413OitG
	iQJ14cE+YGQBGiLG8V8XxxcruMDZeY6GVOdT3T4mRGEJxnQI9eNZnlrPri8HZxfDTYO4Itf
	cDtbLjQ032MaZ9QKK0eqYU+xy98zgF4TmVrzpqPJ9cbooyd6Arn8rjcFhxEYdw5LxhnZdaY
	3f9la0Hb2HAYeWOoaaPDEa/ZJUqNAAECW8MtTRXcP48lxYjgc4fJ/cj31Ip+/Y7ztUji8A4
	QYGD1dUK0UaoTqmNkEkI7/ztp4Wv4xW63DLsXFJlnZ9j2iIMyg0vCsorDC02dlie+0/8PJ1
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: paulus@samba.org
Subject: [PATCH] KVM: PPC: Book3S HV: Fix comment typo
Date: Mon, 18 Jul 2022 18:05:04 +0800
Message-Id: <20220718100504.194167-1-wangborong@cdjrlc.com>
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
Cc: farosas@linux.ibm.com, aik@ozlabs.ru, linux-kernel@vger.kernel.org, npiggin@gmail.com, Julia.Lawall@inria.fr, Jason Wang <wangborong@cdjrlc.com>, liubo03@inspur.com, maciej.szmigiero@oracle.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The double `that' is duplicated in line 1604, remove one.

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

