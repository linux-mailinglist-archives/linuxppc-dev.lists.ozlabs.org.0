Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE79B79F722
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 03:59:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=axl1EC0J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmL9c40jdz3cF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 11:59:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=axl1EC0J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3h2gczqykdcgwierngksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmL4y382tz3bTn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 11:55:46 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d7fd4c23315so544265276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656544; x=1695261344; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5olfKKfAgOBEIWorNeGA6oMvbpwHV/k+KeYKQRUdq04=;
        b=axl1EC0JTYnMQHtT/MWO7/QkcJGXgGp7lw+Ow/LgG/Z+g62nG1M0TwXetgJv3c3zyA
         jL4wsV4rK6VbXnawrD9T+9xl/mN3wsGFFOLfqCxDkR1zVKm2BPTpYh6M//pFkhKCGG5I
         aOHELyN7o7wcn986/UHnNbdUrvebAtvKIqzLI4UOqvpU25csdWGbIq/vWPD659q/k1Bl
         izb0GSq64rGlZPsNKxFWtwOv+FpUkOuoCmca3sH4P4EFb3Gw5Oy4qdMJJKhv0N9aApRn
         1LxN/urzbN5gtsH8ymZ1W87iVuoFx5L5tn84TG3BDEl3DY1TTHprELnZUnLbjR5rsmbL
         kY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656544; x=1695261344;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5olfKKfAgOBEIWorNeGA6oMvbpwHV/k+KeYKQRUdq04=;
        b=QsGj/Q1gDLJ2FQp9JCusylZb41J+JbnVqM5JSPXvB5wiFGWmbDhMg73EaSnVP/yndx
         wodPKenQ/BTy7qaoQzscUqWM3B/nkXFKdS0Ym3Vk81c3cefCf43mIXSmBcGZsnzWMFBF
         jhYyT+6xVHwLYXzQEi0RWe5zrGdCMrJ1Ae98OcgnyVI0iEJebBQ/F7nWwP4cxdqceWXw
         55SjfXJzCwQHeYtZnKj4zA9vSHGbFI+QCRubNuJgb+BfEpr4tTSI+EAwUSsOcTUpV/3f
         Hy6AWFVdyMU5U/v8flDdoBjq1lAyYrXd141SbyIrw2mRqrkXZBC55rb34gTs580b6Cu5
         AeBA==
X-Gm-Message-State: AOJu0YzsVFEHA3b4RgTNRLn7ViXkbzjTNvW8pnj2yWJEYmBNLdQLnlBg
	5z8SgEzPHWOE3SMPf1OTkh+O3WweZbk=
X-Google-Smtp-Source: AGHT+IFAWDIKY3pID0CrDZgtjj2bXptPteu0k42w51y6Ps+oH46knUj2OnzhEQTEbd0IbAu5MzXei5K4JBI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:684:b0:d81:8e4d:b681 with SMTP id
 i4-20020a056902068400b00d818e4db681mr15248ybt.12.1694656543919; Wed, 13 Sep
 2023 18:55:43 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:02 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-5-seanjc@google.com>
Subject: [RFC PATCH v12 04/33] KVM: PPC: Return '1' unconditionally for KVM_CAP_SYNC_MMU
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Ani
 sh Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Advertise that KVM's MMU is synchronized with the primary MMU for all
flavors of PPC KVM support, i.e. advertise that the MMU is synchronized
when CONFIG_KVM_BOOK3S_HV_POSSIBLE=y but the VM is not using hypervisor
mode (a.k.a. PR VMs).  PR VMs, via kvm_unmap_gfn_range_pr(), do the right
thing for mmu_notifier invalidation events, and more tellingly, KVM
returns '1' for KVM_CAP_SYNC_MMU when CONFIG_KVM_BOOK3S_HV_POSSIBLE=n
and CONFIG_KVM_BOOK3S_PR_POSSIBLE=y, i.e. KVM already advertises a
synchronized MMU for PR VMs, just not when CONFIG_KVM_BOOK3S_HV_POSSIBLE=y.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/powerpc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index b0a512ede764..8d3ec483bc2b 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -635,11 +635,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 #if !defined(CONFIG_MMU_NOTIFIER) || !defined(KVM_ARCH_WANT_MMU_NOTIFIER)
 		BUILD_BUG();
 #endif
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-		r = hv_enabled;
-#else
 		r = 1;
-#endif
 		break;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	case KVM_CAP_PPC_HTAB_FD:
-- 
2.42.0.283.g2d96d420d3-goog

