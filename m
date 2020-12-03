Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF02CCF02
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 07:14:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cmlt76kkHzDrFr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 17:14:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IghWjx3Y; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmlrG6wk2zDrDJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 17:13:02 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B36ArJS166328; Thu, 3 Dec 2020 01:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=mUfRHHsWm53eUi66ZnM3LZBim3ldkMCEKX+rBwNvfsU=;
 b=IghWjx3Yc/FYcw1YWxaA4cn+fyA5Yrpjp1JZ/KHjYfPtK/9ae1cHvZnBTa1PCbPHR08D
 My2fen0FOhM8fD1KhJqxN5C1hIJ4iY0q0V4gtXF2X4TdKT3pVv5oJKt2S0g/TVNqYcfN
 IFF72WrH37BjvzPS0PnNADzlOeFBoVwcruR+g9Jvx7jZs6Cxqm4UsAAecCRrqfdLOOSD
 5mz5y4fiI3M7Jo0YOjmCPoTS49gmou/OV5XT9PPk4KCdw27PymfYT3/DvftRfBYp8j4Q
 7NM2jTExvACqOsKzJGD2tQr5GiWczeUUAS4iemis1TCfWzGPsfk2t7TVS5rhrP78l8OI kA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356jdqkawc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 01:12:53 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B36AuHm166431;
 Thu, 3 Dec 2020 01:12:52 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356jdqkavs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 01:12:52 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B36CGDQ032171;
 Thu, 3 Dec 2020 06:12:51 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 354fpdbp0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 06:12:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B36Cm9J7930546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 06:12:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B576142049;
 Thu,  3 Dec 2020 06:12:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89C1F4203F;
 Thu,  3 Dec 2020 06:12:47 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  3 Dec 2020 06:12:47 +0000 (GMT)
Date: Thu, 3 Dec 2020 11:42:46 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [powerpc:next-test 121/184]
 arch/powerpc/kernel/firmware.c:31:9-10: WARNING: return of 0/1 in function
 'check_kvm_guest' with return type bool
Message-ID: <20201203061246.GG528281@linux.vnet.ibm.com>
References: <202012030759.zuEULDQ3-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <202012030759.zuEULDQ3-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_01:2020-11-30,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030038
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, 

Thanks for the report.

* kernel test robot <lkp@intel.com> [2020-12-03 07:25:06]:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> head:   fb003959777a635dea8910cf71109b612c7f940c
> commit: 77354ecf8473208a5cc5f20a501760f7d6d631cd [121/184] powerpc: Rename is_kvm_guest() to check_kvm_guest()

Sorry for the nit pick, but the commit should have been
Commit 107c55005fbd ("powerpc/pseries: Add KVM guest doorbell restrictions")

because thats the patch that introduced is_kvm_guest.
my patch was just renaming is_kvm_guest to check_kvm_guest.

> config: powerpc-randconfig-c003-20201202 (attached as .config)
> compiler: powerpc64le-linux-gcc (GCC) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> 
> "coccinelle warnings: (new ones prefixed by >>)"
> >> arch/powerpc/kernel/firmware.c:31:9-10: WARNING: return of 0/1 in function 'check_kvm_guest' with return type bool
> 
> Please review and possibly fold the followup patch.
> 

But I agree we can still fold this the followup patch into the
Rename is_kvm_guest() to check_kvm_guest().

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Thanks and Regards
Srikar Dronamraju
