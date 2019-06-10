Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 010783AEF6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 08:25:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Mjmj5q2fzDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 16:25:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HhS3RPzE"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Mjkm3j3szDqP6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 16:23:40 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id v11so4460019pgl.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jun 2019 23:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=lxnikhRVrLC3Z73VDFr/xBpCYRqbKfZ/1e83VsEWBxE=;
 b=HhS3RPzEgNDje8ZeE1beB7YaEgCu7QXAMpLFxSnCvGu25AyoYFquLZjcQ9HS35cUHX
 OjJrIJNYihJovEDfKK7wREuQr6mX3fB/p+JMid/mCa450vk23OoTJr5PP8FLnAZCO0aa
 qZ/bB+1jKDDhnGobtz7oFe0mRjdxrsdGDVqCLxKtBZf6e4EOBP9YKmTkH9JsHMZeGCXE
 2pDr+73d3GfR+18xpVN9GWeSJ38ufuoTNbG7RsahD3eXWksL0ALWJ8NUM/q9fEgYy6fA
 CMlvOIEQQ3JYF08bPoCo+zTzYVoLdPgpnp1YHL+Z5oKAZ7GZTyv5lT8vFPLsrf3CCIwO
 pG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=lxnikhRVrLC3Z73VDFr/xBpCYRqbKfZ/1e83VsEWBxE=;
 b=IvTQGVAfbx4L/B8zJCxPjho0RlxZCw458P7Z3gRhjhfJEuS4srbHyrptTfjfF3M+EL
 jpBHd0/CzDv5qF4fc8zuHDYfDAhuFLcjtWpWPFnG8jr8GDkm7NIX7PIq3Mk03N+VbTsz
 LVnW9bulU60QXI6Y6nC7BYSKPRItkjaT0NY7TjwmGxnYIUpQY2UwBnu5GUuHdqND3pkL
 9wUVHzO+Mn0Gs01q4rRoPXFqvbFKKMcmEkDCaUAbms1a/QcRY+xTtk2Kzk25SOhxjaIs
 K4Y2RzHGDmLPBgNUp2Q/JmXeFfDwk33t797k5NxnZ1UN8Cg66NCx95NzlM9aFE/U1xjq
 IFng==
X-Gm-Message-State: APjAAAUhVuBLkdYtpOzqb12aXiIpYJ3BL3R/vxvnI+QF5vBdIUp3h/lV
 W2Atl7kdftNlYqk6LgnSI2s=
X-Google-Smtp-Source: APXvYqzkDxHd9EVmOstnNeKlU2BwYtI5fqWFffgbDeETtbK8xN0ov7dak0twrcQF3n8lvJidVKHyRg==
X-Received: by 2002:aa7:8c52:: with SMTP id e18mr3569440pfd.233.1560147818885; 
 Sun, 09 Jun 2019 23:23:38 -0700 (PDT)
Received: from localhost (60-241-56-246.tpgi.com.au. [60.241.56.246])
 by smtp.gmail.com with ESMTPSA id i3sm9824804pfo.138.2019.06.09.23.23.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 23:23:38 -0700 (PDT)
Date: Mon, 10 Jun 2019 16:21:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/4] mm: Move ioremap page table mapping function to mm/
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <20190610043838.27916-1-npiggin@gmail.com>
 <03de53e9-f1f9-1632-567e-b88aabc56764@arm.com>
In-Reply-To: <03de53e9-f1f9-1632-567e-b88aabc56764@arm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560147293.7fxg58sp20.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anshuman Khandual's on June 10, 2019 3:42 pm:
>=20
>=20
> On 06/10/2019 10:08 AM, Nicholas Piggin wrote:
>> ioremap_page_range is a generic function to create a kernel virtual
>> mapping, move it to mm/vmalloc.c and rename it vmap_range.
>=20
> Absolutely. It belongs in mm/vmalloc.c as its a kernel virtual range.
> But what is the rationale of changing the name to vmap_range ?

Well it doesn't just map IO. It's for arbitrary kernel virtual mapping
(including ioremap). Last patch uses it to map regular cacheable
memory.

>> For clarity with this move, also:
>> - Rename vunmap_page_range (vmap_range's inverse) to vunmap_range.
>=20
> Will be inverse for both vmap_range() and vmap_page[s]_range() ?

Yes.

>=20
>> - Rename vmap_page_range (which takes a page array) to vmap_pages.
>=20
> s/vmap_pages/vmap_pages_range instead here ................^^^^^^

Yes.

> This deviates from the subject of this patch that it is related to
> ioremap only. I believe what this patch intends is to create
>=20
> - vunmap_range() takes [VA range]
>=20
> 	This will be the common kernel virtual range tear down
> 	function for ranges created either with vmap_range() or
> 	vmap_pages_range(). Is that correct ?
> - vmap_range() takes [VA range, PA range, prot]
> - vmap_pages_range() takes [VA range, struct pages, prot]=20

That's right although we already have all those functions, so I don't
create anything, only move and re-name. I'm happy to change the
subject if you have a preference.

> Can we re-order the arguments (pages <--> prot) for vmap_pages_range()
> just to make it sync with vmap_range() ?
>=20
> static int vmap_pages_range(unsigned long start, unsigned long end,
>  			   pgprot_t prot, struct page **pages)
>=20

Sure, makes sense.

Thanks,
Nick

=
