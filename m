Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9AB3FEA19
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 09:35:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0Xlt0ZtDz2ymv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 17:35:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k4FaKyUH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k4FaKyUH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0Xl24k37z2xsj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 17:35:10 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1827Wj2R034706; Thu, 2 Sep 2021 03:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=U09cb4nfZo4pbpTcJxbWIBzk5iG8iee8vnxVdFTAA5o=;
 b=k4FaKyUHrdvBiMrMPiJm2K4TuCUXXcecfumO0mQS0BYEgRS8NV/TBUrtCawatRt2siEj
 61BQ324ZI+R6u2zoo8s8AQ/IQxQnff6MGICuyjYnHwmyrvpi16rUEFNaoELcSQl83ijt
 mS0CV18JyFnamQSCHbfTGt3cpSwfg/p0HOIJ/2mPyc5rCbam/BtM9nHt/yziwXxqAG4N
 wgSqeUnCKS6t4SwX2HACN9OHIZkMfxvjJYPpncihnV0FxLzMoiC4hahpA2n1aKfOIfYc
 Wd207q3mAAz1eTYLiFKa6GAocebcAGoNkCi6mR7VEUOlVM6m8XZGlNqHiRS2pxU9eVaS sw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3att9gr22j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 03:35:01 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1827QqBd024770;
 Thu, 2 Sep 2021 07:35:01 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 3atdxdd02h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 07:35:01 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1827YxU635455358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Sep 2021 07:34:59 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 339E16A04D;
 Thu,  2 Sep 2021 07:34:59 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB35F6A047;
 Thu,  2 Sep 2021 07:34:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.51.175])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Sep 2021 07:34:56 +0000 (GMT)
Subject: Re: [PATCH 0/2] powerpc/perf: Add instruction and data address
 registers to extended regs
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au,
 acme@kernel.org, jolsa@kernel.org
References: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <bd5a9388-483d-91ca-b371-ab92ae4c08bc@linux.ibm.com>
Date: Thu, 2 Sep 2021 13:04:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QV34mpE7L08Ujcg6DzZxZ73zum7xGS-Q
X-Proofpoint-ORIG-GUID: QV34mpE7L08Ujcg6DzZxZ73zum7xGS-Q
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-02_02:2021-09-01,
 2021-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011 adultscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109020049
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/20/21 8:15 PM, Athira Rajeev wrote:
> Patch set adds PMU registers namely Sampled Instruction Address Register
> (SIAR) and Sampled Data Address Register (SDAR) as part of extended regs
> in PowerPC. These registers provides the instruction/data address and
> adding these to extended regs helps in debug purposes.
> 
> Patch 1/2 adds SIAR and SDAR as part of the extended regs mask.
> Patch 2/2 includes perf tools side changes to add the SPRs to
> sample_reg_mask to use with -I? option.
> 
> Athira Rajeev (2):
>   powerpc/perf: Expose instruction and data address registers as part of
>     extended regs
>   tools/perf: Add perf tools support to expose instruction and data
>     address registers as part of extended regs
> 

Patchset looks good to me.

Reviewed-By: kajol Jain<kjain@linux.ibm.com>

Thanks,
Kajol Jain

>  arch/powerpc/include/uapi/asm/perf_regs.h       | 12 +++++++-----
>  arch/powerpc/perf/perf_regs.c                   |  4 ++++
>  tools/arch/powerpc/include/uapi/asm/perf_regs.h | 12 +++++++-----
>  tools/perf/arch/powerpc/include/perf_regs.h     |  2 ++
>  tools/perf/arch/powerpc/util/perf_regs.c        |  2 ++
>  5 files changed, 22 insertions(+), 10 deletions(-)
> 
