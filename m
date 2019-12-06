Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2D4114A8F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 02:39:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TZyQ4xvszDqbt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 12:39:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XhhuwqAD"; 
 dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TZvy1CDszDqZj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 12:37:33 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id w5so2017381pjh.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2019 17:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QFmhbe9ddbtIYeSdC4Wa6/rdFsIq9qRHGhAnGj5nGkM=;
 b=XhhuwqADs6mLxYXgwr9goFhkfDgRSSlIDeSDp3BPh5piuUlXXTwlcYbOlpQpNgMgDu
 YUfilYWd5Pe33/hwFfPgE1+gaEDpZ8RZqKkFOn5Cfx8edqpK6FivqoUZf1C4v5SP03gs
 ytYTOLQ4muvA1/RYOaFlae7Z4g5g8BB/u2hlyjIOesyNVUlbY25a0AtASk2pNlVITADw
 wpXfOm0j2FGxn0IkeMSYMNx6/+QxUgmnfKW86LiGjV0hKmRgftZga+/JnMfKI5jfkHzb
 sKqY9nUqVAdzg1rmSehXuyhqm6A3M/ROZv9PcMPAAvRmx4FNRxZuan4Dv/1RZeh7D9J2
 jEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QFmhbe9ddbtIYeSdC4Wa6/rdFsIq9qRHGhAnGj5nGkM=;
 b=tl3iR4hv7r/kwZgTn1RYsw4dkRrc5sEHub/llPLcHA/gnhFZM2ITi9532f1h1GGmw+
 1y4cRO5tkbjXBvW3jC8ZYHI4+wSMQMyvFxzg9H4ylPU7youg47lzqafknSNA6vUSNi8M
 pi1TDv+MKGUtO2Va4yZ2QYKO6Hr1BpKPA1F07HSq8F1P5PY5gzh59AExH9NzOgyobwqR
 VQOhm3jsnQF58nT9PY8/iqbkaz/wCwKFs3BYsYO8Xynmv4szVMXrmMEfDV/iPPHB5h9j
 UzhY7/ZC9hNXbx7ZC+2PazafFzZOBLowVKHiXB6p8WyUpxk1/YaDc/Fe1XItHsilw2RM
 9Z8Q==
X-Gm-Message-State: APjAAAVqgmWOZ7AcAgp1tM1QqaKcDT43B0Q5MaI61AS6jsTo8D7h+Flo
 fmsArViur2q2l5A3BTkMhlM=
X-Google-Smtp-Source: APXvYqxzIHtC1cYPN+CFT0NVT86qIF5tw1U2wBpSj9uhHmEuxmfJAzpLazXlVC8A19qan9GSD8coaA==
X-Received: by 2002:a17:902:12c:: with SMTP id
 41mr12061982plb.224.1575596250288; 
 Thu, 05 Dec 2019 17:37:30 -0800 (PST)
Received: from ?IPv6:240d:1a:90a:7900:b0a6:2318:ed21:5e5?
 ([240d:1a:90a:7900:b0a6:2318:ed21:5e5])
 by smtp.gmail.com with ESMTPSA id o12sm924967pjf.19.2019.12.05.17.37.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Dec 2019 17:37:29 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <87wobedpit.fsf@mpe.ellerman.id.au>
 <20191203183531.GT24609@gate.crashing.org>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <493a7da7-774c-1515-b43a-80d72c9d3c19@gmail.com>
