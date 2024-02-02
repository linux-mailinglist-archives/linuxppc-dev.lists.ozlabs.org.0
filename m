Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F56A846782
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 06:25:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nPh+kCvN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR43n3zQjz3cnR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 16:25:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nPh+kCvN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TR4312yGCz2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 16:24:44 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4124f8L7017387;
	Fri, 2 Feb 2024 05:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PDV06LOquyZ2c07ivE0vzxZrSRl419YEOX13JRF/udo=;
 b=nPh+kCvNsnHIYDXWB0+2FRPhHygYiddpgBYz2W2SHiiN1BkFek2qQw4ycvxxYI/qpDU6
 yTcyNuf7kUwLL+dKocLOKD9Ekbesc3adySbvz8eZZZo2Z5ceyoprZbKlKsbp/pRs/L+u
 LoKmlG+vz37L6dQuBT680kuK7Hzw1dKKzpiIQ6ikpbCbLP8uFBLpJtSeBEj0PCvygnUT
 4NR2nL56TsuRsPlaZ56kvvRxLE4E+QskziTz+cZzPuCgZxD21oHVw4P/IY05CitLKyF1
 eg9L8IxFl1XG9YTFEBQGzk6a4uzOmaa08XYF8RC/ZKiXNITRfrHPMBQBXQuNWjRLHcyu Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w0sev0xb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 05:24:26 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4124w2OJ002776;
	Fri, 2 Feb 2024 05:23:50 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w0sev0wt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 05:23:50 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41240aMF011292;
	Fri, 2 Feb 2024 05:23:31 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vwecm0xbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 05:23:31 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4125NTcC43254138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Feb 2024 05:23:29 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 755912004B;
	Fri,  2 Feb 2024 05:23:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5C9420040;
	Fri,  2 Feb 2024 05:23:25 +0000 (GMT)
Received: from [9.43.64.13] (unknown [9.43.64.13])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Feb 2024 05:23:25 +0000 (GMT)
Message-ID: <9101bb07-70f1-476c-bec9-ec67e9899744@linux.ibm.com>
Date: Fri, 2 Feb 2024 10:53:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] Split crash out from kexec and clean up related
 config items
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
References: <20240119145241.769622-1-bhe@redhat.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20240119145241.769622-1-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RAVJ1hGQlGX9e6U_JEK40a_2LBSb9TD_
X-Proofpoint-ORIG-GUID: tOhKLrcRaLdeupwFUmZ3kDNGA-MwGyC-
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1011 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402020037
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
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baoquan,

