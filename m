Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F927B092
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 17:13:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0Qy31gB7zDqN2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 01:13:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=0x7f454c46@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dvDAoZ7W; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0QrG60txzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 01:08:09 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id a9so1530285wmm.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 08:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FXLhKYSWU/M1fd9MJuFy2+oKcbRHytB3lb3XoxsRGQs=;
 b=dvDAoZ7WCYZ1ogO3zg4WvzNFS0WjYAH1ZHeo6qgZIzcTG/0QGchSs9u42gOKTVFVjm
 Y93vm1Br97WyTt1/wl05iOzkkWca2FuIlXQcE3uiqb4bBP7eh7ABEdTasPuY/1VV2qSx
 dz71BgGogHAqaEwGHlAM+fuxZrrRKFsFSw4aeAg6WF347xZHqrnRY+vrnZOZeczTdQvU
 hYfVdYM3LyBiCNEgIQ9oVsH9v16OBILG4lnKoMIciT5AOF+3cgdbulradJzkNtgz9HmU
 1CTxrnh72o6XGGKNWV/bRCqZrSsuxnm9eJnTBHZsjbQ49FHF2LXKHw8A1AEvOLEAhZOn
 E02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FXLhKYSWU/M1fd9MJuFy2+oKcbRHytB3lb3XoxsRGQs=;
 b=QD6SHSS+uAccFAqd+6xBomSWqMQxfzQDUHH523nEZ/H3ZV3u2CD7QaTKWb2w6etEGq
 DdqcOS92kxJ9XpleN/8Bu1TePiwEkrt7uRehA8LQ2jUQiq9WZrKducHQ/7CCVrER8J/L
 LxA+/0eDCBKzLeg6JE5K+DF7eFuQxrPBpINrGqkyV86sMDO68W9Wf2hviJN9y4Ifm5Cn
 z8tCBi4OBLH31nXGynLLry2ErqCdEcci42mDdKGZ/ywHhFD8/DooJHo01aYGGphE79ZJ
 si5P++3LkboejdI6GGwkf5JvuG34HxwRsBo3+kB1MeTEzlWHW3auTsWg6f7hf0F/QDrv
 Zojw==
X-Gm-Message-State: AOAM531AxoZDpqvOAmC4bHOqrCtE73SLCH4W0y9+kRjtmZyOqWzwAkbq
 Z47qkXFnoajwVtwg8oZ5Big=
X-Google-Smtp-Source: ABdhPJwMqkizpfBHet4wCWb7GnvT4E/YNIH70bH6x5YTVoHc7ARnloVVYrAp/weuNGJZwyWj4yxKaw==
X-Received: by 2002:a05:600c:2f8f:: with SMTP id
 t15mr2173398wmn.41.1601305685437; 
 Mon, 28 Sep 2020 08:08:05 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8?
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id 189sm1622730wmb.3.2020.09.28.08.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 08:08:04 -0700 (PDT)
Subject: Re: [PATCH v8 2/8] powerpc/vdso: Remove __kernel_datapage_offset and
 simplify __get_datapage()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1588079622.git.christophe.leroy@c-s.fr>
 <0d2201efe3c7727f2acc718aefd7c5bb22c66c57.1588079622.git.christophe.leroy@c-s.fr>
 <87wo34tbas.fsf@mpe.ellerman.id.au>
 <2f9b7d02-9e2f-4724-2608-c5573f6507a2@csgroup.eu>
 <6862421a-5a14-2e38-b825-e39e6ad3d51d@csgroup.eu>
 <87imd5h5kb.fsf@mpe.ellerman.id.au>
 <CAJwJo6ZANqYkSHbQ+3b+Fi_VT80MtrzEV5yreQAWx-L8j8x2zA@mail.gmail.com>
 <87a6yf34aj.fsf@mpe.ellerman.id.au> <20200921112638.GC2139@willie-the-truck>
 <ad72ffd3-a552-cc98-7545-d30285fd5219@csgroup.eu>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Message-ID: <542145eb-7d90-0444-867e-c9cbb6bdd8e3@gmail.com>
Date: Mon, 28 Sep 2020 16:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ad72ffd3-a552-cc98-7545-d30285fd5219@csgroup.eu>
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
Cc: nathanl@linux.ibm.com, linux-arch <linux-arch@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/27/20 8:43 AM, Christophe Leroy wrote:
> 
> 
> Le 21/09/2020 à 13:26, Will Deacon a écrit :
>> On Fri, Aug 28, 2020 at 12:14:28PM +1000, Michael Ellerman wrote:
>>> Dmitry Safonov <0x7f454c46@gmail.com> writes:
[..]
>>>> I'll cook a patch for vm_special_mapping if you don't mind :-)
>>>
>>> That would be great, thanks!
>>
>> I lost track of this one. Is there a patch kicking around to resolve
>> this,
>> or is the segfault expected behaviour?
>>
> 
> IIUC dmitry said he will cook a patch. I have not seen any patch yet.

Yes, sorry about the delay - I was a bit busy with xfrm patches.

I'll send patches for .close() this week, working on them now.

> AFAIKS, among the architectures having VDSO sigreturn trampolines, only
> SH, X86 and POWERPC provide alternative trampoline on stack when VDSO is
> not there.
> 
> All other architectures just having a VDSO don't expect VDSO to not be
> mapped.
> 
> As far as nowadays stacks are mapped non-executable, getting a segfaut
> is expected behaviour. However, I think we should really make it
> cleaner. Today it segfaults because it is still pointing to the VDSO
> trampoline that has been unmapped. But should the user map some other
> code at the same address, we'll run in the weed on signal return instead
> of segfaulting.

+1.

> So VDSO unmapping should really be properly managed, the reference
> should be properly cleared in order to segfault in a controllable manner.
> 
> Only powerpc has a hook to properly clear the VDSO pointer when VDSO is
> unmapped.

Thanks,
         Dmitry
