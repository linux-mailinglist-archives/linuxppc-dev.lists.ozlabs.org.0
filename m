Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0E22A912
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 08:43:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC2pT5csMzDrFD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 16:43:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC2mv4VMnzDrBg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 16:41:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KkEc2t26; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BC2mv0s3Wz9sQt;
 Thu, 23 Jul 2020 16:41:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595486511;
 bh=70ZBEEl//SqmVWbpPoZYFncCaDwRhVg5OotUH4dE1HE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KkEc2t26tQXICDUsb/AYFhskSnQQI+E5sMY4MBO77trGDt1HIsQKH60vMymO3/cns
 24IRXE7/V4vayG5uRIQqp0TPNqp8V5vohNkwziNcZ/Klb3dY4uZyLw3uy1O2HGCgD1
 JtIxUpPSYWK0PcHMOAs/k6elUdX6yL0xlpxrzb4erU5/iRlFqalUGYXsNP6oXw1lYr
 xh+8sC57zm68BPqQiG14Jq3o4VYwCAVPNJS8vAY6XKfyVQaXkJbP3wWz3Uu1YATQSJ
 s4+777N3vLj8WoasH9St8XyyjyL9xVc666aRxNRLAjsQJ8sC0K8GIYhYN6mAebKaYR
 TIj/t6IDldBOg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pingfan Liu <kernelfans@gmail.com>
Subject: Re: [PATCHv3 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
In-Reply-To: <CAFgQCTsgX9XWJ476dxT2csTuuhpaO3KSZN-EewZiZ0mBj3N4aQ@mail.gmail.com>
References: <1595382730-10565-1-git-send-email-kernelfans@gmail.com>
 <1595382730-10565-2-git-send-email-kernelfans@gmail.com>
 <87pn8oqh86.fsf@mpe.ellerman.id.au>
 <CAFgQCTsgX9XWJ476dxT2csTuuhpaO3KSZN-EewZiZ0mBj3N4aQ@mail.gmail.com>
Date: Thu, 23 Jul 2020 16:41:50 +1000
Message-ID: <875zaeravl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pingfan Liu <kernelfans@gmail.com> writes:
> On Wed, Jul 22, 2020 at 12:57 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Pingfan Liu <kernelfans@gmail.com> writes:
>> > A bug is observed on pseries by taking the following steps on rhel:
>>                                                                 ^
>>                                                                 RHEL
>>
>> I assume it happens on mainline too?
> Yes, it does.
>>
> [...]
>> > diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> > index 1a3ac3b..def8cb3f 100644
>> > --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>> > +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> > @@ -372,6 +372,7 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>> >       invalidate_lmb_associativity_index(lmb);
>> >       lmb_clear_nid(lmb);
>> >       lmb->flags &= ~DRCONF_MEM_ASSIGNED;
>> > +     drmem_update_dt();
>>
>> No error checking?
> Hmm, here should be a more careful design. Please see the comment at the end.
>>
>> >       __remove_memory(nid, base_addr, block_sz);
>> >
>> > @@ -607,6 +608,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>> >
>> >       lmb_set_nid(lmb);
>> >       lmb->flags |= DRCONF_MEM_ASSIGNED;
>> > +     drmem_update_dt();
>>
>> And here ..
>> >
>> >       block_sz = memory_block_size_bytes();
>> >
>> > @@ -625,6 +627,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>> >               invalidate_lmb_associativity_index(lmb);
>> >               lmb_clear_nid(lmb);
>> >               lmb->flags &= ~DRCONF_MEM_ASSIGNED;
>> > +             drmem_update_dt();
>>
>>
>> And here ..
>>
>> >               __remove_memory(nid, base_addr, block_sz);
>> >       }
>> > @@ -877,9 +880,6 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
>> >               break;
>> >       }
>> >
>> > -     if (!rc)
>> > -             rc = drmem_update_dt();
>> > -
>> >       unlock_device_hotplug();
>> >       return rc;
>>
>> Whereas previously we did check it.
>
> drmem_update_dt() fails iff allocating memory fail.

That's true currently, but it might change in future.

> And in the failed case, even the original code does not roll back the
> effect of __add_memory()/__remove_memory().

Yeah hard to know what the desired behaviour is. If something fails we
at least need to print a message though, not silently swallow it.

> And I plan to do the following in V4: if drmem_update_dt() fails in
> dlpar_add_lmb(), then bails out immediately.

That sounds reasonable.

cheers
