Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 273338A7D86
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 09:58:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hIBOImKL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKCvg6N4Fz3vZN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 17:58:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hIBOImKL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 17 Apr 2024 16:17:54 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VK9gk06Nsz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 16:17:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713334674; x=1744870674;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zup4kVprGE6/Db88WKTYbbdgKIeTY5tkXinpBoc56No=;
  b=hIBOImKLftOrQQIADcKpStUkaLzxj5dEz0djWrR2nGCrRe2c8tblbXs0
   maGBtxRA19E11sh3YB4FtkDRN8vyZnJocwVDMCWri4DSqgzqkSF7TfJXg
   9m9Hex4F2Bqzg52mpmNSr05IGuLRarBFRDFSAL+OYuMPCK+AsvSKZvB7s
   HJyczRUDraurWFtsK+2gpSedvjZTorTtOYlhYDdTHggnqjP6Q+sreHvob
   ymOFHHHn00Hh/Re6rSVxSGLPQYhCQ+3y9M0gIdil9lppN8f4p7DkYxIUC
   VYANOnpXubpTAn4L3w0sX0GxS68xJl8vo6DVaRfAFyeN5alb1/f8LVcr3
   Q==;
X-CSE-ConnectionGUID: cZb4w9KrQueZECkjMwW1WA==
X-CSE-MsgGUID: mrpxj4yLTyK3EYtPQc6n/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="11750766"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="11750766"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 23:16:44 -0700
X-CSE-ConnectionGUID: NsDJERb6RGuQWGQC9axYPw==
X-CSE-MsgGUID: EEds5zuzTOCMVFxKwv0MeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="23108988"
Received: from unknown (HELO SPR-S2600BT.bj.intel.com) ([10.240.192.124])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 23:16:35 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 0/3] PCI/AER: Handle Advisory Non-Fatal error
Date: Wed, 17 Apr 2024 14:14:04 +0800
Message-Id: <20240417061407.1491361-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Apr 2024 17:57:48 +1000
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
Cc: linmiaohe@huawei.com, alison.schofield@intel.com, rafael@kernel.org, sathyanarayanan.kuppuswamy@intel.com, erwin.tsaur@intel.com, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com, ira.weiny@intel.com, dave@stgolabs.net, dave.jiang@intel.com, vishal.l.verma@intel.com, Smita.KoralahalliChannabasappa@amd.com, helgaas@kernel.org, lenb@kernel.org, chao.p.peng@intel.com, rrichter@amd.com, yudong.wang@intel.com, bp@alien8.de, qingshun.wang@linux.intel.com, jonathan.cameron@huawei.com, bhelgaas@google.com, dan.j.williams@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>, linux-edac@vger.kernel.org, tony.luck@intel.com, feiting.wanyan@intel.com, adam.c.preble@intel.com, mahesh@linux.ibm.com, leoyang.li@nxp.com, lukas@wunner.de, james.morse@arm.com, shiju.jose@huawei.com
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
     [18] TLP

Note:
checkpatch.pl will produce following warnings on PATCH2/3:

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

v1: https://lore.kernel.org/linux-pci/20240111073227.31488-1-qingshun.wang@linux.intel.com/


Zhenzhong Duan (3):
  PCI/AER: Store UNCOR_STATUS bits that might be ANFE in aer_err_info
  PCI/AER: Print UNCOR_STATUS bits that might be ANFE
  PCI/AER: Clear UNCOR_STATUS bits that might be ANFE

 drivers/pci/pci.h      |  1 +
 drivers/pci/pcie/aer.c | 67 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 1 deletion(-)

-- 
2.34.1

