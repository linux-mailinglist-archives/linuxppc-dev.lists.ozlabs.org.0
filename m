Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8A62130F4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 03:22:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ycdB3hMnzDqgF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 11:22:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HkoezpR3; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ycb25PnwzDqkZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 11:20:14 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id l63so14300737pge.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 18:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5/bbf0lUkrxiWX+PZ82pZ/eXhfvbz8TXVOafo3xC3F0=;
 b=HkoezpR3Rsole2z2xQyFjnqIZB96rn8qursrHwJyGGYjCnRvK0CdUvFnNkVo/a3oxj
 tZiHoW4EOwjWjrKuT2Fm0bHj61Tn91It9qgnjPgpDfdHlzL2Rlc61PP2G4uxcEZQcv0y
 w6XzjQRr0TwzY4uc++FK4kSVBTQBG+RodfVT1VXSveDOiIlzGe3a76zuRl1MDiD9AlX2
 +xkRcvI6Lm+n9CV6fcCl/0wJ6EDqI0+ggDPF5JcvZa/PqxcGUsPy/bYxa4mg881CjKEp
 CnafRjr0co53AqXKYi9sZr1G8CzaLd9T4cVFMb+x/IRXsfr3HT7FKDjoe7W1Gvpdr8R1
 iVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5/bbf0lUkrxiWX+PZ82pZ/eXhfvbz8TXVOafo3xC3F0=;
 b=rhR0Cl3sTad0Xh6DIXR+swyDaeQunsLsIAR7XBa5Y6hsv/yhRvIIHVcL4juLrzXSg6
 GvNOkWacgoVnow3sIQyINhjaU+iLSkO0sUIhHmcxIBZtBQ/EdnLqG7SKXWXeScJDhCAo
 iClP6BjnErG1f/ec5bq9ErYu9BQ2jmnJSLNWvtVguiADvAZHxe0i+O8eJt8at8SR4mEH
 sDgpSj02XVNnI4Rt6DcGBjHvr8CIyeO53+aYZCfmIrC4wNYkWw8FNH6WsSDGud3Ga8gi
 +p/tIlqckJPq9kFVw69C9yO45BZ+1ragTIE0lthHf4Q1ByUstrTKCQ2+dUpjhU+uzoVw
 QDMQ==
X-Gm-Message-State: AOAM5316bRyE3qSjy15ReRkX5NEStetdbtSOc/YQABEIl/YdfOQqLk22
 5WF61v5stCp78q0uH6Sl0bLhc6Cu
X-Google-Smtp-Source: ABdhPJxTT4D2raEsHiMfFaMgNHqSE7CiS0TXVGXWZARc5uCHcybm0Uq1+PwOqMoXtrME3PxEG4EBvA==
X-Received: by 2002:a63:e00c:: with SMTP id e12mr26903209pgh.413.1593739210833; 
 Thu, 02 Jul 2020 18:20:10 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id v186sm10094222pfv.141.2020.07.02.18.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 18:20:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/3] remove PROT_SAO support and disable
Date: Fri,  3 Jul 2020 11:19:55 +1000
Message-Id: <20200703011958.1166620-1-npiggin@gmail.com>
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
Cc: linux-mm@kvack.org, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-api@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It was suggested that I post this to a wider audience on account of
the change to supported userspace features in patch 2 particularly.

Thanks,
Nick

Nicholas Piggin (3):
  powerpc: remove stale calc_vm_prot_bits comment
  powerpc/64s: remove PROT_SAO support
  powerpc/64s/hash: disable subpage_prot syscall by default

 arch/powerpc/Kconfig                          |  7 +++-
 arch/powerpc/configs/powernv_defconfig        |  1 -
 arch/powerpc/configs/pseries_defconfig        |  1 -
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  8 ++--
 arch/powerpc/include/asm/cputable.h           | 10 ++---
 arch/powerpc/include/asm/kvm_book3s_64.h      |  5 ++-
 arch/powerpc/include/asm/mman.h               | 30 ++-----------
 arch/powerpc/include/asm/nohash/64/pgtable.h  |  2 -
 arch/powerpc/include/uapi/asm/mman.h          |  2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c             |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  2 -
 include/linux/mm.h                            |  2 -
 include/trace/events/mmflags.h                |  2 -
 mm/ksm.c                                      |  4 --
 tools/testing/selftests/powerpc/mm/.gitignore |  1 -
 tools/testing/selftests/powerpc/mm/Makefile   |  4 +-
 tools/testing/selftests/powerpc/mm/prot_sao.c | 42 -------------------
 17 files changed, 25 insertions(+), 100 deletions(-)
 delete mode 100644 tools/testing/selftests/powerpc/mm/prot_sao.c

-- 
2.23.0

