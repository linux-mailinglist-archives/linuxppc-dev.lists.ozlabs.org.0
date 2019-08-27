Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB75A28FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 23:33:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KG7F6Vl4zDsNW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 07:33:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HwNL4fFTzDq77
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 03:09:53 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 10:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,438,1559545200"; d="scan'208";a="171263299"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 27 Aug 2019 10:09:50 -0700
Received: from [10.54.74.33] (skuppusw-desk.jf.intel.com [10.54.74.33])
 by linux.intel.com (Postfix) with ESMTP id D0DE6580375;
 Tue, 27 Aug 2019 10:09:50 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] PCI/AER: Update parameter descriptions to satisfy
 kernel-doc validator
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
References: <20190827151823.75312-1-andriy.shevchenko@linux.intel.com>
 <20190827151823.75312-2-andriy.shevchenko@linux.intel.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel
Message-ID: <71eb8108-61a7-2815-4082-75c21f8bbf03@linux.intel.com>
Date: Tue, 27 Aug 2019 10:06:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827151823.75312-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Fri, 30 Aug 2019 07:29:31 +1000
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
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/27/19 8:18 AM, Andy Shevchenko wrote:
> Kernel-doc validator complains:
>
> aer.c:207: warning: Function parameter or member 'str' not described in 'pcie_ecrc_get_policy'
> aer.c:1209: warning: Function parameter or member 'irq' not described in 'aer_isr'
> aer.c:1209: warning: Function parameter or member 'context' not described in 'aer_isr'
> aer.c:1209: warning: Excess function parameter 'work' description in 'aer_isr'
>
> Fix the above accordingly.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>   drivers/pci/pcie/aer.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f883f81d759a..6073eaab099d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -202,6 +202,7 @@ void pcie_set_ecrc_checking(struct pci_dev *dev)
>   
>   /**
>    * pcie_ecrc_get_policy - parse kernel command-line ecrc option
> + * @str: ECRC policy from kernel command line to use
>    */
>   void pcie_ecrc_get_policy(char *str)
>   {
> @@ -1201,7 +1202,8 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>   
>   /**
>    * aer_isr - consume errors detected by root port
> - * @work: definition of this work item
> + * @irq: IRQ assigned to Root Port
> + * @context: pointer to Root Port data structure
>    *
>    * Invoked, as DPC, when root port records new detected error
>    */

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer

