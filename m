Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 516454A163
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 15:01:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SpB02Tm8zDqVS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 23:01:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Sp7159slzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 22:58:52 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5ICpZiw003440
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 08:58:50 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t6xjk57t4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 08:58:49 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 18 Jun 2019 13:58:48 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 13:58:46 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5ICwjSi37159174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 12:58:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45E1CAC05B;
 Tue, 18 Jun 2019 12:58:45 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76591AC05E;
 Tue, 18 Jun 2019 12:58:43 +0000 (GMT)
Received: from [9.85.81.6] (unknown [9.85.81.6])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jun 2019 12:58:43 +0000 (GMT)
Subject: Re: [PATCH] powerpc/mm: Ensure Huge-page memory is free before
 allocation
To: Michael Ellerman <mpe@ellerman.id.au>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Paul Mackerras <paulus@ozlabs.org>
References: <20190618044609.19997-1-vaibhav@linux.ibm.com>
 <87v9x3p04l.fsf@concordia.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Tue, 18 Jun 2019 18:28:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87v9x3p04l.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19061812-0052-0000-0000-000003D25DC6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011284; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01219743; UDB=6.00641599; IPR=6.01000884; 
 MB=3.00027359; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-18 12:58:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061812-0053-0000-0000-0000615E182F
Message-Id: <9c0e4f8e-49ff-7d23-c1a3-c6859da089aa@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=954 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906180106
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
Cc: Hari Bathini <hbathini@linux.vnet.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/18/19 5:37 PM, Michael Ellerman wrote:
> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>> We recently discovered an bug where physical memory meant for
>> allocation of Huge-pages was inadvertently allocated by another component
>> during early boot.
> 
> Can you give me some more detail on what that was? You're seemingly the
> only person who's ever hit this :)
> 
>> The behavior of memblock_reserve() where it wont
>> indicate whether an existing reserved block overlaps with the
>> requested reservation only makes such bugs hard to investigate.
>>
>> Hence this patch proposes adding a memblock reservation check in
>> htab_dt_scan_hugepage_blocks() just before call to memblock_reserve()
>> to ensure that the physical memory thats being reserved for is not
>> already reserved by someone else. In case this happens we panic the
>> the kernel to ensure that user of this huge-page doesn't accidentally
>> stomp on memory allocated to someone else.
> 
> Do we really need to panic? Can't we just leave the block alone and not
> register it as huge page memory? With a big warning obviously.
> 

I need to check this again with Paul. But IIRC we have issues w.r.t hash 
page table size, if we use 16G pages as 64K mapped pages. ie, hypervisor 
create hash page table size with the assumptions that these pfns will 
only be mapped as 16G pages. If we try to put 64K hash pte entries  for 
them we will not have enough space in hash page table.

That is one of the reason we never allowed freeing the hugetlb reserved 
pool with 16G pages back to buddy.


Note: We should switch that BUG to panic. I guess using BUG that early 
don't work.

-aneesh

