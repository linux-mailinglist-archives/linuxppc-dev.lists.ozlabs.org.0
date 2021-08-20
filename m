Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4043F370A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 00:52:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Grxjx4Jpzz3d8s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 08:52:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=M3kumjeM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::74a; helo=mail-qk1-x74a.google.com;
 envelope-from=3tjegyqykdkkbnjwslpxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=M3kumjeM; dkim-atps=neutral
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrxgF0nbQz306Y
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 08:50:33 +1000 (AEST)
Received: by mail-qk1-x74a.google.com with SMTP id
 s206-20020a3745d70000b02903b9207abc7bso7441444qka.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 15:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=I/xOfL043wSWIjKBt5HEcjocrLFqM7QFZBSdMiXJO5I=;
 b=M3kumjeMVm4eYjRmGUO/zlfNkMo/9WsvowPCfp+9Abh1lIA5cu2tJl3skXJ/c/DpNR
 DLaw0wylFTflUtaBDHF3r8l7A76rdGodfuy8Xw4K2Xaz3gqIPcTyNFWKlYle9HWjHKGq
 qU3WbdHt/DBXmgLXabDaUFuqIQYx2gN5h7frBxsWiYmFdafmGsqF2epkbsV/DTDNzjzg
 PCJTz+nVi+FBxX5K3c+PMjIS5Pxl13qw5qxXA6951o10atA6WmUd5KSBBUoWmQdqTUG8
 8FvYZ0DNWMFeNHDNeMBE9g+GRNrPryzsmQCKYDRVSsmTYkEKei9vpwFi3kpWR9Pluy7M
 t7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=I/xOfL043wSWIjKBt5HEcjocrLFqM7QFZBSdMiXJO5I=;
 b=cfGtNzhW2aU+q4EGrWN5Q3BpfhTvBcgS+QBRRDbk+iNrAEHKkAdWUJ4e5QwX6kTaLy
 U+CMcOuD1wbf2dbIcEm8UzPAu69vd4UHdo+H1qXtgTlnUclMDJHgdUiZ+Lmd5Wjgkq5T
 iQl5GtOq/tffOIfi6CSSCO8kvLDbyEvkhOXoSOaUm82P/yy8nbrqmuePzhuZBhAsVwTR
 ngoFWdmz28ap1Fnv9GpMPcWkJKDXSIamtYjvLYxRjtiz6cf2l1yLivHgfnDBwHGAY2so
 qaPc95Socb/FzoTbg1aO9/EPalzfpf/z+H2GiFmjVdCVA9+AlL1RRnC4gRz02UYpHZQU
 XHCA==
X-Gm-Message-State: AOAM532K0wy6NIJ2MBdFZYqE965PfGDvrxdbh52UFb971+BCSmdHFxfn
 GPo4rNWl8i1Ue+eSC952aiiHbdFHcFQ=
X-Google-Smtp-Source: ABdhPJwPDeDEGSWBZzPAgrzEB3/9Tm6acMQwHqWt26WElPNAfJ7mDGPZ+5pXO64WxmSA3x2M0eH0pY71OXc=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:f11d:a281:af9b:5de6])
 (user=seanjc job=sendgmr) by 2002:a05:6214:728:: with SMTP id
 c8mr22408148qvz.53.1629499830911; Fri, 20 Aug 2021 15:50:30 -0700 (PDT)
Date: Fri, 20 Aug 2021 15:50:00 -0700
In-Reply-To: <20210820225002.310652-1-seanjc@google.com>
Message-Id: <20210820225002.310652-4-seanjc@google.com>
Mime-Version: 1.0
References: <20210820225002.310652-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
Subject: [PATCH v2 3/5] tools: Move x86 syscall number fallbacks to .../uapi/
From: Sean Christopherson <seanjc@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Ingo Molnar <mingo@redhat.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 Peter Foley <pefoley@google.com>, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
 Shakeel Butt <shakeelb@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move unistd_{32,64}.h from x86/include/asm to x86/include/uapi/asm so
that tools/selftests that install kernel headers, e.g. KVM selftests, can
include non-uapi tools headers, e.g. to get 'struct list_head', without
effectively overriding the installed non-tool uapi headers.

Swapping KVM's search order, e.g. to search the kernel headers before
tool headers, is not a viable option as doing results in linux/type.h and
other core headers getting pulled from the kernel headers, which do not
have the kernel-internal typedefs that are used through tools, including
many files outside of selftests/kvm's control.

Prior to commit cec07f53c398 ("perf tools: Move syscall number fallbacks
from perf-sys.h to tools/arch/x86/include/asm/"), the handcoded numbers
were actual fallbacks, i.e. overriding unistd_{32,64}.h from the kernel
headers was unintentional.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/arch/x86/include/{ => uapi}/asm/unistd_32.h | 0
 tools/arch/x86/include/{ => uapi}/asm/unistd_64.h | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename tools/arch/x86/include/{ => uapi}/asm/unistd_32.h (100%)
 rename tools/arch/x86/include/{ => uapi}/asm/unistd_64.h (100%)

diff --git a/tools/arch/x86/include/asm/unistd_32.h b/tools/arch/x86/include/uapi/asm/unistd_32.h
similarity index 100%
rename from tools/arch/x86/include/asm/unistd_32.h
rename to tools/arch/x86/include/uapi/asm/unistd_32.h
diff --git a/tools/arch/x86/include/asm/unistd_64.h b/tools/arch/x86/include/uapi/asm/unistd_64.h
similarity index 100%
rename from tools/arch/x86/include/asm/unistd_64.h
rename to tools/arch/x86/include/uapi/asm/unistd_64.h
-- 
2.33.0.rc2.250.ged5fa647cd-goog

