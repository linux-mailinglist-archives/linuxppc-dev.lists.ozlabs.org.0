Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A9C67370D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 12:37:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyLFy4C3Xz3fGM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 22:37:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jE2h9g9H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jE2h9g9H;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyLF22YvXz3bXP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 22:36:37 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J9BwUR023471;
	Thu, 19 Jan 2023 11:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=l4xtF/VBo+/kZPLf1rcGZG9RlA5279S0Iiv6wqhYaK0=;
 b=jE2h9g9HbV72Q92mQfBF75uXNFFZtJ8qdVfYZWHsaYtzRPcy6ZWBrYo1Lo+hzxurCQvy
 ZbhGhbDpGb7+wqHIxS/SrBubrX/V4+LOx8ToUdKw7qiB2iI1bajGMDx7SxnV5US26KD2
 106MP2OdOCgh99WnT2GVgXBPeFHNz5JoUrF272ewrB5/dOV5FfHguim8dl5cmFJNa9lh
 yFF/QgzPzBS9hUoHowhsCZf19SzlCkrKS9fLNq2Pmu2uZyZvHJ4k+UPKnIqJQM57dP/Q
 8UXOXe6+6TiDuY/dHFDmEhfUNCPPTVzcgsZ36eVQYw8+57rPOjNaPd7HCf+Vz+Pcz355 Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7311b6ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 11:36:22 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30JAjk9U001377;
	Thu, 19 Jan 2023 11:36:22 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7311b6w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 11:36:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30J40655006282;
	Thu, 19 Jan 2023 11:36:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfpkwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 11:36:19 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30JBaFsG49807716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jan 2023 11:36:15 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C109B2004B;
	Thu, 19 Jan 2023 11:36:15 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5578F20040;
	Thu, 19 Jan 2023 11:36:13 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.12.84])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 19 Jan 2023 11:36:13 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/2] tools/perf: Fix the file mode with copyfile while
 adding file to build-id cache
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Y8f5LNu2tmO/ceej@kernel.org>
Date: Thu, 19 Jan 2023 17:06:11 +0530
Message-Id: <765425A3-BA4A-4DC0-9D78-B1E428938ED2@linux.vnet.ibm.com>
References: <20230116050131.17221-1-atrajeev@linux.vnet.ibm.com>
 <Y8f5LNu2tmO/ceej@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J_-LFIRyoDd5E5-QRpOJb9e54u_bVs8_
