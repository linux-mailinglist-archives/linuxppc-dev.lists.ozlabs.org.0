Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9FD7975CD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 17:57:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MEzQ7pIZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhP531lSWz3cC9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 01:57:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MEzQ7pIZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhP473Mvqz3c1B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 01:56:23 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387FdE0m000353;
	Thu, 7 Sep 2023 15:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=3PJMAKNBMgb1JiVgtXz+Tkd9c7G31YFDAEJMC7cu55s=;
 b=MEzQ7pIZaDFzuxlea3gHl1VyhGybcjD3Owij4Zq3CJeBB0g/4qCtcnmOXsK6R1Z96PYV
 Ehzpyp6wFdqbhpI7ywLalRBdr+UBDDhkGt0oIsOCfujfxHbzJ//UvWsuIYC+0CA+bWiz
 n66rf7KUt9cB0NLZ0/2yJ/J/ZKWo7FGZ+E+6KJymUL1LKCoqF4uevNS5+L/w+6tkRnn/
 YnK3eX9Fb3WEXT/55ZmpgsEFgPLrJbyhhJi3nTlPfbd8FUTzDbhsN8DcJUgtYHrtK97m
 fMqnmY2Pc8eTcVomjbHCh1qA/Khc4/W4wwQgURMS8rM0CvbmJKzCh7LwxWjoj4tLZXFw +g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syfcuktm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 15:56:09 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 387FddYD002008;
	Thu, 7 Sep 2023 15:56:08 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syfcuktm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 15:56:08 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 387DjtLE026809;
	Thu, 7 Sep 2023 15:56:07 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgcnvtt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 15:56:07 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 387Fu4lT16908942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Sep 2023 15:56:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92AD020043;
	Thu,  7 Sep 2023 15:56:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6151D20040;
	Thu,  7 Sep 2023 15:56:02 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.9.102])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  7 Sep 2023 15:56:02 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH V2 2/2] tools/perf/tests: Fix object code reading to skip
 address that falls out of text section
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <da3492ac-5473-f25b-f229-f213242321b1@intel.com>
Date: Thu, 7 Sep 2023 21:25:50 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA07D95F-CEDF-43B2-99B5-D71262E0FC2F@linux.vnet.ibm.com>
References: <20230817171852.55629-1-atrajeev@linux.vnet.ibm.com>
 <20230817171852.55629-2-atrajeev@linux.vnet.ibm.com>
 <da3492ac-5473-f25b-f229-f213242321b1@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ghh8gS9syppGOoE5asJU4YMlH9SZmyUC
X-Proofpoint-GUID: AXB6GwPEHRvRt6mAh7sBwEL4zX4HWfLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_07,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070138
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.ibm.com, Disha Goel <disgoel@linux.ibm.com>, kjain@linux.ibm.com, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18-Aug-2023, at 12:45 PM, Adrian Hunter <adrian.hunter@intel.com> =
wrote:
>=20
> On 17/08/23 20:18, Athira Rajeev wrote:
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
>> ---
>> tools/perf/tests/code-reading.c | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>>=20
>> diff --git a/tools/perf/tests/code-reading.c =
b/tools/perf/tests/code-reading.c
>> index ed3815163d1b..911f8fa13677 100644
>> --- a/tools/perf/tests/code-reading.c
>> +++ b/tools/perf/tests/code-reading.c
>> @@ -269,6 +269,14 @@ static int read_object_code(u64 addr, size_t =
len, u8 cpumode,
>> if (addr + len > map__end(al.map))
>> len =3D map__end(al.map) - addr;
>>=20
>> + /* Check if the ip offset falls in stubs sections for kernel =
modules */
>=20
> What arches have stubs - maybe expand the comment a bit e.g.
> "Some architectures (such as blah blah) have stubs (trampolines) in =
kernel modules to manage long jumps=E2=80=9D
Ok
>=20
>> + if (strstr(dso->long_name, ".ko")) {
>> + if ((al.addr < map__end(al.map)) && (al.addr > dso->text_end)) {
>=20
> Why check al.addr < map__end(al.map) ?  addr must be on the map =
mustn't it?

Yes, you are right.=20
>=20
> Also please remove redundant parentheses.
>=20
>> + pr_debug(" - skipping\n");
>=20
> "skipping" but why.  Maybe "skipping module address after text end"

Sure, will post V2 with these changes

Thanks
Athira
>=20
>> + goto out;
>> + }
>> + }
>> +
>> /* Read the object code using perf */
>> ret_len =3D dso__data_read_offset(dso, =
maps__machine(thread__maps(thread)),
>> al.addr, buf1, len);


