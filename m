Return-Path: <linuxppc-dev+bounces-1711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F217798BC15
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 14:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHy1l6DYnz2yK7;
	Tue,  1 Oct 2024 22:29:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727779449;
	cv=none; b=EepmM8YcYfSCmaxTLYJsLe2ehPTRa6NvNKUrNaadWo2KUh25TsBlLrGqeUOFfY+TWyIR6RdEila1JfjitWqEnxMz8SQPu6quPcred3NMWqX6BCLc+mY2cve9b5EJaL7iDooA16sLPgpAf8GHCJxaobKszJ3bJh6a31lm394ywV1uYjivSNc77rcEvVXb8meUG4GRfKPtddBd3EDFfu8M34cxOUzcRU25QFPB6knCdEKNZ9PQ62BVaOo6dUFXq4b8Q4dIsQDtCt3thhyJuLhWfJcWp744I8c6qzdjtk5Hr4TMvLwKEP0ANPNhj0Mv4ILn2WVPjijVEN9Gp7DZI0kz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727779449; c=relaxed/relaxed;
	bh=EbBiI8fSH5VnllJ71ly5Ye4ZTPDlUiVslkZDSkOv6TM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YR+67VrjSYCkvaR5N07ixw09MfyJBPrdKQKQ7K1ZULrX1HviQBzBJbYz+yI6bnGbWVjdN6x2GbIWPD8HcVyemtN/Phq9C+VpBKvr5cuLiGgOV1A4YF5vvX80WXdnu3lX7CnkSgKc3Xb5G+4E5ow5u5p1yuucaB9XKfnsdIQ7V7yw7o5G1n7DxnyHn3Anw89GOL7+bTSuuAnJYiWDcdERR3Z6VLbvcbNqDyf8C2UcV36hmYUTX8B2LjaRMRhDWNuvO4lHOexX05wrsja93N0+gLjPzgF3HCFCod9G3bt4ERcsN0ABZCmIix/9lNHAOZSN1vxuc4dxdZ06ufoV08V4hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pBxk9Pfm; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pBxk9Pfm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHvgs1XcZz2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 20:44:08 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4918rlWA024393;
	Tue, 1 Oct 2024 10:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	EbBiI8fSH5VnllJ71ly5Ye4ZTPDlUiVslkZDSkOv6TM=; b=pBxk9Pfm6EsDfF8Q
	iqUeM1FnmtgX53pJ0O39C77AAcD1MIdHs8EzC5/ri4wCzexHaBfbeu3XYa1MNuhr
	eJrsmHuxPqK6cm0vGct98JM4U0+BUpFDBIcM75UI2ScI5N02e5xkS/ZCRMd7H282
	0Azl1ZgHYpCgJ3MZcAcj0rOj98AnwTvyYi5mze3SorxyYhOkaYp2FtXLOXNJcI52
	vEg06YOiEqDQ16vL/o7a57SNphNSGtYUIFyzUt0oHvIjsnMTnIidLPO3Lj1/hyEz
	LsPSeSPcRqZNO/wijZXbh9gF2+zp3bNZDbNFs7t3r9v9lstbldRgfcOJYDlRXbAa
	2FQ1xA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 420ckngyg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 10:43:19 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 491Adrbv020483;
	Tue, 1 Oct 2024 10:43:18 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 420ckngyfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 10:43:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 491AViee002356;
	Tue, 1 Oct 2024 10:43:17 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41xxu13f3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 10:43:17 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 491AhD4A18284834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2024 10:43:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B84420049;
	Tue,  1 Oct 2024 10:43:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8521C20040;
	Tue,  1 Oct 2024 10:43:11 +0000 (GMT)
Received: from thinkpad-T15 (unknown [9.171.59.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue,  1 Oct 2024 10:43:11 +0000 (GMT)
Date: Tue, 1 Oct 2024 12:43:09 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>,
        <vishal.l.verma@intel.com>, <dave.jiang@intel.com>,
        <logang@deltatee.com>, <bhelgaas@google.com>, <jack@suse.cz>,
        <jgg@ziepe.ca>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <mpe@ellerman.id.au>, <npiggin@gmail.com>,
        <dave.hansen@linux.intel.com>, <ira.weiny@intel.com>,
        <willy@infradead.org>, <djwong@kernel.org>, <tytso@mit.edu>,
        <linmiaohe@huawei.com>, <david@redhat.com>, <peterx@redhat.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linuxppc-dev@lists.ozlabs.org>, <nvdimm@lists.linux.dev>,
        <linux-cxl@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
        <linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
        <jhubbard@nvidia.com>, <hch@lst.de>, <david@fromorbit.com>,
        <hca@linux.ibm.com>, <gor@linux.ibm.com>, <agordeev@linux.ibm.com>,
        <borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
        <linux-s390@vger.kernel.org>
Subject: Re: [PATCH 05/12] mm/memory: Add dax_insert_pfn
Message-ID: <20241001124309.782004b8@thinkpad-T15>
In-Reply-To: <66ef75e59c7ea_109b5294d1@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
	<110d5b177d793ab17ea5d1210606cb7dd0f82493.1725941415.git-series.apopple@nvidia.com>
	<66ef75e59c7ea_109b5294d1@dwillia2-mobl3.amr.corp.intel.com.notmuch>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mLp8W3ZTWJaathMCFPKloMnlrxlln_bF
X-Proofpoint-ORIG-GUID: 5FfpjjtfUKsGqxfrBWkGoY0YounV3Quc
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_07,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=928
 mlxscore=0 priorityscore=1501 clxscore=1011 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010066
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 22 Sep 2024 03:41:57 +0200
Dan Williams <dan.j.williams@intel.com> wrote:

> [ add s390 folks to comment on CONFIG_FS_DAX_LIMITED ]

[...]

> > @@ -2516,6 +2545,44 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
> >  	return VM_FAULT_NOPAGE;
> >  }
> >  
> > +vm_fault_t dax_insert_pfn(struct vm_fault *vmf, pfn_t pfn_t, bool write)
> > +{
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	pgprot_t pgprot = vma->vm_page_prot;
> > +	unsigned long pfn = pfn_t_to_pfn(pfn_t);
> > +	struct page *page = pfn_to_page(pfn);  
> 
> The problem here is that we stubbornly have __dcssblk_direct_access() to
> worry about. That is the only dax driver that does not return
> pfn_valid() pfns.
> 
> In fact, it looks like __dcssblk_direct_access() is the only thing
> standing in the way of the removal of pfn_t.
> 
> It turns out it has been 3 years since the last time the question of
> bringing s390 fully into the ZONE_DEVICE regime was raised:
> 
> https://lore.kernel.org/all/20210820210318.187742e8@thinkpad/
> 
> Given that this series removes PTE_DEVMAP which was a stumbling block,
> would it be feasible to remove CONFIG_FS_DAX_LIMITED for a few kernel
> cycles until someone from the s390 side can circle back to add full
> ZONE_DEVICE support?

Yes, see also my reply to your "dcssblk: Mark DAX broken" patch.
Thanks Alistair for your effort, making ZONE_DEVICE usable w/o extra
PTE bit!

