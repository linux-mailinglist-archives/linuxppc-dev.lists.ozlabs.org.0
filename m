Return-Path: <linuxppc-dev+bounces-7974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7365A9BD21
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 05:07:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkHnS2YLsz2y34;
	Fri, 25 Apr 2025 13:07:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745550428;
	cv=none; b=JDosCpAY4gZRSaD//O0qJeIRTGFL2VbTcpTh+UICCs0TyJY6ATyQa7jf+dDnv3QMX0PFIfAclxfLC7Wxcipdbcv9MKl2x35mRjCRG97Lb4gl/qY0ue1PbBJQ0+RjB1I+gkH6qaobV3gJOMpz27q6bm2pRvt+RJnXD9OVk3xbDNgazrdWoOlbLzaNuJ43qP1kSlwL8E3hoqcqOQZsVYnMaN4GUFtJGMvG0AjocSkngfzIyC64zDVH7IsZJpi7ogVISPcVbPhmEnRZDkduKO+sWWQF/q9iMprKRVQqXRPLcb/gw3kWeoKgsryMBQQPid5yzaRLYUHEHFy/65ilemd//g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745550428; c=relaxed/relaxed;
	bh=SRNGBMoSb3s7Vy5483ZeuA/ZLGq91rfgnhuqY7903Sk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GCctAyFWUJi+jRXyFnobLpEazJwc9GAW0PnR43AHdf5mWKGSNcfAdot2q17u1sk0+y+US9unCZbJ93gKOyhW9Xx6f5Ti6ZRi+nuVBBuelQZaI3LioVi5t/UQ0r7u6AplcMVmtxS02Jx0ZQgwKwxTHKf8bihLurRuX2MqDl/ofqYK1ZJNWun2dJi5CeE5HiR4oiM8n7pfE7p7gqpNQ0NNQyvFO9S4eq0VLsoVzCDEO4P/ZFxdNSxFhlxZQ5f71c54Uvl169HDjIlMqJp+lc2Ltckvumh0fkeSQFEzO+PtTOJbBPHr8L9MEeOpqIzWuuMZJ/n/cVpPU/hUshgbx/3Nmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FFBKMikx; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FFBKMikx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkHnR3tgHz2y06
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 13:07:07 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OL3r6r001753;
	Fri, 25 Apr 2025 03:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SRNGBM
	oSb3s7Vy5483ZeuA/ZLGq91rfgnhuqY7903Sk=; b=FFBKMikxmYled8FIY/MLxx
	+4dkJ24oqb7UEACHDNzthrxTS1wyfBhtrGlO/NoMU00sreo3MTt/WnGXe4x0MHJV
	RCBpJ2n6LTlstt2FpP+Qnh/OZZX1qkpHLwQtOwsiSQdWUWLeviLxzVI9MKkn1QQW
	3lk0oucQL/70HPYwgPwZk4vyDS0Qh9pyKBozu6W+Q4ep/1Uyt2RG3bMJqtxCSFBY
	H8HcEEOvGb3hWG25IRhnweuhNdfzeB1aD326oZOYnsVqZufzJpBW/x6xcpBqSTLn
	2BF2MhuH3iAsuj5JN+HGb1vkZ/lZR4kQtyyBZ71bGVYgY+hJnkpmn78HcajYH1kA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467vvks4g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 03:06:40 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53P34cMO028902;
	Fri, 25 Apr 2025 03:06:40 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467vvks4fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 03:06:40 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53ONMGVC005872;
	Fri, 25 Apr 2025 03:06:38 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfxk9rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 03:06:38 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53P36YiL49611046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 03:06:34 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC7AE2004E;
	Fri, 25 Apr 2025 03:06:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A32A220043;
	Fri, 25 Apr 2025 03:06:26 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.248.200])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 25 Apr 2025 03:06:26 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH] perf build: Add tools/arch/x86/include/asm/amd/ibs.h to
 sync the headers
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <aAp_MGf8HcKJ1QjY@x1>
Date: Fri, 25 Apr 2025 08:36:12 +0530
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Disha Goel <disgoel@linux.vnet.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, jiang.peng9@zte.com.cn,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Tejas Manhas <Tejas.Manhas1@ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Ravi Bangoria <ravi.bangoria@amd.com>,
        Borislav Petkov <bp@alien8.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AF79F0E4-270E-4474-9B24-CB928D5D7D10@linux.ibm.com>
