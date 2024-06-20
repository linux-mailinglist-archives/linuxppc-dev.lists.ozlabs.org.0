Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A16590FB7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 05:02:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z+TWoSG/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4QJp0HNxz30Vb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 13:02:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z+TWoSG/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4QJ44Jqvz30V2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 13:01:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718852518; x=1750388518;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EIVXR1Drz5ZwlD3T4VwTfooVVhT2SxMV7lr93B1iMIg=;
  b=Z+TWoSG/ZMSgWXZr85UtV+rPRi/AhJXdMLSB/TeeUuoGOfMf3qgBRD0T
   KPPbX4lGJjI7gbWL8VzLpalPMO0U9XfCZeo/51YqNRwsK/UFyEf7UCFXw
   LBMovRdSInAsJBtUXJpNE3z4lHnfsZKBhIu6ynKs2f9VVn0PhxG5mmvda
   L16S8p033PTZrCU0z+j+FzIkhZprfLX22tQPcuY8116MpslYy6bcmUguG
   1tP2pSlsETG8MoDAV30GaSeDzRI3ngqZfzV4pfGHX57C3v61b7t79NL1n
   IgddjVd6LJ+anIVww6ZB4dykekpsGG/afl1B2dF5lBB2McrKgxdkju+5v
   w==;
X-CSE-ConnectionGUID: 5OI8XZQJTGSwL/rGjtHUJA==
X-CSE-MsgGUID: MYu612O5RaW8dKy6Z5BpZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26444193"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="26444193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 20:01:52 -0700
X-CSE-ConnectionGUID: GsV7gGC6RDm/wd79OQ/n6A==
X-CSE-MsgGUID: I3E8fsj0QnmEqr/RNB1usw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42049389"
Received: from unknown (HELO SPR-S2600BT.bj.intel.com) ([10.240.192.127])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 20:01:45 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: linux-pci@vger.kernel.org
Subject: [PATCH v5 0/2] PCI/AER: Handle Advisory Non-Fatal error
Date: Thu, 20 Jun 2024 10:58:55 +0800
Message-Id: <20240620025857.206647-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linmiaohe@huawei.com, alison.schofield@intel.com, rafael@kernel.org, sathyanarayanan.kuppuswamy@intel.com, erwin.tsaur@intel.com, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com, ira.weiny@intel.com, dave@stgolabs.net, dave.jiang@intel.com, vishal.l.verma@intel.com, Smita.KoralahalliChannabasappa@amd.com, linux-acpi@vger.kernel.org, helgaas@kernel.org, lenb@kernel.org, chao.p.peng@intel.com, rrichter@amd.com, yudong.wang@intel.com, bp@alien8.de, qingshun.wang@linux.intel.com, jonathan.cameron@huawei.com, bhelgaas@google.com, dan.j.williams@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>, linux-edac@vger.kernel.org, tony.luck@intel.com, feiting.wanyan@intel.com, adam.c.preble@intel.com, mahesh@linux.ibm.com, lukas@wunner.de, james.morse@arm.com, linuxppc-dev@lists.ozlabs.org, shiju.jose@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This is a relay work of Qingshun's v2 [1], but changed to focus on ANFE
processing as subject suggests and drops trace-event for now. I think it's
a bit heavy to do extra IOes to get PCIe registers only for trace purpose
and not see it a community request for now.

According to PCIe Base Specification Revision 6.1, Sections 6.2.3.2.4 and
6.2.4.3, certain uncorrectable errors will signal ERR_COR instead of
ERR_NONFATAL, logged as Advisory Non-Fatal Error(ANFE), and set bits in
both Correctable Error(CE) Status register and Uncorrectable Error(UE)
Status register. Currently, when handling AER events the kernel will only
look at CE status or UE status, but never both. In the ANFE case, bits set
in the UE status register will not be reported and cleared until the next
FE/NFE arrives.

For instance, previously, when the kernel receives an ANFE with Poisoned
TLP in OS native AER mode, only the status of CE will be reported and
cleared:

  AER: Correctable error message received from 0000:b7:02.0
  PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00002000/00000000
     [13] NonFatalErr

If the kernel receives a Malformed TLP after that, two UEs will be
reported, which is unexpected. The Malformed TLP Header is lost since
the previous ANFE gated the TLP header logs:

  PCIe Bus Error: severity="Uncorrectable (Fatal), type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00041000/00180020
     [12] TLP                    (First)
     [18] MalfTLP

To handle this case properly, calculate potential ANFE related status bits
and save in aer_err_info. Use this information to determine the status bits
that need to be cleared.

Now, for the previous scenario, both CE status and related UE status will
be reported and cleared after ANFE:

  AER: Correctable error message received from 0000:b7:02.0
  PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00002000/00000000
     [13] NonFatalErr
    Uncorrectable errors that may cause Advisory Non-Fatal:
     [12] TLP

Note:
checkpatch.pl will produce following warnings on PATCH1&2:

WARNING: 'UE' may be misspelled - perhaps 'USE'?
#22:
uncorrectable error(UE) status should be cleared. However, there is no

...similar warnings omitted...

This is a false-positive, so not fixed.

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10:
  PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)

...similar warnings omitted...

For readability reasons, these warnings are not fixed.



[1] https://lore.kernel.org/linux-pci/20240125062802.50819-1-qingshun.wang@linux.intel.com

Thanks
Qingshun, Zhenzhong

Changelog:
v5:
 - squash patch 1 and 3 (Kuppuswamy)
 - add comment about avoiding race and fix typo error (Kuppuswamy)
 - collect Jonathan and Kuppuswamy's R-b

v4:
  - Fix a race in anfe_get_uc_status() (Jonathan)
  - Add a comment to explain side effect of processing ANFE as NFE (Jonathan)
  - Drop the check for PCI_EXP_DEVSTA_NFED

v3:
  - Split ANFE print and processing to two patches (Bjorn)
  - Simplify ANFE handling, drop trace event
  - Polish comments and patch description
  - Add Tested-by

v2:
  - Reference to the latest PCIe Specification in both commit messages
    and comments, as suggested by Bjorn Helgaas.
  - Describe the reason for storing additional information in
    aer_err_info in the commit message of PATCH 1, as suggested by Bjorn
    Helgaas.
  - Add more details of behavior changes in the commit message of PATCH
    2, as suggested by Bjorn Helgaas.

v4: https://lkml.org/lkml/2024/5/9/247
v3: https://lore.kernel.org/lkml/20240417061407.1491361-1-zhenzhong.duan@intel.com
v2: https://lore.kernel.org/linux-pci/20240125062802.50819-1-qingshun.wang@linux.intel.com
v1: https://lore.kernel.org/linux-pci/20240111073227.31488-1-qingshun.wang@linux.intel.com


Zhenzhong Duan (2):
  PCI/AER: Clear UNCOR_STATUS bits that might be ANFE
  PCI/AER: Print UNCOR_STATUS bits that might be ANFE

 drivers/pci/pci.h      |  1 +
 drivers/pci/pcie/aer.c | 79 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 79 insertions(+), 1 deletion(-)

-- 
2.34.1

