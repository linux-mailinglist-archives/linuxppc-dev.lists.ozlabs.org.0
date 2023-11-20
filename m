Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ABD7F1D54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 20:31:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=Fh2uS2ty;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYyL92znSz3cVG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 06:31:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=Fh2uS2ty;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=embeddedor.com (client-ip=35.89.44.35; helo=omta36.uswest2.a.cloudfilter.net; envelope-from=gustavo@embeddedor.com; receiver=lists.ozlabs.org)
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYyKF1dztz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 06:30:39 +1100 (AEDT)
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id 55l4re0hRhqFd59xCrZu4x; Mon, 20 Nov 2023 19:29:06 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 59xBrs0ws97pz59xBrlAZx; Mon, 20 Nov 2023 19:29:05 +0000
X-Authority-Analysis: v=2.4 cv=ULDOoQTy c=1 sm=1 tr=0 ts=655bb381
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=_mNlVl-r0hj7kTaC:21 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10
 a=HmMkN7jR4a0BZ7ki4hoA:9 a=QEXdDO2ut3YA:10 a=N_l3Vs37sht3-TxgB6J7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TN7Qdq0Y88d3B+cMOEVQlrnUUoWOMzy7ZRm+OoU1GB4=; b=Fh2uS2tyz7i+Ypo/bC8O0hY0rG
	nPVtC6UWrOwcDq4i4/Neu6OithxhBsCVLI3JevsecsKLv0KwG9GuiACPqMvVRfCOUxmwM062B4gX5
	cN2tlRLavinril9sG0dLOgPYF7II9Dw79bHz5tIx4ilY6+y296Yy4o6yx2faNjJMdY4VAaSri4PQe
	m1ZYinmGQtmwKrjFsKjYVoiqrWR8n3ZpbxBvkIQaesNt8DEzrHzavvGyKFBrLnBXfyAy3Tdxj4nx+
	zWk1XH7QbjuzU3ZDVsXdO/hPpqL20Y0j4n7vuSCSXiYPIyF+PfRxNz56xB/ZQ6hLvWf38umYn8mpd
	i+MmOicw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:40516 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r59xA-000LYz-1t;
	Mon, 20 Nov 2023 13:29:04 -0600
Message-ID: <dfd4895d-241d-4f09-a6a8-9b1781793226@embeddedor.com>
Date: Mon, 20 Nov 2023 13:29:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC - is this a bug?] powerpc/lib/sstep: Asking for some light
 on this, please. :)
