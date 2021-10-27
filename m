Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F27343CABA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 15:33:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfV5Q345hz30Qv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 00:33:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DYJlq8de;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::133;
 helo=mail-il1-x133.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DYJlq8de; dkim-atps=neutral
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfV4k55R9z2xsm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 00:33:09 +1100 (AEDT)
Received: by mail-il1-x133.google.com with SMTP id h2so2914443ili.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 06:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nZXycHElx2PvePSgfI8q1PAKzVhVZLWU+GWvzXGtf+8=;
 b=DYJlq8deziZIZJjqh4x3V7jJEU6eO+sS5sDmopsCFiuS7lFXanCQKm7N0VRVGZlg6g
 onIelYweU690jMcik5iRC2TwHiHzAg7ona9I/tBh4bR9r6PTVG3y3R88wq0wvbA4ZmFA
 secTWT0tynWT0EMD5Q/u6K4Q+1uEDddm6/DHXTYIovSHWX4PJk8WLq3SQtNB7YKX6ScW
 LEGlCgLH4REMcno9uWkwRwU2/awOTKygiKVLSA0wbAAlgggE01wcuTPUnLR9inBRF8QH
 CYdFu/YGwFIlpCL0Titjt6e00yi5B9+i8jJxrbggP2QfS6BYQjGyIGbOK0pqzGHQzNPu
 7wAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nZXycHElx2PvePSgfI8q1PAKzVhVZLWU+GWvzXGtf+8=;
 b=YgnSpcQQlk076/U0rU9TYX+pD08QuETuraqDY7+zQgf35CEwKVPMFBApqi184e6nbg
 NL+fRXiyBUYz/6RBb3nlsbV086Dhq99dfyzdBqedK+5dKGuG2ZuHsS1LGTlCX1xx+cTC
 ylBb8RkJ2pXOR1+wAdTP4z1atH9gvCerTkT3RvLrln51O5IAVxh7vtE1S7+dbEhMR6nH
 hMgZpGckfgytg2oh59529oM01PjUpVP5bANG2MK9ZxW00sp9DPXgxNmpJFT73Voqtofw
 kj8HFKWj1N5BRECulA8yKXGNuSFzxD3MPQnGzaZzvPY3sXGixc2E0hB7XA23GyxtIe/Q
 +OZg==
X-Gm-Message-State: AOAM5317q7i9vAy/YXjVYPbQVri66+1Zfb9CANCO3sGPcwQLu3Qqhm+y
 4VXbWt/R87LlKtGXylQIGtc1FLXXSe2dUrIms44=
X-Google-Smtp-Source: ABdhPJyQM7nv4/L/+ZrHrxaFQWe4enGNCZfglV+MKpcO6gFgxgurDRXlVA2+RN1ozDoYfDM5GaAxiy3o0wvCISrJVMk=
X-Received: by 2002:a92:d08a:: with SMTP id h10mr17035457ilh.321.1635341585283; 
 Wed, 27 Oct 2021 06:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211027132732.3993279-1-arnd@kernel.org>
 <20211027132732.3993279-2-arnd@kernel.org>
In-Reply-To: <20211027132732.3993279-2-arnd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 Oct 2021 15:32:54 +0200
Message-ID: <CANiq72=fkx0BNz0oPuvVA_uEcE1BF92reKtsCbK1fv-fwx2yNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] fbdev: rework backlight dependencies
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-staging@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
 Jens Frederich <jfrederich@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, Lars Poeschel <poeschel@lemonage.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jon Nettleton <jon.nettleton@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 27, 2021 at 3:28 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Rather than having CONFIG_FB_BACKLIGHT select CONFIG_BACKLIGHT_CLASS_DEVICE,
> make any driver that needs it have a dependency on the class device
> being available, to prevent circular dependencies.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
