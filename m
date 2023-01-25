Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20667B513
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 15:48:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P26C64K92z3chB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 01:48:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lKyyMA2x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lKyyMA2x;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P26B516Yhz3c8q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 01:47:08 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PD0PB7024723;
	Wed, 25 Jan 2023 14:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=CvlcmbH0qTInX0A+nwgYbdcXh2tOkhnQ6lhXSXZM6FU=;
 b=lKyyMA2xeIRY47hvgl2urA0Oz1h2PMDNiin8eRDUInUdAEqm0Su7PEC512YfKV4VcQVe
 ivWUU5EK0FNw3Y1VbX9A3DVsbGPPUV/A0XUBzhgWjqq/SrXeLWeFA9OqpOm/0729iT+3
 T9bn5/xVyU9qRgA65syOnkL7BUjVGa8bSwieus18ZF6b7FdTF2cSAyA8/COeSev0GdWk
 s+SpmzokQUGDel1JCbvXiED5I0Bj54AxcOv6FCExZmlRATBYDDu0yLcJhV9bubhhFkl5
 tGDB+HwGVq8+e6g6USg9nTK2Nnm4ouvPb6pgqFg7ZjELxmk0SgSOHiIc5J+cVnCYU8Xj +w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nac9670p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 14:46:49 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30PD75PC020825;
	Wed, 25 Jan 2023 14:46:49 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nac9670ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 14:46:49 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30OFtTpa015310;
	Wed, 25 Jan 2023 14:46:47 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n87p6br4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 14:46:47 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30PEkhin23855678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 14:46:43 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A67002004F;
	Wed, 25 Jan 2023 14:46:43 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7343C20040;
	Wed, 25 Jan 2023 14:46:39 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.36.173])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 25 Jan 2023 14:46:39 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] tools/perf: Disable perf probe when libtraceevent is
 missing
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Y8qlIuDCpkj523xE@kernel.org>
Date: Wed, 25 Jan 2023 20:16:36 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <70A54F83-E7C5-4821-BA6A-D51A555DAAC0@linux.vnet.ibm.com>
References: <20230120120256.34694-1-atrajeev@linux.vnet.ibm.com>
 <Y8qlIuDCpkj523xE@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X2gwQaKGkU_-oCxsBOWcavd6pYcG2u-r
