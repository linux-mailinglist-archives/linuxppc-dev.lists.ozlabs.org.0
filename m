Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8487AF964
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 06:30:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o7jFGNH6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwNvF09sQz3cbc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 14:30:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o7jFGNH6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwNtL6DnQz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 14:29:30 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38R4CLic009802;
	Wed, 27 Sep 2023 04:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mtEEN+gJJfhHqTOsKJHFGzqOky1NF92g8ap1owPHgx8=;
 b=o7jFGNH6S5vv1Va9XH87byXpK9kmHQ+gQ+qnewgDwxDygkW8zL4PAwY+1obkSFvNF2bD
 3tdF46rbGMLbVvwjI6ZSj7Xyb5WP0enQpxRoqlzMEGa7pl1zXU8rTZQ7b5A1hF78p2wg
 NSitAKngVc5aadFLMvrjRtkc/JVnQujGjA91HA4mqRX0nBoSO0aFFEXECAzVi72yIWoN
 KtpcVAzbWxQGLMJXyoxtTrAeB5wWZg+6BjkHkJRQ32LGEvDefJZE2srNy9uhN43zX/My
 RuieDTo5o/fFFh/AIkOgY/jlsUGG0ooIss+YpHwmEgTe7mp7a7ex+M8iKjN7qGvhb4ff Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcd5bg9vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 04:29:24 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38R4Cnnm011233;
	Wed, 27 Sep 2023 04:29:23 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcd5bg9vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 04:29:23 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38R22wwR030409;
	Wed, 27 Sep 2023 04:29:22 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tad21r5g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 04:29:22 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38R4S5f924838888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 04:28:05 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 333CF2004D;
	Wed, 27 Sep 2023 04:28:05 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B66620043;
	Wed, 27 Sep 2023 04:28:01 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.105.243])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 27 Sep 2023 04:28:00 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 0/3] Fix for shellcheck issues with version "0.6"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <e5e806c3-da4a-8672-9c8e-6c341c6bd27d@linux.ibm.com>
Date: Wed, 27 Sep 2023 09:57:50 +0530
Message-Id: <11B32809-962E-4632-95FD-EAF07EE04D1D@linux.vnet.ibm.com>
References: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
 <e5e806c3-da4a-8672-9c8e-6c341c6bd27d@linux.ibm.com>
To: kajoljain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c1IEG49gcG0LMWQEggQMv4OT1g6pp5V6
X-Proofpoint-ORIG-GUID: 53dW3oVwj19JAcxfht2DcWuhe2GJWqJM
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_19,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270032
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, root <root@ltcden13-lp4.aus.stglabs.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 25-Sep-2023, at 1:34 PM, kajoljain <kjain@linux.ibm.com> wrote:
>=20
>=20
>=20
> On 9/7/23 22:45, Athira Rajeev wrote:
>> From: root <root@ltcden13-lp4.aus.stglabs.ibm.com>
>>=20
>> shellcheck was run on perf tool shell scripts s a pre-requisite
>> to include a build option for shellcheck discussed here:
>> https://www.spinics.net/lists/linux-perf-users/msg25553.html
>>=20
>> And fixes were added for the coding/formatting issues in
>> two patchsets:
>> https://lore.kernel.org/linux-perf-users/20230613164145.50488-1-atrajeev=
@linux.vnet.ibm.com/
>> https://lore.kernel.org/linux-perf-users/20230709182800.53002-1-atrajeev=
@linux.vnet.ibm.com/
>>=20
>> Three additional issues are observed with shellcheck "0.6" and
>> this patchset covers those. With this patchset,
>>=20
>> # for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellcheck=
 -S warning $F; done
>> # echo $?
>> 0
>>=20
>=20
> Patchset looks good to me.
>=20
> Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
>=20
> Thanks,
> Kajol Jain
>=20

Hi Namhyunbg,

Can you please check for this patchset also

Thanks
Athira

>> Athira Rajeev (3):
>>  tests/shell: Fix shellcheck SC1090 to handle the location of sourced
>>    files
>>  tests/shell: Fix shellcheck issues in tests/shell/stat+shadow_stat.sh
>>    tetscase
>>  tests/shell: Fix shellcheck warnings for SC2153 in multiple scripts
>>=20
>> tools/perf/tests/shell/coresight/asm_pure_loop.sh            | 4 ++++
>> tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh     | 4 ++++
>> tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh | 4 ++++
>> tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh  | 4 ++++
>> tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh    | 4 ++++
>> tools/perf/tests/shell/probe_vfs_getname.sh                  | 2 ++
>> tools/perf/tests/shell/record+probe_libc_inet_pton.sh        | 2 ++
>> tools/perf/tests/shell/record+script_probe_vfs_getname.sh    | 2 ++
>> tools/perf/tests/shell/record.sh                             | 1 +
>> tools/perf/tests/shell/stat+csv_output.sh                    | 1 +
>> tools/perf/tests/shell/stat+csv_summary.sh                   | 4 ++--
>> tools/perf/tests/shell/stat+shadow_stat.sh                   | 4 ++--
>> tools/perf/tests/shell/stat+std_output.sh                    | 1 +
>> tools/perf/tests/shell/test_intel_pt.sh                      | 1 +
>> tools/perf/tests/shell/trace+probe_vfs_getname.sh            | 1 +
>> 15 files changed, 35 insertions(+), 4 deletions(-)


