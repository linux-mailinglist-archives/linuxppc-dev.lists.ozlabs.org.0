Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D1D22E639
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:07:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFW8B4ZSqzDsMK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:07:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFW4X64D8zDrBB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:03:56 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R71no8002613; Mon, 27 Jul 2020 03:03:48 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32hrct2wem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 03:03:47 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R719qw004264;
 Mon, 27 Jul 2020 07:03:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 32gcpw95k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 07:03:46 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R73h5b41550052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 07:03:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 437D95204E;
 Mon, 27 Jul 2020 07:03:43 +0000 (GMT)
Received: from [9.199.35.124] (unknown [9.199.35.124])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4434452057;
 Mon, 27 Jul 2020 07:03:41 +0000 (GMT)
Subject: Re: [PATCH V4 0/4] powerpc/perf: Add support for perf extended regs
 in powerpc
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1595774713-1482-1-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <ff9affcd-aea1-b77c-0d96-245bdb774adb@linux.ibm.com>
Date: Mon, 27 Jul 2020 12:33:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595774713-1482-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_04:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270046
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 maddy@linux.vnet.ibm.com, kjain@linux.ibm.com, acme@kernel.org,
 jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/26/20 8:15 PM, Athira Rajeev wrote:
> Patch set to add support for perf extended register capability in
> powerpc. The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to
> indicate the PMU which support extended registers. The generic code
> define the mask of extended registers as 0 for non supported architectures.
> 
> Patches 1 and 2 are the kernel side changes needed to include
> base support for extended regs in powerpc and in power10.
> Patches 3 and 4 are the perf tools side changes needed to support the
> extended registers.
> 
> patch 1/4 defines the PERF_PMU_CAP_EXTENDED_REGS mask to output the
> values of mmcr0,mmcr1,mmcr2 for POWER9. Defines `PERF_REG_EXTENDED_MASK`
> at runtime which contains mask value of the supported registers under
> extended regs.
> 
> patch 2/4 adds the extended regs support for power10 and exposes
> MMCR3, SIER2, SIER3 registers as part of extended regs.
> 
> Patch 3/4 and 4/4 adds extended regs to sample_reg_mask in the tool
> side to use with `-I?` option for power9 and power10 respectively.
> 
> Ravi bangoria found an issue with `perf record -I` while testing the
> changes. The same issue is currently being worked on here:
> https://lkml.org/lkml/2020/7/19/413 and will be resolved once fix
> from Jin Yao is merged.
> 
> This patch series is based on powerpc/next

Apart from the issue with patch #1, the series LGTM..

Reviewed-and-Tested-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>

