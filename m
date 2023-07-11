Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C952E74F97E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 22:59:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4p5xsTNC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0tXV53Gjz3c2y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 06:59:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4p5xsTNC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0tWf2j6qz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 06:58:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rvBE/i08FfMYAkT+V0OyrDavW6AmKWCwVooJMa1NWhU=; b=4p5xsTNCjZeB0MLgVViGjfib6o
	H+Ca9BNAFsJo1ZR34Dfpq0fJ5dE6ApwB87J+2Ie8nm+sF2M/fR9Bbb0mBQffnqfY/IshaGCO69Mte
	+J8BPepw6klMmA4+eK2NwPRBY9OOrvsC0Bf/J66iBcmr3EZij+4ASbKsKVxv0BvRGI+QG4FHP91WB
	yr+NL1IssqNpyn00vSYcItSiTktTIw7+UK0MLrJsUGI/TOO+kcYpGZPUzgEAWqeQ31WxQ1flDnsUY
	1Nm7W28fC2RNwFj3xbVeqTAVzZhwBckFKrK0Z1ENMPHEDB8qVt5SWIHDIq9UkXih0OfxTFMZjIlrg
	ivhNOhhQ==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qJKRP-00Fskt-04;
	Tue, 11 Jul 2023 20:58:35 +0000
Message-ID: <1fa020d1-1f4f-a6cf-7800-403264d38048@infradead.org>
Date: Tue, 11 Jul 2023 13:58:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 10/10] docs: ABI:
 sysfs-bus-event_source-devices-hv_gpci: Document
 affinity_domain_via_partition sysfs interface file
Content-Language: en-US
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20230710092717.55317-1-kjain@linux.ibm.com>
 <20230710092717.55317-11-kjain@linux.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230710092717.55317-11-kjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: atrajeev@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Same correction comments as in the other 4 patches (not repeated here).


On 7/10/23 02:27, Kajol Jain wrote:
> Add details of the new hv-gpci interface file called
> "affinity_domain_via_partition" in the ABI documentation.
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  .../sysfs-bus-event_source-devices-hv_gpci    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
> index d8e65b93d1f7..b03b2bd4b081 100644
> --- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
> +++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
> @@ -208,3 +208,35 @@ Description:	admin read only
>  			   more information.
>  
>  		* "-EFBIG" : System information exceeds PAGE_SIZE.
> +
> +What:		/sys/devices/hv_gpci/interface/affinity_domain_via_partition
> +Date:		July 2023
> +Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
> +Description:	admin read only
> +		This sysfs file exposes the system topology information by making HCALL
> +		H_GET_PERF_COUNTER_INFO. The HCALL is made with counter request value
> +		AFFINITY_DOMAIN_INFORMATION_BY_PARTITION(0xB1).
> +
> +		* This sysfs file will be created only for power10 and above platforms.
> +
> +		* User needs root privileges to read data from this sysfs file.
> +
> +		* This sysfs file will be created, only when the HCALL returns "H_SUCESS",
> +		  "H_AUTHORITY" and "H_PARAMETER" as the return type.
> +
> +		  HCALL with return error type "H_AUTHORITY", can be resolved during
> +		  runtime by setting "Enable Performance Information Collection" option.
> +
> +		* The end user reading this sysfs file must decode the content as per
> +		  underlying platform/firmware.
> +
> +		Possible error codes while reading this sysfs file:
> +
> +		* "-EPERM" : Partition is not permitted to retrieve performance information,
> +			    required to set "Enable Performance Information Collection" option.
> +
> +		* "-EIO" : Can't retrieve system information because of invalid buffer length/invalid address
> +			   or because of some hardware error. Refer getPerfCountInfo documentation for
> +			   more information.
> +
> +		* "-EFBIG" : System information exceeds PAGE_SIZE.

-- 
~Randy
