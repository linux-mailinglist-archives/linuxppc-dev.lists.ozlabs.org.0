Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F48D57F766
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 00:47:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrdbF0Wbkz3c52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:47:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=smtpbg.qq.com; envelope-from=wangjianli@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 113 seconds by postgrey-1.36 at boromir; Sun, 24 Jul 2022 15:44:17 AEST
Received: from smtpbg.qq.com (unknown [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrBv51YFyz2xKq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jul 2022 15:44:16 +1000 (AEST)
X-QQ-mid: bizesmtp81t1658641306twz9vf55
Received: from localhost.localdomain ( [125.70.163.183])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 24 Jul 2022 13:41:44 +0800 (CST)
X-QQ-SSF: 01000000002000007000B00A0000000
X-QQ-FEAT: cHidGA2rQwyAyU3ofjyHh1llcWAxjWPyQbM9Hva8mIGipCcfclJB8jIqu/Hc+
	VBmhw+ioVNQ2yKrwvJsNXFj7lD9A13xTP/vX48qYF+pb6SL3cW2N+faGhPXPzG2FpYTweMm
	1yrRR2cPiTJdYyv5P7ar/NuaA7JctpI/NumVana7EwQu98raXnzezDP7foQquvECaIfROde
	7+SegYhfZ8k1oj2e0WDF0teDJjT2NzpeoFydb1rQFmrtZkcCzQotEZyLHzszco6QWF0WvHI
	sf9S65yxxMWLGWbGhHgxxMY++Wq/k4vXf9DMg8sMOaa88Xo+5JqAct5cxzZaVnp/rLfR4Cy
	qdZVxoAmXkL1CDKiRw=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] KVM: PPC: Book3S HV:fix repeated words in comments
Date: Sun, 24 Jul 2022 13:41:37 +0800
Message-Id: <20220724054137.58504-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Mon, 25 Jul 2022 08:46:47 +1000
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
Cc: Jianli Wang <wangjianli@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jianli Wang <wangjianli@cdjrlc.com>

Delete the redundant word 'do'.

Signed-off-by: Jianli Wang <wangjianli@cdjrlc.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index e08fb3124dca..17d79be6077d 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5643,7 +5643,7 @@ static int kvmppc_clr_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
 	else
 		kvmppc_xics_clr_mapped(kvm, guest_gsi, pimap->mapped[i].r_hwirq);
 
-	/* invalidate the entry (what do do on error from the above ?) */
+	/* invalidate the entry (what do on error from the above ?) */
 	pimap->mapped[i].r_hwirq = 0;
 
 	/*
-- 
2.25.1

