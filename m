Return-Path: <linuxppc-dev+bounces-7728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A8A91591
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 09:46:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdVLw2k3cz2ym3;
	Thu, 17 Apr 2025 17:46:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744875960;
	cv=none; b=ZIqVrmhm0x4PJLz9sYdK++bYFaGx7JPStmkdTM2C4Qjrjh5hXQStPLYp2ulg/cktEubRImuKTQfw+JcwEqoIpOaNQyaYdIHu8Cspw4XyVM+vkJ1pTLldcl+3ofNaOH/gj8T3ipdZwmy9Ign+tSz/n4fJFbFVZMXgJ7LjvK8lAQFYcJHULyv8wIjZSGBZDuuPknMYjcmLIH9P8mdWXq9nIN3z7jrxcF2gGbBfCNj1vPBwrRI+rNhzE4ZnplDK0cDmvSVwBvXv64x0P0wBlWYyg2Hhtz/DDCpXrYgWl3ChzHsafiLH3ctk1qyON36IC3Px1NxXGNRa5GWqcNxiua5oIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744875960; c=relaxed/relaxed;
	bh=1JqcdGwTdxzrmkBSqnRwsWIPqbNQuyemDrSqYOkqzO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkGk0sx86wwlEWmb+WQTAyO394q1LqmuwZC/j1HuYgxUcdS6musSxZinrsJt7su6yKIUv4IxhrcUWW/HSYqoimo+7I7sBuznrxO4BZ1FUh25YRjZzlfSMYl5EZOSBOEvXgeJWiJNULg5LNfRJme2zBrdC74kWi1Rmuqp7VnoeiVl0MzXGwKMV4FhxR6DE4knZrAaAMKyseAz5F6t13RBrHi8dB/ACE60KLmtHuBLTv3qXrCKZgDLNNTcrPDY8ODq3u1yBsGLSXYakVr0NwB9N13QeVnzY2zHOf0uYkFE+3xlm6rV8xjCSrZDNit+66a9mkq/kl3413x/EI4fz9Oudw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K2txqIoi; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=michal.swiatkowski@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K2txqIoi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=michal.swiatkowski@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Thu, 17 Apr 2025 17:45:57 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdVLs6ghzz2ydv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 17:45:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744875958; x=1776411958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tslz6DlI/Mm4YFhda6oTOI/VUg3AL5GOdcZku7+10qg=;
  b=K2txqIoiHzXkmJTobsyy2jBAJCuSof1xGqN/IZZ2kFW8wYVoSeDmFbK1
   vvNxnYqUqZN7iWMbuYayDTXfF6fRUgsuLzDVM3GSf9Pw3ykNj4f2J5Jda
   LxtQ3VwRVYkLh2fO/8mWuCGCpSHDSG4ndfsewdr7hEZJ0NO4BPsh3QUEk
   +WMnqTXzW771eSzU9FXnb/coFaYjFRRbTxHUobzdxOs0KsMuSN51Z+BWE
   GfC1IVwJKApydkRmnDMaVnVb8si0inQWfXUvIsRI7TrchYHTtxgO74LeN
   kV0KaOEDlwND7zat8n9tbEAV6GY8NVf4UuHPcSwNDIvL0QM/vGJEKqhIK
   g==;
X-CSE-ConnectionGUID: J3YYOMfSTc6P9HtUlJWr2A==
X-CSE-MsgGUID: OxMJ0809Tf6nNNpqkHccnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50099765"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="50099765"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:44:52 -0700
X-CSE-ConnectionGUID: SECiPiZnTDWrnD/BIEfxOA==
X-CSE-MsgGUID: oLWOzVShQrCnUO/bkHGTAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130586301"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:44:50 -0700
Date: Thu, 17 Apr 2025 09:44:32 +0200
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: netdev@vger.kernel.org, michal.swiatkowski@linux.intel.com,
	horms@kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v3 1/3] net: ibmveth: Indented struct
 ibmveth_adapter correctly
