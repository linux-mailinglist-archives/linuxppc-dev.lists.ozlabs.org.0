Return-Path: <linuxppc-dev+bounces-5586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433F1A1D191
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 08:36:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhKxL39msz2xGY;
	Mon, 27 Jan 2025 18:36:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737963414;
	cv=none; b=kt2j0dWhPJ0BTYGBVhmCefGIInZ/idbBXF50GHOcUVy5q5EwOSjzfa5Rl0LgGXDU8a9o2r8wHOlXGTy0fEKCVg3nqWwhTkEUm7sNTVmakujc+btNNSP0DHONI7NCZxMWXwbzQpa2uOuKxbgTmtYHT6G8x5WmgE7x416fpEFzmZ27//in9tFgAWOtVMy05LBFAI+2zmwkeWbZOGeRQfig9S+nVtwQWMaXuOBwV7RbvXUj2U0mADqlf+1LbGEF97N+QTrxjaxSPmDHhmBMCU1oPKEVIj5n9BpQ/rOEPcadZXqvUpeDn8f1vWLo0AIX7QPLSX1NMuXmVhDYucTK/gDjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737963414; c=relaxed/relaxed;
	bh=Y1sCtAisinjgsZyYOat3ARot9XjKhREXWr4KiHU+0OY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J0J/5Hjv38xJ8AZvN7fO7IQ0S5hfkyjkSeIVUjhayZvCft5aMfdKB2tv+wmcwtSmXnkMiPdBXqjhR7Lr8CshtR9foR2JB7W+z+5TrozeukPqPg8p+XOSvDlu5nkmu/ZA61clXupaU96bMmXSegWjTwRD1j3JNbxhC7zIy8rjqMmM7a7uX73Iw6qI4fUtxi9WJ8aHSNNgNoKgSrM0p2iHlJpjSvOyZWIggZZm4jFeiWn9LOn7o1Pa3GZBAMM++wMqKCCKNECD+3dXkZO46YHyvO3fXfq4jAUHAn4gyWAXgJ77wQeHiPhYN60d/OCghTUkwLr0FIk9kktxevRvfk3+nQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=coHUWty3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=coHUWty3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhKxK0f1sz2xnS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 18:36:52 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R5NnXf030643;
	Mon, 27 Jan 2025 07:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Y1sCtA
	isinjgsZyYOat3ARot9XjKhREXWr4KiHU+0OY=; b=coHUWty3XwTvwx0miFXP+A
	ewVsB02bZltWrDPDtjvnjSZEDGZeanOsevj7SPEb2ZsjjpqPMXmCJwI8vPCUjBMA
	Tz7jA/liTOC/ci6J0OYDjyw27xUyUec/AXDoW3d3A0xkC2OkqXnI0KC4XXblE9yi
	lcJaP98p1sMkV6lhjIV73r3fpzoXoimZmS2qaVIEmJj0ftapdax7W9mq8FZTw9Ly
	LPeaJ9PtPjxGrs4j8Zf/+nFCvYbVi9L0bnzTF9MNtbmXswLBnnyK987aWxRb1/km
	0hjn9avuCSWMxC+QWaaE8u6k4Lq67UXs1pkQyAt9H0/hXC9UFVSJdP+LSdiuopNA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44e3y7rgtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 07:36:43 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50R7YLg7010750;
	Mon, 27 Jan 2025 07:36:43 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44e3y7rgtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 07:36:43 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50R6wmgB003957;
	Mon, 27 Jan 2025 07:36:42 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44da9s5djr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 07:36:42 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50R7ac1X64291200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 07:36:38 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8966E200BF;
	Mon, 27 Jan 2025 07:36:38 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA11A200BC;
	Mon, 27 Jan 2025 07:36:34 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.30.253])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 27 Jan 2025 07:36:34 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 27 Jan 2025 13:06:33 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com
Subject: Re: [PATCH v3 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv
 specific PMU
In-Reply-To: <40C19755-ABE4-4E23-A75A-1F6F6DDC505A@linux.vnet.ibm.com>
References: <20250123120749.90505-1-vaibhav@linux.ibm.com>
 <20250123120749.90505-5-vaibhav@linux.ibm.com>
 <40C19755-ABE4-4E23-A75A-1F6F6DDC505A@linux.vnet.ibm.com>
Date: Mon, 27 Jan 2025 13:06:33 +0530
Message-ID: <87y0ywu2ri.fsf@vajain21.in.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WI0OYns2V5mRYoL7l6EzBfFQYPMiVpt5
X-Proofpoint-GUID: OWa1752MrPhAEkRGy4X2WucZV5eKwoKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=616 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270059
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Athira,

Thanks for reviewing this patch series. My responses to your review
comment inline below:


Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:

>> On 23 Jan 2025, at 5:37=E2=80=AFPM, Vaibhav Jain <vaibhav@linux.ibm.com>=
 wrote:
>>=20
>> Introduce a new PMU named 'kvm-hv' to report Book3s kvm-hv specific
<snip>
>
> Hi Vaibhav
>
> All PMU specific code is under =E2=80=9Carch/powerpc/perf in the kernel s=
ource. Here since we are introducing a kvm-hv specific PMU, can we please h=
ave it in arch/powerpc/perf ?

Is it common convention to put PMU specific code in
arch/powerpc/perf across ppc achitecture variants ? If its there can you
please mention the reasons behind it.

Also the code for this PMU, will be part of kvm-hv kernel module as it
utilizes the functionality implemented there. Moving this PMU code to
arch/powerpc/perf will need this to be converted in yet another new
kernel module, adding a dependency to kvm-hv module and exporting a
bunch of functionality from kvm-hv. Which looks bit messy to me

<snip>

--=20
Cheers
~ Vaibhav

