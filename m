Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DACE9380A19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 15:04:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhTJY71JBz3bs9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 23:04:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ovF/DZ6v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ovF/DZ6v; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhTJ53vMlz2ymX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 23:04:21 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 018C26145E
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620997427;
 bh=KjRucVq9b2NKDaj10nQp3ecBtpjWikZo5h6VILTp9TQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ovF/DZ6vdNyVMSH9t0zjMiEagYR721FRrBVU2xZxXX/OUhYjI4DoeKwouVrElnjNo
 H2LSDPkvaHREyrn1HyHd22hBkz3doo6H4OkJrDEXpJxqK/vktxIuA+Y7acAYuukBaa
 8O0eESoVXTaqfbi08ympBP0C9YMyag7kUEqEptmhtLOP4nWQVjNY971q4Zvmp63YMt
 FApG43bQoRmB4kFdndQzCDNsl0JV6NwuAMLOJTgNrK92jp4knsyOUt4/jlG789UKl4
 nQaqjm0JUA5D0nUp8/StBDRTX5A//K7DIJJsrFgQEHzMgV0l+g4iKzmuREdaMda1QZ
 5UKkdWqvLttRg==
Received: by mail-wr1-f42.google.com with SMTP id v12so29941105wrq.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 06:03:46 -0700 (PDT)
X-Gm-Message-State: AOAM532BdWbJfrNUfK7gRQAFwk5KuwStoIMnp3xNEzSxXr1I0JISVBIP
 DU/pTZaeW95iTnKXisS5od/CAzb0lcUaADM0AAs=
X-Google-Smtp-Source: ABdhPJzlvCIkpR1F+kgydYHRKzdkFDddvZpYrU9rVtIDsh8sEqa4UTJsy0hLf91X5lxvVhxcxulzbSr4KB+n1tMKazY=
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr60213997wrz.105.1620997425625; 
 Fri, 14 May 2021 06:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210514100106.3404011-1-arnd@kernel.org>
 <20210514100106.3404011-6-arnd@kernel.org>
 <20210514114813.GJ10366@gate.crashing.org>
In-Reply-To: <20210514114813.GJ10366@gate.crashing.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 14 May 2021 15:02:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a04OZzSwV0039GiA0x=Kmp_mUvNz_CEyVFo8NJHTv2smg@mail.gmail.com>
Message-ID: <CAK8P3a04OZzSwV0039GiA0x=Kmp_mUvNz_CEyVFo8NJHTv2smg@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] powerpc: use linux/unaligned/le_struct.h on LE
 power7
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 14, 2021 at 1:48 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
> On Fri, May 14, 2021 at 12:00:53PM +0200, Arnd Bergmann wrote:
> > Little-endian POWER7 kernels disable
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS because that is not supported on
> > the hardware, but the kernel still uses direct load/store for explicti
> > get_unaligned()/put_unaligned().
> >
> > I assume this is a mistake that leads to power7 having to trap and fix
> > up all these unaligned accesses at a noticeable performance cost.
> >
> > The fix is completely trivial, just remove the file and use the
> > generic version that gets it right.
>
> LE p7 isn't supported (it requires special firmware), and no one uses it
> anymore, also not for development.  It was used for powerpc64le-linux
> development before p8 was widely available.

Ok, thanks for the clarification.

Should we just remove the Kconfig option for it then as further cleanup?
Is there any other code such as alignment trap handling that could be
removed if LE POWER7 gets dropped?

      Arnd
