Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E89EE309545
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:21:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSZbN4c2nzDrVx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:21:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cEKTTA1C; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZKq0xQwzDrRn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:18 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id o20so8039512pfu.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iiT3CTAMhh0lm7NDuYTqYlWKHhV+XBDKR+Jb40PV4tY=;
 b=cEKTTA1CUQWONXSTKoBmSnBrQX0J3JY4qrKmJrOnvB7B30fkSOSndeJaq6Nq7L5B2t
 m6xIbbgzvDi+Uz8AK+B+qsMdhPse3yXS3RIqWv+GjaqefGlw2ncCwAeK/alTJJOXaEk4
 cSbk1D6brlCEqM/xM8kNrriYujaoeOyFmomXhR3PXFcj+t97ORMSuVIOHPTVb1eayHTy
 Ikn72T+W2zPdibJZCvoL2M37rCKNrRBNVZVp73vifjf3kgWy/kZN42EijBdD9QXJrhz8
 vS6u+dh8h39W0vP8gE6blvZVJBNrV1oXm4Y9aFUiDdyDNueZWn5iZtHeVoorxGj4endg
 m37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iiT3CTAMhh0lm7NDuYTqYlWKHhV+XBDKR+Jb40PV4tY=;
 b=EU2YKARZgIccHa6xVDnSvnMC9y7k6DvViWeuuiS/aWc0Hh3xShR1vfPvfnyHrVTnG3
 9MQncz0zD068KRHHvPp6NtvHtf8Cn5jG6KT7UHQyCg1E8GGcDPg2mppnyLnkqQPRQlf5
 0IJKPo/UoWejeyoOJtdhJ+o76LP0lAyR/b2k/fjsyAIEI0An9zhQ2kgJ5EwZ0AWPMTks
 cl2OKIxrG3FVHKHA2YKMUwFuOa2eHrsXA3ssOUda4PzVB034WhW9LvW6JK5Iq50ff3UL
 nRhjRSZ1K29164psT95xntRpAJ1iFk/hnX0eE6ZyroxTVPs8lXhSofke9jJ8ePU2uVLk
 h2tg==
X-Gm-Message-State: AOAM5304hbgfWsu1pzzCYRh4ccQb9wtIG0kaumhsuT3rr/afZFaAej48
 BiZu62UcKYRQbzOFHyaOywJAK/SVUyA=
X-Google-Smtp-Source: ABdhPJyKTcEuwcMJm/lcdFsyYACMCYtjMdxr05qDSOroedV293vvyWAIgAK5v0+5goXZejQPOE7dRA==
X-Received: by 2002:a62:1690:0:b029:1c6:fdac:3438 with SMTP id
 138-20020a6216900000b02901c6fdac3438mr8487708pfw.43.1612012156007; 
 Sat, 30 Jan 2021 05:09:16 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 02/42] KVM: PPC: Book3S HV: Context tracking exit guest
 context before enabling irqs
Date: Sat, 30 Jan 2021 23:08:12 +1000
Message-Id: <20210130130852.2952424-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Interrupts that occur in kernel mode expect that context tracking
is set to kernel. Enabling local irqs before context tracking
switches from guest to host means interrupts can come in and trigger
warnings about wrong context, and possibly worse.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6f612d240392..d348e77cee20 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3407,8 +3407,9 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 
 	kvmppc_set_host_core(pcpu);
 
+	guest_exit_irqoff();
+
 	local_irq_enable();
-	guest_exit();
 
 	/* Let secondaries go back to the offline loop */
 	for (i = 0; i < controlled_threads; ++i) {
@@ -4217,8 +4218,9 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	kvmppc_set_host_core(pcpu);
 
+	guest_exit_irqoff();
+
 	local_irq_enable();
-	guest_exit();
 
 	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
 
-- 
2.23.0

