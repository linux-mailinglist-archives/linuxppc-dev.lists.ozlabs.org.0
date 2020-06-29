Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEAF20CCBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 08:25:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wHXc37XyzDqY4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 16:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wHVr527pzDqSv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 16:23:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49wHVr35gbz8tTx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 16:23:32 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49wHVr2Xgtz9sQx; Mon, 29 Jun 2020 16:23:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49wHVq6CpPz9sRk
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Jun 2020 16:23:31 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05T62F0i179145; Mon, 29 Jun 2020 02:23:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31xkqjaqjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 02:23:17 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05T62PWK179837;
 Mon, 29 Jun 2020 02:23:17 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31xkqjaqht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 02:23:17 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05T6L5Tu011514;
 Mon, 29 Jun 2020 06:23:15 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 31wwr80whk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 06:23:15 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05T6NCjx2621908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 06:23:12 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46019A4053;
 Mon, 29 Jun 2020 06:23:12 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14DC8A405B;
 Mon, 29 Jun 2020 06:23:09 +0000 (GMT)
Received: from [9.102.0.109] (unknown [9.102.0.109])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Jun 2020 06:23:08 +0000 (GMT)
Subject: Re: [PATCH 02/11] powerpc/kexec_file: mark PPC64 specific code
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
 <159319829236.16351.3935863082429593906.stgit@hbathini.in.ibm.com>
 <68d59c00-da02-b362-7bd9-a9631eca0fdd@csgroup.eu>
From: Hari Bathini <hbathini@linux.ibm.com>
Message-ID: <29542b4a-eb44-5330-60e8-c0b0d294d72f@linux.ibm.com>
Date: Mon, 29 Jun 2020 11:53:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <68d59c00-da02-b362-7bd9-a9631eca0fdd@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-29_04:2020-06-26,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 mlxscore=0 adultscore=0 clxscore=1011 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 cotscore=-2147483648
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006290039
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe

Thanks for the review...

On 27/06/20 12:12 pm, Christophe Leroy wrote:
> 
> 
> Le 26/06/2020 à 21:04, Hari Bathini a écrit :
>> Some of the kexec_file_load code isn't PPC64 specific. Move PPC64
>> specific code from kexec/file_load.c to kexec/file_load_64.c. Also,
>> rename purgatory/trampoline.S to purgatory/trampoline_64.S in the
>> same spirit.
> 
> At the time being, CONFIG_KEXEC_FILE depends on PPC64.

Right.

> Are you planning to make it work on PPC32 as well ?

No.

> Otherwise I don't understand the purpose of this patch.

But I want to make sure the changes I am adding in this series do not
get in the way of adding PPC32 changes whenever they are submitted as there
is common code currently and some more of it in the changes I am adding
in this series...

> Also, what is being done in this patch seems to go far beyond what you describe above.> It is propably worth splitting in several patches with proper explanation.

Hmmm.. I don't see any other reason beyond what I mentioned above.
Will try to split the patch but the changelog would still be the same, afaics.

> Christophe
> 
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/kexec.h       |   11 +++
>>   arch/powerpc/kexec/Makefile            |    2 -
>>   arch/powerpc/kexec/elf_64.c            |    7 +-
>>   arch/powerpc/kexec/file_load.c         |   37 ++--------
>>   arch/powerpc/kexec/file_load_64.c      |  108 ++++++++++++++++++++++++++++++
>>   arch/powerpc/purgatory/Makefile        |    4 +
>>   arch/powerpc/purgatory/trampoline.S    |  117 --------------------------------
>>   arch/powerpc/purgatory/trampoline_64.S |  117 ++++++++++++++++++++++++++++++++
>>   8 files changed, 248 insertions(+), 155 deletions(-)
>>   create mode 100644 arch/powerpc/kexec/file_load_64.c
>>   delete mode 100644 arch/powerpc/purgatory/trampoline.S
>>   create mode 100644 arch/powerpc/purgatory/trampoline_64.S

Thanks
Hari
