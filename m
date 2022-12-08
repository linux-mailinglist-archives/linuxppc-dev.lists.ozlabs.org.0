Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93137647AE2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 01:43:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSsgr2wWxz3bjQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 11:43:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UnB1BeOf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=alison.schofield@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UnB1BeOf;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSn8b2Pwwz2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 08:19:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670534351; x=1702070351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=daCo9aJnrElRYa5owQZwNuiIR5bcMFlsrMklej38QaA=;
  b=UnB1BeOf4dZ/q7nCZceKsHK3iRaZFuMIYZx1vCzKLYOlQ8Hj+S1AbokF
   wApYpaCpXYV0no8X3lnEuHFvPHS7lqV8PV5bLKOjW9iek3FQDj2rzQGyD
   ohFQtJdCujUmO+BKATCg7NMUUV2WVVTph1mjRVHdFbx/9N+yo380R2Qhv
   Q15rMxZn/bmcdjEIzzaJrFA4ql3tdFZkRbp1uTptte/dvCdlZe1VDf9bE
   FeOhgNVyxIAQTlYTONHu1fMULhiydFLizjbnoHiCxj3qnWtbpCGX3REv1
   Gh6JlF5xHTaTMI7CkObTQzM/Q6IQsuB3rRBAFVE3XIqLVvKoq+sQGM0fQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="318456973"
X-IronPort-AV: E=Sophos;i="5.96,228,1665471600"; 
   d="scan'208";a="318456973"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 13:19:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="679692168"
X-IronPort-AV: E=Sophos;i="5.96,228,1665471600"; 
   d="scan'208";a="679692168"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.199.197])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 13:19:00 -0800
Date: Thu, 8 Dec 2022 13:18:59 -0800
From: Alison Schofield <alison.schofield@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] cxl/pci: Move tracepoint definitions to drivers/cxl/core/
Message-ID: <Y5JUw8pepX9McceV@aschofie-mobl2>
References: <167051869176.436579.9728373544811641087.stgit@dwillia2-xfh.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167051869176.436579.9728373544811641087.stgit@dwillia2-xfh.jf.intel.com>
X-Mailman-Approved-At: Fri, 09 Dec 2022 11:42:17 +1100
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>, linux-cxl@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 08, 2022 at 09:02:00AM -0800, Dan Williams wrote:
> CXL is using tracepoints for reporting RAS capability register payloads
> for AER events, and has plans to use tracepoints for the output payload
> of Get Poison List and Get Event Records commands. For organization
> purposes it would be nice to keep those all under a single + local CXL
> trace system. This also organization also potentially helps in the
> future when CXL drivers expand beyond generic memory expanders, however
> that would also entail a move away from the expander-specific
> cxl_dev_state context, save that for later.
> 
> Note that the powerpc-specific drivers/misc/cxl/ also defines a 'cxl'
> trace system, however, it is unlikely that a single platform will ever
> load both drivers simultaneously.

Verified this on top of cxl/next with the get-poison-list patchset
using the new trace file layout.

Also, confirmed that the cxl_aer_*_error events appeared correctly
in sys/kernel/debug/tracing/events/ and that 'cxl monitor' could 
be run.

Tested-by: Alison Schofield <alison.schofield@intel.com>

