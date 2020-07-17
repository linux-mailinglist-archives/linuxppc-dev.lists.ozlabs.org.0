Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0F22326B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 06:36:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7JH40JxFzDrC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 14:36:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Htd1vtfzDr1D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 14:18:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B7Htc3MTbz8tQV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 14:18:48 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B7Htc1dM0z9sRf; Fri, 17 Jul 2020 14:18:48 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B7Htb3jQvz9sRW
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Jul 2020 14:18:47 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H4IRsY125396; Fri, 17 Jul 2020 00:18:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 329r21chj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 00:18:41 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06H4IfVc126964;
 Fri, 17 Jul 2020 00:18:41 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 329r21ch61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 00:18:41 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H4An6u008164;
 Fri, 17 Jul 2020 04:17:32 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 327527k6bk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 04:17:32 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06H4G6LP28049780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 04:16:06 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 870D85205A;
 Fri, 17 Jul 2020 04:17:29 +0000 (GMT)
Received: from [9.102.1.129] (unknown [9.102.1.129])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 50F8052057;
 Fri, 17 Jul 2020 04:17:26 +0000 (GMT)
Subject: Re: [PATCH v3 06/12] ppc64/kexec_file: restrict memory usage of kdump
 kernel
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466091925.24747.6840028682768745598.stgit@hbathini.in.ibm.com>
 <87365s9ysj.fsf@morokweng.localdomain>
 <baa29ea9-7698-a7e8-e5a4-c9f842e1fcc8@linux.ibm.com>
 <875zance3n.fsf@morokweng.localdomain>
From: Hari Bathini <hbathini@linux.ibm.com>
Message-ID: <f1e6f1d4-5052-ce6a-747f-bb821987b75a@linux.ibm.com>
Date: Fri, 17 Jul 2020 09:47:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <875zance3n.fsf@morokweng.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_11:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 lowpriorityscore=0
 bulkscore=0 adultscore=0 spamscore=100 mlxscore=100 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxlogscore=-1000 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007170025
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
Cc: Pingfan Liu <piliu@redhat.com>, Petr Tesarik <ptesarik@suse.cz>,
 Nayna Jain <nayna@linux.ibm.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 17/07/20 3:33 am, Thiago Jung Bauermann wrote:
> 
> Hari Bathini <hbathini@linux.ibm.com> writes:
> 
>> On 16/07/20 4:22 am, Thiago Jung Bauermann wrote:
>>>
>>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>>

<snip>
 
>>>> +	 * each representing a memory range.
>>>> +	 */
>>>> +	ranges = (len >> 2) / (n_mem_addr_cells + n_mem_size_cells);
>>>> +
>>>> +	for (i = 0; i < ranges; i++) {
>>>> +		base = of_read_number(prop, n_mem_addr_cells);
>>>> +		prop += n_mem_addr_cells;
>>>> +		end = base + of_read_number(prop, n_mem_size_cells) - 1;
>>
>> prop is not used after the above.
>>
>>> You need to `prop += n_mem_size_cells` here.
>>
>> But yeah, adding it would make it look complete in some sense..
> 
> Isn't it used in the next iteration of the loop?

Memory@XXX/reg typically has only one range. I was looking at it
from that perspective which is not right. Will update.

Thanks
Hari
