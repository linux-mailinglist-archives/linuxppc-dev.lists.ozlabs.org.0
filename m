Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B53CB35C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 04:55:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kvd12QddzDqcg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 12:55:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I+7X8PFy"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kvb76vc4zDqX8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 12:53:55 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id u12so2424936pls.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Oct 2019 19:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pw20gjwGyIvk4z43y2bV2DrT/I4s7wENPGMcRRJ5rbU=;
 b=I+7X8PFymt8BYtwV6VPllwcWxilbTowRfL8xWjjgfRDnyc1vOoMFchC9SqBarrsgAm
 6ghMr6iSAVYWfyXYZbtwpFaL5m10QOx0SvNLbUCf9yzu6zmtGnOMiZE/eqwVAxvT/ZlR
 gnn2mvEePlMKHVn4PrCP+n8V7eYsHkjxVZBrZPDMjU4037JYe1NYNSKwe5OrcOgJb53m
 wDUSQw+7WwmK/vaxvYN1EoaKjv/qX4ZZOP1m+OwAZdYXoRVhVKdPYKqVQ0LJOjC/2t3s
 BSkFO5qdHDD9ZG/obz7Th/peMJBH7WXnmUwJvGCAEIdSzgKaM/Z6nBbDR9p4KMEnLiA4
 kNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pw20gjwGyIvk4z43y2bV2DrT/I4s7wENPGMcRRJ5rbU=;
 b=AMUo1ZyBv1IE2z/LAeOXx2fH84WpmG7kl3Zp/sQMNtjx+MB/av8IAJrzUqODXVs5zu
 xMmtUrBhA8D0ps7JvyYhbzsw5XPMVAgU+8IbkcxIUAWDfyUdd0MA5v38VQAxW68EPnnW
 bc2q8xKCcubS2gItEEqj8ksD097OM3WMpL1ffeIu3TtgfyOOshO3uc7S3oQ8vwl2Nh/M
 j2RUeV8XYs7kYRDcG22JmafhJyHgYQJVZLzPBVfNwS/b2jzE3cg6Eaf+GkecW+IdeBl1
 xO0LavMczmBasOUkBHQEiazUkea0bT+9xMu4VPweXhhCA/TnqjyNxw2w12QB3z7Sl0tm
 EkUA==
X-Gm-Message-State: APjAAAWRgkz8vZHC4zGudM+BLWKlZS3C3SQASNf0r0VU88xIVDM0AT9G
 pfERHpblIDR7yuBQX1veCu5/5AvB0/Uu7g==
X-Google-Smtp-Source: APXvYqz+Wnmy5oq8K1YLi07YGFVPhyMZPZ0qDgQMDHCzmadww+fy1WVnAmWycWvQyFJxrLfO/vp3nA==
X-Received: by 2002:a17:902:ff18:: with SMTP id
 f24mr12839898plj.173.1570157632027; 
 Thu, 03 Oct 2019 19:53:52 -0700 (PDT)
Received: from pasglop.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d20sm6920181pfq.88.2019.10.03.19.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 19:53:51 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/kvm: Fix kvmppc_vcore->in_guest value in
 kvmhv_switch_to_host
Date: Fri,  4 Oct 2019 12:53:17 +1000
Message-Id: <20191004025317.19340-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: aik@ozlabs.ru, alistair@popple.id.au, patch-notifications@ellerman.id.au,
 kvm-ppc@vger.kernel.org, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvmhv_switch_to_host() in arch/powerpc/kvm/book3s_hv_rmhandlers.S needs
to set kvmppc_vcore->in_guest to 0 to signal secondary CPUs to continue.
This happens after resetting the PCR. Before commit 13c7bb3c57dc
("powerpc/64s: Set reserved PCR bits"), r0 would always be 0 before it
was stored to kvmppc_vcore->in_guest. However because of this change in
the commit:

        /* Reset PCR */
        ld      r0, VCORE_PCR(r5)
-       cmpdi   r0, 0
+       LOAD_REG_IMMEDIATE(r6, PCR_MASK)
+       cmpld   r0, r6
        beq     18f
-       li      r0, 0
-       mtspr   SPRN_PCR, r0
+       mtspr   SPRN_PCR, r6
 18:
        /* Signal secondary CPUs to continue */
        stb     r0,VCORE_IN_GUEST(r5)

We are no longer comparing r0 against 0 and loading it with 0 if it
contains something else. Hence when we store r0 to
kvmppc_vcore->in_guest, it might not be 0.  This means that secondary
CPUs will not be signalled to continue. Those CPUs get stuck and errors
like the following are logged:

    KVM: CPU 1 seems to be stuck
    KVM: CPU 2 seems to be stuck
    KVM: CPU 3 seems to be stuck
    KVM: CPU 4 seems to be stuck
    KVM: CPU 5 seems to be stuck
    KVM: CPU 6 seems to be stuck
    KVM: CPU 7 seems to be stuck

This can be reproduced with:
    $ for i in `seq 1 7` ; do chcpu -d $i ; done ;
    $ taskset -c 0 qemu-system-ppc64 -smp 8,threads=8 \
       -M pseries,accel=kvm,kvm-type=HV -m 1G -nographic -vga none \
       -kernel vmlinux -initrd initrd.cpio.xz

Fix by making sure r0 is 0 before storing it to kvmppc_vcore->in_guest.

Fixes: 13c7bb3c57dc ("powerpc/64s: Set reserved PCR bits")
Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 74a9cfe84aee..faebcbb8c4db 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1921,6 +1921,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	mtspr	SPRN_PCR, r6
 18:
 	/* Signal secondary CPUs to continue */
+	li	r0, 0
 	stb	r0,VCORE_IN_GUEST(r5)
 19:	lis	r8,0x7fff		/* MAX_INT@h */
 	mtspr	SPRN_HDEC,r8
-- 
2.20.1

