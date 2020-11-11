Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F52AE930
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 07:42:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWFXW0zgYzDqY3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 17:42:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Fy4c28ce; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWFTG1gzgzDqHG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 17:39:44 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id gv24so209976pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 22:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=t+Jy28aeNB1RwaNjEhwLXsJjBqbzm5Wsk5Ve6lpCpHc=;
 b=Fy4c28ceB9IqOKbwPvTqWCSPefCSQN1/UlAKlkdlaGHLbQT/cxkXuMsVDK3YL7VzFG
 0OhhEihZeki61aex2edWX0zG+JiCKFUXvtmmZYmJ+M6D5VBkFa0jwwtwz//1cXRDE+5N
 PyyorbJ+y2COs4C6LjpB86OwG8f78xsrpshaDHfBp++cqtl2oreKpNA3L+QzHZvopotb
 SMcBELx/Y9DriymaONHocCkDcNzN8rZksp9FaufO9zB6Oijy060e4Pyp8dggjxRqCnLL
 7u+hLbKKMedJNNUayUVczODRtgzzJPxNpSm+AlI+QtDYMVeWL/MyQ0/QcpH9KajcZjqn
 oEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=t+Jy28aeNB1RwaNjEhwLXsJjBqbzm5Wsk5Ve6lpCpHc=;
 b=iLStrDyaVqmVDAxCq2BBPicG/8FkA4EK1fLujJQT6cR56hVJ1yyUxL5M2++ZsU86dz
 f/8aVyTf7PZrkuEMfqcFK4H++mUYlgK5axAqElvQ93cvihijlavzGz0wJJIloFHnM+eA
 ri8Zlzl+5tRKMz5gjHz4hBL+sMPeIM7HAZVnbHTSoprXBs9tPO6DMk8y1s9f0dlq75kN
 vSpxof7Vi+OLv3BrJPf1fswnW6whxiBp514E55E7URC4vxeBd8g+xyJUYmfgu62LG0jI
 O4jiReeab/CgzqMgcmc4+AXkeC4SiRWdY5KILltOIsvW7S+UhIB87X/Vva+EdmIi/KIO
 dYUw==
X-Gm-Message-State: AOAM531gsAsWOF3WrzYWrylGAJYUpp2FeHJkeh7LZ4U70u5pmhMeNBHQ
 bebpzjaE6161jAyHULWkiF/wFvnaXUk=
X-Google-Smtp-Source: ABdhPJy1epNwO8KNf8bMAvbtFyd4397UV8mCUNlPVywJYXSxVo9hHVfoZB4hKJ1hY8ocfF7mNFAJhA==
X-Received: by 2002:a17:90a:df16:: with SMTP id
 gp22mr2375796pjb.213.1605076779784; 
 Tue, 10 Nov 2020 22:39:39 -0800 (PST)
Received: from localhost (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id t26sm1260341pfl.72.2020.11.10.22.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 22:39:39 -0800 (PST)
Date: Wed, 11 Nov 2020 16:39:33 +1000
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
 <1605069958.zq8gnsvl6e.astroid@bobo.none>
In-Reply-To: <1605069958.zq8gnsvl6e.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1605076126.b04m8ile46.astroid@bobo.none>
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

Excerpts from Nicholas Piggin's message of November 11, 2020 2:46 pm:
> Excerpts from Christophe Leroy's message of November 10, 2020 9:19 pm:
>>=20
>>=20
>> Le 10/11/2020 =C3=A0 09:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Excerpts from Christophe Leroy's message of November 6, 2020 6:14 pm:
>>>>
>>>>
>>>> Le 05/11/2020 =C3=A0 15:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>>> This also moves the 32s DABR match to C.
>>>>
>>>> Is there a real benefit doing this ?
>>>=20
>>> Oh I missed doing it, but yes I think bad_page_fault and do_break shoul=
d
>>> probably be implemented with the DEFINE_INTERRUT_HANDLER wrappers.
>>>=20
>>=20
>> Yes, anyway, do we need to do that change ? Can't the dispatch between d=
o_break() and page fault=20
>> handling remain in handle_page_fault() ? What's the benefit of going int=
o do_page_fault() and coming=20
>> back ?
>=20
> You might be right, I'll take another look at it.

For 32-bit, we need to come back to save NV GPRs. Certainly the 64s code=20
stays in do_page_fault because it always saves them.

Now I don't think that's the nicest thing to go in and out of the=20
interrupt wrappers twice in these cases, but for a first pass I think=20
it's okay. Either we could add another type of error-case wrapper that
does some adjustment if it becomes necessary, or we find a nice way to
save NVGPRs from C code.

If we could somehow parse unwind data to find where the NVGPRs are saved=20
by the compiler and generate a little code stub to load them out, would
be the ultimate :) Maybe one day...

Thanks,
Nick
