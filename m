Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F138E8AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 16:24:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpfcR5xfvz3bss
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 00:24:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GRkEB4xL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GRkEB4xL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpfby2Ly1z2yQy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 00:24:29 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OE3OYH134623; Mon, 24 May 2021 10:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=pxIaAJ92mI5tFdFim0kxWU+IPTOkELCdDbjv3/nxmg4=;
 b=GRkEB4xLNhjbhOdT1tLqqERerN85FwNnZigVm+hu271kQQVSwMyIuscV5pdXtIy7sLNC
 AQ/rJTfh0pjkV3WYTbAO4d/lUCTcpHBgxYEIVdkfMsK6DMovk9WCsZieJj5eUGN5XA4g
 sfYvEUD62WuHBXikUCXm6hSN5IhS2SjZlh0QTmFd1HXAhGEYGBIXQBI1kHl16Gar2q5U
 5Fqvmzcu/K3uQdKib4+WqVV9VSG8ZBSw0QKtpaPjupK58H3Jz/wrVDC7xDveHOfIZTn5
 eyRnPMrV3rZ8J6ZwpDLH8nK3KGDrR8O2SPirVwC1rLOq2lgQ2yEUVMtH7DFmrBPfl3vT uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38rd9k956j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 10:24:15 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14OE3bJ2135855;
 Mon, 24 May 2021 10:24:15 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38rd9k9569-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 10:24:15 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14OEN3Ia018629;
 Mon, 24 May 2021 14:24:14 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 38psk8ud0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 14:24:14 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14OEODQ416253314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 14:24:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB169112066;
 Mon, 24 May 2021 14:24:13 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDF05112064;
 Mon, 24 May 2021 14:24:10 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.1.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 May 2021 14:24:10 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
In-Reply-To: <CAHk-=whUHnm1CQ3LC0Qz=BBkhBRZkNW6ZmQZvSac2vju7gfeVg@mail.gmail.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
 <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
 <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
 <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
 <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
 <CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com>
 <5ea8fa4f-a5a2-7dc4-7958-23df6a2c1f3a@linux.ibm.com>
 <874kewme7a.fsf@linux.ibm.com>
 <CAHk-=whUHnm1CQ3LC0Qz=BBkhBRZkNW6ZmQZvSac2vju7gfeVg@mail.gmail.com>
Date: Mon, 24 May 2021 19:54:08 +0530
Message-ID: <87tumsqkfr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZwDxmbshmJiKJzduz-Vp-UWowKa_xPbc
X-Proofpoint-ORIG-GUID: 1M4bzR3I_tB0C0NzJiVA5C8I5j4CGsjp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_07:2021-05-24,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240086
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Fri, May 21, 2021 at 3:04 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> We could do MOVE_PMD with something like below? A equivalent MOVE_PUD
>> will be costlier which makes me wonder whether we should even support that?
>
> Well, without USE_SPLIT_PTE_PTLOCKS the pud case would be trivial too.
> But everybody uses split pte locks in practice.
>
> I get the feeling that the rmap code might have to use
> pud_lock/pmd_lock. I wonder how painful that would be.
>

Looking at this further, i guess we need to do the above to close the
race window. We do

static bool map_pte(struct page_vma_mapped_walk *pvmw)
{
	pvmw->pte = pte_offset_map(pvmw->pmd, pvmw->address);
        ..
	pvmw->ptl = pte_lockptr(pvmw->vma->vm_mm, pvmw->pmd);
	spin_lock(pvmw->ptl);
}

That is we walk the table without holding the pte ptl. Hence we still
can race with the optimized PMD move.

-aneesh


