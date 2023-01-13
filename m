Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FE366A721
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 00:32:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtyQG6LM3z3fDy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 10:32:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ap6EJUwR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ap6EJUwR;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtyPJ4zbFz3cDh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 10:32:02 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id o75so24233503yba.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 15:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FHJQSZN4Bz+51gS5J/dgy+JvIN/TZACnZnBolQHY7qg=;
        b=ap6EJUwREOlU5i8xCoqE59xQpluVaQp4H3tZIiWw7hYEabyjR5uVqMXZ9Z/5fcK8QE
         Z3f8Enc9PSFEd68x16B1jr3iTPdmgOfae8hFGFvidTcr6vuuJ/5gYGpYd+JjWFaB0wrn
         aUwHfh+rascZKjkcvsQmsyHAiD6RBZYebLg8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHJQSZN4Bz+51gS5J/dgy+JvIN/TZACnZnBolQHY7qg=;
        b=AfeLVvHcGw6EohD9NAQf8iW+H5XE6IpWis9vC8jyAlTuWVhsHF6VI7HyoOCbUAo6XF
         tg78hfkOmFjmo67azKHYbdnVRrPlRm03bfLMA8exkToT1NQbRsS9Qjo1XRmaCdoZ5/F6
         Vhtwp2pZbkaWyE9ln9B+/4pZgDrdAMKzCSm7kQgzUySBhhKhvsVnqoJZjvWr/kPYomlA
         RVmhAj7beYBRixWo5kqg9Kz9rkUrTVn3e26e9eZcHMj7GiN+pmYUxes4YrereTenZOL6
         7/WiIZvelJDpykOwRjWsCuLh/9IGR2LaTY0dmPio3cEw5O8ElP/CFShgszgju1ic9uCN
         b+mA==
X-Gm-Message-State: AFqh2ko5funpMXoe9OBf4cJZCjrkCsKtwwYhkf83foQsr5F/iHWiZL1Z
	SgWbo+wPiqsPr+Lm85fAULmK82upgAt+xAd5HfA=
X-Google-Smtp-Source: AMrXdXuEoSR/DuWjGZJTC/8N7MakOegXiwkjkE/NxdGgVLretEqlkQhMQz9tcdh2vx7DzDxoeGsx0w==
X-Received: by 2002:a25:4454:0:b0:6ff:19c7:bac1 with SMTP id r81-20020a254454000000b006ff19c7bac1mr69885349yba.12.1673652717742;
        Fri, 13 Jan 2023 15:31:57 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id w22-20020a05620a425600b006cbc00db595sm13584274qko.23.2023.01.13.15.31.56
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 15:31:56 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id pa22so11595035qkn.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 15:31:56 -0800 (PST)
X-Received: by 2002:a05:620a:4720:b0:6ff:cbda:a128 with SMTP id
 bs32-20020a05620a472000b006ffcbdaa128mr4443110qkb.697.1673652715770; Fri, 13
 Jan 2023 15:31:55 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com>
 <20230113184447.1707316-1-mjguzik@gmail.com> <SJ1PR11MB6083B48A2B2114EF833D69E2FCC29@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083B48A2B2114EF833D69E2FCC29@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Jan 2023 17:31:39 -0600
X-Gmail-Original-Message-ID: <CAHk-=wgTsc5z3cPo7+t2kRO1uRQML1w_o72nefyHOh8VMhqu0A@mail.gmail.com>
Message-ID: <CAHk-=wgTsc5z3cPo7+t2kRO1uRQML1w_o72nefyHOh8VMhqu0A@mail.gmail.com>
Subject: Re: [PATCH] lockref: stop doing cpu_relax in the cmpxchg loop
To: "Luck, Tony" <tony.luck@intel.com>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, "will@kernel.org" <will@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "jan.glauber@gmail.com" <jan.glauber@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 13, 2023 at 3:47 PM Luck, Tony <tony.luck@intel.com> wrote:
>
> The computer necrophiliacs at Debian and Gentoo seem determined
> to keep ia64 alive.
>
> So perhaps this should s/cpu_relax/soemt_relax/ where soemt_relax
> is a no-op everywhere except ia64, which can define it as cpu_relax.

Heh. I already took your earlier "$ git rm -r arch/ia64" comment as an
ack for not really caring about ia64.

I suspect nobody will notice, and if ia64 is the only reason to do
this, I really don't think it would be worth it.

              Linus
