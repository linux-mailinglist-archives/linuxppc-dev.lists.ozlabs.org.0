Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892E252EF62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 17:40:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4WBb1pQWz3bnV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 01:40:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sjxR3rDM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=murphyp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sjxR3rDM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4TSJ10zYz2ywq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 00:21:51 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KDhA5o013184;
 Fri, 20 May 2022 14:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Qws2YtHa78+QvmlnEv1VS5IgCRCRWAkckflJQQNfAE8=;
 b=sjxR3rDMTVXck5i5/lQez9J8/U2GyWZWgILBUKOZMA2CyefhIfpLTBKNSZ9jYyi9gjIQ
 idJ1xddtMN+T7jReeQctWqOIcSSSbz1/BbPJrcUSyGcmUcrwK0Sl4eXNy8hJtO8aPGnD
 New7v4WTGtYOAEIRJh3irmDEs4zvKFyodVPn0IRQJS9fXkDz4WtaGMl0kHJ1J7SmCkTr
 btkAAy45sTbrAqrIUvmqcuoiSNP4YLFVFd31vahs0uaQFI0oy8LTtbawYfQylDoNa+GI
 WamwdwxtF4Ttmkgg9ecf8B7FPaObrWA0aLzNyA3ZPvfv/oElA6vaYO010YSfQZUaoi6G EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6c4610wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 14:21:46 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24KEEHI0017508;
 Fri, 20 May 2022 14:21:46 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6c4610w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 14:21:46 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24KECXMY015836;
 Fri, 20 May 2022 14:21:45 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 3g242b5y5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 14:21:45 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24KELiPN43057546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 14:21:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6289DBE051;
 Fri, 20 May 2022 14:21:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC9C0BE054;
 Fri, 20 May 2022 14:21:43 +0000 (GMT)
Received: from [9.160.114.248] (unknown [9.160.114.248])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 14:21:43 +0000 (GMT)
Message-ID: <c1f6c6c9-4cc7-0dcb-360d-9ae0df6378b4@linux.ibm.com>
Date: Fri, 20 May 2022 09:21:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC Linux patch] powerpc: add documentation for HWCAPs
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220520051528.98097-1-npiggin@gmail.com>
From: Paul E Murphy <murphyp@linux.ibm.com>
In-Reply-To: <20220520051528.98097-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kOwVJcbc88NNOjcANKrH_TbcwNq-Ao5b
X-Proofpoint-ORIG-GUID: 0cgjAOI_ElatKJtsghoIXB0l8tWwyZot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200099
X-Mailman-Approved-At: Sat, 21 May 2022 01:39:32 +1000
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/20/22 12:15 AM, Nicholas Piggin via Gcc wrote:
> This takes the arm64 file and adjusts it for powerpc. Feature
> descriptions are vaguely handwaved by me.
> ---
> 
> Anybody care to expand on or correct the meaning of these entries or
> bikeshed the wording of the intro? Many of them are no longer used
> anywhere by upstream kernels and even where they are it's not always
> quite clear what the exact intent was, a lot of them are old history
> and I don't know what or where they are used.
> 
> I may try to get these descriptions pushed into the ABI doc after a
> time, but for now they can live in the kernel tree.
> 
> Thanks,
> Nick

Thanks, this is really helpful.  I've been caught off-guard by some of 
the subtleties in the meanings of these bits at times.  I think it would 
be helpful to share what is implied by the usage of the word "facility" 
below.  It would resolve some of my questions below.



> +PPC_FEATURE_HAS_ALTIVEC
> +    Vector (aka Altivec, VSX) facility is available.

I think "(aka Altivec, VSX)" might be more accurately stated as "(aka 
Altivec)"?


> +PPC_FEATURE_HAS_DFP
> +    DFP facility is available.

Maybe something like "Decimal floating point instructions are available 
to userspace.  Individual instruction availability is dependent on the
reported architecture version."?


> +PPC_FEATURE_HAS_VSX
> +    VSX facility is available.
A small reminder the features are also dependent on architecture version 
too might be helpful here too.


> +PPC_FEATURE2_TAR
> +    VSX facility is available.

Was manipulating the tar spr was once a privileged instruction, is this 
a hint userspace can use the related instructions?


> +
> +PPC_FEATURE2_HAS_IEEE128
> +    IEEE 128 is available? What instructions/data?

Maybe something like "IEEE 128 binary floating point instructions are 
supported.  Individual instruction availability is dependent on the
reported architecture version."?


> +PPC_FEATURE2_SCV
> +    scv instruction is available.

I think it might be clearer to say "This kernel supports syscalls using 
the scv instruction".


> +PPC_FEATURE2_MMA
> +    MMA facility is available.

Maybe another note that specific instruction availability may depend on 
the reported architecture version?
