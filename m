Return-Path: <linuxppc-dev+bounces-16554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBMmNmUagmmZPAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 16:55:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8266DB90B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 16:55:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f57Nf2t07z30T8;
	Wed, 04 Feb 2026 02:55:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770134114;
	cv=none; b=ohjhw7e6nVn5iBKr18/FuT2jzoKJLJV2pGQir2lSQp8wjMdQhZjmPv38clIhJ9D1VVDufWN1uOu15vyo7nJ4iXD59Am06QjftpDKDgc5vt3YhMx00dGUZyc6B2KDVF8B2EVAfPrAC3nMNxA1qm5gtHSSnENR0DmDzeRNPAmcT3oUXIoMm8pdabGD+62wSuAKSJWomkcBt+wFT0HWSLlo2oo3btZ/0HCk6V+zLk4JGUD5xJd/vVY/VBHkS/i5Z6VJQvzAHszJnmpAH4Wgm5SkrLQD+7xFEHaowjesvzG8WX7wkIEfdbRuACHds2tSWIRj0ZsUCsumwxRG3OrjuGV5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770134114; c=relaxed/relaxed;
	bh=UPKj+rvhExh7TG8IOzbJLnzxbJjh9vFZ+hHiez4evrc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZwiDndi39epKOMUCyLlWUnImg1B8ppDUlLlxyjKvOkC0goWyRReZKhgpK2LxzytkZqSWQ7n9hApy6y88f06qQCQKXZPpxUcQwVzn1RrN73/YUX/R++SnILNXHfutQ8W9Df8+pYedUzg9+M8aL6bfEoNreZ55wlyRf/ZeTODM/jTkiG8Nmlam0FbuT4d29lDOUgJ8cYQly0WeQTxmbGfdIbKOtkVLd/FzLRQ9VMPctHGI+cl5pezHZdbRERKZjGCzC70kH1qREs9NkwBO2OyIkEGtC2wlxA+eRKi0unyrt69eINJYshS1dTONdDgoWG2yVZRO08kmtTuwlBbbmAramw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ciM+hoi5; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ciM+hoi5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f57Nd3bkmz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 02:55:13 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 613Dnorc007618;
	Tue, 3 Feb 2026 15:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UPKj+r
	vhExh7TG8IOzbJLnzxbJjh9vFZ+hHiez4evrc=; b=ciM+hoi5aKDtHH0WfyFpWh
	gqegmf5s3Gk9ZYtB/7tJO5+9ooYlOGmJw16WW/TdVGJgTLtdUljRgbdQcvuVG8dB
	lhD75Yw0osqiYJoBa+knw/hFONaRhTIIRyUaapRvEb9VtXrKWYpwZaBi73i9F6KH
	YgW2BJdygWztpoVc5CbWICtUjaVCaaABC+4fkbdWBjG0n5WORk+NC3ksQ9BixVfq
	thAb7ptmr5DqZvWcp3T1ktK8u2CkQfw9upjGpZ7m1sJklQLXevv1wlqdrjdkrgV+
	vU/JY99yuE+l632Q56sgvmVSvBv531HGGHtoUIMpV+CEfdZffhc3grPP+CWt6wNg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c185guwp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 15:54:47 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 613Fskjv024313;
	Tue, 3 Feb 2026 15:54:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c185guwp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 15:54:46 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 613CFfhY027353;
	Tue, 3 Feb 2026 15:54:46 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c1xs19eu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 15:54:45 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 613FsfOE57409922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Feb 2026 15:54:41 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF93120043;
	Tue,  3 Feb 2026 15:54:41 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C495820040;
	Tue,  3 Feb 2026 15:54:36 +0000 (GMT)
Received: from [9.39.23.245] (unknown [9.39.23.245])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Feb 2026 15:54:36 +0000 (GMT)
Message-ID: <c6f64344-f211-460d-ae4f-bffdbd96182a@linux.ibm.com>
Date: Tue, 3 Feb 2026 21:24:34 +0530
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
User-Agent: Mozilla Thunderbird
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [RFC PATCH] powerpc: iommu: Initial IOMMUFD support for PPC64
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, iommu@lists.linux.dev
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, npiggin@gmail.com,
        alex@shazbot.org, joerg.roedel@amd.com, kevin.tian@intel.com,
        gbatra@linux.ibm.com, jgg@nvidia.com, clg@kaod.org,
        vaibhav@linux.ibm.com, brking@linux.vnet.ibm.com,
        nnmlinux@linux.ibm.com, amachhiw@linux.ibm.com,
        tpearson@raptorengineering.com
References: <176953894915.725.1102545144304639827.stgit@linux.ibm.com>
 <974a95d4-0ae5-400a-992f-9e468a0666d6@kernel.org>
