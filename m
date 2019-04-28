Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 753DCB5E9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 13:47:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sQxY33w9zDqbC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 21:46:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ID3a7rG8"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sQw13wkyzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 21:45:37 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id z8so3752359pln.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 04:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+gwi6G4HfM8wbU1ouuFem2hELZ6vvB/GA2XoVZpkolg=;
 b=ID3a7rG8+alte1n+cuH8FlxyD8FYI+a7WqyQI9Kik2GDX7ULh1+QjskyvKora5SvPR
 uIGXCOIa+sXT6b8lNrtHTLbHL6RIy6Xs0fEh2AxXirNg3tpmFSvcsu15mtIe8+ZXPiqV
 eQXdz6iSSquvNOYVy1sOX+hXoSZ41dFyKq7KdeVSlXjQWGzAXQMjD8U/1RgFeyvtjEH4
 /2xycVzXfH6DPgtEkTcOPk8bD+EynvjnBfC6G0CIv04kKacw1xASeggQXzEGahNpM+BC
 EW8YWQKtPKX0ti4Mct25kEBKuJ5XJKstXcJdtN5Gs4L33KooX2h+ey1u2mD62Lb5YhgO
 DklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+gwi6G4HfM8wbU1ouuFem2hELZ6vvB/GA2XoVZpkolg=;
 b=dXQHo4Ziruu8HOhSdrp8ik0brdrmSp/plBTPsKF3Vnyx4EY1/W0Laovc+mPuNXLrh+
 UkxUzieYuoso/rz/kE7cXiMXJz0dSxQNl1LJL39Y08FALU397O+EA5pmVt4VIEwQ8szg
 vvwn/tBDKn+hpPB9qda8sgWYbJZY6qSnKzi1Ot7UxTz8SiRN1YcrYwwKL+yPZLc4UNoZ
 fRRy+mex3S+/lqcDNsYC/rEATWEFC8oM0Fy2CVpQkmsGHxXs3NSNHU3QHqNrcHCJlD+6
 YJXUiay6LcMTWnPhfeapvmTzLfubnlWQLM2vPkdj3vh5J+ecuTLw8jf5KzNk/NoVejTY
 EXsg==
X-Gm-Message-State: APjAAAWJ/zlZuFZqUZWas1IKXYOefLjBCIhX6ZtVXgEPoKoaQs3OwlQV
 Fh3SFN2oAfgpPlDB6nbc71MUDMaO
X-Google-Smtp-Source: APXvYqwzUgAsEI14CfN8PUv29RbaXxHmllT5vRb7xrbV703XYta0+TzBmsvFLUOBKAYzIAS6V68lpQ==
X-Received: by 2002:a17:902:8d83:: with SMTP id
 v3mr57036433plo.283.1556451933575; 
 Sun, 28 Apr 2019 04:45:33 -0700 (PDT)
Received: from bobo.local0.net ([203.63.161.26])
 by smtp.gmail.com with ESMTPSA id m12sm8154892pff.6.2019.04.28.04.45.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Apr 2019 04:45:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 0/2] powerpc/64s: reimplement book3s idle code in C
Date: Sun, 28 Apr 2019 21:45:13 +1000
Message-Id: <20190428114515.32683-1-npiggin@gmail.com>
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The KVM code is in better shape now, survives various testing I came
up with, so should be ready for more review.

I won't post it again with the KVM part split out unless significant
changes are required there. As explained in the comments for patch 1,
the split results in some intermediate KVM issues, but the split is
supposed to make KVM review easier.

Gautham I left your review tag, quite a lot of KVM changes since he
reviewed it, but non-KVM patch is not much different. Let me know if
I should drop it. 

Thanks,
Nick

Nicholas Piggin (2):
  powerpc/64s: reimplement book3s idle code in C
  powerpc/64s: KVM update for reimplement book3s idle code in C

 arch/powerpc/include/asm/cpuidle.h       |   19 +-
 arch/powerpc/include/asm/paca.h          |   40 +-
 arch/powerpc/include/asm/processor.h     |    9 +-
 arch/powerpc/include/asm/reg.h           |    8 +-
 arch/powerpc/kernel/asm-offsets.c        |   18 -
 arch/powerpc/kernel/exceptions-64s.S     |   23 +-
 arch/powerpc/kernel/idle_book3s.S        | 1099 +++-------------------
 arch/powerpc/kernel/setup-common.c       |    4 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S  |  118 ++-
 arch/powerpc/platforms/powernv/idle.c    |  902 ++++++++++++++----
 arch/powerpc/platforms/powernv/subcore.c |    2 +-
 arch/powerpc/xmon/xmon.c                 |   24 +-
 12 files changed, 1009 insertions(+), 1257 deletions(-)

-- 
2.20.1

