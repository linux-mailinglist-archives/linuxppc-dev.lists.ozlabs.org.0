Return-Path: <linuxppc-dev+bounces-7986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F042A9CBFA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 16:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkbKT5J3Hz2yw7;
	Sat, 26 Apr 2025 00:47:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745592445;
	cv=none; b=oHbi9Z+evBpUnQdj5Bc+i9IJm/8W1U5YjKa34Gfz1jQX1nJ71KHH40a0C1RrgxfOK+ibKKWr9ETI4NPC3R9ZjRWQpfoQetLIVwHnfMaITiux61oQMQV88IPSYJ1E8fbSH1m8XpL1U7wLumLiMkRPf640eM23IZMndMs7m79XF85xkdVqqEJFo1b4RFOK/u8niDAdiAwjQNrPhfi46Dt//TPHPSwYInY044K5pb6C7IbJ/s2CcwLz8NQjDNTJG+CeUE6FfG1YRaaRxsoXarc3AHhXgKZFGpKBiUe5moayd15DVc0ZMpUAEPneztGPOchhyOh4O0RdDfr9RG0evlWk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745592445; c=relaxed/relaxed;
	bh=m62+7uTH6YLNjDx13EBc2/zcd03+OJ25rwPKzcgtDoc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FPhvRGpWEy+witcFod4Lh/48llj9s7idZzhAzuT6xkvvqQOjWdSCbQAtPaXFQ0bfdNwjOGxd3kfwW/40uTTbyJboNr2q96VO9YkM2LJgRWdbX9+g6h9eErhgGEtHzs8yhZeq+W938YHrxKjDgz2N8azfQgZHtZLB18A2Ah+JXmIcK1xPQVhVNVvrbgCe0gY1UTacb7ficiyWU+l2lnzPDr0Z4dVdUCW5FV+QDA0QfI0ms9CF36OI18ItSZ0XDOWsOD2HKgR1sFlT+fkIbhGL9TjAmY8lqxeY5v+KJtpYtV2pCSxI3x7dxZU71NFjcOYDMaiTzv3PoN3/R9I9P+BrMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VvQ6bchm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VvQ6bchm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkbKS6z1tz2yrt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 00:47:24 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P98OjL007191;
	Fri, 25 Apr 2025 14:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=m62+7u
	TH6YLNjDx13EBc2/zcd03+OJ25rwPKzcgtDoc=; b=VvQ6bchmq/Q8OR1mdEJ4QS
	PM7p00hZ46Y8U4jGCYPq64MrY4jKw6AX2hvCsmL1jMVizK381Fq9j+9hW2NUYkgz
	oTRtd8EyS/5FWtnLZXH2AZ0mTIBoxwwmyUIagiuuiOo81T3KOrqVNWhm3vAL98zZ
	ydw4zIfoV7oz3mzMjTFr6wk4C3Yga+anioDO5zpw1kqDibgbceRyOCqJU/97PpcG
	5rvb4drRn85qxVYuSIvGD6NE5jiz8GYRVJVGK2GKqSOHxylO9BTD9aFmXnYTuQN5
	4f8U4trKwcRcq6Li015tHTfUXbT+GUxPxX91cK7YZnx2UqaaiMxUazqZ2nonyUaA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467wd9kvcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 14:47:18 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53PEiVAx004669;
	Fri, 25 Apr 2025 14:47:17 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467wd9kvct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 14:47:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53PDEYuq028426;
	Fri, 25 Apr 2025 14:47:16 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfvwn1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 14:47:16 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53PElCZA18612582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 14:47:12 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FE062004D;
	Fri, 25 Apr 2025 14:47:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B197220043;
	Fri, 25 Apr 2025 14:47:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.250.235])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 25 Apr 2025 14:47:05 +0000 (GMT)
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
Subject: Re: [PATCH] tools headers: Update the include/vdso/unaligned.h to
 sync headers
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <0f2b7c10-a30a-4d2e-ac3f-baec1b45d945@linaro.org>
Date: Fri, 25 Apr 2025 20:16:51 +0530
Cc: "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
        Disha Goel <disgoel@linux.vnet.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, jiang.peng9@zte.com.cn,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Tejas Manhas <Tejas.Manhas1@ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <607CE194-2D87-4E28-B65A-2407F3C265AB@linux.ibm.com>
