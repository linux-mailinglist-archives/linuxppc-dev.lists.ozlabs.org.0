Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A887E22B342
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 18:15:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCHWF30FbzDrHd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 02:15:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qY7x/OH9; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCHRM4gDxzDqPf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 02:12:30 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id j20so3235307pfe.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 09:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=VfbbwGv4m75EPfOW0baUXWN1YgZZBJIPGp1WqmJP8lg=;
 b=qY7x/OH9vNFSKZgAYfY6d0dn2o0FMZq+yslW+XFUxSS1ssfzwjJfnfDLJJz84VlOz6
 FPD5cVIIybdkZMWJ4OOnUqDLrl4fF4X24m/j769nnmiJsLn6LBjp37/nChKDD9EUZljz
 6dZoJG7phYQEZ8iU2fgjOjmHJHaygLKU4nNZb+JttbZn+9JZeXJy6B0yia9MH0Tp0cV+
 w6t52FrabMZwKTBfKVKaQx3eXb0AiAUV3lb7M+RIqfDaaYjI/UyhqwoowTCW0syaa86J
 Q+OoKNzCb2/DOBgNqaJXQKaNHd3UPmPnXrUgxodi/nq0w+y9beA/xQhR7vfQXQwUomi3
 0Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=VfbbwGv4m75EPfOW0baUXWN1YgZZBJIPGp1WqmJP8lg=;
 b=l458IL97kwIAVS+2MUlkvy8lkF/N5mhtA5UlS9c6+q705/nZj5EaDjcWyPsOL41wtZ
 /QIno/OL98AKSHeRUcmSmYMaiMYV5Drvntaqun84+CiCgFdFEZwRMwgvc45Qb9N/2hs5
 FrxigrHZi+sJY5lOkbCj1fA1o9Qo+iinYljInPbT0bbphaO06+qpvwclrxpUk0lLidmz
 3T0mCI0jmuD+RgSVIwd7AsGtid7wx9RBpVdPn9e30y0AZ+UNza/ZSxxeehngCdEwQ5/5
 wWxE6GkVrXt/2kjYsvA7EqUO4f4Px+ars+mTa9gq+u4+q7r+aTK1HrG6yFYt+95zx7o5
 vPYA==
X-Gm-Message-State: AOAM5321ffddW39odZYSXxWniForN4+nkir7yAYzrknNpHKGLlkg6YOU
 3nbW4TA3Cl/TvRLIoA3DHKo=
X-Google-Smtp-Source: ABdhPJwIS9sYrpZx7WWejQg+HhPLCX9upAMrSJWiKfOQ5V/wrdWIq5BPjwMO92bm7X0aGfua7RM/kg==
X-Received: by 2002:a62:768d:: with SMTP id r135mr5113582pfc.198.1595520747713; 
 Thu, 23 Jul 2020 09:12:27 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id np5sm3527975pjb.43.2020.07.23.09.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 09:12:27 -0700 (PDT)
Date: Fri, 24 Jul 2020 02:12:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <20200708084106.GE597537@hirez.programming.kicks-ass.net>
 <1595327263.lk78cqolxm.astroid@bobo.none>
 <eaabf501-80fe-dd15-c03c-f75ce4f75877@redhat.com>
 <1595510571.u39qfc8d1o.astroid@bobo.none>
 <af825bce-ecf3-66e4-ad63-a844dbd2e775@redhat.com>
In-Reply-To: <af825bce-ecf3-66e4-ad63-a844dbd2e775@redhat.com>
MIME-Version: 1.0
Message-Id: <1595520724.nzha5zvbid.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Waiman Long's message of July 24, 2020 12:29 am:
> On 7/23/20 9:30 AM, Nicholas Piggin wrote:
>>> I would prefer to extract out the pending bit handling code out into a
>>> separate helper function which can be overridden by the arch code
>>> instead of breaking the slowpath into 2 pieces.
>> You mean have the arch provide a queued_spin_lock_slowpath_pending
>> function that the slow path calls?
>>
>> I would actually prefer the pending handling can be made inline in
>> the queued_spin_lock function, especially with out-of-line locks it
>> makes sense to put it there.
>>
>> We could ifdef out queued_spin_lock_slowpath_queue if it's not used,
>> then __queued_spin_lock_slowpath_queue would be inlined into the
>> caller so there would be no split?
>=20
> The pending code is an optimization for lightly contended locks. That is=20
> why I think it is appropriate to extract it into a helper function and=20
> mark it as such.
>=20
> You can certainly put the code in the arch's spin_lock code, you just=20
> has to override the generic pending code by a null function.

I see what you mean. I guess that would work fine.

Thanks,
Nick
