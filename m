Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBF1E0E83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 01:26:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yV4q7230zDqJW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 10:26:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yV2R0RFNzDqNp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 10:24:13 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0] (helo=home.buserror.net)
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1iN3TR-0003jP-93; Tue, 22 Oct 2019 18:21:57 -0500
Date: Tue, 22 Oct 2019 18:21:55 -0500
From: Scott Wood <oss@buserror.net>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <20191022232155.GA26174@home.buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 galak@kernel.crashing.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -1.5 GREYLIST_ISWHITE The incoming server has been whitelisted for
 *      this recipient and sender
Subject: Pull request: scottwood/linux.git next
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This contains KASLR support for book3e 32-bit.

The following changes since commit 612ee81b9461475b5a5612c2e8d71559dd3c7920:

  powerpc/papr_scm: Fix an off-by-one check in papr_scm_meta_{get, set} (2019-10-10 20:15:53 +1100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.git next

for you to fetch changes up to 9df1ef3f1376ec5d3a1b51a4546c94279bcd88ca:

  powerpc/fsl_booke/32: Document KASLR implementation (2019-10-21 16:09:16 -0500)

----------------------------------------------------------------
Jason Yan (12):
      powerpc: unify definition of M_IF_NEEDED
      powerpc: move memstart_addr and kernstart_addr to init-common.c
      powerpc: introduce kernstart_virt_addr to store the kernel base
      powerpc/fsl_booke/32: introduce create_kaslr_tlb_entry() helper
      powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper
      powerpc/fsl_booke/32: implement KASLR infrastructure
      powerpc/fsl_booke/32: randomize the kernel image offset
      powerpc/fsl_booke/kaslr: clear the original kernel if randomized
      powerpc/fsl_booke/kaslr: support nokaslr cmdline parameter
      powerpc/fsl_booke/kaslr: dump out kernel offset information on panic
      powerpc/fsl_booke/kaslr: export offset in VMCOREINFO ELF notes
      powerpc/fsl_booke/32: Document KASLR implementation

 Documentation/powerpc/kaslr-booke32.rst       |  42 +++
 arch/powerpc/Kconfig                          |  11 +
 arch/powerpc/include/asm/nohash/mmu-book3e.h  |  11 +-
 arch/powerpc/include/asm/page.h               |   7 +
 arch/powerpc/kernel/early_32.c                |   5 +-
 arch/powerpc/kernel/exceptions-64e.S          |  12 +-
 arch/powerpc/kernel/fsl_booke_entry_mapping.S |  25 +-
 arch/powerpc/kernel/head_fsl_booke.S          |  61 +++-
 arch/powerpc/kernel/machine_kexec.c           |   1 +
 arch/powerpc/kernel/misc_64.S                 |   7 +-
 arch/powerpc/kernel/setup-common.c            |  20 ++
 arch/powerpc/mm/init-common.c                 |   7 +
 arch/powerpc/mm/init_32.c                     |   5 -
 arch/powerpc/mm/init_64.c                     |   5 -
 arch/powerpc/mm/mmu_decl.h                    |  11 +
 arch/powerpc/mm/nohash/Makefile               |   1 +
 arch/powerpc/mm/nohash/fsl_booke.c            |   8 +-
 arch/powerpc/mm/nohash/kaslr_booke.c          | 401 ++++++++++++++++++++++++++
 18 files changed, 587 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/powerpc/kaslr-booke32.rst
 create mode 100644 arch/powerpc/mm/nohash/kaslr_booke.c
