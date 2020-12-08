Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5C02D35AA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 23:00:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrDdB1VPszDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 09:00:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A+ZPhYYi; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrDbK4pxczDqgB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 08:58:51 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id b144so115328qkc.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Dec 2020 13:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G/NMXMjSBkeIHnho7dTPVvi7pj5oBgIZnaCU/I3zMQ0=;
 b=A+ZPhYYidA+pxagEZ71U9PLXKR2ENZsU2cAPqf/cWywzna9sleFqTCgNsklgCl2m2K
 v3ywjeGYg8PvoHfYdt9NBbcoD9MsPMTfetUuqRIz7A4tYrMV+U5kez6ouFsyf70yIdcU
 EYptzInGQ2B9gw3CSzTCgAqHsYMdBXLFeZi/YhENnT73SvXs8JJmVmF0FTtM4Qt8Eb45
 NLs3u4j3l0E4+cf/t6DRoBLRWXUzjUpYSTsXHW7nJsLiwg96mqnLY2fAmV/voeHte4vH
 y7NYTqblDdJYPoA0iKzESYeBuBi5BQSxL2+Xm6TIk4AYf1Ibh2anA9qzix4Od2KvsKX+
 XD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G/NMXMjSBkeIHnho7dTPVvi7pj5oBgIZnaCU/I3zMQ0=;
 b=ZpFdmYJQenmBGl8G0MRwoNtHxjyHMKn62AIpF2fi+BmfmmCvWBoOxE7r329RGLFkdL
 Ccn1T+HZy8UZc9Le5ExUB6HB8tClu9xYLZo7hI8wY8Ht57/3PtlddIgGntHYKfRYHs3E
 wPyPUCSozMrZa6Rnzg2dF6nuqNhKrL1ctQvEAMUkLa+3m9mwTV6whJpBdUZbiMsnc+0n
 AayXtlmlh6m578RrgyP/hIZDF8ArVXCvy7is253Unu+58SLYe2m1L1TdQ0EQk4HJQs4/
 1kJa6nklIpzVo2KUZSf+wfggpPmw5fSA/9jttYRrjko2iKLEn/8jHEwk2pYPmxlTAb25
 NKhA==
X-Gm-Message-State: AOAM530nRZn/NbRM6yBKZtEEgllktClK3SSomwTwH/j0oKKs7h6LubbQ
 ugBp/KnZq6jmagnsB0l6GTU=
X-Google-Smtp-Source: ABdhPJwO4H460UEGuYPNbcYEti5OdjUPd0UKdYp6/7QoqZbPWMUfoX+ZeAyy5sfrywJGz3eB0Pep1A==
X-Received: by 2002:a05:620a:622:: with SMTP id
 2mr32323807qkv.436.1607464727640; 
 Tue, 08 Dec 2020 13:58:47 -0800 (PST)
Received: from LeoBras.ibmuc.com ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id w22sm35819qtt.76.2020.12.08.13.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 13:58:46 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v2 1/1] powerpc/kvm: Fix mask size for emulated msgsndp
Date: Tue,  8 Dec 2020 18:57:08 -0300
Message-Id: <20201208215707.31149-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Leonardo Bras <leobras.c@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

According to ISAv3.1 and ISAv3.0b, the msgsndp is described to split RB in:
msgtype <- (RB) 32:36
payload <- (RB) 37:63
t       <- (RB) 57:63

The current way of getting 'msgtype', and 't' is missing their MSB:
msgtype: ((arg >> 27) & 0xf) : Gets (RB) 33:36, missing bit 32
t:       (arg &= 0x3f)       : Gets (RB) 58:63, missing bit 57

Fixes this by applying the correct mask.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
Changes since v1:
- Commit message 's/LSB/MSB/', because ISA ordering is big-endian.

 arch/powerpc/kvm/book3s_hv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index e3b1839fc251..5af0a429cee8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1241,9 +1241,9 @@ static int kvmppc_emulate_doorbell_instr(struct kvm_vcpu *vcpu)
 	switch (get_xop(inst)) {
 	case OP_31_XOP_MSGSNDP:
 		arg = kvmppc_get_gpr(vcpu, rb);
-		if (((arg >> 27) & 0xf) != PPC_DBELL_SERVER)
+		if (((arg >> 27) & 0x1f) != PPC_DBELL_SERVER)
 			break;
-		arg &= 0x3f;
+		arg &= 0x7f;
 		if (arg >= kvm->arch.emul_smt_mode)
 			break;
 		tvcpu = kvmppc_find_vcpu(kvm, vcpu->vcpu_id - thr + arg);
@@ -1256,7 +1256,7 @@ static int kvmppc_emulate_doorbell_instr(struct kvm_vcpu *vcpu)
 		break;
 	case OP_31_XOP_MSGCLRP:
 		arg = kvmppc_get_gpr(vcpu, rb);
-		if (((arg >> 27) & 0xf) != PPC_DBELL_SERVER)
+		if (((arg >> 27) & 0x1f) != PPC_DBELL_SERVER)
 			break;
 		vcpu->arch.vcore->dpdes = 0;
 		vcpu->arch.doorbell_request = 0;
-- 
2.25.4

