Return-Path: <linuxppc-dev+bounces-2035-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A7D999046
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:30:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWP6y0nz3cK8;
	Fri, 11 Oct 2024 05:26:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584801;
	cv=none; b=Mn/+dKVtwhG6CfzI5uS93zzEWFFUnbQFC2XNX5V9gzsskk7QYNMglBDluEcWy4pCwNx9Yppy4+ut4tNKU6AFK73sD1kQHowjRopvHV+pMkVveJKUjGaYCGHSdR1C2E8ak5vbr5QRdnLUOR0w4tDQfV3S0GTDS67Y568hwYveDYERevKzfUcGiO1MojLwpA5Hu+vYeXCq9u4CgVR5xfm7/hw+sZuu11yFSmwju5LJJeX++pBcCOLEank/EuX+PLX8Kk1XMawNIHsok/BfIomq6tQe1rQf/CxrFh3FDg52x91OE4T7VYO+PVJMrQXkLu4ybnfd1DmsWP1eRT/TcO7GeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584801; c=relaxed/relaxed;
	bh=iay4RI/uPKTQE0By5qqA//dP+sG5w7++36T/RHxbCNM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bCn2pq5m9BBvTnfU1Go++jxwgqpwiNL/+8Ug5zivR4nhcsuzBjv8+y7eBiTSqDMgtZA8+R0HJEMPaBXyy1sdB5zCQQGs2paBYx1UC96/a4YnRys2SYtSFoz5TAhWZXBBpO6kR1hZ8TiVd2ezWcrTXo2q3gVRKRBYnHFw9lTjejzCo3dBNBV/0qsQhuMUNdW/5zsp0K/k9QPezzh+A26vCde1sO/xokZ5eOI4PbDIwWhODeolUgcJfIiwgSRLL8LzuGU14Ve0QRHckmnSKEmRYmn0WGMc9FxedEw4pwz0qAe1bYjqZ+HtRC693JTEtx+dxxOIaFhA68PdGn7n97oXDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lwzAc8cA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3xhwizwykdpupbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lwzAc8cA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3xhwizwykdpupbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWP1xK5z3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:41 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso1173230a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584800; x=1729189600; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iay4RI/uPKTQE0By5qqA//dP+sG5w7++36T/RHxbCNM=;
        b=lwzAc8cAd8Co9wd7pP95Mjo8q6KB3BkBToeUnZx37M4Vl14oMEejPDQjmqK+GE7LcJ
         uI2UMTSiJ0bWSIJcBjIeoxKOl9zg+qbScubZzY8cz6A7m5qifVsrSRhLs9H+m1Ucg4ex
         J3+R5ENhkC+cSiXGJHnsipYFvtg0wybf+G5KbB6jbBq0FdRx55Kv4P26apZsOq2Uzcq6
         PUA6Bcxge/qb+756V7zjB82wPlqXKy9rl41j7uUHzrEURjZ5PTkGx5a4V6ZTjYfvjoCN
         BdS3PMsrqkhUzmlFsjnCf+0kTOg1bvl/ZuzWVJA+HWPw+qh+M9sSwmEIFYoG6XCVIEmW
         tzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584800; x=1729189600;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iay4RI/uPKTQE0By5qqA//dP+sG5w7++36T/RHxbCNM=;
        b=jDs5JpHzRFQ5BG18YxOxrpi/OZZitngs+TAbfKeU5matb7FhmrrTHMXayBqCeLWcBd
         mv/NJZFZPccKKJe1uzEj1DdIrICkKniZ9wfM5QG5d5BusOgZsi9M41GGfmSliKaGpjaN
         5bGCSvwkQ4ABg8qvG+TC7OJ4xSs/6BfIZwL9deURIN5cR1ykY7EVs9Xgx3uXDkSsAMZh
         iAN7N2/qS+KZMj03E6nGgqApWnAI45onQe+efBIF4k+ma4QfWr0OhIFXrPBqvb5XUDLt
         QUMS1PohDVDqIyJXzsqA7hW6AUEbucVWrCTK78KB9e4QvOwBq3lpl/UfJnmG9wUJ0R0+
         DSMA==
X-Forwarded-Encrypted: i=1; AJvYcCVMBg1hQ1XY4lc/jnMr3CYOPWQXofqBtwtFm7zJkGjYuGOJ+ed8Wi+/o1R5yNZG4FfV7bXmpSqXAHVWOjI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyggalxA28VzfzinUotqhwSDiWtMwc1fuuXzgLad51Bp3kWLHPM
	QG6aoghuGkSSZ7GvQCMuBiloYVnuKG7xNVj0V1KiQeucwbqNv23DPDgUs0PQSQPWAffCOhEkab6
	6TA==
X-Google-Smtp-Source: AGHT+IEd4uxjZrUyEQQM0MU+jkiJqh3LQboji5/ZXtrCgOTVgrRv0yMO5ln1NKE0y5PwnoqkXxjnsp8xFDc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:fe86:b0:2da:872e:9ea4 with SMTP id
 98e67ed59e1d1-2e2f0d7e9d7mr54a91.3.1728584798284; Thu, 10 Oct 2024 11:26:38
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:52 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-51-seanjc@google.com>
Subject: [PATCH v13 50/85] KVM: VMX: Hold mmu_lock until page is released when
 updating APIC access page
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hold mmu_lock across kvm_release_pfn_clean() when refreshing the APIC
access page address to ensure that KVM doesn't mark a page/folio as
accessed after it has been unmapped.  Practically speaking marking a folio
accesses is benign in this scenario, as KVM does hold a reference (it's
really just marking folios dirty that is problematic), but there's no
reason not to be paranoid (moving the APIC access page isn't a hot path),
and no reason to be different from other mmu_notifier-protected flows in
KVM.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 1a4438358c5e..851be0820e04 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6832,25 +6832,22 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu =
*vcpu)
 		return;
=20
 	read_lock(&vcpu->kvm->mmu_lock);
-	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
+	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
 		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu);
-		read_unlock(&vcpu->kvm->mmu_lock);
-		goto out;
-	}
+	else
+		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
=20
-	vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
-	read_unlock(&vcpu->kvm->mmu_lock);
-
-	/*
-	 * No need for a manual TLB flush at this point, KVM has already done a
-	 * flush if there were SPTEs pointing at the previous page.
-	 */
-out:
 	/*
 	 * Do not pin apic access page in memory, the MMU notifier
 	 * will call us again if it is migrated or swapped out.
 	 */
 	kvm_release_pfn_clean(pfn);
+
+	/*
+	 * No need for a manual TLB flush at this point, KVM has already done a
+	 * flush if there were SPTEs pointing at the previous page.
+	 */
+	read_unlock(&vcpu->kvm->mmu_lock);
 }
=20
 void vmx_hwapic_isr_update(int max_isr)
--=20
2.47.0.rc1.288.g06298d1525-goog


