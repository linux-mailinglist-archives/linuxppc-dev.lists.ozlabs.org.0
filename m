Return-Path: <linuxppc-dev+bounces-7563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B14A7A82C06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Apr 2025 18:13:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZXp076CbKz30Pl;
	Thu, 10 Apr 2025 02:13:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744215207;
	cv=none; b=GwgA4CSiCKEAmRJ3XemjP6MVPfSaZT5O/RXcCrYeG0lgjL0qWv/5+Es5iS/xosvJxGGfrWH5NH6kcXkMYiNfGtNKQGDgPkFm+cHCU2BmquOezuAB0eS9xExkWdj3Q7k9+O+xmxbtns+OVaK0wJh/geRkrXCTA3Cjhxy6OVoxVRJQbznWc+5a89UUgTqhYIcz4OyocAZooK9Fp96yXOCAaCA5e4lzvrS4sOSqjcaYMh+QdrzOHwjhZy5dKGzje3oJ0W3Vv7yb1Itd9Yf1Kexocn4vajKbM3Yl/TIDWeH5YVC4OiD+kKB7uT5GuWEYvtsJpnkz2X7bc/eJU2y2xUx3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744215207; c=relaxed/relaxed;
	bh=HQS4IoCYYk8+7Eus1VmUEOLRSUMOWaNBObi96z+aL2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOlrgvRSbkkOUUDs6x8gd1Bh/2eg0A5duOt98hpEI4l4dFqhLR56c76XDRadtFkHEvBxm90n+22YsZrmjVAY9F4QfGh/GIe+NgPYRCAe74H13Do0cp6YXKebEcSFH4VwSLkP4+lCLqgW7FaYwFDTpGYwyKaYB9UydBmY9QwGwf58uKyUKchKCpPPu8f7piVE13RLdu79BU4MDs5L8EvAeifBpy+p0smyXNpXh9JFnO5qidzoxlwjYmY70t3LOVs0zB+9mavwC7r+dWvHwjRj/Y3YtunQ2eBsgUKtuuTVK53wQH0i769ortvU9YCvywQRapcs7w5vAi/4uxidpFH8WA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=djU4Mytg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=djU4Mytg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZXp066CnPz2ySc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 02:13:26 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539CSNRu017893
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 9 Apr 2025 16:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HQS4Io
	CYYk8+7Eus1VmUEOLRSUMOWaNBObi96z+aL2I=; b=djU4Mytg6G9LHo2NWKfbe2
	08YmiZ3tU54xbsQm9usdxclwYjfxrmhe1qNW31MIrTNIeeKMIErhuboXPgxCFV7d
	tOFGbeZYNIU4xmjOxmZOznngvycmeYh7Muw1OPh1qn7gteDDZ9KQ+kCaOHYWIoyE
	8T7Lvxe94oDdvIvgpIqoRy9mwEkLTy1qUWWxSTjM+c2PEqv/UNrBgiFkN0IECrBE
	FrISpyXmPk4Of4m+1OEeWTbio1RllYcSnq+Qeo70/GwRq9LYed+hinFHx2+7X2tq
	4wygLUfpwBAg+H1Abee53qVsAEZi0/hPB3yx1lw4rVbxtHp6tZjRjiFslFx07wOA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45wrx2s7pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Apr 2025 16:13:23 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 539G76CR029045
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 9 Apr 2025 16:13:22 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45wrx2s7pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 16:13:22 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 539FDQt0018873;
	Wed, 9 Apr 2025 16:13:21 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45uhj2g4s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 16:13:21 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 539GDIK524642120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 16:13:19 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE42E58055;
	Wed,  9 Apr 2025 16:13:18 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B77558059;
	Wed,  9 Apr 2025 16:13:18 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Apr 2025 16:13:18 +0000 (GMT)
Message-ID: <4d1b6282-dd2a-4325-90e3-b0b135d718ad@linux.ibm.com>
Date: Wed, 9 Apr 2025 12:13:18 -0400
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kexec failing with KVM on Power8 baremetal host
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: masriniv@in.ibm.com, Hari Bathini <hbathini@linux.ibm.com>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Sourabh Jain <sourabhjain@linux.ibm.com>
References: <c683fcdc-38e7-4bed-8bfe-dcf6f122da6a@linux.ibm.com>
 <8734ejzrv8.fsf@gmail.com>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <8734ejzrv8.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZoEHQzcvZ0OF3mwV3ypr1Sm9RfveXYW2
X-Proofpoint-ORIG-GUID: OIhNh1Bxgvb1cTEFYOONiIMeXmejdQW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=794
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090102
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/7/25 3:36 PM, Ritesh Harjani (IBM) wrote:

> @Stefan,
> Can you give v6.15-rc1 a try to confirm that the issue is indeed fixed
> at your end too? For this we need not add any custom changes, v6.15-rc1
> with kfence enabled on Hash should not give any issues during kexec.
> 
6.14 fails to reboot for me (blank screen) on kexec while 6.15-rc1 seems 
to work fine.

    Stefan


