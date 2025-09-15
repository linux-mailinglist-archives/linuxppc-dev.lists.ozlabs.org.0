Return-Path: <linuxppc-dev+bounces-12230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD572B57EE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 16:27:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQS6b432Cz3dX4;
	Tue, 16 Sep 2025 00:27:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757946455;
	cv=none; b=e1vZQCkgUXJH6Z51mgJ9IEeY8VLXcWdR7FhNtN8u9hkvRMWobsdxraXHAohmKKceeGm+AaGg3Ji/vnVKtJNCFndW6Mdm3QN27/s+ZzsNatUSCn/fJw3Zq8aX4ZltNpwpy9XOpgoutWaDJd0blfBlXp8gZNK7g0dNraLq1mCwAQjYUKHamZUFxnnv9RXwCUeuHianpu5PWjYdVUA0jrMTSjv7lSYaaz1C8+ztH8uXuaAFaOZdqFZ+p08qGXgl5pWI7kc1cE5o/98t6HpknO5dpqpD4xaZWPzuw8EMdtlBzrBicBuh2W8C2YpvxtTl0AbkrHaZWrnnmo8iAA0a1cxYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757946455; c=relaxed/relaxed;
	bh=93gOvoDcBdDF+uhxagbjeVgcwGtEHX2Ajjpa7s8ksys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiyfgLBqfW5XxhzrlNqLVzhu2BOzKLKNV3sdcx4ZDN5aC9oMNKuW5xPhcQZhsqaZxKGofi2nkCArxKdB9gC+UFEBCs/WsR0Go2EpDs/SBijzRssAaObFC80r/rrZeatSy8LdaDkx1Zz5TONdiDAMWj8FzUWStK8LIYnxQrLhcP4tVigFavlEbixsdNoWgDZkXqC0DQLJgSMIRBS4ltl/bINSdpCiyy+UMuPb++VTsTFdClkuDA/I4DlhYH5VxXqdXds2DsBBYU8Ub1BdEwkZHZViARvTGHf/kK0F/kQybx7u1jzkVgkafr0McMFT9Az5WzdbnYJSMhJOblnhda9sUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r3sqyolF; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r3sqyolF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQS6Z58q2z3dWH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 00:27:34 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9auat018700;
	Mon, 15 Sep 2025 14:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=93gOvoDcBdDF+uhxagbjeVgcwGtEHX
	2Ajjpa7s8ksys=; b=r3sqyolFInDCeWDViJZMPqSncd/mubfFPzlJRMqhGniqLt
	i0svHLuD24/wgKmko+PVfQ0dPS0L2xwCX9nuPIoU9im8LEl3TB6JbNtlFKrp9c9f
	Ul60BOC/R1QomaUkpW5Q9qksws694I8cEAxtvwtovsRKjGRlT3J0aqxOTYqF6d6F
	65szjdMct/qYq2awarrH5MXGmNQCWF78ggkDxUs1cPXK6zLVHGdYKWYt9f44VC0R
	iMQ5o1EkXSywDP5INlMBBEKuZ8lwCbdbwIVBDtjv9MI/zOk6rAAfdIJXxv56KfMZ
	xAJIJDE73H9lJu0ZuWDBOHseGxExRNhG51NBsHxA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat1gxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 14:26:19 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FE2KcE000732;
	Mon, 15 Sep 2025 14:26:19 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat1gxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 14:26:19 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58FBale5022328;
	Mon, 15 Sep 2025 14:26:18 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kxpevrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 14:26:17 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FEQD2U58196468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 14:26:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E294D20043;
	Mon, 15 Sep 2025 14:26:13 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE34720040;
	Mon, 15 Sep 2025 14:26:13 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 15 Sep 2025 14:26:13 +0000 (GMT)
Date: Mon, 15 Sep 2025 16:26:12 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Venkat <venkat88@linux.ibm.com>
Cc: Julian Sun <sunjunchao@bytedance.com>, tj@kernel.org,
        akpm@linux-foundation.org, stable@vger.kernel.org,
        songmuchun@bytedance.com, shakeelb@google.com, hannes@cmpxchg.org,
        roman.gushchin@linux.dev, mhocko@suse.com,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, riteshh@linux.ibm.com,
        ojaswin@linux.ibm.com, linux-fsdevel@vger.kernel.org,
        linux-xfs@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        cgroups@vger.kernel.org, linux-mm@vger.kernel.org
Subject: Re: [linux-next20250911]Kernel OOPs while running generic/256 on
 Pmem device
Message-ID: <20250915142612.1412769A80-agordeev@linux.ibm.com>
References: <8957c526-d05c-4c0d-bfed-0eb6e6d2476c@linux.ibm.com>
 <BAEAC2F7-7D7F-49E4-AB21-10FC0E4BF5F3@linux.ibm.com>
 <CAHSKhteHC26yXVFtjgdanfM7+vsOVZ+HHWnBYD01A4eiRHibVQ@mail.gmail.com>
 <240A7968-D530-4135-856A-CE90D269D5E6@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <240A7968-D530-4135-856A-CE90D269D5E6@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=BKWzrEQG c=1 sm=1 tr=0 ts=68c8220b cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=OU48e3ldqOrICINtdUEA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: jgtZKvDpLeX2b3zEu8f2-Dy7WMTShlp-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX8rssnOatAT47
 qK4h0PeWsydAe0MHXzSRtuYWyO575+9NysLJBvrGV6juLdCCu6snHKxKDFdJJKo31gh+AWG/lqp
 JCbTkekkCgnHIudxddKp5Qsj6Oml6txHzFZZ9iIojl35whvWSirBu9qgHHJv8DQGtPo2cWmsM/2
 9FAJt4Li/srUK7PgaVNFHZBjmDdiOd5Dd+kercpV0Bi7B13WgEbXUfQ+HnBrquXDnF/YWzlLxdH
 tMQLRuqWhsSlZNYbKpbyOYLYG2l5k743FHJi7SvDZBILwkoM9LfFHD2/7WhlFAz4mbKI8BV5b65
 nxLJnGik0jq5Ld2KyrctTPfSI0E/JuANG6/mVJ8F7SbxuLsxOtqFfb9+I+x3sOH/LJwyeMP44J3
 z2t7BtXP
X-Proofpoint-ORIG-GUID: k3kwdpkBN8cmqlPUljTfmONvIC_Jnwqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 15, 2025 at 07:49:26PM +0530, Venkat wrote:
> Hello,
> 
> Thanks for the fix. This is fixing the reported issue.
> 
> While sending out the patch please add below tag as well.
> 
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

And Reported-by as well, if I may add ;)

> Regards,
> Venkat.

Thanks!

