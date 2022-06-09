Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFBE5455FA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 22:52:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJx9H5pNvz3btV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 06:52:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WvxNFub2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WvxNFub2;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJx8W1yLcz3bnS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 06:51:22 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 259Ke1NF031809;
	Thu, 9 Jun 2022 20:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OYb7fmi6uf795mXZci9merV7G1HMLFuosh8C6tmoeMQ=;
 b=WvxNFub2z2o790QvxGHr5lBxOcsro83ZQjCIHUuTRBr8T/j3jV1kSe0W/pfvmDEX7sGk
 6ZOjvCsnOjxt43xobddH0BsLOk/ed4jqJNw+Il96/npQiHroumSYGYQYSr3SNawAKXCi
 5PUWYSovvZZ4O7s8HvX5+7JPuTOArh/ZHnv1Q08XYUnwDzbHZ+16AwG/kiS4naLWrM8t
 u2JcYyYhc3gChtCjU3reN7f2cOoiR3zTj80bwA3FKwi3EA6ajREoD/YTYfV2H2J4Or8K
 MiU9vYuNso0gMajQ+8yDRvFNH25skqWUuJ+NGe8rfnyrB9gxuyTdzXeQvK9Qy395YLN/ vg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gkphpsjf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jun 2022 20:50:49 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 259KehJ9007649;
	Thu, 9 Jun 2022 20:50:49 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gkphpsjem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jun 2022 20:50:48 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 259KLO03010630;
	Thu, 9 Jun 2022 20:50:47 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma04dal.us.ibm.com with ESMTP id 3gfy1anj5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jun 2022 20:50:47 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 259KolRX26018050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jun 2022 20:50:47 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17B13AC059;
	Thu,  9 Jun 2022 20:50:47 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1FE6AC05B;
	Thu,  9 Jun 2022 20:50:45 +0000 (GMT)
Received: from [9.160.59.133] (unknown [9.160.59.133])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jun 2022 20:50:45 +0000 (GMT)
Message-ID: <33844c9a-6721-b2fb-5514-8f04501e990e@linux.ibm.com>
Date: Thu, 9 Jun 2022 13:50:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] powerpc/pci: Add config option for using OF 'reg' for PCI
 domain
Content-Language: en-US
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>
References: <20220609193451.GA525883@bhelgaas>
 <67f021ff-b54c-3e84-756a-d0044d633007@igalia.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <67f021ff-b54c-3e84-756a-d0044d633007@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mDbjLWzOE9MZP5ElMY-yCC-CKkT9UEUh
