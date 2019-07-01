Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A67B5BA3D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 12:59:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ckrb3hbRzDqTj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 20:58:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ckpt4pjtzDqT4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 20:57:25 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x61Av7M1034905
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Jul 2019 06:57:21 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tfgnmrswm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 06:57:20 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Mon, 1 Jul 2019 11:57:19 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Jul 2019 11:57:15 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x61AvFCE46137400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 10:57:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE5DB52050;
 Mon,  1 Jul 2019 10:57:14 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.81.231])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BB4865204F;
 Mon,  1 Jul 2019 10:57:13 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/mm/nvdimm: Add an informative message if we fail
 to allocate altmap block
In-Reply-To: <CAOSf1CH_X7TG7Cato4hBt+U5=5HHHwR3hXQYC-z_GiBQiWnB1w@mail.gmail.com>
References: <20190629073813.12973-1-aneesh.kumar@linux.ibm.com>
 <CAOSf1CH_X7TG7Cato4hBt+U5=5HHHwR3hXQYC-z_GiBQiWnB1w@mail.gmail.com>
Date: Mon, 01 Jul 2019 16:27:12 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19070110-0012-0000-0000-0000032E23E1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070110-0013-0000-0000-000021676CE6
Message-Id: <874l46nhtj.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010136
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:

> On Sat, Jun 29, 2019 at 5:39 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> Allocation from altmap area can fail based on vmemmap page size used. Add kernel
>> info message to indicate the failure. That allows the user to identify whether they
>> are really using persistent memory reserved space for per-page metadata.
>>
>> The message looks like:
>> [  136.587212] altmap block allocation failed, falling back to system memory
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/mm/init_64.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
>> index a4e17a979e45..57c0573650dc 100644
>> --- a/arch/powerpc/mm/init_64.c
>> +++ b/arch/powerpc/mm/init_64.c
>> @@ -194,8 +194,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>                  * fail due to alignment issues when using 16MB hugepages, so
>>                  * fall back to system memory if the altmap allocation fail.
>>                  */
>> -               if (altmap)
>> +               if (altmap) {
>>                         p = altmap_alloc_block_buf(page_size, altmap);
>> +                       if (!p)
>
>> +                               pr_info("altmap block allocation failed, " \
>> +                                       "falling back to system memory");
>
> I think this is kind of misleading. If you're mapping a large amount
> of memory you can have most of the vmemmap backing allocated from the
> altmap and one extra block allocated from normal memory. E.g. If you
> have 32MB of altmap space, one 16MB block will be allocated from the
> altmap, but the 2nd 16MB block is probably unusable due to the
> reserved pages at the start of the altmap. Maybe this should be a
> pr_debug() so it's only printed along with the "vmemmap_populate ..."
> message above?

Will switch to pr_debug. What I really wanted was an indication of which
pfn device failed to allocate  per page meata data in the device. But
we really don't have device details here and we don't end up calling
this function if there is already a 16MB mapping in DRAM for this area.

>
> Also, isn't kernel style to keep printf()s, even long ones, on one line?

I was not sure. It do print to kernel log in one line.

-aneesh

