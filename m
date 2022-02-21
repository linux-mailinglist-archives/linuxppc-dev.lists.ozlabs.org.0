Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2064BD6C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 08:24:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2DMX3p0vz3cW1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 18:24:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SffK+/sd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SffK+/sd; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2DLs1NLCz30Dy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 18:24:02 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 gf13-20020a17090ac7cd00b001bbfb9d760eso4478989pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 23:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1odCIx/CXA3P32WbN/DjSZJB7XyjeObKEl8BogjOxs=;
 b=SffK+/sdzL8xDAL+9U9TazFlv9UuCXsAFYI/rWSiZJE8K5wkgG8vMRfYnl/93gaySr
 zcl9Vb6iJcItPITIiPs+0BoSpA83ioJyZBh2z6kXpkb4NrOd75suaq0fTPmtMmiOZzx8
 I6EHVAuGO+l6L2OPl4t3hCUYV1YVqCKCFQIvB4ASzG6RqN/RrYbEF6jlAUVbmatdfdmX
 2+J29C8Bp2gMIZGRiirZL/1Q5EaTxYQGvXjzQOzbVR+yGpZUexYgfIjbHoHOX3wv02h4
 QFzgT61+KDyK2c9Dd/Jl5P9ode4cOeIHNoXhdoFNHqR++QOtwCgs8RC4/JO8E0CPGLPb
 fZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1odCIx/CXA3P32WbN/DjSZJB7XyjeObKEl8BogjOxs=;
 b=hiOfZB8EUnpqRZxYEfY1gvVjOmJOTwR5gZI8UuZtIDqSQb0bTG9sdhEOauTI2l5hUg
 s1FV8nmSf377+0xU1qIFZl1mmY7FdT1AVciAoCR2ILpxO541grYEqWt5PwwwL6ukFOLH
 d8Ccnz/CJONkc03MaXyp1pGanz1kXiKADrBB0I2BlsKkZqrkJd55prESHtQKiNGKoH2l
 ZMFaX2R8o++/5Cu9aNYTm7WbOi788EicsuLTWRr3+ZIi9cC5HP5W8wE3jrbjJv+G2cYV
 DV8uagjQ2+0v0076Ejs2E0Sp2OVZMOQxV34qpVz7MD7yIHChF5GqZS3bnuR7YUSyoTIj
 wJog==
X-Gm-Message-State: AOAM531yda1KzCm8g6YiDf3AGCd2FgD+APt1S7+Ayy794oYpR+ECdx7k
 7yh2rc2757PTwWD54UFLiy38wsjC/+I=
X-Google-Smtp-Source: ABdhPJyawax3yZ1gFznElPN0DIdHF9YZMNdPBVepuAIwsEhNMDG9UIbE+lpDdQ4P7ol577gqt3hO0g==
X-Received: by 2002:a17:902:ed93:b0:14f:c84d:2448 with SMTP id
 e19-20020a170902ed9300b0014fc84d2448mr1590271plj.64.1645428240422; 
 Sun, 20 Feb 2022 23:24:00 -0800 (PST)
Received: from bobo.ibm.com (193-116-225-41.tpgi.com.au. [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id me14sm6825901pjb.41.2022.02.20.23.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:24:00 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/3] KVM: PPC: Book3S PR: Fixes for AIL and SCV
Date: Mon, 21 Feb 2022 17:23:50 +1000
Message-Id: <20220221072353.2219034-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The first patch in this series fixes a KVM PR host crash due to a
guest executing the scv instruction or with a pseries SMP host, the
host CPUs executing the scv instruction while a PR guest is running.

The second patch fixes unimplemented H_SET_MODE AIL modes by returning
failure from the hcall rather than succeeding but not implementing
the required behaviour. This works around missing host scv support for
scv-capable Linux guests by causing them to disable the facility.

The third patch adds a new KVM CAP to go with some QEMU work to get
the AIL differences properly represented in QEMU. The third patch will
need to allocate a KVM CAP number and merged with upstream KVM tree
before the QEMU side goes ahead.

Changes since v2:
- Fix fscr compile error in patch 1.
- Add patch 3.

Thanks,
Nick

Nicholas Piggin (3):
  KVM: PPC: Book3S PR: Disable SCV when AIL could be disabled
  KVM: PPC: Book3S PR: Disallow AIL != 0
  KVM: PPC: Add KVM_CAP_PPC_AIL_MODE_3

 Documentation/virt/kvm/api.rst         | 14 +++++++++++++
 arch/powerpc/include/asm/setup.h       |  2 ++
 arch/powerpc/kernel/exceptions-64s.S   |  4 ++++
 arch/powerpc/kernel/setup_64.c         | 28 ++++++++++++++++++++++++++
 arch/powerpc/kvm/Kconfig               |  9 +++++++++
 arch/powerpc/kvm/book3s_pr.c           | 26 +++++++++++++++---------
 arch/powerpc/kvm/book3s_pr_papr.c      | 20 ++++++++++++++++++
 arch/powerpc/kvm/powerpc.c             | 20 ++++++++++++++++++
 arch/powerpc/platforms/pseries/setup.c | 12 ++++++++++-
 include/uapi/linux/kvm.h               |  1 +
 tools/include/uapi/linux/kvm.h         |  1 +
 11 files changed, 127 insertions(+), 10 deletions(-)

-- 
2.23.0

