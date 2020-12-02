Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1A2CB2F2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 03:53:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm3Sp66qXzDq99
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 13:53:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gswJVu4r; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm3NX49chzDr42
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 13:50:04 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id l23so152264pjg.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 18:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=cQulqwTG5/+FKQNusgjvEPfQ8LJuFbT6VbTDryDflxw=;
 b=gswJVu4rOSQ8N4hID+k14MxofbGrn5oUbk4d+sSDWLmSmpTKLtWi+wskJUT4fc7hTC
 LeY6if6Fh6DblFlCGLNq24vdipRHhKBkzdyk76Zh0EAiLjC4PJ2TX/ZnZgp9VnKXJI22
 BYXUeYA/o38Ik42izjE7nN3DDJcO7dMThBErfVvlf1CIe2agS2ZZBLb9g01E00o4n4A1
 itDLc51pNSjHuLF8gQYRTM0xJs+Fga0hsGUJbxfdM6zdAo/2C2crcRVk/lKqVzk5HrJh
 uHpGzUvQHbeAC4DyFaPk/aKY2B6+npKJkwFyL0Oqfy1rH96rWPrWFzrbsEjZGAXEUsF1
 im8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=cQulqwTG5/+FKQNusgjvEPfQ8LJuFbT6VbTDryDflxw=;
 b=Vpv9NmCDWJ3SAHdmw24Qpg4Ogpjsyks+1NO6GJTLYKesx3gNZVkNbNahmhXbtC60qX
 qI2wEwyPexV2dCxzUT4OGLhPR97R2KNeCFgA+MNMyZF8ttH98/6EMH8rcRQSjZMG4IYF
 o3bUpb+IcsTL0q1dsyHk21H2Rv4M/MMy9s/kdIXaiDQHSDzn4iwpKZGPEIVeVlthurUG
 xY8PkapLi8kiECgq4g5D695f8iTUyZHMy1/2lHIGU8f33EJoXehDwqpdYtCO5FurcSMg
 cCacD2gA4JQjYuRIe6sRb/8FamExpvb5m3mce2fJRokEFG8us+ZoklVnOIYVngQ+wzJu
 CkRw==
X-Gm-Message-State: AOAM533PmS6CkrCrl+xagsTY8+dNF0TbR48xT26eyMcjN7Prib3OssWy
 zaFdfdrOnBMIEJWcvsQenEM=
X-Google-Smtp-Source: ABdhPJwgLHQbFa4c6y7A2FXBrGv4J5hKeX6Te1QlRRdopHTV/3PR/OFLgCF3bk/OzO6mk4nBSzftsA==
X-Received: by 2002:a17:902:e787:b029:d9:f88d:c32d with SMTP id
 cp7-20020a170902e787b02900d9f88dc32dmr603516plb.79.1606877401804; 
 Tue, 01 Dec 2020 18:50:01 -0800 (PST)
Received: from localhost ([1.132.177.56])
 by smtp.gmail.com with ESMTPSA id u24sm290208pfm.51.2020.12.01.18.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 18:50:00 -0800 (PST)
Date: Wed, 02 Dec 2020 12:49:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/8] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: Andy Lutomirski <luto@kernel.org>
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-3-npiggin@gmail.com>
 <CALCETrXYkbuJJnDv9ijfT+5tLQ2FOvvN1Ugoh5NwOy+zHp9HXA@mail.gmail.com>
In-Reply-To: <CALCETrXYkbuJJnDv9ijfT+5tLQ2FOvvN1Ugoh5NwOy+zHp9HXA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1606876327.dyrhkih2kh.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of November 29, 2020 3:55 am:
> On Sat, Nov 28, 2020 at 8:02 AM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> And get rid of the generic sync_core_before_usermode facility. This is
>> functionally a no-op in the core scheduler code, but it also catches
>>
>> This helper is the wrong way around I think. The idea that membarrier
>> state requires a core sync before returning to user is the easy one
>> that does not need hiding behind membarrier calls. The gap in core
>> synchronization due to x86's sysret/sysexit and lazy tlb mode, is the
>> tricky detail that is better put in x86 lazy tlb code.
>>
>> Consider if an arch did not synchronize core in switch_mm either, then
>> membarrier_mm_sync_core_before_usermode would be in the wrong place
>> but arch specific mmu context functions would still be the right place.
>> There is also a exit_lazy_tlb case that is not covered by this call, whi=
ch
>> could be a bugs (kthread use mm the membarrier process's mm then context
>> switch back to the process without switching mm or lazy mm switch).
>>
>> This makes lazy tlb code a bit more modular.
>=20
> I have a couple of membarrier fixes that I want to send out today or
> tomorrow, and they might eliminate the need for this patch.  Let me
> think about this a little bit.  I'll cc you.  The existing code is way
> to subtle and the comments are far too confusing for me to be quickly
> confident about any of my conclusions :)
>=20

Thanks for the head's up. I'll have to have a better look through them=20
but I don't know that it eliminates the need for this entirely although
it might close some gaps and make this not a bug fix. The problem here=20
is x86 code wanted something to be called when a lazy mm is unlazied,
but it missed some spots and also the core scheduler doesn't need to=20
know about those x86 details if it has this generic call that annotates
the lazy handling better.

I'll go through the wording again and look at your patches a bit better
but I think they are somewhat orthogonal.

Thanks,
Nick
