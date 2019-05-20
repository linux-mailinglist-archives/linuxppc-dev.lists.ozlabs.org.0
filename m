Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D6323B60
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:58:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45728t3lFxzDqLg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 00:58:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UWOX6NrE"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45726f21XvzDqF7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 00:56:57 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id t87so7361482pfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 07:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=O3kXD3ITk26oSSwgybzR3DA5D7KEBzcJ5ceoicOhdOc=;
 b=UWOX6NrEQM65f8yYWtG3hrWSu+9eksyHelP7U35bP5SE9k8LSeuZaS0IaJbyV2joDp
 XeF9a42UIjCEj6E3L86E+N91GPBmgrqxjrK1Y4R6G352RYsyAJBgZk9H4RdOGsUFeKjW
 a/mFno/1qZyan/M8yy2/0jEeOC38fDIyYHWDLW+6PwPCogj6c9Dzr8eDYXjPXp4HMXRf
 ByHpwBkeUD2tSezpumbyB7+pnCFr+rDWrthbJT5GYiYiAqMUFC4ZPMyaDcl5BZYKlwRE
 ikNdp749WVWXMA592QdyJpN5/K02GtR0jOMUdf77PS/AB+9+uA4mGP8eQaA8H++7Nveb
 Drwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=O3kXD3ITk26oSSwgybzR3DA5D7KEBzcJ5ceoicOhdOc=;
 b=oFXggfVhQ0xdeK7TYVAKaQXEeLnbjU/1soOoa5rqmsAiuOmx0dV/boAMFiXqFVV2Mg
 pIitiwzY2OwhdFlYyTWxTGWbqNovLg12WXZ3gQ2Ujy2RnJGqWR+WJSOw+rBB5rD9UhQH
 ulMIWuI+Um4k+Ls443DTdGUP1f7YG6R+doKkF3zCzAyn7dmBKB04k0PCDLjPS5BgZ74C
 eNuPhiK41zdwxdP9207SZQ67tGinXRDfBE6NXAfiSZE3ldX3ySsP9uisY+St75ymH/PZ
 URsOaqb0PWYECi6dJ36mUUI3KjqjdAQlQuLYa8jxHfb1IpvmGl28TKOLaBF96wyB1B9M
 e8Gg==
X-Gm-Message-State: APjAAAXe/sLZNhMesP/z+31MMyinDgp0wkgW3y7M2682r9V6HTv5V3pH
 rl+7tNQRdFC1Ym12dOsJ34I=
X-Google-Smtp-Source: APXvYqx2hkmlDblKAZscUFiS/KNuLl3PIT6eGhZM/LWHjV/4nRDBV7z+Y/WaRRVZubAjfRObVnJt5A==
X-Received: by 2002:a62:7608:: with SMTP id r8mr780980pfc.190.1558364214465;
 Mon, 20 May 2019 07:56:54 -0700 (PDT)
Received: from localhost (193-116-79-244.tpgi.com.au. [193.116.79.244])
 by smtp.gmail.com with ESMTPSA id t7sm20650667pfh.156.2019.05.20.07.56.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 07:56:53 -0700 (PDT)
Date: Tue, 21 May 2019 00:55:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: PROBLEM: Power9: kernel oops on memory hotunplug from ppc64le
 guest
To: bharata@linux.ibm.com
References: <16a7a635-c592-27e2-75b4-d02071833278@linux.vnet.ibm.com>
 <20190518141434.GA22939@in.ibm.com>
 <878sv1993k.fsf@concordia.ellerman.id.au>
 <20190520042533.GB22939@in.ibm.com>
 <1558327521.633yjtl8ki.astroid@bobo.none>
 <20190520055622.GC22939@in.ibm.com>
 <1558335484.9inx69a7ea.astroid@bobo.none>
 <20190520082035.GD22939@in.ibm.com> <20190520142922.GE22939@in.ibm.com>
