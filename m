Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA407A1551
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 07:19:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NN1a6gtF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn2YY1P24z3cnh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 15:19:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NN1a6gtF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn2Xc4ZLtz301f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 15:18:39 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F5C1fp002847;
	Fri, 15 Sep 2023 05:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=qjBLmxXh2CNl4fzeaMD1SlhQrXnevEk8zQPkZABxJL8=;
 b=NN1a6gtFpS5g36ahK/Nhw4TO5OchjwchShbeQochVfGB6JG+4A5IJcinNNl88U87fNV/
 7hsPinWrQXc+P0zpj1Y14SY7fiXdYSjWsenPWeMDU0Ddvp/R0C7NTfemJADR+YUrkPGI
 4zt5+9mzidiOevxUJRhL2uFor3ZI9ugNyAAPwt0r6Ke6IP3afTv+lK4pfAbs4ieZFQlc
 p3eIgE06kYeN6n/U4u+AsmJHA16Oe5IwqK5pfPMPgAkwpQmo+wCzxKQyhqJd3V3I8KM9
 W+3VGNbZGaKUsx2RPOjoCaIayVYmuy3EfcP9Z/9CjiRdcdARH1KXhTsPYfg9ZUktnvZE wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4gwk05u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:18:27 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38F5Dc1o009983;
	Fri, 15 Sep 2023 05:18:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4gwk05tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:18:26 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38F409fk024061;
	Fri, 15 Sep 2023 05:18:25 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t131trv0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 05:18:25 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38F5IMFV62193990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Sep 2023 05:18:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DC962004D;
	Fri, 15 Sep 2023 05:18:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BB7E20040;
	Fri, 15 Sep 2023 05:18:20 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.67.213])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 15 Sep 2023 05:18:20 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [V2 1/2] tools/perf: Add text_end to "struct dso" to save .text
 section size
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <3a03f694-ab6a-3985-9386-203e7137ae7f@intel.com>
Date: Fri, 15 Sep 2023 10:48:08 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <7427EEAF-2E67-47CE-953D-55ED87329752@linux.vnet.ibm.com>
References: <20230907164529.36222-1-atrajeev@linux.vnet.ibm.com>
 <3a03f694-ab6a-3985-9386-203e7137ae7f@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LS_ESXEXGUyHwB2Ce2j7Ww2YfByyOTAQ
X-Proofpoint-ORIG-GUID: PV4QzvjAntXRGFSJRF34ZHQxKKz5VYza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_04,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150044
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Disha Goel <disgoel@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 14-Sep-2023, at 11:49 PM, Adrian Hunter <adrian.hunter@intel.com> =
wrote:
>=20
> On 7/09/23 19:45, Athira Rajeev wrote:
>> Update "struct dso" to include new member "text_end".
>> This new field will represent the offset for end of text
>> section for a dso. For elf, this value is derived as:
>> sh_size (Size of section in byes) + sh_offset (Section file
>> offst) of the elf header for text.
>>=20
>> For bfd, this value is derived as:
>> 1. For PE file,
>> section->size + ( section->vma - dso->text_offset)
>> 2. Other cases:
>> section->filepos (file position) + section->size (size of
>> section)
>>=20
>> To resolve the address from a sample, perf looks at the
>> DSO maps. In case of address from a kernel module, there
>> were some address found to be not resolved. This was
>> observed while running perf test for "Object code reading".
>> Though the ip falls beteen the start address of the loaded
>> module (perf map->start ) and end address ( perf map->end),
>> it was unresolved.
>>=20
>> Example:
>>=20
>>    Reading object code for memory address: 0xc008000007f0142c
>>    File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>>    On file address is: 0x1114cc
>>    Objdump command is: objdump -z -d --start-address=3D0x11142c =
--stop-address=3D0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>>    objdump read too few bytes: 128
>>    test child finished with -1
>>=20
>> Here, module is loaded at:
>>    # cat /proc/modules | grep xfs
>>    xfs 2228224 3 - Live 0xc008000007d00000
>>=20
>> =46rom objdump for xfs module, text section is:
>>    text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4
>>=20
>> Here the offset for 0xc008000007f0142c ie  0x112074 falls out
>> .text section which is up to 0x10f7bc.
>>=20
>> In this case for module, the address 0xc008000007e11fd4 is pointing
>> to stub instructions. This address range represents the module stubs
>> which is allocated on module load and hence is not part of DSO =
offset.
>>=20
>> To identify such  address, which falls out of text
>> section and within module end, added the new field "text_end" to
>> "struct dso".
>>=20
>> Reported-by: Disha Goel <disgoel@linux.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

Hi Adrian

Thanks for the review

>=20
>> ---
>> Changelog:
>> v1 -> v2:
>> Added text_end for bfd also by updating dso__load_bfd_symbols
>> as suggested by Adrian.
>>=20
>> tools/perf/util/dso.h        | 1 +
>> tools/perf/util/symbol-elf.c | 4 +++-
>> tools/perf/util/symbol.c     | 2 ++
>> 3 files changed, 6 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
>> index b41c9782c754..70fe0fe69bef 100644
>> --- a/tools/perf/util/dso.h
>> +++ b/tools/perf/util/dso.h
>> @@ -181,6 +181,7 @@ struct dso {
>> u8  rel;
>> struct build_id  bid;
>> u64  text_offset;
>> + u64  text_end;
>> const char  *short_name;
>> const char  *long_name;
>> u16  long_name_len;
>> diff --git a/tools/perf/util/symbol-elf.c =
b/tools/perf/util/symbol-elf.c
>> index 95e99c332d7e..9e7eeaf616b8 100644
>> --- a/tools/perf/util/symbol-elf.c
>> +++ b/tools/perf/util/symbol-elf.c
>> @@ -1514,8 +1514,10 @@ dso__load_sym_internal(struct dso *dso, struct =
map *map, struct symsrc *syms_ss,
>> }
>>=20
>> if (elf_section_by_name(runtime_ss->elf, &runtime_ss->ehdr, &tshdr,
>> - ".text", NULL))
>> + ".text", NULL)) {
>> dso->text_offset =3D tshdr.sh_addr - tshdr.sh_offset;
>> + dso->text_end =3D tshdr.sh_offset + tshdr.sh_size;
>> + }
>>=20
>> if (runtime_ss->opdsec)
>> opddata =3D elf_rawdata(runtime_ss->opdsec, NULL);
>> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
>> index 3f36675b7c8f..f25e4e62cf25 100644
>> --- a/tools/perf/util/symbol.c
>> +++ b/tools/perf/util/symbol.c
>> @@ -1733,8 +1733,10 @@ int dso__load_bfd_symbols(struct dso *dso, =
const char *debugfile)
>> /* PE symbols can only have 4 bytes, so use .text high bits */
>> dso->text_offset =3D section->vma - (u32)section->vma;
>> dso->text_offset +=3D (u32)bfd_asymbol_value(symbols[i]);
>> + dso->text_end =3D (section->vma - dso->text_offset) + =
section->size;
>> } else {
>> dso->text_offset =3D section->vma - section->filepos;
>> + dso->text_end =3D section->filepos + section->size;
>> }
>> }


