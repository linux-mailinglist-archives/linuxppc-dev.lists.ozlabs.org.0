Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE69979886B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 16:18:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DYEJUADs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhyrS4gz6z3c2L
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 00:18:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DYEJUADs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhyqY2kbqz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 00:17:28 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388E9bpx006336;
	Fri, 8 Sep 2023 14:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XV+3s/W8iqjhoMoial6jZIiBLUDPzSOHN7enpDKgUvM=;
 b=DYEJUADsdEODEjr6IO/dBgwMsdBxqFefoP1wVGXk8PshgXgpZrFJ39OI63OAzn7uPsgO
 NAUJi/KrtcFmB8DWqvqmlIALrne8k5TNE4/m/r8P5bHtzDBBknihFgBnGsLlhC27VzCr
 jaQD8Q4p8TljDfesgzERy7KJEUxFXIx+TnmQxLzf48c/CHfNC8QTbNfjNGEvM1L9pF40
 J+oGJ4h4ZJwn8dVzxy6Q6kMdEnUhxh7Vn6hTzOzOUIsmV+nA7g/0z0lcNJ0i9KT3FV6e
 Zuo+1IFfV7MmB+TAsUJOoQk8R5OMq6pyV7yIRlWh3zFSJvNE6sIAsl+W+a2WRiXwxVOs Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t04vsrq9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 14:17:19 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 388E9jau007575;
	Fri, 8 Sep 2023 14:17:18 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t04vsrq9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 14:17:18 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 388C3ecf012232;
	Fri, 8 Sep 2023 14:17:18 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svhkkkta4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 14:17:18 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 388EHFAU46400246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Sep 2023 14:17:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59A992004B;
	Fri,  8 Sep 2023 14:17:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C38D2004D;
	Fri,  8 Sep 2023 14:17:13 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.123.252])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  8 Sep 2023 14:17:13 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 0/3] Fix for shellcheck issues with version "0.6"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fXVSh0q6cQwQdGR-jxTTec_s43geZ02gEekrFbSvCKnZw@mail.gmail.com>
Date: Fri, 8 Sep 2023 19:47:01 +0530
Message-Id: <67DF02AD-62FD-4E7B-9F85-A14166BD18AD@linux.vnet.ibm.com>
References: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fXVSh0q6cQwQdGR-jxTTec_s43geZ02gEekrFbSvCKnZw@mail.gmail.com>
To: Ian Rogers <irogers@google.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jbOL6B6xDCYoouKNQcICJgcZybxt-oAQ
X-Proofpoint-ORIG-GUID: ls4BhvdG2P0PDuddmy6eFPLsHqyP2h-s
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080130
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 08-Sep-2023, at 5:20 AM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Thu, Sep 7, 2023 at 10:17=E2=80=AFAM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
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
>> Athira Rajeev (3):
>>  tests/shell: Fix shellcheck SC1090 to handle the location of sourced
>>    files
>>  tests/shell: Fix shellcheck issues in tests/shell/stat+shadow_stat.sh
>>    tetscase
>>  tests/shell: Fix shellcheck warnings for SC2153 in multiple scripts
>=20
> Series:
> Tested-by: Ian Rogers <irogers@google.com>
>=20
> Thanks,
> Ian

Thanks Ian for checking the patch series

Athira
>=20
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
>>=20
>> --
>> 2.31.1


