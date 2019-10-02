Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB29BC4825
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 09:13:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jnRr0fxDzDqSg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 17:13:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jnPv00YfzDqFD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 17:12:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46jnPl5wHGz9v0tb;
 Wed,  2 Oct 2019 09:11:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id e2yIw6Fj-kKw; Wed,  2 Oct 2019 09:11:55 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46jnPl56CTz9v0tZ;
 Wed,  2 Oct 2019 09:11:55 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 348AA64F; Wed,  2 Oct 2019 09:13:04 +0200 (CEST)
Received: from 37.173.255.220 ([37.173.255.220]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Wed, 02 Oct 2019 09:13:04 +0200
Date: Wed, 02 Oct 2019 09:13:04 +0200
Message-ID: <20191002091304.Horde.44CFpqD3KN1HHZOT0U8wSQ7@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net> <20191001101707.GA21929@pc636>
 <87zhik2b5x.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87zhik2b5x.fsf@dja-thinkpad.axtens.net>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: mark.rutland@arm.com, gor@linux.ibm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Uladzislau Rezki <urezki@gmail.com>, glider@google.com, luto@kernel.org,
 aryabinin@virtuozzo.com, linuxppc-dev@lists.ozlabs.org, dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> a =C3=A9crit=C2=A0:

> Hi,
>
>>>  	/*
>>>  	 * Find a place in the tree where VA potentially will be
>>>  	 * inserted, unless it is merged with its sibling/siblings.
>>> @@ -741,6 +752,10 @@ merge_or_add_vmap_area(struct vmap_area *va,
>>>  		if (sibling->va_end =3D=3D va->va_start) {
>>>  			sibling->va_end =3D va->va_end;
>>>
>>> +			kasan_release_vmalloc(orig_start, orig_end,
>>> +					      sibling->va_start,
>>> +					      sibling->va_end);
>>> +
>> The same.
>
> The call to kasan_release_vmalloc() is a static inline no-op if
> CONFIG_KASAN_VMALLOC is not defined, which I thought was the preferred
> way to do things rather than sprinkling the code with ifdefs?
>
> The complier should be smart enough to eliminate all the
> orig_state/orig_end stuff at compile time because it can see that it's
> not used, so there's no cost in the binary.
>


Daniel,

You are entirely right in your way to do i, that's fully in line with=20=20
Linux=20kernel codying style=20=20
https://www.kernel.org/doc/html/latest/process/coding-style.html#conditiona=
l-compilation

Christophe

