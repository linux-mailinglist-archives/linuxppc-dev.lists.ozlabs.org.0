Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77B401511
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 04:44:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H2t5X05zbz2yb7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 12:44:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XBZYf8sT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XBZYf8sT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H2t4k3j4vz2xYS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Sep 2021 12:43:34 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1862WiRA088148; Sun, 5 Sep 2021 22:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=ai8HqCrkveFWFH25hgjr2END87GQm7vQNewzxiBc96A=;
 b=XBZYf8sTGZ1iTEadpX0isDHGSzOvWwpJp1QNPaeXu+yTzn4vkZzG1i2aMWFE8FQUrA+8
 siX7kunTjwTqtEX6o34NThKB8ZQPRX7OESwTCT1nV9s1Pi5p5EVLALtOD7tyMruWkIdH
 jk8RMcG+FWAxUCO+zDM+2QamBgo0VCGiK5oE3aN3X4DP+nH+fCKVnaQ2NGMFJBj08a3N
 BfcExlq35mi4zRM2mfOeRrieHIjwcIP/sT4Q7rWtrfI80CzXLZlypsIh6L3XuWFJDQoj
 xCKZACkjn7GBkFE936eGGUgpML4N1jF6bO2Ks8k5fYKmtz4VwIyp1vdgDyEgW8hwhlwd +A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aw9tu0ktq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 05 Sep 2021 22:43:23 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1862c4BQ011465;
 Mon, 6 Sep 2021 02:43:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3av02j5h15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 02:43:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1862d55p56688978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Sep 2021 02:39:05 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD6C4A4059;
 Mon,  6 Sep 2021 02:43:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A8E6A4057;
 Mon,  6 Sep 2021 02:43:16 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.181.34])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  6 Sep 2021 02:43:15 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 0/2] powerpc/perf: Add instruction and data address
 registers to extended regs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <bd5a9388-483d-91ca-b371-ab92ae4c08bc@linux.ibm.com>
Date: Mon, 6 Sep 2021 08:13:13 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <BAA2B1EE-36BA-495A-B507-EC3C996199D8@linux.vnet.ibm.com>
References: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <bd5a9388-483d-91ca-b371-ab92ae4c08bc@linux.ibm.com>
To: kajoljain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u2GEQk8aqM2RrVouNyqw7BruJD_mYoH-
X-Proofpoint-ORIG-GUID: u2GEQk8aqM2RrVouNyqw7BruJD_mYoH-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-05_04:2021-09-03,
 2021-09-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060014
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Jiri Olsa <jolsa@kernel.org>,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 02-Sep-2021, at 1:04 PM, kajoljain <kjain@linux.ibm.com> wrote:
> 
> 
> 
> On 6/20/21 8:15 PM, Athira Rajeev wrote:
>> Patch set adds PMU registers namely Sampled Instruction Address Register
>> (SIAR) and Sampled Data Address Register (SDAR) as part of extended regs
>> in PowerPC. These registers provides the instruction/data address and
>> adding these to extended regs helps in debug purposes.
>> 
>> Patch 1/2 adds SIAR and SDAR as part of the extended regs mask.
>> Patch 2/2 includes perf tools side changes to add the SPRs to
>> sample_reg_mask to use with -I? option.
>> 
>> Athira Rajeev (2):
>>  powerpc/perf: Expose instruction and data address registers as part of
>>    extended regs
>>  tools/perf: Add perf tools support to expose instruction and data
>>    address registers as part of extended regs
>> 
> 
> Patchset looks good to me.
> 
> Reviewed-By: kajol Jain<kjain@linux.ibm.com>

Hi Arnaldo,

Requesting for your review on this patchset.

Thanks
Athira
> 
> Thanks,
> Kajol Jain
> 
>> arch/powerpc/include/uapi/asm/perf_regs.h       | 12 +++++++-----
>> arch/powerpc/perf/perf_regs.c                   |  4 ++++
>> tools/arch/powerpc/include/uapi/asm/perf_regs.h | 12 +++++++-----
>> tools/perf/arch/powerpc/include/perf_regs.h     |  2 ++
>> tools/perf/arch/powerpc/util/perf_regs.c        |  2 ++
>> 5 files changed, 22 insertions(+), 10 deletions(-)

