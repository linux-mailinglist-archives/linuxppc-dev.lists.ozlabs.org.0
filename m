Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF73E23B5D9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 09:39:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLRTL4KLlzDqXC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 17:39:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLRRX2GfczDqWb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 17:37:26 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0747W1e4188445; Tue, 4 Aug 2020 03:37:23 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32pypj5jhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 03:37:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0747Zb1l015398;
 Tue, 4 Aug 2020 07:37:22 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 32n018x9u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 07:37:22 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0747bLCQ42402120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Aug 2020 07:37:21 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A25316A047;
 Tue,  4 Aug 2020 07:37:21 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA3746A054;
 Tue,  4 Aug 2020 07:37:20 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.92.71])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  4 Aug 2020 07:37:20 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 3F2342E2EE7; Tue,  4 Aug 2020 13:07:17 +0530 (IST)
Date: Tue, 4 Aug 2020 13:07:17 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2] powerpc: Warn about use of smt_snooze_delay
Message-ID: <20200804073717.GA8058@in.ibm.com>
References: <20200630015935.2675676-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630015935.2675676-1-joel@jms.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_02:2020-08-03,
 2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008040050
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Joel,

On Tue, Jun 30, 2020 at 11:29:35AM +0930, Joel Stanley wrote:
> It's not done anything for a long time. Save the percpu variable, and
> emit a warning to remind users to not expect it to do anything.
> 
> Fixes: 3fa8cad82b94 ("powerpc/pseries/cpuidle: smt-snooze-delay cleanup.")
> Cc: stable@vger.kernel.org # v3.14
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Sorry I missed this v2.

The patch looks good to me.

Acked-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> --
> v2:
>  Use pr_warn instead of WARN
>  Reword and print proccess name with pid in message
>  Leave CPU_FTR_SMT test in
>  Add Fixes line
> 
> mpe, if you don't agree then feel free to drop the cc stable.
> 
> Testing 'ppc64_cpu --smt=off' on a 24 core / 4 SMT system it's quite noisy
> as the online/offline loop that ppc64_cpu runs is slow.
> 
> This could be fixed by open coding pr_warn_ratelimit with the ratelimit
> parameters tweaked if someone was concerned. I'll leave that to someone
> else as a future enhancement.
> 
> [  237.642088][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  237.642175][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  237.642261][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  237.642345][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  237.642430][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  237.642516][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  237.642625][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  237.642709][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  237.642793][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  237.642878][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  254.264030][ T1197] store_smt_snooze_delay: 14 callbacks suppressed
> [  254.264033][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  254.264048][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  254.264062][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  254.264075][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  254.264089][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  254.264103][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  254.264116][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  254.264130][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  254.264143][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> [  254.264157][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/powerpc/kernel/sysfs.c | 41 +++++++++++++++----------------------
>  1 file changed, 16 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 571b3259697e..ba6d4cee19ef 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -32,29 +32,26 @@
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
> +	pr_warn_ratelimited("%s (%d) used unsupported smt_snooze_delay, this has no effect\n",
> +			    current->comm, current->pid);
>  	return count;
>  }
> 
> @@ -62,9 +59,9 @@ static ssize_t show_smt_snooze_delay(struct device *dev,
>  				     struct device_attribute *attr,
>  				     char *buf)
>  {
> -	struct cpu *cpu = container_of(dev, struct cpu, dev);
> -
> -	return sprintf(buf, "%ld\n", per_cpu(smt_snooze_delay, cpu->dev.id));
> +	pr_warn_ratelimited("%s (%d) used unsupported smt_snooze_delay, this has no effect\n",
> +			    current->comm, current->pid);
> +	return sprintf(buf, "100\n");
>  }
> 
>  static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
> @@ -72,16 +69,10 @@ static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
> 
>  static int __init setup_smt_snooze_delay(char *str)
>  {
> -	unsigned int cpu;
> -	long snooze;
> -
>  	if (!cpu_has_feature(CPU_FTR_SMT))
>  		return 1;
> 
> -	snooze = simple_strtol(str, NULL, 10);
> -	for_each_possible_cpu(cpu)
> -		per_cpu(smt_snooze_delay, cpu) = snooze;
> -
> +	pr_warn("smt-snooze-delay command line option has no effect\n");
>  	return 1;
>  }
>  __setup("smt-snooze-delay=", setup_smt_snooze_delay);
> -- 
> 2.27.0
> 
