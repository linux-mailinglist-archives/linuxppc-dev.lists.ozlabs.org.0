Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF1A673B59
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 15:10:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyPf04Lrrz3fFZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 01:10:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T8BNOqLe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T8BNOqLe;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyPd04bKqz3fCN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 01:09:07 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30JD0vMJ006884;
	Thu, 19 Jan 2023 14:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=sppMmu3rcdk3fJabyJfBy8rWMe8A/8f7uXeqHCO9Zck=;
 b=T8BNOqLeINIuEKbkZfOFilqSmlaQU7FLu7+xwXAAgGUezVeRHsLb0MHjhtR2UZX2WEYe
 d/6f51PnGi9XL/zNA/LTTkVjif6VKfESyTn+nQCiy8xjyN5HH6Zrw1/AVw1JbxG5NXc5
 Dyhwl2WdjG6Qh35DgULNCNvUBTPxIq4RWrOnGLp7c1lYxvVIxifai30Oiua2oRal436E
 fmklkp4TuLNqDKdJsPJIWGMWoT/OM9e2+HXveXF1sR2ZMXz1Yldt8O/BpXsX+L4BV/lA
 Zno7vEEv+Wawc8cHTsjkd0xIv+7X/mS5aQBaM4D7ifoTf5nQ7fZP8iSCc4zYRsXlIpfN cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n74bmd2hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 14:08:51 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30JCof01007639;
	Thu, 19 Jan 2023 14:08:51 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n74bmd2fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 14:08:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30J60klt006229;
	Thu, 19 Jan 2023 14:08:48 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfps8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 14:08:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30JE8i9p40894962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jan 2023 14:08:44 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C89F320043;
	Thu, 19 Jan 2023 14:08:44 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 887D120040;
	Thu, 19 Jan 2023 14:08:42 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.12.84])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 19 Jan 2023 14:08:42 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH V2] tools/perf/tests: Fix string substitutions in build id
 test
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <17bd5aca40164637bfbd47da34811a13@AcuMS.aculab.com>
Date: Thu, 19 Jan 2023 19:38:40 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A31FA622-379C-4C44-B67A-5C01844F9076@linux.vnet.ibm.com>
References: <20230119113054.31742-1-atrajeev@linux.vnet.ibm.com>
 <17bd5aca40164637bfbd47da34811a13@AcuMS.aculab.com>
To: David Laight <David.Laight@ACULAB.COM>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3-vJfT7wDlAk_ddynyWGfy2yolRRv92A
X-Proofpoint-GUID: AJWXG5GcFXL7wiJIab2-MfMZVHEkjvEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_09,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 phishscore=0 clxscore=1011
 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190113
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
Cc: "irogers@google.com" <irogers@google.com>, "ak@linux.intel.com" <ak@linux.intel.com>, "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "james.clark@arm.com" <james.clark@arm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>, "disgoel@linux.ibm.com" <disgoel@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 19-Jan-2023, at 5:32 PM, David Laight <David.Laight@ACULAB.COM> =
wrote:
>=20
> From: Athira Rajeev
>> Sent: 19 January 2023 11:31
> ...
>> diff --git a/tools/perf/tests/shell/buildid.sh =
b/tools/perf/tests/shell/buildid.sh
>> index aaf851108ca3..43e43e131be7 100755
>> --- a/tools/perf/tests/shell/buildid.sh
>> +++ b/tools/perf/tests/shell/buildid.sh
>> @@ -66,7 +66,7 @@ check()
>> 	esac
>> 	echo "build id: ${id}"
>>=20
>> -	link=3D${build_id_dir}/.build-id/${id:0:2}/${id:2}
>> +	link=3D${build_id_dir}/.build-id/$(echo ${id}|cut -c 1-2)/$(echo =
${id}|cut -c 3-)
>> 	echo "link: ${link}"
>=20
> That is horrid, why not just use valid shell substitutions, eg:
> 	id_file=3D${id#??}
> 	id_dir=3D${id%$id_file}
> 	link=3D$build_id_dir/.build-id/$id_dir/$id_file
>=20
> ...
>> -	check ${@: -1}
>> +	check $last
>=20
> Since this is the end of the shell function you can avoid the eval
> by doing:
> 	shift $(($# - 1))
> 	check $1
> or maybe:
> 	args=3D"$*"
> 	check ${args##* }
>=20
> Those should be ok in all posix shells.
>=20
> 	David
>=20
Hi David,

Thanks for the review. I will post a V3 addressing these changes.

Athira
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, =
MK1 1PT, UK
> Registration No: 1397386 (Wales)

