Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A1810DA71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 21:07:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Plt94LP0zDqQv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 07:07:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="g67Pbjtj"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Plhx6j0JzDrDN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 06:59:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575057583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgbAkKrJxLS1NEOR+82/qBcYhhrIFUtkNwc9k9kwPFE=;
 b=g67PbjtjNW2gWVaxWntJxYAWFPxQoPMwMGyEZBjGur+Ax4vwQzmWHaM9aPz2bR9OW8OF/T
 58WuqQQcW+DvV9yq6FLt/uVpJA+CgRKZvPfmMYexmrHtKE3QW7M5WlNKSU2SUzRcs1c1YP
 AqT9Xpi1FRHKBxwmV+MyWmW9EPJwEms=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-rBFZdBG-Oomt83380yTufw-1; Fri, 29 Nov 2019 14:59:41 -0500
Received: by mail-pg1-f200.google.com with SMTP id p21so4987410pgh.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 11:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iJyjrUFfcmHAhH3JG4K3fZfDXNCj7aMMhMdC/cxhP5Q=;
 b=eXLUZIdQC1w+DADEGDhPjzxS3I5uotGRJvKnvnumizpTCWPhB2tebuLGGfk9Skq+mF
 tPnrHzwRZV4dqEage5E/XXzWKpMD7t2ormD/zwLcK2zU+txBXQNNv5VLyuSo4U7v4p0y
 GwExAsRA5G9n+UXiy+a1K08+xHOqWMZL8bkML/dwG1i0ywuxzKDpyc7Ts0agO3415fdR
 Zz5CIYuysUAxa2BJG8yMqdjiop6ZHDWZhdwCx+xoDzR8eME4Pc69J9l8Xp+dNKNyAwME
 vo3CkPrd4M6+/XVbs5o9yDU6S3/Esqmf6kTmogmEhCPO6iwuRIAvmZj3WcLf9oJ96LRr
 9jtw==
X-Gm-Message-State: APjAAAWQDRMq+z8aHSPXAvwXXEXEQMeu3CZdM2XRP4dkYemY74cSGhIT
 BQOW7a8kNxG09V6JDf+Sf3oCuI80CdtWUhb3X26JxGQXew6x6EyPc0w6DoOord2q9yiEnceHGWU
 gpAxbUjma7ls09mr1dA7piSklCg==
X-Received: by 2002:a63:fb03:: with SMTP id o3mr18525466pgh.378.1575057580572; 
 Fri, 29 Nov 2019 11:59:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSS9+ZN7GKT/MIwc8aGAoCV6a/ldIDRYJOYbBvx5BLhqOQbU8FUr1Poz3Dix0kBpRLDW39Sw==
X-Received: by 2002:a63:fb03:: with SMTP id o3mr18525441pgh.378.1575057580274; 
 Fri, 29 Nov 2019 11:59:40 -0800 (PST)
Received: from localhost ([122.177.85.74])
 by smtp.gmail.com with ESMTPSA id jx12sm6300003pjb.26.2019.11.29.11.59.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Nov 2019 11:59:39 -0800 (PST)
From: Bhupesh Sharma <bhsharma@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v5 2/5] arm64/crash_core: Export TCR_EL1.T1SZ in
 vmcoreinfo
Date: Sat, 30 Nov 2019 01:29:16 +0530
Message-Id: <1575057559-25496-3-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: rBFZdBG-Oomt83380yTufw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-doc@vger.kernel.org,
 Will Deacon <will@kernel.org>, bhsharma@redhat.com, x86@kernel.org,
 kexec@lists.infradead.org, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 James Morse <james.morse@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Anderson <anderson@redhat.com>, bhupesh.linux@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vabits_actual variable on arm64 indicates the actual VA space size,
and allows a single binary to support both 48-bit and 52-bit VA
spaces.

