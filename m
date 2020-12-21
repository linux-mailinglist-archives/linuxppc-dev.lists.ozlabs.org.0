Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 210D92DF8DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 06:42:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzpJJ6TxHzDqLM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 16:42:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzpGc6cPZzDqKs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 16:40:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NexIgke5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CzpGc0z8pz9sVk;
 Mon, 21 Dec 2020 16:40:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608529240;
 bh=QZjaGsP20Bc9X9hyCXPWA9UWMoG7P+zj6bb9h8pPwTY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NexIgke5e7rs//whl9xKdvo6hVstOJCOdZN9Gg0GpQNlBPXx7iHEy0qWltWHS1GkJ
 Fx3rS/oAQxRVidn3kxYdLoU8EzrhSdRSfQDj5luRMbzzSIqV3DX0LL/FWNkkuMFPRD
 UynVnXubJwoncvXlb1P0ojUS7TGCmxjUsokTqo50eYCsqpveVH6h5ET71uFDsR2Uix
 v7fHytBqDqqVzWUor7LWNtuSVqqFUxGVyQTAgSLzT9dkJ0YDI3LE6vpDuhVy5L7dYX
 yAztcjA40i0Hwzxlc2T+VVk93IrO8XtluKc001WO6oPynqFdfM1o8faeXF18nERHrG
 3xmKhUT8mLPmQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/perf/hv-24x7: Dont create sysfs event files
 for dummy events
In-Reply-To: <20201218100100.1166111-1-kjain@linux.ibm.com>
References: <20201218100100.1166111-1-kjain@linux.ibm.com>
Date: Mon, 21 Dec 2020 16:40:36 +1100
Message-ID: <87im8vyawb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kjain@linux.ibm.com, suka@us.ibm.com, maddy@linux.vnet.ibm.com,
 atrajeev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kajol Jain <kjain@linux.ibm.com> writes:
> hv_24x7 performance monitoring unit creates list of supported events
> from the event catalog obtained via HCALL. hv_24x7 catalog could also
> contain invalid or dummy events (with names like FREE_* or CPM_FREE_*
> and RESERVED*). These events do not have any hardware counters
> backing them. So patch adds a check to string compare the event names
> to filter out them.
>
> Result in power9 machine:
>
> Before this patch:
> .....
>   hv_24x7/PM_XLINK2_OUT_ODD_CYC,chip=?/              [Kernel PMU event]
>   hv_24x7/PM_XLINK2_OUT_ODD_DATA_COUNT,chip=?/       [Kernel PMU event]
>   hv_24x7/PM_XLINK2_OUT_ODD_TOTAL_UTIL,chip=?/       [Kernel PMU event]
>   hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT,chip=?/         [Kernel PMU event]
>   hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT_MISS,chip=?/    [Kernel PMU event]
>   hv_24x7/PM_XTS_ATSD_SENT,chip=?/                   [Kernel PMU event]
>   hv_24x7/PM_XTS_ATSD_TLBI_RCV,chip=?/               [Kernel PMU event]
>   hv_24x7/RESERVED_NEST1,chip=?/                     [Kernel PMU event]
>   hv_24x7/RESERVED_NEST10,chip=?/                    [Kernel PMU event]
>   hv_24x7/RESERVED_NEST11,chip=?/                    [Kernel PMU event]
>   hv_24x7/RESERVED_NEST12,chip=?/                    [Kernel PMU event]
>   hv_24x7/RESERVED_NEST13,chip=?/                    [Kernel PMU event]
> ......
>
> Dmesg:
> [    0.000362] printk: console [hvc0] enabled
> [    0.815452] hv-24x7: read 1530 catalog entries, created 537 event attrs
> (0 failures), 275 descs
>
> After this patch:
> ......
>   hv_24x7/PM_XLINK2_OUT_ODD_AVLBL_CYC,chip=?/        [Kernel PMU event]
>   hv_24x7/PM_XLINK2_OUT_ODD_CYC,chip=?/              [Kernel PMU event]
>   hv_24x7/PM_XLINK2_OUT_ODD_DATA_COUNT,chip=?/       [Kernel PMU event]
>   hv_24x7/PM_XLINK2_OUT_ODD_TOTAL_UTIL,chip=?/       [Kernel PMU event]
>   hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT,chip=?/         [Kernel PMU event]
>   hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT_MISS,chip=?/    [Kernel PMU event]
>   hv_24x7/PM_XTS_ATSD_SENT,chip=?/                   [Kernel PMU event]
>   hv_24x7/PM_XTS_ATSD_TLBI_RCV,chip=?/               [Kernel PMU event]
>   hv_24x7/TOD,chip=?/                                [Kernel PMU event]
> ......
>
> Demsg:
> [    0.000357] printk: console [hvc0] enabled
> [    0.808592] hv-24x7: read 1530 catalog entries, created 509 event attrs
> (0 failures), 275 descs
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/perf/hv-24x7.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> ---
> Changelog
> v1 -> v2
> - Include "RESERVED*" as part of the invalid event check as
>   suggested by Madhavan Srinivasan
> - Add new helper function "ignore_event" to check invalid/dummy
>   events as suggested by Michael Ellerman
> - Remove pr_info to print each invalid event as suggested by
>   Michael Ellerman
> ---
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 6e7e820508df..1a6004d88f98 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -764,6 +764,16 @@ static ssize_t catalog_event_len_validate(struct hv_24x7_event_data *event,
>  	return ev_len;
>  }
>  
> +/*
> + * Return true incase of invalid or dummy events with names like FREE_* or CPM_FREE_*
> + * and RESERVED*
> + */
> +static bool ignore_event(const char *name)
> +{
> +	return (strstr(name, "FREE_") || !strncmp(name, "RESERVED", 8)) ?
> +			true : false;

That's FREE_ anywhere in the string, which seems a bit loose.

Do we have any documentation or anything that tells us that any event
with "FREE_" in the name will always be invalid?

cheers
