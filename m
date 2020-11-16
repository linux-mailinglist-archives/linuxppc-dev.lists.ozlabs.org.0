Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2122B3C34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 05:42:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZGf71tSyzDqRy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 15:42:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3nwgyxwwkdg4zpqemgxzuqdesaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=l7DYaprb; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZGTy1FwRzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 15:35:46 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id z29so19212744ybi.23
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Nov 2020 20:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=ewLDtC1Ll1+KhSOjBeNvFZ/A9hKRZKnELHCa/fqKz8w=;
 b=l7DYaprbrYkeTfMwB9mrFYRhtwuwHnco7Fx6vSdDEY0XYSeLpNgDuo/LHBNJTtiXwS
 E9iO3krRelNApZKP2J7I70NN2lMSbnGdb+pHezFtoykV+h+pXJPr2AyrHCCjf5dLXlzA
 NF9+J1jPTZeU+5cwhV/wFDZrVfqB9hXH2FvTG/+W4hZFS4L2qY2gJEmP9fXUVRIIM52v
 CC6iVX6QH2RlIcdOSf6Zc7hTIiWrnNieDal+kt8bgJTtFBcAmlF/wiGl/wqjC/hOULTm
 B+DOiS2aPaQ62GFRUgn5ySeOH1U+s9x3Bb4vgE1fUskYPiPPF5tuKLIodkoijn+0rkbb
 y8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ewLDtC1Ll1+KhSOjBeNvFZ/A9hKRZKnELHCa/fqKz8w=;
 b=BLd0up/AfflWK9HzUJWgTDxlyI0cl/DBD82Yn6YIXygvo8OPM6L8rgN/VPQVKOwyZ0
 7dnHUwfwFrFTVMA0r0P5/Zpbvb7+CpZYaag84wV332e674aWfuGThYSKPm6jpOCQj+Jv
 OvLtBjuHjY269tW01I77THCtl1QSSzz0axAG691H9G8Bxq9yZW7hZfm8TkiwcXE/xtk5
 DrLZqMS99qYoyAp49acgLC7q2DmtoeY/4t3J5xaeaYJ47vU09nLcXi7SuPmLuaG/5h/L
 wiDFRDIJzruP3vWW03nuN5l7BGN8E7RTbyLzI2XMhDi8Ap4pb8izTfOsUu5cuEsbAE4P
 WXfQ==
X-Gm-Message-State: AOAM5301LlheRAF+LMI+xemscelB+aa4v6lAGWB//9YaJ518mWhqKRV8
 zhC6st4yi5jFN/9HPp1lgPAr3IQ6M4WAqrAnDZ8=
X-Google-Smtp-Source: ABdhPJwhO5z2Pqzn/A0lC0EOrZIbFY6C29RzyDQuoXNnccDtufkc4j26zv5fuWU7sn4h3tucDDcegRuw4YD2Ik0ivj4=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a25:640e:: with SMTP id
 y14mr15191892ybb.446.1605501343478; Sun, 15 Nov 2020 20:35:43 -0800 (PST)
Date: Sun, 15 Nov 2020 20:35:32 -0800
In-Reply-To: <20201116043532.4032932-1-ndesaulniers@google.com>
Message-Id: <20201116043532.4032932-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20201116043532.4032932-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH 3/3] powerpc: fix -Wimplicit-fallthrough
From: Nick Desaulniers <ndesaulniers@google.com>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The "fallthrough" pseudo-keyword was added as a portable way to denote
intentional fallthrough. Clang will still warn on cases where there is a
fallthrough to an immediate break. Add explicit breaks for those cases.

Link: https://github.com/ClangBuiltLinux/linux/issues/236
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
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

