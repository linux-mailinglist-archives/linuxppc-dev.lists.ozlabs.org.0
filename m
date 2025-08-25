Return-Path: <linuxppc-dev+bounces-11238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BEEB3398A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 10:40:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9PPs2y0jz3cZQ;
	Mon, 25 Aug 2025 18:40:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756111233;
	cv=none; b=FtCEewRKGAb6BVSN6cp7b6SY9ulxMVMlzzpbNUUVCe9Q5XF5gLoNM9TRqodY/dVZsNRWZKrCHaIrb8NV2wANw0bXbOjOmUBED+PDu+RGfHUAcr2uK4pxMhVskJbs/oDF+PLuZGbhil9eS1KdeuZrPWOyBhxohGOtolvLi7TT9Cahh7qTGIauzOJK56nTbEHbvTHSOYs+Dv2sGGLa5r3KVux5XT5+WwiJeJcasqjnFGdTQ5kS/uu2g998RrYQobPL2HlDxF5MZ3khGivVHLwDryroHXctydoCVQUc0J4OULnx+tQwJVcu4Go/pYI61TcwVK7SLlkctBBw8EuZ/n0yFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756111233; c=relaxed/relaxed;
	bh=e7vQwahY11ISj5PcJy03Z0899Uwx/kdjlsvJ/wzJNU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4Voo3W40UoLV3rFTv33EwF6QljwTQA5RUqUMX2f9JcwTGhhbXG0mDYQY7UP4+Ce0SExhpLYuo2QOeF3ZuJ/5tmdw7M0UtuwQj2RFMO6O0PMhl9VePlkC8oh+3k9AO2NMhcSFZWSLr38TpS+MFsKVx2A2sf/uI9en/b6g4IRUPWq13FZdzrxlYpnGGSK0kvnLb4p8FmebJDKlg+1jrK1RSzDLtqeOy2CM6N4TYqzrw9GmXFZ+HcU2QFRldYNDXBfCF5KLgY92RaE1Tl8sHzEi/YFMkKJMbIDNUlnb1iQ1YNU4/K7APdSIReZaA2e+xRxKyaC4HG4sr/H8ysfRPpHPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WokItgox; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WokItgox;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9PPr3sd7z3cZH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 18:40:32 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMHbgm032447;
	Mon, 25 Aug 2025 08:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=e7vQwahY11ISj5PcJy03Z0899Uwx/kdjlsvJ/wzJNU8=; b=WokItgoxyUmw
	5XWxqGOdxXqRA16UrNvsERaElskedrrhMQVSs6fNkayEG8gg6O3mt3yEyIwNn1Xg
	V+Rqy+4bGFiXnUx26lTSbwGcNEnvsD/zCLti2R2ozygHJ4t7gbYpLBJaglcul507
	d3k1IpR5P2ctePeCtw4YrKZOmq0MS1Q4xQ330QDiznQxehjrwnhM2yHstdfQDDCX
	DQdO8juMTIz4by/3jOlEVHxwerUEYcaxPcKY4Lg0raDpChi1J7DK1dHKEahPvvPC
	rrMjsc7bpKH/cPnjWHaxVvARIbYqsreQtOk1GWIvHoiNAEvoznmMQFsKCRAltYsF
	fhGkWNg5hA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q557qwff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 08:40:24 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57P8eNZg013257;
	Mon, 25 Aug 2025 08:40:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q557qwfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 08:40:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57P66Tx2029957;
	Mon, 25 Aug 2025 08:40:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qsfmcvbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 08:40:22 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57P8eI1q18874670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Aug 2025 08:40:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8869F2004E;
	Mon, 25 Aug 2025 08:40:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62D922004B;
	Mon, 25 Aug 2025 08:40:16 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.213.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 25 Aug 2025 08:40:16 +0000 (GMT)
Date: Mon, 25 Aug 2025 14:10:13 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        msuchanek@suse.de, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com, hbabu@us.ibm.com
Subject: Re: [PATCH v2 9/9] powerpc/pseries: HVPIPE changes to support
 migration
