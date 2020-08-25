Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F332516A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 12:26:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbQCN6pcCzDqTk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 20:26:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FLMfaI34; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbQ0H1CVlzDqBx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 20:17:12 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07PA4pWp154169; Tue, 25 Aug 2020 06:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EOBUoNumc+lfxeSxOyM8nxTJchcZ8SasJG/UKpKCePc=;
 b=FLMfaI34xTiJCIrm5uFNqbuk0uT2DGykGFonCKV9ValbKJI3Gb8aJ1pjUCvH1rBMViHH
 a+46qMxkOoSEKYil9BF1E0fCNjqHrqN02uE3u63nGbSY/ajxgIwKwmxxu46FESXlA2nM
 CSrGWVcVfhlmX34vqVger2iojhSeXB+dFv+4FsmjCV6iJGBcX6jS2sIknOsTSUArI8jv
 pWnbWazaY41s/AVuWDg2oC/WN57VTsUafbWj+P2oGiWZap4gTf8wGpUUY7J7pjuNx8tf
 G6kTrWxeMCgWUXkLDaUJi/CEnjLBtbu0oz+Lo59EIPqzoCxSQsIPS9X7KAhGXPUvR8Iv 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334yc52e4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 06:16:35 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07PA7kP9161517;
 Tue, 25 Aug 2020 06:16:34 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334yc52e43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 06:16:34 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07PAFFq5019135;
 Tue, 25 Aug 2020 10:16:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 33498u97t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 10:16:32 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07PAGT9N24445372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 10:16:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B3F1A4054;
 Tue, 25 Aug 2020 10:16:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6052A4062;
 Tue, 25 Aug 2020 10:16:27 +0000 (GMT)
Received: from oc5500677777.ibm.com (unknown [9.145.83.242])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Aug 2020 10:16:27 +0000 (GMT)
Subject: Re: [RFT][PATCH 0/7] Avoid overflow at boundary_size
To: Nicolin Chen <nicoleotsuka@gmail.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, rth@twiddle.net,
 ink@jurassic.park.msu.ru, mattst88@gmail.com, tony.luck@intel.com,
 fenghua.yu@intel.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@de.ibm.com, davem@davemloft.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, James.Bottomley@HansenPartnership.com, deller@gmx.de
References: <20200820231923.23678-1-nicoleotsuka@gmail.com>
From: Niklas Schnelle <schnelle@linux.ibm.com>
Message-ID: <4321af30-9554-6897-5281-05afd88f2631@linux.ibm.com>
Date: Tue, 25 Aug 2020 12:16:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820231923.23678-1-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_02:2020-08-24,
 2020-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=999 malwarescore=0 suspectscore=2 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250073
X-Mailman-Approved-At: Tue, 25 Aug 2020 20:23:43 +1000
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
Cc: sfr@canb.auug.org.au, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/21/20 1:19 AM, Nicolin Chen wrote:
> We are expending the default DMA segmentation boundary to its
> possible maximum value (ULONG_MAX) to indicate that a device
> doesn't specify a boundary limit. So all dma_get_seg_boundary
> callers should take a precaution with the return values since
> it would easily get overflowed.
> 
> I scanned the entire kernel tree for all the existing callers
> and found that most of callers may get overflowed in two ways:
> either "+ 1" or passing it to ALIGN() that does "+ mask".
> 
> According to kernel defines:
>     #define ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
>     #define ALIGN(x, a)	ALIGN_MASK(x, (typeof(x))(a) - 1)
> 
> We can simplify the logic here:
>   ALIGN(boundary + 1, 1 << shift) >> shift
> = ALIGN_MASK(b + 1, (1 << s) - 1) >> s
> = {[b + 1 + (1 << s) - 1] & ~[(1 << s) - 1]} >> s
> = [b + 1 + (1 << s) - 1] >> s
> = [b + (1 << s)] >> s
> = (b >> s) + 1
> 
> So this series of patches fix the potential overflow with this
> overflow-free shortcut.

Hi Nicolin,

haven't seen any other feedback from other maintainers,
so I guess you will resend this?
On first glance it seems to make sense.
I'm a little confused why it is only a "potential overflow"
while this part

"We are expending the default DMA segmentation boundary to its
 possible maximum value (ULONG_MAX) to indicate that a device
 doesn't specify a boundary limit"

sounds to me like ULONG_MAX is actually used, does that
mean there are currently no devices which do not specify a
boundary limit?


> 
> As I don't think that I have these platforms, marking RFT.
> 
> Thanks
> Nic
> 
> Nicolin Chen (7):
>   powerpc/iommu: Avoid overflow at boundary_size
>   alpha: Avoid overflow at boundary_size
>   ia64/sba_iommu: Avoid overflow at boundary_size
>   s390/pci_dma: Avoid overflow at boundary_size
>   sparc: Avoid overflow at boundary_size
>   x86/amd_gart: Avoid overflow at boundary_size
>   parisc: Avoid overflow at boundary_size
> 
>  arch/alpha/kernel/pci_iommu.c    | 10 ++++------
>  arch/ia64/hp/common/sba_iommu.c  |  4 ++--
>  arch/powerpc/kernel/iommu.c      | 11 +++++------
>  arch/s390/pci/pci_dma.c          |  4 ++--
>  arch/sparc/kernel/iommu-common.c |  9 +++------
>  arch/sparc/kernel/iommu.c        |  4 ++--
>  arch/sparc/kernel/pci_sun4v.c    |  4 ++--
>  arch/x86/kernel/amd_gart_64.c    |  4 ++--
>  drivers/parisc/ccio-dma.c        |  4 ++--
>  drivers/parisc/sba_iommu.c       |  4 ++--
>  10 files changed, 26 insertions(+), 32 deletions(-)
> 
