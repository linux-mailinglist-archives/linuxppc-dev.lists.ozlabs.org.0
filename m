Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0E86D0147
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 12:33:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnKWp72rJz3fST
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 21:33:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=agjBVM6h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnKVw54V9z3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 21:32:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=agjBVM6h;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PnKVv1tGzz4xFf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 21:32:39 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PnKVv1pXQz4xDw; Thu, 30 Mar 2023 21:32:39 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=agjBVM6h;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4PnKVv1jDnz4whh;
	Thu, 30 Mar 2023 21:32:38 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso6095809pjf.0;
        Thu, 30 Mar 2023 03:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680172355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lF8w+v1I1As3PcRa2mFbl+1Nj6II4gicPPy/HXfsPUE=;
        b=agjBVM6haHpie21j60SdRYXaMuqusHQ6I0SiDhcGf8GOmptk/rQjZJdRkqp/wDdc1y
         Isp6hWQflYExQE4t87mFCstZ+dk4qjf+cIw7ZGjtk+3Ej5AZLCN+WtpNks/pvVxBgC9Q
         0tX4GjssDMYbRqzu4MAOjI3jpg8o9nXxp3J+bE38x+xr+Zq/ABpLd+ZZoeLBFrmlaA7p
         01SwwdmXUYsJ8ZJZuNxKLWGxmly3H7ZVW1aIJQI1WAjRcTGMxItcJ7YiJFt1L4oqFRYw
         Fx3DYtGh6hUyFKDrJLeLGcXA3+t4CbrM988MG5kHhVLvw6rCtOcBlgL1sT67h3cZcmAV
         YtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680172355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lF8w+v1I1As3PcRa2mFbl+1Nj6II4gicPPy/HXfsPUE=;
        b=tEUrnzY2ptQ8fcCL2sZ6ZcEB18Oirf8G7MqJIVNokDV3iuSRfN6wugjWW6sFAK4cvg
         psIZG51rg3JndTqelpJJPmLsp7KmKuZkJj36w+zhfR72I79lM1px6QOAlbNpGWcJGfeL
         mAFgL4BrSZnOnXOg6NOycHlJ8BaTcQ0OAU8rs2xDp1cJgdRZNu2N4O3in6tb5Fifgw33
         y6rAbhqQ9Msc8Qf91fpxDCJIoxbeOjPSn0jh2eumbkG20L/mZk2RYCTkRxs7I1M7xLHr
         H+n3BJ1yadwMaN0kqLf0rtTO0G+8Sjbz9BXH4P31+6yr/ojcN6IEYsgNDXdQs1yFXDTt
         84hw==
X-Gm-Message-State: AAQBX9fbkmn6NDO2ik9T3MdKTLh57i3YJOSHmUqD4XJV0GKNC1EV3V3q
	qaMGnvN+RGULV5wEYLQC7J7cJqwEVu0=
X-Google-Smtp-Source: AKy350bVPCbrPrrJ8o+kZqey+ilR1iv3/onIOPz19yPsTPV9nu8tgtJn3o74QlkOKNaBVEMQOfE3xQ==
X-Received: by 2002:a17:90b:3b90:b0:23d:500f:e826 with SMTP id pc16-20020a17090b3b9000b0023d500fe826mr24512461pjb.14.1680172354675;
        Thu, 30 Mar 2023 03:32:34 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.177.81])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a08c600b0023440af7aafsm2895219pjn.9.2023.03.30.03.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 03:32:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 0/2] KVM: PPC: Book3S HV: Injected interrupt SRR1
Date: Thu, 30 Mar 2023 20:32:22 +1000
Message-Id: <20230330103224.3589928-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Michael Neuling <mikey@neuling.org>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I missed this in my earlier review and testing, but I think we need
these in the prefix instruction enablement series before the final patch
that enables HFSCR[PREFIX] for guests.

Thanks,
Nick

Nicholas Piggin (2):
  KVM: PPC: Permit SRR1 flags in more injected interrupt types
  KVM: PPC: Book3S HV: Set SRR1[PREFIX] bit on injected interrupts

 arch/powerpc/include/asm/kvm_ppc.h     | 27 ++++++++++++++--------
 arch/powerpc/kvm/book3s.c              | 32 +++++++++++++-------------
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 13 +++++++----
 arch/powerpc/kvm/book3s_hv.c           | 23 ++++++++++++------
 arch/powerpc/kvm/book3s_hv_nested.c    |  9 +++++---
 arch/powerpc/kvm/book3s_pr.c           |  4 ++--
 arch/powerpc/kvm/booke.c               | 13 +++++++----
 arch/powerpc/kvm/emulate_loadstore.c   |  6 ++---
 arch/powerpc/kvm/powerpc.c             |  4 +++-
 9 files changed, 81 insertions(+), 50 deletions(-)

-- 
2.37.2

