Return-Path: <linuxppc-dev+bounces-10822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB99B21A06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 03:07:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1CzS4v9rz3cmP;
	Tue, 12 Aug 2025 11:07:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754960868;
	cv=none; b=IcTFYIkboQ6dt/N89D3I8B3A+tKjHfMcEF4seU8h9+kLWhagVppmu03EKo8l/a3eaGK/MwrOT5HHdouBYqjOerBT5FdBjymEpsTiLmWkEUTfk9xHpZjxeCjKeEeQs8/6Yn2JG2sGKUmFgdwSx2XigWqxPj+UhZIk/VbX3POHSIs39JJiHHGW9xjO3NlTA0gjnq/3C9hxkEQ/KTCmryvKBlIjKo/W4M9Da+HAuKlSS7U9wj7OwGRhkjm9Fn4qGi302hP1k/x70+RhJ/iSuPBMoMU1L7D5pQj/f8j/rztyHrIKxfNoNCYV4erPcntfGhPKnrlT92Fucm0ME8A+o/6Raw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754960868; c=relaxed/relaxed;
	bh=KTMwMjN5XNHM7Lm+Fb7sBHW2HbAUE7pvGTEY7fDwssU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XVtkHiO+8Zh/yLgNgV2MfPzD45L5TRqIqoP6GkftnPWu5GMDDOyMd4MQwnXkVp+TfGuzN6imkJfZH8RUkGvJndJIdNODINgenBpjzTq8IOCy0EvEhjvw85/8RO0oMq/abZnkS17ZmtCYBh2wOVBbibJXcW7e/oFqyqlVyK5NdGitTY0JJC0lTe/xwwVdY9Rz/GGxtZpJ5aldwjCQzWESyJ9nCs2nNsgDQP5UQ83OE6mDZkCiO9ep7pEnXPF8puv29VXkwn/KuaIlp0HWYjcx/DXfFGhPQ3bFaM+CN5+2HvDUq71Ej/3FTSy0cVICTF1Er54qyexi4KOzjdAY4wPYLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DLPpaYd1; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DLPpaYd1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1CzR3bjKz3ck4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 11:07:47 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BLVm5T023394;
	Tue, 12 Aug 2025 01:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KTMwMj
	N5XNHM7Lm+Fb7sBHW2HbAUE7pvGTEY7fDwssU=; b=DLPpaYd1A90aySyDv/fGbY
	L4pnTPRIF2LXSxdtkaWYIGu8NhtXsvUTws4kr2TTj3D6NTsvsihg8as6ri/d/gvH
	UebXDkzLx3l10TeO3QW5D3HVT0gocZE9H1kyfMI4roOvvxx+atPE44vktJqAzyp6
	MjquidCieuy7N8lwaQms1wJDGO9FqaY08KHEuPN85UDKBosx2lw7y+QDN3UMxTDk
	Z/wAtuZTFwOCDe9xwnz6hXdFmjTMSQJ5eqka1ph5lzbd5KK4qHL5gOmUCuWsEZUy
	4MoyBDj/DVdAAkIwZT5HT7fXOvMDkRscPtxjS2Msc6KIBSRMd8Z5ttFhncs6U+sg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dwud4062-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 01:07:18 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57C17IaJ005415;
	Tue, 12 Aug 2025 01:07:18 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dwud405x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 01:07:18 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57C0ESqr028658;
	Tue, 12 Aug 2025 01:07:16 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48ej5n0500-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 01:07:16 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57C17FwT21889720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 01:07:15 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DB6558055;
	Tue, 12 Aug 2025 01:07:15 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BAF85804B;
	Tue, 12 Aug 2025 01:07:10 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.9.64])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Aug 2025 01:07:09 +0000 (GMT)
Message-ID: <b1fe7008d2f230dd89be6d2541b7cf07ed2514e3.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc: pci-ioda: use bitmap_alloc() in
 pnv_ioda_pick_m64_pe()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Yury Norov <yury.norov@gmail.com>,
        "Jiri Slaby (SUSE)"	
 <jirislaby@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael
 Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy	 <christophe.leroy@csgroup.eu>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 11:07:08 +1000
In-Reply-To: <20250811165130.37552-2-yury.norov@gmail.com>
References: <20250811165130.37552-1-yury.norov@gmail.com>
	 <20250811165130.37552-2-yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDAwNiBTYWx0ZWRfX1EYmdOrgpam5
 3S2S5jkQE40dr0UIkXSd3GFEryPcIfGZ1jhzgxwX/wSWtICuwcXNMNCYs4aaoqu/p33w3dltIDV
 MWVzMjVk6yjwhZMKHL4CUQXjJeCxhna0+Z9nN/ZXeivFBPY+I5+2iP5FRa07NPb2Ldu7ej8ds4w
 VxUs2rdgB4TJHquCV1AUWDbVuA7qqTmc40MAc8cn2LgHH9jvmTTXgnqMJf5RAMz67vB+27tNKm3
 Z02oltAHFUsK2I2qFUxgsvue1iv/5NXM7sxCUuJfUbGkjvfYx4g/CeQ4eSj5bmHYiOD0C8XhGRS
 r0orRS4AqfaHSvFbVXh4yfzAUlsSr+y1N72zkDME3+fmnkyHUXVhP1R7Pm3+0SoSl0/soZ5GMlL
 GPZu/SYPjG7//dFIOP7fXZQ4j+sXaoB9d/6iFsAcjP1aqWxMvwA2uF23QZrpZEIeGlAcC2bS
X-Authority-Analysis: v=2.4 cv=d/31yQjE c=1 sm=1 tr=0 ts=689a93c6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=nv6hu53MCykBhvJXlPMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: q5k-ITRlexnVPg2HoUqlWfsMcuyLqFBf
X-Proofpoint-ORIG-GUID: lWiHx14I5yZkeDQ5FumdpRZ4zcHg5a9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_05,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=640 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508120006
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-08-11 at 12:51 -0400, Yury Norov wrote:

> -	/* Allocate bitmap */
> -	size =3D ALIGN(phb->ioda.total_pe_num / 8, sizeof(unsigned long));
> -	pe_alloc =3D kzalloc(size, GFP_KERNEL);
> +	pe_alloc =3D bitmap_alloc(phb->ioda.total_pe_num, GFP_KERNEL);

I haven't checked whether or not this has practical impact given what we la=
ter
do with the bitmap - does this need to be bitmap_zalloc() to match the exis=
ting
use of kzalloc()?

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

