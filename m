Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18264FBDE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 15:55:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcVjk4PjYz3bdy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 23:55:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g5DVZHFf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=g5DVZHFf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcVhz65Zrz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 23:54:42 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BBmNck029660; 
 Mon, 11 Apr 2022 13:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=+Iy/HIohrX/LlMkpHMiv5rNz9NKrmXIlkCYkah9Ns6Q=;
 b=g5DVZHFfL0lthgzhQSJPW1z0g+gINC+sgLKoGEnhMWzJC5ZCU7aoWJD6CjSBmiwPbnCi
 gjsCR8ReSIvMAHGjlvfRbxFHGprCUBP3l2w0pVxaas+x4iNoMwlWxXdCGXdO1zu9LU6K
 /MqDNy4ut4wC25sjIMgw4VO7AR8EV3oTX58g2zpJl37yhQXo5gNTwa+YGVpVoW8UQgnW
 RQ5PAqqeofK7adUiVvbF/n2KJsJAYbG1arr7372teT3S6FPDCkyy/BNu3bO65nd0wAfl
 xIUx+dCex5qafVdScGp+ImRl/gn+qls7f3oYMiYMkiDLopT/tiQgpML3KUiHO8Yr8ktV yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcks92qy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 13:54:34 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BD3TGt023845;
 Mon, 11 Apr 2022 13:54:33 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcks92qxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 13:54:33 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BDLNYH007810;
 Mon, 11 Apr 2022 13:54:31 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3fb1s8u7u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 13:54:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23BDsRhC38273346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 13:54:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDD4EA405C;
 Mon, 11 Apr 2022 13:54:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEB05A4060;
 Mon, 11 Apr 2022 13:54:22 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.211.96.87])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 11 Apr 2022 13:54:22 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 4/4] tools/perf: Fix perf bench numa testcase to check
 if CPU used to bind task is online
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <YlGkVPyn2/tpUZl2@kernel.org>
Date: Mon, 11 Apr 2022 19:24:18 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <03FDBB52-5803-4254-81E5-875008E203A6@linux.vnet.ibm.com>
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
 <20220406175113.87881-5-atrajeev@linux.vnet.ibm.com>
 <YlGkVPyn2/tpUZl2@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Sag1UoHIm_x-EVI_ndyEJwOcPsi4JjO5
X-Proofpoint-ORIG-GUID: XnDDWDMkkMLdTzccFQfHpCohepFBLFZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_05,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204110074
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nageswara Sastry <rnsastry@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 kajoljain <kjain@linux.ibm.com>, disgoel@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 09-Apr-2022, at 8:50 PM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>=20
> Em Wed, Apr 06, 2022 at 11:21:13PM +0530, Athira Rajeev escreveu:
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
>> The Testcases uses CPU=E2=80=99s 0 and 8. In function =
"parse_setup_cpu_list",
>> There is check to see if cpu number is greater than max cpu=E2=80=99s =
possible
>> in the system ie via "if (bind_cpu_0 >=3D g->p.nr_cpus ||
>> bind_cpu_1 >=3D g->p.nr_cpus) {". But it could happen that system has
>> say 48 CPU=E2=80=99s, but only number of online CPU=E2=80=99s is 0-7. =
Other CPU=E2=80=99s
>> are offlined. Since "g->p.nr_cpus" is 48, so function will go ahead
>> and set bit for CPU 8 also in cpumask ( td->bind_cpumask).
>>=20
>> bind_to_cpumask function is called to set affinity using
>> sched_setaffinity and the cpumask. Since the CPU8 is not present,
>> set affinity will fail here with EINVAL. Fix this issue by adding a
>> check to make sure that, CPU=E2=80=99s provided in the input argument =
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
>=20
> Please use
>=20
> int sysfs__read_str(const char *entry, char **buf, size_t *sizep)

Hi Arnaldo,

Sure, I will send a V3 for this separately which uses =
=E2=80=9Csysfs__read_str=E2=80=9D

Thanks for the review
Athira
>=20
> See how to use it in the smt_on() function at tools/perf/util/smt.c, =
for
> example.
>=20
> Now looking at the first patches in the series.
>=20
> - Arnaldo
>=20
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
>=20
> --=20
>=20
> - Arnaldo

