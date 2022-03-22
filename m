Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1FF4E415C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 15:31:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNDS84KHpz308y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 01:31:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DohYysYs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DohYysYs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNDRM6F5kz2xgY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 01:30:22 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22MCrPt3020389; 
 Tue, 22 Mar 2022 14:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+JUqREg8t44nEfQ2HVmmV0k84OjTE9fFx3uMTgNT6c8=;
 b=DohYysYsSe0lIChowg4PiJ64Nou932rXu87EjNWEcTP/Kx1aA92r9l3SkQGmPjo2fINp
 yvz4upRhS4wsW236WjgC18dCww5BUVwteZo1OLpCJdHsy3XZ6RJhVg0YVAkasv/aa8vD
 giYuIwCAm9tGK7SopnrWb8U4d8LaRI2B6584mG/nzJDliFdTQnKdKmg5NH4D3PD86nSD
 CQhVr3v91noj2UK/x6vUhLO+2vb9s+9Jg00aDP993pEswd6vYeXgCiBazN4mhueiYUzb
 KAw9xr5K/V9Pkrf9hIyRTxfPUyLDySfJXZFWxNO2GBm4JelSGLidF3joEZ00adA7jVTe iw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eyc20pbby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 14:29:45 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22MEHEvf015607;
 Tue, 22 Mar 2022 14:29:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ew6ehxerq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 14:29:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22METee036831610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Mar 2022 14:29:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 139634C046;
 Tue, 22 Mar 2022 14:29:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 960E04C044;
 Tue, 22 Mar 2022 14:29:34 +0000 (GMT)
Received: from [9.43.105.112] (unknown [9.43.105.112])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Mar 2022 14:29:34 +0000 (GMT)
Message-ID: <c198a1b5-cc7e-4e51-533b-a5794f506b17@linux.ibm.com>
Date: Tue, 22 Mar 2022 19:59:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] powerpc/papr_scm: Fix build failure when
 CONFIG_PERF_EVENTS is not set
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>
References: <20220318114133.113627-1-kjain@linux.ibm.com>
 <20220318114133.113627-2-kjain@linux.ibm.com>
 <CAPcyv4iqpTn89WLOW1XjFXGZEYG_MmPg+VQbcDJ9ygJ4Jaybtw@mail.gmail.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <CAPcyv4iqpTn89WLOW1XjFXGZEYG_MmPg+VQbcDJ9ygJ4Jaybtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Iy28N7SpHGz-D1RAEQMseTZ42pbzCxD-
X-Proofpoint-GUID: Iy28N7SpHGz-D1RAEQMseTZ42pbzCxD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_06,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 phishscore=0 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203220082
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Santosh Sivaraj <santosh@fossix.org>,
 maddy@linux.ibm.com, "Weiny, Ira" <ira.weiny@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>,
 rnsastry@linux.ibm.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/22/22 03:09, Dan Williams wrote:
> On Fri, Mar 18, 2022 at 4:42 AM Kajol Jain <kjain@linux.ibm.com> wrote:
>>
>> The following build failure occures when CONFIG_PERF_EVENTS is not set
>> as generic pmu functions are not visible in that scenario.
>>
>> arch/powerpc/platforms/pseries/papr_scm.c:372:35: error: ‘struct perf_event’ has no member named ‘attr’
>>          p->nvdimm_events_map[event->attr.config],
>>                                    ^~
>> In file included from ./include/linux/list.h:5,
>>                  from ./include/linux/kobject.h:19,
>>                  from ./include/linux/of.h:17,
>>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
>> arch/powerpc/platforms/pseries/papr_scm.c: In function ‘papr_scm_pmu_event_init’:
>> arch/powerpc/platforms/pseries/papr_scm.c:389:49: error: ‘struct perf_event’ has no member named ‘pmu’
>>   struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
>>                                                  ^~
>> ./include/linux/container_of.h:18:26: note: in definition of macro ‘container_of’
>>   void *__mptr = (void *)(ptr);     \
>>                           ^~~
>> arch/powerpc/platforms/pseries/papr_scm.c:389:30: note: in expansion of macro ‘to_nvdimm_pmu’
>>   struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
>>                               ^~~~~~~~~~~~~
>> In file included from ./include/linux/bits.h:22,
>>                  from ./include/linux/bitops.h:6,
>>                  from ./include/linux/of.h:15,
>>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
>>
>> Fix the build issue by adding check for CONFIG_PERF_EVENTS config option
>> and disabling the papr_scm perf interface support incase this config
>> is not set
>>
>> Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support") (Commit id
>> based on linux-next tree)
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/papr_scm.c | 15 +++++++++++++++
> 
> This is a bit messier than I would have liked mainly because it dumps
> a bunch of ifdefery into a C file contrary to coding style, "Wherever
> possible, don't use preprocessor conditionals (#if, #ifdef) in .c
> files". I would expect this all to move to an organization like:

