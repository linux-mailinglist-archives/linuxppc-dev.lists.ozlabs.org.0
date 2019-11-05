Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0BF03B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 18:03:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476wx35wF3zF3VW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 04:03:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476wtQ4Vf1zF4sm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 04:01:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 476wtP1lgdz8tTf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 04:01:33 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 476wtN3hLjz9sP3; Wed,  6 Nov 2019 04:01:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 476wtM5mdfz9sP7
 for <linuxppc-dev@ozlabs.org>; Wed,  6 Nov 2019 04:01:31 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA5GxoPm089412
 for <linuxppc-dev@ozlabs.org>; Tue, 5 Nov 2019 12:01:28 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w3bbp5sk6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 05 Nov 2019 12:01:24 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 5 Nov 2019 17:01:15 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 5 Nov 2019 17:01:12 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xA5H0b2a15139156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2019 17:00:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4E2D11C04C;
 Tue,  5 Nov 2019 17:01:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 390C011C054;
 Tue,  5 Nov 2019 17:01:10 +0000 (GMT)
Received: from [9.199.51.136] (unknown [9.199.51.136])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Nov 2019 17:01:09 +0000 (GMT)
Subject: Re: [PATCH v2 3/4] Documentation/ABI: mark /sys/kernel/fadump_* sysfs
 files deprecated
To: Sourabh Jain <sourabhjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20191018130557.2217-1-sourabhjain@linux.ibm.com>
 <20191018130557.2217-4-sourabhjain@linux.ibm.com>
 <f69daa7b-ddb3-8190-c409-28a22c504fed@linux.ibm.com>
 <b1bc42cc-8d80-d104-b1b3-684c08531c78@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Tue, 5 Nov 2019 22:31:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b1bc42cc-8d80-d104-b1b3-684c08531c78@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19110517-0012-0000-0000-00000360F5A5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110517-0013-0000-0000-0000219C4FB8
Message-Id: <d0a34f71-1b78-e387-c3a5-d771995a91f6@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911050140
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
Cc: linuxppc-dev@ozlabs.org, mahesh@linux.vnet.ibm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/11/19 2:24 PM, Sourabh Jain wrote:
> 
> 
> On 10/21/19 1:11 PM, Hari Bathini wrote:
>>
>>
>> On 18/10/19 6:35 PM, Sourabh Jain wrote:
>>> The /sys/kernel/fadump_* sysfs files are replicated under
>>
>> [...]
>>
>>> +Note: The following FADump sysfs files are deprecated.
>>> +
>>> +    Deprecated                       Alternative
>>> +    -------------------------------------------------------------------------------
>>> +    /sys/kernel/fadump_enabled           /sys/kernel/fadump/fadump_enabled
>>> +    /sys/kernel/fadump_registered        /sys/kernel/fadump/fadump_registered
>>> +    /sys/kernel/fadump_release_mem       /sys/kernel/fadump/fadump_release_mem
>>
>> /sys/kernel/fadump/* looks tidy instead of /sys/kernel/fadump/fadump_* 
>> I mean, /sys/kernel/fadump/fadump_enabled => /sys/kernel/fadump/enabled and such..
> 
> 
> 
> Could you please confirm whether you want to address the sysfs file path differently or
> actually changing the sysfs file name from fadump_enabled to enabled.

I meant, given the path "/sys/kernel/fadump/", the prefix fadump_ is redundant.
If there are no conventions that we should retain the same file name, I suggest
to drop the fadump_ prefix and just call them enabled, registered, etc..

- Hari