X-Proofpoint-GUID: Ohz8A8XS9YvpsKbWExP5SI-EWZrF5gL4
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_09,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190091
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
Cc: Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, linux-perf-users@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18-Jan-2023, at 7:20 PM, Arnaldo Carvalho de Melo <acme@kernel.org> wr=
ote:
>=20
> Em Mon, Jan 16, 2023 at 10:31:30AM +0530, Athira Rajeev escreveu:
>> The test "build id cache operations" fails on powerpc
>> As below:
>>=20
>> 	Adding 5a0fd882b53084224ba47b624c55a469 ./tests/shell/../pe-file.exe: Ok
>> 	build id: 5a0fd882b53084224ba47b624c55a469
>> 	link: /tmp/perf.debug.ZTu/.build-id/5a/0fd882b53084224ba47b624c55a469
>> 	file: /tmp/perf.debug.ZTu/.build-id/5a/../../root/linux/tools/perf/test=
s/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf
>> 	failed: file /tmp/perf.debug.ZTu/.build-id/5a/../../root/linux/tools/pe=
rf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf does not exist
>> 	test child finished with -1
>> 	---- end ----
>> 	build id cache operations: FAILED!
>>=20
>> The failing test is when trying to add pe-file.exe to
>> build id cache.
>>=20
>> Perf buildid-cache can be used to add/remove/manage
>> files from the build-id cache. "-a" option is used to
>> add a file to the build-id cache.
>>=20
>> Simple command to do so for a PE exe file:
>> # ls -ltr tests/pe-file.exe
>> -rw-r--r--. 1 root root 75595 Jan 10 23:35 tests/pe-file.exe
>> The file is in home directory.
>>=20
>> # mkdir  /tmp/perf.debug.TeY1
>> # perf --buildid-dir /tmp/perf.debug.TeY1 buildid-cache -v
>>   -a tests/pe-file.exe
>>=20
>> The above will create ".build-id" folder in build id
>> directory, which is /tmp/perf.debug.TeY1. Also adds file
>> to this folder under build id. Example:
>>=20
>> # ls -ltr /tmp/perf.debug.TeY1/.build-id/5a/0fd882b53084224ba47b624c55a4=
69/
>> total 76
>> -rw-r--r--. 1 root root     0 Jan 11 00:38 probes
>> -rwxr-xr-x. 1 root root 75595 Jan 11 00:38 elf
>>=20
>> We can see in the results that file mode for original
>> file and file in build id directory is different. ie,
>> build id file has executable permission whereas original
>> file doesn=E2=80=99t have.
>>=20
>> The code path and function ( build_id_cache__add ) to
>> add file to cache is in "util/build-id.c". In
>> build_id_cache__add() function, it first attempts to link
>> the original file to destination cache folder. If linking
>> the file fails ( which can happen if the destination and
>> source is on a different mount points ), it will copy the
>> file to destination. Here copyfile() routine explicitly uses
>> mode as "755" and hence file in the destination will have
>> executable permission.
>>=20
>> Code snippet:
>>=20
>> if (link(realname, filename) && errno !=3D EEXIST &&
>>                               copyfile(name, filename))
>>=20
>> Strace logs:
>>=20
>> 	172285 link("/home/<user_name>/linux/tools/perf/tests/pe-file.exe", "/t=
mp/perf.debug.TeY1/home/<user_name>/linux/tools/perf/tests/pe-file.exe/5a0f=
d882b53084224ba47b624c55a469/elf") =3D -1 EXDEV (Invalid cross-device link)
>> 	172285 newfstatat(AT_FDCWD, "tests/pe-file.exe", {st_mode=3DS_IFREG|064=
4, st_size=3D75595, ...}, 0) =3D 0
>> 	172285 openat(AT_FDCWD, "/tmp/perf.debug.TeY1/home/<user_name>/linux/to=
ols/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/.elf.KbAnsl", O=
_RDWR|O_CREAT|O_EXCL, 0600) =3D 3
>> 	172285 fchmod(3, 0755)                  =3D 0
>> 	172285 openat(AT_FDCWD, "tests/pe-file.exe", O_RDONLY) =3D 4
>> 	172285 mmap(NULL, 75595, PROT_READ, MAP_PRIVATE, 4, 0) =3D 0x7fffa5cd00=
00
>> 	172285 pwrite64(3, "MZ\220\0\3\0\0\0\4\0\0\0\377\377\0\0\270\0\0\0\0\0\=
0\0@\0\0\0\0\0\0\0"..., 75595, 0) =3D 75595
>>=20
>> Whereas if the link succeeds, it succeeds in the first
>> attempt itself and the file in the build-id dir will
>> have same permission as original file.
>>=20
>> Example, above uses /tmp. Instead if we use
>> "--buildid-dir /home/build", linking will work here
>> since mount points are same. Hence the destination file
>> will not have executable permission.
>>=20
>> Since the testcase "tests/shell/buildid.sh" always looks
>> for executable file, test fails in powerpc environment
>> when test is run from /root.
>>=20
>> The patch adds a change in build_id_cache__add to use
>> copyfile_mode which also passes the file=E2=80=99s original mode as
>> argument. This way the destination file mode also will
>> be same as original file.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> Thanks, applied both patches, IIRC there were an Acked-by from Ian for
> this one? Or was that reference a cut'n'paste error with that other
> series for the #/bin/bash changes?
>=20
> - Arnaldo
>=20

Hi Arnaldo,

Thanks for picking up the changes in this patch set.

I re-based the patch from the other series ( for which I had got Acked-by f=
rom Ian ) on top of tmp.perf/urgent
and posted it as single V2 here:

https://lore.kernel.org/linux-perf-users/20230119113054.31742-1-atrajeev@li=
nux.vnet.ibm.com/T/#u

Thanks
Athira

>> ---
>> tools/perf/util/build-id.c | 10 +++++++---
>> 1 file changed, 7 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
>> index a839b30c981b..ea9c083ab1e3 100644
>> --- a/tools/perf/util/build-id.c
>> +++ b/tools/perf/util/build-id.c
>> @@ -715,9 +715,13 @@ build_id_cache__add(const char *sbuild_id, const ch=
ar *name, const char *realnam
>> 		} else if (nsi && nsinfo__need_setns(nsi)) {
>> 			if (copyfile_ns(name, filename, nsi))
>> 				goto out_free;
>> -		} else if (link(realname, filename) && errno !=3D EEXIST &&
>> -				copyfile(name, filename))
>> -			goto out_free;
>> +		} else if (link(realname, filename) && errno !=3D EEXIST) {
>> +			struct stat f_stat;
>> +
>> +			if (!(stat(name, &f_stat) < 0) &&
>> +					copyfile_mode(name, filename, f_stat.st_mode))
>> +				goto out_free;
>> +		}
>> 	}
>>=20
>> 	/* Some binaries are stripped, but have .debug files with their symbol
>> --=20
>> 2.31.1
>=20
> --=20
>=20
> - Arnaldo

