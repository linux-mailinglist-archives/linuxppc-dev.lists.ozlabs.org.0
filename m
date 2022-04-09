Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 927404FA570
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 08:30:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kb4x14vSNz3bYZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 16:30:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EEb5U8pA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EEb5U8pA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kb4wL3ZV7z2xmZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 16:29:38 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 239452fk003459; 
 Sat, 9 Apr 2022 06:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=iR9ucZMYa0HdnazYKEUFucOEh062cPEmx4MxWODZAPQ=;
 b=EEb5U8pAvjPXyaviF/XPjPFKPbI2oOhAEgy0ULnX5FS36viBaNHyIh5e215+PL2NVekk
 UMpvZSHkSG6EsLRp7XyfwBPSqJsmaULYuUT5SjLVUSt3xFCJI0G5QICd5Ob9YasS4qnE
 Yst+2Dapi3XOmlTmqInQa//i1veT1nc0o9iKdiUmnxJsJKZH1rMbIWwpywqVydI1WJw4
 udWWKqYVxQfm2EpZQHt8U8bsinqmmolv0BfTYz0C92SBuvQxFzNSiHgnXLLDLWiCLEr9
 AeZddzA/sgLSPQaHTE4BykWKUzh3nPLeH3J0BnexyroN1a5L2IhIAnLvBE/jH1z8lOtt bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fb2tasee7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 09 Apr 2022 06:29:26 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2396D0ed004416;
 Sat, 9 Apr 2022 06:29:26 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fb2tasedu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 09 Apr 2022 06:29:25 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2396Rq1X006607;
 Sat, 9 Apr 2022 06:29:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3fb1s8g5mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 09 Apr 2022 06:29:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2396TKP936503852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 9 Apr 2022 06:29:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAC45AE051;
 Sat,  9 Apr 2022 06:29:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54923AE045;
 Sat,  9 Apr 2022 06:29:16 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.211.90.23])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat,  9 Apr 2022 06:29:15 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 4/4] tools/perf: Fix perf bench numa testcase to check
 if CPU used to bind task is online
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220408122642.GE568950@linux.vnet.ibm.com>
Date: Sat, 9 Apr 2022 11:59:12 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <24F45D77-E65E-4F4E-82B7-DD24AD0EF2E1@linux.vnet.ibm.com>
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
 <20220406175113.87881-5-atrajeev@linux.vnet.ibm.com>
 <20220408122642.GE568950@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jxmQbJvxtdpvks1VmPBIi45wmCDwsett
X-Proofpoint-ORIG-GUID: WbefU6hsF11QqJrtYhI6q5h3An5iNvvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_09,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204090037
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com,
 Nageswara Sastry <rnsastry@linux.ibm.com>, kjain@linux.ibm.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 08-Apr-2022, at 5:56 PM, Srikar Dronamraju =