Message-ID: <kcgdolrl7lpou4pw3wkpqmool2l6rk5lpw744w55imqqg5aokf@6tuzttzzvl7c>
Reply-To: mahesh@linux.ibm.com
References: <20250812225715.339225-1-haren@linux.ibm.com>
 <20250812225715.339225-10-haren@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812225715.339225-10-haren@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d1JpDZIUb1OOVtuFFlFiaaACyUd8xk1I
X-Proofpoint-ORIG-GUID: b-tz51Og_gy2CGIW7BhhGRpv3iHLGjes
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX8MUhg6TIuzxA
 tEwXyzmrqWf/xB2eJjv932Q+nIqS5Yr66FZ8TSU/oejbsMIjP14jR+2wbW9OryChHaOWoxv/jqN
 xjRSeQWmScsdh9YcQY2tvK7C81bZnX4B0EHB7hWWrpjcRx1QRMyEYO7n8+EUcs41kC07e/d41sf
 0qpUk03BhA8tqTWARwk0StdsopXW714Az1HYJpmdstJFRY09ODHc9z0IevVA+5CBoyqK1VsaWRq
 RSkI6ViCBK0RSzdmQwBWevVZt1VvUP7k+FexDDZniWa4WKTZ2ZhMYW3Aa0XybvCIwGw73wzpcqO
 pABnj0a1IJbRD+b77kxQcmK1hlS5ynWwB++LDLLGK1AOrMb1AlHbysiT/VOJyyyEijW8oPlyR0A
 64m0n1Dj