Content-Language: en-US
In-Reply-To: <974a95d4-0ae5-400a-992f-9e468a0666d6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=UdxciaSN c=1 sm=1 tr=0 ts=69821a47 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kvopkG0x9FeW82KiyRIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: KffHkNlso51bdV13BLHUktqqSON0pByT
X-Proofpoint-ORIG-GUID: OTNI4sMCcOLftxtQDAWr9KBeej-K7Llj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEyNyBTYWx0ZWRfX5qf8s6YLxGlp
 Ufkrq4siEHNQQaqO01YTsdKQ9CQBwxFSkWrCGGh3jNWYhLEcNsXwasq6ko10UqX3PIwJuB0Lmq6
 NVYML7z3W1+3RAyxKngHUxQDznlFTh4LfnU28n0PtM43lSHYXXMr5QITiYnRc4Ih8RRt/zUHTAg
 1vXSF5FMsv/A+JiHS+riwD59mfRXERUAjbwKU/wZQy4uI32i3Qsaa60FfaVPQyB1QDwAPGjaUVA
 rjN3S8KHlXBMCvWHUEsmliL0U0Gyk+pMi2aqROH+Guf23vD15ZuL5l2/IerNfpooKojN+/slC9X
 dgHqzsW6wqPxkR1sci3tRIHRTjAUw9hLULAeo27BplEElANGGxg1S8v49lTVr4bV2i4ytuFgRUe
 o0jQWLlDrLQWCKjA6VShaqGeagJsJfIwhU1W3yhoxFTkcyxKtUJ2Q6t7/YatQborB+wZMLytEnz
 6X1DVb5BV2jmS+tJuwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2602030127
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16554-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:iommu@lists.linux.dev,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:alex@shazbot.org,m:joerg.roedel@amd.com,m:kevin.tian@intel.com,m:gbatra@linux.ibm.com,m:jgg@nvidia.com,m:clg@kaod.org,m:vaibhav@linux.ibm.com,m:brking@linux.vnet.ibm.com,m:nnmlinux@linux.ibm.com,m:amachhiw@linux.ibm.com,m:tpearson@raptorengineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sbhat@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[ellerman.id.au,linux.ibm.com,gmail.com,shazbot.org,amd.com,intel.com,nvidia.com,kaod.org,linux.vnet.ibm.com,raptorengineering.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sbhat@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E8266DB90B
X-Rspamd-Action: no action

Hi Christophe.


Thanks for trying the patch.


On 1/28/26 4:23 PM, Christophe Leroy (CS GROUP) wrote:
>
>
> Le 27/01/2026 à 19:35, Shivaprasad G Bhat a écrit :
>> The RFC attempts to implement the IOMMUFD support on PPC64 by
>> adding new iommu_ops for paging domain. The existing platform
>> domain continues to be the default domain for in-kernel use.
>> The domain ownership transfer ensures the reset of iommu states
>> for the new paging domain and in-kernel usage.


<snip/>

>> ...
>> root:localhost# mount /dev/nvme0n1 /mnt
>> root:localhost# ls /mnt
>> ...
>>
>> The current patch is based on linux kernel 6.19-rc6 tree.
>
> Getting the following build failure on linuxppc-dev patchwork with 
> g5_defconfig or ppc64_defconfig:
>
> Error: /linux/arch/powerpc/sysdev/dart_iommu.c:325:9: error: 
> initialization of 'int (*)(struct iommu_table *, long int,  long int, 
> long unsigned int,  enum dma_data_direction,  long unsigned int,  
> bool)' {aka 'int (*)(struct iommu_table *, long int,  long int,  long 
> unsigned int,  enum dma_data_direction,  long unsigned int,  _Bool)'} 
> from incompatible pointer type 'int (*)(struct iommu_table *, long 
> int,  long int,  long unsigned int,  enum dma_data_direction,  long 
> unsigned int)' [-Werror=incompatible-pointer-types]
>   .set = dart_build,
>          ^~~~~~~~~~
> /linux/arch/powerpc/sysdev/dart_iommu.c:325:9: note: (near 
> initialization for 'iommu_dart_ops.set')
> cc1: all warnings being treated as errors
> make[5]: *** [/linux/scripts/Makefile.build:287: 
> arch/powerpc/sysdev/dart_iommu.o] Error 1
> make[4]: *** [/linux/scripts/Makefile.build:544: arch/powerpc/sysdev] 
> Error 2


I was trying only pseries and powernv configs. I see the changes would break

pasemi and dart iommus.


The below diff should get it going,

===========================

diff --git a/arch/powerpc/platforms/pasemi/iommu.c 
b/arch/powerpc/platforms/pasemi/iommu.c
index 375487cba874..75b526a560b8 100644
--- a/arch/powerpc/platforms/pasemi/iommu.c
+++ b/arch/powerpc/platforms/pasemi/iommu.c
@@ -77,7 +77,7 @@ static int iommu_table_iobmap_inited;
  static int iobmap_build(struct iommu_table *tbl, long index,
                          long npages, unsigned long uaddr,
                          enum dma_data_direction direction,
-                        unsigned long attrs)
+                        unsigned long attrs, bool is_phys)
  {
         u32 *ip;
         u32 rpn;
diff --git a/arch/powerpc/sysdev/dart_iommu.c 
b/arch/powerpc/sysdev/dart_iommu.c
index c0d10c149661..b424a602d07a 100644
--- a/arch/powerpc/sysdev/dart_iommu.c
+++ b/arch/powerpc/sysdev/dart_iommu.c
@@ -171,7 +171,7 @@ static void dart_flush(struct iommu_table *tbl)
  static int dart_build(struct iommu_table *tbl, long index,
                        long npages, unsigned long uaddr,
                        enum dma_data_direction direction,
-                      unsigned long attrs)
+                      unsigned long attrs, bool is_phys)
  {
         unsigned int *dp, *orig_dp;
         unsigned int rpn;

===========================


I will take care of it in next version.


Thank you!


Regards,

Shivaprasad

>
> Christophe
>
>
<snip/>

