Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D58107DA0A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 20:38:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=I27rE/k8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SHBJK4fs5z3wJY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Oct 2023 05:38:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=I27rE/k8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3bqa8zqykdcyugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SH9yH3HC9z3cV9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Oct 2023 05:23:03 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5b053454aeeso2266577b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 11:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430981; x=1699035781; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QVHGnajj4HOCkrhgrdEXP5z3IZ3KkliWY6Z9SNVyio0=;
        b=I27rE/k89ZH7XxrZZ7gxWIzWDLMOhlFH115VS9fTT54DHGHEyjAzqpDYHelrWT6gHi
         yZHDm7UPiSKJtVBhB6BpBxwCJKPPGLD0hkk4g571EPQav3j/ZO0+rzuPrhEWO1rO5Ul7
         4BVSTJVmSZZ1HYntK/5sd1HDeUiUyP9120dCrzVZ2xwzXIKoRzFC3r4NLEmx5nOItDm5
         ETs3YtI9rmhHaird5w9goMN7c+h1J085ypwgiIIqWFebxufgKOyMsoSC3r2buezxvSxZ
         f9ZCOsURkuyMg1jBMte6SHeWxDN/RZxx0Db2xc3nY0nahvI0mNn6+QjJf8DIEMPHazJa
         LqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430981; x=1699035781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVHGnajj4HOCkrhgrdEXP5z3IZ3KkliWY6Z9SNVyio0=;
        b=PY7lSfjzDolTyq9fAo2uwSKJZ20kUFsOin4y0m9axmYsGsirXuubBEOljrv2ZqIOgj
         onkqo8ZCZY0RWZC9+6fpkEOEX5F0dNwXhVr+3WJzSS77sQ7JfnPn2mWkZUiFWe58qrPU
         S66a8+KW0SCNI/juWGFoF1GHou52CocciEseTHnjY0IwXP5nGqHleLixl4Zye+G01+BK
         rV07nCKGif5wzSw5wnOZzglP+q7prE/PTokxHfbpSYjrXSV97xjiHiI25XUm0Ub8uE1z
         +ZdEOifwEa+zSg6+mr1Ynekvwc8ilhP9szeK8nRtkjWesoFNM8idHAfSjluDuksL0mTq
         2ljQ==
X-Gm-Message-State: AOJu0Yx44f+7UsQAjDuNvUr7/nMctqaByNSc83RqEgVtjg7Uw8O4lPWO
	b6lZVUNcIfWHGeMXd5Y6YJ6oeuPbblg=
X-Google-Smtp-Source: AGHT+IGhdcD7DYxvJo53MxSFMcue6wHqMJ/dJKXwjBlyW/fIhxTWfdSD8wIFRBeoqz4UflCFK1Su3DgQ67Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:da0:567d:f819 with SMTP id
 v3-20020a056902108300b00da0567df819mr78702ybu.10.1698430981246; Fri, 27 Oct
 2023 11:23:01 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:22:00 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-19-seanjc@google.com>
Subject: [PATCH v13 18/35] KVM: x86: "Reset" vcpu->run->exit_reason early in KVM_RUN
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, Vlastimil Babka <vbabka@suse.cz>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve
  <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Initialize run->exit_reason to KVM_EXIT_UNKNOWN early in KVM_RUN to reduce
the probability of exiting to userspace with a stale run->exit_reason that
*appears* to be valid.

To support fd-based guest memory (guest memory without a corresponding
userspace virtual address), KVM will exit to userspace for various memory
related errors, which userspace *may* be able to resolve, instead of using
e.g. BUS_MCEERR_AR.  And in the more distant future, KVM will also likely
utilize the same functionality to let userspace "intercept" and handle
memory faults when the userspace mapping is missing, i.e. when fast gup()
fails.

Because many of KVM's internal APIs related to guest memory use '0' to
indicate "success, continue on" and not "exit to userspace", reporting
memory faults/errors to userspace will set run->exit_reason and
corresponding fields in the run structure fields in conjunction with a
a non-zero, negative return code, e.g. -EFAULT or -EHWPOISON.  And because
KVM already returns  -EFAULT in many paths, there's a relatively high
probability that KVM could return -EFAULT without setting run->exit_reason,
in which case reporting KVM_EXIT_UNKNOWN is much better than reporting
whatever exit reason happened to be in the run structure.

Note, KVM must wait until after run->immediate_exit is serviced to
sanitize run->exit_reason as KVM's ABI is that run->exit_reason is
preserved across KVM_RUN when run->immediate_exit is true.

Link: https://lore.kernel.org/all/20230908222905.1321305-1-amoorthy@google.com
Link: https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ee3cd8c3c0ef..f41dbb1465a0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10963,6 +10963,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
 {
 	int r;
 
+	vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
 	vcpu->arch.l1tf_flush_l1d = true;
 
 	for (;;) {
-- 
2.42.0.820.g83a721a137-goog

