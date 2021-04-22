Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B483F36791E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 07:12:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQlt34tXMz300T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 15:12:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=O5QJkoVf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O5QJkoVf; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQlsd56fCz2xYZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 15:12:19 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id m9so30676157wrx.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 22:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K2+e1oDiS7MWGuJTaGRRiMrN8mVbkWTxe2qRq2AZpNo=;
 b=O5QJkoVfqw+oxNplJGprOFaQFwP2fqtqGe5Yrujr1ucFdQXzxKQEIstAmNv5f7Vy8M
 Kja/yUyLJGGTp0js9M8TzqfZJRJw7Ust4eePJw2GJy4Da5KrMfWslxz7YaiA6bdul6BE
 +guxgbjLORR/8mbYJGZKEnchR5XuuqQ+BDj98RBZR42/9pek8NOuipwDgZ3Q3t9nBBFv
 rVQGZTPlwGiokADimSadGKlS29S1PvAP3EVQP4p7r+2N3WOFVcj3nmcGkNEK/CtPu+yf
 XXidE98/+yhND7xprG5F1+DgmE5L2YsdU97fq37pDkW2ZnzgDmukyOIV7vutauqbQXYA
 iMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K2+e1oDiS7MWGuJTaGRRiMrN8mVbkWTxe2qRq2AZpNo=;
 b=NpbzDJ9llV70cHWo5pk6+Onsz+F4+OMI4kBxu1NdmmBhDRcYh8Et/N6k1luUHaYcCO
 +p0norDtkEijfvuD+5natz+pOIppHJu5pELaiDzcu6jsjxcbYqEuP9fHzjrQ6PIwjmzz
 rHflpu1T92kuz1SZaADoKeqXO/NbyfT5xrkg80zgl9Utj0T0ATUpPpIY+BcR11DXweL6
 RECQEhW0NUM+fopq6SDwPJAX2v4eudc9a7F8UwILngN3V3sXcyfmDJ19H4TjqOEvXxCP
 DOZsERXehlbI9gtQAkHiHFsUGUHMXJdSu9Ai+UE57FwABFvEVVg2ULBJ97dg9F8c3MAU
 CKxw==
X-Gm-Message-State: AOAM5322uUXH6+XKqkRkAeAG8ChP8TUH8iqVImpGj4CCF49tqmc8kR2O
 AKr8aHA81IPn4TFdnDrCll8ggCHn3e02iLOVKa4=
X-Google-Smtp-Source: ABdhPJyCbAbQhS5JLvf1Sn7b5LM9PXw3hyiK3KWm/Q5dY2PoJhoWI9zc5YCTZcNwSa9FXAbJtdZebdU0Aebdlz6llG0=
X-Received: by 2002:adf:a3c4:: with SMTP id m4mr1647627wrb.217.1619068335063; 
 Wed, 21 Apr 2021 22:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210420213517.24171-1-drt@linux.ibm.com>
 <60C99F56-617D-455B-9ACF-8CE1EED64D92@linux.vnet.ibm.com>
 <51a63be8-9b24-3f72-71d0-111959649059@linux.vnet.ibm.com>
In-Reply-To: <51a63be8-9b24-3f72-71d0-111959649059@linux.vnet.ibm.com>
From: Lijun Pan <lijunp213@gmail.com>
Date: Thu, 22 Apr 2021 00:12:04 -0500
Message-ID: <CAOhMmr4YF6HyBfa4gZZFQqUK6tyw5io=WzSb6G08zhbtu1sU-g@mail.gmail.com>
Subject: Re: [PATCH V2 net] ibmvnic: Continue with reset if set link down
 failed
To: Rick Lindsley <ricklind@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: netdev@vger.kernel.org, Lijun Pan <ljp@linux.vnet.ibm.com>,
 Tom Falcon <tlfalcon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Dany Madden <drt@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 21, 2021 at 3:06 AM Rick Lindsley
<ricklind@linux.vnet.ibm.com> wrote:
>
> On 4/20/21 2:42 PM, Lijun Pan wrote:
> >
> > This v2 does not adddress the concerns mentioned in v1.
> > And I think it is better to exit with error from do_reset, and schedule a thorough
> > do_hard_reset if the the adapter is already in unstable state.
>
> But the point is that the testing and analysis has indicated that doing a full
> hard reset is not necessary. We are about to take the very action which will fix
> this situation, but currently do not.

The testing was done on this patch. It was not performed on a full hard reset.
So I don't think you could even compare the two results.

>
> Please describe the advantage in deferring it further by routing it through
> do_hard_reset().  I don't see one.

It is not deferred. It exits with error and calls do_hard_reset.
See my reply to Suka's.
