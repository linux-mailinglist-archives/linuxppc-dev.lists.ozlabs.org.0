Return-Path: <linuxppc-dev+bounces-12785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDCFBD156F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 05:57:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clNpv6BcWz30M0;
	Mon, 13 Oct 2025 14:57:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760327863;
	cv=none; b=k0ui5CiOGJ0Rf0vYbQ5EO8+rYS8D1jLH4JrW0pxmisP5EV+33o/iDvQxTeLXp2MgJFdhYh90Q2QguE7wmOOXNw6gjSeK2hue5GQqfPw19ob6Zpy/XTTSEV5L3/8Zkmw04emNLQQt9iCl4+zGXGG05Ub/4swPMxAvAN5BnHKW5Y39Kl0WQNWKXNxKiM2ql92P1r44OZ/wBwcBPthGE5OqwG8i7RwuIgr0DCfhRHHx4ZwXa3LwEJ5NEHXRKLuugfMv1ndBEbaWT+8TVBowyHhhoKgkp4rWI681rLe0TNfYzsMC8jzqkU9tWxqmyMAALGy5w6OlVSEoJX75/xgBiJqfsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760327863; c=relaxed/relaxed;
	bh=dYUcldCDYjtOt/aJ7U1T2u+0/QboOdgpM6QvMKLCerk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XRAb0+3d2mWooBnltP3zR0r07O777WbEfHeW3LHX0dlsqEEo5bB7D1Dw+dFeYj8cVcgKpurIMcQN2jB4BDb3LtRyC5hwRb+igQImE+zBq2Q9zo4ReusnXckFVGEewZsPlCc/xv6myD8Dc7w3MER0wPE9mdp6NUcnMPXj9itrkprsPIVCK1c/CslInEgY3Tj/iRgpnD+F/FEPOcgKKizb5hYxM8oPIQ91Jk3H5c4lcVe339u5lSpXIu5+RXmSvgWYsOOWPlacPSQj9qrT1orA6NbMOj8+S5rZj0ipCGsKttiE9LHz8wu71vyAiifTHU7k0SUzSQxNQOBzgHo/S3r+mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CViKSc4H; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CViKSc4H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clNpt6WSYz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 14:57:42 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CNFtcN018669;
	Mon, 13 Oct 2025 03:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dYUcld
	CDYjtOt/aJ7U1T2u+0/QboOdgpM6QvMKLCerk=; b=CViKSc4Hmfnnk//MmMMHBI
	eGj0rjdw+lDPtkS8e4GBT+H0oLEa54E/MOIymzoxOi4ateznQQHh6sM2X1ZIkHBB
	rUkPHHc4zmxQK45paGXWr2BiWY9X7hlyT7K9Hdb0kgT+QKM6QGTkWoN4rT3/VmA6
	e0OdswYTg3YYhQY7xvFNAaBlW4/PVD7bDLc2WLXGwPsLilORPqIznk7dW1iubKkx
	f0NpfUk5c3HEAtIXj3M+SOkzLX2sIOushniyq14V3IxlIoSpFR6seIhAvXWeQiEU
	wGQlIyRYP3MxwWq2em7MMyYbmJXR0kHbbnJELucxdvH6ezDL63nZx5RG1vC7BCHQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qcnqy2a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 03:57:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59D1NMXc016756;
	Mon, 13 Oct 2025 03:57:30 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r32jkxsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 03:57:30 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59D3vUG735258850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Oct 2025 03:57:30 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43C4A58056;
	Mon, 13 Oct 2025 03:57:30 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75D275805D;
	Mon, 13 Oct 2025 03:57:27 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.255.227])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 13 Oct 2025 03:57:27 +0000 (GMT)
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [linux-next20250912] Build warnings at
 drivers/net/ethernet/intel/idpf/xdp.c:6
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <440ef1ad-6690-48e9-be02-1ccd69f6623e@intel.com>
Date: Mon, 13 Oct 2025 09:27:14 +0530
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, michal.kubiak@intel.com,
        ramu.r@intel.com, anthony.l.nguyen@intel.com,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3BDEECFD-5267-4453-B45B-07D3A1545D75@linux.ibm.com>
