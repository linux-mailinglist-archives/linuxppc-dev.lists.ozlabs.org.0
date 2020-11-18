Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB12F2B72E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 01:16:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbNfK0NVjzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 11:16:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::749; helo=mail-qk1-x749.google.com;
 envelope-from=35mw0xwwkdicyop3l5wytp23rzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=i2Z+6bK8; dkim-atps=neutral
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbNSH1BpXzDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 11:08:08 +1100 (AEDT)
Received: by mail-qk1-x749.google.com with SMTP id q25so184697qkm.17
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 16:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=C4I5cnBVqMLHEBaHI22ejtAYmddqM1FCT8jQvlcDxTA=;
 b=i2Z+6bK8sQT/LD35GZCjASBYHSNR71pjgf/dFX2mj+wejv4WQZSV8dXYopDAEnbyLV
 tP9lwzf/d8Axb7WQqrDftInZoBU3+Z1VHg1kYdeoeC4d7Y4cgYLI/V/d4PsC7t/wWP93
 mn/nAxWmcy85p/gzi5kOs0+z0+oMnDDtWRudfayWjXVBh2lRECTqzf0Fy91ISZPopgDm
 MQYtDYRYUIxg3md+IXfbs9vMgD6GJ35lk5ZGEZylLtiRXdlqBfnpfN8C65INtDLOwKHI
 bHiCcKhjbOKexN/kP0/8Y2lKFwcbf2KgFSCXBCxLG6oox2QQSHTaacfa4RYo2T8yL5Z7
 qwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=C4I5cnBVqMLHEBaHI22ejtAYmddqM1FCT8jQvlcDxTA=;
 b=D32OS5CXqd+BsOcwK1E608vW2rSAWmYoezvddwxcdUKs16hJrXvt0Pnbcoc2eMMaRi
 eqNe/hNujdGeKwkQkyEo2l7c3vUFWj4ZZ3B86Y8uHN4mwyUhv9l19NQDJ9AuA2LZ+FaS
 mgD/NhvZI1EON1EoOxvzf81Qm0md0nWUnX/h0C0LJdRbZOULTSTDp51QNtuDYqOP4V2N
 sl7Se2xxVZjBL/okyhbHGX4KEjE1K7wuNeucyJi0XYrAbV5MyntQKZPCtKOFnUJ+m/ca
 YYTe3zkiI8P5ncQDEs7mTcbkzRW3QyyehcQhytBGWxwZoUq1d7iIIcmOVfi3iHEL0V01
 0iXg==
X-Gm-Message-State: AOAM532xk78tf66yIQjJqZwQLqhaOeza/9aR5YAmuLTNVjyeznJ7m9Rq
 UnXLCoGb/sSOAHAfgBaEnFbbUt5qj4rfmxTKXQg=
X-Google-Smtp-Source: ABdhPJws0sTD/WzUblHs71JHfu9LRYWbxQILKXAAf4F1fOuoGSfcfleh5j1il/JmAjvv7ZyhxRfoYbuU1EOTAOVUu7c=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:ad4:44b3:: with SMTP id
 n19mr1968835qvt.56.1605658086294; Tue, 17 Nov 2020 16:08:06 -0800 (PST)
Date: Tue, 17 Nov 2020 16:07:51 -0800
In-Reply-To: <20201118000751.845172-1-ndesaulniers@google.com>
Message-Id: <20201118000751.845172-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20201118000751.845172-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 3/3] powerpc: fix -Wimplicit-fallthrough
From: Nick Desaulniers <ndesaulniers@google.com>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
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
Cc: clang-built-linux@googlegroups.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Paul Mackerras <paulus@samba.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The "fallthrough" pseudo-keyword was added as a portable way to denote
intentional fallthrough. Clang will still warn on cases where there is a
fallthrough to an immediate break. Add explicit breaks for those cases.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://github.com/ClangBuiltLinux/linux/issues/236
---
 arch/powerpc/kernel/prom_init.c | 1 +
 arch/powerpc/kernel/uprobes.c   | 1 +
 arch/powerpc/perf/imc-pmu.c     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 38ae5933d917..e9d4eb6144e1 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -355,6 +355,7 @@ static int __init prom_strtobool(const char *s, bool *res)
 		default:
 			break;
 		}
+		break;
 	default:
 		break;
 	}
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index d200e7df7167..e8a63713e655 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -141,6 +141,7 @@ int arch_uprobe_exception_notify(struct notifier_block *self,
 	case DIE_SSTEP:
 		if (uprobe_post_sstep_notifier(regs))
 			return NOTIFY_STOP;
+		break;
 	default:
 		break;
 	}
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 7b25548ec42b..e106909ff9c3 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -1500,6 +1500,7 @@ static int update_pmu_ops(struct imc_pmu *pmu)
 		pmu->pmu.stop = trace_imc_event_stop;
 		pmu->pmu.read = trace_imc_event_read;
 		pmu->attr_groups[IMC_FORMAT_ATTR] = &trace_imc_format_group;
+		break;
 	default:
 		break;
 	}
-- 
2.29.2.299.gdc1121823c-goog

