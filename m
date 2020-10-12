Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 509F328C158
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 21:17:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C97jJ1hmBzDqR2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 06:17:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=khalid.aziz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=iVhJLpjo; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C97gF2SzczDq9l
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 06:15:37 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09CJDlEW058263;
 Mon, 12 Oct 2020 19:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=e7LLkEO6oOyhsGoOKklJm6Moay2fNLlI0j3ff+Zw1hQ=;
 b=iVhJLpjoQ+ueDWP1B+2MErB5kQ+Pg1MEBqYyWQz7MGfjt9dolEfTFk9wWUr1g7XaYZ1h
 3CAFy1WRrzHXIDEkTPMTaLs2uivQUa5M6cJPdgkopysX1E3uxCiQC5fkKQTxXpdPwvVo
 vSMEGJFnpxx+lqAt/5nRbdj8BL0rHr6d4Q0E/9HjoO3/1HQZ7V1McPa0wG6yLjrsX/zY
 HwdrD8/TcJViHpRS6+esRpDHEuRG1L1yq12LuDzxGu70MOj/M0GzNlrZ5bO/N0leSWx/
 Iotpq8gtOMxQV5k6GUHHRxRsqdv84wbTEB6s4Fo5KRrjuLkJdGG5jx40WlI9QVVI4jmF tw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 343vae52r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Oct 2020 19:15:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09CJATMP051832;
 Mon, 12 Oct 2020 19:15:09 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 343pvvbhke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 19:15:09 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09CJF02N014682;
 Mon, 12 Oct 2020 19:15:00 GMT
Received: from [10.65.146.162] (/10.65.146.162)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 12 Oct 2020 12:15:00 -0700
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20201007073932.865218-1-jannh@google.com>
 <d5332a7b-c300-6d28-18b9-4b7d4110ef86@oracle.com>
 <20201010110949.GA32545@gaia>
 <af207cf8-3049-85eb-349d-5fed6b9be49c@oracle.com>
 <20201012172218.GE6493@gaia>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
X-Pep-Version: 2.0
Message-ID: <20c85633-b559-c299-3e57-ae136b201526@oracle.com>
Date: Mon, 12 Oct 2020 13:14:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012172218.GE6493@gaia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9772
 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010120142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9772
 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010120143
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
Cc: Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/12/20 11:22 AM, Catalin Marinas wrote:
> On Mon, Oct 12, 2020 at 11:03:33AM -0600, Khalid Aziz wrote:
>> On 10/10/20 5:09 AM, Catalin Marinas wrote:
>>> On Wed, Oct 07, 2020 at 02:14:09PM -0600, Khalid Aziz wrote:
>>>> On 10/7/20 1:39 AM, Jann Horn wrote:
>>>>> arch_validate_prot() is a hook that can validate whether a given se=
t of
>>>>> protection flags is valid in an mprotect() operation. It is given t=
he set
>>>>> of protection flags and the address being modified.
>>>>>
>>>>> However, the address being modified can currently not actually be u=
sed in
>>>>> a meaningful way because:
>>>>>
>>>>> 1. Only the address is given, but not the length, and the operation=
 can
>>>>>    span multiple VMAs. Therefore, the callee can't actually tell wh=
ich
>>>>>    virtual address range, or which VMAs, are being targeted.
>>>>> 2. The mmap_lock is not held, meaning that if the callee were to ch=
eck
>>>>>    the VMA at @addr, that VMA would be unrelated to the one the
>>>>>    operation is performed on.
>>>>>
>>>>> Currently, custom arch_validate_prot() handlers are defined by
>>>>> arm64, powerpc and sparc.
>>>>> arm64 and powerpc don't care about the address range, they just che=
ck the
>>>>> flags against CPU support masks.
>>>>> sparc's arch_validate_prot() attempts to look at the VMA, but doesn=
't take
>>>>> the mmap_lock.
>>>>>
>>>>> Change the function signature to also take a length, and move the
>>>>> arch_validate_prot() call in mm/mprotect.c down into the locked reg=
ion.
>>> [...]
>>>> As Chris pointed out, the call to arch_validate_prot() from do_mmap2=
()
>>>> is made without holding mmap_lock. Lock is not acquired until
>>>> vm_mmap_pgoff(). This variance is uncomfortable but I am more
>>>> uncomfortable forcing all implementations of validate_prot to requir=
e
>>>> mmap_lock be held when non-sparc implementations do not have such ne=
ed
>>>> yet. Since do_mmap2() is in powerpc specific code, for now this patc=
h
>>>> solves a current problem.
>>>
>>> I still think sparc should avoid walking the vmas in
>>> arch_validate_prot(). The core code already has the vmas, though not
>>> when calling arch_validate_prot(). That's one of the reasons I added
>>> arch_validate_flags() with the MTE patches. For sparc, this could be
>>> (untested, just copied the arch_validate_prot() code):
>>
>> I am little uncomfortable with the idea of validating protection bits
>> inside the VMA walk loop in do_mprotect_pkey(). When ADI is being
>> enabled across multiple VMAs and arch_validate_flags() fails on a VMA
>> later, do_mprotect_pkey() will bail out with error leaving ADI enabled=

>> on earlier VMAs. This will apply to protection bits other than ADI as
>> well of course. This becomes a partial failure of mprotect() call. I
>> think it should be all or nothing with mprotect() - when one calls
>> mprotect() from userspace, either the entire address range passed in
>> gets its protection bits updated or none of it does. That requires
>> validating protection bits upfront or undoing what earlier iterations =
of
>> VMA walk loop might have done.
>=20
> I thought the same initially but mprotect() already does this with the
> VM_MAY* flag checking. If you ask it for an mprotect() that crosses
> multiple vmas and one of them fails, it doesn't roll back the changes t=
o
> the prior ones. I considered that a similar approach is fine for MTE
> (it's most likely a user error).
>=20

You are right about the current behavior with VM_MAY* flags, but that is
not the right behavior. Adding more cases to this just perpetuates
incorrect behavior. It is not easy to roll back changes after VMAs have
potentially been split/merged which is probably why the current code
simply throws in the towel and returns with partially modified address
space. It is lot easier to do all the checks upfront and then proceed or
not proceed with modifying VMAs. One approach might be to call
arch_validate_flags() in a loop before modifying VMAs and walk all VMAs
with a read lock held. Current code also bails out with ENOMEM if it
finds a hole in the address range and leaves any modifications already
made in place. This is another case where a hole could have been
detected earlier.

--
Khalid

