Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 599794A5AED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 12:11:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp2Lt0nLwz3bbS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 22:11:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ao9rhfEi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp2L420Q6z2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 22:11:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ao9rhfEi; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Jp2L40NFhz4xhm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 22:11:08 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4Jp2L405CTz4xcY; Tue,  1 Feb 2022 22:11:08 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ao9rhfEi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Jp2L34krdz4xcT;
 Tue,  1 Feb 2022 22:11:06 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2119L9Gx026638; 
 Tue, 1 Feb 2022 11:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=bxXb6wVRl/ph3v9666aDtfiVqLqD8/I7UfxKmQT4Cx8=;
 b=Ao9rhfEiXmSaR6yeWYrrtrsFuspJclhtr0/5XgEClvdZrDKQyv2PYqEzPBNHiigTi6D4
 kw2YFbTiwg+jY9fpVd9AONwLeHTimuGgX2HePku1p92CZJiBo8veu7hGbrNyfbulhkgd
 /Haz1oN2E+NK0ANb6QzFW3LGthDKfNtgr1D2bl3mqhNHr54DwS0fp1NhTRAUdCwBEuyC
 dNToOV7mJ3N1LiJXtu3xnYtXfJs1JmDkrt1up7v0EMm/yZsJKko6youCNOYzOra2ncPc
 ltKp7hFAzDIKa/1mFDykcvQkLG0/6Yn+NMBl0Op0D2QVVwLAFmN5eUCVW/eb2c1iaYnH Ug== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxw1q7bua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 11:11:04 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 211B2qXG017364;
 Tue, 1 Feb 2022 11:11:02 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3dvw792eaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 11:11:01 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 211BAxJo30278092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Feb 2022 11:10:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8742652050;
 Tue,  1 Feb 2022 11:10:59 +0000 (GMT)
Received: from [9.211.70.16] (unknown [9.211.70.16])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BFAAD5204E;
 Tue,  1 Feb 2022 11:10:56 +0000 (GMT)
Message-ID: <d523c2d6-2a12-77aa-75a9-942cff5574bd@linux.ibm.com>
Date: Tue, 1 Feb 2022 16:40:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: powerpc: Set crashkernel offset to mid of RMA region
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220128100445.251233-1-sourabhjain@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20220128100445.251233-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mrnyYuvmMdeOz4UZgeDzu0hq3EqpBH1D
X-Proofpoint-ORIG-GUID: mrnyYuvmMdeOz4UZgeDzu0hq3EqpBH1D
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_03,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010062
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
Cc: mahesh@linux.vnet.ibm.com, Abdul haleem <abdhalee@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 28/01/22 3:34 pm, Sourabh Jain wrote:
> On large config LPARs (having 192 and more cores), Linux fails to boot
> due to insufficient memory in the first memblock. It is due to the
> memory reservation for the crash kernel which starts at 128MB offset of
> the first memblock. This memory reservation for the crash kernel doesn't
> leave enough space in the first memblock to accommodate other essential
> system resources.
> 
> The crash kernel start address was set to 128MB offset by default to
> ensure that the crash kernel get some memory below the RMA region which
> is used to be of size 256MB. But given that the RMA region size can be
> 512MB or more, setting the crash kernel offset to mid of RMA size will
> leave enough space for kernel to allocate memory for other system
> resources.
> 
> Since the above crash kernel offset change is only applicable to the LPAR
> platform, the LPAR feature detection is pushed before the crash kernel
> reservation. The rest of LPAR specific initialization will still
> be done during pseries_probe_fw_features as usual.
> 
> Signed-off-by: Sourabh Jain<sourabhjain@linux.ibm.com>
> Reported-and-tested-by: Abdul haleem<abdhalee@linux.vnet.ibm.com>
> 
> ---
>   arch/powerpc/kernel/rtas.c |  4 ++++
>   arch/powerpc/kexec/core.c  | 15 +++++++++++----
>   2 files changed, 15 insertions(+), 4 deletions(-)
> 
>   ---
>   Change in v3:
> 	Dropped 1st and 2nd patch from v2. 1st and 2nd patch from v2 patch
> 	series [1] try to discover 1T segment MMU feature support
> 	BEFORE boot CPU paca allocation ([1] describes why it is needed).
> 	MPE has posted a patch [2] that archives a similar objective by moving
> 	boot CPU paca allocation after mmu_early_init_devtree().
> 

> NOTE: This patch is dependent on the patch [2].
> 
> [1]https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20211018084434.217772-3-sourabhjain@linux.ibm.com/
> [2]https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/239175.html

This dependency info must be captured somewhere within the changelog to
be useful.
