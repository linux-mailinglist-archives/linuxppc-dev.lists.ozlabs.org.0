Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDE63562E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 07:23:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JcdN306gzDqXf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 15:23:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=haren@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jcc3559szDqJP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 15:22:08 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x555IMOf127729
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Jun 2019 01:22:05 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sx6jmhsxe-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 01:22:05 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <haren@linux.vnet.ibm.com>;
 Wed, 5 Jun 2019 06:22:04 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 5 Jun 2019 06:22:03 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x555M2ib36765842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jun 2019 05:22:02 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18B8628059;
 Wed,  5 Jun 2019 05:22:02 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B47172805C;
 Wed,  5 Jun 2019 05:22:01 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jun 2019 05:22:01 +0000 (GMT)
Date: Tue, 04 Jun 2019 22:21:42 -0700
From: Haren Myneni <haren@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
 rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Stewart Smith <stewart@linux.ibm.com>
Subject: Re: crash after NX error
References: <87pnnuav9d.fsf@linux.vnet.ibm.com>
In-Reply-To: <87pnnuav9d.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19060505-0060-0000-0000-0000034C4689
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011217; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01213434; UDB=6.00637769; IPR=6.00994507; 
 MB=3.00027188; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-05 05:22:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060505-0061-0000-0000-000049A23222
Message-Id: <5CF75166.8080301@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-05_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906050032
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/03/2019 08:23 PM, Stewart Smith wrote:
> On my two socket POWER9 system (powernv) with 842 zwap set up, I
> recently got a crash with the Ubuntu kernel (I haven't tried with
> upstream, and this is the first time the system has died like this, so
> I'm not sure how repeatable it is).
> 
> [    2.891463] zswap: loaded using pool 842-nx/zbud
> ...
> [15626.124646] nx_compress_powernv: ERROR: CSB still not valid after 5000000 us, giving up : 00 00 00 00 00000000
> [16868.932913] Unable to handle kernel paging request for data at address 0x6655f67da816cdb8
> [16868.933726] Faulting instruction address: 0xc000000000391600
> 
> 
> cpu 0x68: Vector: 380 (Data Access Out of Range) at [c000001c9d98b9a0]
>     pc: c000000000391600: kmem_cache_alloc+0x2e0/0x340
>     lr: c0000000003915ec: kmem_cache_alloc+0x2cc/0x340
>     sp: c000001c9d98bc20
>    msr: 900000000280b033
>    dar: 6655f67da816cdb8
>   current = 0xc000001ad43cb400
>   paca    = 0xc00000000fac7800   softe: 0        irq_happened: 0x01
>     pid   = 8319, comm = make
> Linux version 4.15.0-50-generic (buildd@bos02-ppc64el-006) (gcc version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)) #54-Ubuntu SMP Mon May 6 18:55:18 UTC 2019 (Ubuntu 4.15.0-50.54-generic 4.15.18)
> 
> 68:mon> t
> [c000001c9d98bc20] c0000000003914d4 kmem_cache_alloc+0x1b4/0x340 (unreliable)
> [c000001c9d98bc80] c0000000003b1e14 __khugepaged_enter+0x54/0x220
> [c000001c9d98bcc0] c00000000010f0ec copy_process.isra.5.part.6+0xebc/0x1a10
> [c000001c9d98bda0] c00000000010fe4c _do_fork+0xec/0x510
> [c000001c9d98be30] c00000000000b584 ppc_clone+0x8/0xc
> --- Exception: c00 (System Call) at 00007afe9daf87f4
> SP (7fffca606880) is in userspace
> 
> So, it looks like there could be a problem in the error path, plausibly
> fixed by this patch:
> 
> commit 656ecc16e8fc2ab44b3d70e3fcc197a7020d0ca5
> Author: Haren Myneni <haren@linux.vnet.ibm.com>
> Date:   Wed Jun 13 00:32:40 2018 -0700
> 
>     crypto/nx: Initialize 842 high and normal RxFIFO control registers
>     
>     NX increments readOffset by FIFO size in receive FIFO control register
>     when CRB is read. But the index in RxFIFO has to match with the
>     corresponding entry in FIFO maintained by VAS in kernel. Otherwise NX
>     may be processing incorrect CRBs and can cause CRB timeout.
>     
>     VAS FIFO offset is 0 when the receive window is opened during
>     initialization. When the module is reloaded or in kexec boot, readOffset
>     in FIFO control register may not match with VAS entry. This patch adds
>     nx_coproc_init OPAL call to reset readOffset and queued entries in FIFO
>     control register for both high and normal FIFOs.
>     
>     Signed-off-by: Haren Myneni <haren@us.ibm.com>
>     [mpe: Fixup uninitialized variable warning]
>     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> $ git describe --contains 656ecc16e8fc2ab44b3d70e3fcc197a7020d0ca5
> v4.19-rc1~24^2~50
> 
> 
> Which was never backported to any stable release, so probably needs to
> be for v4.14 through v4.18. Notably, Ubuntu is on v4.15 and it doesn't
> seem to have picked up the patch. I'm opening an Ubuntu bug for this.
> 
> Haren, is this something you can drive through the stable process
> (assuming my above crash looks like this failure)?
> 

Thanks Stewart. Missed this in stable releases and I will work on it. Merged in Ubuntu 18.04.x kernel recently and will be in the next update.

Also need
 
commit 6e708000ec2c93c2bde6a46aa2d6c3e80d4eaeb9
Author: Haren Myneni <haren@linux.vnet.ibm.com>
Date:   Wed Jun 13 00:28:57 2018 -0700

    powerpc/powernv: Export opal_check_token symbol

    Export opal_check_token symbol for modules to check the availability
    of OPAL calls before using them.

    Signed-off-by: Haren Myneni <haren@us.ibm.com>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

 




