Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE77FCE3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 06:25:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=puIJfeNh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg77n5w6Rz3d8y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 16:25:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=puIJfeNh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg76w4jmrz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 16:24:40 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT5E4VS018426;
	Wed, 29 Nov 2023 05:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=IbJw7nl0JnTIXKoXWcz+D+hyBTQRmhEtnAVn4qZ49tU=;
 b=puIJfeNhjvW7TYOL4852Xn6kWMAXwbKZewMp57DtOG/o9I9W8UKJOEKYrX28x98VTB+l
 3m3vLIuMi/iiEzHF9pSovPOVR5DnGkBdJMqeYawpIPxR8dHVdjYz0ii9oTpWg5fBoon8
 wNLddkbCSmyOHjl9IO5gGlPrxRY3l5p/uuARS5UOK0m+C6crkHMKgffxi51JEFVl1gBG
 hD1oMcExPsVs4sFEXqkw5BdLPoy3BTPjqRHsLdXzKOhqpDLo80YciWdr9v2Z2T+On1EO
 YRC85MwB04wF3Xtzt1+VcYz71muUbskEjuTGyd/in5vk5L6hFso6Wrt2t1tlTrJCkD5m Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unxc793y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 05:24:32 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AT5EFNn019589;
	Wed, 29 Nov 2023 05:24:31 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unxc793xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 05:24:31 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT5IBbQ028293;
	Wed, 29 Nov 2023 05:24:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukv8nn6d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 05:24:30 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AT5OROQ44892844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Nov 2023 05:24:28 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6D5A20040;
	Wed, 29 Nov 2023 05:24:27 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2C9E20043;
	Wed, 29 Nov 2023 05:24:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.74.136])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 29 Nov 2023 05:24:24 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH] perf test record+probe_libc_inet_pton: Fix call chain
 match on powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20231126070914.175332-1-likhitha@linux.ibm.com>
