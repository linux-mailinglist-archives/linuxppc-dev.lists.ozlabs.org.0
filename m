Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3B31FD366
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 19:26:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nBn45Q54zDr27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 03:26:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.182.191; helo=13.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1800 seconds by postgrey-1.36 at bilbo;
 Thu, 18 Jun 2020 03:24:45 AEST
Received: from 13.mo5.mail-out.ovh.net (13.mo5.mail-out.ovh.net
 [87.98.182.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nBlK2mrxzDqfv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 03:24:44 +1000 (AEST)
Received: from player760.ha.ovh.net (unknown [10.110.103.2])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id E41E8284426
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 18:29:47 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 21276137CC62C;
 Wed, 17 Jun 2020 16:29:40 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0039d04b443-25d1-4dfe-86ed-d92922e30e60,ABECD89738EEB0C75E5395B338997A57DB3A3EEE)
 smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 0/2] powerpc/pci: unmap interrupts when a PHB is removed
Date: Wed, 17 Jun 2020 18:29:36 +0200
Message-Id: <20200617162938.743439-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4970566615983295409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieekkeelffetgeelveevjeehteduvdeivdeljeevvdeuvedtgfeiudeiveeiudfgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeitddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

When a passthrough IO adapter is removed from a pseries machine using
hash MMU and the XIVE interrupt mode, the POWER hypervisor expects the
guest OS to clear all page table entries related to the adapter. If
some are still present, the RTAS call which isolates the PCI slot
returns error 9001 "valid outstanding translations" and the removal of
the IO adapter fails. This is because when the PHBs are scanned, Linux
maps automatically some interrupts in the Linux interrupt number space
but these are never removed.

To solve this problem, we introduce a PPC platform specific
pcibios_remove_bus() routine which clears all interrupt mappings when
the bus is removed. This also clears the associated page table entries
of the ESB pages when using XIVE.

For this purpose, we record the logical interrupt numbers of the
mapped interrupt under the PHB structure and let pcibios_remove_bus()
do the clean up.

Tested on :

  - PowerNV with PCI, OpenCAPI, CAPI and GPU adapters. I don't know
    how to inject a failure on a PHB but that would be a good test.
  - KVM P8+P9 guests with passthrough PCI adapters, but PHBs can not
    be removed under QEMU/KVM.   
  - PowerVM with passthrough PCI adapters (main target)
  
Thanks,

C.

Changes since v1:

 - extended the removal to interrupts other than the legacy INTx.

Cédric Le Goater (2):
  powerpc/pci: unmap legacy INTx interrupts when a PHB is removed
  powerpc/pci: unmap all interrupts when a PHB is removed

 arch/powerpc/include/asm/pci-bridge.h |   6 ++
 arch/powerpc/kernel/pci-common.c      | 114 ++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

-- 
2.25.4