In-Reply-To: <20190520142922.GE22939@in.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1558363500.jsgl4a2lfa.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: bharata@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, aneesh.kumar@linux.ibm.com,
 srikanth <sraithal@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao's on May 21, 2019 12:29 am:
> On Mon, May 20, 2019 at 01:50:35PM +0530, Bharata B Rao wrote:
>> On Mon, May 20, 2019 at 05:00:21PM +1000, Nicholas Piggin wrote:
>> > Bharata B Rao's on May 20, 2019 3:56 pm:
>> > > On Mon, May 20, 2019 at 02:48:35PM +1000, Nicholas Piggin wrote:
>> > >> >> > git bisect points to
>> > >> >> >
>> > >> >> > commit 4231aba000f5a4583dd9f67057aadb68c3eca99d
>> > >> >> > Author: Nicholas Piggin <npiggin@gmail.com>
>> > >> >> > Date:   Fri Jul 27 21:48:17 2018 +1000
>> > >> >> >
>> > >> >> >     powerpc/64s: Fix page table fragment refcount race vs spec=
ulative references
>> > >> >> >
>> > >> >> >     The page table fragment allocator uses the main page refco=
unt racily
>> > >> >> >     with respect to speculative references. A customer observe=
d a BUG due
>> > >> >> >     to page table page refcount underflow in the fragment allo=
cator. This
>> > >> >> >     can be caused by the fragment allocator set_page_count sto=
mping on a
>> > >> >> >     speculative reference, and then the speculative failure ha=
ndler
>> > >> >> >     decrements the new reference, and the underflow eventually=
 pops when
>> > >> >> >     the page tables are freed.
>> > >> >> >
>> > >> >> >     Fix this by using a dedicated field in the struct page for=
 the page
>> > >> >> >     table fragment allocator.
>> > >> >> >
>> > >> >> >     Fixes: 5c1f6ee9a31c ("powerpc: Reduce PTE table memory was=
tage")
>> > >> >> >     Cc: stable@vger.kernel.org # v3.10+
>> > >> >>=20
>> > >> >> That's the commit that added the BUG_ON(), so prior to that you =
won't
>> > >> >> see the crash.
>> > >> >=20
>> > >> > Right, but the commit says it fixes page table page refcount unde=
rflow by
>> > >> > introducing a new field &page->pt_frag_refcount. Now we are hitti=
ng the underflow
>> > >> > for this pt_frag_refcount.
>> > >>=20
>> > >> The fixed underflow is caused by a bug (race on page count) that go=
t=20
>> > >> fixed by that patch. You are hitting a different underflow here. It=
's
>> > >> not certain my patch caused it, I'm just trying to reproduce now.
>> > >=20
>> > > Ok.
>> >=20
>> > Can't reproduce I'm afraid, tried adding and removing 8GB memory from =
a
>> > 4GB guest (via host adding / removing memory device), and it just work=
s.
>>=20
>> Boot, add 8G, reboot, remove 8G is the sequence to reproduce.
>>=20
>> >=20
>> > It's likely to be an edge case like an off by one or rounding error
>> > that just happens to trigger in your config. Might be easiest if you
>> > could test with a debug patch.
>>=20
>> Sure, I will continue debugging.
>=20
> When the guest is rebooted after hotplug, the entire memory (which includ=
es
> the hotplugged memory) gets remapped again freshly. However at this time
> since no slab is available yet, pt_frag_refcount never gets initialized a=
s we
> never do pte_fragment_alloc() for these mappings. So we right away hit th=
e
> underflow during the first unplug itself, it looks like.

Nice catch, good debugging work.

> I will check how this can be fixed.

Tricky problem. What do you think? You might be able to make the early=20
page table allocations in the same pattern as the frag allocations, and=20
then fill in the struct page metadata when you have those.

Other option may be create a new set of page tables after mm comes up
to replace the early page tables with. That's a bigger hammer though.

Thanks,
Nick

=
