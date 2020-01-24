Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5953B1476E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 03:06:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483jD61PtvzDqYd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 13:05:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zytor.com (client-ip=198.137.202.136; helo=mail.zytor.com;
 envelope-from=hpa@zytor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=zytor.com
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483jB06D1tzDqRw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 13:04:08 +1100 (AEDT)
Received: from [IPv6:2601:646:8600:3281:4dd4:188:b5a7:5dd5]
 ([IPv6:2601:646:8600:3281:4dd4:188:b5a7:5dd5]) (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 00O23PpB1651500
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 23 Jan 2020 18:03:28 -0800
Date: Thu, 23 Jan 2020 18:03:14 -0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wi8FvaeRv6PpisQ+L_Cv52yE6jCxZzUHQPZ_K7HzFkaBQ@mail.gmail.com>
References: <fed4f49349913cb6739dac647ba6a61d56b989d2.1579783936.git.christophe.leroy@c-s.fr>
 <e11a8f0670251267f87e3114e0bdbacb1eb72980.1579783936.git.christophe.leroy@c-s.fr>
 <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
 <fc5c94a2-5a25-0715-5240-5ba3cbe0f2b2@c-s.fr>
 <CAHk-=wi8FvaeRv6PpisQ+L_Cv52yE6jCxZzUHQPZ_K7HzFkaBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/7] uaccess: Tell user_access_begin() if it's for a
 write or not
To: Linus Torvalds <torvalds@linux-foundation.org>,
 christophe leroy <christophe.leroy@c-s.fr>
From: hpa@zytor.com
Message-ID: <1BC4F810-1BF4-4C15-9113-890A163FDBE2@zytor.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Linux-MM <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On January 23, 2020 11:57:57 AM PST, Linus Torvalds <torvalds@linux-foundat=
ion=2Eorg> wrote:
>On Thu, Jan 23, 2020 at 11:47 AM christophe leroy
><christophe=2Eleroy@c-s=2Efr> wrote:
>>
>> I'm going to leave it aside, at least for the time being, and do it
>as a
>> second step later after evaluating the real performance impact=2E I'll
>> respin tomorrow in that way=2E
>
>Ok, good=2E
>
>From a "narrow the access window type" standpoint it does seem to be a
>good idea to specify what kind of user accesses will be done, so I
>don't hate the idea, it's more that I'm not convinced it matters
>enough=2E
>
>On x86, we have made the rule that user_access_begin/end() can contain
>_very_ few operations, and objtool really does enforce that=2E With
>objtool and KASAN, you really end up with very small ranges of
>user_access_begin/end()=2E
>
>And since we actually verify it statically on x86-64, I would say that
>the added benefit of narrowing by access type is fairly small=2E We're
>not going to have complicated code in that user access region, at
>least in generic code=2E
>
>> > Also, it shouldn't be a "is this a write"=2E What if it's a read
>_and_ a
>> > write? Only a write? Only a read?
>>
>> Indeed that was more: does it includes a write=2E It's either RO or RW
>
>I would expect that most actual users would be RO or WO, so it's a bit
>odd to have those choices=2E
>
>Of course, often writing ends up requiring read permissions anyway if
>the architecture has problems with alignment handling or similar, but
>still=2E=2E=2E The real RW case does exist conceptually (we have
>"copy_in_user()", after all), but still feels like it shouldn't be
>seen as the only _interface_ choice=2E
>
>IOW, an architecture may decide to turn WO into RW because of
>architecture limitations (or, like x86 and arm, ignore the whole
>RO/RW/WO _entirely_ because there's just a single "allow user space
>accesses" flag), but on an interface layer if we add this flag, I
>really think it should be an explicit "read or write or both"=2E
>
>So thus my "let's try to avoid doing it in the first place, but if we
>_do_ do this, then do it right" plea=2E
>
>                 Linus

I'm wondering if we should make it a static part of the API instead of a v=
ariable=2E

I have *deep* concern with carrying state in a "key" variable: it's a dire=
ct attack vector for a crowbar attack, especially since it is by definition=
 live inside a user access region=2E

One major reason x86 restricts the regions like this is to minimize the am=
ount of unconstrained state: we don't save and restore the state around, bu=
t enter and exit unconditionally, which means that a leaked state will end =
up having a limited lifespan=2E Nor is there any state inside the user acce=
ss region which could be corrupted to leave the region open=2E
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
