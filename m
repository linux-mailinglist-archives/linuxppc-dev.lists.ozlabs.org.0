Return-Path: <linuxppc-dev+bounces-10081-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7144CAF83A8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 00:42:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYBc01PPFz2xRq;
	Fri,  4 Jul 2025 08:42:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.188.205.243
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751546965;
	cv=none; b=SjG9XPewKF0gFDPpg9eD8XQzNMCsHWJVXuLcagBQPc2PbeuTsW7Q2Gl9d5Vi5nMfzBGa6FKqnIOzHrAA+sG/zRGvODwAwzp7Y9AyhCVkYOQSh7AfVZIyiXataX1aMTXTioCifBCsuBeKcW4yK18tBc0eVGlmUz6PsYbYKSqg0gq3kYNLlkdvTDuSNdeavpio2HxWW4kQBH6Y1mlZAmr57dHG5u27+6cmyVPWobFbLyWelRqxhJmWtmoTcmXzDOfypARw6dIeGmT5S2feHHnZGZ8DyUFL7W8aaBZUopmc3pSjytPD9jKl/1n7gxrs/7MU3/7uTA9wgOOAk+IXKoj7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751546965; c=relaxed/relaxed;
	bh=35didlx/nd6Jatkhda9mievVgfC9CDJ2gKtI1u3wrmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nYERCuKIl9ZN5DhrZpYzLKLNzrtNhBTY3SL+hPXQMkJm6Ghg6ICEvQcCFXVyl11e0w+MIrWgUaYhBALRCilMxAeO3SUybF5n3GvuLpAQM2JnuaG6W98aT5PDqYR1mg2+VUvBerLnEd66ioSC8pPtS7LWX4IvUmMJxytSbQQhYjyARqUjvko3PCyCr1GitbBxowluO/sHJC1F9Bi6W+/1L5PJtDhguATCByEPCo5w7aNEkDcVXWyVYE+fW9cPKznmlAcSBfkwf5NakwUufhgav4ZxprUSyW/J/n4OMn3qxiCqlR5opUzmR7cZdOaKcYVosUWoMHu98Ep1GpamBL5Wfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=astralinux.ru; dkim=pass (2048-bit key; unprotected) header.d=astralinux.ru header.i=@astralinux.ru header.a=rsa-sha256 header.s=mail header.b=05MTyX4I; dkim-atps=neutral; spf=pass (client-ip=93.188.205.243; helo=mail-gw02.astralinux.ru; envelope-from=abelova@astralinux.ru; receiver=lists.ozlabs.org) smtp.mailfrom=astralinux.ru
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=astralinux.ru header.i=@astralinux.ru header.a=rsa-sha256 header.s=mail header.b=05MTyX4I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=astralinux.ru (client-ip=93.188.205.243; helo=mail-gw02.astralinux.ru; envelope-from=abelova@astralinux.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 601 seconds by postgrey-1.37 at boromir; Thu, 03 Jul 2025 22:49:21 AEST
Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru [93.188.205.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXxRP5jpqz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 22:49:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
	s=mail; t=1751546352;
	bh=dnPaUSVSFnBxHAuvBN3ugpTqEkDkWs7TpZEV1h+4drE=;
	h=From:To:Cc:Subject:Date:From;
	b=05MTyX4ITmjSMjBJJ4gpDexb0esJniSCqDHJD837JQ0h6PBDCH36iDwSgrT/ddafZ
	 bp/okzXoVjAhluguf3FRJ7A27UMyv+fDezNQa6l+YMDKfIZgAYAu2kCepJeT2k7eKO
	 u2JJ/V33II2dJkW94CiMrjaB+FRtvUHs5D65M9K0Jm5LW28/vCDm9tuBA0wsIauzS5
	 vZuV+uBlGkqwG0s9BJo02gh5CkaXsGwvbL/tQrDDjcnWWY24GkDZpEZgFh+vFM45uy
	 625C9VzW9jG6lSHp+av4vYzYB9CC9gUMUTd0+ufsdYYh2VYfpCzQiKjfEPzHpD7OX6
	 SfbJcCkgUjWcA==
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id B6CB81FA37;
	Thu,  3 Jul 2025 15:39:12 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.177.185.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Thu,  3 Jul 2025 15:39:10 +0300 (MSK)
Received: from localhost.localdomain (unknown [10.190.6.76])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4bXxBy4vVBz16Hny;
	Thu,  3 Jul 2025 15:38:34 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Sasha Levin <sashal@kernel.org>,
	Gavin Shan <gwshan@linux.vnet.ibm.com>,
	Mauricio Faria de Oliveira <mauricfo@linux.vnet.ibm.com>,
	Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	David Dai <zdai@linux.ibm.com>,
	Sachin Sant <sachinp@linux.ibm.com>
Subject: [PATCH 5.10] powerpc/pseries: Fix use after free in remove_phb_dynamic()
Date: Thu,  3 Jul 2025 15:38:30 +0300
Message-ID: <20250703123831.29005-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.47.0
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
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected, bases: 2025/07/03 11:46:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 63 0.3.63 9cc2b4b18bf16653fda093d2c494e542ac094a39, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;astralinux.ru:7.1.1;new-mail.astralinux.ru:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 194527 [Jul 03 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2025/07/03 05:31:00 #27614197
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/07/03 11:46:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit fe2640bd7a62f1f7c3f55fbda31084085075bc30 ]

In remove_phb_dynamic() we use &phb->io_resource, after we've called
device_unregister(&host_bridge->dev). But the unregister may have freed
phb, because pcibios_free_controller_deferred() is the release function
for the host_bridge.

If there are no outstanding references when we call device_unregister()
then phb will be freed out from under us.

This has gone mainly unnoticed, but with slub_debug and page_poison
enabled it can lead to a crash:

  PID: 7574   TASK: c0000000d492cb80  CPU: 13  COMMAND: "drmgr"
   #0 [c0000000e4f075a0] crash_kexec at c00000000027d7dc
   #1 [c0000000e4f075d0] oops_end at c000000000029608
   #2 [c0000000e4f07650] __bad_page_fault at c0000000000904b4
   #3 [c0000000e4f076c0] do_bad_slb_fault at c00000000009a5a8
   #4 [c0000000e4f076f0] data_access_slb_common_virt at c000000000008b30
   Data SLB Access [380] exception frame:
   R0:  c000000000167250    R1:  c0000000e4f07a00    R2:  c000000002a46100
   R3:  c000000002b39ce8    R4:  00000000000000c0    R5:  00000000000000a9
   R6:  3894674d000000c0    R7:  0000000000000000    R8:  00000000000000ff
   R9:  0000000000000100    R10: 6b6b6b6b6b6b6b6b    R11: 0000000000008000
   R12: c00000000023da80    R13: c0000009ffd38b00    R14: 0000000000000000
   R15: 000000011c87f0f0    R16: 0000000000000006    R17: 0000000000000003
   R18: 0000000000000002    R19: 0000000000000004    R20: 0000000000000005
   R21: 000000011c87ede8    R22: 000000011c87c5a8    R23: 000000011c87d3a0
   R24: 0000000000000000    R25: 0000000000000001    R26: c0000000e4f07cc8
   R27: c00000004d1cc400    R28: c0080000031d00e8    R29: c00000004d23d800
   R30: c00000004d1d2400    R31: c00000004d1d2540
   NIP: c000000000167258    MSR: 8000000000009033    OR3: c000000000e9f474
   CTR: 0000000000000000    LR:  c000000000167250    XER: 0000000020040003
   CCR: 0000000024088420    MQ:  0000000000000000    DAR: 6b6b6b6b6b6b6ba3
   DSISR: c0000000e4f07920     Syscall Result: fffffffffffffff2
   [NIP  : release_resource+56]
   [LR   : release_resource+48]
   #5 [c0000000e4f07a00] release_resource at c000000000167258  (unreliable)
   #6 [c0000000e4f07a30] remove_phb_dynamic at c000000000105648
   #7 [c0000000e4f07ab0] dlpar_remove_slot at c0080000031a09e8 [rpadlpar_io]
   #8 [c0000000e4f07b50] remove_slot_store at c0080000031a0b9c [rpadlpar_io]
   #9 [c0000000e4f07be0] kobj_attr_store at c000000000817d8c
  #10 [c0000000e4f07c00] sysfs_kf_write at c00000000063e504
  #11 [c0000000e4f07c20] kernfs_fop_write_iter at c00000000063d868
  #12 [c0000000e4f07c70] new_sync_write at c00000000054339c
  #13 [c0000000e4f07d10] vfs_write at c000000000546624
  #14 [c0000000e4f07d60] ksys_write at c0000000005469f4
  #15 [c0000000e4f07db0] system_call_exception at c000000000030840
  #16 [c0000000e4f07e10] system_call_vectored_common at c00000000000c168

To avoid it, we can take a reference to the host_bridge->dev until we're
done using phb. Then when we drop the reference the phb will be freed.

Fixes: 2dd9c11b9d4d ("powerpc/pseries: use pci_host_bridge.release_fn() to kfree(phb)")
Reported-by: David Dai <zdai@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Tested-by: Sachin Sant <sachinp@linux.ibm.com>
Link: https://lore.kernel.org/r/20220318034219.1188008-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
Backport fix for CVE-2022-49196
 arch/powerpc/platforms/pseries/pci_dlpar.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
index a8f9140a24fa..325871d6f5b0 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -74,6 +74,9 @@ int remove_phb_dynamic(struct pci_controller *phb)
 		}
 	}
 
+	/* Keep a reference so phb isn't freed yet */
+	get_device(&host_bridge->dev);
+
 	/* Remove the PCI bus and unregister the bridge device from sysfs */
 	phb->bus = NULL;
 	pci_remove_bus(b);
@@ -97,6 +100,7 @@ int remove_phb_dynamic(struct pci_controller *phb)
 	 * the pcibios_free_controller_deferred() callback;
 	 * see pseries_root_bridge_prepare().
 	 */
+	put_device(&host_bridge->dev);
 
 	return 0;
 }
-- 
2.43.0


