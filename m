Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A40523597F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 19:30:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKShD2rPxzDqRR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 03:30:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKSfY2MbdzDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 03:28:36 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 072H2tuk122131
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 2 Aug 2020 13:28:33 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32nwujv0h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Aug 2020 13:28:33 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 072HQ6tq000828
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 2 Aug 2020 17:28:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32n0181byb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Aug 2020 17:28:31 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 072HSSdt61342170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 2 Aug 2020 17:28:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E472AAE045;
 Sun,  2 Aug 2020 17:28:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 366F0AE051;
 Sun,  2 Aug 2020 17:28:28 +0000 (GMT)
Received: from [9.199.44.56] (unknown [9.199.44.56])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun,  2 Aug 2020 17:28:27 +0000 (GMT)
Subject: Re: [merge] Build failure selftest/powerpc/mm/pkey_exec_prot
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
References: <37C1E196-B35D-46C4-AAA7-BC250078E4F2@linux.vnet.ibm.com>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <63dc2f90-9a16-21f8-51fa-cfef9df80676@linux.ibm.com>
Date: Sun, 2 Aug 2020 22:58:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <37C1E196-B35D-46C4-AAA7-BC250078E4F2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-02_14:2020-07-31,
 2020-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008020133
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sachin,

On 02/08/20 4:45 pm, Sachin Sant wrote:
> pkey_exec_prot test from linuxppc merge branch (3f68564f1f5a) fails to
> build due to following error:
> 
> gcc -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"v5.8-rc7-1276-g3f68564f1f5a"' -I/home/sachin/linux/tools/testing/selftests/powerpc/include  -m64    pkey_exec_prot.c /home/sachin/linux/tools/testing/selftests/kselftest_harness.h /home/sachin/linux/tools/testing/selftests/kselftest.h ../harness.c ../utils.c  -o /home/sachin/linux/tools/testing/selftests/powerpc/mm/pkey_exec_prot
> In file included from pkey_exec_prot.c:18:
> /home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:34: error: "SYS_pkey_mprotect" redefined [-Werror]
>  #define SYS_pkey_mprotect 386
>  
> In file included from /usr/include/sys/syscall.h:31,
>                  from /home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
>                  from /home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
>                  from pkey_exec_prot.c:18:
> /usr/include/bits/syscall.h:1583: note: this is the location of the previous definition
>  # define SYS_pkey_mprotect __NR_pkey_mprotect
> 
> commit 128d3d021007 introduced this error.
> selftests/powerpc: Move pkey helpers to headers
> 
> Possibly the # defines for sys calls can be retained in pkey_exec_prot.c or
> 

I am unable to reproduce this on the latest merge branch (HEAD at f59195f7faa4).
I don't see any redefinitions in pkey_exec_prot.c either.

- Sandipan