Content-Language: en-US
To: Naveen N Rao <naveen@kernel.org>, Balamuruhan S <bala24@linux.ibm.com>
References: <6a8bf78c-aedb-4d5a-b0aa-82a51a17b884@embeddedor.com>
 <kheudo7mk4dtjtkble2hdgsc4eod336oirsq3xj4so2upsbjzu@gx3wydlzshru>
 <5764b2f5-d0ae-4123-8a40-e4ecbf6908fd@embeddedor.com>
 <duj4s25crkeo7etywq4unqcuhdxc3v3fbx6qkw7mbzq66zsu5d@uz7uslgrooiz>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <duj4s25crkeo7etywq4unqcuhdxc3v3fbx6qkw7mbzq66zsu5d@uz7uslgrooiz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1r59xA-000LYz-1t
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:40516
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNTY1waOWx+/GoJKEOm6S8wKcLq6666mmd/yiRpWq8xIS40PrUWsqLLj0VcF/hdIdOFFO5YqfSG8RRIbwNA7zfJA2gbHxkWtxZTBUNzGtnZ3hwRJ45Qd
 InwPUV3KyDqv+4iOyGx1v5FNrl/kwxNnJ63Wi32abJwRRmL5C0opr++XLbBORMCkmk/qdyn/BQRjHg5L6Bug+2X6a+8f/dsEyC0ogDX1ZnjL2CteOJZaJqHG
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/20/23 09:21, Naveen N Rao wrote:
> On Mon, Nov 20, 2023 at 08:33:45AM -0600, Gustavo A. R. Silva wrote:
>>
>>
>> On 11/20/23 08:25, Naveen N Rao wrote:
>>> On Fri, Nov 17, 2023 at 12:36:01PM -0600, Gustavo A. R. Silva wrote:
>>>> Hi all,
>>>>
>>>> I'm trying to fix the following -Wstringop-overflow warnings, and I'd like
>>>> to get your feedback on this, please:
>>>>
>>>> In function 'do_byte_reverse',
>>>>       inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib/sstep.c:722:3,
>>>>       inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3510:9:
>>>> arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
>>>>     287 |                 up[3] = tmp;
>>>>         |                 ~~~~~~^~~~~
>>>> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
>>>> arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into destination object 'u' of size 16
>>>>     708 |         } u;
>>>>         |           ^
>>>> In function 'do_byte_reverse',
>>>>       inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib/sstep.c:722:3,
>>>>       inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3510:9:
>>>> arch/powerpc/lib/sstep.c:289:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
>>>>     289 |                 up[2] = byterev_8(up[1]);
>>>>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~
>>>> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
>>>> arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into destination object 'u' of size 16
>>>>     708 |         } u;
>>>>         |           ^
>>>> In function 'do_byte_reverse',
>>>>       inlined from 'do_vec_load' at /home/gus/linux/arch/powerpc/lib/sstep.c:691:3,
>>>>       inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3439:9:
>>>> arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
>>>>     287 |                 up[3] = tmp;
>>>>         |                 ~~~~~~^~~~~
>>>> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
>>>> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
>>>>     681 |         } u = {};
>>>>         |           ^
>>>> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
>>>> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
>>>>
>>>> The origing of the issue seems to be the following calls to function `do_vec_store()`, when
>>>> `size > 16`, or more precisely when `size == 32`
>>>>
>>>> arch/powerpc/lib/sstep.c:
>>>> 3436         case LOAD_VMX:
>>>> 3437                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
>>>> 3438                         return 0;
>>>> 3439                 err = do_vec_load(op->reg, ea, size, regs, cross_endian);
>>>> 3440                 break;
>>>> ...
>>>> 3507         case STORE_VMX:
>>>> 3508                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
>>>> 3509                         return 0;
>>>> 3510                 err = do_vec_store(op->reg, ea, size, regs, cross_endian);
>>>> 3511                 break;
>>>
>>> LOAD_VMX and STORE_VMX are set in analyse_instr() and size does not
>>> exceed 16. So, the warning looks incorrect to me.
>>
>> Does that mean that this piece of code is never actually executed:
>>
>>   281         case 32: {
>>   282                 unsigned long *up = (unsigned long *)ptr;
>>   283                 unsigned long tmp;
>>   284
>>   285                 tmp = byterev_8(up[0]);
>>   286                 up[0] = byterev_8(up[3]);
>>   287                 up[3] = tmp;
>>   288                 tmp = byterev_8(up[2]);
>>   289                 up[2] = byterev_8(up[1]);
>>   290                 up[1] = tmp;
>>   291                 break;
>>   292         }
>>
>> or rather, under which conditions the above code is executed, if any?
> 
> Please see git history to understand the commit that introduced that
> code. You can do that by starting with a 'git blame' on the file. You'll
> find that the commit that introduced the above hunk was af99da74333b
> ("powerpc/sstep: Support VSX vector paired storage access
> instructions").
> 
> The above code path is hit via
> do_vsx_load()->emulate_vsx_load()->do_byte_reverse()

It seems there is another path (at least the one that triggers the
-Wstringop-overflow warnings):

emulate_step()->emulate_loadstore()->do_vec_load()->do_byte_reverse()

emulate_step() {
...
if (OP_IS_LOAD_STORE(type)) {
                 err = emulate_loadstore(regs, &op);
                 if (err)
                         return 0;
                 goto instr_done;
         }
...
}

----> emulate_loadstore() {
...
#ifdef CONFIG_ALTIVEC
         case LOAD_VMX:
                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
                         return 0;
                 err = do_vec_load(op->reg, ea, size, regs, cross_endian); // with size == 32
                 break;
#endif
...
#ifdef CONFIG_ALTIVEC
         case STORE_VMX:
                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
                         return 0;
                 err = do_vec_store(op->reg, ea, size, regs, cross_endian); // with size == 32
                 break;
#endif
...
}

----> do_vec_load() // Here is where we have the union of size 16 bytes:
{
...
         union {
                 __vector128 v;
                 u8 b[sizeof(__vector128)];
         } u = {};
...
	if (unlikely(cross_endian))
                 do_byte_reverse(&u.b[ea & 0xf], size);
...
}

----> do_byte_reverse()
{
...
         case 32: {
                 unsigned long *up = (unsigned long *)ptr;  // this is a pointer to u.b
                 unsigned long tmp;

                 tmp = byterev_8(up[0]);
                 up[0] = byterev_8(up[3]);
                 up[3] = tmp;		    // and here...
                 tmp = byterev_8(up[2]);
                 up[2] = byterev_8(up[1]);   // and here we are accessing ptr out-of-bounds
                 up[1] = tmp;
                 break;
         }
...
}

This is where I'm trying to determine if there is a bug. If this path is actually
executed, then it seems we have an issue.

Is it possible that commit af99da74333b overlooked the path described above?

--
Gustavo
