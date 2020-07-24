Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB222C402
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 13:04:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCmYG3v3WzDrTC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 21:04:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCmW22dq6zDqHJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 21:02:22 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OAWe9M025926; Fri, 24 Jul 2020 07:02:17 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fhu02cp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 07:02:17 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06OB08dR022597;
 Fri, 24 Jul 2020 11:02:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 32brq7x5wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 11:02:14 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06OB2C1540763422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 11:02:12 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DADF211C04C;
 Fri, 24 Jul 2020 11:02:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7031811C054;
 Fri, 24 Jul 2020 11:02:09 +0000 (GMT)
Received: from [9.199.32.41] (unknown [9.199.32.41])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jul 2020 11:02:09 +0000 (GMT)
Subject: Re: [v3 13/15] tools/perf: Add perf tools support for extended
 register capability in powerpc
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-14-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <7fcf405f-440a-19dc-7c3a-33fc52c9d1ef@linux.ibm.com>
Date: Fri, 24 Jul 2020 16:32:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594996707-3727-14-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_03:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=811 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240080
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com, acme@kernel.org,
 jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Athira,

On 7/17/20 8:08 PM, Athira Rajeev wrote:
> From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> 
> Add extended regs to sample_reg_mask in the tool side to use
> with `-I?` option. Perf tools side uses extended mask to display
> the platform supported register names (with -I? option) to the user
> and also send this mask to the kernel to capture the extended registers
> in each sample. Hence decide the mask value based on the processor
> version.
> 
> Currently definitions for `mfspr`, `SPRN_PVR` are part of
> `arch/powerpc/util/header.c`. Move this to a header file so that
> these definitions can be re-used in other source files as well.

It seems this patch has a regression.

Without this patch:

   $ sudo ./perf record -I
   ^C[ perf record: Woken up 1 times to write data ]
   [ perf record: Captured and wrote 0.458 MB perf.data (318 samples) ]

With this patch:

   $ sudo ./perf record -I
   Error:
   dummy:HG: PMU Hardware doesn't support sampling/overflow-interrupts. Try 'perf stat'

Ravi
