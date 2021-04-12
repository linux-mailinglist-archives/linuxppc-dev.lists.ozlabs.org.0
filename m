Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7812D35B84A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 03:49:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJWrT3DmZz3c4l
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 11:49:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SQ1snoYZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SQ1snoYZ; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJWqd3LQQz300c
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 11:48:59 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id f29so8179181pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 18:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z50PGWgtT7tea+Zn1Qkyxzl07ppTYoZ5ibYNEEJnaYE=;
 b=SQ1snoYZcheAEWI5pmOIZiO+tFZPUI8Q5wFl9BPPKoPLX1c2s8GWcZ3yxznKUoBWDu
 W5ZX+BXqlW4ULdCULt5i2IDmruu1Y7+Vyt9BkuMjtzc0faB/3ilM6iRjYV5xk6kWl0a2
 /OwSCVCFoLdV0gEyNV4iezX/SdqJXcLOJshaXduzlH5SefiurZp2f7iJS8CM6yS3tr8t
 8U0cG6wWdzOwaLMC2CFXcJzqi0pCsBBCx4B78OVgX7xK11CU5n2F7ORxBmjRXrvM9ql9
 m7U/ie/bnuQSGBAHv5Q9TV8w/2PL++fA/MdICK6UnxU46iPy1dUOz0lpWR/GZ9gtAZWq
 NFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z50PGWgtT7tea+Zn1Qkyxzl07ppTYoZ5ibYNEEJnaYE=;
 b=M6P56RQCU/MKQlpVWdOoVIen5Crp1AVSmgG2vvJo4Qm21Val6IEi5ZpANPoCBKEz8y
 gmc8+228XAbuCxmvuHa1bIxlwT43sYOdOCdg8/Nw4AyxZsKTJdufnPCmp64QTAWSlx40
 exWuB7NiU5N4mpASAp21eYsZX44OIFR+J1MpWSOCGAthL6uZWn90/2wIdj6rl9rVznZt
 QRN6+1NRLg52ybC4TW8rh6QLb8cqmJ61YX7O+b2ZgjojdABMpVAcaNB9SzON831E20tY
 YaiB/llG42HDfhf/zYBtsTw4zkQwGaxugEM5WxHCKw1mFAS9t9ykrM1kvNNc9VuAMjoV
 SDHw==
X-Gm-Message-State: AOAM5325MBVh4JyrjsSitf0LqeyqkXsyRnkaH7Nmmj8zBk7zQmKaNIQ0
 +8GZVHgY8apaTZRsD6VipL4=
X-Google-Smtp-Source: ABdhPJxmCDWh2nPt64vl3jvFOnXjwUFL/kX0n2gA+V6tya3ZT1YcBssBYuDp3PjR7c04Ie/U2A3Miw==
X-Received: by 2002:a05:6a00:2389:b029:21a:d3b4:e5 with SMTP id
 f9-20020a056a002389b029021ad3b400e5mr23210783pfc.39.1618192134345; 
 Sun, 11 Apr 2021 18:48:54 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id m9sm9502345pgt.65.2021.04.11.18.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 18:48:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 00/12] minor KVM fixes and cleanups
Date: Mon, 12 Apr 2021 11:48:33 +1000
Message-Id: <20210412014845.1517916-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here is the first batch of patches are extracted from the patches of the
KVM C conversion series, plus one new fix (host CTRL not restored) since
v6 was posted.

Please consider for merging.

Thanks,
Nick

Nicholas Piggin (12):
  KVM: PPC: Book3S HV P9: Restore host CTRL SPR after guest exit
  KVM: PPC: Book3S HV: Nested move LPCR sanitising to sanitise_hv_regs
  KVM: PPC: Book3S HV: Add a function to filter guest LPCR bits
  KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be set to 1 or 2
  KVM: PPC: Book3S HV: Prevent radix guests setting LPCR[TC]
  KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
  KVM: PPC: Book3S HV: remove unused kvmppc_h_protect argument
  KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=n default hcalls
  powerpc/64s: Remove KVM handler support from CBE_RAS interrupts
  powerpc/64s: remove KVM SKIP test from instruction breakpoint handler
  KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in guest MSR
  KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear in guest MSR

 arch/powerpc/include/asm/kvm_book3s.h |  2 +
 arch/powerpc/include/asm/kvm_ppc.h    |  3 +-
 arch/powerpc/kernel/exceptions-64s.S  | 15 +++--
 arch/powerpc/kvm/book3s_hv.c          | 85 ++++++++++++++++++++-------
 arch/powerpc/kvm/book3s_hv_builtin.c  |  3 +
 arch/powerpc/kvm/book3s_hv_nested.c   | 37 +++++++++---
 arch/powerpc/kvm/book3s_hv_rm_mmu.c   |  3 +-
 7 files changed, 109 insertions(+), 39 deletions(-)

-- 
2.23.0

