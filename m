Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2081D37F7C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 14:22:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgrQY0B5Jz2yx4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 22:22:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WgouQyYS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WgouQyYS; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgrQ60Ly8z2xv7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 22:22:19 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id s20so14257991plr.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 05:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ft0g2zD8408Z54jIUMFNMg0Bz9F8U7T73dGcm+3N1sc=;
 b=WgouQyYS1RzZQz5cgkB+QbAUWCmyfd8FavisI6f6E11Kj1ARvMhhhC2Dd9lIt85v6i
 4AViihE0E4IVJIglSG9phsDue3Q8dSX6FKhv3ZgotMB2fkL9P3NR+ftBxkH8ITAP3dyp
 1lNO7gzMd8OxBn/LB+y0qqjGE3PGbVzpr+L9ISnNiD9SJvKw/fSLnnOYdun9cYchMbT/
 4Tv6ngAhg3aXsNKrm5gVb8KwnsJQAwgiNoFRj025b4kKruUEky7z3sf8d8MAPZULGIB2
 PF8/NjgkdW2jiUNb13ZjTirwhbK9Q30NZDsJaWiFmGIIQ7pTBeGgBq8V4SPmhOerkBFF
 kWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ft0g2zD8408Z54jIUMFNMg0Bz9F8U7T73dGcm+3N1sc=;
 b=rCtHApE+SBDnCCvhdp0VRLwRVqQ5pgM1FgfzxfXlCir32KD8jt5Mou10Tjvw5TG48T
 J39guBaQgFO3cV7+85l1/6owz/z2Rxt6GtCkfJhhzjGuFoDtYJDZtxJVeZ8bpkwUkPfB
 xtIQ3nDlzwr+xdByb39S7eMbNe/3vIwrIE4chw6GBROxiujDbmMMzBrKYp0RlzlvfYiJ
 eiVMe6gt6OZUmyRMd25ue6hNyt+BvnuS2PNf/MCgvCVgew0csWmCi9shmeIAnXuOi/LK
 WX0lHRqyfIKX1H6nWcFecVMm42yAgL/eawaViV3vdf6E+D8lCuJk0BNmD0s2QlieiRC+
 NMCA==
X-Gm-Message-State: AOAM531vcHmKkOLhio/DM+8ZJbLAUzT0ARQ4LEIdEVil1sQ4cy6VLDKl
 rdV+eem8vsool0UrI2KLBwU=
X-Google-Smtp-Source: ABdhPJyDDIePA561klkx5Izw8hZ45eztbXOBhC78Ydo0jBoOihKyD0iPQUSkIgPRDYhphH3Eeyx0tA==
X-Received: by 2002:a17:903:208a:b029:ef:9465:ad10 with SMTP id
 d10-20020a170903208ab02900ef9465ad10mr4614574plc.53.1620908536360; 
 Thu, 13 May 2021 05:22:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id
 mp21sm6892416pjb.50.2021.05.13.05.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:22:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 0/4] KVM: PPC: Convert P9 HV path to C
Date: Thu, 13 May 2021 22:22:03 +1000
Message-Id: <20210513122207.1897664-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This applies on top of these series:

https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=238649
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=238941
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=238946

This was broken out from the large Cify series. Since that was last
posted, changes are:

- Rebase, reordering of patches, tweaking changelog and comments.
- Changed P9 radix exist SLB sanitising to use 4x slbmte to clear
  rather than 8x slbmfee/slbmfev, which turns out to be faster (and
  is what today's asm code does) [from review from Paul].
- Renamed book3s_hv_interrupt.c to book3s_hv_p9_entry.c, which reduces
  confusion with book3s_hv_interrupts.S.
- Fixed !HV compile [Alexey].

Nicholas Piggin (4):
  KVM: PPC: Book3S HV P9: Move xive vcpu context management into
    kvmhv_p9_guest_entry
  KVM: PPC: Book3S HV P9: Move radix MMU switching instructions together
  KVM: PPC: Book3S HV P9: Stop handling hcalls in real-mode in the P9
    path
  KVM: PPC: Book3S HV P9: Implement the rest of the P9 path in C

 arch/powerpc/include/asm/asm-prototypes.h |   3 +-
 arch/powerpc/include/asm/kvm_asm.h        |   1 +
 arch/powerpc/include/asm/kvm_book3s_64.h  |   8 +
 arch/powerpc/include/asm/kvm_host.h       |   7 +-
 arch/powerpc/include/asm/kvm_ppc.h        |   6 +
 arch/powerpc/kernel/security.c            |   5 +-
 arch/powerpc/kvm/Makefile                 |   1 +
 arch/powerpc/kvm/book3s.c                 |   6 +
 arch/powerpc/kvm/book3s_64_entry.S        | 254 ++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv.c              | 155 +++++++++----
 arch/powerpc/kvm/book3s_hv_p9_entry.c     | 207 ++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 120 +---------
 arch/powerpc/kvm/book3s_xive.c            |  64 ++++++
 13 files changed, 683 insertions(+), 154 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_hv_p9_entry.c

-- 
2.23.0

