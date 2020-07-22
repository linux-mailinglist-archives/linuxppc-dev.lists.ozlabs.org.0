Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F866229E97
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 19:36:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBjLX4QRbzDr3M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 03:36:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBjJc0nKvzDqLB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 03:34:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BBjJb48Wsz8t9F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 03:34:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BBjJb3jCdz9sRN; Thu, 23 Jul 2020 03:34:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BBjJb0558z9sR4
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Jul 2020 03:34:38 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06MHVZgp184421; Wed, 22 Jul 2020 13:33:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x8b71f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 13:33:10 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06MHX9sL188302;
 Wed, 22 Jul 2020 13:33:09 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x8b70v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 13:33:09 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06MHLpNn018393;
 Wed, 22 Jul 2020 17:33:07 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 32brbh56as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 17:33:07 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06MHX4Zi52494452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 17:33:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB864A4057;
 Wed, 22 Jul 2020 17:33:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27D58A4040;
 Wed, 22 Jul 2020 17:33:01 +0000 (GMT)
Received: from [9.85.73.85] (unknown [9.85.73.85])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 17:33:00 +0000 (GMT)
Subject: Re: [PATCH v4 07/12] ppc64/kexec_file: add support to relocate
 purgatory
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
References: <159524918900.20855.17709718993097359220.stgit@hbathini.in.ibm.com>
 <159524956457.20855.12480643681198700190.stgit@hbathini.in.ibm.com>
 <871rl4rxao.fsf@mpe.ellerman.id.au>
From: Hari Bathini <hbathini@linux.ibm.com>
Message-ID: <2037fa32-28be-5995-1c22-c8b01cafe088@linux.ibm.com>
Date: Wed, 22 Jul 2020 23:03:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <871rl4rxao.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_10:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220112
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
Cc: kernel test robot <lkp@intel.com>, Pingfan Liu <piliu@redhat.com>,
 Kexec-ml <kexec@lists.infradead.org>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 22/07/20 9:55 am, Michael Ellerman wrote:
> Hari Bathini <hbathini@linux.ibm.com> writes:
>> Right now purgatory implementation is only minimal. But if purgatory
>> code is to be enhanced to copy memory to the backup region and verify
>> sha256 digest, relocations may have to be applied to the purgatory.
>> So, add support to relocate purgatory in kexec_file_load system call
>> by setting up TOC pointer and applying RELA relocations as needed.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> [lkp: In v1, 'struct mem_sym' was declared in parameter list]
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>
>> * Michael, can you share your opinion on the below:
>>     - https://lore.kernel.org/patchwork/patch/1272027/
>>     - My intention in cover note.
> 
> It seems like a lot of complexity for little benefit.
> 
> AFAICS your final purgatory_64.c is only 36 lines, and all it does is a
> single (open coded) memcpy().
> 
> It seems like we could write that in not many more lines of assembler
> and avoid all this code.

Hi Michael,

I am not sure if you would agree with me on this, but I am looking at the
purgatory code as work in progress. As mentioned in the cover note, I intend
to add log messaging, sha256 verification into purgatory. And also change it
to position independent executable after moving common purgatory code (sha256
verification) to arch-independent code.

When I initially took this up, I wanted to add all the above changes too, but
cut down on it, in the interest of time, first to get kdump (kexec -s -p)
working in v5.9 merge window.

But as the logic in patches 07/12 & 08/12 has been tested in kexec-tools code
a lot of times and there are unlikely to be any changes to them except for
__kexec_do_relocs() function (afaics), when -PIE would be used, I submitted them.
With patch 09/12, I tried for a change that uses relocations while is minimal
for now.

Would you prefer it to be absolutely minimal by dropping patches 7 & 8 for
now and writing the backup data copy code in assembler?

Thanks
Hari
