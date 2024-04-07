Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B7889B342
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 19:21:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f/hYVYj9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCJtD55qfz3vc9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 03:21:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f/hYVYj9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCJs95KGrz3vX2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 03:20:45 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 437GVQib018929;
	Sun, 7 Apr 2024 17:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=wCwzYTi3qQQ8obIcA94XO3Gk5IF757LbEu8pKM5p6e4=;
 b=f/hYVYj9UrKn0dcL64I4sd0BDUJso/AktFobSHs1ka36ocblThYThcWkXssWk74gC2Do
 3hRBuEXta1RHUsIVgiUA4YIFicbSg5I8NDy3+wpKT17i37a3OponLVPxJ4WVyruIqhLM
 sML/0e3KzSbTL+fQhRQ0hhmPcTOTt+sPHKkFG2FnZ4D11HOIC5KNNfZzEP6OU0138NXf
 8Xd304Wd4XSMg1cldcBQNs/+etwR0E6GzewWNqyALEV7TLH8fs0N5hoVZ+E65YiBSyWY
 rIpuvSjW6w2NVUPGW3Nt/p7IySj+g2jPahWlPdayV+Hbn26bsw/8/AjS3knZI6fb2Rk3 kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xbsac0jkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Apr 2024 17:20:02 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 437HK2eI024934;
	Sun, 7 Apr 2024 17:20:02 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xbsac0jkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Apr 2024 17:20:02 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 437G0Upn013760;
	Sun, 7 Apr 2024 17:20:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbgqt3t8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Apr 2024 17:20:00 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 437HJtn712058960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Apr 2024 17:19:57 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C59F20043;
	Sun,  7 Apr 2024 17:19:55 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F65020040;
	Sun,  7 Apr 2024 17:19:54 +0000 (GMT)
Received: from osiris (unknown [9.179.2.159])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun,  7 Apr 2024 17:19:54 +0000 (GMT)
Date: Sun, 7 Apr 2024 19:19:52 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 6/7] s390: mm: accelerate pagefault when badaccess
Message-ID: <20240407171952.5958-B-hca@linux.ibm.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
 <20240403083805.1818160-7-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403083805.1818160-7-wangkefeng.wang@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: b-EEOAEEwlQYwv7cl_y3sNF2TyvQW26w
X-Proofpoint-GUID: a_Cqxs0DB0iEGztJhKKGFrHC8k3JLA6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-07_10,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxlogscore=794
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404070138
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
Cc: Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, surenb@google.com, linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2024 at 04:38:04PM +0800, Kefeng Wang wrote:
> The vm_flags of vma already checked under per-VMA lock, if it is a
> bad access, directly handle error, no need to retry with mmap_lock
> again. Since the page faut is handled under per-VMA lock, count it
> as a vma lock event with VMA_LOCK_SUCCESS.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/s390/mm/fault.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> index c421dd44ffbe..162ca2576fd4 100644
> --- a/arch/s390/mm/fault.c
> +++ b/arch/s390/mm/fault.c
> @@ -325,7 +325,8 @@ static void do_exception(struct pt_regs *regs, int access)
>  		goto lock_mmap;
>  	if (!(vma->vm_flags & access)) {
>  		vma_end_read(vma);
> -		goto lock_mmap;
> +		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +		return handle_fault_error_nolock(regs, SEGV_ACCERR);

Reviewed-by: Heiko Carstens <hca@linux.ibm.com>
