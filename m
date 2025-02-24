Return-Path: <linuxppc-dev+bounces-6440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F33DA4315C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 00:56:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1yL26dfCz2yRd;
	Tue, 25 Feb 2025 10:55:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740441354;
	cv=none; b=n9O+TP27d+/yDA5ao198petRvHtIJTiPktTE/oU7KM+vJVgZHOVz2o2pu5IoJoYL72tIXYr0MYmimOzttg2cafL8plaW3Npq8wxzIL2SeihksE48ugXLdiVfC4z9GUsZ6gZJzLODrjbx27N2/fNWUOZ6m238ykBgcQ5HEvEcoVPfihQDmovQQoHJd1iVlKTk5vx+xTnu7DH72NRPXGErtqDRY05ias8PBk/cUrCOBPMNZsZFp/A15J5cAuS0nSaHMexYlhGiCm3rFpVyU/WHhGRhj9+CaO8DpLVVe+vFdQNucwpord7Xmx6mpxvAxHtRFkh0XTQqs5ojc14ea5aR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740441354; c=relaxed/relaxed;
	bh=3T0ArXtBue+4jQS8m14aDT4hO1iQN7UONJOY2Dznj0I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eEkx9BJAUopArBFl+4iNgeYyly0JHB54EqBuxjjJn00+T9qrBU4INvcG/N4lxUJVH9yAfGwGoOj7CTBrC68Mt5pfaOS4ecdSCgOXDclsxoayDSF2NOtg+nyzJBh2V6YZwSAf6KUlrThd/DOSq4q4nu8vmQb3j9IFpKhxXXkGmYiEx2GEJJReH75PHXX/I0Ob8v4KaxKK+LK86K+CrGBjvg4BVXf1X7+IRzJ/Q1kcqcaiL56nfG8NfuQvllZE8mnsjLOzM7zsa42tk/mT6jyLAUTy1jveh7V0OD2YziJt5MN9AG7uzPjA+BWMuE4Uis700G/YsndHeHGanIAuLhQaCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ilT4Xv7y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3cae9zwykde89vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ilT4Xv7y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3cae9zwykde89vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1yL21GdVz30T6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 10:55:54 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fbff6426f5so10342800a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 15:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441352; x=1741046152; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3T0ArXtBue+4jQS8m14aDT4hO1iQN7UONJOY2Dznj0I=;
        b=ilT4Xv7yGEUdej66SxFawTzNw33F+3ZNzDGMw8frZ5W/O1ufxpm/va+bYY6FniOnU+
         CLK+DpQKfH1KCFuATPCJB4YONqvVLsBNojb+Lt9o8oZ2VVAZTZT5ZrSSqQjMtWEY46aH
         ab7tW7euI64zZo7XXmzKhryyingSYUO5XI0QXKh+FSh3+j5ybgQsAVz5a5PPbbQu8SiJ
         OL6gHd3RkxCtnQ/58uO/Dkl9jDYEVCRUxCdTiVFTxDbVcBQO4iuyN2kU81XRPZe9bRyd
         l/1VFfj1XzsFrG84CdHb4i1j72OgANDJGXE+lXd05OJuL4IhLgpJ3TsnsyTqvDd85zVF
         bajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441352; x=1741046152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3T0ArXtBue+4jQS8m14aDT4hO1iQN7UONJOY2Dznj0I=;
        b=JuyQSjgeYv5n2DUTvAs7Q0tQaUrfgLqOasJiw22Sw3u5xPgNhNHOR2YmngnlYkrzo6
         9Ay31INMtHn20VUbQwV2lK59olIgK3fEKIqzSHjZPMbyhLYVjN4+i7vz0JOO+efJgeo1
         xfAOVGhJqHQUksLYu0ll54gcdJHtkWzTOBihHtg+ZrH8kJDcIlmF0sbeFX8BA8zNMfxT
         jNAX+7au4dH6LiN2njhq2fUqMz632OREriYvCmWVNp891sOgRMBgafk3t0+WtMqhJH/e
         puZtwSQV6c8hBm0GGM9jwvdeP/X/bhLI6yH+hKOywB+LjRRt8+1SivaC5e6jgGrmz48J
         HXbg==
X-Forwarded-Encrypted: i=1; AJvYcCUx7EFpsQZNSoEBenrEs0AioUoqaddjDZSM8zEXAdUuTgV2cp1atSL0ycW9JiV+Epuf5NOvnpxouae2g9s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzh+Om4QchJ4rZU6PA2UTYXeHWvPU4kSb9VV9Pt/qLTxVso3bXG
	JbFTjJar3zDNVBSUecGYKcpoBrq/8PFRiT87MokRgkxmrVs5iib95fY15rM2NgaXrAICz767Vjo
	NHw==
X-Google-Smtp-Source: AGHT+IGLhJjtwIM7JWkK50LEGpVa5IYsMEMrJLtXcv45TfVI0Bcew2BvOmcJCUf4CWX8wuCtTe3G30kBi3Q=
X-Received: from pfbhd3.prod.google.com ([2002:a05:6a00:6583:b0:734:cc8:a107])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:695:b0:1ee:bb7f:9b39
 with SMTP id adf61e73a8af0-1f0fbff6aebmr1778237637.1.1740441352385; Mon, 24
 Feb 2025 15:55:52 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 24 Feb 2025 15:55:39 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
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
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-5-seanjc@google.com>
Subject: [PATCH 4/7] KVM: x86: Don't load/put vCPU when unloading its MMU
 during teardown
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Don't load (and then put) a vCPU when unloading its MMU during VM
destruction, as nothing in kvm_mmu_unload() accesses vCPU state beyond the
root page/address of each MMU, i.e. can't possible need to run with the
vCPU loaded.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 045c61cc7e54..9978ed4c0917 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12767,13 +12767,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	return ret;
 }
 
-static void kvm_unload_vcpu_mmu(struct kvm_vcpu *vcpu)
-{
-	vcpu_load(vcpu);
-	kvm_mmu_unload(vcpu);
-	vcpu_put(vcpu);
-}
-
 static void kvm_unload_vcpu_mmus(struct kvm *kvm)
 {
 	unsigned long i;
@@ -12781,7 +12774,7 @@ static void kvm_unload_vcpu_mmus(struct kvm *kvm)
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		kvm_clear_async_pf_completion_queue(vcpu);
-		kvm_unload_vcpu_mmu(vcpu);
+		kvm_mmu_unload(vcpu);
 	}
 }
 
-- 
2.48.1.658.g4767266eb4-goog