> 
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
> This patch is targeting v6.3.  I am sending it out now to enable the
> in-flight Event and Poison list patch sets to build upon. It will not
> move to a non-rebasing branch until after v6.2-rc2, but in the meantime
> I can throw it out on the list and the cxl/preview branch.
> 
>  drivers/cxl/core/Makefile  |    3 +
>  drivers/cxl/core/pci.c     |  112 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/cxl/core/trace.c   |    5 ++
>  drivers/cxl/core/trace.h   |   11 ++--
>  drivers/cxl/cxl.h          |    2 +
>  drivers/cxl/cxlpci.h       |    3 +
>  drivers/cxl/pci.c          |  111 --------------------------------------------
>  tools/testing/cxl/Kbuild   |    2 +
>  8 files changed, 131 insertions(+), 118 deletions(-)
>  create mode 100644 drivers/cxl/core/trace.c
>  rename include/trace/events/cxl.h => drivers/cxl/core/trace.h (94%)
> 
> diff --git a/drivers/cxl/core/Makefile b/drivers/cxl/core/Makefile
> index 79c7257f4107..ca4ae31d8f57 100644
> --- a/drivers/cxl/core/Makefile
> +++ b/drivers/cxl/core/Makefile
> @@ -3,6 +3,8 @@ obj-$(CONFIG_CXL_BUS) += cxl_core.o
>  obj-$(CONFIG_CXL_SUSPEND) += suspend.o
>  
>  ccflags-y += -I$(srctree)/drivers/cxl
> +CFLAGS_trace.o = -DTRACE_INCLUDE_PATH=. -I$(src)
> +
>  cxl_core-y := port.o
>  cxl_core-y += pmem.o
>  cxl_core-y += regs.o
> @@ -10,4 +12,5 @@ cxl_core-y += memdev.o
>  cxl_core-y += mbox.o
>  cxl_core-y += pci.o
>  cxl_core-y += hdm.o
> +cxl_core-$(CONFIG_TRACING) += trace.o
>  cxl_core-$(CONFIG_CXL_REGION) += region.o
> diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
> index 57764e9cd19d..1d1492440287 100644
> --- a/drivers/cxl/core/pci.c
> +++ b/drivers/cxl/core/pci.c
> @@ -9,6 +9,7 @@
>  #include <cxlmem.h>
>  #include <cxl.h>
>  #include "core.h"
> +#include "trace.h"
>  
>  /**
>   * DOC: cxl core pci
> @@ -622,3 +623,114 @@ void read_cdat_data(struct cxl_port *port)
>  	}
>  }
>  EXPORT_SYMBOL_NS_GPL(read_cdat_data, CXL);
> +
> +void cxl_cor_error_detected(struct pci_dev *pdev)
> +{
> +	struct cxl_dev_state *cxlds = pci_get_drvdata(pdev);
> +	struct cxl_memdev *cxlmd = cxlds->cxlmd;
> +	struct device *dev = &cxlmd->dev;
> +	void __iomem *addr;
> +	u32 status;
> +
> +	if (!cxlds->regs.ras)
> +		return;
> +
> +	addr = cxlds->regs.ras + CXL_RAS_CORRECTABLE_STATUS_OFFSET;
> +	status = readl(addr);
> +	if (status & CXL_RAS_CORRECTABLE_STATUS_MASK) {
> +		writel(status & CXL_RAS_CORRECTABLE_STATUS_MASK, addr);
> +		trace_cxl_aer_correctable_error(dev, status);
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(cxl_cor_error_detected, CXL);
> +
> +/* CXL spec rev3.0 8.2.4.16.1 */
> +static void header_log_copy(struct cxl_dev_state *cxlds, u32 *log)
> +{
> +	void __iomem *addr;
> +	u32 *log_addr;
> +	int i, log_u32_size = CXL_HEADERLOG_SIZE / sizeof(u32);
> +
> +	addr = cxlds->regs.ras + CXL_RAS_HEADER_LOG_OFFSET;
> +	log_addr = log;
> +
> +	for (i = 0; i < log_u32_size; i++) {
> +		*log_addr = readl(addr);
> +		log_addr++;
> +		addr += sizeof(u32);
> +	}
> +}
> +
> +/*
> + * Log the state of the RAS status registers and prepare them to log the
> + * next error status. Return 1 if reset needed.
> + */
> +static bool cxl_report_and_clear(struct cxl_dev_state *cxlds)
> +{
> +	struct cxl_memdev *cxlmd = cxlds->cxlmd;
> +	struct device *dev = &cxlmd->dev;
> +	u32 hl[CXL_HEADERLOG_SIZE_U32];
> +	void __iomem *addr;
> +	u32 status;
> +	u32 fe;
> +
> +	if (!cxlds->regs.ras)
> +		return false;
> +
> +	addr = cxlds->regs.ras + CXL_RAS_UNCORRECTABLE_STATUS_OFFSET;
> +	status = readl(addr);
> +	if (!(status & CXL_RAS_UNCORRECTABLE_STATUS_MASK))
> +		return false;
> +
> +	/* If multiple errors, log header points to first error from ctrl reg */
> +	if (hweight32(status) > 1) {
> +		addr = cxlds->regs.ras + CXL_RAS_CAP_CONTROL_OFFSET;
> +		fe = BIT(FIELD_GET(CXL_RAS_CAP_CONTROL_FE_MASK, readl(addr)));
> +	} else {
> +		fe = status;
> +	}
> +
> +	header_log_copy(cxlds, hl);
> +	trace_cxl_aer_uncorrectable_error(dev, status, fe, hl);
> +	writel(status & CXL_RAS_UNCORRECTABLE_STATUS_MASK, addr);
> +
> +	return true;
> +}
> +
> +pci_ers_result_t cxl_error_detected(struct pci_dev *pdev,
> +				    pci_channel_state_t state)
> +{
> +	struct cxl_dev_state *cxlds = pci_get_drvdata(pdev);
> +	struct cxl_memdev *cxlmd = cxlds->cxlmd;
> +	struct device *dev = &cxlmd->dev;
> +	bool ue;
> +
> +	/*
> +	 * A frozen channel indicates an impending reset which is fatal to
> +	 * CXL.mem operation, and will likely crash the system. On the off
> +	 * chance the situation is recoverable dump the status of the RAS
> +	 * capability registers and bounce the active state of the memdev.
> +	 */
> +	ue = cxl_report_and_clear(cxlds);
> +
> +	switch (state) {
> +	case pci_channel_io_normal:
> +		if (ue) {
> +			device_release_driver(dev);
> +			return PCI_ERS_RESULT_NEED_RESET;
> +		}
> +		return PCI_ERS_RESULT_CAN_RECOVER;
> +	case pci_channel_io_frozen:
> +		dev_warn(&pdev->dev,
> +			 "%s: frozen state error detected, disable CXL.mem\n",
> +			 dev_name(dev));
> +		device_release_driver(dev);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	case pci_channel_io_perm_failure:
> +		dev_warn(&pdev->dev,
> +			 "failure state error detected, request disconnect\n");
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +EXPORT_SYMBOL_NS_GPL(cxl_error_detected, CXL);
> diff --git a/drivers/cxl/core/trace.c b/drivers/cxl/core/trace.c
> new file mode 100644
> index 000000000000..29ae7ce81dc5
> --- /dev/null
> +++ b/drivers/cxl/core/trace.c
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright(c) 2022 Intel Corporation. All rights reserved. */
> +
> +#define CREATE_TRACE_POINTS
> +#include "trace.h"
> diff --git a/include/trace/events/cxl.h b/drivers/cxl/core/trace.h
> similarity index 94%
> rename from include/trace/events/cxl.h
> rename to drivers/cxl/core/trace.h
> index ad085a2534ef..20ca2fe2ca8e 100644
> --- a/include/trace/events/cxl.h
> +++ b/drivers/cxl/core/trace.h
> @@ -1,15 +1,14 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright(c) 2022 Intel Corporation. All rights reserved. */
>  #undef TRACE_SYSTEM
>  #define TRACE_SYSTEM cxl
>  
>  #if !defined(_CXL_EVENTS_H) || defined(TRACE_HEADER_MULTI_READ)
>  #define _CXL_EVENTS_H
>  
> +#include <cxl.h>
>  #include <linux/tracepoint.h>
>  
> -#define CXL_HEADERLOG_SIZE		SZ_512
> -#define CXL_HEADERLOG_SIZE_U32		SZ_512 / sizeof(u32)
> -
>  #define CXL_RAS_UC_CACHE_DATA_PARITY	BIT(0)
>  #define CXL_RAS_UC_CACHE_ADDR_PARITY	BIT(1)
>  #define CXL_RAS_UC_CACHE_BE_PARITY	BIT(2)
> @@ -106,7 +105,5 @@ TRACE_EVENT(cxl_aer_correctable_error,
>  
>  #endif /* _CXL_EVENTS_H */
>  
> -/* This part must be outside protection */
> -#undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_FILE cxl
> +#define TRACE_INCLUDE_FILE trace
>  #include <trace/define_trace.h>
> diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
> index 1b1cf459ac77..aa3af3bb73b2 100644
> --- a/drivers/cxl/cxl.h
> +++ b/drivers/cxl/cxl.h
> @@ -140,6 +140,8 @@ static inline int ways_to_eiw(unsigned int ways, u8 *eiw)
>  #define CXL_RAS_CAP_CONTROL_FE_MASK GENMASK(5, 0)
>  #define CXL_RAS_HEADER_LOG_OFFSET 0x18
>  #define CXL_RAS_CAPABILITY_LENGTH 0x58
> +#define CXL_HEADERLOG_SIZE SZ_512
> +#define CXL_HEADERLOG_SIZE_U32 SZ_512 / sizeof(u32)
>  
>  /* CXL 2.0 8.2.8.1 Device Capabilities Array Register */
>  #define CXLDEV_CAP_ARRAY_OFFSET 0x0
> diff --git a/drivers/cxl/cxlpci.h b/drivers/cxl/cxlpci.h
> index 920909791bb9..77dbdb980b12 100644
> --- a/drivers/cxl/cxlpci.h
> +++ b/drivers/cxl/cxlpci.h
> @@ -66,4 +66,7 @@ int devm_cxl_port_enumerate_dports(struct cxl_port *port);
>  struct cxl_dev_state;
>  int cxl_hdm_decode_init(struct cxl_dev_state *cxlds, struct cxl_hdm *cxlhdm);
>  void read_cdat_data(struct cxl_port *port);
> +void cxl_cor_error_detected(struct pci_dev *pdev);
> +pci_ers_result_t cxl_error_detected(struct pci_dev *pdev,
> +				    pci_channel_state_t state);
>  #endif /* __CXL_PCI_H__ */
> diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
> index 33083a522fd1..3a66aadb4df0 100644
> --- a/drivers/cxl/pci.c
> +++ b/drivers/cxl/pci.c
> @@ -14,8 +14,6 @@
>  #include "cxlmem.h"
>  #include "cxlpci.h"
>  #include "cxl.h"
> -#define CREATE_TRACE_POINTS
> -#include <trace/events/cxl.h>
>  
>  /**
>   * DOC: cxl pci
> @@ -514,96 +512,6 @@ static const struct pci_device_id cxl_mem_pci_tbl[] = {
>  };
>  MODULE_DEVICE_TABLE(pci, cxl_mem_pci_tbl);
>  
> -/* CXL spec rev3.0 8.2.4.16.1 */
> -static void header_log_copy(struct cxl_dev_state *cxlds, u32 *log)
> -{
> -	void __iomem *addr;
> -	u32 *log_addr;
> -	int i, log_u32_size = CXL_HEADERLOG_SIZE / sizeof(u32);
> -
> -	addr = cxlds->regs.ras + CXL_RAS_HEADER_LOG_OFFSET;
> -	log_addr = log;
> -
> -	for (i = 0; i < log_u32_size; i++) {
> -		*log_addr = readl(addr);
> -		log_addr++;
> -		addr += sizeof(u32);
> -	}
> -}
> -
> -/*
> - * Log the state of the RAS status registers and prepare them to log the
> - * next error status. Return 1 if reset needed.
> - */
> -static bool cxl_report_and_clear(struct cxl_dev_state *cxlds)
> -{
> -	struct cxl_memdev *cxlmd = cxlds->cxlmd;
> -	struct device *dev = &cxlmd->dev;
> -	u32 hl[CXL_HEADERLOG_SIZE_U32];
> -	void __iomem *addr;
> -	u32 status;
> -	u32 fe;
> -
> -	if (!cxlds->regs.ras)
> -		return false;
> -
> -	addr = cxlds->regs.ras + CXL_RAS_UNCORRECTABLE_STATUS_OFFSET;
> -	status = readl(addr);
> -	if (!(status & CXL_RAS_UNCORRECTABLE_STATUS_MASK))
> -		return false;
> -
> -	/* If multiple errors, log header points to first error from ctrl reg */
> -	if (hweight32(status) > 1) {
> -		addr = cxlds->regs.ras + CXL_RAS_CAP_CONTROL_OFFSET;
> -		fe = BIT(FIELD_GET(CXL_RAS_CAP_CONTROL_FE_MASK, readl(addr)));
> -	} else {
> -		fe = status;
> -	}
> -
> -	header_log_copy(cxlds, hl);
> -	trace_cxl_aer_uncorrectable_error(dev, status, fe, hl);
> -	writel(status & CXL_RAS_UNCORRECTABLE_STATUS_MASK, addr);
> -
> -	return true;
> -}
> -
> -static pci_ers_result_t cxl_error_detected(struct pci_dev *pdev,
> -					   pci_channel_state_t state)
> -{
> -	struct cxl_dev_state *cxlds = pci_get_drvdata(pdev);
> -	struct cxl_memdev *cxlmd = cxlds->cxlmd;
> -	struct device *dev = &cxlmd->dev;
> -	bool ue;
> -
> -	/*
> -	 * A frozen channel indicates an impending reset which is fatal to
> -	 * CXL.mem operation, and will likely crash the system. On the off
> -	 * chance the situation is recoverable dump the status of the RAS
> -	 * capability registers and bounce the active state of the memdev.
> -	 */
> -	ue = cxl_report_and_clear(cxlds);
> -
> -	switch (state) {
> -	case pci_channel_io_normal:
> -		if (ue) {
> -			device_release_driver(dev);
> -			return PCI_ERS_RESULT_NEED_RESET;
> -		}
> -		return PCI_ERS_RESULT_CAN_RECOVER;
> -	case pci_channel_io_frozen:
> -		dev_warn(&pdev->dev,
> -			 "%s: frozen state error detected, disable CXL.mem\n",
> -			 dev_name(dev));
> -		device_release_driver(dev);
> -		return PCI_ERS_RESULT_NEED_RESET;
> -	case pci_channel_io_perm_failure:
> -		dev_warn(&pdev->dev,
> -			 "failure state error detected, request disconnect\n");
> -		return PCI_ERS_RESULT_DISCONNECT;
> -	}
> -	return PCI_ERS_RESULT_NEED_RESET;
> -}
> -
>  static pci_ers_result_t cxl_slot_reset(struct pci_dev *pdev)
>  {
>  	struct cxl_dev_state *cxlds = pci_get_drvdata(pdev);
> @@ -628,25 +536,6 @@ static void cxl_error_resume(struct pci_dev *pdev)
>  		 dev->driver ? "successful" : "failed");
>  }
>  
> -static void cxl_cor_error_detected(struct pci_dev *pdev)
> -{
> -	struct cxl_dev_state *cxlds = pci_get_drvdata(pdev);
> -	struct cxl_memdev *cxlmd = cxlds->cxlmd;
> -	struct device *dev = &cxlmd->dev;
> -	void __iomem *addr;
> -	u32 status;
> -
> -	if (!cxlds->regs.ras)
> -		return;
> -
> -	addr = cxlds->regs.ras + CXL_RAS_CORRECTABLE_STATUS_OFFSET;
> -	status = readl(addr);
> -	if (status & CXL_RAS_CORRECTABLE_STATUS_MASK) {
> -		writel(status & CXL_RAS_CORRECTABLE_STATUS_MASK, addr);
> -		trace_cxl_aer_correctable_error(dev, status);
> -	}
> -}
> -
>  static const struct pci_error_handlers cxl_error_handlers = {
>  	.error_detected	= cxl_error_detected,
>  	.slot_reset	= cxl_slot_reset,
> diff --git a/tools/testing/cxl/Kbuild b/tools/testing/cxl/Kbuild
> index 0805f08af8b3..12af1c9270ff 100644
> --- a/tools/testing/cxl/Kbuild
> +++ b/tools/testing/cxl/Kbuild
> @@ -17,6 +17,7 @@ CXL_SRC := $(DRIVERS)/cxl
>  CXL_CORE_SRC := $(DRIVERS)/cxl/core
>  ccflags-y := -I$(srctree)/drivers/cxl/
>  ccflags-y += -D__mock=__weak
> +ccflags-y += -DTRACE_INCLUDE_PATH=$(CXL_CORE_SRC) -I$(srctree)/drivers/cxl/core/
>  
>  obj-m += cxl_acpi.o
>  
> @@ -49,6 +50,7 @@ cxl_core-y += $(CXL_CORE_SRC)/memdev.o
>  cxl_core-y += $(CXL_CORE_SRC)/mbox.o
>  cxl_core-y += $(CXL_CORE_SRC)/pci.o
>  cxl_core-y += $(CXL_CORE_SRC)/hdm.o
> +cxl_core-$(CONFIG_TRACING) += $(CXL_CORE_SRC)/trace.o
>  cxl_core-$(CONFIG_CXL_REGION) += $(CXL_CORE_SRC)/region.o
>  cxl_core-y += config_check.o
>  
> 
