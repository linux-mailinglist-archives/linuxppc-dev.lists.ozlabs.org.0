Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE624BF238
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 07:48:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2qWl0xgzz3cXY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 17:48:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZN3bOczt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZN3bOczt; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2qVP22n8z3002
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 17:47:39 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id y5so11007045pfe.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 22:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y49qeHSLbsysRmrFWFJDrfEyQJx8/GQPaFEvbP+Ukrw=;
 b=ZN3bOcztuVRMyT6u3TFaoftMURDWMOScA8rb8F8dxdpu8aj/CKpHIZ/1SWUh+HMCEv
 eJyWuQ2idrqFcvz9OidKyPV+PL0LEOslBphDAW6c/QLqED1EAKHp+EzxKjUsiHsyCUo5
 t9o0WOS4MfeCrdc+1qbiOeF20S4GOnx0kHcS7VwtV0+DZcxM+zwbZUodAjOLEFNhLBDN
 50D7TaU914L+0e7VXr8mNSrpUXiymy8n2fWxmsONGPBn9MgwiF/ueqfqDpq2KrjaIyz/
 sMPcZ73zPoqWg5/pet4M5DU1PFkB0thG3I55rofzAfjYGNrXxej090YC6CxYYI1dhqtP
 FVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y49qeHSLbsysRmrFWFJDrfEyQJx8/GQPaFEvbP+Ukrw=;
 b=Wge5QmuJIcvjJwLS+4VgR35rExrcmfyQSMpPFj8H37SzGoFLXLyXVqVvA+ichWG3KQ
 oUbnI0wh5bYmibbkVXBxzjDqkWZbPUDPRiXwgTtivsv4ZJcaYPKIKiiE+0KzWyuS+/jo
 luNakmXfAggi6fpFq4IoS8ROps1ffpSRsdmLbyG+jdnmohVUJpOQ1kIU0IlNUZ1njRTI
 CyvQOsYiV3M9CfjiYYcA3s5Bi2Xsqg7kklXtq8+pjeEGGNf59vq8WUFlHou1sTFKltr0
 hXvy50Vpm/0N4kO3vwSa3tZ7hvYYKKpzQhOTU+7rgdInslevq39svenHox6JQleLInxX
 uIsg==
X-Gm-Message-State: AOAM532ylwvStPc8zzW+SlVahjEcMB+kRDThK0gX2sHQo198jJHJPnjw
 4WlUEDrWmAhhOM+dDmkPTw8YPQUFcfY=
X-Google-Smtp-Source: ABdhPJwQWl8rMbXMOAO253k7mJBge7rkMz0FhtnaM+7AnNTJBEQuTwK5wvhHoJgc9u+Qvg3skV8gtw==
X-Received: by 2002:a05:6a00:1687:b0:4e1:45d:3ded with SMTP id
 k7-20020a056a00168700b004e1045d3dedmr23286018pfc.0.1645512456816; 
 Mon, 21 Feb 2022 22:47:36 -0800 (PST)
Received: from bobo.ibm.com (193-116-225-41.tpgi.com.au. [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id d8sm16346711pfv.84.2022.02.21.22.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 22:47:36 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/3] KVM: PPC: Book3S PR: Fixes for AIL and SCV
Date: Tue, 22 Feb 2022 16:47:24 +1000
Message-Id: <20220222064727.2314380-1-npiggin@gmail.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paolo,

Patch 3 requires a KVM_CAP_PPC number allocated. QEMU maintainers are
happy with it (link in changelog) just waiting on KVM upstreaming. Do
you have objections to the series going to ppc/kvm tree first, or
another option is you could take patch 3 alone first (it's relatively
independent of the other 2) and ppc/kvm gets it from you?

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

Changes since v3:
- Rebased, cc kvm@

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
 arch/powerpc/kvm/powerpc.c             | 17 ++++++++++++++++
 arch/powerpc/platforms/pseries/setup.c | 12 ++++++++++-
 include/uapi/linux/kvm.h               |  1 +
 tools/include/uapi/linux/kvm.h         |  1 +
 11 files changed, 124 insertions(+), 10 deletions(-)

-- 
2.23.0