On 19/01/24 8:22 pm, Baoquan He wrote:
> Motivation:
> =============
> Previously, LKP reported a building error. When investigating, it can't
> be resolved reasonablly with the present messy kdump config items.
> 
>   https://lore.kernel.org/oe-kbuild-all/202312182200.Ka7MzifQ-lkp@intel.com/
> 
> The kdump (crash dumping) related config items could causes confusions:
> 
> Firstly,
> ---
> CRASH_CORE enables codes including
>   - crashkernel reservation;
>   - elfcorehdr updating;
>   - vmcoreinfo exporting;
>   - crash hotplug handling;
> 
> Now fadump of powerpc, kcore dynamic debugging and kdump all selects
> CRASH_CORE, while fadump
>   - fadump needs crashkernel parsing, vmcoreinfo exporting, and accessing
>     global variable 'elfcorehdr_addr';
>   - kcore only needs vmcoreinfo exporting;
>   - kdump needs all of the current kernel/crash_core.c.
> 
> So only enabling PROC_CORE or FA_DUMP will enable CRASH_CORE, this
> mislead people that we enable crash dumping, actual it's not.
> 
> Secondly,
> ---
> It's not reasonable to allow KEXEC_CORE select CRASH_CORE.
> 
> Because KEXEC_CORE enables codes which allocate control pages, copy
> kexec/kdump segments, and prepare for switching. These codes are
> shared by both kexec reboot and kdump. We could want kexec reboot,
> but disable kdump. In that case, CRASH_CORE should not be selected.
> 
>   --------------------
>   CONFIG_CRASH_CORE=y
>   CONFIG_KEXEC_CORE=y
>   CONFIG_KEXEC=y
>   CONFIG_KEXEC_FILE=y
>      ---------------------
> 
> Thirdly,
> ---
> It's not reasonable to allow CRASH_DUMP select KEXEC_CORE.
> 
> That could make KEXEC_CORE, CRASH_DUMP are enabled independently from
> KEXEC or KEXEC_FILE. However, w/o KEXEC or KEXEC_FILE, the KEXEC_CORE
> code built in doesn't make any sense because no kernel loading or
> switching will happen to utilize the KEXEC_CORE code.
>   ---------------------
>   CONFIG_CRASH_CORE=y
>   CONFIG_KEXEC_CORE=y
>   CONFIG_CRASH_DUMP=y
>   ---------------------
> 
> In this case, what is worse, on arch sh and arm, KEXEC relies on MMU,
> while CRASH_DUMP can still be enabled when !MMU, then compiling error is
> seen as the lkp test robot reported in above link.
> 
>   ------arch/sh/Kconfig------
>   config ARCH_SUPPORTS_KEXEC
>           def_bool MMU
> 
>   config ARCH_SUPPORTS_CRASH_DUMP
>           def_bool BROKEN_ON_SMP
>   ---------------------------
> 
> Changes:
> ===========
> 1, split out crash_reserve.c from crash_core.c;
> 2, split out vmcore_infoc. from crash_core.c;
> 3, move crash related codes in kexec_core.c into crash_core.c;
> 4, remove dependency of FA_DUMP on CRASH_DUMP;
> 5, clean up kdump related config items;
> 6, wrap up crash codes in crash related ifdefs on all 9 arch-es
>     which support crash dumping;
> 
> Achievement:
> ===========
> With above changes, I can rearrange the config item logic as below (the right
> item depends on or is selected by the left item):
> 
>      PROC_KCORE -----------> VMCORE_INFO
> 
>                 |----------> VMCORE_INFO
>      FA_DUMP----|
>                 |----------> CRASH_RESERVE

FA_DUMP also needs PROC_VMCORE (CRASH_DUMP by dependency, I guess).
So, the FA_DUMP related changes here will need a relook..


>                                                      ---->VMCORE_INFO
>                                                     /
>                                                     |---->CRASH_RESERVE
>      KEXEC      --|                                /|
>                   |--> KEXEC_CORE--> CRASH_DUMP-->/-|---->PROC_VMCORE
>      KEXEC_FILE --|                               \ |
>                                                     \---->CRASH_HOTPLUG
> 
> 
>      KEXEC      --|
>                   |--> KEXEC_CORE (for kexec reboot only)
>      KEXEC_FILE --|
> 
> Test
> ========
> On all 8 architectures, including x86_64, arm64, s390x, sh, arm, mips,
> riscv, loongarch, I did below three cases of config item setting and
> building all passed. Let me take configs on x86_64 as exampmle here:
> 
> (1) Both CONFIG_KEXEC and KEXEC_FILE is unset, then all kexec/kdump
> items are unset automatically:
> # Kexec and crash features
> # CONFIG_KEXEC is not set
> # CONFIG_KEXEC_FILE is not set
> # end of Kexec and crash features
> 
> (2) set CONFIG_KEXEC_FILE and 'make olddefconfig':
> ---------------
> # Kexec and crash features
> CONFIG_CRASH_RESERVE=y
> CONFIG_VMCORE_INFO=y
> CONFIG_KEXEC_CORE=y
> CONFIG_KEXEC_FILE=y
> CONFIG_CRASH_DUMP=y
> CONFIG_CRASH_HOTPLUG=y
> CONFIG_CRASH_MAX_MEMORY_RANGES=8192
> # end of Kexec and crash features
> ---------------
> 
> (3) unset CONFIG_CRASH_DUMP in case 2 and execute 'make olddefconfig':
> ------------------------
> # Kexec and crash features
> CONFIG_KEXEC_CORE=y
> CONFIG_KEXEC_FILE=y
> # end of Kexec and crash features
> ------------------------
> 
> Note:
> For ppc, it needs investigation to make clear how to split out crash
> code in arch folder.

On powerpc, both kdump and fadump need PROC_VMCORE & CRASH_DUMP.
Hope that clears things. So, patch 3/14 breaks things for FA_DUMP..

> Hope Hari and Pingfan can help have a look, see if
> it's doable. Now, I make it either have both kexec and crash enabled, or
> disable both of them altogether.


Sure. I will take a closer look...

Thanks
Hari
