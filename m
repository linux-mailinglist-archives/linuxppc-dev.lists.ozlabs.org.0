Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E399E7A0B90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 19:23:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TwzLcihl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmkgr5rlCz3cm2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 03:23:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TwzLcihl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmkfz0pGbz3bVp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 03:23:06 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38EHCcZP001531;
	Thu, 14 Sep 2023 17:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=R8ktKrs6KFqdvazQmcf3abs7rXXPA7J9lb5D1X+IGuM=;
 b=TwzLcihlDiExcvHoFQWys96DLjk4vuaEKrloX1J0b7v+Ut6uWmTObA+UNqBhuik5V4mR
 hF06BLRcBzBeiLxiTHeCqILUugAl2yfdhc8FfqSewPF8KRND6CuPqNrUg6Vv3h/0G0Wp
 Q3GKyoUEsONucOld/99A/CP6Qt48wg9NirTN81OQ1THd6hlZ7A8EYqAgiwesLy5kKUzI
 /8pjZfjpEDjJWmv/QmvdkNsPZmrdTkvZCAFWuMQsZ4W+BluJQMS2fmIY+7MuT4hzqNWp
 BFOW9GlU4K8AmaKV3RfOr1RE3R8hfVAZJ0LULXmB+TksekgCuIxVfjQ8QB5T8SqGZ3wS bA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t46ca099b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:22:49 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38EHDHB6003616;
	Thu, 14 Sep 2023 17:22:49 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t46ca098t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:22:49 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38EH9bqB024021;
	Thu, 14 Sep 2023 17:22:48 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t131tmydv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:22:46 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38EHMhrC14025390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Sep 2023 17:22:43 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67D5E20040;
	Thu, 14 Sep 2023 17:22:43 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FEAF2004D;
	Thu, 14 Sep 2023 17:22:41 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.35.47])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 14 Sep 2023 17:22:41 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [V2 2/2] tools/perf/tests: Fix object code reading to skip
 address that falls out of text section
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <02324e34-5920-2238-0c00-f7018803939e@linux.ibm.com>
Date: Thu, 14 Sep 2023 22:52:29 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <2A6546A3-E948-43EF-89E3-9ED7C50F28DF@linux.vnet.ibm.com>
References: <20230907164529.36222-1-atrajeev@linux.vnet.ibm.com>
 <20230907164529.36222-2-atrajeev@linux.vnet.ibm.com>
 <02324e34-5920-2238-0c00-f7018803939e@linux.ibm.com>
To: Disha Goel <disgoel@linux.ibm.com>,
        Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JQbNLFZAYAiOfhykrFifOz748xNRjBdc
X-Proofpoint-GUID: uNXgKZURF_1G_h8WMLqibNETZk9_XKmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140148
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 14-Sep-2023, at 5:47 PM, Disha Goel <disgoel@linux.ibm.com> wrote:
>=20
> On 07/09/23 10:15 pm, Athira Rajeev wrote:
>> The testcase "Object code reading" fails in somecases
>> for "fs_something" sub test as below:
>>=20
>> Reading object code for memory address: 0xc008000007f0142c
>> File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>> On file address is: 0x1114cc
>> Objdump command is: objdump -z -d --start-address=3D0x11142c =
--stop-address=3D0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>> objdump read too few bytes: 128
>> test child finished with -1
>>=20
>> This can alo be reproduced when running perf record with
>> workload that exercises fs_something() code. In the test
>> setup, this is exercising xfs code since root is xfs.
>>=20
>> # perf record ./a.out
>> # perf report -v |grep "xfs.ko"
>> 0.76% a.out /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko =
0xc008000007de5efc B [k] xlog_cil_commit
>> 0.74% a.out /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko =
0xc008000007d5ae18 B [k] xfs_btree_key_offset
>> 0.74% a.out /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko =
0xc008000007e11fd4 B [k] 0x0000000000112074
>>=20
>> Here addr "0xc008000007e11fd4" is not resolved. since this is a
>> kernel module, its offset is from the DSO. Xfs module is loaded
>> at 0xc008000007d00000
>>=20
>> # cat /proc/modules | grep xfs
>> xfs 2228224 3 - Live 0xc008000007d00000
>>=20
>> And size is 0x220000. So its loaded between =DF=A60xc008000007d00000
>> and 0xc008000007f20000. =46rom objdump, text section is:
>> text 0010f7bc 0000000000000000 0000000000000000 000000a0 2**4
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
>> Changelog:
>> v1 -> v2:
>> Updated comment to add description on which arch has stub and
>> reason for skipping as suggested by Adrian

Thanks for testing Disha.

Hi Adrian,

Can you please review and share feedback on this version.

Thanks
Athira

> With this patch applied perf Object code reading test works correctly.
>=20
> 26: Object code reading : Ok
>=20
> Tested-by: Disha Goel <disgoel@linux.ibm.com>
>=20
>> tools/perf/tests/code-reading.c | 12 ++++++++++++
>> 1 file changed, 12 insertions(+)
>>=20
>> diff --git a/tools/perf/tests/code-reading.c =
b/tools/perf/tests/code-reading.c
>> index ed3815163d1b..3cf6c2d42416 100644
>> --- a/tools/perf/tests/code-reading.c
>> +++ b/tools/perf/tests/code-reading.c
>> @@ -269,6 +269,18 @@ static int read_object_code(u64 addr, size_t =
len, u8 cpumode,
>> if (addr + len > map__end(al.map))
>> len =3D map__end(al.map) - addr;
>>=20
>> + /*
>> + * Some architectures (ex: powerpc) have stubs (trampolines) in =
kernel
>> + * modules to manage long jumps. Check if the ip offset falls in =
stubs
>> + * sections for kernel modules. And skip module address after text =
end
>> + */
>> + if (strstr(dso->long_name, ".ko")) {
>> + if (al.addr > dso->text_end) {
>> + pr_debug("skipping the module address %#"PRIx64" after text end\n", =
al.addr);
>> + goto out;
>> + }
>> + }
>> +
>> /* Read the object code using perf */
>> ret_len =3D dso__data_read_offset(dso, =
maps__machine(thread__maps(thread)),
>> al.addr, buf1, len);
>>=20

