Return-Path: <linuxppc-dev+bounces-472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D395D9C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2024 01:43:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WrGq94FWDz2yNJ;
	Sat, 24 Aug 2024 09:43:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724456613;
	cv=none; b=fzHm3SMDCm5qw/zzQCEUh08B53KW6JVbYIWgwULiki+lk/gOdXh0bKjMjBVFeGLP/Asqnk0bUfMHmgGlnXMdU3vNoRUEYw5pjr2FV7+tgou/NmLpFNrbi/JaV+iYHo5xDCthkec4NxaZfWUXfTzzihPq3bCirD19os2/5ZtDqeFWtglidwoAP6rB266HpZYPVDFHEtGnB9lmzEkwzEiUZ/q5aVtXJIeq+eA5aKP1wzH/VCvWcqN5bNkNsEhQcyqhIGngXBNzmxvmcDoQcbJuy9qguTtrfnX1qD+jz6A+NcNVgn4EGeXrxLUHX7CZvW8p+r/hIJ0Vj5idzB1RkjPg8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724456613; c=relaxed/relaxed;
	bh=R7I1uBnhEhOKBlQUhS7kHGTlUcfRgLn9WhZ/VYd/7F0=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=UemL6VXf7nQJcHEEQCHkg4jb78wcjv2ZUhzr3+4cYOmuQTSKj3g6AUUNdYqoSEj97wuljyqhaDikLJy8AuoL4tf+66fhS8dYHTktMx4j06WR3nmiXLlVFZabj8HpV+w6fO6X/OF3J4sKrhbc1aU4Hjn2Yoi5/5bKIIpkzNH9penlhAxE35UQujdYgKQjo83woEm4WydWVtFuXRdHjvyei3X/Sj3fjwgq62uHGrrQ4O2r+ICZJ9xMrFxtVDKZcYBmZ/ebaneb5+tiVJ8zNtYbJtRJiN3o3kJFdkF1gGGeU133HNsgScGBwLPAwyqmRPBDro/90DiugufrKCRlavFtqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YFwyQvEf; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=chunkeey@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YFwyQvEf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=chunkeey@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WrGq83BZkz2yGD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 09:43:30 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5bed0a2b1e1so1517788a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 16:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724456603; x=1725061403; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7I1uBnhEhOKBlQUhS7kHGTlUcfRgLn9WhZ/VYd/7F0=;
        b=YFwyQvEfX2EZx9xKe/iPwqt1xTtJQBbQmkdOz+GwguqaQ2bF2Ix4eatD/MCpOoK2Yr
         8NnvmiSr7uH/uQ1m4xQ8d2L69QOGQwONYTJEEO2gm1mCDME4d/eDHpcnIzRWlseaWYzd
         6IcTstqp7SIe7WD+i3sENVOOSIob/WpP8MMv7vK1MgJOp3lYcoo2ulozADTNXKsDj+qP
         xI/ZlvdsV1p0RKyXC30MLid/dDwabJa+fIKDUjq+SLyNjkDZHnEp2Qxc0niuN8c+zAEA
         bLsZR22EdGVka/Ss28M7tVhxwjdw2PuSgGeVuSUOt1gOW1ZjDUjEnbxv9rEOsDSQeBSW
         A9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724456603; x=1725061403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7I1uBnhEhOKBlQUhS7kHGTlUcfRgLn9WhZ/VYd/7F0=;
        b=jbLugit+0pqI6oyRuV+BM9bbihDJXmRze0CDpU9HcSs26MlyD7NX0gFRc0JDkIUvPD
         aHrjpkCk8Op0DTtCDydX7idi2PppokWi2c94AX45OIouprLSmt66VTUxy0OIFgXdk1Ek
         lp0MMuW3qItlrTWlWUYyrDKv6lsLFUgdtXlUv54yDQwayPm7rRuaO+LnlNNgPzoNm/RN
         lcqymqcJxgNWA4EToMstRv6YTNFAtpNJhktMG5Buo8FB21nZeGyQfFiR+mYgTQYgz9RF
         P/Tonp8v/IYxfmtuzOKWh+RTXtkLGM/y2iHIeF3Mt1ZSpS1Lq15T+n0Gu7ICwaIFIcDh
         md/g==
X-Forwarded-Encrypted: i=1; AJvYcCUYdE+SYTnTKb1xTQKXpGjTqBzZhULCA9eh6eP/8splQ8pwKGL7L4/oOyHjjAvUmFR6zsxGOPfwg9KrqQ4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyA2rb2JwR/2xoxQpzPXjRsx0oyYTeZsoCp9XDsMKDsQIbiHUWR
	ykGc/RUIrSPpwzHsk5MFlXLo1Hft/pcl7hEiGxRHDgGy6DYHKD8l
X-Google-Smtp-Source: AGHT+IHzF6G4QSBC0eUfzD5aTYYLgTzEdHxc9asDp8KMSoScnuOpfvySF2Fd0lo+2DSjcM42JyCD5g==
X-Received: by 2002:a05:6402:1ec8:b0:5bf:1f8:9493 with SMTP id 4fb4d7f45d1cf-5c0891a8338mr3118257a12.29.1724456602855;
        Fri, 23 Aug 2024 16:43:22 -0700 (PDT)
