Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB09B5B94DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 08:57:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSp134RYCz3bk0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 16:57:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=COZ5EBb4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=COZ5EBb4;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSp0L3QRZz301Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 16:56:50 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28F6UDZB024030;
	Thu, 15 Sep 2022 06:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=VEbTNybxmKmxaaOiLXroQ2jlKviqDhSyY+6f1s4O6xw=;
 b=COZ5EBb4ZZZzQ0XkndCKGyHLeCavwbBoMBrIFyPhC+R0WWSZ3NC7aNllaGH5uUjfJ4Hu
 ItpeFlua7fqGv2gCNdzo0+L8T0D/CXXFUflR7bjNJ6Mgd+KSJDuIguyafQwZ0M+MGDZw
 GhzcqaUF2h2lrDFZ27nMIYmRFzU3RCxW4y0aPQzxuEVTucuiq0rUzAWN3bUNfoO4sul9
 IhofHbMVp7OvrnJ3HAr54GdPZc4s+MxMWPo3fTQKvrgYCD5yzD6J4kQeN4i4/wzG9Bti
 Zj1i4WiK9xDvMInYre+t44SBraNNUlx5ftuQd4wSR1IA40j2Mg9m+3DARmsM0OmeWe0t pA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkvuuv8s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 06:56:14 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28F5woB1031355;
	Thu, 15 Sep 2022 06:56:13 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkvuuv8r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 06:56:13 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28F6pwgf029024;
	Thu, 15 Sep 2022 06:56:11 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03fra.de.ibm.com with ESMTP id 3jjy25sgsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 06:56:11 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28F6u9bf41943374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Sep 2022 06:56:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 206F142041;
	Thu, 15 Sep 2022 06:56:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94B354203F;
	Thu, 15 Sep 2022 06:56:08 +0000 (GMT)
Received: from localhost (unknown [9.43.117.180])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 15 Sep 2022 06:56:08 +0000 (GMT)
Date: Thu, 15 Sep 2022 12:26:06 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 11/16] objtool: Add --mnop as an option to --mcount
To: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
        Sathvika Vasireddy <sv@linux.ibm.com>
References: <20220912082020.226755-12-sv@linux.ibm.com>
	<202209130240.GpGMxW7T-lkp@intel.com>
In-Reply-To: <202209130240.GpGMxW7T-lkp@intel.com>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1663223588.wppdx3129x.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x-5wh-fBxHda3hOfVgmV9Jba-vKB6N3Y
X-Proofpoint-GUID: bFSofjGk_B3eU0eLu_FuXhJNh8zjDUcx
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2208220000 definitions=main-2209150034
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
Cc: kbuild-all@lists.01.org, aik@ozlabs.ru, linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, rostedt@goodmis.org, npiggin@gmail.com, jpoimboe@redhat.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel test robot wrote:
> Hi Sathvika,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on powerpc/topic/ppc-kvm]
> [also build test ERROR on linus/master v6.0-rc5]
> [cannot apply to powerpc/next masahiroy-kbuild/for-next next-20220912]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Sathvika-Vasireddy=
/objtool-Enable-and-implement-mcount-option-on-powerpc/20220912-163023
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git=
 topic/ppc-kvm
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20220913=
/202209130240.GpGMxW7T-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
> reproduce (this is a W=3D1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/ca5e2b42c0d4438ba=
93623579b6860b98f3598f3
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Sathvika-Vasireddy/objtool-Enabl=
e-and-implement-mcount-option-on-powerpc/20220912-163023
>         git checkout ca5e2b42c0d4438ba93623579b6860b98f3598f3
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>

Thanks.

>=20
> All errors (new ones prefixed by >>):
>=20
>>> cc1: error: '-mnop-mcount' is not implemented for '-fPIC'

CONFIG_NOP_MCOUNT is used for FTRACE_MCOUNT_USE_CC, so instead of:

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f9920f1341c8..a8dd138df637 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -189,6 +189,7 @@ config X86
        select HAVE_CONTEXT_TRACKING_USER_OFFSTACK      if HAVE_CONTEXT_TRA=
CKING_USER
        select HAVE_C_RECORDMCOUNT
        select HAVE_OBJTOOL_MCOUNT              if HAVE_OBJTOOL
+       select HAVE_NOP_MCOUNT                  if HAVE_OBJTOOL_MCOUNT
        select HAVE_BUILDTIME_MCOUNT_SORT
        select HAVE_DEBUG_KMEMLEAK
        select HAVE_DMA_CONTIGUOUS

I think you should do:

+       select HAVE_NOP_MCOUNT                  if FTRACE_MCOUNT_USE_OBJTOOL


I was hoping we could reuse CONFIG_NOP_MCOUNT seeing as it is only used=20
by s390, but I now wonder if it is better to just keep that separate. We=20
could introduce HAVE_OBJTOOL_NOP_MCOUNT for objtool instead.


- Naveen
