Return-Path: <linuxppc-dev+bounces-8829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDAFABF1A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:31:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2SQC5N8tz3c2F;
	Wed, 21 May 2025 20:31:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747823491;
	cv=none; b=oCWS02yiDQIT/OW61zDDg62viePb52oNeN8b14K2Ij8kUW3OKYUehvXlRrzDMuBERyy6gvr2L7R98RGBwf0vF8c2s4net0FDhYHvfneirbC6U6Kt7wh/j8mA3lvzRvwLkPjt7BINl86UId9um5LxObGsb+o7ermbqfNDKXmMVPNT94akcywsgOhBlCBgMK47KjjhtvZiWtMLepIcKmghMDgEcNOi+igF680yvrEVBMEZBEfSXwsQVdVgnqMAlbU8YdHd9AWQPdlz/XI3w35xqzPUPtVYuS3GWZqQvQcms3Twm2DXHarwzuBKAr0lynUz6rlijYINDbAjbiLAu/g7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747823491; c=relaxed/relaxed;
	bh=9D+Sq2qSYmqSEstJxeE25Si5lstuMyI6o4IrcvOXo24=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JYryGhPKzxQdGmizC/s95iYGtyPyuknT3BWJ0Xnq0lBes7CguzSBL744A0bzXGAhVH6N8Q/xFcRUche7qUpXJnLP+spp7QX9Jjc6+gQ39SAv6wsYfkmXtSBz4b8lxZeGoisXx9f30aUeTDHH14+WFEd+TAK1vHfM5utGvr7+fmfacdMFAu5ctwXPk9S8UADJnV3UniNnXWSW1o4FYQ5IJXpAMG2ldpk2LZblFJMmVoasetrq1zq/2JhZD0tZ4NgiNUIF4aoIVHAtBGxB8GMXY2xq3sPjEpnFNJlZPnGq8JL0xF+Om12vGegf5OwdBUHD36kxMnNDtXUkNGTH1h4HCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2SQB17jmz2yyJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:31:28 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b2SP32hj5z6L54Y;
	Wed, 21 May 2025 18:30:31 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C4961402FC;
	Wed, 21 May 2025 18:31:24 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 May
 2025 12:31:23 +0200
Date: Wed, 21 May 2025 11:31:21 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, Jon Pan-Doh <pandoh@google.com>, "Karolina
 Stolarek" <karolina.stolarek@oracle.com>, Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>, Ben Fuller
	<ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, "Anil
 Agrawal" <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Sathyanarayanan
 Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Lukas Wunner
	<lukas@wunner.de>, Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney"
	<paulmck@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver
 O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, Keith
 Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, "Terry Bowman"
	<terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, "Dave Jiang"
	<dave.jiang@intel.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v7 15/17] PCI/AER: Ratelimit correctable and non-fatal
 error logging
Message-ID: <20250521113121.000067ce@huawei.com>
In-Reply-To: <20250520215047.1350603-16-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
	<20250520215047.1350603-16-helgaas@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 20 May 2025 16:50:32 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Jon Pan-Doh <pandoh@google.com>
> 
> Spammy devices can flood kernel logs with AER errors and slow/stall
> execution. Add per-device ratelimits for AER correctable and non-fatal
> uncorrectable errors that use the kernel defaults (10 per 5s).  Logging of
> fatal errors is not ratelimited.

See below. I'm not sure that logging of fatal error should affect the rate
for non fatal errors + the rate limit infrastructure kind of assumes
that you only call it if you are planning to respect it's decision.

Given overall aim is to restrict rates, maybe we don't care if we sometimes
throttle earlier that we might expect with a simpler separation of what
is being limited.

I don't mind strongly either way.

