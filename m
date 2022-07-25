Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3976F5806E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 23:40:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsD4R0Ks3z3cCp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 07:40:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NfnvoOHS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NfnvoOHS;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsD3p1vMSz3blD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 07:40:20 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id m8so15589891edd.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 14:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Svnq6PTWJvjcH6wB0IJJSE2qfM0IwlvpgRaFDJ1yXKE=;
        b=NfnvoOHSP3zZm7efaO0Dl+FOW25HLaRUx8Kdh3kllWums9Bbs8NUJjkiUnkjUrxIIA
         X9zaEHrUz+7QYLUI3bOPGVcY2IsaQC3L2m+8yJZdgSsR3atszlfcx/eOrCe6eml95156
         0tPNw/SseoshXxPQHrdnKEeulaYkWUoz6I+Kt2NjvM5RQpTpLYa2K+/Zj8zX+7SjW55n
         eoa7Tp4iUtFKqaWV+Lnuu2wsARKRh0RTEeuaICnVMjBPCDkTOAhxO6FiAT6/F99cjc4a
         kPeSnXv2BIa1GcAG0GQvKUZ1E6XH0T0dXM23iSF1ivD8YmQbqtVqV6W5XkX5VJj9yRiY
         8nYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Svnq6PTWJvjcH6wB0IJJSE2qfM0IwlvpgRaFDJ1yXKE=;
        b=0Rm5Rgstl+Vfe2PuDnXAJUZ7ZKziqln8NE61G+9JFa5vNJQLk15Z2BW4OpQCgqtBD9
         ZQDKBzr6/dyoA9lpOybMwMmgFEUyoRFZkaLQf4jiubcF5n7EM9XOR0Vx+L9aVSjBErJU
         T2ZxTC1AFRzs0OXMkR3SvBTrGOgBq5WhDCzllUOPb/IfXTPnOIS1glFxZQT2/+tPYxLz
         qEicRncEFXOrbrLAHZUSPoGB8D1TvJ/PYwJ2qI0ziTNUzbQ9KywiDMKDYyFLvu89//d+
         JA02K08miGH2E4iWqzmclj3DK14kik6zPgpD8o5h6ma3Zbp2Gmrv0biW5FJxyw8AMeLR
         shfQ==
X-Gm-Message-State: AJIora9ldS1vN1KgOgb3PY8aZ5TlSvkj3ajIzP751HLNR18g7hwm0/Tk
	87Z9cw+OOxBcFQ4bUJXbYx5boPlyVrD8ZBpb78E=
X-Google-Smtp-Source: AGRyM1tfLZqgsFiedCHnAYgm5mfZLxKUiXFOh2IH6B1N1Ehfxj/paKwfZXArGLbbYqi2q6DMTJZheAYu5qUNsUJbA3k=
X-Received: by 2002:a05:6402:1768:b0:43b:c4b0:ffd3 with SMTP id
 da8-20020a056402176800b0043bc4b0ffd3mr14933861edb.163.1658785216157; Mon, 25
 Jul 2022 14:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-2-yury.norov@gmail.com> <CAHp75VfOmN=cTEs7gbwxZ7W3hXjBo67N4AmHHiDfcVfFzHkMLA@mail.gmail.com>
 <Yt7CJj8r3eo05pKd@yury-laptop>
In-Reply-To: <Yt7CJj8r3eo05pKd@yury-laptop>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 23:39:39 +0200
Message-ID: <CAHp75VcGPQkY9ApsX2fi6sK5=3U=0vKbrHZZ3x___wUtgrFRSA@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in archrandom.h
To: Yury Norov <yury.norov@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 25, 2022 at 6:19 PM Yury Norov <yury.norov@gmail.com> wrote:
> On Mon, Jul 25, 2022 at 09:28:12AM +0200, Andy Shevchenko wrote:
> > On Sun, Jul 24, 2022 at 12:19 AM Yury Norov <yury.norov@gmail.com> wrote:

...

> > >  EXPORT_SYMBOL_GPL(pm_power_off);
> >
> > ^^^ (Note this and read below)
> >
> > ...
> >
> > > +EXPORT_SYMBOL(arch_get_random_seed_long);
> >
> > It can't be like this. Brief browsing of the callees shows that.
>
> Is my understanding correct that you're suggesting to make it GPL?
>
> ppc_md is exported with EXPORT_SYMBOL(), and the function is in header,
> so it's available for non-GPL code now. I don't want to change it.

The symbols your function calls are GPL. As far as I understand (not a
lawyer!) it logically one may not call GPL and pretend to be non-GPL.

-- 
With Best Regards,
Andy Shevchenko