X-Proofpoint-ORIG-GUID: 6uaTiR7StDtWRh5Qz6umKYnQa_LcPOLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_08,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250129
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
Cc: Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 20-Jan-2023, at 7:58 PM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>=20
> Em Fri, Jan 20, 2023 at 05:32:56PM +0530, Athira Rajeev escreveu:
>> While parsing the tracepoint events in parse_events_add_tracepoint()
>> function, code checks for HAVE_LIBTRACEEVENT support. This is needed
>> since libtraceevent is necessary for tracepoint. But while adding
>> probe points, check for LIBTRACEEVENT is not done in case of perf =
probe.
>> Hence, in environment with missing libtraceevent-devel, it is
>> observed that adding a probe point works even though its not
>> supported.
>=20
>> Example:
>> Adding probe point:
>> 	./perf probe 'vfs_getname=3Dgetname_flags:72 =
pathname=3Dresult->name:string'
>> 	Added new event:
>> 	  probe:vfs_getname    (on getname_flags:72 with =
pathname=3Dresult->name:string)
>=20
>> 	You can now use it in all perf tools, such as:
>=20
>> 		perf record -e probe:vfs_getname -aR sleep 1
>=20
>> But trying perf record:
>> 	./perf  record -e probe:vfs_getname -aR sleep 1
>> 	event syntax error: 'probe:vfs_getname'
>> 				\___ unsupported tracepoint
>> 	libtraceevent is necessary for tracepoint support
>> 	Run 'perf list' for a list of valid events
>>=20
>> Fix this by wrapping "builtin-probe" compilation and
>> "perf probe" usage under "CONFIG_LIBTRACEEVENT" check.
>=20
> Humm, but 'perf probe' continues to work, as uou demoed above, the
> problem is with the suggestion to use other perf tools that need to
> parse tracefs and without libtraceevent, currently can't do it:
>=20
> [root@quaco ~]# perf probe 'vfs_getname=3Dgetname_flags:72 =
pathname=3Dresult->name:string'
> Added new event:
>  probe:vfs_getname    (on getname_flags:72 with =
pathname=3Dresult->name:string)
>=20
> You can now use it in all perf tools, such as:
>=20
> 	perf record -e probe:vfs_getname -aR sleep 1
>=20
> [root@quaco ~]# perf probe -l
>  probe:vfs_getname    (on getname_flags:72@fs/namei.c with pathname)
> [root@quaco ~]# perf trace -e probe:vfs_getname
> perf: 'trace' is not a perf-command. See 'perf --help'.
> [root@quaco ~]# cd /sys/kernel/tracing/events/probe/vfs_getname/
> [root@quaco vfs_getname]# ls
> enable  filter  format  hist  id  trigger
> [root@quaco vfs_getname]# ls -la
> total 0
> drwxr-x---. 2 root root 0 Jan 20 11:18 .
> drwxr-x---. 3 root root 0 Jan 20 11:18 ..
> -rw-r-----. 1 root root 0 Jan 20 11:18 enable
> -rw-r-----. 1 root root 0 Jan 20 11:18 filter
> -r--r-----. 1 root root 0 Jan 20 11:18 format
> -r--r-----. 1 root root 0 Jan 20 11:18 hist
> -r--r-----. 1 root root 0 Jan 20 11:18 id
> -rw-r-----. 1 root root 0 Jan 20 11:18 trigger
> [root@quaco vfs_getname]#
>=20
> But we can go on from there:
>=20
> [root@quaco tracing]# pwd
> /sys/kernel/tracing
> [root@quaco tracing]# echo 1 > =
/sys/kernel/tracing/events/probe/vfs_getname/enable
> [root@quaco tracing]# echo 1 > tracing_on
> [root@quaco tracing]# head trace_pipe
>    systemd-oomd-979     [003] ..... 96369.978971: vfs_getname: =
(getname_flags.part.0+0x6b/0x1c0) =
pathname=3D"/sys/fs/cgroup/user.slice/user-1000.slice/user@1000.service"
>    systemd-oomd-979     [003] ..... 96369.979022: vfs_getname: =
(getname_flags.part.0+0x6b/0x1c0) =
pathname=3D"/sys/fs/cgroup/user.slice/user-1000.slice/user@1000.service/me=
mory.current"
>    systemd-oomd-979     [003] ..... 96369.979084: vfs_getname: =
(getname_flags.part.0+0x6b/0x1c0) pathname=3D""
>    systemd-oomd-979     [003] ..... 96369.979162: vfs_getname: =
(getname_flags.part.0+0x6b/0x1c0) =
pathname=3D"/sys/fs/cgroup/user.slice/user-1000.slice/user@1000.service/me=
mory.min"
>    systemd-oomd-979     [003] ..... 96369.979197: vfs_getname: =
(getname_flags.part.0+0x6b/0x1c0) pathname=3D""
>    systemd-oomd-979     [003] ..... 96369.979267: vfs_getname: =
(getname_flags.part.0+0x6b/0x1c0) =
pathname=3D"/sys/fs/cgroup/user.slice/user-1000.slice/user@1000.service/me=
mory.low"
>    systemd-oomd-979     [003] ..... 96369.979303: vfs_getname: =
(getname_flags.part.0+0x6b/0x1c0) pathname=3D""
>    systemd-oomd-979     [003] ..... 96369.979372: vfs_getname: =
(getname_flags.part.0+0x6b/0x1c0) =
pathname=3D"/sys/fs/cgroup/user.slice/user-1000.slice/user@1000.service/me=
mory.swap.current"
>    systemd-oomd-979     [003] ..... 96369.979406: vfs_getname: =
(getname_flags.part.0+0x6b/0x1c0) pathname=3D""
>    systemd-oomd-979     [003] ..... 96369.979475: vfs_getname: =
(getname_flags.part.0+0x6b/0x1c0) =
pathname=3D"/sys/fs/cgroup/user.slice/user-1000.slice/user@1000.service/me=
mory.stat"
> [root@quaco tracing]#
>=20
> So you could instead replace the suggestion from:
>=20
> "
>       You can now use it in all perf tools, such as:
>=20
>               perf record -e probe:vfs_getname -aR sleep 1
> "
>=20
> To:
>=20
> "
> 	perf is not linked with libtraceevent, to use the new probe you
> 	can use tracefs:
>=20
> 		cd /sys/kernel/tracing/
> 		echo 1 > events/probe/vfs_getname/enable
> 		echo 1 > tracing_on
> 		cat trace_pipe
> "
>=20
> wdyt?

