Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC16A6DB4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 18:12:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NBmt2B9mzDqnf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 02:12:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NBdY4mWLzDqbq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 02:06:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46NBdY2G3Dz8swG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 02:06:09 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46NBdX5Swcz9sPT; Wed,  4 Sep 2019 02:06:08 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46NBdV749Jz9sN1
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Sep 2019 02:06:06 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x83FvKkx134945
 for <linuxppc-dev@ozlabs.org>; Tue, 3 Sep 2019 12:06:05 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ustn79y1t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 03 Sep 2019 12:06:04 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 3 Sep 2019 17:06:03 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Sep 2019 17:06:00 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x83G5xqW63176748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 16:05:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 098C9A4053;
 Tue,  3 Sep 2019 16:05:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15517A4057;
 Tue,  3 Sep 2019 16:05:57 +0000 (GMT)
Received: from [9.85.81.203] (unknown [9.85.81.203])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 16:05:56 +0000 (GMT)
Subject: Re: [PATCH v5 01/31] powerpc/fadump: move internal macros/definitions
 to a new header
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630265249.8896.17574594631603225622.stgit@hbathini.in.ibm.com>
 <87zhjlr5yy.fsf@mpe.ellerman.id.au>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Tue, 3 Sep 2019 21:35:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87zhjlr5yy.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19090316-0028-0000-0000-000003972884
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090316-0029-0000-0000-0000245976DB
Message-Id: <1570bf3c-2436-a5b8-69ba-888ccbd38bf1@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=913 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030164
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver <oohall@gmail.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/09/19 4:39 PM, Michael Ellerman wrote:
> Hari Bathini <hbathini@linux.ibm.com> writes:
>> Though asm/fadump.h is meant to be used by other components dealing
>> with FADump, it also has macros/definitions internal to FADump code.
>> Move them to a new header file used within FADump code. This also
>> makes way for refactoring platform specific FADump code.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/fadump.h   |   71 ----------------------------
>>  arch/powerpc/kernel/fadump-common.h |   89 +++++++++++++++++++++++++++++++++++
>>  arch/powerpc/kernel/fadump.c        |    2 +
> 
> I don't like having a header in kernel that's then used in platform
> code. Because we end up having to do gross things like:
> 
>   arch/powerpc/platforms/powernv/opal-core.c:#include "../../kernel/fadump-common.h"
>   arch/powerpc/platforms/powernv/opal-fadump.c:#include "../../kernel/fadump-common.h"
>   arch/powerpc/platforms/pseries/rtas-fadump.c:#include "../../kernel/fadump-common.h"
> 
> 
> I'd rather you put the internal bits in arch/powerpc/include/asm/fadump-internal.h

True. Will put the internal bits in arch/powerpc/include/asm/fadump-internal.h

- Hari

