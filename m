Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0CF679E6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:19:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1XGf0gfLz3cdq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 03:19:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=krfRO5ZA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=krfRO5ZA;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1XFj3GdLz2xVY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 03:18:16 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OEvDEp017633;
	Tue, 24 Jan 2023 16:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=gMqkO0XjdlZ4v7V3GEYXUu/VXYUWJwplOGGXyp0cRNs=;
 b=krfRO5ZAxb9O2Z3v8zVj9DwmpekZHcxs1i899eqV7M+WPG9Gnk8+raLVKnSMeXteDLdv
 8ozQGGVglG962vd+eHp/k4uZt2ZszHMtRmB8QpGz5icbgcwhTDmDHsYqri/SEYJqZaju
 rY/psABrLFUaVY+0qzsGua3G54b0p6mnj1TMvcrMXWHxiGg6uDoK/FSwMnjEudJzUZxY
 SpWbDgwMuuNP4BVQl6ZNGoFpld/WeSnSsrIQL0fiAyc3CgQ4bJxuNkiTMQWBPtCoZFAF
 rDLWUyVIYSdFDkhiuvL+8gOw9Lnvos6YtzY41guPTqnmSzXteL6oFIyAsHqfReNO5gOq wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3naarucjvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 16:18:10 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30ODuQqt019323;
	Tue, 24 Jan 2023 16:18:09 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3naarucjv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 16:18:09 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30O559bJ027489;
	Tue, 24 Jan 2023 16:18:07 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3n87p6c1qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 16:18:07 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30OGI4YX18415930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 16:18:04 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E690920040;
	Tue, 24 Jan 2023 16:18:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7510320043;
	Tue, 24 Jan 2023 16:18:03 +0000 (GMT)
Received: from [9.171.38.38] (unknown [9.171.38.38])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Jan 2023 16:18:03 +0000 (GMT)
Message-ID: <0c8d6649-4aef-5f00-3358-54ad9f459e67@linux.ibm.com>
Date: Tue, 24 Jan 2023 17:18:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/4] powerpc/rtas: make all exports GPL
Content-Language: fr
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20230124140448.45938-1-nathanl@linux.ibm.com>
 <20230124140448.45938-3-nathanl@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20230124140448.45938-3-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k2O8Yc1ONrh4RJRgCBK0F2CP7gfsMaqK
X-Proofpoint-ORIG-GUID: zB3-7qRRHw5LY0SIX_Vmt14iYHJa2mdx
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240146
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/01/2023 15:04:46, Nathan Lynch wrote:
> The first symbol exports of RTAS functions and data came with the (now
> removed) scanlog driver in 2003:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=f92e361842d5251e50562b09664082dcbd0548bb
> 
> At the time this was applied, EXPORT_SYMBOL_GPL() was very new, and
> the exports of rtas_call() etc have remained non-GPL. As new APIs have
> been added to the RTAS subsystem, their symbol exports have followed
> the convention set by existing code.
> 
> However, the historical evidence is that RTAS function exports have
> been added over time only to satisfy the needs of in-kernel users, and
> these clients must have fairly intimate knowledge of how the APIs work
> to use them safely. No out of tree users are known, and future ones
> seem unlikely.
> 
> Arguably the default for RTAS symbols should have become
> EXPORT_SYMBOL_GPL once it was available. Let's make it so now, and
> exceptions can be evaluated as needed.

I also think this is unlikely to happen. But in the case a non GPL driver
needs one of this symbol, I guess it will be hard to move backward once it
is upstream. Crossing fingers!

Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>

> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 6c5716b19d69..e60e2f5af7b9 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -65,10 +65,10 @@ struct rtas_t rtas = {
>  };
>  
>  DEFINE_SPINLOCK(rtas_data_buf_lock);
> -EXPORT_SYMBOL(rtas_data_buf_lock);
> +EXPORT_SYMBOL_GPL(rtas_data_buf_lock);
>  
>  char rtas_data_buf[RTAS_DATA_BUF_SIZE] __cacheline_aligned;
> -EXPORT_SYMBOL(rtas_data_buf);
> +EXPORT_SYMBOL_GPL(rtas_data_buf);
>  
>  unsigned long rtas_rmo_buf;
>  
> @@ -77,7 +77,7 @@ unsigned long rtas_rmo_buf;
>   * This is done like this so rtas_flash can be a module.
>   */
>  void (*rtas_flash_term_hook)(int);
> -EXPORT_SYMBOL(rtas_flash_term_hook);
> +EXPORT_SYMBOL_GPL(rtas_flash_term_hook);
>  
>  /* RTAS use home made raw locking instead of spin_lock_irqsave
>   * because those can be called from within really nasty contexts
> @@ -325,7 +325,7 @@ void rtas_progress(char *s, unsigned short hex)
>   
>  	spin_unlock(&progress_lock);
>  }
> -EXPORT_SYMBOL(rtas_progress);		/* needed by rtas_flash module */
> +EXPORT_SYMBOL_GPL(rtas_progress);		/* needed by rtas_flash module */
>  
>  int rtas_token(const char *service)
>  {
> @@ -335,13 +335,13 @@ int rtas_token(const char *service)
>  	tokp = of_get_property(rtas.dev, service, NULL);
>  	return tokp ? be32_to_cpu(*tokp) : RTAS_UNKNOWN_SERVICE;
>  }
> -EXPORT_SYMBOL(rtas_token);
> +EXPORT_SYMBOL_GPL(rtas_token);
>  
>  int rtas_service_present(const char *service)
>  {
>  	return rtas_token(service) != RTAS_UNKNOWN_SERVICE;
>  }
> -EXPORT_SYMBOL(rtas_service_present);
> +EXPORT_SYMBOL_GPL(rtas_service_present);
>  
>  #ifdef CONFIG_RTAS_ERROR_LOGGING
>  
> @@ -356,7 +356,7 @@ int rtas_get_error_log_max(void)
>  {
>  	return rtas_error_log_max;
>  }
> -EXPORT_SYMBOL(rtas_get_error_log_max);
> +EXPORT_SYMBOL_GPL(rtas_get_error_log_max);
>  
>  static void __init init_error_log_max(void)
>  {
> @@ -584,7 +584,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
>  	}
>  	return ret;
>  }
> -EXPORT_SYMBOL(rtas_call);
> +EXPORT_SYMBOL_GPL(rtas_call);
>  
>  /**
>   * rtas_busy_delay_time() - From an RTAS status value, calculate the
> @@ -622,7 +622,7 @@ unsigned int rtas_busy_delay_time(int status)
>  
>  	return ms;
>  }
> -EXPORT_SYMBOL(rtas_busy_delay_time);
> +EXPORT_SYMBOL_GPL(rtas_busy_delay_time);
>  
>  /**
>   * rtas_busy_delay() - helper for RTAS busy and extended delay statuses
> @@ -696,7 +696,7 @@ bool rtas_busy_delay(int status)
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(rtas_busy_delay);
> +EXPORT_SYMBOL_GPL(rtas_busy_delay);
>  
>  static int rtas_error_rc(int rtas_rc)
>  {
> @@ -741,7 +741,7 @@ int rtas_get_power_level(int powerdomain, int *level)
>  		return rtas_error_rc(rc);
>  	return rc;
>  }
> -EXPORT_SYMBOL(rtas_get_power_level);
> +EXPORT_SYMBOL_GPL(rtas_get_power_level);
>  
>  int rtas_set_power_level(int powerdomain, int level, int *setlevel)
>  {
> @@ -759,7 +759,7 @@ int rtas_set_power_level(int powerdomain, int level, int *setlevel)
>  		return rtas_error_rc(rc);
>  	return rc;
>  }
> -EXPORT_SYMBOL(rtas_set_power_level);
> +EXPORT_SYMBOL_GPL(rtas_set_power_level);
>  
>  int rtas_get_sensor(int sensor, int index, int *state)
>  {
> @@ -777,7 +777,7 @@ int rtas_get_sensor(int sensor, int index, int *state)
>  		return rtas_error_rc(rc);
>  	return rc;
>  }
> -EXPORT_SYMBOL(rtas_get_sensor);
> +EXPORT_SYMBOL_GPL(rtas_get_sensor);
>  
>  int rtas_get_sensor_fast(int sensor, int index, int *state)
>  {
> @@ -820,7 +820,7 @@ bool rtas_indicator_present(int token, int *maxindex)
>  
>  	return false;
>  }
> -EXPORT_SYMBOL(rtas_indicator_present);
> +EXPORT_SYMBOL_GPL(rtas_indicator_present);
>  
>  int rtas_set_indicator(int indicator, int index, int new_value)
>  {
> @@ -838,7 +838,7 @@ int rtas_set_indicator(int indicator, int index, int new_value)
>  		return rtas_error_rc(rc);
>  	return rc;
>  }
> -EXPORT_SYMBOL(rtas_set_indicator);
> +EXPORT_SYMBOL_GPL(rtas_set_indicator);
>  
>  /*
>   * Ignoring RTAS extended delay

