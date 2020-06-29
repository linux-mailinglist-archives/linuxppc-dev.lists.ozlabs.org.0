Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BE720CE02
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 12:46:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wPKz1P68zDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 20:46:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wPGD6qwKzDqLC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 20:43:00 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05TAVJRd083016; Mon, 29 Jun 2020 06:42:57 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ycgcmuc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 06:42:57 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05TAe0D8024386;
 Mon, 29 Jun 2020 10:42:56 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 31wwr8j4ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 10:42:56 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05TAgrhB13828398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 10:42:53 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0921B6A04F;
 Mon, 29 Jun 2020 10:42:55 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DC9E6A058;
 Mon, 29 Jun 2020 10:42:54 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.80.55])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Jun 2020 10:42:54 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 046E32E4AC7; Mon, 29 Jun 2020 16:12:48 +0530 (IST)
Date: Mon, 29 Jun 2020 16:12:48 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] powerpc: Warn about use of smt_snooze_delay
Message-ID: <20200629104248.GD20062@in.ibm.com>
References: <20200625100349.2408899-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625100349.2408899-1-joel@jms.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-29_08:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 cotscore=-2147483648 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 phishscore=0 spamscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006290071
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
Reply-To: ego@linux.vnet.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, ego@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 25, 2020 at 07:33:49PM +0930, Joel Stanley wrote:
> It's not done anything for a long time. Save the percpu variable, and
> emit a warning to remind users to not expect it to do anything.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

The only known user of "smt_snooze_delay" is the "ppc64_cpu" which
uses the presence of this file to assume that the system is SMT
capable.

Since we have "/sys/devices/system/cpu/smt/" these days, perhaps the
userspace utility can use that and we can get rid of the file
altogether ?

FWIW,
Acked-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/sysfs.c | 41 +++++++++++++------------------------
>  1 file changed, 14 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 571b3259697e..530ae92bc46d 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -32,29 +32,25 @@
>  
>  static DEFINE_PER_CPU(struct cpu, cpu_devices);
>  
> -/*
> - * SMT snooze delay stuff, 64-bit only for now
> - */
> -
>  #ifdef CONFIG_PPC64
>  
> -/* Time in microseconds we delay before sleeping in the idle loop */
> -static DEFINE_PER_CPU(long, smt_snooze_delay) = { 100 };
> +/*
> + * Snooze delay has not been hooked up since 3fa8cad82b94 ("powerpc/pseries/cpuidle:
> + * smt-snooze-delay cleanup.") and has been broken even longer. As was foretold in
> + * 2014:
> + *
> + *  "ppc64_util currently utilises it. Once we fix ppc64_util, propose to clean
> + *  up the kernel code."
> + *
> + * At some point in the future this code should be removed.
> + */
>  
>  static ssize_t store_smt_snooze_delay(struct device *dev,
>  				      struct device_attribute *attr,
>  				      const char *buf,
>  				      size_t count)
>  {
> -	struct cpu *cpu = container_of(dev, struct cpu, dev);
> -	ssize_t ret;
> -	long snooze;
> -
> -	ret = sscanf(buf, "%ld", &snooze);
> -	if (ret != 1)
> -		return -EINVAL;
> -
> -	per_cpu(smt_snooze_delay, cpu->dev.id) = snooze;
> +	WARN_ON_ONCE("smt_snooze_delay sysfs file has no effect\n");
>  	return count;
>  }
>  
> @@ -62,9 +58,9 @@ static ssize_t show_smt_snooze_delay(struct device *dev,
>  				     struct device_attribute *attr,
>  				     char *buf)
>  {
> -	struct cpu *cpu = container_of(dev, struct cpu, dev);
> +	WARN_ON_ONCE("smt_snooze_delay sysfs file has no effect\n");
>  
> -	return sprintf(buf, "%ld\n", per_cpu(smt_snooze_delay, cpu->dev.id));
> +	return sprintf(buf, "100\n");
>  }
>  
>  static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
> @@ -72,16 +68,7 @@ static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
>  
>  static int __init setup_smt_snooze_delay(char *str)
>  {
> -	unsigned int cpu;
> -	long snooze;
> -
> -	if (!cpu_has_feature(CPU_FTR_SMT))
> -		return 1;
> -
> -	snooze = simple_strtol(str, NULL, 10);
> -	for_each_possible_cpu(cpu)
> -		per_cpu(smt_snooze_delay, cpu) = snooze;
> -
> +	WARN_ON_ONCE("smt-snooze-delay command line option has no effect\n");
>  	return 1;
>  }
>  __setup("smt-snooze-delay=", setup_smt_snooze_delay);
> -- 
> 2.27.0
> 
