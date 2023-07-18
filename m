Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB857589EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 02:11:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=m1E5CQsR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5GSk5ZGhz30gs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 10:11:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=m1E5CQsR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3_ss3zaykdfaaws51uy66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5FzM2dJ7z3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:49:19 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1b89e3715acso32243675ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724158; x=1692316158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AUBNLiIlxTx1F6mRQya+iPZZUvsAoMeHoSeivXTBAJs=;
        b=m1E5CQsRhxPohHIaVjXNzAfw9sKja8GxErI8tb88+m9ohtM/2UTUV4KI0EStxpO4aq
         e3MZZP48Hes3EH+ziFJ16ESLBaMphjB9wBUbLKvQFLpYn2bcEMb9Uv2TfKXvMSlsG4ax
         +5bc2E2M24iRgByLib+vhoObgGZN9pfMuLHGBIbrmouSiZYtP7I+o1+DUjs0jJquORQM
         WZA9ZhPgQfZ0ViRdW+5zM3kLeIAxBI958QaGMn+cpDeKcYSO3MEZRWesl52iNilZN/Ay
         f7w1zt9jHHbnKZaxjQB9PYpmQD1oIBOzEUWtcHD4Ui+04jNinOeJzuhQDL4PbgsMw1sC
         a+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724158; x=1692316158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUBNLiIlxTx1F6mRQya+iPZZUvsAoMeHoSeivXTBAJs=;
        b=ao8iLeWGYHIPK+wMdoNMvgkdUY5DX+ow2ubozII779I4Ja/tIy4mZI4wItXycumhim
         UhLtgB0w6M1VX2WJhOBPidHGgyYNzTg53fF6BILcq4Uwvre4xaDXn926n6RnEhNUlQLI
         maBHAlxXeBERaGYTqw+X77Z6zLJacGjs1vLuqBGmkHn91lxHCHuMVCNRDhZDNJPgtx28
         ZGlwUldg3hCD0TREQ7gniq+2jAc633juV2zE48CoG6dmN3BuGg/gdwl+LF2rPnvm7aeC
         PEsQNx4XM7be1olL6SnXPBGvz+hcOjveQiYNWAj0jrIxc1X31FhInbE12UOZGJvsGo/0
         ibKw==
X-Gm-Message-State: ABy/qLbBHFl0k/WHKTJUFZChybcVp/ZOy18XBrorD+w5yP55qn25FpYs
	PruXpqNc6RW92SsPWU0NMnPWRwERS1s=
X-Google-Smtp-Source: APBJJlGZj18kUtv2DZbfIQmZu2TXCF9UTMkYGVm3bO/BF1sxl/m3e0941s7v3QsOSVZsOvdKY/T33+qfBEc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d4c6:b0:1b1:7336:2637 with SMTP id
 o6-20020a170902d4c600b001b173362637mr16836plg.11.1689724157723; Tue, 18 Jul
 2023 16:49:17 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:07 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-25-seanjc@google.com>
Subject: [RFC PATCH v11 24/29] KVM: selftests: Add GUEST_SYNC[1-6] macros for
 synchronizing more data
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
 tools/testing/selftests/kvm/include/ucall_common.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index 1a6aaef5ccae..8087c877fd58 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -46,6 +46,18 @@ void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa);
 #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4)	\
 				ucall(UCALL_SYNC, 6, "hello", stage, arg1, arg2, arg3, arg4)
 #define GUEST_SYNC(stage)	ucall(UCALL_SYNC, 2, "hello", stage)
+
+#define GUEST_SYNC1(arg0)	ucall(UCALL_SYNC, 1, arg0)
+#define GUEST_SYNC2(arg0, arg1)	ucall(UCALL_SYNC, 2, arg0, arg1)
+#define GUEST_SYNC3(arg0, arg1, arg2) \
+				ucall(UCALL_SYNC, 3, arg0, arg1, arg2)
+#define GUEST_SYNC4(arg0, arg1, arg2, arg3) \
+				ucall(UCALL_SYNC, 4, arg0, arg1, arg2, arg3)
+#define GUEST_SYNC5(arg0, arg1, arg2, arg3, arg4) \
+				ucall(UCALL_SYNC, 5, arg0, arg1, arg2, arg3, arg4)
+#define GUEST_SYNC6(arg0, arg1, arg2, arg3, arg4, arg5) \
+				ucall(UCALL_SYNC, 6, arg0, arg1, arg2, arg3, arg4, arg5)
+
 #define GUEST_DONE()		ucall(UCALL_DONE, 0)
 
 enum guest_assert_builtin_args {
-- 
2.41.0.255.g8b1d071c50-goog

