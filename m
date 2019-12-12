Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE3C11CEA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 14:43:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YZkx48CRzDr2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 00:43:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YZhQ17hGzDr1j
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 00:41:25 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id p27so608647pli.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 05:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=K1dcdOatOeVeFsIQxT5aEB0ANkvhzz2V9qjht9zfLUs=;
 b=GdElbodEdxjlTrBwa3I6J+sEs4W2s8EoeCX3lxYPy4O5JSwTyZcODXGJSRA1xj4/Th
 5RtnvwUWSB2afNeAL6+3jSXcezJ6aTZ2Ul1yCG9FnmvdgLq0A/BabGqxJQXU4aLQibFm
 sZaLkJC5i3jZy2lEJbSUwiAQSB4z7dLoQktt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=K1dcdOatOeVeFsIQxT5aEB0ANkvhzz2V9qjht9zfLUs=;
 b=oitOKX9PXo3Obbm+RshqyvsB9AKFAQsgbsLWWas7qsbNf8uURasC3SBDk0BHXaPwqw
 WvgSBPLBPHB9ji/qu/fCHjeFlKOr5hl9wtyFXtsXyk7Dh0Pk9oO7gEU8iDrQaFmTe9L6
 Hq28FFj/SibULHJH18FUiOqSmMoYEHIcycyDePKN0htmEuTFdunYn4q8J00Q1D1njm2a
 9S2NyL5NChV13KW8JmdHXfudCfRyoV06VOYdaIW2aHtZ+SiVNUGey+1bbmQWjF3wkIfA
 LL8gyqQnh3g7m2P7aqw+77uYyKP6dWelL1e5DS6JV0MrsbRwQGtP7g3Eu8GLy+kpHl05
 4bBw==
X-Gm-Message-State: APjAAAXSp5LNGlaGafbNA5TM389TXp2eUOIdySewSuROb+2RFR6ssjio
 x2vLSdZ/nyrdL06f+FEd1Pz8Og==
X-Google-Smtp-Source: APXvYqzPs6Cbt1MwcGO7Ifn/65S78x+5CnY2vxScmtjpazHyalO6+YCcj2OzBuBrETruOG5iKaL2pw==
X-Received: by 2002:a17:902:9885:: with SMTP id
 s5mr9457771plp.217.1576158078207; 
 Thu, 12 Dec 2019 05:41:18 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-b116-2689-a4a9-76f8.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:b116:2689:a4a9:76f8])
 by smtp.gmail.com with ESMTPSA id i68sm7464966pfe.173.2019.12.12.05.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 05:41:17 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: Re: [PATCH v2 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
In-Reply-To: <414293e0-3b75-8e78-90d8-2c14182f3739@c-s.fr>
References: <20191210044714.27265-1-dja@axtens.net>
 <20191210044714.27265-5-dja@axtens.net>
 <414293e0-3b75-8e78-90d8-2c14182f3739@c-s.fr>
Date: Fri, 13 Dec 2019 00:41:14 +1100
Message-ID: <87tv65br0l.fsf@dja-thinkpad.axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

I think I've covered everything you've mentioned in the v3 I'm about to
send, except for:

>> +	/* mark early shadow region as RO and wipe */
>> +	pte = __pte(__pa(kasan_early_shadow_page) |
>> +		    pgprot_val(PAGE_KERNEL_RO) | _PAGE_PTE);
>
> Any reason for _PAGE_PTE being required here and not being included in 
> PAGE_KERNEL_RO ?

I'm not 100% sure quite what you mean here. I think you're asking: why
do we need to supply _PAGE_PTE here, shouldn't PAGE_KERNEL_RO set that
bit or cover that case?

_PAGE_PTE is defined by section 5.7.10.2 of Book III of ISA 3.0: bit 1
(linux bit 62) is 'Leaf (entry is a PTE)' I originally had this because
it was set in Balbir's original implementation, but the bit is also set
by pte_mkpte which is called in set_pte_at, so I also think it's right
to set it.

I don't know why it's not included in the permission classes; I suspect
it's because it's not conceptually a permission, it's set and cleared in
things like swp entry code.

Does that answer your question?

Regards,
Daniel