> 
> There are two AER logging entry points:
> 
>   - aer_print_error() is used by DPC and native AER
> 
>   - pci_print_aer() is used by GHES and CXL
> 
> The native AER aer_print_error() case includes a loop that may log details
> from multiple devices.  This is ratelimited such that we log all the
> details we find if any of the devices has not hit the ratelimit.  If no
> such device details are found, we still log the Error Source from the ERR_*
> Message, ratelimited by the Root Port or RCEC that received it.
> 
> The DPC aer_print_error() case is not ratelimited, since this only happens
> for fatal errors.
> 
> The CXL pci_print_aer() case is ratelimited by the Error Source device.
> 
> The GHES pci_print_aer() case is via aer_recover_work_func(), which
> searches for the Error Source device.  If the device is not found, there's
> no per-device ratelimit, so we use a system-wide ratelimit that covers all
> error types (correctable, non-fatal, and fatal).
> 
> Sargun at Meta reported internally that a flood of AER errors causes RCU
> CPU stall warnings and CSD-lock warnings.
> 
> Tested using aer-inject[1]. Sent 11 AER errors. Observed 10 errors logged
> while AER stats (cat /sys/bus/pci/devices/<dev>/aer_dev_correctable) show
> true count of 11.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
> 
> [bhelgaas: commit log, factor out trace_aer_event() and aer_print_rp_info()
> changes to previous patches, collect single aer_err_info.ratelimit as union
> of ratelimits of all error source devices, don't ratelimit fatal errors,
> "aer_report" -> "aer_info"]
> Reported-by: Sargun Dhillon <sargun@meta.com>
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pci.h      |  3 +-
>  drivers/pci/pcie/aer.c | 66 ++++++++++++++++++++++++++++++++++++++----
>  drivers/pci/pcie/dpc.c |  1 +
>  3 files changed, 64 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 705f9ef58acc..65c466279ade 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -593,7 +593,8 @@ struct aer_err_info {
>  	unsigned int id:16;
>  
>  	unsigned int severity:2;	/* 0:NONFATAL | 1:FATAL | 2:COR */
> -	unsigned int __pad1:5;
> +	unsigned int ratelimit:1;	/* 0=skip, 1=print */

That naming is less than intuitive.  Maybe expand it to ratelimit_print or
something like that.

> +	unsigned int __pad1:4;
>  	unsigned int multi_error_valid:1;
>  
>  	unsigned int first_error:5;
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 4f1bff0f000f..f9e684ac7878 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c

> @@ -815,8 +843,19 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
>   */
>  static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
>  {
> +	/*
> +	 * Ratelimit AER log messages.  "dev" is either the source
> +	 * identified by the root's Error Source ID or it has an unmasked
> +	 * error logged in its own AER Capability.  If any of these devices
> +	 * has not reached its ratelimit, log messages for all of them.
> +	 * Messages are emitted when "e_info->ratelimit" is non-zero.
> +	 *
> +	 * Note that "e_info->ratelimit" was already initialized to 1 for the
> +	 * ERR_FATAL case.
> +	 */
>  	if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
>  		e_info->dev[e_info->error_dev_num] = pci_dev_get(dev);
> +		e_info->ratelimit |= aer_ratelimit(dev, e_info->severity);

So this is a little odd.  I think it works but there is code inside __ratelimit
that I think we should not be calling for that ERROR_FATAL case
(whether we should call lots of times for each device isn't obvious either
 but maybe that is more valid).

In the event of it already being 1 due to ERROR_FATAL you will falsely trigger
a potential print from inside __ratelimit() if we were rate limited and no
longer are but only skipped FATAL prints.  My concern is that function
is kind of assuming it's only called in cases where a rate limit decision
is being made and the implementation may change in future).

https://elixir.bootlin.com/linux/v6.14.7/source/lib/ratelimit.c#L56

Maybe, 
		if (!info->ratelimit)
			e_info->ratelimit = aer_ratelimit(dev, e_info->severity);
is an alternative option.
That allows a multiplication factor on the rate as all device count for 1.
 



>  		e_info->error_dev_num++;
>  		return 0;
>  	}
> @@ -914,7 +953,7 @@ static int find_device_iter(struct pci_dev *dev, void *data)
>   * e_info->error_dev_num and e_info->dev[], based on the given information.
>   */
>  static bool find_source_device(struct pci_dev *parent,
> -		struct aer_err_info *e_info)
> +			       struct aer_err_info *e_info)
Unrelated change

>  {
>  	struct pci_dev *dev = parent;
>  	int result;

>  			pci_aer_clear_fatal_status(pdev);


