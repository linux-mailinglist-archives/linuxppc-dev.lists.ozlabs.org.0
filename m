Return-Path: <linuxppc-dev+bounces-17894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIppK2G/rmlEIgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 13:38:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEAC238F6A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 13:38:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTxQP5gYMz3bnm;
	Mon, 09 Mar 2026 23:38:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773059933;
	cv=none; b=KPCaliOmvKdHSytyzz5EuSK0n/X2WJz21GQYEnXaVBHC9d7FU1UhOXh1AC/64liPrxwNaqVnJTtbeHe6bPlawJMdVWDQ3rkblNe4TiDyetBhXnMtLaYgtn6CwQs2sTynjUhT2mqcKoF24tzlAjeX6p1B/CGSZ3ovoL7yMJrW4VImV1o/TGCXf2GmDP9DKwBw+t5tc8iwtAfNUIHvL9AN5QG1rmGwCZG/H+bv0JFDjCvTTqIl3H4xCN1uuCqIGS7eSIGC7H6WbCAXWZIRzg9MGwA8FwVwTg6ZNAt08LZlkddq4ySGxxjhyDw5eKHNijwrrWqCd9JXyS4k2X+040EMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773059933; c=relaxed/relaxed;
	bh=Vew/51ISuWV8SVa/aQVcC7dheArZhsg+HjWKeDYSuPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=STDw2afin8NjLdCIwuI7O0CGY/znw+BnlgSarW83LtXifdQIDw0Jn4o7N5VnICQVHYQoacyhrfyq+tAIpvYeDq4eFcNtxUG6RKpVIyfXyhCx/aNmcF3RscH96NtnfdLNMiy0ZtDGC4IToJbmx717HJJgYAScuuhA8ZPAF+kK9VH6YipaYNkGpSV0KuK1OsN418sRxeCA5YYo5OdMtG5iqIFeWhsvTJ65W5q2ZGqTypTOZTHa/z5E3I3TDS/xwkAAo6Txq0vYWvJPFYIPGBDZgGkBty12kdVtuAJO79hPZOeXD2M0Tp6na70foROanUHPAbn34PRFqC+RMEECueM0wQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nNX84aS6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nNX84aS6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTxQN4kS3z2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 23:38:51 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ae4e538abdso78198455ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 05:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773059929; x=1773664729; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vew/51ISuWV8SVa/aQVcC7dheArZhsg+HjWKeDYSuPQ=;
        b=nNX84aS665qw89aePRxQINrXM39dmA8hATos2K5kL+0dTJ7xO2Z+IyclQM6OketbEu
         zOvzA7+b1mmwDb0KaBXItnyXd8MsFpFiMu90tLDxRV+DVLFpMDB1p8zR+5ldYtj6ebgz
         NgDvTPI+IQmCt9q+BQZ+Y6pfu6HUdI089A3NqiJlvTtlrzsWUrzXgg1X2E9B0BJi81aj
         kcMi4dy+9dxsNaId3bDc6GakgVBYKbA9h9Ij9nc2y/q+YK+KcP+xaLj29C9XjuLx5vYe
         Fpahe/ELJ5rre4X9+4xRWeQwccAIdXXa8DMWILCKPXzPWK/AxsM9HxEk+U8Xqnkp1KfO
         988w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773059929; x=1773664729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vew/51ISuWV8SVa/aQVcC7dheArZhsg+HjWKeDYSuPQ=;
        b=FIj4icqORIIKJIQmNXJj8X+Rl9RWU558YPBm4SiUc4tWtB0sfnj7GNONoZD61u0/E0
         YtYHjG16DLwM42tWhRlDW3AiiGuvH1c8cyWllw4RbwjUE2IfBuo1y/t0Uw2hn7zF5a1a
         ROAJU8P5lIuXwrLYJSM2Ots4+n6EtTt7m2qmXV5q3FLNDJO+P+ca0LWcGgoik6iQHELW
         ot1pI3rYFIaGjIJCGUIDUEQOSZDq2s5XZDDrpn/04mTbchxHCkZ4RapI2AbqRTy67lFW
         qoWiKLSH7amHG63fXD3CuwyEjX0qFPkYpkBXOWH9CW89MOL/NDZFP/2Rn8t/cJL+wz/y
         FXkg==
X-Gm-Message-State: AOJu0Yz0Z/92OcN9pB8aALnWRYQKMdlpgtjJDz60zJkcVU7Es1qn0U6e
	evLTGev/WCtEBXydiY36n/7Wc8iWojV5l7PHImLLHjmMXVZnp3kB9/EE780BAnQw
