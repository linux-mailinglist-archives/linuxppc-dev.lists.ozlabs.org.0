Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A6345A85C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 17:38:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz8vW42MHz3c5d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 03:37:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c04qlRVu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c04qlRVu; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hz8tQ0ndPz3bXW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 03:37:01 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 563A160F6E;
 Tue, 23 Nov 2021 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637685419;
 bh=0qoABYIWPz/i/2BXkoi4DDqKFFhFRhxnqrrJebmH65c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c04qlRVuZcye/IQAMovvRYlw8QVz23U58I8eSwpoAMcRxdOF4Gjz3EqIT5jgm3kx7
 7r5sUumuRDBr5H9qSXlrvkrreIcRHu5tTg+b5HgkLXp5mOrqmI0Lze/f38I83BQ35x
 oAQ8GW3Ywnl0KHS85dh4LbC13RqArlMF4y6P5FOu1yMwsY9dgWZ9mkFdMjGNHRxkED
 z1uWdCOd5ZaiouIepuWtU0QcbPKf+s3h96adzAozmAr1Sts21OoOfjKFDzqXpjh1iT
 H0f+I+AnWOUqeZqQXmK0PeBKfaSa0P7JcsBKUw1MZe0IDXFD2e20IeK35KE0HRvaqc
 K2sMnisaht+Pg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH MANUALSEL 5.10 3/5] KVM: PPC: Cap KVM_CAP_NR_VCPUS by
 KVM_CAP_MAX_VCPUS
Date: Tue, 23 Nov 2021 11:36:47 -0500
Message-Id: <20211123163652.289483-3-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211123163652.289483-1-sashal@kernel.org>
References: <20211123163652.289483-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, ravi.bangoria@linux.ibm.com,
 farosas@linux.ibm.com, ndesaulniers@google.com, bharata@linux.ibm.com,
 npiggin@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 clg@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

[ Upstream commit b7915d55b1ac0e68a7586697fa2d06c018135c49 ]

It doesn't make sense to return the recommended maximum number of
vCPUs which exceeds the maximum possible number of vCPUs.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20211116163443.88707-4-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/powerpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 543db9157f3b1..e0e8ec387970d 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -641,9 +641,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		 * implementations just count online CPUs.
 		 */
 		if (hv_enabled)
-			r = num_present_cpus();
+			r = min_t(unsigned int, num_present_cpus(), KVM_MAX_VCPUS);
 		else
-			r = num_online_cpus();
+			r = min_t(unsigned int, num_online_cpus(), KVM_MAX_VCPUS);
 		break;
 	case KVM_CAP_MAX_VCPUS:
 		r = KVM_MAX_VCPUS;
-- 
2.33.0

