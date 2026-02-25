Return-Path: <linuxppc-dev+bounces-17146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAaHLuuQnmnTWAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 07:04:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE22C1923D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 07:04:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLPDZ5QHbz3dWH;
	Wed, 25 Feb 2026 17:04:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771999454;
	cv=none; b=SqSEXeKwAQnXHMMza7QFXV/FuHiy6iIcFXJF+4GxZjSBuwLaJVAFgWleGnimTEMaJBSlygKOI7iBBAOQeKZ/Sb73DaTPCppJLMZ/AlJBqcCrb4iDnsJNax1pA6LlXhGTPyCRpBJAwKE+y3Wj1N1zCj6GwC27GcP+/5t9z4OB1g4ot1dYeOr0zdo/uMDdAZc8aPkkRbV8JROcqXasD02h+4IrSEv5wVsYAhA8vVNaY+1+uahplRGr25HN4BeUO9Xo+1cETd6grgHg5zywgU6QJK7EbO1MIBcYY6giMj1b90aXg5RAa0NhTHXuBUTaeW0u1YaEPaJ7E6R2ZI3P7FjAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771999454; c=relaxed/relaxed;
	bh=jAZI4/OSU4kBMOxoXJVKa+WF0ADBr7+Jm8V1UGkVmOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=QCJ2tP/6Vd13Y2ATXM7fyiZq4fpjcRhGk+JsgvXIDEUoETlzyHCoB9t6L6eSV2vMEQ2ydioBWuiP/+ujIbFHXed7/rDAeaok3QcvJd536KZVr+ZUYZAgyla5OzP1A9T2b9G/xW6VfxKMb1aJFr69ZO39SILTbHOUSMMmB+V9PAuNVBtjwliX/ahGRsgPhjBwbjJqNCnXk1lHW1WwTx8ICRVWLdCrUdnNctU//8hnYFWVyD/ORKDmym6ZnorPrtGZxEge/0U0VrLb/l6vFMmAoewirX3NZlz7M8bzX7VekqBzcFysleJzYJOWPJDXdjo3OAOBbd5fb8AA7JsfzkXh0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=avREh4q+; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=avREh4q+; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=avREh4q+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=avREh4q+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLPDY6QMBz3dWF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 17:04:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAZI4/OSU4kBMOxoXJVKa+WF0ADBr7+Jm8V1UGkVmOI=;
	b=avREh4q+56nuepxpNGgyDeTUbUkBUs6WDmmriDZzNp6ql/RjFlNBZ4sLKHROfi0/9FHC4/
	A68gv+uDQ9+uuRQlXlBqh7TXr/dam3UsBx00zkeBoJ43E4sXTdOBwNz7k8wDzKnmzm6876
	hgu3dQxkmz7IxXCtU5n3NMhdMV/bUDw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAZI4/OSU4kBMOxoXJVKa+WF0ADBr7+Jm8V1UGkVmOI=;
	b=avREh4q+56nuepxpNGgyDeTUbUkBUs6WDmmriDZzNp6ql/RjFlNBZ4sLKHROfi0/9FHC4/
	A68gv+uDQ9+uuRQlXlBqh7TXr/dam3UsBx00zkeBoJ43E4sXTdOBwNz7k8wDzKnmzm6876
	hgu3dQxkmz7IxXCtU5n3NMhdMV/bUDw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-X5Z1pjYeOsaRHxw9vHO3Qw-1; Wed, 25 Feb 2026 01:04:08 -0500
X-MC-Unique: X5Z1pjYeOsaRHxw9vHO3Qw-1
X-Mimecast-MFC-AGG-ID: X5Z1pjYeOsaRHxw9vHO3Qw_1771999447
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70b75aea3aso2569046a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 22:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771999447; x=1772604247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jAZI4/OSU4kBMOxoXJVKa+WF0ADBr7+Jm8V1UGkVmOI=;
        b=Jjy8jJF8/MAKPW3cjBgLCoRpd6yMOUH/5q3jP+7BK1PNMed2eLq0CGZsk/UrRW7uUP
         HNAtBD8UR0iL8NE2GCQ5gLXBVvlhriiWfmkgOgeMeHvuT+OfN/UHzfWUZUAWrmMMdeP1
         77gzDFivf1XvND5Vf9R5oAzQft2TT5xFyLddx3vZdrvbAciIyi+q9mgRSNDfw2IVQidw
         4HlhXNcJFCa6U1iM8fqUmLiXaGrAFxM+lOr98v8HRsrMvSjgOoZVG2W8Yybzz7WeyASQ
         mzHkwsVkNOSGySbTc2WrPm764FIJ1ZUmP/OrTKednbtbFf1lUB0Vhsi8bm+vNMU/tH8w
         3HNA==
