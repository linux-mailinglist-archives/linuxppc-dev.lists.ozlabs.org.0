Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C97C1179C98
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 01:06:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xrcj0fqfzDqjR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 11:05:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XrZy0jWqzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 11:04:25 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024NxDnh053962
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Mar 2020 19:04:21 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yhs0urr0c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2020 19:04:21 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 5 Mar 2020 00:04:20 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Mar 2020 00:04:16 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02503GkH49021186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 00:03:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EA8A5204E;
 Thu,  5 Mar 2020 00:04:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 87ADA52050;
 Thu,  5 Mar 2020 00:04:14 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 980AAA0264;
 Thu,  5 Mar 2020 11:04:09 +1100 (AEDT)
Subject: Re: [PATCH V6 00/14] powerpc/vas: Page fault handling for user space
 NX requests
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1583353283.18705.2112.camel@hbabu-laptop>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Thu, 5 Mar 2020 11:04:13 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583353283.18705.2112.camel@hbabu-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030500-0008-0000-0000-000003596951
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030500-0009-0000-0000-00004A7A9E7F
Message-Id: <93c032c4-9be2-f48a-ebe7-cecdcb505545@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_10:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003040153
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/3/20 7:21 am, Haren Myneni wrote:
> 
> On power9, Virtual Accelerator Switchboard (VAS) allows user space or
> kernel to communicate with Nest Accelerator (NX) directly using COPY/PASTE
> instructions. NX provides various functionalities such as compression,
> encryption and etc. But only compression (842 and GZIP formats) is
> supported in Linux kernel on power9.
> 
> 842 compression driver (drivers/crypto/nx/nx-842-powernv.c)
> is already included in Linux. Only GZIP support will be available from
> user space.
> 
> Applications can issue GZIP compression / decompression requests to NX with
> COPY/PASTE instructions. When NX is processing these requests, can hit
> fault on the request buffer (not in memory). It issues an interrupt and
> pastes fault CRB in fault FIFO. Expects kernel to handle this fault and
> return credits for both send and fault windows after processing.
> 
> This patch series adds IRQ and fault window setup, and NX fault handling:
> - Alloc IRQ and trigger port address, and configure IRQ per VAS instance.
> - Set port# for each window to generate an interrupt when noticed fault.
> - Set fault window and FIFO on which NX paste fault CRB.
> - Setup IRQ thread fault handler per VAS instance.
> - When receiving an interrupt, Read CRBs from fault FIFO and update
>    coprocessor_status_block (CSB) in the corresponding CRB with translation
>    failure (CSB_CC_TRANSLATION). After issuing NX requests, process polls
>    on CSB address. When it sees translation error, can touch the request
>    buffer to bring the page in to memory and reissue NX request.
> - If copy_to_user fails on user space CSB address, OS sends SEGV signal.
> 
> Tested these patches with NX-GZIP support and will be posting this series
> soon.
> 
> Patches 1 & 2: Define alloc IRQ and get port address per chip which are needed
>                 to alloc IRQ per VAS instance.
> Patch 3: Define nx_fault_stamp on which NX writes fault status for the fault
>           CRB
> Patch 4: Alloc and setup IRQ and trigger port address for each VAS instance
> Patch 5: Setup fault window per each VAS instance. This window is used for
>           NX to paste fault CRB in FIFO.
> Patches 6 & 7: Setup threaded IRQ per VAS and register NX with fault window
>           ID and port number for each send window so that NX paste fault CRB
>           in this window.
> Patch 8: Reference to pid and mm so that pid is not used until window closed.
>           Needed for multi thread application where child can open a window
>           and can be used by parent later.
> Patches 9 and 10: Process CRBs from fault FIFO and notify tasks by
>           updating CSB or through signals.
> Patches 11 and 12: Return credits for send and fault windows after handling
>          faults.
> Patch 14:Fix closing send window after all credits are returned. This issue
>           happens only for user space requests. No page faults on kernel
>           request buffer.
> 

This series adds a bunch of sparse warnings - it would be great if you 
could take a look.

https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/16052//artifact/linux/report.txt

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

