Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E653707C8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 17:53:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXYfm5xKrz2yyQ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 01:53:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=blRUIoJd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=blRUIoJd; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXYfC6PRrz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 May 2021 01:52:35 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id y2so1850509ybq.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 May 2021 08:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JjYGMVIHK5n7yoxDPMXd66Acol9hZKelHx5UT6nH47Y=;
 b=blRUIoJdCmVMNiQDMHNaVJve98qPVFj9/24WjJdA429iQkxxVreNispe+BqiBA3d8W
 Acr7BVauP7zkcs15L+68w5EqDvJuqgqAQiUpqTLpjFrGI4w60FlbBjkAovszT+DhAO2Y
 tHmFz//OpI0cdY7Ho2lJ17ud/C/jzzNtemRy5ooBS5sildh6tdH/JXdOSWzcu0kUHuRk
 sWuz3sEcBwnrjw3SmYkDYCFW6/LI+qbeU5bNDNEyCV8lhk15528w6zCTI7qv8GD3C2Qr
 /6S1azORvcFztQ4nBtiPy2tzzOKKF9suofex4xX1vd9C6oVASMofpqqBqVOFa9w2DOS8
 wBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JjYGMVIHK5n7yoxDPMXd66Acol9hZKelHx5UT6nH47Y=;
 b=dax7ufg5118nHpxfk2smtdqkK77MyYvh5bcCXVwVD435bi6ycyQx7J5uCZ3hKAYGew
 ertDqpbo4hIAu7O3OyBlVTjt9JVjGZTu5qyjMxS11ursXX8Kubu5kUVqAQZFgdKMELgo
 YgdoCTFYUWj+oapbTllJ6AF5swt8/mEmCaIwyrXFPFTQhpCjwKbxGZJHQ2r5vHtiFJw/
 hXMwbLXhPJfNuSjdfnOmQ66IpeWkucPkwNP0q+8Rzh33o7mQX7Z3YkGjJkcRlTmppXsR
 qQomgNbQ/VoR1rKq92rthWuC+ck97Vnh2CMb6Q//LtVfn4U0CqJN/btkZ1aSKODfbyW+
 effA==
X-Gm-Message-State: AOAM531yoTTQ35KMNRTRO/NWr5z4d4rHpCboahxrYuHZVYlb2agym9zX
 wykf953KJJo81DG7fFt0rw9uITrPFJQyQj8dRxk=
X-Google-Smtp-Source: ABdhPJwv4Dai1oxa4I+vtOog2Hw6tEyYe4CX42qPfvaPtHahj/3ak3VQm5m0KU7mUuftqlcL6+PQQToSr4CzLa32hoM=
X-Received: by 2002:a25:c444:: with SMTP id u65mr14862039ybf.93.1619884352129; 
 Sat, 01 May 2021 08:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 1 May 2021 17:52:21 +0200
Message-ID: <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 1, 2021 at 5:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> More cleanups will be possible as follow-up patches, but this one must
> be agreed and applied to the mainline first.

+1 This will allow me to remove the __has_attribute hack in
include/linux/compiler_attributes.h.

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