X-Authority-Analysis: v=2.4 cv=A8ZsP7WG c=1 sm=1 tr=0 ts=68ac2178 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=3JwC2BzW193u0RwllDUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-08-12 15:57:13 Tue, Haren Myneni wrote:
> The hypervisor assigns one pipe per partition for all sources and
> assigns new pipe after migration. Also the partition ID that is
> used by source as its target ID may be changed after the migration.
> So disable hvpipe during SUSPEND event with ‘hvpipe enable’ system
> parameter value = 0 and enable it after migration during RESUME
> event with  hvpipe enable’ system parameter value = 1.
> 
> The user space calls such as ioctl()/ read() / write() / poll()
> returns  -ENXIO between SUSPEND and RESUME events. The user space
> process can close FD and reestablish connection with new FD after
> migration if needed (Example: source IDs are changed).
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/mobility.c    |  3 +
>  arch/powerpc/platforms/pseries/papr-hvpipe.c | 64 ++++++++++++++++++++
>  arch/powerpc/platforms/pseries/papr-hvpipe.h |  6 ++
>  3 files changed, 73 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> index 62bd8e2d5d4c..95fe802ccdfd 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -28,6 +28,7 @@
>  #include <asm/rtas.h>
>  #include "pseries.h"
>  #include "vas.h"	/* vas_migration_handler() */
> +#include "papr-hvpipe.h"	/* hvpipe_migration_handler() */
>  #include "../../kernel/cacheinfo.h"
>  
>  static struct kobject *mobility_kobj;
> @@ -744,6 +745,7 @@ static int pseries_migrate_partition(u64 handle)
>  	 * by closing VAS windows at the beginning of this function.
>  	 */
>  	vas_migration_handler(VAS_SUSPEND);
> +	hvpipe_migration_handler(HVPIPE_SUSPEND);
>  
>  	ret = wait_for_vasi_session_suspending(handle);
>  	if (ret)
> @@ -770,6 +772,7 @@ static int pseries_migrate_partition(u64 handle)
>  
>  out:
>  	vas_migration_handler(VAS_RESUME);
> +	hvpipe_migration_handler(HVPIPE_RESUME);
>  
>  	return ret;
>  }
> diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> index bc3d1f0b4491..0edc1a29d64d 100644
> --- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> @@ -27,6 +27,7 @@ static unsigned char hvpipe_ras_buf[RTAS_ERROR_LOG_MAX];
>  static struct workqueue_struct *papr_hvpipe_wq;
>  static struct work_struct *papr_hvpipe_work = NULL;
>  static int hvpipe_check_exception_token;
> +static bool hvpipe_feature;
>  
>  /*
>   * New PowerPC FW provides support for partitions and various
> @@ -233,6 +234,12 @@ static ssize_t papr_hvpipe_handle_write(struct file *file,
>  	unsigned long ret, len;
>  	char *area_buf;
>  
> +	/*
> +	 * Return -ENXIO during migration
> +	 */
> +	if (!hvpipe_feature)
> +		return -ENXIO;
> +
>  	if (!src_info)
>  		return -EIO;
>  
> @@ -325,6 +332,12 @@ static ssize_t papr_hvpipe_handle_read(struct file *file,
>  	struct papr_hvpipe_hdr hdr;
>  	long ret;
>  
> +	/*
> +	 * Return -ENXIO during migration
> +	 */
> +	if (!hvpipe_feature)
> +		return -ENXIO;
> +
>  	if (!src_info)
>  		return -EIO;
>  
> @@ -401,6 +414,12 @@ static unsigned int papr_hvpipe_handle_poll(struct file *filp,
>  {
>  	struct hvpipe_source_info *src_info = filp->private_data;
>  
> +	/*
> +	 * Return -ENXIO during migration
> +	 */
> +	if (!hvpipe_feature)
> +		return -ENXIO;
> +
>  	if (!src_info)
>  		return -EIO;
>  
> @@ -530,6 +549,12 @@ static long papr_hvpipe_dev_ioctl(struct file *filp, unsigned int ioctl,
>  	u32 srcID;
>  	long ret;
>  
> +	/*
> +	 * Return -ENXIO during migration
> +	 */
> +	if (!hvpipe_feature)
> +		return -ENXIO;
> +
>  	if (get_user(srcID, argp))
>  		return -EFAULT;
>  
> @@ -688,6 +713,44 @@ static int __init enable_hvpipe_IRQ(void)
>  	return 0;
>  }
>  
> +void hvpipe_migration_handler(int action)
> +{
> +	pr_info("hvpipe migration event %d\n", action);
> +
> +	/*
> +	 * HVPIPE is not used (Failed to create /dev/papr-hvpipe).
> +	 * So nothing to do for migration.
> +	 */
> +	if (!papr_hvpipe_work)
> +		return;
> +
> +	switch (action) {
> +	case HVPIPE_SUSPEND:
> +		if (hvpipe_feature) {
> +			/*
> +			 * Disable hvpipe_feature to the user space.
> +			 * It will be enabled with RESUME event.
> +			 */
> +			hvpipe_feature = false;
> +			/*
> +			 * set system parameter hvpipe 'disable'
> +			 */
> +			set_hvpipe_sys_param(0);
> +		}
> +		break;
> +	case HVPIPE_RESUME:
> +		/*
> +		 * set system parameter hvpipe 'enable'
> +		 */
> +		if (!set_hvpipe_sys_param(1))
> +			hvpipe_feature = true;
> +		else
> +			pr_err("hvpipe is not enabled after migration\n");

So we will end up in else condtion if destination partition does not
have hvpipe capability ?

Thanks,
-Mahesh.

> +
> +		break;
> +	}
> +}
> +
>  static const struct file_operations papr_hvpipe_ops = {
>  	.unlocked_ioctl	=	papr_hvpipe_dev_ioctl,
>  };
> @@ -731,6 +794,7 @@ static int __init papr_hvpipe_init(void)
>  
>  	if (!ret) {
>  		pr_info("hvpipe feature is enabled\n");
> +		hvpipe_feature = true;
>  		return 0;
>  	} else
>  		pr_err("hvpipe feature is not enabled %d\n", ret);
> diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.h b/arch/powerpc/platforms/pseries/papr-hvpipe.h
> index aab7f77e087d..c343f4230865 100644
> --- a/arch/powerpc/platforms/pseries/papr-hvpipe.h
> +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.h
> @@ -11,6 +11,11 @@
>  
>  #define	HVPIPE_HDR_LEN	sizeof(struct papr_hvpipe_hdr)
>  
> +enum hvpipe_migrate_action {
> +	HVPIPE_SUSPEND,
> +	HVPIPE_RESUME,
> +};
> +
>  struct hvpipe_source_info {
>  	struct list_head list;	/* list of sources */
>  	u32 srcID;
> @@ -33,4 +38,5 @@ struct hvpipe_event_buf {
>  				/* with specified src ID */
>  };
>  
> +void hvpipe_migration_handler(int action);
>  #endif /* _PAPR_HVPIPE_H */
> -- 
> 2.43.5
> 
> 

-- 
Mahesh J Salgaonkar

