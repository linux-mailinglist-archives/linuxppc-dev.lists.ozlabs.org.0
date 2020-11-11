Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B59652AE79B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 05:49:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWC1V4R2PzDqQv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 15:49:02 +1100 (AEDT)
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
 header.s=20161025 header.b=I/2FsGCB; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWBz53DbMzDqWF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 15:46:57 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id z3so854878pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 20:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=xgRh8izBCbWBqLiRiv2RyerVxoEx2DFMdd44J4VomIY=;
 b=I/2FsGCBrelrcUfvxhyxQFZflfHRG5MFQxtFIjsi9STkKrIUrlndZOWd4FI04zVoKL
 FJ+nRK4+Slw0uQg927iVVluh7brqDil2Hg4wfQnhoFyzzsMAkEXSJAHpi1nL4pOgAK68
 rk8UDV2OPmARgzQzuV414xGVfMBN3CKjIADr7fBUttE4VJDR5fs8btUI8QE3gv6nlJrq
 aZeR+Yjzk04hQZ7OV+Gw/Q6yvXHtmc/9wQHQ5d9maVnSe1g257c/mS7IVQz2EIjZ3nwO
 qtyHptNkTvRiHlMNyZlRoTENPplBsS7mu3MTjb4XADCuXzjuNQXsaxbOQe7+vkU8iVGl
 J5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=xgRh8izBCbWBqLiRiv2RyerVxoEx2DFMdd44J4VomIY=;
 b=p83Jxhzu0+1P/UDn6UUGRT6SjGmyPk2awLMfooU/Fj2tizAYK7JwC/wc3cHe89QQ8f
 2Rv1WLbqZCWMOV+wZd7iccSiwEO+V79W9R6E0CC7KMAde/da1o2zaxovs8ZVXkB4PmBf
 cpBSm6tk7UVfIwE50hipdPn31Ret2Dfwiqm6kC3TIqovq9U/+TtUZaTitU3PtrPpevNq
 ESKmT68rZBBswN/iz4BYqwa3tGx7+GnBZsd7P/o+JrdWdJXGF4GnO1wIMrl6an+IkA1G
 CpImAQZ60hFRy3H4jnhy8lwySir1euSSblACNAZGRxEww1bZ2GCDkSe7nHRz2gxR6BYs
 jP6A==
X-Gm-Message-State: AOAM531kE71W0B6i6s5yeULPJcpBdLTlt8ReKSjVP1QZHOKztOrPk1tI
 ZAwdyIbuQ5jNn2qYlknjFwQ5TgE2PR8=
X-Google-Smtp-Source: ABdhPJyheeXVE6LJ8GZZIJBtcQAYj1pXN5lCzCl6xYR4PAXFcJC7R+6jtDfRnSrRi+Yh517sig/syw==
X-Received: by 2002:a62:2a81:0:b029:18c:310f:74fe with SMTP id
 q123-20020a622a810000b029018c310f74femr8917813pfq.50.1605070015247; 
 Tue, 10 Nov 2020 20:46:55 -0800 (PST)
Received: from localhost (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id e10sm735655pfh.38.2020.11.10.20.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 20:46:54 -0800 (PST)
Date: Wed, 11 Nov 2020 14:46:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 03/18] powerpc: bad_page_fault, do_break get registers
 from regs
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201105143431.1874789-1-npiggin@gmail.com>
 <20201105143431.1874789-4-npiggin@gmail.com>
 <8b325832-b843-7d01-8b0f-fc278c444ce5@csgroup.eu>
 <1604996998.52nfki5192.astroid@bobo.none>
 <882fa82f-e109-c76d-e0a8-2e4fe920db0b@csgroup.eu>
In-Reply-To: <882fa82f-e109-c76d-e0a8-2e4fe920db0b@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1605069958.zq8gnsvl6e.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of November 10, 2020 9:19 pm:
>=20
>=20
> Le 10/11/2020 =C3=A0 09:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of November 6, 2020 6:14 pm:
>>>
>>>
>>> Le 05/11/2020 =C3=A0 15:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> This also moves the 32s DABR match to C.
>>>
>>> Is there a real benefit doing this ?
>>=20
>> Oh I missed doing it, but yes I think bad_page_fault and do_break should
>> probably be implemented with the DEFINE_INTERRUT_HANDLER wrappers.
>>=20
>=20
> Yes, anyway, do we need to do that change ? Can't the dispatch between do=
_break() and page fault=20
> handling remain in handle_page_fault() ? What's the benefit of going into=
 do_page_fault() and coming=20
> back ?

You might be right, I'll take another look at it.

Thanks,
Nick
