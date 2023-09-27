Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ED97B076C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 16:56:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eCCwP9Y8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwfnZ4bMgz3cHT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 00:56:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eCCwP9Y8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rwfmc6mZJz2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 00:55:28 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38REghU5003996;
	Wed, 27 Sep 2023 14:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=/HRHgO9g6deKHZBCs77OXG2fnILYcZ2l2mq6hjaEF1w=;
 b=eCCwP9Y8/Da0r3Nfnp81GnELVUKoopel7wfB79DwQPxRmt45NjrTzhNTt87InD3/YxyR
 SbOI0nJg6Jx+gemodsP8QgdiGzMndYSkrv/ozQmYzPUq72EF7gELSrPWstMCbw+t70Qx
 0lfXDqaGYJSGw773IsBZbJDWYO2YbE1YYaiT7ESErp1SWZMhA12Pe/b7d+rK3kzRPeFb
 QZB/hyAxgtywWBj9NW2Eac+4Qg7/JLczgVINhECYOQLemBKn2X90C4XdKUCBHsUU3YNC
 n/QWSfOlyGvLp5QGIbRxjq+umErwcqph7UZWP8QexM+kkOOvoyBWqVqCMrDmdKVFXtqa hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcnq0skts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 14:55:20 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38REhYrM006619;
	Wed, 27 Sep 2023 14:55:19 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcnq0sktj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 14:55:19 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38RCbQvf008386;
	Wed, 27 Sep 2023 14:55:19 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3taabsvn78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 14:55:19 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38REtGBd40698486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 14:55:16 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A85A20040;
	Wed, 27 Sep 2023 14:55:16 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6205B20043;
	Wed, 27 Sep 2023 14:55:14 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.112.215])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 27 Sep 2023 14:55:14 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH V4 2/2] tools/perf/tests: Fix object code reading to skip
 address that falls out of text section
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAM9d7cg+RcpXnhB7ZBzsUXKuXXd_nTfnFNMf9L_+LNm8i1d47g@mail.gmail.com>
Date: Wed, 27 Sep 2023 20:25:02 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA09CA26-7F20-47F5-9EE8-162EECCC1564@linux.vnet.ibm.com>
References: <20230915053752.3012-1-atrajeev@linux.vnet.ibm.com>
 <20230915053752.3012-2-atrajeev@linux.vnet.ibm.com>
 <CAM9d7cg+RcpXnhB7ZBzsUXKuXXd_nTfnFNMf9L_+LNm8i1d47g@mail.gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qc8p1XoTQso0rufPOX3ADaXwEQOvCPNG
X-Proofpoint-ORIG-GUID: lmDxU9b1Fn7ILO8g8eNlz4DCB4klwnfg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_09,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309270124
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
Cc: Ian Rogers <irogers@google.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 27-Sep-2023, at 5:45 AM, Namhyung Kim <namhyung@kernel.org> wrote:
>=20
> On Thu, Sep 14, 2023 at 10:40=E2=80=AFPM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
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
>> v3 -> v4:
>> Fixed indent in V3
>>=20
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
>> index ed3815163d1b..9e6e6c985840 100644
>> --- a/tools/perf/tests/code-reading.c
>> +++ b/tools/perf/tests/code-reading.c
>> @@ -269,6 +269,16 @@ static int read_object_code(u64 addr, size_t =
len, u8 cpumode,
>>        if (addr + len > map__end(al.map))
>>                len =3D map__end(al.map) - addr;
>>=20
>> +       /*
>> +        * Some architectures (ex: powerpc) have stubs (trampolines) =
in kernel
>> +        * modules to manage long jumps. Check if the ip offset falls =
in stubs
>> +        * sections for kernel modules. And skip module address after =
text end
>> +        */
>> +       if (!strtailcmp(dso->long_name, ".ko") && al.addr > =
dso->text_end) {
>=20
> There's a is_kernel_module() that can check compressed modules
> too but I think we need a simpler way to check it like dso->kernel.
>=20
> Thanks,
> Namhyung

Thanks for the comment Namhyung. I will add similar to dso->kernel, =
another field check in next version of patchset

Athira
>=20
>=20
>> +               pr_debug("skipping the module address %#"PRIx64" =
after text end\n", al.addr);
>> +               goto out;
>> +       }
>> +
>>        /* Read the object code using perf */
>>        ret_len =3D dso__data_read_offset(dso, =
maps__machine(thread__maps(thread)),
>>                                        al.addr, buf1, len);
>> --
>> 2.31.1


