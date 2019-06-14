Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1C045793
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 10:34:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QDRQ6ZYLzDrPV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 18:34:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QDPc3G5PzDrPP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 18:32:35 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5E8MQfB041267
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 04:32:31 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t4775abbj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 04:32:31 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Fri, 14 Jun 2019 09:22:22 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Jun 2019 09:22:20 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5E8MJOl28901578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2019 08:22:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C83264C04A;
 Fri, 14 Jun 2019 08:22:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 303A74C044;
 Fri, 14 Jun 2019 08:22:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jun 2019 08:22:19 +0000 (GMT)
Received: from [9.81.220.157] (unknown [9.81.220.157])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 332D4A00EF;
 Fri, 14 Jun 2019 18:22:17 +1000 (AEST)
Subject: Re: [PATCH v2] cxl: no need to check return value of debugfs_create
 functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
References: <20190612155418.GB22739@kroah.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 14 Jun 2019 18:22:16 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612155418.GB22739@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19061408-0028-0000-0000-0000037A3990
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061408-0029-0000-0000-0000243A3557
Message-Id: <f50e9ed3-6d05-349a-c653-7ac7b1de3490@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-14_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906140069
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/6/19 1:54 am, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Because there's no need to check, also make the return value of the
> local debugfs_create_io_x64() call void, as no one ever did anything
> with the return value (as they did not need to.)
> 
> And make the cxl_debugfs_* calls return void as no one was even checking
> their return value at all.
> 
> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> v2: make the return value of all of the cxl_debugfs_* calls void as no
>      one was checking the return values of them.
> 
>   drivers/misc/cxl/cxl.h     | 15 ++++++---------
>   drivers/misc/cxl/debugfs.c | 36 +++++++++++-------------------------
>   2 files changed, 17 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/misc/cxl/cxl.h b/drivers/misc/cxl/cxl.h
> index a73c9e669d78..5dc0f6093f9d 100644
> --- a/drivers/misc/cxl/cxl.h
> +++ b/drivers/misc/cxl/cxl.h
> @@ -908,11 +908,11 @@ void cxl_update_dedicated_ivtes_psl8(struct cxl_context *ctx);
>   
>   #ifdef CONFIG_DEBUG_FS
>   
> -int cxl_debugfs_init(void);
> +void cxl_debugfs_init(void);
>   void cxl_debugfs_exit(void);
> -int cxl_debugfs_adapter_add(struct cxl *adapter);
> +void cxl_debugfs_adapter_add(struct cxl *adapter);
>   void cxl_debugfs_adapter_remove(struct cxl *adapter);
> -int cxl_debugfs_afu_add(struct cxl_afu *afu);
> +void cxl_debugfs_afu_add(struct cxl_afu *afu);
>   void cxl_debugfs_afu_remove(struct cxl_afu *afu);
>   void cxl_debugfs_add_adapter_regs_psl9(struct cxl *adapter, struct dentry *dir);
>   void cxl_debugfs_add_adapter_regs_psl8(struct cxl *adapter, struct dentry *dir);
> @@ -921,27 +921,24 @@ void cxl_debugfs_add_afu_regs_psl8(struct cxl_afu *afu, struct dentry *dir);
>   
>   #else /* CONFIG_DEBUG_FS */
>   
> -static inline int __init cxl_debugfs_init(void)
> +static inline void __init cxl_debugfs_init(void)
>   {
> -	return 0;
>   }
>   
>   static inline void cxl_debugfs_exit(void)
>   {
>   }
>   
> -static inline int cxl_debugfs_adapter_add(struct cxl *adapter)
> +static inline void cxl_debugfs_adapter_add(struct cxl *adapter)
>   {
> -	return 0;
>   }
>   
>   static inline void cxl_debugfs_adapter_remove(struct cxl *adapter)
>   {
>   }
>   
> -static inline int cxl_debugfs_afu_add(struct cxl_afu *afu)
> +static inline void cxl_debugfs_afu_add(struct cxl_afu *afu)
>   {
> -	return 0;
>   }
>   
>   static inline void cxl_debugfs_afu_remove(struct cxl_afu *afu)
> diff --git a/drivers/misc/cxl/debugfs.c b/drivers/misc/cxl/debugfs.c
> index 1fda22c24c93..7b987bf498b5 100644
> --- a/drivers/misc/cxl/debugfs.c
> +++ b/drivers/misc/cxl/debugfs.c
> @@ -26,11 +26,11 @@ static int debugfs_io_u64_set(void *data, u64 val)
>   DEFINE_DEBUGFS_ATTRIBUTE(fops_io_x64, debugfs_io_u64_get, debugfs_io_u64_set,
>   			 "0x%016llx\n");
>   
> -static struct dentry *debugfs_create_io_x64(const char *name, umode_t mode,
> -					    struct dentry *parent, u64 __iomem *value)
> +static void debugfs_create_io_x64(const char *name, umode_t mode,
> +				  struct dentry *parent, u64 __iomem *value)
>   {
> -	return debugfs_create_file_unsafe(name, mode, parent,
> -					  (void __force *)value, &fops_io_x64);
> +	debugfs_create_file_unsafe(name, mode, parent, (void __force *)value,
> +				   &fops_io_x64);
>   }
>   
>   void cxl_debugfs_add_adapter_regs_psl9(struct cxl *adapter, struct dentry *dir)
> @@ -54,25 +54,22 @@ void cxl_debugfs_add_adapter_regs_psl8(struct cxl *adapter, struct dentry *dir)
>   	debugfs_create_io_x64("trace", S_IRUSR | S_IWUSR, dir, _cxl_p1_addr(adapter, CXL_PSL_TRACE));
>   }
>   
> -int cxl_debugfs_adapter_add(struct cxl *adapter)
> +void cxl_debugfs_adapter_add(struct cxl *adapter)
>   {
>   	struct dentry *dir;
>   	char buf[32];
>   
>   	if (!cxl_debugfs)
> -		return -ENODEV;
> +		return;
>   
>   	snprintf(buf, 32, "card%i", adapter->adapter_num);
>   	dir = debugfs_create_dir(buf, cxl_debugfs);
> -	if (IS_ERR(dir))
> -		return PTR_ERR(dir);
>   	adapter->debugfs = dir;
>   
>   	debugfs_create_io_x64("err_ivte", S_IRUSR, dir, _cxl_p1_addr(adapter, CXL_PSL_ErrIVTE));
>   
>   	if (adapter->native->sl_ops->debugfs_add_adapter_regs)
>   		adapter->native->sl_ops->debugfs_add_adapter_regs(adapter, dir);
> -	return 0;
>   }
>   
>   void cxl_debugfs_adapter_remove(struct cxl *adapter)
> @@ -96,18 +93,16 @@ void cxl_debugfs_add_afu_regs_psl8(struct cxl_afu *afu, struct dentry *dir)
>   	debugfs_create_io_x64("trace", S_IRUSR | S_IWUSR, dir, _cxl_p1n_addr(afu, CXL_PSL_SLICE_TRACE));
>   }
>   
> -int cxl_debugfs_afu_add(struct cxl_afu *afu)
> +void cxl_debugfs_afu_add(struct cxl_afu *afu)
>   {
>   	struct dentry *dir;
>   	char buf[32];
>   
>   	if (!afu->adapter->debugfs)
> -		return -ENODEV;
> +		return;
>   
>   	snprintf(buf, 32, "psl%i.%i", afu->adapter->adapter_num, afu->slice);
>   	dir = debugfs_create_dir(buf, afu->adapter->debugfs);
> -	if (IS_ERR(dir))
> -		return PTR_ERR(dir);
>   	afu->debugfs = dir;
>   
>   	debugfs_create_io_x64("sr",         S_IRUSR, dir, _cxl_p1n_addr(afu, CXL_PSL_SR_An));
> @@ -118,8 +113,6 @@ int cxl_debugfs_afu_add(struct cxl_afu *afu)
>   
>   	if (afu->adapter->native->sl_ops->debugfs_add_afu_regs)
>   		afu->adapter->native->sl_ops->debugfs_add_afu_regs(afu, dir);
> -
> -	return 0;
>   }
>   
>   void cxl_debugfs_afu_remove(struct cxl_afu *afu)
> @@ -127,19 +120,12 @@ void cxl_debugfs_afu_remove(struct cxl_afu *afu)
>   	debugfs_remove_recursive(afu->debugfs);
>   }
>   
> -int __init cxl_debugfs_init(void)
> +void __init cxl_debugfs_init(void)
>   {
> -	struct dentry *ent;
> -
>   	if (!cpu_has_feature(CPU_FTR_HVMODE))
> -		return 0;
> -
> -	ent = debugfs_create_dir("cxl", NULL);
> -	if (IS_ERR(ent))
> -		return PTR_ERR(ent);
> -	cxl_debugfs = ent;
> +		return;
>   
> -	return 0;
> +	cxl_debugfs = debugfs_create_dir("cxl", NULL);
>   }
>   
>   void cxl_debugfs_exit(void)
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