References: <20250421034143.67607-1-atrajeev@linux.ibm.com>
 <0f2b7c10-a30a-4d2e-ac3f-baec1b45d945@linaro.org>
To: James Clark <james.clark@linaro.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J70XttYYBDRsrOTeFSXF_oQNWu5AEFfo
X-Proofpoint-ORIG-GUID: weBAXFe5WRfpnkP4tv6l_Wh_HX35eHO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEwNCBTYWx0ZWRfX3rbr8UgJ4DIF hl6lGRK+Ik0JaBTZf5TvAsj5+sKSQhitRYhgC5kTALs2cDD3MZtVRxQsLmZf6nkgBni902i29Ez WBNkXgwiIY0NQFtXr31S+JBdsUGkTjaj1bZjk2uTyjAHHOFJAJ1s+LEHtWemUvvBp5oEKHwMnq6
 tC2nBYTMHUHB4LFbbhWPZ3esh0gKrTaIn+20PUFCxYNjuVoltZarIrS8vPvIMlxYCG+XNi3wi0g 8v3KkKowiz/68FFU3e0RtvJ/xWd1yoZsULYxFPBGmOem25CNI4Dm1EkdHc147ikoEeop5k+Lt4a gELZPx4OD/4U1F46uMT35sXA3U8coctWz8LR+rtaLYOJIcsBUQxGHUcG4vlFjWfuGgfI3pYS5pZ
 ddFAZDadrDO7zxb3n6V6FN88NlWukU8Nr9of74X4HMvM86ttUERF6xVvfXCis/i7LF7JTdAO
X-Authority-Analysis: v=2.4 cv=M5lNKzws c=1 sm=1 tr=0 ts=680ba076 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VnNF1IyMAAAA:8 a=t76MFMGQftYPq3j9xbcA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250104
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 22 Apr 2025, at 2:41=E2=80=AFPM, James Clark =
<james.clark@linaro.org> wrote:
>=20
>=20
>=20
> On 21/04/2025 4:41 am, Athira Rajeev wrote:
>> To pick up the changes in:
>> commit acea9943271b ("vdso: Address variable shadowing in macros")
>> Addressing this perf tools build warning:
>> diff -u tools/include/vdso/unaligned.h include/vdso/unaligned.h
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
>> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>> ---
>>  tools/include/vdso/unaligned.h | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>> diff --git a/tools/include/vdso/unaligned.h =
b/tools/include/vdso/unaligned.h
>> index eee3d2a4dbe4..ff0c06b6513e 100644
>> --- a/tools/include/vdso/unaligned.h
>> +++ b/tools/include/vdso/unaligned.h
>> @@ -2,14 +2,14 @@
>>  #ifndef __VDSO_UNALIGNED_H
>>  #define __VDSO_UNALIGNED_H
>>  -#define __get_unaligned_t(type, ptr) ({ \
>> - const struct { type x; } __packed *__pptr =3D =
(typeof(__pptr))(ptr); \
>> - __pptr->x; \
>> +#define __get_unaligned_t(type, ptr) ({ \
>> + const struct { type x; } __packed * __get_pptr =3D =
(typeof(__get_pptr))(ptr); \
>> + __get_pptr->x; \
>>  })
>>  -#define __put_unaligned_t(type, val, ptr) do { \
>> - struct { type x; } __packed *__pptr =3D (typeof(__pptr))(ptr); \
>> - __pptr->x =3D (val); \
>> +#define __put_unaligned_t(type, val, ptr) do { \
>> + struct { type x; } __packed * __put_pptr =3D =
(typeof(__put_pptr))(ptr); \
>> + __put_pptr->x =3D (val); \
>>  } while (0)
>>    #endif /* __VDSO_UNALIGNED_H */
>=20
> Reviewed-by: James Clark <james.clark@linaro.org>

Hi,=20

Looking for feedback on this change.

Thanks
Athira


