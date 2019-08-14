Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEAB8CC0A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 08:41:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467g352B5kzDqF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 16:41:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467g1H1L5HzDq5W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:39:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 467g1G38Pkz8tWB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:39:46 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 467g1G2yrYz9sN1; Wed, 14 Aug 2019 16:39:46 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 467g1F2jFCz9sBF
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 16:39:44 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7E6agqY079862
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 02:39:43 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uccsas181-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 02:39:42 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 14 Aug 2019 07:39:40 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 14 Aug 2019 07:39:37 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7E6dZkH54067410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 06:39:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BB0111C04A;
 Wed, 14 Aug 2019 06:39:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21C1C11C054;
 Wed, 14 Aug 2019 06:39:33 +0000 (GMT)
Received: from [9.102.2.18] (unknown [9.102.2.18])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Aug 2019 06:39:32 +0000 (GMT)
Subject: Re: [PATCH v4 05/25] pseries/fadump: introduce callbacks for platform
 specific operations
To: mahesh@linux.vnet.ibm.com
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327675065.27462.14816232938604700506.stgit@hbathini.in.ibm.com>
 <20190812094251.fetkmjyp7ac37ivf@in.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Wed, 14 Aug 2019 12:09:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812094251.fetkmjyp7ac37ivf@in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19081406-0028-0000-0000-0000038F9921
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081406-0029-0000-0000-00002451AB6A
Message-Id: <67f78d52-4c33-1d78-ef66-67267d761794@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140062
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
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/08/19 3:12 PM, Mahesh J Salgaonkar wrote:
> On 2019-07-16 17:02:30 Tue, Hari Bathini wrote:
>> Introduce callback functions for platform specific operations like
>> register, unregister, invalidate & such. Also, define place-holders
>> for the same on pSeries platform.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>  arch/powerpc/kernel/fadump-common.h          |   33 ++++++
>>  arch/powerpc/kernel/fadump.c                 |   47 +--------
>>  arch/powerpc/platforms/pseries/Makefile      |    1 
>>  arch/powerpc/platforms/pseries/rtas-fadump.c |  134 ++++++++++++++++++++++++++
>>  4 files changed, 171 insertions(+), 44 deletions(-)
>>  create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c
>>
>> diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
>> index 09d6161..020d582 100644
>> --- a/arch/powerpc/kernel/fadump-common.h
>> +++ b/arch/powerpc/kernel/fadump-common.h
>> @@ -50,6 +50,12 @@
>>  #define FADUMP_UNREGISTER		2
>>  #define FADUMP_INVALIDATE		3
>>  
>> +/* Firmware-Assited Dump platforms */
>> +enum fadump_platform_type {
>> +	FADUMP_PLATFORM_UNKNOWN = 0,
>> +	FADUMP_PLATFORM_PSERIES,
>> +};
> 
> Do we really need these ? Aren't we hiding all platform specific things
> under fadump_ops functions ? I see that these values are used only for
> assignements and not making any decision in code flow. Am I missing
> anything here ?

True. This isn't really useful. will drop it..

Thanks
Hari

