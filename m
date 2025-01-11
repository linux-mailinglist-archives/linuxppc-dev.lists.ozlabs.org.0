Return-Path: <linuxppc-dev+bounces-5063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7BCA0A000
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 02:25:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVLRd4rf4z3d4F;
	Sat, 11 Jan 2025 12:25:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736558701;
	cv=none; b=aLdTH35SxKMA8yzRKGIyZfH1GoBhJ/R872QvhongdxBO8ie/KbVUS4hq5LIOZF3OxOS0MrmhmYP9lyVE/aYmihm/x5RdW28UKs7Eb+71CV61OvJ2aowzejpBbs2YEs/7AZoNKCkQPZY22aoMEon2+21Ojc7xnhP0eJ25TGHv7CNsqcQqjTUTQWnmeGTstIsdBKnZ4YKRBCGZO4M6QUB8sWYfi/VlacY2T7SLgp13ftgYMxf6wE9fplFKHtQ0Cgm+7azpfshVBPTmbO0Z+2K64S6Whgqx2F0Gej265ldGCjfPQRAwv3z972nAv11uNg5/JHPGNHcNw6sMbcXXLVKvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736558701; c=relaxed/relaxed;
	bh=3UIVRx5jS5uHOad/ZRxuC+ZyfJfWx7WVNf7AHGunc9Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bX04QO53wK7dCdU+S8+yNZIn3udhf/1qtekQXWDHhqEuuGLwCfnA2VSzXmrRZEHUI6AebqH+cswGvPHej0cUbqBTAkuZU8G+3SMrgaFIXP/nrnj3OOtm87K0tiQ2aANQxZ9NMCfyAQrfqKvOezJLzOdzOAknz3fRcFVrwIJrk8eBqA7Y1KefeR+CsBi06xIXu/VU2mhnOhuhjs2SsW0J6S2WfuoNkD6em0aaC6vQ9uLPkel1kWOHKE2GkooWetzoOKPR2uK5XRSqfZ4e5aZu94c2BT0bGWyu7osjzjai1t6g9xBWaOwfLBYrFWiYb6U55v5Eu07881+VsixQt6LaXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sTHI1YSQ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3asibzwykdeuzlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sTHI1YSQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3asibzwykdeuzlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVLRc2zLGz3d4H
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 12:25:00 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso4790152a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736558699; x=1737163499; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3UIVRx5jS5uHOad/ZRxuC+ZyfJfWx7WVNf7AHGunc9Q=;
        b=sTHI1YSQapbbxpvvvnnBH8l7GS6RJXy9hL2GBjXCC+LalNCrTPrJ2qjxJjiQckDxnq
         /up9jb3jorBvZhI477haQKxrnZ7Xcj84LiYw86P0gHMLwk33RH6zm5TigbW4jP2n8HC5
         2H7GFrmZgjFCNOLqzfPjuEMAr4myxEJxUssS668ofB+SJ80RpQpgRhDAg2+PfnMqeRjF
         KozYHNG6pCV+8R3aLJsvaikuQ07Tz330soROtkzxRDGbrkBD8CYwWJISqBEF3EIY+0bP
         2tecdJpytWVuNOboXrTuqINI0Q2BDkf3CajPbBApi01bomViT3R3Seto0o+iFQqPpbCJ
         oPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558699; x=1737163499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UIVRx5jS5uHOad/ZRxuC+ZyfJfWx7WVNf7AHGunc9Q=;
        b=wSrNpPhY20yM9dk5Pg/oHUAVEU82/ueO+GQ8rRBHG8RsKJBYp556gbovLxABB58Ckf
         cOYInZEggbKGCQD5bSNWrdY/gBdPgUHbDP/odkvSgpvBe6dCatrMpX5bFmFpzjcDd4w7
         m7t2YEAB9D2f27YiGMJYIWDyoz8BBV47GYuCsovkkzpKrcvOr9GiqTwDtj5+ER5E85aF
         f8pg0oiQwxvpsX2Ig7DNliklyawKn4Pkr1d1MRHoyjLl2fdoBdKD1G3obwSjdomBNQwI
         zca1jRHMcpgNRfsSqgXJbzmxXDTnG4QqOo5ZABtgFtsvtLTjCIpFgfX3AwXoKbaOdJ81
         8axQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrFzpROifrag6T1WWw/ipKnoaiZbECtMt/QanlidbJXDUAc4AtWhlr2kHUnORIZJWYRR9Pt2ligkMTxU8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1rcZ7NZBI4chVIz5c/hO9QL39pgouGSBVo9HyTBhCys7Tx1YG
	uYz5L8lxcbz1tmlxfvCI4+CYDdpHApojPRbIWdRRsluq/oZ1l7mStJNbS7v7WtQ+IkGZLnA5VEQ
	C9A==