References: <20250424163033.6601-1-atrajeev@linux.ibm.com>
 <aAp_MGf8HcKJ1QjY@x1>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAyMSBTYWx0ZWRfX1paviqBCVrI+ wjenhs+KXPuYjVBvkf/xSLDPnSgSg+4m3C9YeZe+U0hAWb6zD/ZJAwnBKIgbb1U/Igo/SJlTXoz 3/eeBaiBYSxdM9rOIsaMAp+laEoJRInxDLbPMV+UCSeXdi1k2lqe/u3+E/v25O1SKVjfX9LCQ7w
 u+waFUsFb0fDmjzwl9Hp11qDaWgJQ7SL6ewscE+kLzgh7IwVOmW3C6uJQhZFj+lOPMa5A35DceL uJHUNvjEN01B7OaNZXEW92yXO9Oed6a1neoV4EFGf04TZwGKUb40w6O8wO+jARCpVDu6/vGM/iW pR6scTr5ZSbYAHHede0pqaW27mcPCvFVIYaBReahrapi6NDoNPYrSeqWacr63JlfFtVhN+6bsHe
 ZbhpIWdtfWjmfWw5oSiaSro3JeRL4t//p4ALjM+UVVxlTdusiTR6naokgwCHoeunuigpnoET
X-Proofpoint-ORIG-GUID: YYVv6p9g4S5gsO3jqMruqJBUOj5H7RdS
X-Proofpoint-GUID: tFGyZKvO9rbPyeB6lnQF_cRVLbE3fNDZ
X-Authority-Analysis: v=2.4 cv=HoF2G1TS c=1 sm=1 tr=0 ts=680afc40 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=zd2uoN0lAAAA:8 a=VnNF1IyMAAAA:8
 a=6YI-R7fC5oJlHMn984YA:9 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 24 Apr 2025, at 11:43=E2=80=AFPM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>=20
> On Thu, Apr 24, 2025 at 10:00:33PM +0530, Athira Rajeev wrote:
>> Headers sync up update for the patch that adds the original
>> copy of the IBS header file in arch/x86/include/asm/amd/ibs.h
>=20
>> Without this, perf shows build warning:
>=20
> Warning !=3D error, so shouldn't result in something stopping to work.
>=20
>> # make
>=20
> What is the cwd?
>=20
> Probably tools/perf/
Yes, it is from tools/perf
>=20
>>  BUILD:   Doing 'make -j24' parallel build
>> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory
>> Warning: Kernel ABI header differences:
>>  diff -u tools/include/uapi/linux/bits.h include/uapi/linux/bits.h
>>  diff -u tools/include/linux/bits.h include/linux/bits.h
>>  diff -u tools/include/vdso/unaligned.h include/vdso/unaligned.h
>>  diff -u tools/arch/x86/include/asm/cpufeatures.h =
arch/x86/include/asm/cpufeatures.h
>>  diff -u tools/arch/x86/include/asm/msr-index.h =
arch/x86/include/asm/msr-index.h
>>  diff -u tools/arch/x86/include/asm/amd/ibs.h =
arch/x86/include/asm/amd/ibs.h
>>  diff -u tools/arch/arm64/include/asm/cputype.h =
arch/arm64/include/asm/cputype.h
>=20
>> Add tools/arch/x86/include/asm/amd directory and also file
>> tools/arch/x86/include/asm/amd/ibs.h to sync up the kernel headers
>> with perf tools and fix the warning:
>=20
>> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory
>=20
>> Apart from the warning, the perf build also fails as below on =
powerpc:
>=20
>>  In file included from util/amd-sample-raw.c:12:0:
>>  =
/root/bug/tip/tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: =
fatal error: asm/msr-index.h: No such file or directory
>>   #include <asm/msr-index.h>
>>            ^~~~~~~~~~~~~~~~~
>>  compilation terminated.
>=20
>> To fix this, added this change:
>=20
>>  -#include <asm/msr-index.h>
>>  +#include "../msr-index.h"
>=20
>> And change the check-headers.sh entry to ignore this line when
>> comparing with the original kernel header.
>=20
> So, was this caused by some file being updated under tools/ that =
didn't
> go thru the maintainers for that area?
>=20
> It is important to read this file:
>=20
> tools/include/uapi/README
>=20
> Specially this part:
>=20
> The tools/perf/check-headers.sh script, part of the tools/ build
> process, points out changes in the original files.
>=20
> So its important not to touch the copies in tools/ when doing changes =
in
> the original kernel headers, that will be done later, when
> check-headers.sh inform about the change to the perf tools hackers.
>=20
> --
>=20
> So, files under tools/ should only be updated once it is determined =
that
> it doesn't break building tools/.

Hi Arnaldo, Namhyung

Thanks for responding and checking the patch.

