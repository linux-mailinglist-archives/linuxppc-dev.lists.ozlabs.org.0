Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C018147A3C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 04:06:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHPd24kvpz3c9b
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 14:06:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=59.36.128.82; helo=smtpbg604.qq.com;
 envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 150 seconds by postgrey-1.36 at boromir;
 Mon, 20 Dec 2021 14:06:20 AEDT
Received: from smtpbg604.qq.com (smtpbg604.qq.com [59.36.128.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHPcX3fqrz2yHM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 14:06:19 +1100 (AEDT)
X-QQ-mid: bizesmtp54t1639969379t0j5g246
Received: from localhost.localdomain (unknown [118.121.67.96])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 20 Dec 2021 11:02:57 +0800 (CST)
X-QQ-SSF: 01000000002000D0K000B00A0000000
X-QQ-FEAT: 41KXR1NaKbO0H/MDMmDlfCm0qdxo3eLEOoQ8C7F1vC044E/M3q+AJJJPNZU6c
 LDYacxNXYg/IyAAgWVXIPkjsr+QznLng9Py0iryZAXRKsihpNAAFOuJRsgQ1FKaBo600BWV
 KjCldsMwNarRKn7Lmy6FCjb85ZHYlFLLxiICIU/zMYyCCDjyTkiIOGAbgi7DK5Gf4/levec
 wTIRcivYHm20VAJiYONP4lXdqCzA3kxSUTWLAWZXMYJ1u0S8t7jKft8nSsIIl1Z4x95yM5h
 F2X8bAGTLNMzDS8kgaP1/OtKFitYDldUe/ukvH6Ws1J7UDHSVeJ5O1TYilmKcVL3dB7lLLc
 WxGYLlz
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/kvm: no need to initialise statics to 0
Date: Mon, 20 Dec 2021 11:02:43 +0800
Message-Id: <20211220030243.603435-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam4
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org, wangborong@cdjrlc.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Static variables do not need to be initialised to 0, because compiler
will initialise all uninitialised statics to 0. Thus, remove the
unneeded initialization.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/kvm/book3s_64_mmu_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_host.c b/arch/powerpc/kvm/book3s_64_mmu_host.c
index c3e31fef0be1..1ae09992c9ea 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_host.c
@@ -228,7 +228,7 @@ static struct kvmppc_sid_map *create_sid_map(struct kvm_vcpu *vcpu, u64 gvsid)
 	struct kvmppc_sid_map *map;
 	struct kvmppc_vcpu_book3s *vcpu_book3s = to_book3s(vcpu);
 	u16 sid_map_mask;
-	static int backwards_map = 0;
+	static int backwards_map;
 
 	if (kvmppc_get_msr(vcpu) & MSR_PR)
 		gvsid |= VSID_PR;
-- 
2.34.1