Date: Wed, 29 Nov 2023 10:54:12 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <77B600DB-2A88-4634-8788-76C3D70C136F@linux.vnet.ibm.com>
References: <20231126070914.175332-1-likhitha@linux.ibm.com>
To: Likhitha Korrapati <likhitha@linux.ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WqdZ9kVS-uI8cK8kid5B2y-GYSLWLohm
X-Proofpoint-GUID: 7vt4kGQg2E-xdV17MwlC27h40iQlFjjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_02,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290039
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 26-Nov-2023, at 12:39=E2=80=AFPM, Likhitha Korrapati =
<likhitha@linux.ibm.com> wrote:
>=20
> The perf test "probe libc's inet_pton & backtrace it with ping" fails =
on
> powerpc as below:
>=20
> root@xxx perf]# perf test -v "probe libc's inet_pton & backtrace it =
with
> ping"
> 85: probe libc's inet_pton & backtrace it with ping                 :
> --- start ---
> test child forked, pid 96028
> ping 96056 [002] 127271.101961: probe_libc:inet_pton: (7fffa1779a60)
> 7fffa1779a60 __GI___inet_pton+0x0
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> 7fffa172a73c getaddrinfo+0x121c
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> FAIL: expected backtrace entry
> =
"gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\(/usr/lib64/glibc-hwcaps/power10/=
libc.so.6\)$"
> got "7fffa172a73c getaddrinfo+0x121c
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)"
> test child finished with -1
> ---- end ----
> probe libc's inet_pton & backtrace it with ping: FAILED!

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira
>=20
> This test installs a probe on libc's inet_pton function, which will =
use
> uprobes and then uses perf trace on a ping to localhost. It gets 3
> levels deep backtrace and checks whether it is what we expected or =
not.
>=20
> The test started failing from RHEL 9.4 where as it works in previous
> distro version (RHEL 9.2). Test expects gaih_inet function to be part =
of
> backtrace. But in the glibc version (2.34-86) which is part of distro
> where it fails, this function is missing and hence the test is =
failing.
>=20
> =46rom nm and ping command output we can confirm that gaih_inet =
function
> is not present in the expected backtrace for glibc version =
glibc-2.34-86
>=20
> [root@xxx perf]# nm /usr/lib64/glibc-hwcaps/power10/libc.so.6 | grep =
gaih_inet
> 00000000001273e0 t gaih_inet_serv
> 00000000001cd8d8 r gaih_inet_typeproto
>=20
> [root@xxx perf]# perf script -i /tmp/perf.data.6E8
> ping  104048 [000] 128582.508976: probe_libc:inet_pton: (7fff83779a60)
>            7fff83779a60 __GI___inet_pton+0x0
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>            7fff8372a73c getaddrinfo+0x121c
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>               11dc73534 [unknown] (/usr/bin/ping)
>            7fff8362a8c4 __libc_start_call_main+0x84
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>=20
> FAIL: expected backtrace entry
> =
"gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\(/usr/lib64/glibc-hwcaps/power10/=
libc.so.6\)$"
> got "7fff9d52a73c getaddrinfo+0x121c
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)"
>=20
> With version glibc-2.34-60 gaih_inet function is present as part of =
the
> expected backtrace. So we cannot just remove the gaih_inet function =
from
> the backtrace.
>=20
> [root@xxx perf]# nm /usr/lib64/glibc-hwcaps/power10/libc.so.6 | grep =
gaih_inet
> 0000000000130490 t gaih_inet.constprop.0
> 000000000012e830 t gaih_inet_serv
> 00000000001d45e4 r gaih_inet_typeproto
>=20
> [root@xxx perf]# ./perf script -i /tmp/perf.data.b6S
> ping   67906 [000] 22699.591699: probe_libc:inet_pton_3: =
(7fffbdd80820)
>            7fffbdd80820 __GI___inet_pton+0x0
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>            7fffbdd31160 gaih_inet.constprop.0+0xcd0
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>            7fffbdd31c7c getaddrinfo+0x14c
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>               1140d3558 [unknown] (/usr/bin/ping)
>=20
> This patch solves this issue by doing a conditional skip. If there is =
a
> gaih_inet function present in the libc then it will be added to the
> expected backtrace else the function will be skipped from being added
> to the expected backtrace.
>=20
> Output with the patch
>=20
> [root@xxx perf]# ./perf test -v "probe libc's inet_pton & backtrace it
> with ping"
> 83: probe libc's inet_pton & backtrace it with ping                 :
> --- start ---
> test child forked, pid 102662
> ping 102692 [000] 127935.549973: probe_libc:inet_pton: (7fff93379a60)
> 7fff93379a60 __GI___inet_pton+0x0
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> 7fff9332a73c getaddrinfo+0x121c
> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> 11ef03534 [unknown] (/usr/bin/ping)
> test child finished with 0
> ---- end ----
> probe libc's inet_pton & backtrace it with ping: Ok
>=20
> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
> Reported-by: Disha Goel <disgoel@linux.ibm.com>
> ---
> tools/perf/tests/shell/record+probe_libc_inet_pton.sh | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh =
b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> index eebeea6bdc76..72c65570db37 100755
> --- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> +++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> @@ -45,7 +45,10 @@ trace_libc_inet_pton_backtrace() {
> ;;
> ppc64|ppc64le)
> eventattr=3D'max-stack=3D4'
> - echo "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\($libc\)$" >> =
$expected
> + # Add gaih_inet to expected backtrace only if it is part of libc.
> + if nm $libc | grep -F -q gaih_inet.; then
> + echo "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\($libc\)$" >> =
$expected
> + fi
> echo "getaddrinfo\+0x[[:xdigit:]]+[[:space:]]\($libc\)$" >> $expected
> echo ".*(\+0x[[:xdigit:]]+|\[unknown\])[[:space:]]\(.*/bin/ping.*\)$" =
>> $expected
> ;;
> --=20
> 2.39.1
>=20

