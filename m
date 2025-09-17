Return-Path: <linuxppc-dev+bounces-12356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EADB82171
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 00:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRt6j6Y5yz2xlR;
	Thu, 18 Sep 2025 08:02:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758146557;
	cv=none; b=nKqdnMheP0Jp9R4E7w+86qgjvgfufPWEzDpH/NZ/Su/uWUKwHyKnuYGRw1T7B2cxfjnUlTkWw/syB075bH91iVA+TZorbeT3ftCHAX5Xn8f1Xj1SfijwvHAa/F3e8kPyj13+R8lMfVNWS0RlxyOJ4LmCKyFehKgATyBvKYFYdBmiu7ezrt18FHgoebAOvuhKZIVM//0sYK9hxLVADsr1bBjPNOc3gF7U0WAqUi5+PScD2Dxr6NRtNzcGZUBcpLCjr0vIx4hGfb28Fj+oX1b3QswtWxkkYEkX0Pk7OYMREWix8VCHYFHOju8ypF00wAj7hZKECPDj40TLZP/lowoAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758146557; c=relaxed/relaxed;
	bh=h9VtKpfF0mObpUwQj6ACMkui/4N554FNYxBuIjlY+tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmgDNX1hUMD4ly7vG8i4wplBWd/o1furaNMRprSc74Rvk29VqMfzKTiu9CCGlOPe+jjKenpS+6YIJYg7MAs9KZxZRguPQWdQZfTeVr5hKMs1I3KFd2H6YI9MU1puyOB+8cdtlocAxrDdTRsIRj7gpDbFbd01SxM3aCj2R793NYEGRVGuKneSpgEiRWr//S/TjL3tvbkasaYJ4cd/4maplGfH3/MX2MQGLBPmHtW9JF5BMkCHifxKkFsZ4fh/x/KV1Twd74f5pLdSayRQhCBUQAdsWatCquzJe8tITTMYFjSCtdnMH6/12TfhySocFusQEUJQeDTeXDsE/nRrx+jeKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mDSLhxex; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mDSLhxex;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRt6f6Q6Rz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 08:02:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758146555; x=1789682555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CVXw9uvZ4D6n5HmWG5IpYQjWsYYCqrfqLRvpe9sauYg=;
  b=mDSLhxex8LGWGZj9PcZWNwrzlS2+gz77DWYCKhljNqOVn7bTwDubI1C6
   rX3TyiIyq4w/Kuuj0ABH2ucyOd6h/LX2HSOvpcKCjN97TYOB5bRH1UsWI
   +jUa12mq9SOEdLJhcc6f8+MedO767lQr7sx8gTrrwTzQaQ7OXzdc9iC0w
   tOZ3+ZEEMH3KyL16EKJSripUW0D1yQqlvYtjHcEeKiox/cbYcU9pSivE0
   n97Z4SoEX5VO3dS5ix2SMgsEhOiFGHeJTDCxLdiRE/F+MNJ7yjb0sf5QS
   1HQBsMuJHXoiTLOK6+A0vNOWb+yYqGVx7YLdJLMg0OUdj6lyskNKJ1TxO
   g==;
X-CSE-ConnectionGUID: +00upfa9RBazRsyFLsfDRg==
X-CSE-MsgGUID: sS9Q7OItTOSOn0AMRPRJyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60160889"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="60160889"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 15:02:28 -0700
X-CSE-ConnectionGUID: XCLV9Ns4SDyPh9+V1u4rVQ==
X-CSE-MsgGUID: Xs5J8C6XSLqSRK49Z5F+eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175279710"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2025 15:02:24 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz0EI-0002VL-1R;
	Wed, 17 Sep 2025 22:02:22 +0000
Date: Thu, 18 Sep 2025 06:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>, bhelgaas@google.com,
	mahesh@linux.ibm.com, mani@kernel.org, Jonathan.Cameron@huawei.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, oohall@gmail.com,
	xueshuai@linux.alibaba.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/3] PCI/DPC: Run recovery on device that detected the
 error
