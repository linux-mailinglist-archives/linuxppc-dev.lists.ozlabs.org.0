Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9875AF46A0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 12:44:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478dhc05X2zF6v4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 22:44:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478db23PTtzF6t5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 22:39:09 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA8Bcjxv184702
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 8 Nov 2019 06:39:06 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w57p0r0cg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 06:39:06 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hbathini@linux.ibm.com>;
 Fri, 8 Nov 2019 11:39:04 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 8 Nov 2019 11:39:01 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xA8BcP8R38994364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Nov 2019 11:38:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0B8E11C05C;
 Fri,  8 Nov 2019 11:39:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2D7311C04A;
 Fri,  8 Nov 2019 11:38:59 +0000 (GMT)
Received: from [9.184.183.121] (unknown [9.184.183.121])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  8 Nov 2019 11:38:59 +0000 (GMT)
Subject: Re: [PATCH v3] powerpc/fadump: when fadump is supported register the
 fadump sysfs files.
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <20191023175651.24833-1-msuchanek@suse.de>
 <20191107164757.15140-1-msuchanek@suse.de>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Fri, 8 Nov 2019 17:08:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107164757.15140-1-msuchanek@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19110811-0012-0000-0000-00000361DDEF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110811-0013-0000-0000-0000219D424D
Message-Id: <119d91aa-57d4-00db-054c-60769b309c8d@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-08_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911080114
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/11/19 10:17 PM, Michal Suchanek wrote:
> Currently it is not possible to distinguish the case when fadump is
> supported by firmware and disabled in kernel and completely unsupported
> using the kernel sysfs interface. User can investigate the devicetree
> but it is more reasonable to provide sysfs files in case we get some
> fadumpv2 in the future.
> 
> With this patch sysfs files are available whenever fadump is supported
> by firmware.
> 
> There is duplicate message about lack of support by firmware in
> fadump_reserve_mem and setup_fadump. Remove the duplicate message in
> setup_fadump.

Thanks for doing this, Michal.
Exporting the node will be helpful in finding if FADump is supported,
given FADump is now supported on two different platforms...

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v2: move the sysfs initialization earlier to avoid condition nesting
> v3: remove duplicate message
> ---
>  arch/powerpc/kernel/fadump.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index ed59855430b9..ff0114aeba9b 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1466,16 +1466,15 @@ static void fadump_init_files(void)
>   */
>  int __init setup_fadump(void)
>  {
> -	if (!fw_dump.fadump_enabled)
> -		return 0;
> -
> -	if (!fw_dump.fadump_supported) {
> -		printk(KERN_ERR "Firmware-assisted dump is not supported on"
> -			" this hardware\n");
> +	if (!fw_dump.fadump_supported)
>  		return 0;
> -	}
>  
> +	fadump_init_files();
>  	fadump_show_config();
> +
> +	if (!fw_dump.fadump_enabled)
> +		return 1;
> +
>  	/*
>  	 * If dump data is available then see if it is valid and prepare for
>  	 * saving it to the disk.
> @@ -1492,8 +1491,6 @@ int __init setup_fadump(void)
>  	else if (fw_dump.reserve_dump_area_size)
>  		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
>  
> -	fadump_init_files();
> -
>  	return 1;
>  }
>  subsys_initcall(setup_fadump);
> 

-- 
- Hari

