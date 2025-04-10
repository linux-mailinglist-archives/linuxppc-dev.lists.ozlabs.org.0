Return-Path: <linuxppc-dev+bounces-7569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A992A846D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Apr 2025 16:50:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYN6J4rkGz3bn8;
	Fri, 11 Apr 2025 00:50:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744296648;
	cv=none; b=LgYZSKVZsM/rgDgoP7sA144GwEr4dTLXs596K1pC5eWGBoswLBjXETrweVpxbeOZucZ3YVFyy17KITofxVP9VTpW0Knb7fnuSNjWzxLNKreQoxXoHRiYmVEXRJtgbtCUSt/fTqhk45b4P5Q58lEl/0338C7BDeLi6kiHYg6k8ZkwHt64PqaqY3Mw5heW+1P4el5s3vtVymt2YEfNrG4ZNu0n4ld3KGjWZJ3MUMkY7oPIhTIwMskMm06yMczC8llist3OS5SiVY2J6ApKqY7JyoCdPOD5kgyq71LsCIyUpSXER6c9moJ2uN/F2/tmtLRjbgNFk9hoefm5c622Mm2vkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744296648; c=relaxed/relaxed;
	bh=BYsGu8041TJKDiTwC4nSOTLKvk5gUh74iryFT/a8d94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyILLYT+3DbcJeH19O2u9OFhmac94Ae998NgeCCDbZ6PCQLtW7pzZr4prb1kdfYHN5g7L2LuSSKPzXYcUzwuxJUlVOlgkgnofYpb4z4XwwBzKBdMihZ8LBuFly3iUHoXq+SEozLc3D7ueOddQhMAkEAY1lpLiQgO+fqtR4AKmS7drkGbV7sYVstZAKqfB5MFrmp/TPoK6VbpyJ/MkrwX7ecZbO9C6W0Ce7hhwpbgeSRGrn3BN3/qma+QMU9menmfTe5zxZ+WDIXRqZoHBhGfng9edGGlnxgOiWwro4krwm5fwRG4Ww/FMHUaYRJ2VHv0Ye8KZyFrXeHa6jCCtdCFuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GHSeuzsU; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GHSeuzsU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYN6H20Hkz3bh6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 00:50:46 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AEQ4q4003967;
	Thu, 10 Apr 2025 14:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=BYsGu8041TJKDiTwC4nSOTLKvk5gUh
	74iryFT/a8d94=; b=GHSeuzsUYd5nnNQMYil5RelPGATOvgyAywzOxJ8ecP/SWP
	pn/mbmYaHdwCwUMAiJchyY30pmPlbSCMFFwBLGsMlSs39dXVX8wR1GWOY61y+0I9
	P0fVUW4aYmRCJt2TXf7GxdcbhCjv+LYQ2vBPvnBpnFU0t6CE38HS29clGo+4f/nj
	DIStYZ76sdRxSSc36EKkGsYDNAaysM2Veay/8iLlowkE4hGgnio8RuAPMxt6K8FW
	8xXMFJKzHph+Prt3GToaVI/MY56YzACT+pxcQ5p8770ENhkmVA/kVzvtqNT9aV+e
	oRgC3ZC/6bo4KGJ+lkxpw9SfI/8xtksuUdeq23UQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x0405aj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:50:37 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53AEfDgF001462;
	Thu, 10 Apr 2025 14:50:37 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x0405aj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:50:37 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53AC31SV024610;
	Thu, 10 Apr 2025 14:50:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45ueutpp0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:50:36 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53AEoYcK56623564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 14:50:34 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFFC920043;
	Thu, 10 Apr 2025 14:50:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 772A620040;
	Thu, 10 Apr 2025 14:50:34 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Apr 2025 14:50:34 +0000 (GMT)
Date: Thu, 10 Apr 2025 16:50:33 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, kasan-dev@googlegroups.com,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm: Protect kernel pgtables in
 apply_to_pte_range()
Message-ID: <Z/fauW5hDSt+ciwr@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1744128123.git.agordeev@linux.ibm.com>
 <ef8f6538b83b7fc3372602f90375348f9b4f3596.1744128123.git.agordeev@linux.ibm.com>
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
In-Reply-To: <ef8f6538b83b7fc3372602f90375348f9b4f3596.1744128123.git.agordeev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qOyZ_qtfAnXBqjGgzKrxZe6XNJEPhu2V
X-Proofpoint-GUID: IFxT-UrSu4Mf43qBHxm909ZShflClWgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=557
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100105
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 08, 2025 at 06:07:32PM +0200, Alexander Gordeev wrote:

Hi Andrew,

> The lazy MMU mode can only be entered and left under the protection
> of the page table locks for all page tables which may be modified.

Heiko Carstens noticed that the above claim is not valid, since
v6.15-rc1 commit 691ee97e1a9d ("mm: fix lazy mmu docs and usage"),
which restates it to:

"In the general case, no lock is guaranteed to be held between entry and exit
of the lazy mode. So the implementation must assume preemption may be enabled"

That effectively invalidates this patch, so it needs to be dropped.

Patch 2 still could be fine, except -stable and Fixes tags and it does
not need to aim 6.15-rcX. Do you want me to repost it?

Thanks!

