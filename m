Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 486681ED99D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 01:46:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49clsn5M2MzDqbD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 09:46:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sFtYlr5l; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49clqr67T2zDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 09:44:24 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id a127so2482411pfa.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jun 2020 16:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iMGuXMVQiv7UgbkPm8eC8kQZAJ0MUYH46WoZTblPmJs=;
 b=sFtYlr5lUu3A+vGlnkzOzGsfgV7sioQD+yk+Mmk5E/GexGkiZRAJqB+eky3fdSL93f
 G7o4uLkkXj7Z7+qLf2TE2JgfAe+8aIgICwrubt6FDAAM+tHXFdZFvmPsRq1S5YcwuiUr
 psmSbBUfdhvw2xxnlebHQO6g8+I79YfDx55Z9QOq6mg3XzuCVEiXBLThMah7SU805t2d
 RkfvineMwYGS92FKhF2NAsqGacZDMca9L6kNCsWqskPbR6qOzvyqkzBarr1BkPDgIzF3
 5T0QlcNMyD3IXp0PIdtwbHn7eeEx+K0ktwAveUOuJcorua0X762nM9CzfBpUqLE37zY5
 kpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iMGuXMVQiv7UgbkPm8eC8kQZAJ0MUYH46WoZTblPmJs=;
 b=h2xhbkYx2b7p+bQ0WNN8OrFPCk+v7Oj1r0Kku0iOi21r5bd9z1EcyMxzkqEA4G6Dul
 7Vxi/cOV6FU0hI3QmlsyLzuqqgz4JPs5oIkDTEWbA8yobH32QK6929Mr4HtvQQ7kzbFB
 rQNHAEKWxTAZQQ9B9pziPUoUg6sTUGcY1BcJlq1WcBhVDKsAHp1oBC0p5/s2nd4aN4/+
 Xw1r+Ahe5+Kg04AjuTPgggN2IYL9pW8lBOJnGBJGextKYKYcZRA2SCgPmY/JGQKCfvYS
 un/Fdbi310qWA8+99IOtULFKqjtYklUPeY5tR0bdHxqtCe8gQS7lSEd6nf5EXGelB/1b
 jO0g==
X-Gm-Message-State: AOAM530Z5hx49/AQoqfTMSB13R0hEWy6fDZZzX04rvhBcLltBc9QI/OH
 HX0n5ZESrY8V4JKxYiUijUU=
X-Google-Smtp-Source: ABdhPJw5wgn4TYVBgk1wy0xKz4/d6ZcvskV+gi4p7qWrcgOf9aZoL3+wszzBHxawOMQj/gNcix2FnQ==
X-Received: by 2002:aa7:9d9a:: with SMTP id f26mr1433728pfq.229.1591227861622; 
 Wed, 03 Jun 2020 16:44:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d7sm1102423pfh.78.2020.06.03.16.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 16:44:20 -0700 (PDT)
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
To: Ira Weiny <ira.weiny@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
 <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
Date: Wed, 3 Jun 2020 16:44:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/3/20 2:14 PM, Ira Weiny wrote:
> On Wed, Jun 03, 2020 at 01:57:36PM -0700, Andrew Morton wrote:
>> On Thu, 21 May 2020 10:42:50 -0700 Ira Weiny <ira.weiny@intel.com> wrote:
>>
>>>>>
>>>>> Actually it occurs to me that the patch consolidating kmap_prot is odd for
>>>>> sparc 32 bit...
>>>>>
>>>>> Its a long shot but could you try reverting this patch?
>>>>>
>>>>> 4ea7d2419e3f kmap: consolidate kmap_prot definitions
>>>>>
>>>>
>>>> That is not easy to revert, unfortunately, due to several follow-up patches.
>>>
>>> I have gotten your sparc tests to run and they all pass...
>>>
>>> 08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
>>> Build reference: v5.7-rc4-17-g852b6f2edc0f
>>>
>>> Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
>>> Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
>>> Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
>>> Building sparc32:SS-4:nosmp:initrd ... running ......... passed
>>> Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
>>> Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
>>> Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
>>> Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
>>> Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
>>> Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
>>> Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
>>> Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
>>> Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
>>> Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
>>> Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed
>>>
>>> Is there another test I need to run?
>>
>> This all petered out, but as I understand it, this patchset still might
>> have issues on various architectures.
>>
>> Can folks please provide an update on the testing status?
> 
> I believe the tests were failing for Guenter due to another patch set...[1]
> 
> My tests with just this series are working.
> 
>>From my understanding the other failures were unrelated.[2]
> 
> 	<quote Mike Rapoport>
> 	I've checked the patch above on top of the mmots which already has
> 	Ira's patches and it booted fine. I've used sparc32_defconfig to build
> 	the kernel and qemu-system-sparc with default machine and CPU.
> 	</quote>
> 
> Mike, am I wrong?  Do you think the kmap() patches are still causing issues?
> 

For my part, all I can say is that -next is in pretty bad shape right now.
The summary of my tests says:

Build results:
	total: 151 pass: 130 fail: 21
Qemu test results:
	total: 430 pass: 375 fail: 55

sparc32 smp images in next-20200603 still crash for me with a spinlock
recursion. s390 images hang early in boot. Several others (alpha, arm64,
various ppc) don't even compile. I can run some more bisects over time,
but this is becoming a full-time job :-(.

Guenter
