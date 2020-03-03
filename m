Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D42F2177327
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 10:53:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wsm43Ts4zDqc5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 20:53:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=ZxaMTWs2; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wsgp3CyBzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 20:50:13 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id u26so2754692ljd.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 01:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+pqUVa+iJKiYfmtbwFgOUkAfBLkxAe1OkEI8zp9rAOM=;
 b=ZxaMTWs2PhvP02bSlCREiq8B2pCaEG1FDmQey3np0Y3cOhBemusIY+fwbWw25gSUNa
 h2mhj89Mt8TCJ8Qi0hUnHnmMdpNTX4zjQEgAb9v7JnQqKzDBN85eINkJIvna0BCet6Jm
 VH+IR8wTtDn7WVRK9BsoPE5J1hib2/3KvG9e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+pqUVa+iJKiYfmtbwFgOUkAfBLkxAe1OkEI8zp9rAOM=;
 b=AxTXWqDLiwCxjEHygYD5bgQ9d7FEa8bGtv/U4/VKVcjTc2H2CtNZzyN1Xr7LP1d28O
 h869P5IlXncHoQfjVFF2FfeMGGy5IRoOFO2U1O6NvgNb0uNGI6FzFSKSi2rjfm94+lqM
 BVqYzU3OwxMwxowaUgohjX7rSIMOLMuLRapIdoTaL1yr2oTrbviObE3G4TxOl/jS2+ze
 AwSlDsXyhzytfEbRxqMhWUKaoARsLlcmj2OA6gB3mwQUMmwGkDo6d+3mzw09HeVc1RQI
 +E4J6ML2dJpvylzNhl7R7z62OQ8GB09+Gc+qBRtrDTui0sWZKOKp3Muff3R67QhVN8Wl
 ZtaQ==
X-Gm-Message-State: ANhLgQ2Ewsl+k/U+ryGqns+j+6yHz882//SCY0Eo/Y8qmorIrutgw465
 9Va2mAklFUAhRACdXurfybdKSw==
X-Google-Smtp-Source: ADFU+vtECDzXDFpXCG5lcJVJDyqu/tCMnJuWU9+mtWR65wiFN3A1cwYWg/gphR8f0TCrpSxAzIS25A==
X-Received: by 2002:a2e:9ca:: with SMTP id 193mr1862293ljj.283.1583229008833; 
 Tue, 03 Mar 2020 01:50:08 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id n12sm234615ljm.69.2020.03.03.01.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 01:50:08 -0800 (PST)
Subject: Re: eh_frame confusion
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
 <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
 <1583169883.zo43kx69lm.naveen@linux.ibm.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <9c9f79e3-d355-1c8a-fb5b-169aab2945da@rasmusvillemoes.dk>
Date: Tue, 3 Mar 2020 10:50:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1583169883.zo43kx69lm.naveen@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/03/2020 18.32, Naveen N. Rao wrote:
> Naveen N. Rao wrote:
>> Michael opened a task to look into this recently and I had spent some
>> time last week on this. The original commit/discussion adding
>> -fno-dwarf2-cfi-asm refers to R_PPC64_REL32 relocations not being
>> handled by our module loader:
>> http://lkml.kernel.org/r/20090224065112.GA6690@bombadil.infradead.org
>>
>> However, that is now handled thanks to commit 9f751b82b491d:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f751b82b491d
>>
>>
>> I did a test build and a simple module loaded fine, so I think
>> -fno-dwarf2-cfi-asm is not required anymore, unless Michael has seen
>> some breakages with it. Michael?
>>
>>>
>>> but prior to gcc-8, .eh_frame didn't seem to get generated anyway.
>>>
>>> Can .eh_frame sections be discarded for modules (on ppc32 at least), or
>>> is there some magic that makes them necessary when building with gcc-8?
>>
>> As Segher points out, it looks like we need to add
>> -fno-asynchronous-unwind-tables. Most other architectures seem to use
>> that too.

Yes. Thanks, Segher, that explains that part.

> Can you check if the below patch works? I am yet to test this in more
> detail, but would be good to know the implications for ppc32.

I'll see if that produces a bootable kernel, but I think I'd prefer a
more piecemeal approach.

One patch to add -fno-asynchronous-unwind-tables (given that other
arches do it unconditionally I don't think cc-option is needed), with a
commit log saying something like "no-op for gcc < 8, prevents .eh_frame
sections that are discarded anyway for vmlinux and waste disk space for
modules". Then another patch can get rid of -fno-dwarf2-cfi-asm if
that's no longer required.

Rasmus
