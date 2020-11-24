Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B822C240C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 12:28:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgMGZ5QW9zDqKl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 22:28:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f;
 helo=mail-il1-x12f.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R0kOb1uw; dkim-atps=neutral
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgM2D2VBNzDqBb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 22:17:53 +1100 (AEDT)
Received: by mail-il1-x12f.google.com with SMTP id b8so3432765ila.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 03:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kCwjIYdpqEM8U35zgw/4H/yMv3E+nD1ENUKFhNRrQYM=;
 b=R0kOb1uwcKVc4OFDs2E96LK4pWWjgkKbH/xIji0Hv60maLt6o78ZMwg3M54KLw9rAs
 kD4GH7yTG8vE+nZf11aIkTl9qZBQ8AAcs12YYbt0jiQIpmH37eKj1IxUFCkmTz0cR5Fp
 NIna/7xoBWMl10Bk6b3JwvljobcGTMkxbbWk5cge1+EL8pWn4FpEdH6O4+zeZAma1h8b
 ifa4vf+zOPxiSpaYNtnxCu5BfIMQIqE5Hi71I8XqbVK7ycZTIWiM77VBDz+mqXUEvHDq
 KSd/SLLyFx/HS6Gopx4b9Mhb7ioKs+bmUiq4qD3EPrzTb0vHr3NKXPin1nLUCPnMGnsq
 y+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kCwjIYdpqEM8U35zgw/4H/yMv3E+nD1ENUKFhNRrQYM=;
 b=BvhvMMNq06kTBwCPlj+lGloxvKvTGlEC+asNxyCPqzqq0Ul3g6TTbC2hQ2tW1ebMpH
 PcZZx3bNmWjD52poEIhS+QpjYNd8zzUYC1nyiqxXkuXhawUjM0qwH5U6kC7WKP9Eqzk+
 bDGYLvI5zTthHXf9Jyhc5BoiHk9VoRhZAh1qcKSvOs8q0gNg6hd/MXs/NA6bcrCh6QDE
 NSSayX2HipXp3YBLsVY/1aihFy4311Dhh89iEtr6jWCFzUzyr6XNUMIIWWIybMad3pJP
 0c1rDxOZMlCbEaLYEVZWA2o8YlStlTJc5RuDK9+PAopKFLUogoyohfdyjhba0lBxmqcp
 tJ9Q==
X-Gm-Message-State: AOAM530Oc3Ue4NKoTqxvvrazMspTloxaAcbRs21wuh6fOAoNeLzw+a04
 re4eP4kBUYxZIlQeRX4WFE0jWyo/seYw6m+aK+Iwi2VcNHo=
X-Google-Smtp-Source: ABdhPJxqlvu8jW/BKHDd0PRvigoRdkSph6rrQrarwVb+XmD453RA83otXmeqniTK/tPVVyyE5DaLy3RrEE8Zz6nvN0w=
X-Received: by 2002:a92:c785:: with SMTP id c5mr2700337ilk.298.1606216668642; 
 Tue, 24 Nov 2020 03:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20201103044503.917128-1-oohall@gmail.com>
 <20201103044503.917128-3-oohall@gmail.com>
 <d192485d-c8e0-7798-4a7f-85efe68a41fa@linux.ibm.com>
In-Reply-To: <d192485d-c8e0-7798-4a7f-85efe68a41fa@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 24 Nov 2020 22:17:40 +1100
Message-ID: <CAOSf1CGxy_6cMzdoxrOJrcFbeoPF9yNX1iQGqCeCVqv2rKCz5w@mail.gmail.com>
Subject: Re: [PATCH 3/3] selftests/powerpc: Add VF recovery tests
To: Frederic Barrat <fbarrat@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 24, 2020 at 9:14 PM Frederic Barrat <fbarrat@linux.ibm.com> wrote:
>
> Is it possible to run those tests on pseries? I haven't managed to set
> up a LPAR with a physical function which would let me enable a virtual
> function. All I could do is assign a virtual function to a LPAR. When
> assigning a physical function to the LPAR, enabling a virtual function
> fails because of missing properties in the device tree, so it looks like
> the hypervisor doesn't support it (?).
>
> Same story on qemu.
>
>    Fred

IIRC having the guest manage SR-IOV was a half-baked feature that
never made it into a production phyp build. I never managed to get any
real documentation from the phyp folks about how it worked either. As
far as I can tell it's pretty similar to what we do on PowerNV with
the PE configuration being handled by h-call rather than OPAL call.
The main difference would be in how EEH freezes are handled and I know
there's *something* going on there, but I never really understood it
due to the lack of documentation.

I've been tempted to rip out all that crap a few times, but never
really got around to it. There was also some noises about implementing
support for guest managed SRIOV in pseries qemu, but I'm not sure what
ever happened to that.

Oliver