If the ARMv8.2-LVA optional feature is present, and we are running
with a 64KB page size; then it is possible to use 52-bits of address
space for both userspace and kernel addresses. However, any kernel
binary that supports 52-bit must also be able to fall back to 48-bit
at early boot time if the hardware feature is not present.

Since TCR_EL1.T1SZ indicates the size offset of the memory region
addressed by TTBR1_EL1 (and hence can be used for determining the
vabits_actual value) it makes more sense to export the same in
vmcoreinfo rather than vabits_actual variable, as the name of the
variable can change in future kernel versions, but the architectural
constructs like TCR_EL1.T1SZ can be used better to indicate intended
specific fields to user-space.

User-space utilities like makedumpfile and crash-utility, need to
read/write this value from/to vmcoreinfo for determining if a virtual
address lies in the linear map range.

The user-space computation for determining whether an address lies in
the linear map range is the same as we have in kernel-space:

  #define __is_lm_address(addr)=09(!(((u64)addr) & BIT(vabits_actual - 1)))

I have sent out user-space patches for makedumpfile and crash-utility
to add features for obtaining vabits_actual value from TCR_EL1.T1SZ (see
[0] and [1]).

Akashi reported that he was able to use this patchset and the user-space
changes to get user-space working fine with the 52-bit kernel VA
changes (see [2]).

[0]. http://lists.infradead.org/pipermail/kexec/2019-November/023966.html
[1]. http://lists.infradead.org/pipermail/kexec/2019-November/024006.html
[2]. http://lists.infradead.org/pipermail/kexec/2019-November/023992.html

Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Dave Anderson <anderson@redhat.com>
Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org
Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
---
 arch/arm64/include/asm/pgtable-hwdef.h | 1 +
 arch/arm64/kernel/crash_core.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/as=
m/pgtable-hwdef.h
index d9fbd433cc17..d2e7aff5821e 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -215,6 +215,7 @@
 #define TCR_TxSZ(x)=09=09(TCR_T0SZ(x) | TCR_T1SZ(x))
 #define TCR_TxSZ_WIDTH=09=096
 #define TCR_T0SZ_MASK=09=09(((UL(1) << TCR_TxSZ_WIDTH) - 1) << TCR_T0SZ_OF=
FSET)
+#define TCR_T1SZ_MASK=09=09(((UL(1) << TCR_TxSZ_WIDTH) - 1) << TCR_T1SZ_OF=
FSET)
=20
 #define TCR_EPD0_SHIFT=09=097
 #define TCR_EPD0_MASK=09=09(UL(1) << TCR_EPD0_SHIFT)
diff --git a/arch/arm64/kernel/crash_core.c b/arch/arm64/kernel/crash_core.=
c
index ca4c3e12d8c5..f78310ba65ea 100644
--- a/arch/arm64/kernel/crash_core.c
+++ b/arch/arm64/kernel/crash_core.c
@@ -7,6 +7,13 @@
 #include <linux/crash_core.h>
 #include <asm/memory.h>
=20
+static inline u64 get_tcr_el1_t1sz(void);
+
+static inline u64 get_tcr_el1_t1sz(void)
+{
+=09return (read_sysreg(tcr_el1) & TCR_T1SZ_MASK) >> TCR_T1SZ_OFFSET;
+}
+
 void arch_crash_save_vmcoreinfo(void)
 {
 =09VMCOREINFO_NUMBER(VA_BITS);
@@ -15,5 +22,7 @@ void arch_crash_save_vmcoreinfo(void)
 =09=09=09=09=09=09kimage_voffset);
 =09vmcoreinfo_append_str("NUMBER(PHYS_OFFSET)=3D0x%llx\n",
 =09=09=09=09=09=09PHYS_OFFSET);
+=09vmcoreinfo_append_str("NUMBER(tcr_el1_t1sz)=3D0x%llx\n",
+=09=09=09=09=09=09get_tcr_el1_t1sz());
 =09vmcoreinfo_append_str("KERNELOFFSET=3D%lx\n", kaslr_offset());
 }
--=20
2.7.4

