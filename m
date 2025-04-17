Return-Path: <linuxppc-dev+bounces-7726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E877BA9138E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 08:09:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdSCq60Mzz2yHj;
	Thu, 17 Apr 2025 16:09:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744870183;
	cv=none; b=igHwTwuKsAy2J9PcpqmSY1PrCRG86JiTQHMEBsB1eT6oSbIAsjK7Yxx+yn2yVKhG4pYl5mqun2A7ZSdh2bTCeXZ7VgQ8TiIlU46W57DWFoyNN12L3WsLKTnEGrn2TW2KcWzFh9J29LT9DsU/cLnaD+KRUBoZLgluR08q+RdrKUSbqinudtsa5B73sZAqW9F8vB9nf+6oMpenwA8O6f87K3qnCbTuTz+WxX3glf7OePcjFchxm5GCEI3uh1d/sQGZczgmGWWsEr1ASSNNBj56kCbLPZ4lSg3FLN1lpBowOOGAnIu10q+EKeoSVlh1u8jJxnd+KH+VFF8hPGqgIidTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744870183; c=relaxed/relaxed;
	bh=OibXNJCHuU82A+EwGowd4e3lnAlwTBETZ7mbg5uTl+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPcyJnFRZ4YB26GJYkkY8opX8jO5l44JVpc1tiLD/b3R0wvlEBBJogzKgikep3FS6zGnpdN2vaf67bDEy4jmzdDq5Uik+80+SeCStOC4fug+DR1htq3LLR10KCm0FtZvOm+KC8klISR06v+4GAhBAAAt5MxaYcDCyJEES0WZNWBb9fYOEm9nGT5bEtvkUVTfpwLDRJboyt5qcuuuI6Hv+C9nFDqAandQi/Gnxcixc1cgm3kmMPZMUv7vCB9sgWmU38mc0ep5zXh+HOyXlUNNFgeDcvmFpXMdC0WQl6D5A+X1YwYY2KryP4BTkiLPsCe8EGjIMP8ZGdQgJ669zODUnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FhOkpxSp; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FhOkpxSp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdSCq01ptz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 16:09:42 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GNlAqZ019278;
	Thu, 17 Apr 2025 06:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=OibXNJCHuU82A+EwGowd4e3lnAlwTB
	ETZ7mbg5uTl+o=; b=FhOkpxSpmgICINQ0SP8mU9hZrbuIeTDnx8lpswj1QNafVH
	DlxjyeGnHMkvG7Ior+JiVeOD5v69rRYMGIERnw6h3Q1wJYl5I2Xikg/H7BMbefer
	JIfsx9gzdmGZ9QvIrwuUlQACJcSNCMjtKXuK37HsePn70VDxqUIn7kyJNCW9BYfe
	QMGUuvQ14zve2fa8sgDOUrEBL/Mpgv7kEw7tKAqWE3sJoNut0FyUoB5e4sBi6mmS
	CF7Qvb2DzkwidK7UfLsA6uTD1Rn0aFhpvDcI73YHIMls4onsSpF58lri+v1bt7rh
	mv3tnKeC4G1ulH7mZPx0gTMvDvX5PJdF65mIkwOA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462ph09amt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 06:09:31 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53H69UCn013794;
	Thu, 17 Apr 2025 06:09:30 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462ph09amq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 06:09:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53H23KSh017207;
	Thu, 17 Apr 2025 06:09:29 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46040m46b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 06:09:29 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53H69Qfo51052878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 06:09:26 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F18AD20040;
	Thu, 17 Apr 2025 06:09:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E73420043;
	Thu, 17 Apr 2025 06:09:24 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com (unknown [9.109.207.139])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 17 Apr 2025 06:09:24 +0000 (GMT)
Date: Thu, 17 Apr 2025 11:39:20 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: Misbah Anjum N <misanjum@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arch/powerpc: Remove redundant typedef for bool
Message-ID: <jwhxcpjsikjfwmeibpssbc3mvr7dhkd225bfgp4pukr3caugxd@mdruiivxfhod>
References: <20250323163607.537270-1-misanjum@linux.ibm.com>
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
In-Reply-To: <20250323163607.537270-1-misanjum@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QJdoRhLL c=1 sm=1 tr=0 ts=68009b1b cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=WN4RLpz-Xj6QzkEfG4QA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: nwZmyqO5dRddaamJ3gdckl7Dq4Uca1t_
X-Proofpoint-ORIG-GUID: 9vC7EEff8svzUx1zPm7V4x-nUUs2J2NH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 mlxlogscore=833 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504170045
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Mar 23, 2025 at 11:36:06AM -0500, Misbah Anjum N wrote:
> Hi,
> 
> I noticed that a patch addressing the same issue has been proposed by
> Michal Suchanek:
> https://lore.kernel.org/linuxppc-dev/Z86liwlwP5WvrEkw@kitsune.suse.cz/T/#t
> 
> The existing patch addresses the compilation error by modifying the Makefile
> to use `gnu11` with `BOOTTARGETFLAGS`. This is a practical approach to avoid
> the error in the short term.
> 
> This patch builds on that work by providing a long-term solution that ensures
> compatibility with C23 while maintaining backward compatibility. Specifically:
>     - It uses `__STDC_VERSION__` to conditionally define the `bool` typedef only
>     for pre-C23 standards.
>     - It ensures that the code is future-proof and ready for upcoming C23 standards,
>     where `bool`, `true`, and `false` are reserved keywords.
>     - It avoids reliance on compiler-specific flags, making the code more portable
>     and standards-compliant.
> 
> Changlog:
>     - Adding version check via __STDC_VERSION__
>     - If  __STDC_VERSION__ < C23, 'typedef int bool' is defined as usual
>     - If __STDC_VERSION__ >= C23, the typedef redundancy is removed
> 
> The patch has been tested with:
>     - gcc (GCC) 15.0.1 20250228 (Red Hat 15.0.1-0)
>     - gcc (GCC) 14.2.1 20250110 (Red Hat 14.2.1-7)
> 
> Thanks,
> Misbah Anjum N
> 
> 
> Misbah Anjum N (1):
>   arch/powerpc: Remove redundant typedef for bool
> 
>  arch/powerpc/boot/types.h | 2 ++
>  1 file changed, 2 insertions(+)
>
Reviewed-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> -- 
> 2.49.0
> 

