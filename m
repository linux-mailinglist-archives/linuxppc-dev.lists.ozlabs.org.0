Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0422E32B9AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 19:08:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrMRv70qjz3d27
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 05:08:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrMRb369Nz3bPG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 05:07:52 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DrMRT2KJHz9twsP;
 Wed,  3 Mar 2021 19:07:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Oezy_9lCxP9I; Wed,  3 Mar 2021 19:07:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DrMRT1Nrpz9twsB;
 Wed,  3 Mar 2021 19:07:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D9A88B7E6;
 Wed,  3 Mar 2021 19:07:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mppgCCIWAOu2; Wed,  3 Mar 2021 19:07:49 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A8E2F8B7DB;
 Wed,  3 Mar 2021 19:07:48 +0100 (CET)
Subject: Re: [PATCH v2 0/7] Improve boot command line handling
To: Daniel Walker <danielwa@cisco.com>, Rob Herring <robh@kernel.org>
References: <cover.1614705851.git.christophe.leroy@csgroup.eu>
 <20210302173523.GE109100@zorba>
 <CAL_JsqJ7U8QAbJe3zkZiFPJN4PveHz5TZoPk2S8qQWB6cm5e5Q@mail.gmail.com>
 <20210303173908.GG109100@zorba>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <59b054e8-d85b-fd87-c94d-691af748a2f5@csgroup.eu>
Date: Wed, 3 Mar 2021 19:07:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303173908.GG109100@zorba>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/03/2021 à 18:39, Daniel Walker a écrit :
> On Tue, Mar 02, 2021 at 08:01:01PM -0600, Rob Herring wrote:
>> +Will D
>>
>> On Tue, Mar 2, 2021 at 11:36 AM Daniel Walker <danielwa@cisco.com> wrote:
>>>
>>> On Tue, Mar 02, 2021 at 05:25:16PM +0000, Christophe Leroy wrote:
>>>> The purpose of this series is to improve and enhance the
>>>> handling of kernel boot arguments.
>>>>
>>>> It is first focussed on powerpc but also extends the capability
>>>> for other arches.
>>>>
>>>> This is based on suggestion from Daniel Walker <danielwa@cisco.com>
>>>>
>>>
>>>
>>> I don't see a point in your changes at this time. My changes are much more
>>> mature, and you changes don't really make improvements.
>>
>> Not really a helpful comment. What we merge here will be from whomever
>> is persistent and timely in their efforts. But please, work together
>> on a common solution.
>>
>> This one meets my requirements of moving the kconfig and code out of
>> the arches, supports prepend/append, and is up to date.
> 
> 
> Maintainers are capable of merging whatever they want to merge. However, I
> wouldn't make hasty choices. The changes I've been submitting have been deployed
> on millions of router instances and are more feature rich.
> 
> I believe I worked with you on this change, or something like it,
> 
> https://lkml.org/lkml/2019/3/19/970
> 
> I don't think Christophe has even addressed this.

I thing I have, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/3b4291271ce4af4941a771e5af5cbba3c8fa1b2a.1614705851.git.christophe.leroy@csgroup.eu/

If you see something missing in that patch, can you tell me.

> I've converted many
> architectures, and Cisco uses my changes on at least 4 different
> architecture. With products deployed and tested.

As far as we know, only powerpc was converted in the last series you submitted, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=98106&state=*

> 
> I will resubmit my changes as soon as I can.
> 

Christophe
