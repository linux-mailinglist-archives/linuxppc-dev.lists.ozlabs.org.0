Return-Path: <linuxppc-dev+bounces-9032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC50AC8F52
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 15:11:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b83XD5sSnz2xHv;
	Fri, 30 May 2025 23:11:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748610668;
	cv=none; b=jrQ/KtmF0S+R7V0XNmn4d3wspY++/kehycgG0ZO7K+R2DMy3WYETuk0bJNt18gvwUoJB6w9vBt/yHsVE4C02yl+LuTvwREGMpclEeSQmwRmM4FOlhIV48I4W8n+jN0UEap1PPx26d+qw2oBObbGX2CWnTrPr++vw0lXd1IUU15HE9HcW2YO7BHg7eBgo64fueaQKW3Rs/uwiebAe2/zRn7XQccDSvXQV1H28oDqBZOH6DuMhYGEUD6Fvr6Hkv8sijBLpWoLyG3itsPS1hlG/v5DGNhRIEmTpq3URbMVL7eglJe9m/Q40edhInVRhiKR+unKAIAre6E2Nz4EAiZGEXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748610668; c=relaxed/relaxed;
	bh=xUdSk2fCj7k3RtBY4ecnuRtB4NrEo3PLl91QLK/z9i8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LAYLdYKpBTYxyJtHfHitZVNn0aLEaCCrPUKWeCpmopvSTZxknBzPOi04HsuegvqQAtS4MFjTqSa+/ouGyHyYcD/ynQrN1+skF7a+UmrCEJurmwjkLNQ9WOU2/5etjd7tdWP6faDaEej5k0CkerX3/Pt6YK3AtClZ/7JfZTolOLb9NROBT0u0JC3Jv60Vruh6OaMhxYjXCtM3ADlQU3JmX4zTx1ApbiN36SvsVn1A5w+pyCl6o1qJg9r+eNDjMiY7Ox1kNDoS+P6NVc44CRklCtsOkFnhL64pJS+ZwsSW9MOTRXjCGyv/KEZUF2L51QenL6nBWX5ANcdMapegphp9Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MosivN65; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MosivN65;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b83X76CcSz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 23:11:03 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U3mZeN028086;
	Fri, 30 May 2025 13:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xUdSk2
	fCj7k3RtBY4ecnuRtB4NrEo3PLl91QLK/z9i8=; b=MosivN650PMPU7ed3A9+je
	9xUkWVnwaHzViMM6wZZM4gWQfpMqDH4ByUu9or0XzQ2ngNtMZUTuo9HA2rZZI2Mj
	Qau91APCxu3F+TSjW9dyGfVYXaadp5JWQ9DbaKg6NhCIaIJ2sNgLL80MQWcoyCV5
	g/J/47Mak0FMwB7UY8aR3L8gOJ5FgNKj4QGTrXhVCJwAjHZRWtWtCLJhgYsEoPTR
	yYUt4/yQo8PpgPUZ1lcmmiH0dvcSKUDVSfilOK9p8b8mlSTEBL5HWY2qOGUrgWHd
	Cwo3FaB1PRpMnLkVH8oJf5m54hxeVGEGV1Nu1Y53sI6S8EpqUdRL1PanO1yBzUkg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40gukqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:10:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBHnaF029613;
	Fri, 30 May 2025 13:10:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46usxn9dtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:10:48 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54UDAklo33685800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 13:10:46 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 519B020043;
	Fri, 30 May 2025 13:10:46 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9335320040;
	Fri, 30 May 2025 13:10:43 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.248.61])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 30 May 2025 13:10:43 +0000 (GMT)
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
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: linux-next: build warning after merge of the powerpc tree
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <20250530094400.2743f5b3@canb.auug.org.au>
Date: Fri, 30 May 2025 18:40:29 +0530
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F3FE2064-91FD-40C2-B7E6-F5DBDD4E8389@linux.ibm.com>
References: <20250513202809.7e23ed2d@canb.auug.org.au>
 <20250530094400.2743f5b3@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9cPKb7uKomjw4iC8hARgn2sS7t_1_h38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNCBTYWx0ZWRfXxH92MnFkF8Y2 iPlcjH687j9/X9fC8S8mRv5jtKBB4YlcsM9ci9ggq9vjmRHXlRN6cl0MsAWv6lCkbTuv2BPB7n/ VcG1mIjmX9aLb/bdgxMx5DOw0uORibWN4HPcwIyAAAk/WMqllsywYAjd89Izbeebhw3HVA0qCum
 iQk24QpZNmzpbZ0LARhWf2xGc6p2T5e8lpT0DDZoj/pAZJF5lxV9UU6ks2ykWUO3/uoSiQIQCOW UxWLcLMm9Bol1RUfowIGHFeH3/ck3NVozqjYs0JlETSAQmmbzbH4fGVXCOtM02itagvGUlEtria MCzrNMqF4jTqv+lF/tyhWEKeqJBu7UGKESSSLvUiELjP1yKzTzVOrOzuPTdfOIwOhuv4I6Sfy41
 Kp5p9BZh4vKBQEKWD0gsHWs9iF45QbiOunoNiCs18q14TsihRbnqviSsT7M+MR3chZkRqdax
X-Proofpoint-ORIG-GUID: 9cPKb7uKomjw4iC8hARgn2sS7t_1_h38
X-Authority-Analysis: v=2.4 cv=UflRSLSN c=1 sm=1 tr=0 ts=6839ae59 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=rOUgymgbAAAA:8 a=6Xf-EFKR-PQXkqza3xkA:9
 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=962 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300114
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 30 May 2025, at 5:14=E2=80=AFAM, Stephen Rothwell =
<sfr@canb.auug.org.au> wrote:
>=20
> Hi all,
>=20
> On Tue, 13 May 2025 20:28:09 +1000 Stephen Rothwell =
<sfr@canb.auug.org.au> wrote:
>>=20
>> After merging the powerpc tree, today's linux-next build (htmldocs)
>> produced this warning:
>>=20
>> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included =
in any toctree
>>=20
>> Introduced by commit
>>=20
>>  ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM =
debugfs interface")
>=20
> I am still seeing this warning.
>=20
> --=20
> Cheers,
> Stephen Rothwell
Hi Stephen

Fix for this is posted here:

=
https://lore.kernel.org/linuxppc-dev/7FF625BF-03E1-4EB4-BEE2-BEAEB1C5DD96@=
linux.ibm.com/T/#mfc338052037792cc45f870edeca036ca02dcf58e

Thanks
Athira