Message-ID: <aACxYGS9F8bh5PkG@mev-dev.igk.intel.com>
References: <20250416205751.66365-1-davemarq@linux.ibm.com>
 <20250416205751.66365-2-davemarq@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416205751.66365-2-davemarq@linux.ibm.com>
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 03:57:49PM -0500, Dave Marquardt wrote:
> Made struct ibmveth_adapter follow indentation rules
> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> ---
>  drivers/net/ethernet/ibm/ibmveth.h | 64 +++++++++++++++---------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmveth.h b/drivers/net/ethernet/ibm/ibmveth.h
> index 8468e2c59d7a..0f72ce54e7cf 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.h
> +++ b/drivers/net/ethernet/ibm/ibmveth.h
> @@ -134,38 +134,38 @@ struct ibmveth_rx_q {
>  };
>  
>  struct ibmveth_adapter {
> -    struct vio_dev *vdev;
> -    struct net_device *netdev;
> -    struct napi_struct napi;
> -    unsigned int mcastFilterSize;
> -    void * buffer_list_addr;
> -    void * filter_list_addr;
> -    void *tx_ltb_ptr[IBMVETH_MAX_QUEUES];
> -    unsigned int tx_ltb_size;
> -    dma_addr_t tx_ltb_dma[IBMVETH_MAX_QUEUES];
> -    dma_addr_t buffer_list_dma;
> -    dma_addr_t filter_list_dma;
> -    struct ibmveth_buff_pool rx_buff_pool[IBMVETH_NUM_BUFF_POOLS];
> -    struct ibmveth_rx_q rx_queue;
> -    int rx_csum;
> -    int large_send;
> -    bool is_active_trunk;
> -
> -    u64 fw_ipv6_csum_support;
> -    u64 fw_ipv4_csum_support;
> -    u64 fw_large_send_support;
> -    /* adapter specific stats */
> -    u64 replenish_task_cycles;
> -    u64 replenish_no_mem;
> -    u64 replenish_add_buff_failure;
> -    u64 replenish_add_buff_success;
> -    u64 rx_invalid_buffer;
> -    u64 rx_no_buffer;
> -    u64 tx_map_failed;
> -    u64 tx_send_failed;
> -    u64 tx_large_packets;
> -    u64 rx_large_packets;
> -    /* Ethtool settings */
> +	struct vio_dev *vdev;
> +	struct net_device *netdev;
> +	struct napi_struct napi;
> +	unsigned int mcastFilterSize;
> +	void *buffer_list_addr;
> +	void *filter_list_addr;
> +	void *tx_ltb_ptr[IBMVETH_MAX_QUEUES];
> +	unsigned int tx_ltb_size;
> +	dma_addr_t tx_ltb_dma[IBMVETH_MAX_QUEUES];
> +	dma_addr_t buffer_list_dma;
> +	dma_addr_t filter_list_dma;
> +	struct ibmveth_buff_pool rx_buff_pool[IBMVETH_NUM_BUFF_POOLS];
> +	struct ibmveth_rx_q rx_queue;
> +	int rx_csum;
> +	int large_send;
> +	bool is_active_trunk;
> +
> +	u64 fw_ipv6_csum_support;
> +	u64 fw_ipv4_csum_support;
> +	u64 fw_large_send_support;
> +	/* adapter specific stats */
> +	u64 replenish_task_cycles;
> +	u64 replenish_no_mem;
> +	u64 replenish_add_buff_failure;
> +	u64 replenish_add_buff_success;
> +	u64 rx_invalid_buffer;
> +	u64 rx_no_buffer;
> +	u64 tx_map_failed;
> +	u64 tx_send_failed;
> +	u64 tx_large_packets;
> +	u64 rx_large_packets;
> +	/* Ethtool settings */
>  	u8 duplex;
>  	u32 speed;
>  };
> -- 
> 2.49.0

Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>


