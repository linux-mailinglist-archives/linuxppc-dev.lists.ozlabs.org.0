Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E08A0D71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 00:18:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JgBH3mWrzDqhN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 08:18:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jg5f5KMRzDrHl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 08:14:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46Jg5f4Nslz8svv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 08:14:46 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46Jg5f3XDcz9sNk; Thu, 29 Aug 2019 08:14:46 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46Jg5d6VcZz9sNC;
 Thu, 29 Aug 2019 08:14:45 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7SMCFti141128; Wed, 28 Aug 2019 18:14:42 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2umpb3pwb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 18:14:42 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7SM9gGW025044;
 Wed, 28 Aug 2019 22:14:41 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 2umpctm8aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 22:14:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7SMEeMM36438328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Aug 2019 22:14:40 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BD7FAC12C;
 Wed, 28 Aug 2019 22:14:40 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B973AC12F;
 Wed, 28 Aug 2019 22:14:39 +0000 (GMT)
Received: from [9.85.164.95] (unknown [9.85.164.95])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 28 Aug 2019 22:14:39 +0000 (GMT)
Subject: Re: [PATCH v4 2/2] powerpc/powernv: Add ultravisor message log
 interface
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20190828130521.26764-1-mpe@ellerman.id.au>
 <20190828130521.26764-2-mpe@ellerman.id.au>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Message-ID: <7951421b-8f0b-54a9-a32c-7f482bab7cb2@linux.ibm.com>
Date: Wed, 28 Aug 2019 19:14:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190828130521.26764-2-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-28_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908280214
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/28/19 10:05 AM, Michael Ellerman wrote:
> From: Claudio Carvalho <cclaudio@linux.ibm.com>
>
> The ultravisor (UV) provides an in-memory console which follows the
> OPAL in-memory console structure.
>
> This patch extends the OPAL msglog code to initialize the UV memory
> console and provide the "/sys/firmware/ultravisor/msglog" interface
> for userspace to view the UV message log.

Tested-by: Claudio Carvalho <cclaudio@linux.ibm.com>

Thanks,
Claudio

>
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
> v4: mpe: Move all the code into ultravisor.c.
>     Consistently use "uv_" as the prefix not "ultra_".
>     Use powernv.h for routines that are shared within the platform.
>     Rather than bloating the kernel with strings for every rare error
>     case, return error codes from the init routine which can be
>     seen with initcall_debug.
> ---
>  arch/powerpc/platforms/powernv/powernv.h    |  5 +++
>  arch/powerpc/platforms/powernv/ultravisor.c | 45 +++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>
> diff --git a/arch/powerpc/platforms/powernv/powernv.h b/arch/powerpc/platforms/powernv/powernv.h
> index fd4a1c5a6369..1aa51c4fa904 100644
> --- a/arch/powerpc/platforms/powernv/powernv.h
> +++ b/arch/powerpc/platforms/powernv/powernv.h
> @@ -30,4 +30,9 @@ extern void opal_event_shutdown(void);
>  
>  bool cpu_core_split_required(void);
>  
> +struct memcons;
> +ssize_t memcons_copy(struct memcons *mc, char *to, loff_t pos, size_t count);
> +u32 memcons_get_size(struct memcons *mc);
> +struct memcons *memcons_init(struct device_node *node, const char *mc_prop_name);
> +
>  #endif /* _POWERNV_H */
> diff --git a/arch/powerpc/platforms/powernv/ultravisor.c b/arch/powerpc/platforms/powernv/ultravisor.c
> index 02ac57b4bded..e4a00ad06f9d 100644
> --- a/arch/powerpc/platforms/powernv/ultravisor.c
> +++ b/arch/powerpc/platforms/powernv/ultravisor.c
> @@ -8,9 +8,15 @@
>  #include <linux/init.h>
>  #include <linux/printk.h>
>  #include <linux/of_fdt.h>
> +#include <linux/of.h>
>  
>  #include <asm/ultravisor.h>
>  #include <asm/firmware.h>
> +#include <asm/machdep.h>
> +
> +#include "powernv.h"
> +
> +static struct kobject *ultravisor_kobj;
>  
>  int __init early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
>  					 int depth, void *data)
> @@ -22,3 +28,42 @@ int __init early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
>  	pr_debug("Ultravisor detected!\n");
>  	return 1;
>  }
> +
> +static struct memcons *uv_memcons;
> +
> +static ssize_t uv_msglog_read(struct file *file, struct kobject *kobj,
> +			      struct bin_attribute *bin_attr, char *to,
> +			      loff_t pos, size_t count)
> +{
> +	return memcons_copy(uv_memcons, to, pos, count);
> +}
> +
> +static struct bin_attribute uv_msglog_attr = {
> +	.attr = {.name = "msglog", .mode = 0400},
> +	.read = uv_msglog_read
> +};
> +
> +static int __init uv_init(void)
> +{
> +	struct device_node *node;
> +
> +	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
> +		return 0;
> +
> +	node = of_find_compatible_node(NULL, NULL, "ibm,uv-firmware");
> +	if (!node)
> +		return -ENODEV;
> +
> +	uv_memcons = memcons_init(node, "memcons");
> +	if (!uv_memcons)
> +		return -ENOENT;
> +
> +	uv_msglog_attr.size = memcons_get_size(uv_memcons);
> +
> +	ultravisor_kobj = kobject_create_and_add("ultravisor", firmware_kobj);
> +	if (!ultravisor_kobj)
> +		return -ENOMEM;
> +
> +	return sysfs_create_bin_file(ultravisor_kobj, &uv_msglog_attr);
> +}
> +machine_subsys_initcall(powernv, uv_init);
