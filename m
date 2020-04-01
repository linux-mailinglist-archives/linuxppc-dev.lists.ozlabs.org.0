Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAB619B5AD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:39:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sw2W5p1zzDrBJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 05:38:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48svzK2q4ZzDr0R
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 05:36:13 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031IYHfJ029774
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 14:36:09 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 304wngvmef-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 14:36:09 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 1 Apr 2020 19:35:56 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 19:35:53 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 031Ia3To24641798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 18:36:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1A1FAE045;
 Wed,  1 Apr 2020 18:36:03 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0747AE051;
 Wed,  1 Apr 2020 18:36:02 +0000 (GMT)
Received: from [9.102.0.220] (unknown [9.102.0.220])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 18:36:02 +0000 (GMT)
Subject: Re: [PATCHv4] powerpc/crashkernel: take "mem=" option into account
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <48c1b852-28e0-9c46-cafa-7c5992f966a7@linux.ibm.com>
 <1585749644-4148-1-git-send-email-kernelfans@gmail.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Thu, 2 Apr 2020 00:06:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1585749644-4148-1-git-send-email-kernelfans@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040118-0008-0000-0000-000003689FB9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040118-0009-0000-0000-00004A8A290F
Message-Id: <2bfddcda-1187-5718-ce13-0c30d25337a9@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010150
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
Cc: kexec@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 01/04/20 7:30 PM, Pingfan Liu wrote:
> 'mem=" option is an easy way to put high pressure on memory during some
> test. Hence after applying the memory limit, instead of total mem, the
> actual usable memory should be considered when reserving mem for
> crashkernel. Otherwise the boot up may experience OOM issue.
> 
> E.g. it would reserve 4G prior to the change and 512M afterward, if passing
> crashkernel="2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G", and
> mem=5G on a 256G machine.
> 
> This issue is powerpc specific because it puts higher priority on fadump
> and kdump reservation than on "mem=". Referring the following code:
>     if (fadump_reserve_mem() == 0)
>             reserve_crashkernel();
>     ...
>     /* Ensure that total memory size is page-aligned. */
>     limit = ALIGN(memory_limit ?: memblock_phys_mem_size(), PAGE_SIZE);
>     memblock_enforce_memory_limit(limit);
> 
> While on other arches, the effect of "mem=" takes a higher priority and pass
> through memblock_phys_mem_size() before calling reserve_crashkernel().
>> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> To: linuxppc-dev@lists.ozlabs.org
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: kexec@lists.infradead.org
> ---
> v3 -> v4: fix total_mem_sz based on adjusted memory_limit


Thanks for the update.

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

