Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 633C019AB3A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 14:04:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48slHJ54DvzDqvv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 23:04:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48slD61DQbzDqBm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:01:41 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031BXM2D060103; Wed, 1 Apr 2020 08:01:35 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 304h3w82w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 08:01:34 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031C0XXi025589;
 Wed, 1 Apr 2020 12:01:33 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 301x76rpef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 12:01:33 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031C1WD257999766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 12:01:32 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C187BE04F;
 Wed,  1 Apr 2020 12:01:32 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B5FCBE05A;
 Wed,  1 Apr 2020 12:01:31 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.72.142])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 12:01:31 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id EA34F2E33D3; Wed,  1 Apr 2020 17:31:27 +0530 (IST)
Date: Wed, 1 Apr 2020 17:31:27 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 6/6] pseries/sysfs: Minimise IPI noise while reading
 [idle_][s]purr
Message-ID: <20200401120127.GC17237@in.ibm.com>
References: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585308760-28792-7-git-send-email-ego@linux.vnet.ibm.com>
 <1585734367.oqwn7dzljo.naveen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585734367.oqwn7dzljo.naveen@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010104
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Naveen,


On Wed, Apr 01, 2020 at 03:28:48PM +0530, Naveen N. Rao wrote:
> Gautham R. Shenoy wrote:
> >From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> >
 [..snip..]

> >-static DEVICE_ATTR(spurr, 0400, show_spurr, NULL);
> >-static DEVICE_ATTR(purr, 0400, show_purr, store_purr);
> > static DEVICE_ATTR(pir, 0400, show_pir, NULL);
> > static DEVICE_ATTR(tscr, 0600, show_tscr, store_tscr);
> > #endif /* CONFIG_PPC64 */
> >@@ -761,22 +757,110 @@ static void create_svm_file(void)
> > }
> > #endif /* CONFIG_PPC_SVM */
> >
> >+#ifdef CONFIG_PPC64
> >+/*
> >+ * The duration (in ms) from the last IPI to the target CPU until
> >+ * which a cached value of purr, spurr, idle_purr, idle_spurr can be
> >+ * reported to the user on a corresponding sysfs file read. Beyond
> >+ * this duration, fresh values need to be obtained by sending IPIs to
> >+ * the target CPU when the sysfs files are read.
> >+ */
> >+static unsigned long util_stats_staleness_tolerance_ms = 10;
> 
> This is a nice optimization for our use in lparstat, though I have a concern
> below.
> 
> >+struct util_acct_stats {
> >+	u64 latest_purr;
> >+	u64 latest_spurr;
> >+#ifdef CONFIG_PPC_PSERIES
> >+	u64 latest_idle_purr;
> >+	u64 latest_idle_spurr;
> >+#endif
> 
> You can probably drop the 'latest_' prefix.


Sure.

> 
> >+	unsigned long last_update_jiffies;
> >+};
> >+
> >+DEFINE_PER_CPU(struct util_acct_stats, util_acct_stats);
> 
> Per snowpatch, this should be static, and so should get_util_stats_ptr()
> below:
> https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/16601//artifact/linux/report.txt

Ok, will fix this in v5.

> 
> >+
> >+static void update_util_acct_stats(void *ptr)
> >+{
> >+	struct util_acct_stats *stats = ptr;
> >+
> >+	stats->latest_purr = mfspr(SPRN_PURR);
> >+	stats->latest_spurr = mfspr(SPRN_SPURR);
> > #ifdef CONFIG_PPC_PSERIES
> >-static void read_idle_purr(void *val)
> >+	stats->latest_idle_purr = read_this_idle_purr();
> >+	stats->latest_idle_spurr = read_this_idle_spurr();
> >+#endif
> >+	stats->last_update_jiffies = jiffies;
> >+}
> >+
> >+struct util_acct_stats *get_util_stats_ptr(int cpu)
> >+{
> >+	struct util_acct_stats *stats = per_cpu_ptr(&util_acct_stats, cpu);
> >+	unsigned long delta_jiffies;
> >+
> >+	delta_jiffies = jiffies - stats->last_update_jiffies;
> >+
> >+	/*
> >+	 * If we have a recent enough data, reuse that instead of
> >+	 * sending an IPI.
> >+	 */
> >+	if (jiffies_to_msecs(delta_jiffies) < util_stats_staleness_tolerance_ms)
> >+		return stats;
> >+
> >+	smp_call_function_single(cpu, update_util_acct_stats, stats, 1);
> >+	return stats;
> >+}
> >+
> >+static ssize_t show_purr(struct device *dev,
> >+			 struct device_attribute *attr, char *buf)
> > {
> >-	u64 *ret = val;
> >+	struct cpu *cpu = container_of(dev, struct cpu, dev);
> >+	struct util_acct_stats *stats;
> >
> >-	*ret = read_this_idle_purr();
> >+	stats = get_util_stats_ptr(cpu->dev.id);
> >+	return sprintf(buf, "%llx\n", stats->latest_purr);
> 
> This alters the behavior of the current sysfs purr file. I am not sure if it
> is reasonable to return the same PURR value across a 10ms window.


It does reduce it to 10ms window. I am not sure if anyone samples PURR
etc faster than that rate.

I measured how much time it takes to read the purr, spurr, idle_purr,
idle_spurr files back-to-back. It takes not more than 150us.  From
lparstat will these values be read back-to-back ? If so, we can reduce
the staleness_tolerance to something like 500us and still avoid extra
IPIs. If not, what is the maximum delay between the first sysfs file
read and the last sysfs file read ?

>
> I wonder if we should introduce a sysctl interface to control thresholding.
> It can default to 0, which disables thresholding so that the existing
> behavior continues. Applications (lparstat) can optionally set it to suit
> their use.

We would be introducing 3 new sysfs interfaces that way instead of
two.

/sys/devices/system/cpu/purr_spurr_staleness
/sys/devices/system/cpu/cpuX/idle_purr
/sys/devices/system/cpu/cpuX/idle_spurr

I don't have a problem with this. Nathan, Michael, thoughts on this?


The alternative is to have a procfs interface, something like
/proc/powerpc/resource_util_stats

which gives a listing similar to /proc/stat, i.e

      CPUX  <purr>  <idle_purr>  <spurr>  <idle_spurr>

Even in this case, the values can be obtained in one-shot with a
single IPI and be printed in the row corresponding to the CPU.

> 
> - Naveen
> 

--
Thanks and Regards
gautham.
