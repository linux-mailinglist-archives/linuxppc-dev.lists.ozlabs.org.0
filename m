Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4FA172F9D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 05:02:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TG7n418kzDr6Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 15:01:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TG5f4vYszDr61
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 15:00:06 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01S3tL0B098461
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 23:00:04 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yepx4xt1v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 23:00:04 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Fri, 28 Feb 2020 04:00:02 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 28 Feb 2020 03:59:59 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01S3xwHk56098974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 03:59:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69E15A4051;
 Fri, 28 Feb 2020 03:59:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15DEFA4040;
 Fri, 28 Feb 2020 03:59:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 28 Feb 2020 03:59:58 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 266FFA01F5;
 Fri, 28 Feb 2020 14:59:53 +1100 (AEDT)
Subject: Re: [PATCH v4 13/13] powerpc/ptrace: move ptrace_triggered() into
 hw_breakpoint.c
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, mikey@neuling.org,
 Russell Currey <ruscur@russell.cc>
References: <cover.1582803998.git.christophe.leroy@c-s.fr>
 <d45c91cf5f83424b8f3989b7ead28c50d8d765a9.1582803998.git.christophe.leroy@c-s.fr>
 <4e528bf2-2b53-ae93-cdcc-0c80953f40f2@c-s.fr>
 <87pndz1xsf.fsf@mpe.ellerman.id.au>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 28 Feb 2020 14:59:56 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87pndz1xsf.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022804-4275-0000-0000-000003A63229
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022803-4276-0000-0000-000038BAA584
Message-Id: <b2b97a86-2f29-af14-52c2-a69ef6202b75@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_08:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=792 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280034
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28/2/20 9:16 am, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Russel,
>>
>> Le 27/02/2020 à 12:49, Christophe Leroy a écrit :
>>> ptrace_triggered() is declared in asm/hw_breakpoint.h and
>>> only needed when CONFIG_HW_BREAKPOINT is set, so move it
>>> into hw_breakpoint.c
>>
>> My series v4 is definitely buggy (I included ptrace_decl.h instead
>> instead of ptrace-decl.h), how can Snowpatch say build succeeded
>> (https://patchwork.ozlabs.org/patch/1245807/) ?
> 
> Which links to:
>    https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/15895//artifact/linux/report.txt
> 
> The actual build log of which is:
>    https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/15895/artifact/linux/build_new.log
> 
> Which contains:
>    scripts/Makefile.build:267: recipe for target 'arch/powerpc/kernel/ptrace/ptrace-altivec.o' failed
>    make[3]: *** [arch/powerpc/kernel/ptrace/ptrace-altivec.o] Error 1
>    make[3]: *** Waiting for unfinished jobs....
>    scripts/Makefile.build:505: recipe for target 'arch/powerpc/kernel/ptrace' failed
>    make[2]: *** [arch/powerpc/kernel/ptrace] Error 2
>    make[2]: *** Waiting for unfinished jobs....
>    scripts/Makefile.build:505: recipe for target 'arch/powerpc/kernel' failed
>    make[1]: *** [arch/powerpc/kernel] Error 2
>    make[1]: *** Waiting for unfinished jobs....
>    Makefile:1681: recipe for target 'arch/powerpc' failed
>    make: *** [arch/powerpc] Error 2
>    make: *** Waiting for unfinished jobs....
> 
> Same for ppc64le:
>    https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/15896/artifact/linux/build_new.log
> 
> 
> So it seems like snowpatch always reports the build as succeeded even
> when it fails.

Turns out there was an issue in a recent change in our build script 
which caused build failures to return the wrong exit code and put the 
wrong text in the reports, because of some confusion with bash 
subshells. I've fixed it (I think).

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