X-Gm-Gg: ATEYQzxwwy6tFz10QMx0rBAKThNH+v+gqXdCaYEtUS1s+0vjm9UwpvjL8G2wACPk+BZ
	h9BcltGPBKkzYMlhJ259OpsmmEsz1yAs8J5UXvNce+hbXmrVpvZq8loTjQUNpj/PW3OB3bgrPxv
	uO9hBifNelrYkW2PU6IyMrXPkiZxG6EBsnObVhh8YPQsQ/X+lU2g2Up8sj5O2KHJgVwi7Yrlgt7
	pWf4feG8zqaNLLrL2VCAVbZCyZ2NyoemcONGpEpbcHUUm9bZrJhADIrOWSeASahs9B9ZOxzlRVs
	ENRYgeaUEzDz9OAEgNCogffbTcy5fAsdKMLI2RYmZF6yn1zk89V3M4TCRZjisMHkgctCqzi1quW
	2VDeV0vX7SkTccqdsIb9vwDwPUiDw1qQFDYkJN76LvP1GJ9nWVCMw5bnu+zKB6xKcMceoOSJYCT
	wDFzlUdKqEVJypHix5aRRdzZTeTHyeswB+bi6YTMg=
X-Received: by 2002:a17:903:388f:b0:2ae:50a3:3aa5 with SMTP id d9443c01a7336-2ae824879a7mr107552435ad.52.1773059928817;
        Mon, 09 Mar 2026 05:38:48 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83eafc64sm154867375ad.40.2026.03.09.05.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:38:48 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	Alex Williamson <alex@shazbot.org>,
	Peter Xu <peterx@redhat.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 1/2] drivers/vfio_pci_core: Change PXD_ORDER check from switch case to if/else block
Date: Mon,  9 Mar 2026 18:08:37 +0530
Message-Id: <b155e19993ee1f5584c72050192eb468b31c5029.1773058761.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 9CEAC238F6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17894-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,kvack.org,vger.kernel.org,shazbot.org,redhat.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Architectures like PowerPC uses runtime defined values for
PMD_ORDER/PUD_ORDER. This is because it can use either RADIX or HASH MMU
at runtime using kernel cmdline. So the pXd_index_size is not known at
compile time. Without this fix, when we add huge pfn support on powerpc
in the next patch, vfio_pci_core driver compilation can fail with the
following errors.

  CC [M]  drivers/vfio/vfio_main.o
  CC [M]  drivers/vfio/group.o
  CC [M]  drivers/vfio/container.o
  CC [M]  drivers/vfio/virqfd.o
  CC [M]  drivers/vfio/vfio_iommu_spapr_tce.o
  CC [M]  drivers/vfio/pci/vfio_pci_core.o
  CC [M]  drivers/vfio/pci/vfio_pci_intrs.o
  CC [M]  drivers/vfio/pci/vfio_pci_rdwr.o
  CC [M]  drivers/vfio/pci/vfio_pci_config.o
  CC [M]  drivers/vfio/pci/vfio_pci.o
  AR      kernel/built-in.a
../drivers/vfio/pci/vfio_pci_core.c: In function ‘vfio_pci_vmf_insert_pfn’:
../drivers/vfio/pci/vfio_pci_core.c:1678:9: error: case label does not reduce to an integer constant
 1678 |         case PMD_ORDER:
      |         ^~~~
../drivers/vfio/pci/vfio_pci_core.c:1682:9: error: case label does not reduce to an integer constant
 1682 |         case PUD_ORDER:
      |         ^~~~
make[6]: *** [../scripts/Makefile.build:289: drivers/vfio/pci/vfio_pci_core.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:546: drivers/vfio/pci] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:546: drivers/vfio] Error 2
make[3]: *** [../scripts/Makefile.build:546: drivers] Error 2

Fixes: f9e54c3a2f5b7 ("vfio/pci: implement huge_fault support")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
v1 -> v2:
1. addressed review comments from Christophe [1]
[1]: https://lore.kernel.org/linuxppc-dev/0b8fce7a61561640634317a5e287cdb4794715fd.1772170860.git.ritesh.list@gmail.com/

 drivers/vfio/pci/vfio_pci_core.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index d43745fe4c84..0967307235b8 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1670,21 +1670,16 @@ vm_fault_t vfio_pci_vmf_insert_pfn(struct vfio_pci_core_device *vdev,
 	if (vdev->pm_runtime_engaged || !__vfio_pci_memory_enabled(vdev))
 		return VM_FAULT_SIGBUS;

-	switch (order) {
-	case 0:
+	if (!order)
 		return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
-#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
-	case PMD_ORDER:
+
+	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && order == PMD_ORDER)
 		return vmf_insert_pfn_pmd(vmf, pfn, false);
-#endif
-#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
-	case PUD_ORDER:
+
+	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP) && order == PUD_ORDER)
 		return vmf_insert_pfn_pud(vmf, pfn, false);
-		break;
-#endif
-	default:
-		return VM_FAULT_FALLBACK;
-	}
+
+	return VM_FAULT_FALLBACK;
 }
 EXPORT_SYMBOL_GPL(vfio_pci_vmf_insert_pfn);

--
2.39.5