Received: from shift.daheim (p200300d5ff191e0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff19:1e00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3e89ebsm2617845a12.43.2024.08.23.16.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 16:43:22 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.98)
	(envelope-from <chunkeey@gmail.com>)
	id 1shdw2-00000002QcG-206q;
	Sat, 24 Aug 2024 01:43:21 +0200
Message-ID: <90b971f6-16d6-4a9a-9dc5-40b291376952@gmail.com>
Date: Sat, 24 Aug 2024 01:43:21 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc: warn on emulation of dcbz instruction in
 kernel mode
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Christoph Hellwig <hch@lst.de>
Cc: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Stan Johnson <userm57@yahoo.com>, Finn Thain <fthain@linux-m68k.org>
References: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu>
 <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de>
 <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com>
 <20240822053238.GA2028@lst.de>
 <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com>
 <20240823130600.GI28254@gate.crashing.org> <20240823135459.GA28487@lst.de>
 <20240823191924.GK28254@gate.crashing.org>
Content-Language: en-US
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20240823191924.GK28254@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/23/24 9:19 PM, Segher Boessenkool wrote:
> Hi!
> 
> On Fri, Aug 23, 2024 at 03:54:59PM +0200, Christoph Hellwig wrote:
>> On Fri, Aug 23, 2024 at 08:06:00AM -0500, Segher Boessenkool wrote:
>>> What does "uncached memory" even mean here?  Literally it would be
>>> I=1 memory (uncachEABLE memory), but more likely you want M=0 memory
>>> here ("non-memory memory", "not well-behaved memory", MMIO often).
>>
>> Regular kernel memory vmapped with pgprot_noncached().
> 
> So, I=1 (and G=1).  Caching inhibited and guarded.  But M=1 (memory
> coherence required) as with any other real memory :-)
> 
>>> If memset() is expected to be used with M=0, you cannot do any serious
>>> optimisations to it at all.  If memset() is expected to be used with I=1
>>> it should use a separate code path for it, probably the caller should
>>> make the distinction.
>>
>> DMA coherent memory which uses uncached memory for platforms that
>> do not provide hardware dma coherence can end up just about anywhere
>> in the kernel.  We could use special routines for a few places in
>> the DMA subsystem, but there might be plenty of others.
> 
> Yeah.  It will just be plenty slow, as we see here, that's what the
> warning is for; but it works just fine :-)
> 
> The memset() code itself could chech for the storage attributes, but
> that is probably more expensive than just assuming the happy case.
> Maybe someone could try it out though!

Hmm, Ok! For what's worth I can at least test memset with dcbz+trap and
what it was in 2015, without dcbz in the code path. How about that?

I figured out of all the offenders (ethernet, crypto and sata).
The sata/hard drive would be the most sensitive device to measure any
performance difference. the MyBook Live already had an harddrive
(Seagate ST380815AS (very old)) installed... so I went with that.

I test with OpenWrt, since it has a fully working PowerPC images for
the device, I can use initramfs (so HDD/SDD is idle) and provides a
very bare minimum the hdparm -t "benchmark".
(hdparm -t ... just reads for three seconds and tells you how much it read).

the unmodified 6.6.47 kernel scored:

| Timing buffered disk reads: 220 MB in  3.02 seconds =  72.93 MB/sec
| Timing buffered disk reads: 222 MB in  3.02 seconds =  73.50 MB/sec
| Timing buffered disk reads: 216 MB in  3.00 seconds =  71.94 MB/sec

from what I can tell, each hdparm -t /dev/sda causes ~77000 fix_alignment traps.
(/sys/devices/system/cpu/cpu0/cache/index0/coherency_line_size says it's 32 and
type is obviously "Data". If I'm not mistaken this means ~2400KiB of emulated
dcbz by the trap.)

For the test, I added the "old" memset from
<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/lib/copy_32.S?id=df087e450d7ddc0b15bd8824206d964720b4f5e4#n120>
and replaced 6.6.47's memset in dma_pool_alloc() with it
<https://elixir.bootlin.com/linux/v6.6.47/source/mm/dmapool.c#L435>

now no WARNINGS are triggered and hdparm -t /dev/sda produces:

| Timing buffered disk reads: 220 MB in  3.00 seconds =  73.32 MB/sec
| Timing buffered disk reads: 218 MB in  3.02 seconds =  72.28 MB/sec
| Timing buffered disk reads: 224 MB in  3.03 seconds =  74.02 MB/sec

virtually no benefit?! Well, the HDD could be too slow. Let's try an old SSD:
Samsung 840 Evo 120 GB. This one manages to read 1276 MB in 3.06 seconds = ~416 MB/sec
in the same hdparm -t test on a reasonably modern PC when connected via a
usb3<->sata adapter.

unmodified 6.6.47 kernel:

| Timing buffered disk reads: 356 MB in  3.00 seconds = 118.61 MB/sec
| Timing buffered disk reads: 358 MB in  3.01 seconds = 119.12 MB/sec
| Timing buffered disk reads: 358 MB in  3.01 seconds = 119.03 MB/sec

modified 6.6.47 kernel:

| Timing buffered disk reads: 380 MB in  3.01 seconds = 126.30 MB/sec
| Timing buffered disk reads: 374 MB in  3.00 seconds = 124.61 MB/sec
| Timing buffered disk reads: 382 MB in  3.02 seconds = 126.62 MB/sec

Ok! There's something there. ~4%.

Cheers,
Christian

