Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8128E88A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 23:46:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBQwH4yCJzDr8s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 08:46:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=khalid.aziz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=IbW8Otvl; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBQRX3b67zDrDD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 08:24:56 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09ELEgF5054525;
 Wed, 14 Oct 2020 21:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=51BNKsiW5qE6NaIm6zaY6u/ayB56rwx6A3kLDW5+QNk=;
 b=IbW8OtvlhkDvE//wE2IUCqFyQxF1DWqKqmVPPwQ8zPpdQcEcU8Jft8onRFZ5vO47EoXB
 2XSXHKhd/ZvQK5mQXIQACqSSGArm9ML1WsKZCSxltF7nd6eWW5ymsxa3fgF16jXfHXwv
 TZ3EYYaf/5IVkhEAbTPVB5aA/zgZkr6hRDD6iqDyBKBCXFb/aeyDJNGK8uAb/FsuO5QQ
 rW5cRg3ky70yp8sdsVlnyw0wccz64kyxswt8PcgntGC54UHrzeMXvTRz0oMZ//7WZ6Q7
 fC6PCwHPLahDZ81y592NAkGB8A2iOJY5Oa9/wwlkP9SQgv6XuuVyFd/FYHRkGFLm39R6 fQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 3434wksv92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 14 Oct 2020 21:24:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09ELFaQH174951;
 Wed, 14 Oct 2020 21:22:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 344by47uag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 21:22:11 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09ELM1Yu022077;
 Wed, 14 Oct 2020 21:22:06 GMT
Received: from [10.65.149.55] (/10.65.149.55)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 14 Oct 2020 14:22:01 -0700
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20201007073932.865218-1-jannh@google.com>
 <d5332a7b-c300-6d28-18b9-4b7d4110ef86@oracle.com>
 <20201010110949.GA32545@gaia>
 <af207cf8-3049-85eb-349d-5fed6b9be49c@oracle.com>
 <20201012172218.GE6493@gaia>
 <20c85633-b559-c299-3e57-ae136b201526@oracle.com>
 <20201013091638.GA10778@gaia>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
X-Pep-Version: 2.0
Message-ID: <e4c2c56b-3dbe-73dd-ea72-a5378de7de6a@oracle.com>
Date: Wed, 14 Oct 2020 15:21:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201013091638.GA10778@gaia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140148
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010140148
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

On 10/13/20 3:16 AM, Catalin Marinas wrote:
> On Mon, Oct 12, 2020 at 01:14:50PM -0600, Khalid Aziz wrote:
>> On 10/12/20 11:22 AM, Catalin Marinas wrote:
>>> On Mon, Oct 12, 2020 at 11:03:33AM -0600, Khalid Aziz wrote:
>>>> On 10/10/20 5:09 AM, Catalin Marinas wrote:
>>>>> On Wed, Oct 07, 2020 at 02:14:09PM -0600, Khalid Aziz wrote:
>>>>>> On 10/7/20 1:39 AM, Jann Horn wrote:
>>>>>>> arch_validate_prot() is a hook that can validate whether a given =
set of
>>>>>>> protection flags is valid in an mprotect() operation. It is given=
 the set
>>>>>>> of protection flags and the address being modified.
>>>>>>>
>>>>>>> However, the address being modified can currently not actually be=
 used in
>>>>>>> a meaningful way because:
>>>>>>>
>>>>>>> 1. Only the address is given, but not the length, and the operati=
on can
>>>>>>>    span multiple VMAs. Therefore, the callee can't actually tell =
which
>>>>>>>    virtual address range, or which VMAs, are being targeted.
>>>>>>> 2. The mmap_lock is not held, meaning that if the callee were to =
check
>>>>>>>    the VMA at @addr, that VMA would be unrelated to the one the
>>>>>>>    operation is performed on.
>>>>>>>
>>>>>>> Currently, custom arch_validate_prot() handlers are defined by
>>>>>>> arm64, powerpc and sparc.
>>>>>>> arm64 and powerpc don't care about the address range, they just c=
heck the
>>>>>>> flags against CPU support masks.
>>>>>>> sparc's arch_validate_prot() attempts to look at the VMA, but doe=
sn't take
>>>>>>> the mmap_lock.
>>>>>>>
>>>>>>> Change the function signature to also take a length, and move the=

