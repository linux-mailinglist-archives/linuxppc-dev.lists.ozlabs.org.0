Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 310B4DBE0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 09:12:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vcfN5DmtzDrRX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 18:11:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vcbt5WJHzDrQ4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 18:09:46 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9I77sRW104360
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 03:09:43 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vq6g6v0vb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 03:09:42 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Fri, 18 Oct 2019 08:09:36 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 18 Oct 2019 08:09:32 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9I79WVa54657042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Oct 2019 07:09:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00C3B11C054;
 Fri, 18 Oct 2019 07:09:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97BF911C050;
 Fri, 18 Oct 2019 07:09:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Oct 2019 07:09:31 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 74FE2A022E;
 Fri, 18 Oct 2019 18:09:29 +1100 (AEDT)
Subject: Re: [PATCH v3 06/15] powerpc/32: prepare for CONFIG_VMAP_STACK
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com, dja@axtens.net
References: <cover.1568106758.git.christophe.leroy@c-s.fr>
 <7e9771a56539c58dcd8a871c3dfbe7a932e427b0.1568106758.git.christophe.leroy@c-s.fr>
 <d181b762-3e7b-7a0a-2505-54ead241456d@linux.ibm.com>
 <baff8ef3-a3c6-c6e2-732f-4d521d92140b@c-s.fr>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 18 Oct 2019 18:09:29 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <baff8ef3-a3c6-c6e2-732f-4d521d92140b@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101807-4275-0000-0000-000003733550
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101807-4276-0000-0000-000038865061
Message-Id: <d3908c21-553a-029e-d671-2cd3628776dc@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-18_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=688 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910180068
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18/10/19 5:46 pm, Christophe Leroy wrote:
> 
> 
> Le 17/10/2019 à 09:36, Andrew Donnellan a écrit :
>> On 10/9/19 7:16 pm, Christophe Leroy wrote:
>>> +#if defined(CONFIG_VMAP_STACK) && CONFIG_THREAD_SHIFT < PAGE_SHIFT
>>> +#define THREAD_SHIFT        PAGE_SHIFT
>>> +#else
>>>   #define THREAD_SHIFT        CONFIG_THREAD_SHIFT
>>> +#endif
>>>
>>>   #define THREAD_SIZE        (1 << THREAD_SHIFT)
>>>
>>
>> Looking at 64-bit book3s: with 64K pages, this results in a 
>> THREAD_SIZE that's too large for immediate mode arithmetic operations, 
>> which is annoying. Hmm.
>>
> 
> Which operation are you thinking about ?
> 
> For instance, 'addi' can't be used anymore, but 'addis' can.

Right, I didn't look too closely - yes, they're "addi"s. But also 
DS-form stores:

	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)

Anyway, this is just the first thing that broke when I wondered whether 
a ppc64le_defconfig would even build if I just switched on VMAP_STACK, 
I'll work around it

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

