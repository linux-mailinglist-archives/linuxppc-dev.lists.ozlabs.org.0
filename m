Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD377A159A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 07:44:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a4u1XY3n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn35w2ryRz3dSd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 15:44:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a4u1XY3n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn32l1Txwz3dDw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 15:41:18 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F5bOtD030502;
	Fri, 15 Sep 2023 05:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=naHUU4wRwGM9UNMMdOsyb4IqX3+G0QafCNF1Hr2qT/0=;
 b=a4u1XY3nHiUxpQtTlgB9FDtEwxCVKXU1hQZ4lWEPmf4GqEchc7+r97J4jYnM1Xb71PGc
 54Jsoz9XjGdP9k9snmrGpb5DIqADZ2XZ5Tq+5Iw4ZIlj/lnXoEaMXVbzwje1aC+khaOx
 QVYl96qIh01Qw4juDTKBon0HntJuzPwI6lfV0lbhBNjpUbLvBjBvC8YpD8D+eScUPTxf
 5KA1LLTk9jHq77vd3RknDi5J9K3UHZkufBb5xXD8+j+RP5JV5ShlWPIEHV6DUPfPPbbk
 0jcKEjRYQFg4x255Al9SfIu7cX3KyIsCGJ9oSdRV3oBhdDLXrakvCaIWcurdKOiAva+f rA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4gwngu2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:41:10 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38F5bOCW030550;
	Fri, 15 Sep 2023 05:40:04 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4gwngs68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:40:04 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38F4xrqi022728;
	Fri, 15 Sep 2023 05:38:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t141p8kn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:38:48 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38F5cjd018285242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Sep 2023 05:38:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B05082004D;
	Fri, 15 Sep 2023 05:38:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A788A20049;
	Fri, 15 Sep 2023 05:38:43 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.67.213])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 15 Sep 2023 05:38:43 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH V3 2/2] tools/perf/tests: Fix object code reading to skip
 address that falls out of text section
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <d4bf783c-191a-a80b-8001-3597c634e814@intel.com>
Date: Fri, 15 Sep 2023 11:08:31 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <29D39955-4006-4C6F-8681-BB0E966AB39D@linux.vnet.ibm.com>
References: <20230915052412.2643-1-atrajeev@linux.vnet.ibm.com>
 <20230915052412.2643-2-atrajeev@linux.vnet.ibm.com>
 <d4bf783c-191a-a80b-8001-3597c634e814@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: plMH7mJER6eenCkaP_slGm76Uw9dZf-C
X-Proofpoint-ORIG-GUID: 4_-Zoc0-qa2jC7omLhDxbAthHBVnDKPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_05,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150049
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.ibm.com, Disha Goel <disgoel@linux.ibm.com>, kjain@linux.ibm.com, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 15-Sep-2023, at 10:56 AM, Adrian Hunter <adrian.hunter@intel.com> =
wrote:
>=20
> On 15/09/23 08:24, Athira Rajeev wrote:
>> The testcase "Object code reading" fails in somecases
>> for "fs_something" sub test as below:
>>=20
>>    Reading object code for memory address: 0xc008000007f0142c
>>    File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>>    On file address is: 0x1114cc
>>    Objdump command is: objdump -z -d --start-address=3D0x11142c =
--stop-address=3D0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>>    objdump read too few bytes: 128
>>    test child finished with -1
>>=20
>> This can alo be reproduced when running perf record with
>> workload that exercises fs_something() code. In the test
>> setup, this is exercising xfs code since root is xfs.
>>=20
>>    # perf record ./a.out
>>    # perf report -v |grep "xfs.ko"
>>      0.76% a.out /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  =
0xc008000007de5efc B [k] xlog_cil_commit
>>      0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  =
0xc008000007d5ae18 B [k] xfs_btree_key_offset
>>      0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  =
0xc008000007e11fd4 B [k] 0x0000000000112074
>>=20
>> Here addr "0xc008000007e11fd4" is not resolved. since this is a
>> kernel module, its offset is from the DSO. Xfs module is loaded
>> at 0xc008000007d00000
>>=20
>>   # cat /proc/modules | grep xfs
>>    xfs 2228224 3 - Live 0xc008000007d00000
>>=20
>> And size is 0x220000. So its loaded between  0xc008000007d00000
>> and 0xc008000007f20000. =46rom objdump, text section is:
>>    text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4
>>=20
>> Hence perf captured ip maps to 0x112074 which is:
>> ( ip - start of module ) + a0
>>=20
>> This offset 0x112074 falls out .text section which is up to 0x10f7bc
>> In this case for module, the address 0xc008000007e11fd4 is pointing
>> to stub instructions. This address range represents the module stubs
>> which is allocated on module load and hence is not part of DSO =
offset.
>>=20
>> To address this issue in "object code reading", skip the sample if
>> address falls out of text section and is within the module end.
>> Use the "text_end" member of "struct dso" to do this check.
>>=20
>> To address this issue in "perf report", exploring an option of
>> having stubs range as part of the /proc/kallsyms, so that perf
>> report can resolve addresses in stubs range
>>=20
>> However this patch uses text_end to skip the stub range for
>> Object code reading testcase.
>>=20
>> Reported-by: Disha Goel <disgoel@linux.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Tested-by: Disha Goel<disgoel@linux.ibm.com>
>> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>> Changelog:
>> v2 -> v3:
>> Used strtailcmp in comparison for module check and added Reviewed-by
>> from Adrian, Tested-by from Disha.
>>=20
>> v1 -> v2:
>> Updated comment to add description on which arch has stub and
>> reason for skipping as suggested by Adrian
>>=20
>> tools/perf/tests/code-reading.c | 10 ++++++++++
>> 1 file changed, 10 insertions(+)
>>=20
>> diff --git a/tools/perf/tests/code-reading.c =
b/tools/perf/tests/code-reading.c
>> index ed3815163d1b..45334d26058e 100644
>> --- a/tools/perf/tests/code-reading.c
>> +++ b/tools/perf/tests/code-reading.c
>> @@ -269,6 +269,16 @@ static int read_object_code(u64 addr, size_t =
len, u8 cpumode,
>> if (addr + len > map__end(al.map))
>> len =3D map__end(al.map) - addr;
>>=20
>> + /*
>> +  * Some architectures (ex: powerpc) have stubs (trampolines) in =
kernel
>> +  * modules to manage long jumps. Check if the ip offset falls in =
stubs
>> +  * sections for kernel modules. And skip module address after text =
end
>> +  */
>> + if (!strtailcmp(dso->long_name, ".ko") && al.addr > dso->text_end) =
{
>> + pr_debug("skipping the module address %#"PRIx64" after text end\n", =
al.addr);
>> + goto out;
>=20
> Double indent

My bad, addressed in V4

Athira
>=20
>> + }
>> +
>> /* Read the object code using perf */
>> ret_len =3D dso__data_read_offset(dso, =
maps__machine(thread__maps(thread)),
>> al.addr, buf1, len);