References: <22ac36cb-1ba5-429b-85e0-4e3f2da1f87f@linux.ibm.com>
 <440ef1ad-6690-48e9-be02-1ccd69f6623e@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=M5ZA6iws c=1 sm=1 tr=0 ts=68ec78ab cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=4drnqeK61DyJAoi-yfcA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 1BeZCayoiwzxwpxlj-op3k4Zc5SRH0e7
X-Proofpoint-ORIG-GUID: 1BeZCayoiwzxwpxlj-op3k4Zc5SRH0e7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDE0MCBTYWx0ZWRfX22XyIiGd3ULE
 y+Oljm6tmKBkXehnxpiC6/IvFlhRjeCDgsVtQ+363MNprfMsnd54LG/npsg41MdmgKnJWmizHSp
 OznguIWUYBVNV3vYWTnG9k6YZBASq8Q0dWq0zuIwKkbGUTF7vX4H+EnHnoLf4jvqx7wnt0mWCGH
 7X+ZUOa3JDaiWJaihy+9UP2jH+CbcUPmjvTkX61CkqwycJFcl8RhAi7sfTb2JJLSWfgvgkYNZp4
 nRuGKy4UIAEqXxxVg71w/2+oh6azn0lg47q7kmmYZvonYXjqZkABtP7X5IYg9KNYjd6pr/QFAQy
 gSrLcEFdrumaRXzfihq2eypYnqshI8TlQ+Ts+E2sHRJwz94etghkTqXsq7UTYs0RFkjfv0ZIxqb
 5nutZ2noKQjSQpMKPAOKC1/P9H6HIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510100140
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 12 Sep 2025, at 7:00=E2=80=AFPM, Alexander Lobakin =
<aleksander.lobakin@intel.com> wrote:
>=20
> From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Date: Fri, 12 Sep 2025 18:39:33 +0530
>=20
>> Greetings!!!
>>=20
>>=20
>> IBM CI has reported a build warning on IBM Power Server, on linux-
>> next20250912 kernel.
>>=20
>>=20
>> gcc version 11.5.0 20240719 (Red Hat 11.5.0-2) (GCC)
>>=20
>> GNU ld version 2.35.2-54.el9
>>=20
>>=20
>> Attached is the .config file.
>>=20
>>=20
>> Warnings:
>>=20
>> In file included from drivers/net/ethernet/intel/idpf/xdp.c:6:
>> drivers/net/ethernet/intel/idpf/xdp.h: In function =
=E2=80=98idpf_xdp_tx_xmit=E2=80=99:
>> drivers/net/ethernet/intel/idpf/xdp.h:28:20: note: the ABI of passing
>> aggregates with 16-byte alignment has changed in GCC 5
>>   28 | static inline void idpf_xdp_tx_xmit(struct libeth_xdp_tx_desc
>> desc, u32 i,
>>      |                    ^~~~~~~~~~~~~~~~
>=20
> Yes, I do pass 16-byte variables/structures directly.
>=20
> I would say this warning makes no sense, due to the following reasons:
>=20
> 1. IIRC the minimum required GCC version for building the latest =
kernel
>   is way above 5.
> 2. This warning should appear only with `-Wabi`, which the upstream
>   kernel never sets.

Now, this warning is seen on upstream kernel also.=20

Not sure if this is something we need to fix it or suppress the warning?

Regards,
Venkat.

> 3. Kernel is a self-contained project, this function is not uAPI, so =
we
>   shouldn't care in general about backward ABI compatibility for =
purely
>   in-kernel stuff.
>=20
> We have plenty of functions, mostly generic, which either passes or
> returns >=3D 16-byte objects, but I see this warning for the first =
time.
> Despite that my repo is attached to the open Intel CI bots infra which
> does daily builds on a good bunch of different architectures and
> toolchains (inc. GCC 8+).
>=20
>>=20
>>=20
>> Git bisect is pointing below commit as the first bad commit.
>>=20
>>=20
>> first bad commit: [cba102cd719029a10bda1d0ca00ed646796f1f21] idpf: =
add
>> support for XDP on Rx
>=20
> Thanks,
> Olek