This is breaking the tools/perf build in kernel tip. Sorry, I should =
have mentioned which tree this is observed and background.
It is reported for =
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git=20
and discussed here: =
https://lore.kernel.org/all/20250415133518.2c8d4325@canb.auug.org.au/
Reported build failure on powerpc for linux-next , after merge of the =
tip tree.

I could also recreate the build failure on powerpc when trying to =
compile perf with latest tip/master=20

  In file included from util/amd-sample-raw.c:12:0:
  =
/root/bug/tip/tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: =
fatal error: asm/msr-index.h: No such file or directory
   #include <asm/msr-index.h>
            ^~~~~~~~~~~~~~~~~
  compilation terminated.

To note: Build break is observed even without picking the amd/ibs.h file =
to tools path. Since we can=E2=80=99t change the kernel header file, I =
took the approach to sync the kernel header file to tools , change the =
include for =E2=80=9C../msr-index.h=E2=80=9D, and update =
check-headers.sh

This is observed after the commit change which moved amd-ibs.h to =
amd/ibs.h=20
Reference commit: =
https://lore.kernel.org/all/20250413084144.3746608-2-mingo@kernel.org/#t

This header file change is not landed in perf-tools-next : =
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.g=
it/tree/tools/arch/x86/include/asm?h=3Dtmp.perf-tools-next
So it is not observed in perf-tools-next yet..=20

Arnaldo, Namhyung
I am not sure when we can merge this fix, but as reported by Stephen, we =
are seeing build failure on powerpc when using =
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git  without =
this fix patch

Please share your thoughts..

So we have two issues:
1. Header file change from arch/x86/include/asm/amd-ibs.h to =
arch/x86/include/asm/amd/ibs.h , this is used by code =
"tools/perf/util/amd-sample-raw.c=E2=80=9D
 Reference commit : =
https://lore.kernel.org/all/20250413084144.3746608-2-mingo@kernel.org/#t

2. Build break on powerpc because it fails to find asm/msr-index.h which =
needs this change:
      -#include <asm/msr-index.h>
      +#include "../msr-index.h=E2=80=9D
    And also check-headers.sh change to ignore this line when comparing =
with the original kernel header.=20
   =20

Note: Similar change was done for tools/arch/x86/include/asm/amd-ibs.h =
as well. Reference commit below:
   =20
    commit dde994dd54fbf84f8fd14230de3477d552e42470
    Author: Kim Phillips <kim.phillips@amd.com>
    Date:   Tue Aug 17 17:15:08 2021 -0500

    perf report: Add tools/arch/x86/include/asm/amd-ibs.h
         This is a tools/-side patch for the patch that adds the =
original copy
    of the IBS header file, in arch/x86/include/asm/.
         We also add an entry to check-headers.sh, so future changes =
continue
    to be copied.
         Committer notes:
         Had to add this
           -#include <asm/msr-index.h>
      +#include "msr-index.h"
         And change the check-headers.sh entry to ignore this line when =
diffing
    with the original kernel header.

Thanks
Athira