Message-ID: <202509180501.eB8FJ5Vt-lkp@intel.com>
References: <20250917063352.19429-3-xueshuai@linux.alibaba.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917063352.19429-3-xueshuai@linux.alibaba.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Shuai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/for-linus]
[also build test WARNING on linus/master v6.17-rc6 next-20250917]
[cannot apply to pci/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Xue/PCI-DPC-Clarify-naming-for-error-port-in-DPC-Handling/20250917-143459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/20250917063352.19429-3-xueshuai%40linux.alibaba.com
patch subject: [PATCH v5 2/3] PCI/DPC: Run recovery on device that detected the error
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250918/202509180501.eB8FJ5Vt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509180501.eB8FJ5Vt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509180501.eB8FJ5Vt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/pci/pcie/edr.c:188:6: warning: variable 'err_dev' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     188 |         if (!(status & PCI_EXP_DPC_STATUS_TRIGGER)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pcie/edr.c:218:14: note: uninitialized use occurs here
     218 |         pci_dev_put(err_dev);
         |                     ^~~~~~~
   drivers/pci/pcie/edr.c:188:2: note: remove the 'if' if its condition is always false
     188 |         if (!(status & PCI_EXP_DPC_STATUS_TRIGGER)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     189 |                 pci_err(err_port, "Invalid DPC trigger %#010x\n", status);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     190 |                 goto send_ost;
         |                 ~~~~~~~~~~~~~~
     191 |         }
         |         ~
   drivers/pci/pcie/edr.c:181:6: warning: variable 'err_dev' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     181 |         if (!err_port->dpc_cap) {
         |             ^~~~~~~~~~~~~~~~~~
   drivers/pci/pcie/edr.c:218:14: note: uninitialized use occurs here
     218 |         pci_dev_put(err_dev);
         |                     ^~~~~~~
   drivers/pci/pcie/edr.c:181:2: note: remove the 'if' if its condition is always false
     181 |         if (!err_port->dpc_cap) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
     182 |                 pci_err(err_port, FW_BUG "This device doesn't support DPC\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     183 |                 goto send_ost;
         |                 ~~~~~~~~~~~~~~
     184 |         }
         |         ~
   drivers/pci/pcie/edr.c:153:50: note: initialize the variable 'err_dev' to silence this warning
     153 |         struct pci_dev *pdev = data, *err_port, *err_dev;
         |                                                         ^
         |                                                          = NULL
   3 warnings generated.


vim +188 drivers/pci/pcie/edr.c

ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  150  
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  151  static void edr_handle_event(acpi_handle handle, u32 event, void *data)
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  152  {
267102466d7b592 Shuai Xue                  2025-09-17  153  	struct pci_dev *pdev = data, *err_port, *err_dev;
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  154  	pci_ers_result_t estate = PCI_ERS_RESULT_DISCONNECT;
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  155  	u16 status;
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  156  
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  157  	if (event != ACPI_NOTIFY_DISCONNECT_RECOVER)
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  158  		return;
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  159  
774820b362b07b9 Bjorn Helgaas              2023-04-07  160  	/*
774820b362b07b9 Bjorn Helgaas              2023-04-07  161  	 * pdev is a Root Port or Downstream Port that is still present and
774820b362b07b9 Bjorn Helgaas              2023-04-07  162  	 * has triggered a containment event, e.g., DPC, so its child
774820b362b07b9 Bjorn Helgaas              2023-04-07  163  	 * devices have been disconnected (ACPI r6.5, sec 5.6.6).
774820b362b07b9 Bjorn Helgaas              2023-04-07  164  	 */
af03958da0678c3 Kuppuswamy Sathyanarayanan 2020-04-15  165  	pci_info(pdev, "EDR event received\n");
af03958da0678c3 Kuppuswamy Sathyanarayanan 2020-04-15  166  
774820b362b07b9 Bjorn Helgaas              2023-04-07  167  	/*
774820b362b07b9 Bjorn Helgaas              2023-04-07  168  	 * Locate the port that experienced the containment event.  pdev
774820b362b07b9 Bjorn Helgaas              2023-04-07  169  	 * may be that port or a parent of it (PCI Firmware r3.3, sec
774820b362b07b9 Bjorn Helgaas              2023-04-07  170  	 * 4.6.13).
774820b362b07b9 Bjorn Helgaas              2023-04-07  171  	 */
a56b1e47845b946 Shuai Xue                  2025-09-17  172  	err_port = acpi_dpc_port_get(pdev);
a56b1e47845b946 Shuai Xue                  2025-09-17  173  	if (!err_port) {
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  174  		pci_err(pdev, "Firmware failed to locate DPC port\n");
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  175  		return;
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  176  	}
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  177  
a56b1e47845b946 Shuai Xue                  2025-09-17  178  	pci_dbg(pdev, "Reported EDR dev: %s\n", pci_name(err_port));
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  179  
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  180  	/* If port does not support DPC, just send the OST */
a56b1e47845b946 Shuai Xue                  2025-09-17  181  	if (!err_port->dpc_cap) {
a56b1e47845b946 Shuai Xue                  2025-09-17  182  		pci_err(err_port, FW_BUG "This device doesn't support DPC\n");
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  183  		goto send_ost;
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  184  	}
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  185  
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  186  	/* Check if there is a valid DPC trigger */
a56b1e47845b946 Shuai Xue                  2025-09-17  187  	pci_read_config_word(err_port, err_port->dpc_cap + PCI_EXP_DPC_STATUS, &status);
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23 @188  	if (!(status & PCI_EXP_DPC_STATUS_TRIGGER)) {
a56b1e47845b946 Shuai Xue                  2025-09-17  189  		pci_err(err_port, "Invalid DPC trigger %#010x\n", status);
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  190  		goto send_ost;
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  191  	}
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  192  
267102466d7b592 Shuai Xue                  2025-09-17  193  	err_dev = dpc_process_error(err_port);
a56b1e47845b946 Shuai Xue                  2025-09-17  194  	pci_aer_raw_clear_status(err_port);
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  195  
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  196  	/*
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  197  	 * Irrespective of whether the DPC event is triggered by ERR_FATAL
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  198  	 * or ERR_NONFATAL, since the link is already down, use the FATAL
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  199  	 * error recovery path for both cases.
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  200  	 */
267102466d7b592 Shuai Xue                  2025-09-17  201  	estate = pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  202  
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  203  send_ost:
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  204  
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  205  	/*
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  206  	 * If recovery is successful, send _OST(0xF, BDF << 16 | 0x80)
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  207  	 * to firmware. If not successful, send _OST(0xF, BDF << 16 | 0x81).
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  208  	 */
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  209  	if (estate == PCI_ERS_RESULT_RECOVERED) {
a56b1e47845b946 Shuai Xue                  2025-09-17  210  		pci_dbg(err_port, "DPC port successfully recovered\n");
a56b1e47845b946 Shuai Xue                  2025-09-17  211  		pcie_clear_device_status(err_port);
a56b1e47845b946 Shuai Xue                  2025-09-17  212  		acpi_send_edr_status(pdev, err_port, EDR_OST_SUCCESS);
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  213  	} else {
a56b1e47845b946 Shuai Xue                  2025-09-17  214  		pci_dbg(err_port, "DPC port recovery failed\n");
a56b1e47845b946 Shuai Xue                  2025-09-17  215  		acpi_send_edr_status(pdev, err_port, EDR_OST_FAILED);
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  216  	}
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  217  
267102466d7b592 Shuai Xue                  2025-09-17  218  	pci_dev_put(err_dev);
a56b1e47845b946 Shuai Xue                  2025-09-17  219  	pci_dev_put(err_port);
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  220  }
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

