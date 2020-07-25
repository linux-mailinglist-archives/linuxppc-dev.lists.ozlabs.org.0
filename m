Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C53E22D353
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 02:35:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BD6YD1F3SzF0tS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 10:35:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BD6WM22ttzDrWY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 10:33:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BD6WM0RZ9z8t7D
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 10:33:51 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BD6WM01TSz9sR4; Sat, 25 Jul 2020 10:33:51 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BD6WL3Frkz9sPf
 for <linuxppc-dev@ozlabs.org>; Sat, 25 Jul 2020 10:33:49 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06P0VF2K007882; Fri, 24 Jul 2020 20:33:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32fsbmmkn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 20:33:07 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06P0X5YC011232;
 Fri, 24 Jul 2020 20:33:06 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32fsbmmkn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 20:33:06 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06P0LA8s001214;
 Sat, 25 Jul 2020 00:33:05 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 32brqa096d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Jul 2020 00:33:05 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06P0X2la64553358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 25 Jul 2020 00:33:02 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9335C78060;
 Sat, 25 Jul 2020 00:33:04 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9AA47805C;
 Sat, 25 Jul 2020 00:33:01 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.38.252])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sat, 25 Jul 2020 00:33:01 +0000 (GMT)
References: <159524918900.20855.17709718993097359220.stgit@hbathini.in.ibm.com>
 <159524954805.20855.1164928096364700614.stgit@hbathini.in.ibm.com>
 <875zad6ajx.fsf@morokweng.localdomain>
 <77c606da-8eb2-d831-147b-a204b498c7d7@linux.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 06/12] ppc64/kexec_file: restrict memory usage of kdump
 kernel
In-reply-to: <77c606da-8eb2-d831-147b-a204b498c7d7@linux.ibm.com>
Date: Fri, 24 Jul 2020 21:32:59 -0300
Message-ID: <874kpwsabo.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_10:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007240164
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


Hari Bathini <hbathini@linux.ibm.com> writes:

> On 24/07/20 5:36 am, Thiago Jung Bauermann wrote:
>>
>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>
>>> Kdump kernel, used for capturing the kernel core image, is supposed
>>> to use only specific memory regions to avoid corrupting the image to
>>> be captured. The regions are crashkernel range - the memory reserved
>>> explicitly for kdump kernel, memory used for the tce-table, the OPAL
>>> region and RTAS region as applicable. Restrict kdump kernel memory
>>> to use only these regions by setting up usable-memory DT property.
>>> Also, tell the kdump kernel to run at the loaded address by setting
>>> the magic word at 0x5c.
>>>
>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>> Tested-by: Pingfan Liu <piliu@redhat.com>
>>> ---
>>>
>>> v3 -> v4:
>>> * Updated get_node_path() to be an iterative function instead of a
>>>   recursive one.
>>> * Added comment explaining why low memory is added to kdump kernel's
>>>   usable memory ranges though it doesn't fall in crashkernel region.
>>> * For correctness, added fdt_add_mem_rsv() for the low memory being
>>>   added to kdump kernel's usable memory ranges.
>>
>> Good idea.
>>
>>> * Fixed prop pointer update in add_usable_mem_property() and changed
>>>   duple to tuple as suggested by Thiago.
>>
>> <snip>
>>
>>> +/**
>>> + * get_node_pathlen - Get the full path length of the given node.
>>> + * @dn:               Node.
>>> + *
>>> + * Also, counts '/' at the end of the path.
>>> + * For example, /memory@0 will be "/memory@0/\0" => 11 bytes.
>>
>> Wouldn't this function return 10 in the case of /memory@0?
>
> Actually, it does return 11. +1 while returning is for counting %NUL.
> On top of that we count an extra '/' for root node.. so, it ends up as 11.
> ('/'memory@0'/''\0'). Note the extra '/' before '\0'. Let me handle root node
> separately. That should avoid the confusion.

Ah, that is true. I forgot to count the iteration for the root node.
Sorry about that.

--
Thiago Jung Bauermann
IBM Linux Technology Center
