Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD29FA726
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 04:21:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CVJP6KlwzF69Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 14:21:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="n3+kqv5l"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CSVs3S5ZzF5R4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 13:00:21 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7782122467;
 Wed, 13 Nov 2019 02:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573610419;
 bh=P+UQtROkCA51/TMMU3JLQRCuGXr6mCdR6xtD5hFuvU4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n3+kqv5ltnrMobpiIp5BKI+BEX/PARISuZMrqyc6dFNrIa5Q7vP96kqQ6J93mD0T1
 KfU/4Srz0FbTQdiLYEcIg3BlK7O7KgYD6+mke3Qzg24BLOB4w0IrTrZHBRkvUPZU2b
 OZ7hxZK7XQkQcydhBT3BkysdnsF2SE07ObSMnp88=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 29/68] KVM: PPC: Book3S PR: Exiting split hack
 mode needs to fixup both PC and LR
Date: Tue, 12 Nov 2019 20:58:53 -0500
Message-Id: <20191113015932.12655-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015932.12655-1-sashal@kernel.org>
References: <20191113015932.12655-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Cameron Kaiser <spectre@floodgap.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Cameron Kaiser <spectre@floodgap.com>

[ Upstream commit 1006284c5e411872333967b1970c2ca46a9e225f ]

When an OS (currently only classic Mac OS) is running in KVM-PR and makes a
linked jump from code with split hack addressing enabled into code that does
not, LR is not correctly updated and reflects the previously munged PC.

To fix this, this patch undoes the address munge when exiting split
hack mode so that code relying on LR being a proper address will now
execute. This does not affect OS X or other operating systems running
on KVM-PR.

Signed-off-by: Cameron Kaiser <spectre@floodgap.com>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 73c3c127d8584..209cad89a11a5 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -78,8 +78,11 @@ void kvmppc_unfixup_split_real(struct kvm_vcpu *vcpu)
 {
 	if (vcpu->arch.hflags & BOOK3S_HFLAG_SPLIT_HACK) {
 		ulong pc = kvmppc_get_pc(vcpu);
+		ulong lr = kvmppc_get_lr(vcpu);
 		if ((pc & SPLIT_HACK_MASK) == SPLIT_HACK_OFFS)
 			kvmppc_set_pc(vcpu, pc & ~SPLIT_HACK_MASK);
+		if ((lr & SPLIT_HACK_MASK) == SPLIT_HACK_OFFS)
+			kvmppc_set_lr(vcpu, lr & ~SPLIT_HACK_MASK);
 		vcpu->arch.hflags &= ~BOOK3S_HFLAG_SPLIT_HACK;
 	}
 }
-- 
2.20.1