Hi Dan,
      Thanks for reviewing the patches. Inorder to avoid the multiple
ifdefs checks, we can also add stub function for papr_scm_pmu_register.
With that change we will just have one ifdef check for
CONFIG_PERF_EVENTS config in both papr_scm.c and nd.h file. Hence we can
avoid adding new files specific for papr_scm perf interface.

Below is the code snippet for that change, let me know if looks fine to
you. I tested it
with set/unset PAPR_SCM config value and set/unset PERF_EVENTS config
value combinations.

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
b/arch/powerpc/platforms/pseries/papr_scm.c
index 4dd513d7c029..38fabb44d3c3 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -69,8 +69,6 @@
 #define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
 #define PAPR_SCM_PERF_STATS_VERSION 0x1

-#define to_nvdimm_pmu(_pmu)    container_of(_pmu, struct nvdimm_pmu, pmu)
-
 /* Struct holding a single performance metric */
 struct papr_scm_perf_stat {
        u8 stat_id[8];
@@ -346,6 +344,9 @@ static ssize_t drc_pmem_query_stats(struct
papr_scm_priv *p,
        return 0;
 }

+#ifdef CONFIG_PERF_EVENTS
+#define to_nvdimm_pmu(_pmu)    container_of(_pmu, struct nvdimm_pmu, pmu)
+
 static int papr_scm_pmu_get_value(struct perf_event *event, struct
device *dev, u64 *count)
 {
        struct papr_scm_perf_stat *stat;
@@ -558,6 +559,10 @@ static void papr_scm_pmu_register(struct
papr_scm_priv *p)
        dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=%d\n", rc);
 }

+#else
+static inline void papr_scm_pmu_register(struct papr_scm_priv *p) { }
+#endif
+
 /*
  * Issue hcall to retrieve dimm health info and populate papr_scm_priv
with the
  * health information.
diff --git a/drivers/nvdimm/Makefile b/drivers/nvdimm/Makefile
index 3fb806748716..ba0296dca9db 100644
--- a/drivers/nvdimm/Makefile
+++ b/drivers/nvdimm/Makefile
@@ -15,7 +15,7 @@ nd_e820-y := e820.o
 libnvdimm-y := core.o
 libnvdimm-y += bus.o
 libnvdimm-y += dimm_devs.o
-libnvdimm-y += nd_perf.o
+libnvdimm-$(CONFIG_PERF_EVENTS) += nd_perf.o
 libnvdimm-y += dimm.o
 libnvdimm-y += region_devs.o
 libnvdimm-y += region.o
diff --git a/include/linux/nd.h b/include/linux/nd.h
index 7b2ccbdc1cbc..a387e2b630ad 100644
--- a/include/linux/nd.h
+++ b/include/linux/nd.h
@@ -57,15 +57,22 @@ struct nvdimm_pmu {
        struct cpumask arch_cpumask;
 };

+#ifdef CONFIG_PERF_EVENTS
 extern ssize_t nvdimm_events_sysfs_show(struct device *dev,
                                        struct device_attribute *attr,
                                        char *page);

 int register_nvdimm_pmu(struct nvdimm_pmu *nvdimm, struct
platform_device *pdev);
 void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu);
-void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu);
-int perf_pmu_register(struct pmu *pmu, const char *name, int type);
-void perf_pmu_unregister(struct pmu *pmu);
+
+#else
+static inline int register_nvdimm_pmu(struct nvdimm_pmu *nd_pmu, struct
platform_device *pdev)
+{
+       return -ENXIO;
+}
+
+static inline void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu) { }
+#endif

 struct nd_device_driver {
        struct device_driver drv;
> 
> arch/powerpc/platforms/pseries/papr_scm/main.c
> arch/powerpc/platforms/pseries/papr_scm/perf.c
> 
> ...and a new config symbol like:
> 
> config PAPR_SCM_PERF
>        depends on PAPR_SCM && PERF_EVENTS
>        def_bool y
> 
> ...with wrappers in header files to make everything compile away
> without any need for main.c to carry an ifdef.
> 
> Can you turn a patch like that in the next couple days? Otherwise, I
> think if Linus saw me sending a late breaking compile fix that threw
> coding style out the window he'd have cause to just drop the pull
> request entirely.

Sure Dan, I will work on the patches and send it asap once we finalized
the changes.

Thanks,
Kajol Jain
