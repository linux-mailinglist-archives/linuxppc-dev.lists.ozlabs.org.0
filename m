Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B58F029A756
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 10:09:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CL5VX0235zDqNm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 20:09:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CL5SQ04rYzDqDX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 20:07:14 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id F3461AE80024;
 Tue, 27 Oct 2020 05:06:27 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH kernel 0/2] irq: Add reference counting to IRQ mappings
Date: Tue, 27 Oct 2020 20:06:53 +1100
Message-Id: <20201027090655.14118-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Herring <robh@kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Qian Cai <cai@lca.pw>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is an attempt to fix a bug with PCI hot unplug with
a bunch of PCIe bridges and devices sharing INTx.

This did not hit us before as even if we did not
call irq_domain_ops::unmap, the platform (PowerVM) would not
produce an error but with POWER9's XIVE interrupt controller
there is an error if unmap is not called at all (2/2 fixes that)
or an error if we unmapped an interrupt which is still in use
by another device (1/2 fixes that).

One way of fixing that is doing reference counting in
the POWERPC code but since there is a kobj in irq_desc
already, I thought I'll give it a try first.


This is based on sha1
4525c8781ec0 Linus Torvalds "scsi: qla2xxx: remove incorrect sparse #ifdef".

Please comment. Thanks.



Alexey Kardashevskiy (1):
  irq: Add reference counting to IRQ mappings

Oliver O'Halloran (1):
  powerpc/pci: Remove LSI mappings on device teardown

 arch/powerpc/kernel/pci-common.c | 21 +++++++++++++++++++
 kernel/irq/irqdesc.c             | 35 +++++++++++++++++++++-----------
 kernel/irq/irqdomain.c           | 27 ++++++++++++------------
 3 files changed, 57 insertions(+), 26 deletions(-)

-- 
2.17.1