X-Google-Smtp-Source: AGHT+IHf025t1EVvlV+j91gbU3uZgm+9mZiPk2JrEEttgvDlmrVpnhWnRwbzCB96nhWXuJS4v4uP1KYHMJk=
X-Received: from pjbnw13.prod.google.com ([2002:a17:90b:254d:b0:2ee:4b69:50e1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5188:b0:2ee:df57:b194
 with SMTP id 98e67ed59e1d1-2f548eceb00mr17022072a91.21.1736558698928; Fri, 10
 Jan 2025 17:24:58 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 10 Jan 2025 17:24:49 -0800
In-Reply-To: <20250111012450.1262638-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111012450.1262638-5-seanjc@google.com>
Subject: [PATCH 4/5] KVM: selftests: Provide separate helper for KVM_RUN with immediate_exit
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Turn vcpu_run_complete_io() into a wrapper for a dedicated helper for
doing KVM_RUN with immediate_exit = true, so that a future patch can do
userspace exit completion if and only if it's actually necessary,
whereas x86's nested exceptions test wants to unconditionally do KVM_RUN
with an immediate exit.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h           | 9 ++++++++-
 tools/testing/selftests/kvm/lib/kvm_util.c               | 2 +-
 tools/testing/selftests/kvm/x86/nested_exceptions_test.c | 3 +--
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 4c4e5a847f67..78fd597c1b60 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -631,7 +631,14 @@ static inline int __vcpu_run(struct kvm_vcpu *vcpu)
 	return __vcpu_ioctl(vcpu, KVM_RUN, NULL);
 }
 
-void vcpu_run_complete_io(struct kvm_vcpu *vcpu);
+
+void vcpu_run_immediate_exit(struct kvm_vcpu *vcpu);
+
+static inline void vcpu_run_complete_io(struct kvm_vcpu *vcpu)
+{
+	vcpu_run_immediate_exit(vcpu);
+}
+
 struct kvm_reg_list *vcpu_get_reg_list(struct kvm_vcpu *vcpu);
 
 static inline void vcpu_enable_cap(struct kvm_vcpu *vcpu, uint32_t cap,
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 33fefeb3ca44..c9a33766f673 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1665,7 +1665,7 @@ void vcpu_run(struct kvm_vcpu *vcpu)
 	TEST_ASSERT(!ret, KVM_IOCTL_ERROR(KVM_RUN, ret));
 }
 
-void vcpu_run_complete_io(struct kvm_vcpu *vcpu)
+void vcpu_run_immediate_exit(struct kvm_vcpu *vcpu)
 {
 	int ret;
 
diff --git a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
index 3eb0313ffa39..4f144576a6da 100644
--- a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
@@ -238,8 +238,7 @@ int main(int argc, char *argv[])
 
 	/* Pend #SS and request immediate exit.  #SS should still be pending. */
 	queue_ss_exception(vcpu, false);
-	vcpu->run->immediate_exit = true;
-	vcpu_run_complete_io(vcpu);
+	vcpu_run_immediate_exit(vcpu);
 
 	/* Verify the pending events comes back out the same as it went in. */
 	vcpu_events_get(vcpu, &events);
-- 
2.47.1.613.gc27f4b7a9f-goog


