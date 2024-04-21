Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA9B8AC1FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 01:01:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dW4898ZS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VN3lL3g96z3dJV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 09:01:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dW4898ZS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=kayvonkamyar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VN03S6d30z2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 06:14:43 +1000 (AEST)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-4dae8b2d29bso977279e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Apr 2024 13:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713730480; x=1714335280; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IlWyjbjDphZPrh+A+ghjkmZe3wOOJmbYFrB2tNk+ITU=;
        b=dW4898ZSnweuQ4xcj/xvNDrDxJ9HjQkuTE+CT0fPcVdJF/VlMluzPs5Pr6PPssQx+9
         +nf1ErpClqDUbFzHu26g44Jnhtq4+UkdfnvhWYckW90IDz1IQ4F+CGHuYQq5IsrzE0sZ
         YN1BDZwtKhyb+4EfyRPAwt4Rtf35LqrVx35GOgvZh7QS7L6+LVU2JjE/DqcMks4qyz/W
         YiyHGg/JwgAmoL/qxghtwghxLKmeXcnsCIFo5uudWjBUP8PP0K1wTNSu3gG259a9Ixrz
         4vpNF/X7crrWe5ffbVaUdRVynIX77KQDt7iH7usgMMLALnhsU4+TMm8imAR3Ez8nmKab
         XUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713730480; x=1714335280;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlWyjbjDphZPrh+A+ghjkmZe3wOOJmbYFrB2tNk+ITU=;
        b=JV3vplJiF920PIAUaRWGHZGRty2/iVEAofCHtIZMeVALpjo6NN1abkWDXKoXO/KBn7
         gjmtui9BUm9wvSr9RvMweLexvM23k0tJZl+GazWPlQN+1qCsI8V2YXzhzjg/66aLqwGR
         T7ogofsFiHVIyhDfI8h4URH5Kv2mNy//STivPwoos/08CVwmAA+WhHDf1irZfdoj7TCy
         Xl86bF8OFbZO9MOitcTjnrnzf8LRdzLIw0XltgWxCI+37vQhFYGZs1TD4lqHgzck4vHM
         Mz1479+V0OQ28lh1uOYUhqvphMZhxlaQ28WBRO2d60suh+JhxOHl+PQgYAGkYofslfv7
         3RvA==
X-Gm-Message-State: AOJu0YyOamxUtRmZ3IC0XJbLQXznb0JaQw0/La2Ohmcq8aDGd7UwUD39
	kSIJJW7ary1aybFW01Ud30LqSdbS6TUkPC+lFEk4fT+/tmEC9Bw5SagCtnKEcvS99AVIdsoxXJ6
	4DuWHCMM6ONIOQBdaWMLp8tr2gw/pOLKxBx4=
X-Google-Smtp-Source: AGHT+IFE5HEtoKlffCJ1v1ok4XcPOHGs8+HoGGPprvAtQwvgQ4aLBGxzkczwCZSrdf1bPEdMfeCNcK6i+FMFsORonms=
X-Received: by 2002:a05:6122:2518:b0:4d3:cff6:79f0 with SMTP id
 cl24-20020a056122251800b004d3cff679f0mr9192144vkb.4.1713730479723; Sun, 21
 Apr 2024 13:14:39 -0700 (PDT)
MIME-Version: 1.0
From: The Mariocrafter <kayvonkamyar@gmail.com>
Date: Sun, 21 Apr 2024 13:14:28 -0700
Message-ID: <CAEgzAWxiWd8jhPoq5DrW0+2B31vuJvLnWzdS4-15VHZHftaETw@mail.gmail.com>
Subject: DOS Compatibility Card/Apple Houdini card support?
To: linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 22 Apr 2024 09:00:23 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Apple has released a few cards (The Houdini I, Houdini II, and DOS
Compatibility Card) that had entire computers on them minus the hard
drive, and were originally intended to only run DOS applications,
including Windows 3.x and 95, that had an x86 CPU, a sound card on the
Houdini II and higher, no FPU, none of the cards had any storage, and
a VGA port, and I think some models have some other serial port I'm
not too sure of. Certain Mac models came preinstalled with the DOS
Compatibility Card. When it comes to using this in Linux, the cards
come with lots of RAM (for it's time), with the most powerful card
supporting up to 80 megabytes of RAM. About the CPU, I'm not too
familiar with how the kernel supports CPUs internally, if the kernel
can support different architectures on different cores, or have
another CPU with a different architecture, but it could be supported
if the kernel can handle this without making the computer slow, like
reserving the x86 CPU for KVM exclusively. The VGA port on the unit
can act as another port for a display, which can display the Linux GUI
or terminal.

Information about this card can be found online quite easily, although
some links require the Wayback Machine as they are decades old. WIP
emulation for the Houdini II with a GPL v3 licence can be found:
https://github.com/dingusdev/dingusppc/commit/90f22d806677048813e0c89216a6430076b5b00f
with contact information for the reverse engineers that completed it.
If you own this card or a Mac preinstalled with the card, you can try
implementing this, and get extra RAM in return.