Hi Arnaldo,

Thanks for the suggestion. The idea to change usage message based on =
presence of libtraceevent is good.
I could try change with HAVE_LIBTRACEEVENT condition. Sample snippet =
below:

diff --git a/tools/perf/builtin-probe.c b/tools/perf/builtin-probe.c
index ed73d0b89ca2..f010d0e43577 100644
--- a/tools/perf/builtin-probe.c
+++ b/tools/perf/builtin-probe.c
@@ -383,9 +383,17 @@ static int perf_add_probe_events(struct =
perf_probe_event *pevs, int npevs)
=20
        /* Note that it is possible to skip all events because of =
blacklist */
        if (event) {
+#ifndef HAVE_LIBTRACEEVENT
+               pr_info("\nperf is not linked with libtraceevent, to use =
the new probe you can use tracefs:\n\n");
+               pr_info("\tcd /sys/kernel/tracing/\n");
+               pr_info("\techo 1 > events/%s/%s/enable\n", group, =
event);
+               pr_info("\techo 1 > tracing_on\n");
+               pr_info("\tcat trace_pipe\n");
+#else
                /* Show how to use the event. */
                pr_info("\nYou can now use it in all perf tools, such =
as:\n\n");
                pr_info("\tperf record -e %s:%s -aR sleep 1\n\n", group, =
event);
+#endif
        }
=20
 out_cleanup:

I will re-work on patch changes and also test for other options ( perf =
probe with different group =E2=80=9CGROUP" values etc) to make sure this =
works via tracefs.
Arnaldo, the above approach looks fine to proceed with ?

Thanks
Athira


>=20
> - Arnaldo
>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/Build  | 4 +++-
>> tools/perf/perf.c | 2 ++
>> 2 files changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/tools/perf/Build b/tools/perf/Build
>> index 6dd67e502295..a138a2304929 100644
>> --- a/tools/perf/Build
>> +++ b/tools/perf/Build
>> @@ -33,7 +33,9 @@ ifeq ($(CONFIG_LIBTRACEEVENT),y)
>>   perf-$(CONFIG_TRACE) +=3D trace/beauty/
>> endif
>>=20
>> -perf-$(CONFIG_LIBELF) +=3D builtin-probe.o
>> +ifeq ($(CONFIG_LIBTRACEEVENT),y)
>> +  perf-$(CONFIG_LIBELF) +=3D builtin-probe.o
>> +endif
>>=20
>> perf-y +=3D bench/
>> perf-y +=3D tests/
>> diff --git a/tools/perf/perf.c b/tools/perf/perf.c
>> index 82bbe0ca858b..7b0d79284d5a 100644
>> --- a/tools/perf/perf.c
>> +++ b/tools/perf/perf.c
>> @@ -80,9 +80,11 @@ static struct cmd_struct commands[] =3D {
>> #ifdef HAVE_LIBTRACEEVENT
>> 	{ "sched",	cmd_sched,	0 },
>> #endif
>> +#ifdef HAVE_LIBTRACEEVENT
>> #ifdef HAVE_LIBELF_SUPPORT
>> 	{ "probe",	cmd_probe,	0 },
>> #endif
>> +#endif
>> #ifdef HAVE_LIBTRACEEVENT
>> 	{ "kmem",	cmd_kmem,	0 },
>> 	{ "lock",	cmd_lock,	0 },
>> --=20
>> 2.39.0
>=20
> --=20
>=20
> - Arnaldo

