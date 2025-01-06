Return-Path: <linuxppc-dev+bounces-4708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 889E4A026AD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 14:35:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRZv52G3sz30Tx;
	Tue,  7 Jan 2025 00:35:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736170545;
	cv=none; b=Oag/A8KIWO8mAKwFR1A8Aj5rkRbmyrPctToYwLUccdy4CAnNtnA0YkBraUi/LcyNlp2zlU0UZA7wX6ySRGuohuhQy5dD3kE6qeV3FdLfX0wf5s3936fD9M13W9qktXl3UA9/vFRVQ8H3SHDOlsynPhnTPBjCAK5nx8Qc8VpBnfYp+gJynYWyQVgc2HPPY6ftNUcFef04T8bExRVOqcLTlRPHci/oQqHc7Wc+kca2qfVL703f9RAP+U8qkcnBdpXPmjwg3JYcURDY39OUkwOb+MUzBi8xa6LI+CS92eV2oarjLbcBV0g/G4TVnSEoh9je9YpCKIuJbFZdWA9QtorgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736170545; c=relaxed/relaxed;
	bh=lrftkFSyTk2s/yfIapFP+84J+Q9Pn5cd9LVcrQZ2iI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eX2/MqKReXu+36Ki9dZxh5VO68tQNy6E2iiERjAtxXbcLnGj1ontLIz3NrWVHP/SBwaemAa5YS1dYKH5JKPboCNNJ5zNiAkxWwWdsHybtYP9HV/AnDM5qx2Z9k4mb8pZgejNsuJdOCEVegkTyT1ADLNK9S8k2fopubH6y2jQuAR1UZ1BCIztlg8vxSe81Ci7KWY1ubj2PvzUsy27Kam9xybYP/GkPuNeY5g+jzhetOhcHzkmzat7kzcyTGk3auC+4sQvGbxQho6+fMQG+AAUo58dG7r2UKfK2DtNjn7aOOx2axtzRu64wWyd1dlp9J1sDYRdS4nuwY+imUjahRSdYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PDtlb5Bs; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PDtlb5Bs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRZv36fP1z30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 00:35:43 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506BoOUG007085;
	Mon, 6 Jan 2025 13:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=lrftkFSyTk2s/yfIapFP+84J+Q9Pn5
	cd9LVcrQZ2iI8=; b=PDtlb5Bs7aIfNSK6IDvwDAT5115xFIn9zs/UvICAM0v+eC
	g+1dQHbRORY4WtYTVHnBGKFMHlsum17PMdPkHxGG8c+Hk1qp9gIgNYqampQyph/L
	7+Iyu3Eh2EL1ZpXOQqlTp9xf9jcs+nnkA/SqlGB9wfOgk1Z76TLVBFPp6KnEhUsl
	sep4v9WCj9iFJA/3XWeaTiTAe7D25ZLWuotAgyhqA1PeYHgzC7zVd2fp37ltKmwk
	1OHrieDYwJU2jzFyuqubKBLa6kUkQKGeQoJ14ralKi0q47s3GP2C4b4LbiHXFbXr
	ywPBX6l8sMXsvIHzw6tl4sOCH2VAVHQCEGwb2Spw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4403wajp6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 13:35:00 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 506DZ01B000336;
	Mon, 6 Jan 2025 13:35:00 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4403wajp6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 13:35:00 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5069PNdl003571;
	Mon, 6 Jan 2025 13:34:59 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfasx25x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 13:34:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506DYvtv53149954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 13:34:57 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4295C2004B;
	Mon,  6 Jan 2025 13:34:57 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A410720043;
	Mon,  6 Jan 2025 13:34:53 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.179.26.127])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  6 Jan 2025 13:34:53 +0000 (GMT)
Date: Mon, 6 Jan 2025 14:34:51 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
        tglx@linutronix.de, david@redhat.com, jannh@google.com,
        hughd@google.com, yuzhao@google.com, willy@infradead.org,
        muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
        akpm@linux-foundation.org, rientjes@google.com, vishal.moola@gmail.com,
        arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org,
        npiggin@gmail.com, dave.hansen@linux.intel.com, rppt@kernel.org,
        ryan.roberts@arm.com, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-um@lists.infradead.org
Subject: Re: [PATCH v4 06/15] s390: pgtable: add statistics for PUD and P4D
 level page table
Message-ID: <Z3vb+0MktvDNysQD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <35be22a2b1666df729a9fc108c2da5cce266e4be.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxVkg3i7zXI92e@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <a3a2bd64-9952-4c66-8626-f2436ce07d1d@bytedance.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a2bd64-9952-4c66-8626-f2436ce07d1d@bytedance.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XFfmZXEbdi1lmX4sTCZJHlLIWFA4SLIH
X-Proofpoint-ORIG-GUID: N1gUawSn25jz-02tMlFh_LT5dfHmG37b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=703
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060120
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 06, 2025 at 07:05:16PM +0800, Qi Zheng wrote:
> > I understand that you want to sort p.._free_tlb() routines, but please
> 
> Yes, I thought it was a minor change, so I just did it.
> 
> > do not move the code around or make a separate follow-up patch.
> 
> Well, if you have a strong opinion about this, I can send an updated
> patch.

If you ever send v5, then please update this patch.

> Thanks!

Thank you!

