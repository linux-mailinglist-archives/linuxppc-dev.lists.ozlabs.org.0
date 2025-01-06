Return-Path: <linuxppc-dev+bounces-4715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B50A0281D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 15:35:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRcDQ3drvz2xtK;
	Tue,  7 Jan 2025 01:35:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736174150;
	cv=none; b=RM/efU1D6Dr3qA7O2WanEeOzBitswTfxSFJyRURezP/6wTP617u0pBb0XDzQBcIOqMuxjLWxf1TG+ID9rckGWlBd6pYzx2k3KcWVnpx0xJPDWVBpBBLau2hE8nLsNcLIUoHNlpCSlcGz+OzPY8CTdd+u2b85wIwwphQD3qLbH4W7nBPZXRqc4hKQmPF0OjpVqwVIwTJomVY5BGsTK3YH4MH45BtkkMNzn4FDddzPN2shWefLDfa5HWcruAWjYoatbBrL/KMsHLTbqiDz8XxIt5m0rob46AUEboRLNZ775k8fTzPgdxvYeyMNDXUHqbJLy4K0TpARbQ7sNnWwvIylbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736174150; c=relaxed/relaxed;
	bh=yoK5E8r9ZiVbP/iseDdGu93jcAAz/4Uy/8D3TkhMEPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnTMKqy5ZQBIsZd6q3h04heW66HI2UUrknV5aEZ+YBHh8XwCxD7CAyz3cR0hzDt6Epp+324EvcVQSUFBNrZe9jr4w1O4ytrEdseQ6JKSchD4N1l82QhtPyLjTiivDQU4CqIRLltUR4u0zIT6AUnQu+pWawINaLKkPu3g5niWg6A6msgKjZBOSRPowZBdyzNNbEMPofwBurR3SZ/zY2nlMX5gsczu4tllOpcTfOPkZwoMzPiKu+n8h/0Lg5WGrMn0iL2BaY2EmAFhXJ1e/p6jdcNBZwts8BrzYOm+Vc99yeV71wrFTK9UwwKtMljm/Qh25SYWB+OMuOOp2k+Q8aXslw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RgUCNi9X; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RgUCNi9X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRcDP2pX7z2xr4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 01:35:48 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506DKdR6028353;
	Mon, 6 Jan 2025 14:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=yoK5E8r9ZiVbP/iseDdGu93jcAAz/4
	Uy/8D3TkhMEPQ=; b=RgUCNi9X25JhEHAe1CAG1qqWDykE2cD2UYRU3jmdIYZ8Ch
	T5zNuZL1wNyGI3Vx6v5lGgT6nrQjUFmPBzbnAHtewI+GPO2JVytXZHj2wHKmhggO
	GdcJ4vAjUlaHrEKk26fgqLKossjwTqPk3DWuWYX2Dr+Z7onrnepYYdpVWHvCydHs
	bu32Wpeqd9ftCqq6EZBoM7oOtX/GhoZh7MR5d6abz5ggaLaPXwccpK1Z1mGCENN4
	yKVEOjmgL8y/m6mo88lKz8bR0FDZGFR18HK66OfhU0FrVIV1cSA7wvm4ufpM7WPO
	4ER6RJeXDR1BpR42AHtSLYfW3/ShkDYByj64zWig==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44047hb2wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 14:35:17 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 506EZGRn003388;
	Mon, 6 Jan 2025 14:35:16 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44047hb2wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 14:35:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 506CA9Jj026189;
	Mon, 6 Jan 2025 14:35:15 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yj11wr3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 14:35:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506EZDIG28705314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 14:35:13 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96B4320043;
	Mon,  6 Jan 2025 14:35:13 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 345D620040;
	Mon,  6 Jan 2025 14:35:11 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.179.26.127])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  6 Jan 2025 14:35:11 +0000 (GMT)
Date: Mon, 6 Jan 2025 15:35:09 +0100
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
Subject: Re: [PATCH v4 12/15] s390: pgtable: also move pagetable_dtor() of
 PxD to __tlb_remove_table()
Message-ID: <Z3vqHXdwIMBVQ2GT@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <2d16f0fe-9c7f-4229-b7b5-ffa3ab1b1143@bytedance.com>
 <Z3vQHplZqtHf6Td8@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <57ea8193-2fd9-41a9-85b4-7af924f900f4@bytedance.com>
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
In-Reply-To: <57ea8193-2fd9-41a9-85b4-7af924f900f4@bytedance.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sJuxnsXxxJgGCCGTIUc0sEdh5BRYGtAz
X-Proofpoint-ORIG-GUID: UPicS2fzhLCrpHuuN_a8oN-YM2X9yFa6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=791 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060128
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 06, 2025 at 09:34:55PM +0800, Qi Zheng wrote:
> OK, will change the subject and description to:
> 
> s390: pgtable: also move pagetable_dtor() of PxD to pagetable_dtor_free()
> 
> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
> PMD|PUD|P4D to pagetable_dtor_free().
> 
> But pagetable_dtor_free() is newly introduced in this patch, should it
> be changed to 'move ... to pagetable_pte_dtor_free()'? But this seems
> strange. :(

s390: pgtable: consolidate PxD and PTE TLB free paths

Call pagetable_dtor() for PMD|PUD|P4D tables just before ptdesc is
freed - same as it is done for PTE tables. That allows consolidating
TLB free paths for all table types.

Makes sense?

> Thanks!

Thank you!

