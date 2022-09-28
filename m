Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FB75EDE0A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 15:44:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McyQg6WLKz3c4c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:44:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jyl7wRTq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jyl7wRTq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McyLm3kXmz3cCD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 23:41:04 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SDarhw029178;
	Wed, 28 Sep 2022 13:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Mh2fWVk3fNEf2DhAYeJxnFE3lkUUL1QVUTXLHpMXmPg=;
 b=jyl7wRTq6Gk7BW8atbRWFccufGg4KPj/S7tcFRjs5qIxcEC7zV+gz/QA69AzERRzo0sN
 DPOii7OJ7uzMHb5kbu+G+nOnnHm0PkgPsHY3Hp7Y0UkC2VFIwlBeU8hUhnx4hmxq0Dvv
 WGS7oHbuWHJgy3+fqcyKT3hBHSpK3NRTHQUUywr0lSUF2XgSfsBVYTbcNidy2wZ0pgmy
 qp234ogI149MIknflBq4UjYuSTSbra15mh7aKlNBhTJFoM04bQTOvpPXv4dbSs2J1+Fw
 kbjwOEVGIBAp23dKpFLcKp1J+PTcrFYSrVmMuI5v7iWpouTCW297+4JUJnOxP76/sdFX NQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvmtr50aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 13:40:54 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28SDb6Q8020722;
	Wed, 28 Sep 2022 13:40:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04fra.de.ibm.com with ESMTP id 3jssh9409c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 13:40:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28SDeniI52035980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Sep 2022 13:40:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04E65A4054;
	Wed, 28 Sep 2022 13:40:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A260A4060;
	Wed, 28 Sep 2022 13:40:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 28 Sep 2022 13:40:48 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B95496016C;
	Wed, 28 Sep 2022 20:02:40 +1000 (AEST)
Message-ID: <591a3e016605181e119496992027ae21700a2c3b.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] powerpc/rtas: block error injection when locked
 down
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 28 Sep 2022 20:02:40 +1000
In-Reply-To: <20220926131643.146502-3-nathanl@linux.ibm.com>
References: <20220926131643.146502-1-nathanl@linux.ibm.com>
	 <20220926131643.146502-3-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mG5ysnGAlMM9Fev4UY_3wOPa0iaGdcWB
X-Proofpoint-ORIG-GUID: mG5ysnGAlMM9Fev4UY_3wOPa0iaGdcWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_06,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280083
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
Cc: paul@paul-moore.com, nayna@linux.ibm.com, jmorris@namei.org, gcwilson@linux.ibm.com, serge@hallyn.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-09-26 at 08:16 -0500, Nathan Lynch wrote:
> The error injection facility on pseries VMs allows corruption of
> arbitrary guest memory, potentially enabling a sufficiently
> privileged
> user to disable lockdown or perform other modifications of the
> running
> kernel via the rtas syscall.
> 
> Block the PAPR error injection facility from being opened or called
> when locked down.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Is there any circumstance (short of arbitrary code execution etc) where
the rtas_call() check will actually trigger rather than the sys_rtas()
check? (Not that it matters, defence in depth is good.)

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>  arch/powerpc/kernel/rtas.c | 25 ++++++++++++++++++++++++-
>  include/linux/security.h   |  1 +
>  security/security.c        |  1 +
>  3 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 693133972294..c2540d393f1c 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -23,6 +23,7 @@
>  #include <linux/memblock.h>
>  #include <linux/slab.h>
>  #include <linux/reboot.h>
> +#include <linux/security.h>
>  #include <linux/syscalls.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
> @@ -464,6 +465,9 @@ void rtas_call_unlocked(struct rtas_args *args,
> int token, int nargs, int nret,
>         va_end(list);
>  }
>  
> +static int ibm_open_errinjct_token;
> +static int ibm_errinjct_token;
> +
>  int rtas_call(int token, int nargs, int nret, int *outputs, ...)
>  {
>         va_list list;
> @@ -476,6 +480,16 @@ int rtas_call(int token, int nargs, int nret,
> int *outputs, ...)
>         if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
>                 return -1;
>  
> +       if (token == ibm_open_errinjct_token || token ==
> ibm_errinjct_token) {
> +               /*
> +                * It would be nicer to not discard the error value
> +                * from security_locked_down(), but callers expect an
> +                * RTAS status, not an errno.
> +                */
> +               if
> (security_locked_down(LOCKDOWN_RTAS_ERROR_INJECTION))
> +                       return -1;
> +       }
> +
>         if ((mfmsr() & (MSR_IR|MSR_DR)) != (MSR_IR|MSR_DR)) {
>                 WARN_ON_ONCE(1);
>                 return -1;
> @@ -1227,6 +1241,14 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user
> *, uargs)
>         if (block_rtas_call(token, nargs, &args))
>                 return -EINVAL;
>  
> +       if (token == ibm_open_errinjct_token || token ==
> ibm_errinjct_token) {
> +               int err;
> +
> +               err =
> security_locked_down(LOCKDOWN_RTAS_ERROR_INJECTION);
> +               if (err)
> +                       return err;
> +       }
> +
>         /* Need to handle ibm,suspend_me call specially */
>         if (token == rtas_token("ibm,suspend-me")) {
>  
> @@ -1325,7 +1347,8 @@ void __init rtas_initialize(void)
>  #ifdef CONFIG_RTAS_ERROR_LOGGING
>         rtas_last_error_token = rtas_token("rtas-last-error");
>  #endif
> -
> +       ibm_open_errinjct_token = rtas_token("ibm,open-errinjct");
> +       ibm_errinjct_token = rtas_token("ibm,errinjct");
>         rtas_syscall_filter_init();
>  }
>  
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 39e7c0e403d9..70f89dc3a712 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -123,6 +123,7 @@ enum lockdown_reason {
>         LOCKDOWN_XMON_WR,
>         LOCKDOWN_BPF_WRITE_USER,
>         LOCKDOWN_DBG_WRITE_KERNEL,
> +       LOCKDOWN_RTAS_ERROR_INJECTION,
>         LOCKDOWN_INTEGRITY_MAX,
>         LOCKDOWN_KCORE,
>         LOCKDOWN_KPROBES,
> diff --git a/security/security.c b/security/security.c
> index 51bf66d4f472..eabe3ce7e74e 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -61,6 +61,7 @@ const char *const
> lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1] = {
>         [LOCKDOWN_XMON_WR] = "xmon write access",
>         [LOCKDOWN_BPF_WRITE_USER] = "use of bpf to write user RAM",
>         [LOCKDOWN_DBG_WRITE_KERNEL] = "use of kgdb/kdb to write
> kernel RAM",
> +       [LOCKDOWN_RTAS_ERROR_INJECTION] = "RTAS error injection",
>         [LOCKDOWN_INTEGRITY_MAX] = "integrity",
>         [LOCKDOWN_KCORE] = "/proc/kcore access",
>         [LOCKDOWN_KPROBES] = "use of kprobes",

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

