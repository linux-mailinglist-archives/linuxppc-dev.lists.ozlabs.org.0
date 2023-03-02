Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC826A79F3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 04:18:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRxBW34ynz3cNb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 14:18:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=05BK9h2o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=palmer@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=05BK9h2o;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRx9Y5nJRz3cFN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 14:17:20 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso1454244pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 19:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677727038;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgpf8cgLJj50M86L5F9BUoIAMwjT++SeEfR1/zwwwE0=;
        b=05BK9h2oN73d+vLQZ8AXICX+yqZH9PJw8eGQwQu3aLpPw/PQkKLBM+zl4FHFPDCMbr
         oT2a7ycW9j4IvNJVs7ZNd3qeiw85Qtha4m0oAo5Q0QiPipyRwzSV4J3XcelEef5d8yqB
         I4KXQDK7qQ+mAPYeZvAqQG78vIyZoGQH/5i1rIXtVNLbcQNF9Kn0gW9O7HWaBv1Z1Hfx
         4q2OGZuaoqmuPypq3KgIWVltCxcy5gmQYJ+016KcQmuC/U0yrGY0o6z+m+PHYIZUzGYI
         1grLiGwuTn7D4jkc5r6I/7tUA73EppBwvM41vkni8yrDAA+aUFBNlGO/ZUE432ubFqlh
         lUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677727038;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgpf8cgLJj50M86L5F9BUoIAMwjT++SeEfR1/zwwwE0=;
        b=22yAr3G9Q+y/9FUJALJjbDPpjc62vgHh18GcVI+JAHeyEdr7LCU/Ko+8Se+Wn77AJa
         ht90S+tfTflenlObJTWNIcY3GjPsT81LfosYAcmf7xr6sh2WsC4pXzETeT4Oyll3HGHS
         0eEcT1EovnHXuzYrFYESwmqNDuzT6xLuKNav5Eu83rkMwRUMhdZds4myhFrhuWID7Eue
         3uoyLcC0ZnS/Z12Qc9HGmcjgzT7Q5oDzhlGX2Io8yRqmHDgYJ6FpTWURlNb5gVopbidv
         7NXUk6awuJDZfeFHNthbkLkLdDL4Ci5CNKEgPHPgsEE61bcilka0IaVjfx2woGb07m4H
         3dHQ==
X-Gm-Message-State: AO0yUKWnAAzIMLTLvtSmfR16CMFc1bNiwdzV7rVFjFHCoT07hL0JrYqw
	xqbxj5hvEIBAFIm9NKcOgltCGQ==
X-Google-Smtp-Source: AK7set9sdV/+BdUm2bBjL395AsIYL1A1j9eCLS8ecMxY0Ws8WD4l1oqL273WzlVwyO1Yv4lm9xFKPQ==
X-Received: by 2002:a05:6a20:1bde:b0:cc:de56:957a with SMTP id cv30-20020a056a201bde00b000ccde56957amr8709472pzb.13.1677727037881;
        Wed, 01 Mar 2023 19:17:17 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id h192-20020a636cc9000000b00502f5cd216bsm8183287pgc.6.2023.03.01.19.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 19:17:16 -0800 (PST)
Date: Wed, 01 Mar 2023 19:17:16 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 18:55:30 PST (-0800)
Subject: Re: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
In-Reply-To: <874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-78901e66-16df-4563-9e2c-3a9744ef2828@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, dave.hansen@linux.intel.com, x86@kernel.org, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, Will Deacon <will@kernel.org>, agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, ysato@users.sourceforge.jp, corbet@lwn.net, linux-sh@vger.kernel.org, deller@gmx.de, chenhuacai@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, geert@linux-m68k.org, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, gor@linux.ibm.com, hca@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>, npiggin@gmail.com, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
  linux-arm-kernel@lists.infradead.org, chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, svens@linux.ibm.com, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 23 Feb 2023 05:09:17 PST (-0800), Arnd Bergmann wrote:
> On Thu, Feb 23, 2023, at 10:54, Alexandre Ghiti wrote:
>> On Wed, Feb 15, 2023 at 2:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>>
>>> On Wed, Feb 15, 2023, at 13:59, Russell King (Oracle) wrote:
>>> > On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
>>> >> From: Palmer Dabbelt <palmer@rivosinc.com>
>>> >>
>>> >> As far as I can tell this is not used by userspace and thus should not
>>> >> be part of the user-visible API.
>>> >>
>>> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>> >
>>> > Looks good to me. What's the merge plan for this?
>>>
>>> The easiest way is probably if I merge it through the whole
>>> series through the asm-generic tree. The timing is a bit
>>> unfortunate as we're just ahead of the merge window, so unless
>>> we really need this in 6.3, I'd suggest that Alexandre resend
>>> the series to me in two weeks with the Acks added in and I'll
>>> pick it up for 6.4.
>>
>> Sorry for the response delay, I was waiting to see if Palmer would
>> merge my KASAN patchset in 6.3 (which he does): I have to admit that
>> fixing the command line size + the KASAN patchset would allow 6.3 to
>> run on syzkaller, which would be nice.
>>
>> If I don't see this merged in 6.3, I'll send another round as you
>> suggested in 1 week now :)
>
> Hi Alexandre,
>
> I have no plans to still pick up the series for 6.3. The patches
> all look fine to me, but it's clearly too late now. What is the
> actual dependency for KASAN, do you just need a longer command
> line or something else? If it's just the command line size,
> I would suggest that Palmer can still pick up a oneline change
> to increase it and refer to this thread in the changelog as a
> reference for why it is not an actual UAPI break.

Sorry for being slow here, I just queued up the original patch in the 
RISC-V tree and intend on sending it for 6.3 -- the main worry was that 
it's a uABi change and we're confident it's not.  It's late, but I'd 
prefer to have this as it should let us start running syzkaller now and 
that'll probably find more bugs than this is likely to trigger.

https://lore.kernel.org/r/mhng-b5f934ff-a9bb-4c2b-9ba6-3ab68312077a@palmer-ri-x1c9a/