X-Forwarded-Encrypted: i=1; AJvYcCUdkIc60wCUlxbuNwY5S72QqwToVueVd1k3Y6EbnyQwmNCekhy+ioPbvasr/9PycQ/v3RhVCx0LP1vNKts=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZNtisIs0ix54OVhMNuhOBlL/02k7PmhvBEiWl7koQ13HHJ9a5
	Ih4ropyDLrjGGczNIIp/9pKFgDGwBzjiq7Jy/sSv1rugRt3Ofan/6zVpWydEyB2fZWk8aaH73Jx
	pd5D4u9y0SenB/2A6c7d5UT4+ul1SOr6GEht0jLiCn9SPQYR2q+EQadiRjEh902d35mA=
X-Gm-Gg: ATEYQzxLVAxGzsKhZtwaBid5a+fLt2DAd/1OCxz4j3/NM3BGbpxivX0zKB85GuEGKyZ
	3hQcjBoxPGHRm1UduDgx1q6e6ah7hkUwWRunOmbr2F+QA87C4hDtR5dvtIUMEuGS7hdBghvRQdP
	p0wZjhNksWE6brEOYzj0nB/+oYcLC8gGOQpK07ssC5NkPwoEgaB7byU1CNuOnMfF5Kdo309ljfy
	Yn+l67SzR8M2mkixV63zZELhVUehTty+vBmqFz0yxVRYz7xSxPYkxriQB8LS4noD++PZbQ4B554
	hKTKQD9idrtOzCYe6LgcNDxFQGzrwE2DOFOsnUCaAWTyYWZh1kBZgx+w1naQ20GZ9sbgXPdXVo0
	5pFlokynKJQwg
X-Received: by 2002:a05:6a00:2997:b0:824:adf4:5a32 with SMTP id d2e1a72fcca58-826daa01ffcmr10872370b3a.42.1771999447102;
        Tue, 24 Feb 2026 22:04:07 -0800 (PST)
X-Received: by 2002:a05:6a00:2997:b0:824:adf4:5a32 with SMTP id d2e1a72fcca58-826daa01ffcmr10872341b3a.42.1771999446454;
        Tue, 24 Feb 2026 22:04:06 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8ecb2dsm12330215b3a.60.2026.02.24.22.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:04:06 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>,
	Baoquan he <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Staudt <tstaudt@de.ibm.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 3/3] arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel
Date: Wed, 25 Feb 2026 14:03:46 +0800
Message-ID: <20260225060347.718905-4-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225060347.718905-1-coxu@redhat.com>
References: <20260225060347.718905-1-coxu@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6MW614Pu5DkyEVgfNLK8DATGJSZ4PRnEJHfWBGS4cA4_1771999447
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[clever-cloud.com,redhat.com,gmail.com,linux-foundation.org,kernel.org,de.ibm.com,linux.ibm.com,arm.com,ellerman.id.au,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17146-lists,linuxppc-dev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:devicetree@vger.kernel.org,m:arnaud.lefebvre@clever-cloud.com,m:bhe@redhat.com,m:dyoung@redhat.com,m:ryncsn@gmail.com,m:kernelfans@gmail.com,m:akpm@linux-foundation.org,m:krzk@kernel.org,m:robh@kernel.org,m:tstaudt@de.ibm.com,m:sourabhjain@linux.ibm.com,m:will@kernel.org,m:chleroy@kernel.org,m:catalin.marinas@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,clever-cloud.com:email]
X-Rspamd-Queue-Id: DE22C1923D7
X-Rspamd-Action: no action

CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
device dump target by addressing two challenges [1],
 - Kdump kernel may not be able to decrypt the LUKS partition. For some
   machines, a system administrator may not have a chance to enter the
   password to decrypt the device in kdump initramfs after the 1st kernel
   crashes

 - LUKS2 by default use the memory-hard Argon2 key derivation function
   which is quite memory-consuming compared to the limited memory reserved
   for kdump.

To also enable this feature for ARM64 and PowerPC, the missing piece is
to let the kdump kernel know where to find the dm-crypt keys which are
randomly stored in memory reserved for kdump. Introduce a new device
tree property dmcryptkeys [2] as similar to elfcorehdr to pass the
memory address of the stored info of dm-crypt keys to the kdump kernel.
Since this property is only needed by the kdump kernel, it won't be
exposed to user space.

[1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
[2] https://github.com/devicetree-org/dt-schema/pull/181

Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
Cc: Baoquan he <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Kairui Song <ryncsn@gmail.com>
Cc: Pingfan Liu <kernelfans@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thomas Staudt <tstaudt@de.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/arm64/kernel/machine_kexec_file.c |  4 ++++
 arch/powerpc/kexec/elf_64.c            |  4 ++++
 drivers/of/fdt.c                       | 21 +++++++++++++++++++++
 drivers/of/kexec.c                     | 19 +++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index fba260ad87a9..e31fabed378a 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -134,6 +134,10 @@ int load_other_segments(struct kimage *image,
 
 		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
 			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
+
+		ret = crash_load_dm_crypt_keys(image);
+		if (ret)
+			goto out_err;
 	}
 #endif
 
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 5d6d616404cf..ea50a072debf 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -79,6 +79,10 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 			goto out;
 		}
 
+		ret = crash_load_dm_crypt_keys(image);
+		if (ret)
+			goto out;
+
 		/* Setup cmdline for kdump kernel case */
 		modified_cmdline = setup_kdump_cmdline(image, cmdline,
 						       cmdline_len);
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 331646d667b9..2967e4aff807 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -866,6 +866,26 @@ static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
 		 elfcorehdr_addr, elfcorehdr_size);
 }
 
+static void __init early_init_dt_check_for_dmcryptkeys(unsigned long node)
+{
+	const char *prop_name = "linux,dmcryptkeys";
+	const __be32 *prop;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DM_CRYPT))
+		return;
+
+	pr_debug("Looking for dmcryptkeys property... ");
+
+	prop = of_get_flat_dt_prop(node, prop_name, NULL);
+	if (!prop)
+		return;
+
+	dm_crypt_keys_addr = dt_mem_next_cell(dt_root_addr_cells, &prop);
+
+	/* Property only accessible to crash dump kernel */
+	fdt_delprop(initial_boot_params, node, prop_name);
+}
+
 static unsigned long chosen_node_offset = -FDT_ERR_NOTFOUND;
 
 /*
@@ -1097,6 +1117,7 @@ int __init early_init_dt_scan_chosen(char *cmdline)
 
 	early_init_dt_check_for_initrd(node);
 	early_init_dt_check_for_elfcorehdr(node);
+	early_init_dt_check_for_dmcryptkeys(node);
 
 	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
 	if (rng_seed && l > 0) {
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index c4cf3552c018..fbd253f0d3c5 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -423,6 +423,25 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
 		if (ret)
 			goto out;
 
+		if (image->dm_crypt_keys_addr != 0) {
+			ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
+						       "linux,dmcryptkeys",
+						       image->dm_crypt_keys_addr,
+						       image->dm_crypt_keys_sz);
+
+			if (ret)
+				goto out;
+
+			/*
+			 * Avoid dmcryptkeys from being stomped on in kdump kernel by
+			 * setting up memory reserve map.
+			 */
+			ret = fdt_add_mem_rsv(fdt, image->dm_crypt_keys_addr,
+					      image->dm_crypt_keys_sz);
+			if (ret)
+				goto out;
+		}
+
 #ifdef CONFIG_CRASH_DUMP
 		/* add linux,usable-memory-range */
 		ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
-- 
2.53.0


