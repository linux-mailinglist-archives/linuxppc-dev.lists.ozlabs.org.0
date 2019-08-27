Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 775859E7E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 14:30:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hp9b5h35zDqml
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 22:30:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hp6q5FTmzDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 22:27:46 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7RCNFvc145876
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 08:27:42 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2un21epffx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 08:27:42 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 27 Aug 2019 13:27:40 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 27 Aug 2019 13:27:36 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7RCRZXl48300242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 12:27:36 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE46D42042;
 Tue, 27 Aug 2019 12:27:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2C7B42049;
 Tue, 27 Aug 2019 12:27:32 +0000 (GMT)
Received: from [9.109.217.45] (unknown [9.109.217.45])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Aug 2019 12:27:32 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH rebased] powerpc/fadump: when fadump is supported register
 the fadump sysfs files.
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <20190820181211.14694-1-msuchanek@suse.de>
Date: Tue, 27 Aug 2019 17:57:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820181211.14694-1-msuchanek@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082712-0008-0000-0000-0000030DD5DD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082712-0009-0000-0000-00004A2C11ED
Message-Id: <e7fad352-48f3-f01d-1b19-a589a3b95c07@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-27_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908270138
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
Cc: Yangtao Li <tiny.windzz@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Hari Bathini <hbathini@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Michal,

Thanks for the patch. 

On 20/08/19 11:42 PM, Michal Suchanek wrote:
> Currently it is not possible to distinguish the case when fadump is
> supported by firmware and disabled in kernel and completely unsupported
> using the kernel sysfs interface. User can investigate the devicetree
> but it is more reasonable to provide sysfs files in case we get some
> fadumpv2 in the future.
> 
> With this patch sysfs files are available whenever fadump is supported
> by firmware.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> Rebase on top of http://patchwork.ozlabs.org/patch/1150160/
> [v5,31/31] powernv/fadump: support holes in kernel boot memory area
> ---
>  arch/powerpc/kernel/fadump.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4b1bb3c55cf9..7ad424729e9c 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1319,13 +1319,9 @@ static void fadump_init_files(void)
>   */
>  int __init setup_fadump(void)
>  {
> -	if (!fw_dump.fadump_enabled)
> -		return 0;
> -
> -	if (!fw_dump.fadump_supported) {
> +	if (!fw_dump.fadump_supported && fw_dump.fadump_enabled) {
>  		printk(KERN_ERR "Firmware-assisted dump is not supported on"
>  			" this hardware\n");
> -		return 0;
>  	}
>  
>  	fadump_show_config();
> @@ -1333,19 +1329,26 @@ int __init setup_fadump(void)
>  	 * If dump data is available then see if it is valid and prepare for
>  	 * saving it to the disk.
>  	 */
> -	if (fw_dump.dump_active) {
> +	if (fw_dump.fadump_enabled) {
> +		if (fw_dump.dump_active) {
> +			/*
> +			 * if dump process fails then invalidate the
> +			 * registration and release memory before proceeding
> +			 * for re-registration.
> +			 */
> +			if (fw_dump.ops->fadump_process(&fw_dump) < 0)
> +				fadump_invalidate_release_mem();
> +		}
>  		/*
> -		 * if dump process fails then invalidate the registration
> -		 * and release memory before proceeding for re-registration.
> +		 * Initialize the kernel dump memory structure for FAD
> +		 * registration.
>  		 */
> -		if (fw_dump.ops->fadump_process(&fw_dump) < 0)
> -			fadump_invalidate_release_mem();
> -	}
> -	/* Initialize the kernel dump memory structure for FAD registration. */
> -	else if (fw_dump.reserve_dump_area_size)
> -		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
> +		else if (fw_dump.reserve_dump_area_size)
> +			fw_dump.ops->fadump_init_mem_struct(&fw_dump);
>  
> -	fadump_init_files();
> +	}
> +	if (fw_dump.fadump_supported)
> +		fadump_init_files();
>  
>  	return 1;
>  }
> 


Could you please move up fadump_init_files() call and return after it instead of
nesting rest of the function. Also, get rid of the error message when fadump is
not supported as it is already taken care of in fadump_reserve_mem() function.
I mean:

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 2015b1f..0e9b028 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1322,16 +1322,16 @@ static void fadump_init_files(void)
  */
 int __init setup_fadump(void)
 {
-       if (!fw_dump.fadump_enabled)
+       if (!fw_dump.fadump_supported)
                return 0;
 
-       if (!fw_dump.fadump_supported) {
-               printk(KERN_ERR "Firmware-assisted dump is not supported on"
-                       " this hardware\n");
-               return 0;
-       }
+       fadump_init_files();
 
        fadump_show_config();
+
+       if (!fw_dump.fadump_enabled)
+               return 0;
+
        /*
         * If dump data is available then see if it is valid and prepare for
         * saving it to the disk.
@@ -1348,8 +1348,6 @@ int __init setup_fadump(void)
        else if (fw_dump.reserve_dump_area_size)
                fw_dump.ops->fadump_init_mem_struct(&fw_dump);
 
-       fadump_init_files();
-
        return 1;
 }
 subsys_initcall(setup_fadump);


- Hari

