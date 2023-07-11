Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 792A374F965
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 22:57:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PH/POPXe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0tTq2llpz3bxY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 06:57:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PH/POPXe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0tSz1Qtjz3bjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 06:56:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=orypT0PcLMcwunRr7HJCTZt2dNcjGKOQN6brONjfzCg=; b=PH/POPXe6NnDn2Nge+dfFAM9Li
	s0rRpQu09mpPbgWcpJWSDm5X6DIvk/uiqcb3ZWQwSbN6WP5huFBN72CGNChs3s8TfyrXxNMmKFAXd
	i03CK/J79nfBdk+Wy8tJ807VEoFE5fI0V5QdsLM29AIEWnoc8eDr+ZRyWFURbHyTHwHI63jZbhP+i
	bO2um614jE5ddwZiED7Wp0wqqK5GodGjt9F1DhnFw9qINeSieP7/I80HQbNlkIILSnJHM6EfU1OmE
	B7JLvfJEXNBhxKuL08z26kG24DdqnSAY7PVJMGL1nEAjRtLGZzqjRcHRDzCLHPPYCRxqtDHuvRtdE
	VRexneBg==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qJKP9-00FsQb-2Z;
	Tue, 11 Jul 2023 20:56:15 +0000
Message-ID: <38d8820d-4ca0-0bf1-b707-94b850b08241@infradead.org>
Date: Tue, 11 Jul 2023 13:56:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 06/10] docs: ABI:
 sysfs-bus-event_source-devices-hv_gpci: Document
 affinity_domain_via_virtual_processor sysfs interface file
Content-Language: en-US
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20230710092717.55317-1-kjain@linux.ibm.com>
 <20230710092717.55317-7-kjain@linux.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230710092717.55317-7-kjain@linux.ibm.com>
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

Hi--

On 7/10/23 02:27, Kajol Jain wrote:
> Add details of the new hv-gpci interface file called
> "affinity_domain_via_virtual_processor" in the ABI documentation.
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  .../sysfs-bus-event_source-devices-hv_gpci    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
> index aff52dc3b05c..3b63d66658fe 100644
> --- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
> +++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
> @@ -144,3 +144,35 @@ Description:	admin read only
>  			   more information.
>  
>  		* "-EFBIG" : System information exceeds PAGE_SIZE.
> +
> +What:		/sys/devices/hv_gpci/interface/affinity_domain_via_virtual_processor
> +Date:		July 2023
> +Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
> +Description:	admin read only
> +		This sysfs file exposes the system topology information by making HCALL
> +		H_GET_PERF_COUNTER_INFO. The HCALL is made with counter request value
> +		AFFINITY_DOMAIN_INFORMATION_BY_VIRTUAL_PROCESSOR(0xA0).
> +
> +		* This sysfs file will be created only for power10 and above platforms.
> +
> +		* User needs root privileges to read data from this sysfs file.
> +
> +		* This sysfs file will be created, only when the HCALL returns "H_SUCESS",

		                                                                H_SUCCESS

> +		  "H_AUTHORITY" and "H_PARAMETER" as the return type.

		            s/and/or/

> +
> +		  HCALL with return error type "H_AUTHORITY", can be resolved during

		Drop the comma:                             ^

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

			                                      Refer to

> +			   more information.
> +
> +		* "-EFBIG" : System information exceeds PAGE_SIZE.

-- 
~Randy
