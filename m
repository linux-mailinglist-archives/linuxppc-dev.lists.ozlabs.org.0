Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFBE45A87F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 17:39:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz8xj2JmJz3dbK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 03:39:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NUl2xQIH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NUl2xQIH; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hz8v10qWQz30Ph
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 03:37:33 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AB6460FBF;
 Tue, 23 Nov 2021 16:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637685451;
 bh=dTY20x9C7ILrJLF2x3WFcgP0Fw/5b/QS5q+eMTnwQ/Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NUl2xQIHSLEE19HIJKYSrwwOLVA3JNA3U5diWaN16oMpj7OEMxop1W2oiO7NBD7hR
 3LMeqWHfzAf2xzpIlOyig2nvqO7Vr60tXWmGs2zEloBE/uM2CqDqzDhmqRkay1rc71
 Yab/VPIoFBvmDh5jFoQZDhdwZM9GD+55VGyI21ktDfbk7wlz1j4hoCvfxn7jAk6a+W
 BL3VjZab6iKX8IswYkRc+b7luxiNINqDFYcon1RtlB1cXsxCsOGw0vNK5x/wLHdAxe
 WlXYmTtOVTCU0VevPGpzW0UEE6YA/CUqu/IimwOASf4rMGjlKiH799XHgYiX15RXLh
 PmR0RHAj0uz6Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH MANUALSEL 4.14 2/3] KVM: PPC: Cap KVM_CAP_NR_VCPUS by
 KVM_CAP_MAX_VCPUS
Date: Tue, 23 Nov 2021 11:37:23 -0500
Message-Id: <20211123163725.289694-2-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211123163725.289694-1-sashal@kernel.org>
References: <20211123163725.289694-1-sashal@kernel.org>
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
 jgross@suse.com, farosas@linux.ibm.com, ndesaulniers@google.com,
 bharata@linux.ibm.com, clg@kaod.org, npiggin@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
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
index af1f065dc9f37..d3832f1f17003 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -624,9 +624,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		 * implementations just count online CPUs.
 		 */
 		if (hv_enabled)
-			r = num_present_cpus();
+			r = min_t(unsigned int, num_present_cpus(), KVM_MAX_VCPUS);
 		else
-			r = num_online_cpus();
+			r = min_t(unsigned int, num_online_cpus(), KVM_MAX_VCPUS);
 		break;
 	case KVM_CAP_NR_MEMSLOTS:
 		r = KVM_USER_MEM_SLOTS;
-- 
2.33.0