Date: Thu, 5 Dec 2019 19:37:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191203183531.GT24609@gate.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/3/19 12:35 PM, Segher Boessenkool wrote:
> Hi!
> 
> On Tue, Dec 03, 2019 at 03:03:22PM +1100, Michael Ellerman wrote:
>> Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:
>> I've certainly heard it said that on some OF's the phandle was just ==
>> the address of the internal representation, and I guess maybe for SLOF
>> that is true.
> 
> It is (or was).  In many OFs it is just the effective address of some
> node structure.  SLOF runs with translation off normally.
> 
>> They seem to vary wildly though, eg. on an Apple G5:
> 
> Apple OF runs with translation on usually.  IIRC these are effective
> addresses as well.
> 
> The OF they have on G5 machines is mostly 32-bit, for compatibility is my
> guess (for userland things dealing with addresses from OF, importantly).
> 
>>   $ find /proc/device-tree/ -name phandle | xargs lsprop | head -10
>>   /proc/device-tree/vsp@0,f9000000/veo@f9180000/phandle ff970848
>>   /proc/device-tree/vsp@0,f9000000/phandle ff970360
>>   /proc/device-tree/vsp@0,f9000000/veo@f9080000/phandle ff970730
>>   /proc/device-tree/nvram@0,fff04000/phandle ff967fb8
>>   /proc/device-tree/xmodem/phandle ff9655e8
>>   /proc/device-tree/multiboot/phandle ff9504f0
>>   /proc/device-tree/diagnostics/phandle ff965550
>>   /proc/device-tree/options/phandle ff893cf0
>>   /proc/device-tree/openprom/client-services/phandle ff8925b8
>>   /proc/device-tree/openprom/phandle ff892458
>>
>> That machine does not have enough RAM for those to be 32-bit real
>> addresses. I think Apple OF is running in virtual mode though (?), so
>> maybe they are pointers?
> 
> Yes, I think the default is to have 8MB ram at the top of 4GB (which is
> the physical address of the bootrom, btw) for OF.
> 
>> And on an IBM pseries machine they're a bit all over the place:
>>
>>   /proc/device-tree/cpus/PowerPC,POWER8@40/ibm,phandle 10000040
>>   /proc/device-tree/cpus/l2-cache@2005/ibm,phandle 00002005
>>   /proc/device-tree/cpus/PowerPC,POWER8@30/ibm,phandle 10000030
>>   /proc/device-tree/cpus/PowerPC,POWER8@20/ibm,phandle 10000020
>>   /proc/device-tree/cpus/PowerPC,POWER8@10/ibm,phandle 10000010
>>   /proc/device-tree/cpus/l2-cache@2003/ibm,phandle 00002003
>>   /proc/device-tree/cpus/l2-cache@200a/ibm,phandle 0000200a
>>   /proc/device-tree/cpus/l3-cache@3108/ibm,phandle 00003108
>>   /proc/device-tree/cpus/l2-cache@2001/ibm,phandle 00002001
>>   /proc/device-tree/cpus/l3-cache@3106/ibm,phandle 00003106
>>   /proc/device-tree/cpus/ibm,phandle fffffff8
>>   /proc/device-tree/cpus/l3-cache@3104/ibm,phandle 00003104
>>   /proc/device-tree/cpus/l2-cache@2008/ibm,phandle 00002008
>>   /proc/device-tree/cpus/l3-cache@3102/ibm,phandle 00003102
>>   /proc/device-tree/cpus/l2-cache@2006/ibm,phandle 00002006
>>   /proc/device-tree/cpus/l3-cache@3100/ibm,phandle 00003100
>>   /proc/device-tree/cpus/PowerPC,POWER8@8/ibm,phandle 10000008
>>   /proc/device-tree/cpus/l2-cache@2004/ibm,phandle 00002004
>>   /proc/device-tree/cpus/PowerPC,POWER8@48/ibm,phandle 10000048
>>   /proc/device-tree/cpus/PowerPC,POWER8@38/ibm,phandle 10000038
>>   /proc/device-tree/cpus/l2-cache@2002/ibm,phandle 00002002
>>   /proc/device-tree/cpus/PowerPC,POWER8@28/ibm,phandle 10000028
>>   /proc/device-tree/cpus/l3-cache@3107/ibm,phandle 00003107
>>   /proc/device-tree/cpus/PowerPC,POWER8@18/ibm,phandle 10000018
>>   /proc/device-tree/cpus/l2-cache@2000/ibm,phandle 00002000
>>   /proc/device-tree/cpus/l3-cache@3105/ibm,phandle 00003105
>>   /proc/device-tree/cpus/l3-cache@3103/ibm,phandle 00003103
>>   /proc/device-tree/cpus/l3-cache@310a/ibm,phandle 0000310a
>>   /proc/device-tree/cpus/PowerPC,POWER8@0/ibm,phandle 10000000
>>   /proc/device-tree/cpus/l2-cache@2007/ibm,phandle 00002007
>>   /proc/device-tree/cpus/l3-cache@3101/ibm,phandle 00003101
>>   /proc/device-tree/pci@80000002000001b/ibm,phandle 2000001b
> 
> Some (the 1000xxxx) look like addresses as well.
> 
>>> So the hash array has 64 entries out which only 8 are populated. Using
>>> hash_32() populates 29 entries.
> 
>> On the G5 it's similarly inefficient:
>> [    0.007379] OF: of_populate_phandle_cache(242) Used entries: 31, hashed: 111
> 
>> And some output from a "real" pseries machine (IBM OF), which is
>> slightly better:
>> [    0.129467] OF: of_populate_phandle_cache(242) Used entries: 39, hashed: 81
> 
>> So yeah using hash_32() is quite a bit better in both cases.
> 
> Yup, no surprise there.  And hash_32 is very cheap to compute.
> 
>> And if I'm reading your patch right it would be a single line change to>> switch, so that seems like it's worth doing to me.
> 
> Agreed!
> 
> Btw.  Some OFs mangle the phandles some way, to make it easier to catch
> people using it as an address (and similarly, mangle ihandles differently,
> so you catch confusion between ihandles and phandles as well).  Like a
> simple xor, with some odd number preferably.  You should assume *nothing*
> about phandles, they are opaque identifiers.

For arm32 machines that use dtc to generate the devicetree, which is a
very large user base, we certainly can make assumptions about phandles.
Especially because the complaints about the overhead of phandle based
lookups have been voiced by users of this specific set of machines.

For systems with a devicetree that does not follow the assumptions, the
phandle cache should not measurably increase the overhead of phandle
based lookups.  For these systems, they might not see an overhead
reduction from the existence of the cache and they may or may not
see the overhead reduction.  This was explicitly stated during the
reviews of the possible phandle cache implementation alternatives.

If you have measurements of a system where implementing the phandle
cache increased the overhead, and the additional overhead is a concern
(such as significantly increasing boot time) then please share that
information with us.  Otherwise this is just a theoretical exercise.

-Frank

> 
> 
> Segher
> 

