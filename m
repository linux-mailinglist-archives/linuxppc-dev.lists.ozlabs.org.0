Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F719A910
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 12:01:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48shY25LmNzDqvt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 21:01:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48shVX6QY8zDqR0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 20:59:00 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0319aJjZ107039
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 05:58:57 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3020weneu5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 05:58:57 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 1 Apr 2020 10:58:39 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 10:58:36 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0319wpZM54263828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 09:58:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DEE5AE053;
 Wed,  1 Apr 2020 09:58:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EFF6AE04D;
 Wed,  1 Apr 2020 09:58:51 +0000 (GMT)
Received: from localhost (unknown [9.85.74.146])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 09:58:50 +0000 (GMT)
Date: Wed, 01 Apr 2020 15:28:48 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 6/6] pseries/sysfs: Minimise IPI noise while reading
 [idle_][s]purr
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Kamalesh Babulal
 <kamalesh@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, Vaidyanathan Srinivasan
 <svaidy@linux.vnet.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>
References: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585308760-28792-7-git-send-email-ego@linux.vnet.ibm.com>
In-Reply-To: <1585308760-28792-7-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040109-0020-0000-0000-000003BF864F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040109-0021-0000-0000-000022182B57
Message-Id: <1585734367.oqwn7dzljo.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010083
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R. Shenoy wrote:
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>=20
> Currently purr, spurr, idle_purr, idle_spurr are exposed for every CPU
> via the sysfs interface
> /sys/devices/system/cpu/cpuX/[idle_][s]purr. Each sysfs read currently
> generates an IPI to obtain the desired value from the target CPU X.
> Since these aforementioned sysfs are typically read one after another,
> we end up generating 4 IPIs per CPU in a short duration.
>=20
> In order to minimize the IPI noise, this patch caches the values of
> all the four entities whenever one of them is read. If subsequently
> any of these are read within the next 10ms, the cached value is
> returned. With this, we will generate at most one IPI every 10ms for
> every CPU.
>=20
> Test-results: While reading the four sysfs files back-to-back for a
> given CPU every second for 100 seconds.
>=20
> Without the patch:
> 		 16 [XICS 2 Edge IPI] =3D 422 times
> 		 DBL [Doorbell interrupts] =3D 13 times
> 		 Total : 435 IPIs.
>=20
> With the patch:
> 		  16 [XICS 2 Edge IPI] =3D 111 times
> 		  DBL [Doorbell interrupts] =3D 17 times
> 		  Total : 128 IPIs.
>=20
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/sysfs.c | 117 ++++++++++++++++++++++++++++++++++++--=
------
>  1 file changed, 97 insertions(+), 20 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 571b325..bd92023 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -586,8 +586,6 @@ void ppc_enable_pmcs(void)
>   * SPRs which are not related to PMU.
>   */
>  #ifdef CONFIG_PPC64
> -SYSFS_SPRSETUP(purr, SPRN_PURR);
> -SYSFS_SPRSETUP(spurr, SPRN_SPURR);
>  SYSFS_SPRSETUP(pir, SPRN_PIR);
>  SYSFS_SPRSETUP(tscr, SPRN_TSCR);
>=20
> @@ -596,8 +594,6 @@ void ppc_enable_pmcs(void)
>    enable write when needed with a separate function.
>    Lets be conservative and default to pseries.
>  */
> -static DEVICE_ATTR(spurr, 0400, show_spurr, NULL);
> -static DEVICE_ATTR(purr, 0400, show_purr, store_purr);
>  static DEVICE_ATTR(pir, 0400, show_pir, NULL);
>  static DEVICE_ATTR(tscr, 0600, show_tscr, store_tscr);
>  #endif /* CONFIG_PPC64 */
> @@ -761,22 +757,110 @@ static void create_svm_file(void)
>  }
>  #endif /* CONFIG_PPC_SVM */
>=20
> +#ifdef CONFIG_PPC64
> +/*
> + * The duration (in ms) from the last IPI to the target CPU until
> + * which a cached value of purr, spurr, idle_purr, idle_spurr can be
> + * reported to the user on a corresponding sysfs file read. Beyond
> + * this duration, fresh values need to be obtained by sending IPIs to
> + * the target CPU when the sysfs files are read.
> + */
> +static unsigned long util_stats_staleness_tolerance_ms =3D 10;

This is a nice optimization for our use in lparstat, though I have a=20
concern below.

> +struct util_acct_stats {
> +	u64 latest_purr;
> +	u64 latest_spurr;
> +#ifdef CONFIG_PPC_PSERIES
> +	u64 latest_idle_purr;
> +	u64 latest_idle_spurr;
> +#endif

You can probably drop the 'latest_' prefix.

> +	unsigned long last_update_jiffies;
> +};
> +
> +DEFINE_PER_CPU(struct util_acct_stats, util_acct_stats);

Per snowpatch, this should be static, and so should get_util_stats_ptr()=20
below:
https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/16601//artif=
act/linux/report.txt

> +
> +static void update_util_acct_stats(void *ptr)
> +{
> +	struct util_acct_stats *stats =3D ptr;
> +
> +	stats->latest_purr =3D mfspr(SPRN_PURR);
> +	stats->latest_spurr =3D mfspr(SPRN_SPURR);
>  #ifdef CONFIG_PPC_PSERIES
> -static void read_idle_purr(void *val)
> +	stats->latest_idle_purr =3D read_this_idle_purr();
> +	stats->latest_idle_spurr =3D read_this_idle_spurr();
> +#endif
> +	stats->last_update_jiffies =3D jiffies;
> +}
> +
> +struct util_acct_stats *get_util_stats_ptr(int cpu)
> +{
> +	struct util_acct_stats *stats =3D per_cpu_ptr(&util_acct_stats, cpu);
> +	unsigned long delta_jiffies;
> +
> +	delta_jiffies =3D jiffies - stats->last_update_jiffies;
> +
> +	/*
> +	 * If we have a recent enough data, reuse that instead of
> +	 * sending an IPI.
> +	 */
> +	if (jiffies_to_msecs(delta_jiffies) < util_stats_staleness_tolerance_ms=
)
> +		return stats;
> +
> +	smp_call_function_single(cpu, update_util_acct_stats, stats, 1);
> +	return stats;
> +}
> +
> +static ssize_t show_purr(struct device *dev,
> +			 struct device_attribute *attr, char *buf)
>  {
> -	u64 *ret =3D val;
> +	struct cpu *cpu =3D container_of(dev, struct cpu, dev);
> +	struct util_acct_stats *stats;
>=20
> -	*ret =3D read_this_idle_purr();
> +	stats =3D get_util_stats_ptr(cpu->dev.id);
> +	return sprintf(buf, "%llx\n", stats->latest_purr);

This alters the behavior of the current sysfs purr file. I am not sure=20
if it is reasonable to return the same PURR value across a 10ms window.

I wonder if we should introduce a sysctl interface to control=20
thresholding. It can default to 0, which disables thresholding so that=20
the existing behavior continues. Applications (lparstat) can optionally=20
set it to suit their use.

- Naveen

