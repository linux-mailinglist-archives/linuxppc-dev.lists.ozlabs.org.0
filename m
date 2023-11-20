Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD557F15EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 15:41:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=QSlc9b0d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYqvx6TsRz3dC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 01:41:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=QSlc9b0d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=embeddedor.com (client-ip=35.89.44.39; helo=omta40.uswest2.a.cloudfilter.net; envelope-from=gustavo@embeddedor.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 340 seconds by postgrey-1.37 at boromir; Tue, 21 Nov 2023 01:41:02 AEDT
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYqv239Sdz3c4t
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 01:41:02 +1100 (AEDT)
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTPS
	id 4qlorSwzuL9Ag55LQraPKe; Mon, 20 Nov 2023 14:33:48 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 55LOrSsoPhDny55LPrM84v; Mon, 20 Nov 2023 14:33:47 +0000
X-Authority-Analysis: v=2.4 cv=fda+dmcF c=1 sm=1 tr=0 ts=655b6e4b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=_mNlVl-r0hj7kTaC:21 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10
 a=nmIWLkHy7FHZmv4hWSMA:9 a=QEXdDO2ut3YA:10 a=N_l3Vs37sht3-TxgB6J7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8wEIEVQGla9Q2o8/H0DInwWp7ImxQruRD0KUO3Cg/i8=; b=QSlc9b0dFyV53FCZAvwU1EX3i5
	cJvnZ2AbW5TFKDJANBwZaWL4VDvEXG/jnt8wo9t7b8qSYR+NydpIY84fawlAPcj/LzpQ40elrxGUU
	T84nkH+Mt87EEy+TYw9LsAwB8AD7aqxdoI5GY8nMyVrmBlsyg9eCGKIwKgFmOpYpQNMEOIfAKu0/f
	JwuBIBmSrMSK+5sU31JWjAfMWzWzs5L8H8TrqWJXSDFdmEpGKzppMhkSp6Zuy9O1QAaPc2wz3xzxY
	STnZ//ZxVqJvXV5AekT6b+TzoEYdiZIKJO/Xe26sbmBRKePHil/eq0QyNuOSYNJg2e2LaXlxrnevy
	iXBQDFtA==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:45848 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r55LO-004IuY-0u;
	Mon, 20 Nov 2023 08:33:46 -0600
Message-ID: <5764b2f5-d0ae-4123-8a40-e4ecbf6908fd@embeddedor.com>
Date: Mon, 20 Nov 2023 08:33:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC - is this a bug?] powerpc/lib/sstep: Asking for some light
 on this, please. :)
Content-Language: en-US
To: Naveen N Rao <naveen@kernel.org>
References: <6a8bf78c-aedb-4d5a-b0aa-82a51a17b884@embeddedor.com>
 <kheudo7mk4dtjtkble2hdgsc4eod336oirsq3xj4so2upsbjzu@gx3wydlzshru>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <kheudo7mk4dtjtkble2hdgsc4eod336oirsq3xj4so2upsbjzu@gx3wydlzshru>
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
X-Exim-ID: 1r55LO-004IuY-0u
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:45848
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFmAlrv2mGMG9696dDVE+9cUd4ct+7HwwQNVpwMw5aIinie5hAGCB4WSoMlHEB5bSAqzEy+tEj1RO23zZ/UwxwlgPgyzXUuZ2zUDqqYQ3qFTiO/7suZ5
 zHEI/AbxQMPXtUfwgS+HZOH4K06tr8PPiFvXAIjuBJ/0zZ8JoG+yjZpxeYSj0cVCAf8/SB8FfN1fRwIA1REO3xr+S/ld/yPxXfso/PhYn8i/J1OdsAl48zQE
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



On 11/20/23 08:25, Naveen N Rao wrote:
> On Fri, Nov 17, 2023 at 12:36:01PM -0600, Gustavo A. R. Silva wrote:
>> Hi all,
>>
>> I'm trying to fix the following -Wstringop-overflow warnings, and I'd like
>> to get your feedback on this, please:
>>
>> In function 'do_byte_reverse',
>>      inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib/sstep.c:722:3,
>>      inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3510:9:
>> arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
>>    287 |                 up[3] = tmp;
>>        |                 ~~~~~~^~~~~
>> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
>> arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into destination object 'u' of size 16
>>    708 |         } u;
>>        |           ^
>> In function 'do_byte_reverse',
>>      inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib/sstep.c:722:3,
>>      inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3510:9:
>> arch/powerpc/lib/sstep.c:289:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
>>    289 |                 up[2] = byterev_8(up[1]);
>>        |                 ~~~~~~^~~~~~~~~~~~~~~~~~
>> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
>> arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into destination object 'u' of size 16
>>    708 |         } u;
>>        |           ^
>> In function 'do_byte_reverse',
>>      inlined from 'do_vec_load' at /home/gus/linux/arch/powerpc/lib/sstep.c:691:3,
>>      inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3439:9:
>> arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
>>    287 |                 up[3] = tmp;
>>        |                 ~~~~~~^~~~~
>> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
>> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
>>    681 |         } u = {};
>>        |           ^
>> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
>> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
>>
>> The origing of the issue seems to be the following calls to function `do_vec_store()`, when
>> `size > 16`, or more precisely when `size == 32`
>>
>> arch/powerpc/lib/sstep.c:
>> 3436         case LOAD_VMX:
>> 3437                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
>> 3438                         return 0;
>> 3439                 err = do_vec_load(op->reg, ea, size, regs, cross_endian);
>> 3440                 break;
>> ...
>> 3507         case STORE_VMX:
>> 3508                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
>> 3509                         return 0;
>> 3510                 err = do_vec_store(op->reg, ea, size, regs, cross_endian);
>> 3511                 break;
> 
> LOAD_VMX and STORE_VMX are set in analyse_instr() and size does not
> exceed 16. So, the warning looks incorrect to me.

Does that mean that this piece of code is never actually executed:

  281         case 32: {
  282                 unsigned long *up = (unsigned long *)ptr;
  283                 unsigned long tmp;
  284
  285                 tmp = byterev_8(up[0]);
  286                 up[0] = byterev_8(up[3]);
  287                 up[3] = tmp;
  288                 tmp = byterev_8(up[2]);
  289                 up[2] = byterev_8(up[1]);
  290                 up[1] = tmp;
  291                 break;
  292         }

or rather, under which conditions the above code is executed, if any?

Thanks!
--
Gustavo
