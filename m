Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1985393FC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:21:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzhY0H4Kz3dTj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:21:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=T4l6vfKO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T4l6vfKO; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzQL42LKz309T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:09:14 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id f8so2188616pjh.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5usDmW6ESlSNZYJloJenDWYeT5fTs1KfX9oWvwN0Tg=;
 b=T4l6vfKOzrTwgLtf4lwiNSgAdN7Ofkwn++hG1WFYmxPm5SM+XFBIrTYHqQXTl01vTM
 U7zPBEptuSnLPCdcH/cLXkyWZzBL7/xn6PTeESp0wTaTuoQzypo+2/XUfMnq8heVvMva
 MyvWK0eqDBWJkOVK1yNqCijufVZKAilnbwv4FHykZi4zQzfBmGzYqCxi4g216DfO51OQ
 fF6zOiQbCdN6vX1/5tAN3AelM1hOCX8BX6Z2Kbf4yOGHp5kM3hqb5krsbpZ0HovwGA81
 lqMNX1SMILIVzwCivCpkWXYg4kZzg/8ugA+hzrSXbSg1RHAEOA2R9ChDUlDgw3vw/cq8
 Cm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5usDmW6ESlSNZYJloJenDWYeT5fTs1KfX9oWvwN0Tg=;
 b=sKAnvUuh3qgiYRs9e94ijyjIaFIRCy8sOg9teJMp6JYac0F2TcL+U5wajHU7CH9SSl
 sVlC/+nP0BlZYmyDxwqh/FqVsyw3lOd1Mo9vmaFoysp/RgN8QZmAl1JdmhPCWZkfDGYj
 tEuJVjF8EOdo0F4jyccd8ePRTp7XspIb1AHZZEN+UgtHG+BSPt+DpVOc8Z9ZZ6rP8IZu
 7CmXC/Up0r8TNCvniH7Rx2cJsSmtmTXdTQQo1m1jiWF8LUjqJft3g4bLu6Ra8/mhfVfc
 foPbMPAiDhKp3AayNnIO2hC/GSw/VXpl39R1OVBYfltMNpzlzDnU8IsyWssKHguJXdGu
 CYRA==
X-Gm-Message-State: AOAM533Csr/H5/2RYpKFTUkDSSZTsgqVtkd/rauRwZbdufQTUqvy7sT+
 Unw102pyoTUNETWO98oTngE=
X-Google-Smtp-Source: ABdhPJxg3py6r6PbIYgriPSH4VxMmO5Hz4JTIfPWk36XWCKecIn01YQwl8VGeTZO7cy61V8Emi8hRg==
X-Received: by 2002:a17:90a:ba07:: with SMTP id
 s7mr3290362pjr.129.1622192952110; 
 Fri, 28 May 2021 02:09:12 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:09:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 29/32] KVM: PPC: Book3S HV P9: Reflect userspace hcalls to
 hash guests to support PR KVM
Date: Fri, 28 May 2021 19:07:49 +1000
Message-Id: <20210528090752.3542186-30-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The reflection of sc 1 interrupts from guest PR=1 to the guest kernel is
required to support a hash guest running PR KVM where its guest is
making hcalls with sc 1.

In preparation for hash guest support, add this hcall reflection to the
P9 path. The P7/8 path does this in its realmode hcall handler
(sc_1_fast_return).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index dee740a3ace9..493f67f27d06 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1457,13 +1457,23 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 			 * Guest userspace executed sc 1. This can only be
 			 * reached by the P9 path because the old path
 			 * handles this case in realmode hcall handlers.
-			 *
-			 * Radix guests can not run PR KVM or nested HV hash
-			 * guests which might run PR KVM, so this is always
-			 * a privilege fault. Send a program check to guest
-			 * kernel.
 			 */
-			kvmppc_core_queue_program(vcpu, SRR1_PROGPRIV);
+			if (!kvmhv_vcpu_is_radix(vcpu)) {
+				/*
+				 * A guest could be running PR KVM, so this
+				 * may be a PR KVM hcall. It must be reflected
+				 * to the guest kernel as a sc interrupt.
+				 */
+				kvmppc_core_queue_syscall(vcpu);
+			} else {
+				/*
+				 * Radix guests can not run PR KVM or nested HV
+				 * hash guests which might run PR KVM, so this
+				 * is always a privilege fault. Send a program
+				 * check to guest kernel.
+				 */
+				kvmppc_core_queue_program(vcpu, SRR1_PROGPRIV);
+			}
 			r = RESUME_GUEST;
 			break;
 		}
-- 
2.23.0