>=20
> And for that to happen, just submit it as a separate patch that should
> be processed by tools people, if it makes sense.
>=20
> - Arnaldo
>=20
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
>> ---
>> tools/arch/x86/include/asm/amd/ibs.h | 158 =
+++++++++++++++++++++++++++
>> tools/perf/check-headers.sh          |   2 +-
>> 2 files changed, 159 insertions(+), 1 deletion(-)
>> create mode 100644 tools/arch/x86/include/asm/amd/ibs.h
>>=20
>> diff --git a/tools/arch/x86/include/asm/amd/ibs.h =
b/tools/arch/x86/include/asm/amd/ibs.h
>> new file mode 100644
>> index 000000000000..cbce54fec7b9
>> --- /dev/null
>> +++ b/tools/arch/x86/include/asm/amd/ibs.h
>> @@ -0,0 +1,158 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_X86_AMD_IBS_H
>> +#define _ASM_X86_AMD_IBS_H
>> +
>> +/*
>> + * =46rom PPR Vol 1 for AMD Family 19h Model 01h B1
>> + * 55898 Rev 0.35 - Feb 5, 2021
>> + */
>> +
>> +#include "../msr-index.h"
>> +
>> +/* IBS_OP_DATA2 DataSrc */
>> +#define IBS_DATA_SRC_LOC_CACHE  2
>> +#define IBS_DATA_SRC_DRAM  3
>> +#define IBS_DATA_SRC_REM_CACHE  4
>> +#define IBS_DATA_SRC_IO  7
>> +
>> +/* IBS_OP_DATA2 DataSrc Extension */
>> +#define IBS_DATA_SRC_EXT_LOC_CACHE  1
>> +#define IBS_DATA_SRC_EXT_NEAR_CCX_CACHE  2
>> +#define IBS_DATA_SRC_EXT_DRAM  3
>> +#define IBS_DATA_SRC_EXT_FAR_CCX_CACHE  5
>> +#define IBS_DATA_SRC_EXT_PMEM  6
>> +#define IBS_DATA_SRC_EXT_IO  7
>> +#define IBS_DATA_SRC_EXT_EXT_MEM  8
>> +#define IBS_DATA_SRC_EXT_PEER_AGENT_MEM 12
>> +
>> +/*
>> + * IBS Hardware MSRs
>> + */
>> +
>> +/* MSR 0xc0011030: IBS Fetch Control */
>> +union ibs_fetch_ctl {
>> + __u64 val;
>> + struct {
>> + __u64 fetch_maxcnt:16,/* 0-15: instruction fetch max. count */
>> + fetch_cnt:16, /* 16-31: instruction fetch count */
>> + fetch_lat:16, /* 32-47: instruction fetch latency */
>> + fetch_en:1, /* 48: instruction fetch enable */
>> + fetch_val:1, /* 49: instruction fetch valid */
>> + fetch_comp:1, /* 50: instruction fetch complete */
>> + ic_miss:1, /* 51: i-cache miss */
>> + phy_addr_valid:1,/* 52: physical address valid */
>> + l1tlb_pgsz:2, /* 53-54: i-cache L1TLB page size
>> +  *   (needs IbsPhyAddrValid) */
>> + l1tlb_miss:1, /* 55: i-cache fetch missed in L1TLB */
>> + l2tlb_miss:1, /* 56: i-cache fetch missed in L2TLB */
>> + rand_en:1, /* 57: random tagging enable */
>> + fetch_l2_miss:1,/* 58: L2 miss for sampled fetch
>> +  *      (needs IbsFetchComp) */
>> + l3_miss_only:1, /* 59: Collect L3 miss samples only */
>> + fetch_oc_miss:1,/* 60: Op cache miss for the sampled fetch */
>> + fetch_l3_miss:1,/* 61: L3 cache miss for the sampled fetch */
>> + reserved:2; /* 62-63: reserved */
>> + };
>> +};
>> +
>> +/* MSR 0xc0011033: IBS Execution Control */
>> +union ibs_op_ctl {
>> + __u64 val;
>> + struct {
>> + __u64 opmaxcnt:16, /* 0-15: periodic op max. count */
>> + l3_miss_only:1, /* 16: Collect L3 miss samples only */
>> + op_en:1, /* 17: op sampling enable */
>> + op_val:1, /* 18: op sample valid */
>> + cnt_ctl:1, /* 19: periodic op counter control */
>> + opmaxcnt_ext:7, /* 20-26: upper 7 bits of periodic op maximum count =
*/
>> + reserved0:5, /* 27-31: reserved */
>> + opcurcnt:27, /* 32-58: periodic op counter current count */
>> + ldlat_thrsh:4, /* 59-62: Load Latency threshold */
>> + ldlat_en:1; /* 63: Load Latency enabled */
>> + };
>> +};
>> +
>> +/* MSR 0xc0011035: IBS Op Data 1 */
>> +union ibs_op_data {
>> + __u64 val;
>> + struct {
>> + __u64 comp_to_ret_ctr:16, /* 0-15: op completion to retire count */
>> + tag_to_ret_ctr:16, /* 15-31: op tag to retire count */
>> + reserved1:2, /* 32-33: reserved */
>> + op_return:1, /* 34: return op */
>> + op_brn_taken:1, /* 35: taken branch op */
>> + op_brn_misp:1, /* 36: mispredicted branch op */
>> + op_brn_ret:1, /* 37: branch op retired */
>> + op_rip_invalid:1, /* 38: RIP is invalid */
>> + op_brn_fuse:1, /* 39: fused branch op */
>> + op_microcode:1, /* 40: microcode op */
>> + reserved2:23; /* 41-63: reserved */
>> + };
>> +};
>> +
>> +/* MSR 0xc0011036: IBS Op Data 2 */
>> +union ibs_op_data2 {
>> + __u64 val;
>> + struct {
>> + __u64 data_src_lo:3, /* 0-2: data source low */
>> + reserved0:1, /* 3: reserved */
>> + rmt_node:1, /* 4: destination node */
>> + cache_hit_st:1, /* 5: cache hit state */
>> + data_src_hi:2, /* 6-7: data source high */
>> + reserved1:56; /* 8-63: reserved */
>> + };
>> +};
>> +
>> +/* MSR 0xc0011037: IBS Op Data 3 */
>> +union ibs_op_data3 {
>> + __u64 val;
>> + struct {
>> + __u64 ld_op:1, /* 0: load op */
>> + st_op:1, /* 1: store op */
>> + dc_l1tlb_miss:1, /* 2: data cache L1TLB miss */
>> + dc_l2tlb_miss:1, /* 3: data cache L2TLB hit in 2M page */
>> + dc_l1tlb_hit_2m:1, /* 4: data cache L1TLB hit in 2M page */
>> + dc_l1tlb_hit_1g:1, /* 5: data cache L1TLB hit in 1G page */
>> + dc_l2tlb_hit_2m:1, /* 6: data cache L2TLB hit in 2M page */
>> + dc_miss:1, /* 7: data cache miss */
>> + dc_mis_acc:1, /* 8: misaligned access */
>> + reserved:4, /* 9-12: reserved */
>> + dc_wc_mem_acc:1, /* 13: write combining memory access */
>> + dc_uc_mem_acc:1, /* 14: uncacheable memory access */
>> + dc_locked_op:1, /* 15: locked operation */
>> + dc_miss_no_mab_alloc:1, /* 16: DC miss with no MAB allocated */
>> + dc_lin_addr_valid:1, /* 17: data cache linear address valid */
>> + dc_phy_addr_valid:1, /* 18: data cache physical address valid */
>> + dc_l2_tlb_hit_1g:1, /* 19: data cache L2 hit in 1GB page */
>> + l2_miss:1, /* 20: L2 cache miss */
>> + sw_pf:1, /* 21: software prefetch */
>> + op_mem_width:4, /* 22-25: load/store size in bytes */
>> + op_dc_miss_open_mem_reqs:6, /* 26-31: outstanding mem reqs on DC =
fill */
>> + dc_miss_lat:16, /* 32-47: data cache miss latency */
>> + tlb_refill_lat:16; /* 48-63: L1 TLB refill latency */
>> + };
>> +};
>> +
>> +/* MSR 0xc001103c: IBS Fetch Control Extended */
>> +union ic_ibs_extd_ctl {
>> + __u64 val;
>> + struct {
>> + __u64 itlb_refill_lat:16, /* 0-15: ITLB Refill latency for sampled =
fetch */
>> + reserved:48; /* 16-63: reserved */
>> + };
>> +};
>> +
>> +/*
>> + * IBS driver related
>> + */
>> +
>> +struct perf_ibs_data {
>> + u32 size;
>> + union {
>> + u32 data[0]; /* data buffer starts here */
>> + u32 caps;
>> + };
>> + u64 regs[MSR_AMD64_IBS_REG_COUNT_MAX];
>> +};
>> +
>> +#endif /* _ASM_X86_AMD_IBS_H */
>> diff --git a/tools/perf/check-headers.sh =
b/tools/perf/check-headers.sh
>> index e9fab20e9330..e1a1fdfa7115 100755
>> --- a/tools/perf/check-headers.sh
>> +++ b/tools/perf/check-headers.sh
>> @@ -186,7 +186,7 @@ done
>> # diff with extra ignore lines
>> check arch/x86/lib/memcpy_64.S        '-I "^EXPORT_SYMBOL" -I =
"^#include <asm/export.h>" =
-I"^SYM_FUNC_START\(_LOCAL\)*(memcpy_\(erms\|orig\))" -I"^#include =
<linux/cfi_types.h>"'
>> check arch/x86/lib/memset_64.S        '-I "^EXPORT_SYMBOL" -I =
"^#include <asm/export.h>" =
-I"^SYM_FUNC_START\(_LOCAL\)*(memset_\(erms\|orig\))"'
>> -check arch/x86/include/asm/amd/ibs.h  '-I "^#include =
[<\"]\(asm/\)*msr-index.h"'
>> +check arch/x86/include/asm/amd/ibs.h  '-I "^#include =
<asm/msr-index.h>" -I "^#include \"\.\./msr-index.h\""'
>> check arch/arm64/include/asm/cputype.h '-I "^#include =
[<\"]\(asm/\)*sysreg.h"'
>> check include/linux/unaligned.h '-I "^#include =
<linux/unaligned/packed_struct.h>" -I "^#include <asm/byteorder.h>" -I =
"^#pragma GCC diagnostic"'
>> check include/uapi/asm-generic/mman.h '-I "^#include =
<\(uapi/\)*asm-generic/mman-common\(-tools\)*.h>"'
>> --=20
>> 2.43.0