<srikar@linux.vnet.ibm.com> wrote:
>=20
> * Athira Rajeev <atrajeev@linux.vnet.ibm.com> [2022-04-06 23:21:13]:
>=20
>> Perf numa bench test fails with error:
>>=20
>> Testcase:
>> ./perf bench numa mem -p 2 -t 1 -P 1024 -C 0,8 -M 1,0 -s 20 -zZq
>> --thp  1 --no-data_rand_walk
>>=20
>> Failure snippet:
>> <<>>
>> Running 'numa/mem' benchmark:
>>=20
>> # Running main, "perf bench numa numa-mem -p 2 -t 1 -P 1024 -C 0,8
>> -M 1,0 -s 20 -zZq --thp 1 --no-data_rand_walk"
>>=20
>> perf: bench/numa.c:333: bind_to_cpumask: Assertion `!(ret)' failed.
>> <<>>
>>=20
>> The Testcases uses CPU???s 0 and 8. In function =
"parse_setup_cpu_list",
>> There is check to see if cpu number is greater than max cpu???s =
possible
>> in the system ie via "if (bind_cpu_0 >=3D g->p.nr_cpus ||
>> bind_cpu_1 >=3D g->p.nr_cpus) {". But it could happen that system has
>> say 48 CPU???s, but only number of online CPU???s is 0-7. Other =
CPU???s
>> are offlined. Since "g->p.nr_cpus" is 48, so function will go ahead
>> and set bit for CPU 8 also in cpumask ( td->bind_cpumask).
>>=20
>> bind_to_cpumask function is called to set affinity using
>> sched_setaffinity and the cpumask. Since the CPU8 is not present,
>> set affinity will fail here with EINVAL. Fix this issue by adding a
>> check to make sure that, CPU???s provided in the input argument =
values
>> are online before proceeding further and skip the test. For this,
>> include new helper function "is_cpu_online" in
>> "tools/perf/util/header.c".
>>=20
>> Since "BIT(x)" definition will get included from header.h, remove
>> that from bench/numa.c
>>=20
>> Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>=20
> Looks good to me.
> Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

Hi Srikar,

Thanks for the review

Athira
>=20
>> ---
>> tools/perf/bench/numa.c  |  8 ++++++--
>> tools/perf/util/header.c | 43 =
++++++++++++++++++++++++++++++++++++++++
>> tools/perf/util/header.h |  1 +
>> 3 files changed, 50 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
>> index 29e41e32bd88..7992d79b3e41 100644
>> --- a/tools/perf/bench/numa.c
>> +++ b/tools/perf/bench/numa.c
>> @@ -34,6 +34,7 @@
>> #include <linux/numa.h>
>> #include <linux/zalloc.h>
>>=20
>> +#include "../util/header.h"
>> #include <numa.h>
>> #include <numaif.h>
>>=20
>> @@ -616,6 +617,11 @@ static int parse_setup_cpu_list(void)
>> 			return -1;
>> 		}
>>=20
>> +		if (is_cpu_online(bind_cpu_0) !=3D 1 || =
is_cpu_online(bind_cpu_1) !=3D 1) {
>> +			printf("\nTest not applicable, bind_cpu_0 or =
bind_cpu_1 is offline\n");
>> +			return -1;
>> +		}
>> +
>> 		BUG_ON(bind_cpu_0 < 0 || bind_cpu_1 < 0);
>> 		BUG_ON(bind_cpu_0 > bind_cpu_1);
>>=20
>> @@ -786,8 +792,6 @@ static int parse_nodes_opt(const struct option =
*opt __maybe_unused,
>> 	return parse_node_list(arg);
>> }
>>=20
>> -#define BIT(x) (1ul << x)
>> -
>> static inline uint32_t lfsr_32(uint32_t lfsr)
>> {
>> 	const uint32_t taps =3D BIT(1) | BIT(5) | BIT(6) | BIT(31);
>> diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
>> index 6da12e522edc..3f5fcf5d4b3f 100644
>> --- a/tools/perf/util/header.c
>> +++ b/tools/perf/util/header.c
>> @@ -983,6 +983,49 @@ static int write_dir_format(struct feat_fd *ff,
>> 	return do_write(ff, &data->dir.version, =
sizeof(data->dir.version));
>> }
>>=20
>> +#define SYSFS "/sys/devices/system/cpu/"
>> +
>> +/*
>> + * Check whether a CPU is online
>> + *
>> + * Returns:
>> + *     1 -> if CPU is online
>> + *     0 -> if CPU is offline
>> + *    -1 -> error case
>> + */
>> +int is_cpu_online(unsigned int cpu)
>> +{
>> +	char sysfs_cpu[255];
>> +	char buf[255];
>> +	struct stat statbuf;
>> +	size_t len;
>> +	int fd;
>> +
>> +	snprintf(sysfs_cpu, sizeof(sysfs_cpu), SYSFS "cpu%u", cpu);
>> +
>> +	if (stat(sysfs_cpu, &statbuf) !=3D 0)
>> +		return 0;
>> +
>> +	/*
>> +	 * Check if /sys/devices/system/cpu/cpux/online file
>> +	 * exists. In kernels without CONFIG_HOTPLUG_CPU, this
>> +	 * file won't exist.
>> +	 */
>> +	snprintf(sysfs_cpu, sizeof(sysfs_cpu), SYSFS "cpu%u/online", =
cpu);
>> +	if (stat(sysfs_cpu, &statbuf) !=3D 0)
>> +		return 1;
>> +
>> +	fd =3D open(sysfs_cpu, O_RDONLY);
>> +	if (fd =3D=3D -1)
>> +		return -1;
>> +
>> +	len =3D read(fd, buf, sizeof(buf) - 1);
>> +	buf[len] =3D '\0';
>> +	close(fd);
>> +
>> +	return strtoul(buf, NULL, 16);
>> +}
>> +
>> #ifdef HAVE_LIBBPF_SUPPORT
>> static int write_bpf_prog_info(struct feat_fd *ff,
>> 			       struct evlist *evlist __maybe_unused)
>> diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
>> index c9e3265832d9..0eb4bc29a5a4 100644
>> --- a/tools/perf/util/header.h
>> +++ b/tools/perf/util/header.h
>> @@ -158,6 +158,7 @@ int do_write(struct feat_fd *fd, const void *buf, =
size_t size);
>> int write_padded(struct feat_fd *fd, const void *bf,
>> 		 size_t count, size_t count_aligned);
>>=20
>> +int is_cpu_online(unsigned int cpu);
>> /*
>>  * arch specific callback
>>  */
>> --=20
>> 2.35.1