>>>>>>> arch_validate_prot() call in mm/mprotect.c down into the locked r=
egion.
>>>>> [...]
>>>>>> As Chris pointed out, the call to arch_validate_prot() from do_mma=
p2()
>>>>>> is made without holding mmap_lock. Lock is not acquired until
>>>>>> vm_mmap_pgoff(). This variance is uncomfortable but I am more
>>>>>> uncomfortable forcing all implementations of validate_prot to requ=
ire
>>>>>> mmap_lock be held when non-sparc implementations do not have such =
need
>>>>>> yet. Since do_mmap2() is in powerpc specific code, for now this pa=
tch
>>>>>> solves a current problem.
>>>>>
>>>>> I still think sparc should avoid walking the vmas in
>>>>> arch_validate_prot(). The core code already has the vmas, though no=
t
>>>>> when calling arch_validate_prot(). That's one of the reasons I adde=
d
>>>>> arch_validate_flags() with the MTE patches. For sparc, this could b=
e
>>>>> (untested, just copied the arch_validate_prot() code):
>>>>
>>>> I am little uncomfortable with the idea of validating protection bit=
s
>>>> inside the VMA walk loop in do_mprotect_pkey(). When ADI is being
>>>> enabled across multiple VMAs and arch_validate_flags() fails on a VM=
A
>>>> later, do_mprotect_pkey() will bail out with error leaving ADI enabl=
ed
>>>> on earlier VMAs. This will apply to protection bits other than ADI a=
s
>>>> well of course. This becomes a partial failure of mprotect() call. I=

>>>> think it should be all or nothing with mprotect() - when one calls
>>>> mprotect() from userspace, either the entire address range passed in=

>>>> gets its protection bits updated or none of it does. That requires
>>>> validating protection bits upfront or undoing what earlier iteration=
s of
>>>> VMA walk loop might have done.
>>>
>>> I thought the same initially but mprotect() already does this with th=
e
>>> VM_MAY* flag checking. If you ask it for an mprotect() that crosses
>>> multiple vmas and one of them fails, it doesn't roll back the changes=
 to
>>> the prior ones. I considered that a similar approach is fine for MTE
>>> (it's most likely a user error).
>>
>> You are right about the current behavior with VM_MAY* flags, but that =
is
>> not the right behavior. Adding more cases to this just perpetuates
>> incorrect behavior. It is not easy to roll back changes after VMAs hav=
e
>> potentially been split/merged which is probably why the current code
>> simply throws in the towel and returns with partially modified address=

>> space. It is lot easier to do all the checks upfront and then proceed =
or
>> not proceed with modifying VMAs. One approach might be to call
>> arch_validate_flags() in a loop before modifying VMAs and walk all VMA=
s
>> with a read lock held. Current code also bails out with ENOMEM if it
>> finds a hole in the address range and leaves any modifications already=

>> made in place. This is another case where a hole could have been
>> detected earlier.
>=20
> This should be ideal indeed though with the risk of breaking the curren=
t
> ABI (FWIW, FreeBSD seems to do a first pass to check for violations:
> https://github.com/freebsd/freebsd/blob/master/sys/vm/vm_map.c#L2630).

I am not sure I understand where the ABI breakage would be. Are we aware
of apps that intentionally modify address space partially using the
current code? What FreeBSD does seems like a reasonable thing to do. Any
way first thing to do is to update sparc to use arch_validate_flags()
and update sparc_validate_prot() to not peek into vma without lock. I
can do that unless Jann wants to rework this 2 patch series with these
changes.

>=20
> However, I'm not sure it's worth the hassle. Do we expect the user to
> call mprotect() across multiple mixed type mappings while relying on no=

> change if an error is returned? We should probably at least document th=
e
> current behaviour in the mprotect man page.
>=20

Yes, documenting current behavior is definitely a good thing to do.

--
Khalid


