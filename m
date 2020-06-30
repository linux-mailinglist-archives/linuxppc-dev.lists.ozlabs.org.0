Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC3320EE1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 08:12:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wvD45zLQzDqbW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 16:12:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wvBF6rXGzDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 16:11:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49wvBF3x21z8tTx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 16:11:17 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49wvBF3Fntz9sQx; Tue, 30 Jun 2020 16:11:17 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 49wvBD6Dg9z9s6w
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Jun 2020 16:11:16 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U63gq2123064; Tue, 30 Jun 2020 02:11:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ycj9r50s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 02:11:08 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05U64m3H127517;
 Tue, 30 Jun 2020 02:11:08 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ycj9r4ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 02:11:08 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05U67AWC015032;
 Tue, 30 Jun 2020 06:11:06 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 31wwcgshba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 06:11:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05U6B32l49872896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 06:11:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D9E752050;
 Tue, 30 Jun 2020 06:11:03 +0000 (GMT)
Received: from [9.102.2.126] (unknown [9.102.2.126])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1E51D52051;
 Tue, 30 Jun 2020 06:10:59 +0000 (GMT)
Subject: Re: [PATCH 04/11] ppc64/kexec_file: avoid stomping memory used by
 special regions
To: piliu <piliu@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
 <159319831192.16351.17443438699302756548.stgit@hbathini.in.ibm.com>
 <9cfda789-0747-a67a-b825-5ea6f15099b8@redhat.com>
 <f745de42-297e-6eed-d25b-ea21d6000dc5@linux.ibm.com>
 <283fc181-2331-7c2f-db66-5e02e5ffb2e4@redhat.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Message-ID: <cca6a693-a77f-885e-8ccc-967953f53800@linux.ibm.com>
Date: Tue, 30 Jun 2020 11:40:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <283fc181-2331-7c2f-db66-5e02e5ffb2e4@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_01:2020-06-30,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 cotscore=-2147483648 bulkscore=0 clxscore=1015 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006300046
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
Cc: Kexec-ml <kexec@lists.infradead.org>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 30/06/20 9:00 am, piliu wrote:
> 
> 
> On 06/29/2020 01:55 PM, Hari Bathini wrote:
>>
>>
>> On 28/06/20 7:44 am, piliu wrote:
>>> Hi Hari,
>>
>> Hi Pingfan,
>>
>>>
>>> After a quick through for this series, I have a few question/comment on
>>> this patch for the time being. Pls see comment inline.
>>>
>>> On 06/27/2020 03:05 AM, Hari Bathini wrote:
>>>> crashkernel region could have an overlap with special memory regions
>>>> like  opal, rtas, tce-table & such. These regions are referred to as
>>>> exclude memory ranges. Setup this ranges during image probe in order
>>>> to avoid them while finding the buffer for different kdump segments.
>>
>> [...]
>>
>>>> +	/*
>>>> +	 * Use the locate_mem_hole logic in kexec_add_buffer() for regular
>>>> +	 * kexec_file_load syscall
>>>> +	 */
>>>> +	if (kbuf->image->type != KEXEC_TYPE_CRASH)
>>>> +		return 0;
>>> Can the ranges overlap [crashk_res.start, crashk_res.end]?  Otherwise
>>> there is no requirement for @exclude_ranges.
>>
>> The ranges like rtas, opal are loaded by f/w. They almost always overlap with
>> crashkernel region. So, @exclude_ranges is required to support kdump.
> f/w passes rtas/opal as service, then must f/w mark these ranges as
> fdt_reserved_mem in order to make kernel aware not to use these ranges?

It does. Actually, reserve_map + reserved-ranges are reserved as soon as
memblock allocator is ready but not before crashkernel reservation.
Check early_reserve_mem() call in kernel/prom.c

> Otherwise kernel memory allocation besides kdump can also overwrite
> these ranges.> 
> Hmm, revisiting reserve_crashkernel(). It seems not to take any reserved
> memory into consider except kernel text. Could it work based on memblock
> allocator?

So, kdump could possibly overwrite these regions which is why an exclude
range list is needed. Same thing was done in kexec-tools as well.

Thanks
Hari
