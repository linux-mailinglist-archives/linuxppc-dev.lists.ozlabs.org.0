Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E214B1D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 10:40:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486M6w281bzDqLj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 20:40:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486M4F1L3qzDqC3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 20:38:20 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S9bCmn060704
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 04:38:18 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xrk2f43as-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 04:38:17 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sandipan@linux.ibm.com>;
 Tue, 28 Jan 2020 09:38:15 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 28 Jan 2020 09:38:10 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00S9c9FS59899944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2020 09:38:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 230EFAE051;
 Tue, 28 Jan 2020 09:38:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD1FFAE045;
 Tue, 28 Jan 2020 09:38:06 +0000 (GMT)
Received: from [9.124.35.38] (unknown [9.124.35.38])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Jan 2020 09:38:06 +0000 (GMT)
Subject: Re: [PATCH v16 00/23] selftests, powerpc, x86: Memory Protection Keys
To: Dave Hansen <dave.hansen@intel.com>
References: <cover.1579507768.git.sandipan@linux.ibm.com>
 <3ceb2814-f8b0-ec6b-3c24-ec72297a99f5@intel.com>
 <8f14bee0-ab1c-fc90-dfdb-5128607b767f@linux.ibm.com>
 <3eca7a91-aa3e-cb01-47c8-5d36020993a2@intel.com>
From: Sandipan Das <sandipan@linux.ibm.com>
Date: Tue, 28 Jan 2020 15:08:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3eca7a91-aa3e-cb01-47c8-5d36020993a2@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20012809-0028-0000-0000-000003D51B29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012809-0029-0000-0000-000024996203
Message-Id: <fb83ce52-b92a-ed42-dc06-a86ca8431ff6@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001280078
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
Cc: linux-arch@vger.kernel.org, fweimer@redhat.com, aneesh.kumar@linux.ibm.com,
 x86@kernel.org, linuxram@us.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mhocko@kernel.org, linux-mm@kvack.org, mingo@redhat.com,
 linux-kselftest@vger.kernel.org, msuchanek@suse.de, shuah@kernel.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Dave,

On 27/01/20 9:12 pm, Dave Hansen wrote:
> 
> How have you tested this patch (and the whole series for that matter)?
> 

I replaced the second patch with this one and did a build test.
Till v16, I had tested the whole series (build + run) on both a POWER8
system (with 4K and 64K page sizes) and a Skylake SP system but for
x86_64 only. Following that, I could only do a build test locally on
my laptop for i386 and x86_64 on my laptop as I did not have access to
the Skylake system anymore.

This is how I tested the build process:

$ cd linux
$ make -C tools/testing/selftests
...
make[1]: Entering directory '/home/sandipan/.devel/linux/tools/testing/selftests/vm'
...
gcc -Wall -I ../../../../usr/include  -no-pie -m32  protection_keys.c -lrt -lrt -ldl -lm -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_32
gcc -Wall -I ../../../../usr/include  -no-pie -m64  protection_keys.c -lrt -lrt -ldl -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_64
...

$ make -C tools/testing/selftests clean
$ make -C tools/testing/selftests/vm
make: Entering directory '/home/sandipan/.devel/linux/tools/testing/selftests/vm'
make --no-builtin-rules ARCH=x86_64 -C ../../../.. headers_install
make[1]: Entering directory '/home/sandipan/.devel/linux'
  INSTALL ./usr/include
make[1]: Leaving directory '/home/sandipan/.devel/linux'
...
gcc -Wall -I ../../../../usr/include  -no-pie -m32  protection_keys.c -lrt -lrt -ldl -lm -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_32
gcc -Wall -I ../../../../usr/include  -no-pie -m64  protection_keys.c -lrt -lrt -ldl -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_64
...

$ make -C tools/testing/selftests/vm clean
$ make -C tools/testing/selftests/vm protection_keys
make: Entering directory '/home/sandipan/.devel/linux/tools/testing/selftests/vm'
gcc -Wall -I ../../../../usr/include  -no-pie -m32  protection_keys.c -lrt -lrt -ldl -lm -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_32
gcc -Wall -I ../../../../usr/include  -no-pie -m64  protection_keys.c -lrt -lrt -ldl -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_64
make: Leaving directory '/home/sandipan/.devel/linux/tools/testing/selftests/vm'

$ make -C tools/testing/selftests/vm clean
$ make -C tools/testing/selftests/vm protection_keys_32
make: Entering directory '/home/sandipan/.devel/linux/tools/testing/selftests/vm'
gcc -Wall -I ../../../../usr/include  -no-pie -m32  protection_keys.c -lrt -lrt -ldl -lm -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_32
make: Leaving directory '/home/sandipan/.devel/linux/tools/testing/selftests/vm'

$ make -C tools/testing/selftests/vm protection_keys_64
make: Entering directory '/home/sandipan/.devel/linux/tools/testing/selftests/vm'
gcc -Wall -I ../../../../usr/include  -no-pie -m64  protection_keys.c -lrt -lrt -ldl -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_64
make: Leaving directory '/home/sandipan/.devel/linux/tools/testing/selftests/vm'

$ make -C tools/testing/selftests/vm clean
$ cd tools/testing/selftests/vm
$ make
make --no-builtin-rules ARCH=x86_64 -C ../../../.. headers_install
make[1]: Entering directory '/home/sandipan/.devel/linux'
  INSTALL ./usr/include
make[1]: Leaving directory '/home/sandipan/.devel/linux'
...
gcc -Wall -I ../../../../usr/include  -no-pie -m32  protection_keys.c -lrt -lrt -ldl -lm -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_32
gcc -Wall -I ../../../../usr/include  -no-pie -m64  protection_keys.c -lrt -lrt -ldl -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_64
...

$ make clean
$ make protection_keys
gcc -Wall -I ../../../../usr/include  -no-pie -m32  protection_keys.c -lrt -lrt -ldl -lm -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_32
gcc -Wall -I ../../../../usr/include  -no-pie -m64  protection_keys.c -lrt -lrt -ldl -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_64

$ make clean
$ make protection_keys_32
gcc -Wall -I ../../../../usr/include  -no-pie -m32  protection_keys.c -lrt -lrt -ldl -lm -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_32

$ make protection_keys_64
gcc -Wall -I ../../../../usr/include  -no-pie -m64  protection_keys.c -lrt -lrt -ldl -o /home/sandipan/.devel/linux/tools/testing/selftests/vm/protection_keys_64


- Sandipan

