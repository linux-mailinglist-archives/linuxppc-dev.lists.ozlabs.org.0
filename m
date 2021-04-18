Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FC3363717
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 20:00:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNd5Z50Vsz3bqr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 04:00:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rZV+/Htv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=rZV+/Htv; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNd5127Wbz301g
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 03:59:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=DixjZSGhchXGN78hxITF/gn2KSp43gRdNvHSUXdK2NY=; b=rZV+/HtvZfmgPQShevnkqzBc8O
 D5eEh9JGECyRqRzkRU9Sr4ZKJ0MbSj+TjIh/uWEGwoAPJFbgF6QS8G7k2l52pdvu4VPOUsGsmhsMA
 gUpuiXunDeP+TaW6jHndoLsmDvwJfIwu9mWOMXtFQNxGgBLXy1GvuhearB8cQIdultR6rGEQ5bUMd
 ZyrQqUpzxsqvo9jDf03lVv+XCvME+m55fyKYMIaqlnM57cvwynM9dX4XsnKKUwTLT1x0dEtiby0d5
 y092q32zZLNueeDwlUCkO5Tqcp8fDpXTJjMc7MPutYs3W4m2xm73qDZTyLTK0O4WPgtPu34Dy6Jxg
 zU5sJmog==;
Received: from [2601:1c0:6280:3f0::df68]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lYBhx-008O4U-46; Sun, 18 Apr 2021 17:59:45 +0000
Subject: Re: PPC_FPU, ALTIVEC: enable_kernel_fp, put_vr, get_vr
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <7107fcae-5c7a-ac94-8d89-326f2cd4cd33@infradead.org>
 <8b1cb0a2-ed3a-7da0-a73a-febbda528703@csgroup.eu>
 <20210418174648.GN26583@gate.crashing.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bf119bfe-7db1-e7f3-d837-f910635eeebb@infradead.org>
Date: Sun, 18 Apr 2021 10:59:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210418174648.GN26583@gate.crashing.org>
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/18/21 10:46 AM, Segher Boessenkool wrote:
> On Sun, Apr 18, 2021 at 06:24:29PM +0200, Christophe Leroy wrote:
>> Le 17/04/2021 à 22:17, Randy Dunlap a écrit :
>>> Should the code + Kconfigs/Makefiles handle that kind of
>>> kernel config or should ALTIVEC always mean PPC_FPU as well?
>>
>> As far as I understand, Altivec is completely independant of FPU in Theory. 
> 
> And, as far as the hardware is concerned, in practice as well.
> 
>> So it should be possible to use Altivec without using FPU.
> 
> Yup.
> 
>> However, until recently, it was not possible to de-activate FPU support on 
>> book3s/32. I made it possible in order to reduce unneccessary processing on 
>> processors like the 832x that has no FPU.
> 
> The processor has to implement FP to be compliant to any version of
> PowerPC, as far as I know?  So that is all done by emulation, including
> all the registers?  Wow painful.
> 
>> As far as I can see in cputable.h/.c, 832x is the only book3s/32 without 
>> FPU, and it doesn't have ALTIVEC either.
> 
> 602 doesn't have double-precision hardware, also no 64-bit FP registers.
> But that CPU was never any widely used :-)
> 
>> So we can in the future ensure that Altivec can be used without FPU 
>> support, but for the time being I think it is OK to force selection of FPU 
>> when selecting ALTIVEC in order to avoid build failures.
> 
> It is useful to allow MSR[VEC,FP]=1,0 but yeah there are no CPUs that
> have VMX (aka AltiVec) but that do not have FP.  I don't see how making
> that artificial dependency buys anything, but maybe it does?
> 
>>> I have patches to fix the build errors with the config as
>>> reported but I don't know if that's the right thing to do...
> 
> Neither do we, we cannot see those patches :-)

Sure.  I'll post them later today.
They keep FPU and ALTIVEC as independent (build) features.

-- 
~Randy

