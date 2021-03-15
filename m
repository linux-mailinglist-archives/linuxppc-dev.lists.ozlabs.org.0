Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DEA33C329
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 18:01:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzjPL1fL3z304R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:01:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r4z3FvJZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r4z3FvJZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzjLb0n5bz301v
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 03:59:02 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FGYU6C155550; Mon, 15 Mar 2021 12:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/aMOEnE9e033jBmsFRzzqkt6+ubrNZPIPNO8BScYaWE=;
 b=r4z3FvJZAc/VirHcGxoRxFnRoYcgdmQSPa2sAtyJxp6zRjC+lCHbY0Np8QA59/75PRa9
 E8vQBYe/oa+rAK9BeYAA3G4iarQLoPR8H8qOfr6xeyYm1MLRuE1rCeVbzPvCjnaaiCZw
 3KUJnXP3hq1ZTOHHFc8xzgYtiJxI3Xt29R3vy53LoTTKQTGZP6K2oC06WXtXO5Bbzzgj
 4VYWNfZ3DnuWnLvPNu3w/N/37dhoT55hUsjjSjDQh+/6lZZPQWftUzcm9VVWbraCRFaV
 5LNnMEk64u871EMge399zQUoJ3z9qHKDsDgxXozXgTpOSY1jm0RbCle18Z64JR2tOwR5 hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37aa8rb1qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:59:01 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FGYULv155516;
 Mon, 15 Mar 2021 12:59:00 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37aa8rb1q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:59:00 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FGkpoL021172;
 Mon, 15 Mar 2021 16:58:59 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 378n1a0rah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:58:59 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FGwwQ010748232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:58:58 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 124E3BE053;
 Mon, 15 Mar 2021 16:58:58 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2619BE058;
 Mon, 15 Mar 2021 16:58:56 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.44.137])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:58:56 +0000 (GMT)
Subject: Re: [PATCH] rpadlpar: fix potential drc_name corruption in store
 functions
To: Michael Ellerman <michaele@au1.ibm.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20210310223021.423155-1-tyreld@linux.ibm.com>
 <20210313091751.GM6564@kitsune.suse.cz>
 <a67af978-1c47-c66b-47f0-3d754da738f9@linux.ibm.com>
 <87o8fl3z80.fsf@mpe.ellerman.id.au>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <6b1728cf-c9b7-68fe-f338-3b79210357f2@linux.ibm.com>
Date: Mon, 15 Mar 2021 09:58:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87o8fl3z80.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150113
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
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org, mmc@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/14/21 7:52 PM, Michael Ellerman wrote:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> On 3/13/21 1:17 AM, Michal Suchánek wrote:
>>> On Wed, Mar 10, 2021 at 04:30:21PM -0600, Tyrel Datwyler wrote:
>>>> Both add_slot_store() and remove_slot_store() try to fix up the drc_name
>>>> copied from the store buffer by placing a NULL terminator at nbyte + 1
>>>> or in place of a '\n' if present. However, the static buffer that we
>>>> copy the drc_name data into is not zeored and can contain anything past
>>>> the n-th byte. This is problematic if a '\n' byte appears in that buffer
>>>> after nbytes and the string copied into the store buffer was not NULL
>>>> terminated to start with as the strchr() search for a '\n' byte will mark
>>>> this incorrectly as the end of the drc_name string resulting in a drc_name
>>>> string that contains garbage data after the n-th byte. The following
>>>> debugging shows an example of the drmgr utility writing "PHB 4543" to
>>>> the add_slot sysfs attribute, but add_slot_store logging a corrupted
>>>> string value.
>>>>
>>>> [135823.702864] drmgr: drmgr: -c phb -a -s PHB 4543 -d 1
>>>> [135823.702879] add_slot_store: drc_name = PHB 4543°|<82>!, rc = -19
>>>>
>>>> Fix this by NULL terminating the string when we copy it into our static
>>>> buffer by coping nbytes + 1 of data from the store buffer. The code has
>>> Why is it OK to copy nbytes + 1 and why is it expected that the buffer
>>> contains a nul after the content?
>>
>> It is my understanding that the store function buffer is allocated as a
>> zeroed-page which the kernel copies up to at most (PAGE_SIZE - 1) of user data
>> into. Anything after nbytes would therefore be zeroed.
> 
> I think that's true, but it would be nice if we didn't have to rely on
> that obscure detail in order for this code to be correct & understandable.

I think its a security guarantee, but I guess barring a comment that explicitly
outlines the correctness it probably isn't obvious.

> 
>>> Isn't it much saner to just nul terminate the string after copying?
>>
>> At the cost of an extra line of code, sure.
> 
> Is there a reason we can't use strscpy()? That should deal with all the
> corner cases around the string copy, and then all you have to do is look
> for a newline and turn it into nul.

Fine with me. I'll spin v2 with strscpy().

-Tyrel

> 
> cheers
> 

