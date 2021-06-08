Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0411E39F3A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 12:34:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzmnt2XDhz3btB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 20:34:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=f9s3tlGd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f9s3tlGd; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzmnP6fYFz2xdM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 20:34:16 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id q6so10483250qvb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J48k4WcLJ93C6a4z5qvH4NdBXcXofCtpkZgQyGSY/Bw=;
 b=f9s3tlGdv+Y1LSpT+BfcUXtXM2IKhT7mXXeAXGNZVv9grY44lipLCrOVlyDsoNqFHY
 bgRAtbzCs0cwsYch3IqjUkRg21qKS89A0AvC/4hjJpGDX8cSkRKtUGIzPDwgYi9y+T31
 8TAJrWW5ruMltyaKoq0xV+xGYunqeX5PTvyvcT1gXDjiJ+SWx42GiARauzNeLu799E7w
 lDoMh2hpfafy5xC8CoMGZ4dlEujFKrS0wSuarkwsCOAPKTSiLxeRJBlLEVts/CKlGdvE
 mMCenIyU7M1vbyvJ3RVCjBI/ZXYJixFMzu/bSlpoKLuIDf0YZxDH93cd2ya4ma5A6ezs
 dAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J48k4WcLJ93C6a4z5qvH4NdBXcXofCtpkZgQyGSY/Bw=;
 b=BJPWjcXisofq+u8sHg6917TYtV+uLUVOHntIuZSI8xU8TptOYxywyPK0vrUwTwrJ1E
 ibqDGvqOtt2z6z5vtKC9BRsL9U4rNNW3C6WCaZr7+jDw9uMKRPego7XS+DcYjpYNLEZR
 n7BMuJDJ29lAgFtPwnRPF5ge2tZUMpPU203IUrBjuj9Yxie/OVBOo2nuTcPeZLFgLWqK
 yZ67cM7XjLnrQ3/Ajc3PXQRSx8xOSVUtB7gqrLQUy+9pC8yawykQSssiqM+li4et+5pJ
 eCdM63voxpgQZ9nPoIgiNtsRav2nfgbNFMBgveDoyCWuhtjrQmVK4TBgETiHhui4dXQw
 8NZA==
X-Gm-Message-State: AOAM533xlTsb/22i5oQQYYkwG0rH/ssUNl/fcIxQP9bwT1k79K/fiJnH
 Hl3wQlLvsS3sp8srpUcMVA==
X-Google-Smtp-Source: ABdhPJzwosaCGBBwjiwr3ftTAMod+g7XPn30t+/0BRzJxX9QrrUMaPQenkgIE6i5E4uZVVsWsh1sig==
X-Received: by 2002:a0c:ed46:: with SMTP id v6mr22752280qvq.46.1623148451751; 
 Tue, 08 Jun 2021 03:34:11 -0700 (PDT)
Received: from qualcomm-amberwing-rep-18.khw4.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id e3sm2260682qts.34.2021.06.08.03.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 03:34:11 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: 
Subject: [PATCH] crash_core,
 vmcoreinfo: Append 'SECTION_SIZE_BITS' to vmcoreinfo
Date: Tue,  8 Jun 2021 06:33:59 -0400
Message-Id: <20210608103359.84907-1-kernelfans@gmail.com>
X-Mailer: git-send-email 2.27.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Baoquan He <bhe@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 x86@kernel.org, kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Pingfan Liu <kernelfans@gmail.com>, linux-kernel@vger.kernel.org,
 Boris Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Young <dyoung@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Dave Anderson <anderson@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As mentioned in kernel commit 1d50e5d0c505 ("crash_core, vmcoreinfo:
Append 'MAX_PHYSMEM_BITS' to vmcoreinfo"), SECTION_SIZE_BITS in the
formula:
    #define SECTIONS_SHIFT    (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)

Besides SECTIONS_SHIFT, SECTION_SIZE_BITS is also used to calculate
PAGES_PER_SECTION in makedumpfile just like kernel.

Unfortunately, this arch-dependent macro SECTION_SIZE_BITS changes, e.g.
recently in kernel commit f0b13ee23241 ("arm64/sparsemem: reduce
SECTION_SIZE_BITS"). But user space wants a stable interface to get this
info. Such info is impossible to be deduced from a crashdump vmcore.
Hence append SECTION_SIZE_BITS to vmcoreinfo.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Boris Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Dave Anderson <anderson@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org
Cc: x86@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 kernel/crash_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 825284baaf46..684a6061a13a 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -464,6 +464,7 @@ static int __init crash_save_vmcoreinfo_init(void)
 	VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
 	VMCOREINFO_STRUCT_SIZE(mem_section);
 	VMCOREINFO_OFFSET(mem_section, section_mem_map);
+	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
 	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
 #endif
 	VMCOREINFO_STRUCT_SIZE(page);
-- 
2.29.2

