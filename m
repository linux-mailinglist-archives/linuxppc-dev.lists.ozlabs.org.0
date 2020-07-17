Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4072322326A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 06:34:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7JDj5cWZzDrBp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 14:34:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7HrP2Q8xzDqmq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 14:16:52 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H413bd082849; Fri, 17 Jul 2020 00:16:44 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32as6e2e7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 00:16:44 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H4Gg9Z032153;
 Fri, 17 Jul 2020 04:16:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 328rbqsxmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 04:16:42 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06H4GeLP30278032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 04:16:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 372CEA405F;
 Fri, 17 Jul 2020 04:16:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24A37A4054;
 Fri, 17 Jul 2020 04:16:39 +0000 (GMT)
Received: from [9.85.81.62] (unknown [9.85.81.62])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 04:16:38 +0000 (GMT)
Subject: Re: [powerpc:next-test 125/127]
 arch/powerpc/mm/book3s64/pkeys.c:392:7: error: implicit declaration of
 function 'is_pkey_enabled'; did you mean
To: kernel test robot <lkp@intel.com>
References: <202007170943.BGjGSyKg%lkp@intel.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <4afe08ee-d039-dec6-70c3-383497e52440@linux.ibm.com>
Date: Fri, 17 Jul 2020 09:46:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202007170943.BGjGSyKg%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_11:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 mlxlogscore=895 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170025
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/17/20 7:29 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> head:   0fbd1eb4df96e1cbd039e0b95fdf62cf65a7faf9
> commit: ed411c66eea2ccf93a634ae661a1f79c2bc63d88 [125/127] powerpc/book3s64/pkeys: Remove is_pkey_enabled()
> config: powerpc-allmodconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git checkout ed411c66eea2ccf93a634ae661a1f79c2bc63d88
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     arch/powerpc/mm/book3s64/pkeys.c: In function 'pkey_access_permitted':
>>> arch/powerpc/mm/book3s64/pkeys.c:392:7: error: implicit declaration of function 'is_pkey_enabled'; did you mean 'arch_pkeys_enabled'? [-Werror=implicit-function-declaration]
>       392 |  if (!is_pkey_enabled(pkey))
>           |       ^~~~~~~~~~~~~~~
>           |       arch_pkeys_enabled
>     cc1: some warnings being treated as errors
> 
> vim +392 arch/powerpc/mm/book3s64/pkeys.c
> 


We removed that upstream in

19ab500edb5d6020010caba48ce3b4ce4182ab63     powerpc/mm/pkeys: Make pkey 
access check work on execute_only_key


next-test need to be rebased?

-aneesh
