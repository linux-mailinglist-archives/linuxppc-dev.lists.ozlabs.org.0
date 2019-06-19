Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B167E4B07A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 05:40:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T9hG0fXzzDqjM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 13:40:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S6UNpDi/"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T9fF0fsnzDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 13:38:44 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id v11so8825563pgl.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 20:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=X5S359TT2jtWbNMb2akLbFAUxVXw3JQDVjQ+R52t1xY=;
 b=S6UNpDi/FNqJ1wWojVY5Qfy9zBjyJFliXTvsl4vQVTsMqBMwOGNUKuZEfRXJW8VKmj
 D3T4za6dyg+WLPx42iPOExedOSsY0K6XEyda6izcLy3Ki6BXqqgBz6Sn6moEc5Vzex+Q
 nabKV97AkgIinO/iCOdzvFnRvDYnLKbm49K9EawFITT4ZT373SKVZVe6+6ycX7aCEpUg
 NIz+2rX6aQig9QiekVK7api9ev7wvhV/bRWSCDX+Je5V3w8lpGebW1BgpUqv/EhOlxg+
 m5/HqAQwhqSZWLYU+oNlTIqveSGoIqg+v2mIGihx6AGxZrPC8M5eE8V5xoWeEmyEPpt7
 sK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=X5S359TT2jtWbNMb2akLbFAUxVXw3JQDVjQ+R52t1xY=;
 b=GP4jtsY10ON8SJXbNu/2yPveb3MWoq4PP54qHXJVqyubtjuOl+mG92z9jlIE4k69gg
 FTS6m0nFyJEsNI2xAorccAlgAsYPYnS1bctwvixrCCBZ+7tGvSBKkfq6hXdf6bi/nIgW
 qneQfb6uTnrnU900kngeENdquMvCwip6JvtMkRF5YsEGfN3EA7hTvdQY4Ul7l1+NbKGJ
 t1Rw1csMHrCmaP0AxET49o7qbv30f31EFwaSyD2sEHnYb4G5Riphti3RQOLYiBqBk9a4
 F3s2oCqOu5fJytVPVaOwqNkUq0exCdEimMJW/q4AnJI0oMk0rYcExfj3F/jv8WTS+PWn
 6mAA==
X-Gm-Message-State: APjAAAXIW2QghqetVKKyuGqL87eddjL3ZDy06WC1VhlRZ2NLZgaOAf4p
 FIjD6qpVpYmBFfjGtJmb56o=
X-Google-Smtp-Source: APXvYqwnSBPFeZZjes4n8S6fPdWj8hj9VM+/z9NnV7ssCaV0ebSAiRrrqcOoX7VBgbIPkomjZ7oI3w==
X-Received: by 2002:a65:4009:: with SMTP id f9mr5756765pgp.110.1560915520951; 
 Tue, 18 Jun 2019 20:38:40 -0700 (PDT)
Received: from localhost (193-116-92-108.tpgi.com.au. [193.116.92.108])
 by smtp.gmail.com with ESMTPSA id u4sm15770215pfu.26.2019.06.18.20.38.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 20:38:40 -0700 (PDT)
Date: Wed, 19 Jun 2019 13:33:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/4] mm/vmalloc: Hugepage vmalloc mappings
To: Anshuman Khandual <anshuman.khandual@arm.com>, Mark Rutland
 <mark.rutland@arm.com>
References: <20190610043838.27916-1-npiggin@gmail.com>
 <20190610043838.27916-4-npiggin@gmail.com>
 <20190610141036.GA16989@lakrids.cambridge.arm.com>
 <1560177786.t6c5cn5hw4.astroid@bobo.none>
 <a1747247-f4f6-ea9a-149c-07c7eb9193d8@arm.com>
In-Reply-To: <a1747247-f4f6-ea9a-149c-07c7eb9193d8@arm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560915007.fpyj1b1zh5.astroid@bobo.none>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anshuman Khandual's on June 11, 2019 4:17 pm:
>=20
>=20
> On 06/10/2019 08:14 PM, Nicholas Piggin wrote:
>> Mark Rutland's on June 11, 2019 12:10 am:
>>> Hi,
>>>
>>> On Mon, Jun 10, 2019 at 02:38:38PM +1000, Nicholas Piggin wrote:
>>>> For platforms that define HAVE_ARCH_HUGE_VMAP, have vmap allow vmalloc=
 to
>>>> allocate huge pages and map them
>>>>
>>>> This brings dTLB misses for linux kernel tree `git diff` from 45,000 t=
o
>>>> 8,000 on a Kaby Lake KVM guest with 8MB dentry hash and mitigations=3D=
off
>>>> (performance is in the noise, under 1% difference, page tables are lik=
ely
>>>> to be well cached for this workload). Similar numbers are seen on POWE=
R9.
>>>
>>> Do you happen to know which vmalloc mappings these get used for in the
>>> above case? Where do we see vmalloc mappings that large?
>>=20
>> Large module vmalloc could be subject to huge mappings.
>>=20
>>> I'm worried as to how this would interact with the set_memory_*()
>>> functions, as on arm64 those can only operate on page-granular mappings=
.
>>> Those may need fixing up to handle huge mappings; certainly if the abov=
e
>>> is all for modules.
>>=20
>> Good point, that looks like it would break on arm64 at least. I'll
>> work on it. We may have to make this opt in beyond HUGE_VMAP.
>=20
> This is another reason we might need to have an arch opt-ins like the one
> I mentioned before.
>=20

Let's try to get the precursor stuff like page table functions and
vmalloc_to_page in this merge window, and then concentrate on the
huge vmalloc support issues after that.

Christophe points out that powerpc is likely to have a similar=20
problem which I didn't realise, so I'll re think it.

Thanks,
Nick
=
