Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41011351620
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:23:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6Py1trXz3hN9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:23:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=T9kUlkqW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T9kUlkqW; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB621014Zz3cmJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:05:44 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id v8so1150576plz.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IJEvM9Y0R5fJ4PQtNl58AGya3n8tEM4D8HRDtgMTjFU=;
 b=T9kUlkqWDb/nXLcrousYt/NW/TzNk3XUjpCSLg/sHkNR2JwOIf54mk8rdsopmYzAdt
 1zFZH0+78dPyQmBB/Uqg4Pm826/tjXGCeBHVWl+4HcvOIqTfTXwPsewrigchORMpSK/8
 4XKgjFpIVD9D5VyzrX2yi+ilGbz4KgFT3CXN9+hZ1wv9Klyp9nlr+9HOUtu3a/MPAUBh
 LNHFdr4JiHhRid3q/tHcO32pAoVqQIC/S0zkgUz52aw5+GpZ8cXg5iR9y3lXlSDb0Z6U
 J7dLLvz1HZqo+W0Ti+ZxtbWlRl97fYKOXWiefATLFFeVKhubQEj5snlkNHct6iWd2bqG
 F9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IJEvM9Y0R5fJ4PQtNl58AGya3n8tEM4D8HRDtgMTjFU=;
 b=Pal8ADaBXQcTiLghaEcqsPsdyR/Y9qj7Hq/LlGW+tI0jO9yOof4OA/qpeNUeMxp+wB
 QaPqij1UsZIKf2Fq3bnTlJw/xu3veD3329V0nduQIL8DS9cY2fHoXKkkMCjxPteHVcjl
 GHJ6vYFbuLRVhoYbQ/MXTpKu1CkGgi6C5NpoGnhWFzOpwESQAnjHkz0j65eNDrqYCsw0
 KtASp9LNQUqC15i70WO6th3hpALslyzNSPLUsO4r1oM4admNrpzzc9LCet9NRUQS2nH+
 D3scc+7em5R2G3oBvpaszKtejHmF05pyFjICy39CH2K14hxGJSoRyIT4z2FYr3M1y10p
 XUIA==
X-Gm-Message-State: AOAM531d6/BGDdaLRDe1pWATyXZFZGbAxPFT1+X7Stf95b7LNeTTOLTr
 dcjaIXOJL+fOS1C1lDkoBhU=
X-Google-Smtp-Source: ABdhPJxPEwsgOyPs2T5PvbzFgO/8a1P4XdC7Uk6GoRvFgIxVlYoP+7h+QRj553dcVSnuw8Rpllab9A==
X-Received: by 2002:a17:90a:8a8b:: with SMTP id
 x11mr9217633pjn.151.1617289543199; 
 Thu, 01 Apr 2021 08:05:43 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:05:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 42/48] KVM: PPC: Book3S HV: Radix guests should not have
 userspace hcalls reflected to them
Date: Fri,  2 Apr 2021 01:03:19 +1000
Message-Id: <20210401150325.442125-43-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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

The reflection of sc 1 hcalls from PR=1 userspace is required to support
PR KVM. Radix guests don't support PR KVM nor do they support nested
hash guests, so this sc 1 reflection can be removed from radix guests.
Cause a privileged program check instead, which is less surprising.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index ae5ad93a623f..f4d6ec6c4710 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1403,11 +1403,20 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		int i;
 
 		if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
-			/*
-			 * Guest userspace executed sc 1, reflect it back as a
-			 * syscall as it may be a PR KVM hcall.
-			 */
-			kvmppc_core_queue_syscall(vcpu);
+			if (!kvmhv_vcpu_is_radix(vcpu)) {
+				/*
+				 * Guest userspace executed sc 1, reflect it
+				 * back as a syscall as it may be a PR KVM
+				 * hcall.
+				 */
+				kvmppc_core_queue_syscall(vcpu);
+			} else {
+				/*
+				 * radix guests can not run PR KVM so send a
+				 * program check.
+				 */
+				kvmppc_core_queue_program(vcpu, SRR1_PROGPRIV);
+			}
 			r = RESUME_GUEST;
 			break;
 		}
-- 
2.23.0

