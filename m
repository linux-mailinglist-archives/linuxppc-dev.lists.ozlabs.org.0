Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E07975C8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 17:56:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XDfKQ1nY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhP3k4zfjz3c4r
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 01:56:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XDfKQ1nY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhP2p0q5wz3bxH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 01:55:13 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387Fo6di009659;
	Thu, 7 Sep 2023 15:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=DlK2KDcs67VhPntfaLp7idki9xz6KkCol91doJwrMJI=;
 b=XDfKQ1nYxcQ/ECsw1AqX2NHowGnDosv4TDBlXP4BPyVJNgfMqs8wxVmGUTWiVSOcwX0p
 YNqqGUDkoIb9V/S7nkq/yVxKzQjJWWMI1vPB8NZgIg3FdfMVksSKwnCx/72tf9j/JGAG
 Qa69N4+Rsuyu43vFvEnvwNduR7sYa3+po0F+nd7kUC6UyrfDg+hn/lyxM6LY/IGEZUKC
 HTuaJEA85m7mIBFXryXvfZVljFg8PLYHYuwqKL8DncHXyoigpeGXOzSqdd5Oz3YccAav
 HHdm+uCAfgWnX9h8U7mPOKkYVacCFk4fH2eSZxwq19C9CB//ALIAbPMiov81aWeLI8Sl 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syg2puhj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 15:55:00 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 387FaR89013522;
	Thu, 7 Sep 2023 15:54:59 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syg2puhht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 15:54:59 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 387EJfNe006651;
	Thu, 7 Sep 2023 15:54:58 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgvkvkm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 15:54:58 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 387Fstdn23397034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Sep 2023 15:54:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2B7120043;
	Thu,  7 Sep 2023 15:54:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC1D120040;
	Thu,  7 Sep 2023 15:54:52 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.9.102])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  7 Sep 2023 15:54:52 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH V2 1/2] tools/perf: Add text_end to "struct dso" to save
 .text section size
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <a407d3fd-6d40-060d-eb0c-c880e09b2a5f@intel.com>
Date: Thu, 7 Sep 2023 21:24:40 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <4FB560DB-E78D-4E17-AD11-B88F6C7EAA27@linux.vnet.ibm.com>
References: <20230817171852.55629-1-atrajeev@linux.vnet.ibm.com>
 <a407d3fd-6d40-060d-eb0c-c880e09b2a5f@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1HgtdVv_7vDH2PW3FxQl2Rowlosd9BKh
X-Proofpoint-ORIG-GUID: 6KWl0N7iDhycF0fSlu5Yv_JwrkYG1lML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_07,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309070138
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



> On 18-Aug-2023, at 12:07 PM, Adrian Hunter <adrian.hunter@intel.com> =
wrote:
>=20
> On 17/08/23 20:18, Athira Rajeev wrote:
>> Update "struct dso" to include new member "text_end".
>> This new field will represent the offset for end of text
>> section for a dso. This value is derived as:
>> sh_size (Size of section in byes) + sh_offset (Section file
>> offst) of the elf header for text.
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
>> ---
>> Changelog:
>>   v1 -> v2:
>>   Changed commit message to explain need for "text_end"
>>=20
>> tools/perf/util/dso.h        | 1 +
>> tools/perf/util/symbol-elf.c | 4 +++-
>> 2 files changed, 4 insertions(+), 1 deletion(-)
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
>> index 8bd466d1c2bd..252d26a59e64 100644
>> --- a/tools/perf/util/symbol-elf.c
>> +++ b/tools/perf/util/symbol-elf.c
>> @@ -1512,8 +1512,10 @@ dso__load_sym_internal(struct dso *dso, struct =
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
>=20
> Should probably amend dso__load_bfd_symbols() also

Hi Adrian,

Thanks for checking. Will address this in V2=20

Thanks
Athira


