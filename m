Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF3B50E9D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 21:57:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnG5Z10B4z3bph
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 05:57:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qg2UlzpS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qg2UlzpS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnG4n1dwpz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 05:57:12 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PHrtAH018583;
 Mon, 25 Apr 2022 19:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rzOZY05sMrf/EyKUousQ6nG2a/dktO7YtCTvwGbjOuM=;
 b=qg2UlzpS3EuA3J84Ud5upf4v8a/UKSuL5EYUZomON0y0hMP4ceGFJdU3pYK0HdnBoUGM
 AFX4TAg4Nr7gccDkocq3FudHUNjtzsW3gHYJMu2Vy2P52HqVzBy8tQtV6dm6K/PGfL0C
 FD/ZuK2uDvEMJBMoBnZ40YQQp4TFDW/stBTivqZuMvl0agPiDvx4gW78ondPHIV+3C0w
 Dns4CVaBxyBa/7AQ74yA8ZsJaOYHVt1EZo9XpmtXJ2S7rssDM6aFE1hH9/EsgnKOYX7a
 FmyEuMl0wgZUWmgDF0N63IHBngY4tmbMXrAW3CtGrGMw0235W59A5e5j2DRJ2awvdU/S KQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fmtt7jwmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 19:57:04 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23PJcPkd022079;
 Mon, 25 Apr 2022 19:57:03 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3fm939kq6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 19:57:03 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23PJv27K30867730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 19:57:02 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0E346A057;
 Mon, 25 Apr 2022 19:57:02 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 642876A047;
 Mon, 25 Apr 2022 19:57:01 +0000 (GMT)
Received: from [9.160.2.163] (unknown [9.160.2.163])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 25 Apr 2022 19:57:01 +0000 (GMT)
Message-ID: <7426c4c7-b2f2-5453-bdab-a88c7308b212@linux.ibm.com>
Date: Mon, 25 Apr 2022 12:57:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] powerpc/pci: Remove useless null check before call
 of_node_put()
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Haowen Bai <baihaowen@meizu.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <1650509529-27525-1-git-send-email-baihaowen@meizu.com>
 <c4613523-de98-b824-175a-89fd66931bd6@linux.ibm.com>
 <87levv98fa.fsf@mpe.ellerman.id.au>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <87levv98fa.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z3dM67XhDBJtArThUik2_uqDk28TRsRp
X-Proofpoint-ORIG-GUID: z3dM67XhDBJtArThUik2_uqDk28TRsRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_10,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250087
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/23/22 07:32, Michael Ellerman wrote:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> On 4/20/22 19:52, Haowen Bai wrote:
>>> No need to add null check before call of_node_put(), since the
>>> implementation of of_node_put() has done it.
>>>
>>> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
>>> ---
>>>  arch/powerpc/kernel/pci_dn.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
>>> index 61571ae23953..ba3bbc9bec2d 100644
>>> --- a/arch/powerpc/kernel/pci_dn.c
>>> +++ b/arch/powerpc/kernel/pci_dn.c
>>> @@ -357,8 +357,8 @@ void pci_remove_device_node_info(struct device_node *dn)
>>>
>>>  	/* Drop the parent pci_dn's ref to our backing dt node */
>>>  	parent = of_get_parent(dn);
>>> -	if (parent)
>>> -		of_node_put(parent);
>>> +
>>> +	of_node_put(parent);
>>
>> This whole block of code looks useless, or suspect. Examining the rest of the
>> code for this function this is the only place that parent is referenced. The
>> of_get_parent() call returns the parent with its refcount incremented, and then
>> we turn around and call of_node_put() which drops that reference we just took.
>> The comment doesn't do what it says it does. If we really need to drop a
>> previous reference to the parent device node this code block would need to call
>> of_node_put() twice on parent to accomplish that.
> 
> Yeah good analysis.
> 
> It used to use pdn->parent, which didn't grab  an extra reference, see
> commit 14db3d52d3a2 ("powerpc/eeh: Reduce use of pci_dn::node").
> 
> The old code was:
> 
>         if (pdn->parent)
>                 of_node_put(pdn->parent->node);
> 
>> A closer examination is required to determine if what the comment says we need
>> to do is required. If it is then the code as it exists today is leaking that
>> reference AFAICS.
> 
> Yeah. This function is only called from pnv_php.c, ie. powernv PCI
> hotplug, which I think gets less testing than pseries hotplug. So
> possibly we are leaking references and haven't noticed, or maybe the
> comment is out of date.

Looks like we leak it. From pci_add_device_node_info() we clearly take a
reference we don't free:

        /* Attach to parent node */
        INIT_LIST_HEAD(&pdn->child_list);
        INIT_LIST_HEAD(&pdn->list);
        parent = of_get_parent(dn);
        pdn->parent = parent ? PCI_DN(parent) : NULL;
        if (pdn->parent)
                list_add_tail(&pdn->list, &pdn->parent->child_list);

        return pdn;

The question becomes whats the right fix. Doing a double put in the remove path
seems wrong, and looks gross. We no longer store a reference to the parent
device node in pci_dn::parent but instead a reference to the an actual pci_dn
struct. Seems to suggest we can drop the reference taken in
pci_add_device_node_info().

-Tyrel

> 
> cheers

