Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A135FF8AE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2019 10:49:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47G6jk3RXbzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2019 20:48:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47G6gq1kHpzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 20:47:17 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0] (helo=home.buserror.net)
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1iWH76-0004qK-QQ; Sun, 17 Nov 2019 03:45:01 -0600
Date: Sun, 17 Nov 2019 03:44:58 -0600
From: Scott Wood <oss@buserror.net>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <20191117094458.GA23095@home.buserror.net>
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

Includes a couple of device tree fixes, a spelling fix, and leftover
code cleanup.

The following changes since commit 565f9bc05e2dad6c7fdfc7c2e641be580aa599cd:

  powerpc/fadump: when fadump is supported register the fadump sysfs files. (2019-11-13 16:58:11 +1100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.git next

for you to fetch changes up to a76bea0287ce13d28494b19649d80d8ee5e7b757:

  powerpc/kmcent2: add ranges to the pci bridges (2019-11-17 02:01:02 -0600)

----------------------------------------------------------------
Geert Uytterhoeven (1):
      powerpc/booke: Spelling s/date/data/

Rasmus Villemoes (1):
      powerpc/85xx: remove mostly pointless mpc85xx_qe_init()

Valentin Longchamp (2):
      powerpc/kmcent2: update the ethernet devices' phy properties
      powerpc/kmcent2: add ranges to the pci bridges

 arch/powerpc/boot/dts/fsl/kmcent2.dts         | 52 ++++++++++++++++++++++++---
 arch/powerpc/kernel/cpu_setup_fsl_booke.S     |  2 +-
 arch/powerpc/platforms/85xx/common.c          | 23 ------------
 arch/powerpc/platforms/85xx/corenet_generic.c |  2 --
 arch/powerpc/platforms/85xx/mpc85xx.h         |  2 --
 arch/powerpc/platforms/85xx/mpc85xx_mds.c     |  1 -
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  1 -
 arch/powerpc/platforms/85xx/twr_p102x.c       |  1 -
 8 files changed, 48 insertions(+), 36 deletions(-)
