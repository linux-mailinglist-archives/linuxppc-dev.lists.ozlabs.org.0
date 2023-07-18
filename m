Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA43758990
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 01:52:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=kxtMkPfB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5G3L5lkvz3cWV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 09:52:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=kxtMkPfB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=31ys3zaykdcoykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Fyc6rhLz2ygr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:48:40 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b8af49a5d2so48846475ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724119; x=1692316119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WUfCrqcqzPgtS1UwKv933k1oCAb1hY7UF4nDFC6XfxY=;
        b=kxtMkPfBzSrDgFwiM6lTbnnV1ORifom1wTCX0JDc2o8v5mvJbgd+eW3FzBholZ+QF/
         ZB/tw1vxVtp6lnWfOuYWDBnkA/zcHKeYCxsNI4yLGBDWisxt2V2CGW6+/c9nKHHqWO0Z
         pwjXyxzIVoB/8QMRAPYJ2ESVagoDqveLkahmzeblrfSHi+C7b/LSvjVeGXXFBmG27xpW
         46+iHLUL/iDL1W1dNobEnmnSwB6oZXJ54GsRbQDHUEuzlNSG0pgY2rC5/BfRYynN9jnl
         9GH+3FZfZFTDU0qQSnRrsV2OdAHlQuwXUaGl7W047p5QIleFQWR+9FWJ+QSsSRbSbDcH
         Ypxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724119; x=1692316119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUfCrqcqzPgtS1UwKv933k1oCAb1hY7UF4nDFC6XfxY=;
        b=TXGKMP2/n9WcIw+5PdxSXT8wECsuc6q9/gO3mP4db5F1N21Owj9V8+k7ug8eK4fSLs
         c+xQMjx5TW3ab05OvJFSyThuqytNml1x/qHjYDmC/gAMeb73WQBqScaWne2MssCNbw4N
         jK/wWLe97HQTlj/KViVR/gmBO4dM1yW1NDlKkO/Nc+AIG8aCM9CPlI/3/Dkmx3dkl8Me
         1uyE4trMttsxhhAW4GddtgsoWXp7JGFpm4OKSJnySGdwS/vwRymZIpHqUQ4QROepTcpX
         oo9OsB6D3XGrAgoKlM6AMU4staE6o+sT8Ac2e4YdUfRDR72faGjo3xIqRhDtJ/9JgvWf
         jGRg==
X-Gm-Message-State: ABy/qLay11jvy1e9Vlb2tVkrW/e2XdFS6df1lnZkaRuum0P7py4hYXGb
	MTE6FqTI0ACLFQ2ZQ5za7SXG27+V7bU=
X-Google-Smtp-Source: APBJJlEMcu/rfMRBwbQ2zq+ymY4hD2c5F3AYtj0FSwyildZO2Oo0gOzBKGYbg9jbJCtpjTvhx4PmM9/8MPA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f546:b0:1b8:a552:c8c9 with SMTP id
 h6-20020a170902f54600b001b8a552c8c9mr7279plf.13.1689724119324; Tue, 18 Jul
 2023 16:48:39 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:47 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-5-seanjc@google.com>
Subject: [RFC PATCH v11 04/29] KVM: PPC: Drop dead code related to KVM_ARCH_WANT_MMU_NOTIFIER
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/powerpc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 7197c8256668..5cf9e5e3112a 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -634,10 +634,11 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_SYNC_MMU:
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 		r = hv_enabled;
-#elif defined(KVM_ARCH_WANT_MMU_NOTIFIER)
-		r = 1;
 #else
-		r = 0;
+#ifndef KVM_ARCH_WANT_MMU_NOTIFIER
+		BUILD_BUG();
+#endif
+		r = 1;
 #endif
 		break;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-- 
2.41.0.255.g8b1d071c50-goog

