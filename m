Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E0F22C7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 09:02:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456qbR5p59zDqKR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 17:02:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lYLwGxL3"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456qYt3HqzzDqHH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 17:01:22 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id p15so6264868pll.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 00:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=08DG43aOD+Euaff1im+598ddGTX4txkr6BAgSvzzebg=;
 b=lYLwGxL3wK2u4wZzmtQ37p/dK5KP31YOg+9GaIBPjcXpzSKOvrN0rUCR6eJ5ammzSj
 nCsA4dCKFmP64zrGVCk4PkF7w5usqGCROsUGpEZbd1F788v7n1N2GefY0kOTMpHt7Hyt
 4G8CQGeHMGeXi1C6OGpo9vIh73RK3KAqRQSiINaIft9hRrRLSLaFr0kQFwdTMS5/e2R/
 iAQZkSXK64YEgRVVqevqYZa8F/EW2Vkw+0B//9D+T3Cf0C75/ey05tdQdtodOFj7Ol/s
 ihBQ+ZOI3OoxCEVWWkZf41FeiCGJvRbGp3w1ssCe+2nDUjmgT/xXKPkSmz9nO+fFhpLe
 FhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=08DG43aOD+Euaff1im+598ddGTX4txkr6BAgSvzzebg=;
 b=RfrtGLa1mYGlGqpzvEupBQc9Zvosx1mdVL9Au4wuQaTWXWpO8mF4sxpb2fMpEbiJn0
 Sy5SAhFskMZb3wOV7JdhbMPrV1XlkdIk5Qvkxv60ZJeopF7pRg6Z54MQkby4d4obrw7Q
 NrN5p51SOoeA5gwntIozHcFaYaNnQyF79UNkR8zfveGN4OIMDrx5ZUfvRC0HgSwQnlxj
 lHgW7nOYdB2arC8uD27FsX6cSXtlZ7eB/Tn6aug2u86E3q8t2DIkRQqJaVMgfAo8nMEo
 je3k+Gf2yXVh6sXOGEo2kpNKHH5J7XHpg4refMCP0mXhkaxfj1fcuVDTDUmkmMgw9rYS
 ztCA==
X-Gm-Message-State: APjAAAXQySd5CUuvrzVBoRhly/Mrt/0rzrUWPhUg9z1sVP7N8K43ASHA
 7oVrveKE0UP7qBLf7/solec=
X-Google-Smtp-Source: APXvYqyZ9yhaosf5utP1M5IvBH9z10LRioY4qvrROs5RLMZ+ssuniXnSj2koK4Tlw+OmDnuU9ok4+w==
X-Received: by 2002:a17:902:aa85:: with SMTP id
 d5mr73024563plr.245.1558335680631; 
 Mon, 20 May 2019 00:01:20 -0700 (PDT)
Received: from localhost (193-116-79-244.tpgi.com.au. [193.116.79.244])
 by smtp.gmail.com with ESMTPSA id x28sm17981692pfo.78.2019.05.20.00.01.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 00:01:20 -0700 (PDT)
Date: Mon, 20 May 2019 17:00:21 +1000
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
In-Reply-To: <20190520055622.GC22939@in.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1558335484.9inx69a7ea.astroid@bobo.none>
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

Bharata B Rao's on May 20, 2019 3:56 pm:
> On Mon, May 20, 2019 at 02:48:35PM +1000, Nicholas Piggin wrote:
>> >> > git bisect points to
>> >> >
>> >> > commit 4231aba000f5a4583dd9f67057aadb68c3eca99d
>> >> > Author: Nicholas Piggin <npiggin@gmail.com>
>> >> > Date:   Fri Jul 27 21:48:17 2018 +1000
>> >> >
>> >> >     powerpc/64s: Fix page table fragment refcount race vs speculati=
ve references
>> >> >
>> >> >     The page table fragment allocator uses the main page refcount r=
acily
>> >> >     with respect to speculative references. A customer observed a B=
UG due
>> >> >     to page table page refcount underflow in the fragment allocator=
. This
>> >> >     can be caused by the fragment allocator set_page_count stomping=
 on a
>> >> >     speculative reference, and then the speculative failure handler
>> >> >     decrements the new reference, and the underflow eventually pops=
 when
>> >> >     the page tables are freed.
>> >> >
>> >> >     Fix this by using a dedicated field in the struct page for the =
page
>> >> >     table fragment allocator.
>> >> >
>> >> >     Fixes: 5c1f6ee9a31c ("powerpc: Reduce PTE table memory wastage"=
)
>> >> >     Cc: stable@vger.kernel.org # v3.10+
>> >>=20
>> >> That's the commit that added the BUG_ON(), so prior to that you won't
>> >> see the crash.
>> >=20
>> > Right, but the commit says it fixes page table page refcount underflow=
 by
>> > introducing a new field &page->pt_frag_refcount. Now we are hitting th=
e underflow
>> > for this pt_frag_refcount.
>>=20
>> The fixed underflow is caused by a bug (race on page count) that got=20
>> fixed by that patch. You are hitting a different underflow here. It's
>> not certain my patch caused it, I'm just trying to reproduce now.
>=20
> Ok.

Can't reproduce I'm afraid, tried adding and removing 8GB memory from a
4GB guest (via host adding / removing memory device), and it just works.

It's likely to be an edge case like an off by one or rounding error
that just happens to trigger in your config. Might be easiest if you
could test with a debug patch.

Thanks,
Nick

=