X-Proofpoint-GUID: V0dvIu7O1Smq4_DxzZAc425-LHHmt850
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_15,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 clxscore=1011 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090076
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
Cc: Guowen Shan <gshan@redhat.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/9/22 13:21, Guilherme G. Piccoli wrote:
> First of all, thanks for looping me Bjorn! Much appreciated.
> I'm also CCing Ben and Gavin, that know a lot of PPC PCI stuff.
> 
> 
> On 09/06/2022 16:34, Bjorn Helgaas wrote:
>> [...]
>>>>>>>>>>> Upgrading powerpc kernels from LTS 4.4 version (which does not
>>>>>>>>>>> contain mentioned commit) to new LTS versions brings a
>>>>>>>>>>> regression in domain assignment.
>>>>>>>>>>
>>>>>>>>>> Can you elaborate why it is a regression ?
>>>>>>>>>> 63a72284b159 That commit says 'no functionnal changes', I'm
>>>>>>>>>> having hard time understanding how a nochange can be a
>>>>>>>>>> regression.
>>>>>>>>>
>>>>>>>>> It is not 'no functional change'. That commit completely changed
>>>>>>>>> PCI domain assignment in a way that is incompatible with other
>>>>>>>>> architectures and also incompatible with the way how it was done
>>>>>>>>> prior that commit.
>>>>>>>>
>>>>>>>> I agree that the "no functional change" statement is incorrect.
>>>>>>>> However, for most powerpc platforms it ended up being simply a
>>>>>>>> cosmetic behavior change. As far as I can tell there is nothing
>>>>>>>> requiring domain ids to increase montonically from zero or that
>>>>>>>> each architecture is required to use the same domain numbering
>>>>>>>> scheme.
> 
> Strongly agree here in both points: first, this was not a "no functional
> change" thing, and I apologize for adding this in the commit message.
> What I meant is that: despite changing the numbering, (as Tyrel said)
> nothing should require increasing monotonic mutable PCI domains. At
> least, I'm not aware of such requirement in any spec or even in the
> kernel and adjacent tooling.
> 
> 
>>>>>>> [...]
>>>>>>>> We could properly limit it to powernv and pseries by using
>>>>>>>> ibm,fw-phb-id instead of reg property in the look up that follows
>>>>>>>> a failed ibm,opal-phbid lookup. I think this is acceptable as long
>>>>>>>> as no other powerpc platforms have started using this behavior for
>>>>>>>> persistent naming.
>>>>>>>
>>>>>>> And what about setting that new config option to enabled by default
>>>>>>> for those series?
> 
> I don't remember all the details about PPC dt, but it should already be
> restricted to pseries/powernv, right? At least, the commit has a comment:
> 
> /* If not pseries nor powernv, or if fixed PHB numbering tried to add
>  * the same PHB number twice, then fallback to dynamic PHB numbering.*/
> 
> If this is *not* restricted to these 2 platforms, I agree with Pali's
> approach, although I'd consider the correct is to keep the persistent
> domain scheme for both pnv and pseries, as it's working like this for 5
> years and counting, and this *does* prevent a lot of issues with PCI
> hotplugging in PPC servers.

I mentioned this in a previous post, but it is clear the Author's intent was for
this only to apply to powernv and pseries platforms. However, it only really
checks for powernv, and if that fails it does a read the reg property for the
domain which works for and PPC platform. If we really only want this on powernv
and pseries and revert all other PPC platforms back we can fix this with a
pseries check instead of a config property. Using ibm,fw-phb-id instead of reg
property if ibm,opal-phbid lookup fails does the trick.

-Tyrel

> 
> 
>>> [...]
>>>> I forgot to ask before about the actual regression here.  The commit
>>>> log says domain numbers are different, but I don't know the connection
>>>> from there to something failing.  I assume there's some script or
>>>> config file that depends on specific domain numbers?  And that
>>>> dependency is (hopefully) powerpc-specific?
>>>
>>> You assume correct. For example this is the way how OpenWRT handles PCI
>>> devices (but not only OpenWRT). This OpenWRT case is not
>>> powerpc-specific but generic to all architectures. This is just one
>>> example.
>>
>> So basically everybody uses D/b/d/f for persistent names.  That's ...
>> well, somewhat stable for things soldered down or in a motherboard
>> slot, but a terrible idea for things that can be hot-plugged.
>>
>> Even for more core things, it's possible for firmware to change bus
>> numbering between boots.  For example, if a complicated hierarchy is
>> cold-plugged into one slot, firmware is likely to assign different bus
>> numbers on the next boot to make room for it.  Obviously this can also
>> happen as a hot-add, and Linux needs the flexibility to do similar
>> renumbering then, although we don't support it yet.
>>
>> It looks like 63a72284b159 was intended to make domain numbers *more*
>> consistent, so it's ironic that this actually broke something by
>> changing domain numbers.  Maybe there's a way to limit the scope of
>> 63a72284b159 so it avoids the breakage.  I don't know enough about the
>> powerpc landscape to even guess at how.
> 
> I don't considereit breaks the userspace since this is definitely no
> stable ABI (or if it is, I'm not aware and my apologies). If scripts
> rely on that, they are doing the wrong thing it seems.
> 
> With that said, I'm definitely not against improving the situation with
> Pali's KConfig - just think that we somehow should keep the persistent
> behavior for powernv and pseries.
> Hopefully PPC folks has more to say on that!
> Cheers,
> 
> 
> Guilherme

