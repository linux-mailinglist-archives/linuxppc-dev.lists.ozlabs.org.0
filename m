Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 694C51EDFA3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 10:17:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49czD02HB7zDq77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 18:17:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cz8t4RmrzDqnM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 18:14:54 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05480krg021845
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Jun 2020 04:14:51 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31eq3nspyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jun 2020 04:14:50 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0548BqhZ015707
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Jun 2020 08:14:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 31bf47bvrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jun 2020 08:14:49 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0548Ekba37421112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jun 2020 08:14:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CE29A4054;
 Thu,  4 Jun 2020 08:14:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB748A405B;
 Thu,  4 Jun 2020 08:14:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Jun 2020 08:14:45 +0000 (GMT)
Received: from [9.206.169.223] (unknown [9.206.169.223])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 18FD4A01A8;
 Thu,  4 Jun 2020 18:14:44 +1000 (AEST)
Subject: Re: [PATCH v4] ocxl: control via sysfs whether the FPGA is reloaded
 on a link reset
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 clombard@linux.ibm.com, alastair@au1.ibm.com
References: <20200330083422.34230-1-fbarrat@linux.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <81b3446e-5547-220f-c167-6f79bcde9b0d@linux.ibm.com>
Date: Thu, 4 Jun 2020 18:14:43 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330083422.34230-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_04:2020-06-02,
 2020-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 cotscore=-2147483648 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006040052
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
Cc: felix@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30/3/20 7:34 pm, Frederic Barrat wrote:
> From: Philippe Bergheaud <felix@linux.ibm.com>
> 
> Some opencapi FPGA images allow to control if the FPGA should be reloaded
> on the next adapter reset. If it is supported, the image specifies it
> through a Vendor Specific DVSEC in the config space of function 0.
> 
> Signed-off-by: Philippe Bergheaud <felix@linux.ibm.com>
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Thanks for the cleanups.

My earlier concerns have been addressed thanks to an update to the 
relevant specification - a Vendor Specific DVSEC with an IBM vendor ID 
and IBM-specific DVSEC ID is specific to the IBM CFG subsystem 
implementation, alternative implementations will need to use a different 
vendor IDs and DVSEC IDs.

> ---
> 
> Changelog:
> v2:
>    - refine ResetReload debug message
>    - do not call get_function_0() if pci_dev is for function 0
> v3:
>    - avoid get_function_0() in ocxl_config_set_reset_reload also
> v4:
>    - simplify parsing of Vendor Specific DVSEC during AFU init
>    - only set/unset bit 0 of the config space register
>    - commonize code to fetch the right PCI function and DVSEC offset
>    - use kstrtoint() when parsing the sysfs buffer
> 
> 
>   Documentation/ABI/testing/sysfs-class-ocxl | 10 +++
>   drivers/misc/ocxl/config.c                 | 81 ++++++++++++++++++++--
>   drivers/misc/ocxl/ocxl_internal.h          |  6 ++
>   drivers/misc/ocxl/sysfs.c                  | 35 ++++++++++
>   include/misc/ocxl-config.h                 |  1 +
>   5 files changed, 128 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-ocxl b/Documentation/ABI/testing/sysfs-class-ocxl
> index b5b1fa197592..b9ea671d5805 100644
> --- a/Documentation/ABI/testing/sysfs-class-ocxl
> +++ b/Documentation/ABI/testing/sysfs-class-ocxl
> @@ -33,3 +33,13 @@ Date:		January 2018
>   Contact:	linuxppc-dev@lists.ozlabs.org
>   Description:	read/write
>   		Give access the global mmio area for the AFU
> +
> +What:		/sys/class/ocxl/<afu name>/reload_on_reset
> +Date:		February 2020
> +Contact:	linuxppc-dev@lists.ozlabs.org
> +Description:	read/write
> +		Control whether the FPGA is reloaded on a link reset
> +			0	Do not reload FPGA image from flash
> +			1	Reload FPGA image from flash
> +			unavailable
> +				The device does not support this capability

We should perhaps document here that this is specific to the IBM CFG 
implementation and the IBM-specific DVSEC?

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
