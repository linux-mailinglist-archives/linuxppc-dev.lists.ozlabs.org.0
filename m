Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 557B866A4BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 22:05:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ntv8P14Y2z3fDD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 08:05:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=jrtc27.com header.i=@jrtc27.com header.a=rsa-sha256 header.s=gmail.jrtc27.user header.b=WyPZxkCn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=jrtc27.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=jrtc27@jrtc27.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=jrtc27.com header.i=@jrtc27.com header.a=rsa-sha256 header.s=gmail.jrtc27.user header.b=WyPZxkCn;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ntv7Q5M7pz2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 08:04:50 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id z5so21114280wrt.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 13:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBkw8r9CJeekbGYTh36DHrDJzIpEVDx7FXDOscNp7T0=;
        b=WyPZxkCnjCvhkc7g6P86uFd7Fb8vpM3n+uesRUn7HA8lXnCk+hdGRmD74Hd3qClAXr
         99+bPxh5BPIY+5nd+UxvG7gZI3VHQlimSzHRY8BISaJ5z6nUtr0ggkMStscDFaDXSq0/
         HZtoSQ+9i6OEvy8T1lpBvAZHrIsbCuo3VBo8DHE07aSfAsxZkWr9ZSM82WcnHL8/IU+7
         wW5sP73Z218c2PBOjC7ceJcYQ17Ai8Fqg00yKVhmsps7Kcl7kSDJ22J/BYG6kgXUoCX3
         SPnBNs5lAtwIIAsVOETmC+kMYcKXJ0Sz1psnV9snUHQEbeOMD/eW+0bLI0s/jZiAZEMU
         C5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBkw8r9CJeekbGYTh36DHrDJzIpEVDx7FXDOscNp7T0=;
        b=6Mf423z9B+cz4uhfUU6l+MLYdkHBEP/HsZkiULygFEvXBqdynq/H6/RrlC5fQua7zd
         BmEJR9OyrsGTVIcENyjYNVzZewbLzs899blDmXHaBbApXCTF5b7CZU/a0cJ2eBu2gvS+
         KNJF0jOXWAJz1892fsZD8yx3LlaCkROO0Cp6oy76ygZ2n3nd1Encry8HuMJ9A7OwkK5j
         yTnJApzy+jvm1Ng8jajhn8ljFfzvWtNXW8fJvDdzM51IB0aj6CY+US3AdfFHxTuMfJje
         lCgYxPohID6JhvZEAJv+K8vCb3oYjKF/fNrPYoSDlk1IhusQBlF1U1vIUYpKC1vaYhsX
         nMZg==
X-Gm-Message-State: AFqh2kop4v/sTmZsMAzmLdWby5/Kh10JAhCpwsHqYLWN8hGdcCM07F13
	zNVZhPq3q159sMx6vZWwMKdakw==
X-Google-Smtp-Source: AMrXdXtwPD0oKfV/V27AA18FKeuh/Wrgr9AuHTthzJvrbTN11U5FDTWCtGDza5FMagq10S7IxYI3KA==
X-Received: by 2002:adf:e647:0:b0:236:6c33:2130 with SMTP id b7-20020adfe647000000b002366c332130mr665230wrn.68.1673643885754;
        Fri, 13 Jan 2023 13:04:45 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d678b000000b0029e1aa67fd2sm1998172wru.115.2023.01.13.13.04.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Jan 2023 13:04:45 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: ia64 removal (was: Re: lockref scalability on x86-64 vs
 cpu_relax)
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <SJ1PR11MB60832EF4EA3D528533100F8DFCC29@SJ1PR11MB6083.namprd11.prod.outlook.com>
Date: Fri, 13 Jan 2023 21:04:44 +0000
Content-Transfer-Encoding: 7bit
Message-Id: <53F2E30D-FE1D-4710-B5FC-049905A7158E@jrtc27.com>
References: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
 <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com>
 <SJ1PR11MB6083368BCA43E5B0D2822FD3FCC29@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAMj1kXEqbMEcrKYzz2-huLPMnotPoxFY8adyH=Xb4Ex8o98x-w@mail.gmail.com>
 <Y8HDzzDaP5uY0v8K@Jessicas-MacBook-Pro>
 <SJ1PR11MB60832EF4EA3D528533100F8DFCC29@SJ1PR11MB6083.namprd11.prod.outlook.com>
To: "Luck, Tony" <tony.luck@intel.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Jan Glauber <jan.glauber@gmail.com>, "Torvalds, Linus" <torvalds@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13 Jan 2023, at 21:03, Luck, Tony <tony.luck@intel.com> wrote:
> 
>> For what it's worth, Debian and Gentoo both have ia64 ports with active
>> users (6.1 looks like it currently fails to build in Debian due to a
>> minor packaging issue, but various versions of 6.0 were built and
>> published, and one of those is running on the one ia64 Debian builder I
>> personally have access to).
> 
> Jess,
> 
> So dropping ia64 from the upstream kernel won't just save time of kernel
> developers. It will also save time for the folks keeping Debian and Gentoo
> ports up and running.
> 
> Are there people actually running production systems on ia64 that also
> update to v6.x kernels?
> 
> If so, why? Just scrap the machine and replace with almost anything else.
> You'll cover the cost of the new machine in short order with the savings on
> your power bill.

Hobbyists, same as alpha, hppa, m68k, sh and any other such
architectures that have no real use in this day and age.

Jess

