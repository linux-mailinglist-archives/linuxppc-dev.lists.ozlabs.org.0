Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D07CE30D184
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 03:28:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVlwy7269zDwkH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:28:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s9QXGcvq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVSRp1YZvzDqmJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 01:51:02 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 112EaXHZ124567; Tue, 2 Feb 2021 09:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+pDqsUCnsTd4Cf9oY/mRPzVfWsCi5eDlErURpCCSq14=;
 b=s9QXGcvqIfqPTr5/Cs5wQKfdksuQEdnAoA9iT4OsEDkT8jyyrH0IQ8y0yrUCGwRQp+z9
 ozEXmVJu8w8d4XKGD4Yjj5ECYncTWc00COqqwNxq0XJXSgTbyYXCyGCRGp/pwd2cWCwV
 qCVXSTNhsBjvkMKN1g8vbJy67ZJ11CNZ7o4mHpg5BGwRDZKmyOPPvWkVt/3vTg+uMRwV
 MjPTYJlv/K1rRA/uFYKfDceY+1+TCxTRrn1MlJCyi2iU4t6DNW2oaShJyneKPiBV3npP
 MqOCdORCYHql/OoS0tCaRuCsOHwPhHz0HZQUpQH/K+XT/Ww2sOoyH4+J/yX9dlIeRR4Y Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f8cggr1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 09:50:47 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 112EaXMP124557;
 Tue, 2 Feb 2021 09:50:40 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f8cggqu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 09:50:40 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112Eiqgf032477;
 Tue, 2 Feb 2021 14:50:27 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 36cy389hkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 14:50:27 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 112EoGZ437945766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 14:50:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4EBDA405F;
 Tue,  2 Feb 2021 14:50:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1556A405B;
 Tue,  2 Feb 2021 14:50:22 +0000 (GMT)
Received: from [9.199.35.92] (unknown [9.199.35.92])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  2 Feb 2021 14:50:22 +0000 (GMT)
Subject: Re: [RFC PATCH 3/6] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
To: Peter Zijlstra <peterz@infradead.org>
References: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
 <20210202091116.196134-3-aneesh.kumar@linux.ibm.com>
 <YBkttA/rS/1ZHY8a@hirez.programming.kicks-ass.net>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <ff04cf20-2197-a61e-929f-0ce4c1c72ab8@linux.ibm.com>
Date: Tue, 2 Feb 2021 20:20:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YBkttA/rS/1ZHY8a@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_06:2021-02-02,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102020096
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
Cc: linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/2/21 4:17 PM, Peter Zijlstra wrote:
> On Tue, Feb 02, 2021 at 02:41:13PM +0530, Aneesh Kumar K.V wrote:
>> pmd/pud_populate is the right interface to be used to set the respective
>> page table entries. Some architectures do assume that set_pmd/pud_at
>> can only be used to set a hugepage PTE. Since we are not setting up a hugepage
>> PTE here, use the pmd/pud_populate interface.
> 
> Since you did the audit, it might be nice to record which architectures
> that are. Also, how much work to fix them?
> 

I didn't audit them completely primarily because I don't follow the page 
table format of other archs. But I guess arm64, s390 appears to make 
that assumption.

Moreover set_pmd_at was added as part of THP patch series.

BTW why should we fix those architectures ? isn't pmd_populate the right 
interface for updating pmd entries other than hugepage pte ?

-aneesh
