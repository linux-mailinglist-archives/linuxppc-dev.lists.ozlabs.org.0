Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A73279DF79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 07:37:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rKOln3ID;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlq306xlwz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:37:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rKOln3ID;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rlq256bdCz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 15:36:29 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D5YHWj010193;
	Wed, 13 Sep 2023 05:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XhyGhKxyi29jlVidFJz+Bs9lMjUotgYM8fo8K0ho2xA=;
 b=rKOln3IDnLi3CTkooBGaKJ5a9rzS+FpaYQf5XxbwRUkq44C6fFIw4XBsdZ8/eup23wCd
 m0QTOvrfLh1t0kfj47Ia8btjx45S9guiwS+U0H+Ui0axDGDm7PQ75IGUq7i9SwCRArEt
 moNAO3/iCvCw7NXjoO2pbpB7GYS3KN3UEHF305n5op3krrfZiLfp7ne2ADuS2QrR3Mwi
 gN4Aay0iQ4DoWmp1UPkltRSQL+kqcNkIMPq7QegClZbrolJKY0eVZo0Z6jvbM3igadRp
 JMpHXNclaaZDIeNXq5s+0qf1SJ5yOi1OBwD3D1uuzhwHaXM/sD4Hub15x6BO2AorkoHY JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t36wv8a90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 05:36:22 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38D5Phoa020462;
	Wed, 13 Sep 2023 05:36:03 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t36wv89v8-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 05:36:03 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38D40Lmh012169;
	Wed, 13 Sep 2023 05:02:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t13dyruru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 05:02:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38D52Z8E19202804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Sep 2023 05:02:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C5822004D;
	Wed, 13 Sep 2023 05:02:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 799DA20043;
	Wed, 13 Sep 2023 05:02:33 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.17.124])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 13 Sep 2023 05:02:33 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 0/3] Fix for shellcheck issues with version "0.6"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <67DF02AD-62FD-4E7B-9F85-A14166BD18AD@linux.vnet.ibm.com>
Date: Wed, 13 Sep 2023 10:32:22 +0530
Message-Id: <210B2506-3CC5-4544-A2D5-22E779CD1E47@linux.vnet.ibm.com>
References: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fXVSh0q6cQwQdGR-jxTTec_s43geZ02gEekrFbSvCKnZw@mail.gmail.com>
 <67DF02AD-62FD-4E7B-9F85-A14166BD18AD@linux.vnet.ibm.com>
To: Ian Rogers <irogers@google.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TuwZxSYrdvUls-73jyzQe14MBjDdTOYh
X-Proofpoint-GUID: rlVSZ9iI-xFH1gfcHf4PxsTWLx2OVW11
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309130046
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



> On 08-Sep-2023, at 7:47 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> w=
rote:
>=20
>=20
>=20
>> On 08-Sep-2023, at 5:20 AM, Ian Rogers <irogers@google.com> wrote:
>>=20
>> On Thu, Sep 7, 2023 at 10:17=E2=80=AFAM Athira Rajeev
>> <atrajeev@linux.vnet.ibm.com> wrote:
>>>=20
>>> From: root <root@ltcden13-lp4.aus.stglabs.ibm.com>
>>>=20
>>> shellcheck was run on perf tool shell scripts s a pre-requisite
>>> to include a build option for shellcheck discussed here:
>>> https://www.spinics.net/lists/linux-perf-users/msg25553.html
>>>=20
>>> And fixes were added for the coding/formatting issues in
>>> two patchsets:
>>> https://lore.kernel.org/linux-perf-users/20230613164145.50488-1-atrajee=
v@linux.vnet.ibm.com/
>>> https://lore.kernel.org/linux-perf-users/20230709182800.53002-1-atrajee=
v@linux.vnet.ibm.com/
>>>=20
>>> Three additional issues are observed with shellcheck "0.6" and
>>> this patchset covers those. With this patchset,
>>>=20
>>> # for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellchec=
k -S warning $F; done
>>> # echo $?
>>> 0
>>>=20
>>> Athira Rajeev (3):
>>> tests/shell: Fix shellcheck SC1090 to handle the location of sourced
>>>   files
>>> tests/shell: Fix shellcheck issues in tests/shell/stat+shadow_stat.sh
>>>   tetscase
>>> tests/shell: Fix shellcheck warnings for SC2153 in multiple scripts
>>=20
>> Series:
>> Tested-by: Ian Rogers <irogers@google.com>
>>=20
>> Thanks,
>> Ian
>=20
> Thanks Ian for checking the patch series
>=20
> Athira

Hi Arnaldo

Can you please check and pull this if it looks good to go .

Thanks
Athira

>>=20
>>> tools/perf/tests/shell/coresight/asm_pure_loop.sh            | 4 ++++
>>> tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh     | 4 ++++
>>> tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh | 4 ++++
>>> tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh  | 4 ++++
>>> tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh    | 4 ++++
>>> tools/perf/tests/shell/probe_vfs_getname.sh                  | 2 ++
>>> tools/perf/tests/shell/record+probe_libc_inet_pton.sh        | 2 ++
>>> tools/perf/tests/shell/record+script_probe_vfs_getname.sh    | 2 ++
>>> tools/perf/tests/shell/record.sh                             | 1 +
>>> tools/perf/tests/shell/stat+csv_output.sh                    | 1 +
>>> tools/perf/tests/shell/stat+csv_summary.sh                   | 4 ++--
>>> tools/perf/tests/shell/stat+shadow_stat.sh                   | 4 ++--
>>> tools/perf/tests/shell/stat+std_output.sh                    | 1 +
>>> tools/perf/tests/shell/test_intel_pt.sh                      | 1 +
>>> tools/perf/tests/shell/trace+probe_vfs_getname.sh            | 1 +
>>> 15 files changed, 35 insertions(+), 4 deletions(-)
>>>=20
>>> --
>>> 2.31.1


