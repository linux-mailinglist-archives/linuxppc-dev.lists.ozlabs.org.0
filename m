Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF4479FBC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 08:18:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=for+NWO3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmRwZ3ryDz3cNc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 16:18:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=for+NWO3;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmRvf18wBz2xm4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 16:18:06 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RmRvX492mz4x5k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 16:18:00 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RmRvX4612z4x5j; Thu, 14 Sep 2023 16:18:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=for+NWO3;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RmRvW59mHz4x5M;
	Thu, 14 Sep 2023 16:17:59 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38E66Rx2012683;
	Thu, 14 Sep 2023 06:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=xJokABaoHSwJ3QgSTW0xuicbaIXnW/Po7/rpx0AJCFI=;
 b=for+NWO3cqpgmZBvkSNUHHPjO2vrjeRCSlh3ZA1LArDtSquP3zmjIU4aMdYHEcVAxQYk
 ZIxBSELBT+Ykh+Pwr19Q18mUjLNRYbhEbtxeKGSdLLsgrGDYvDqAwZMeyEi0tjnlEqu2
 T/v22WzfGAq5fE6TAkrE951quL993KoTzqtVuLlUCLVhIQ/2fXTS1L/knY1expuehYNc
 ZYDFY3w8DQfm+nPF1pZZoCkP+o7NhlVJ57d55IU8TSzP6imZjqKPFRKiidvDFyA3IF18
 mC7jH94fZA5+0XVM331xqdlWVW01ocuU9Y0YJVtp7HgG9ozf52oCrm/S9+EIFU1IF7Qs /A== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t3v13h7g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 06:17:55 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38E4cMk4012070;
	Thu, 14 Sep 2023 06:17:53 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t13e010x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 06:17:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38E6Hotj20382378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Sep 2023 06:17:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDE3120040;
	Thu, 14 Sep 2023 06:17:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 616C32004B;
	Thu, 14 Sep 2023 06:17:49 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.109.199.72])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 14 Sep 2023 06:17:49 +0000 (GMT)
Date: Thu, 14 Sep 2023 11:47:43 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
Message-ID: <fv4aygzoznqd5d73awyb6bpngoooodwsecf4mxh5h7ielkeuhz@piqlnousaqgw>
References: <20230911091409.415662-1-adityag@linux.ibm.com>
 <A4BD07EC-C0B1-4957-9201-35C15706F40B@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A4BD07EC-C0B1-4957-9201-35C15706F40B@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2elwYEdQoiKsAqPv9WrrE1B9LEvDcnI9
X-Proofpoint-GUID: 2elwYEdQoiKsAqPv9WrrE1B9LEvDcnI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_03,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 mlxlogscore=661 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309140053
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Sachin,

On Wed, Sep 13, 2023 at 06:19:11PM +0530, Sachin Sant wrote:
> 
> 
> > On 11-Sep-2023, at 2:44 PM, Aditya Gupta <adityag@linux.ibm.com> wrote:
> > 
> > Presently, while reading a vmcore, makedumpfile uses
> > `cur_cpu_spec.mmu_features` to decide whether the crashed system had
> > RADIX MMU or not.
> > 
> > Currently, makedumpfile fails to get the `cur_cpu_spec` symbol (unless
> > a vmlinux is passed with the `-x` flag to makedumpfile), and hence
> > assigns offsets and shifts (such as pgd_offset_l4) incorrecly considering
> > MMU to be hash MMU.
> > 
> > Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
> > `cpu_spec` struct, to VMCOREINFO, so that the symbol address and offset
> > is accessible to makedumpfile, without needing the vmlinux file
> > 
> > Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> > ---
> 
> Thanks for the patch. With this patch applied (along with makedumpfile changes)
> I am able to capture vmcore against a kernel which contains commit 8dc9a0ad0c3e
> 
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>

Thanks for testing this, and for providing the tags.

- Aditya Gupta
