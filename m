Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D7349766F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 01:26:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhrPQ1YVdz3bN6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 11:26:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=epwX248b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=epwX248b; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhrNh3XpVz2xXW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 11:25:24 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id y17so3590389plg.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 16:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=z7ejXSlc8OqC7clFdQTxKINIGsB0NXecYA0uP7W7k78=;
 b=epwX248blShsiZ0DXijFNoZpYhbWaWUbV/3I81aYCW90KS8XOZnXXHBobumzy/VxAq
 L4m1MQ4AuTZf/gwbLFjwlVJkv9Tm51iEjxXAM8hl/EJB+SAfu2YW9iCxMSBQhmSplO5D
 Yt+aaYG/9AY3+dVDQbIvphbOjBKfYZBbzBOs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=z7ejXSlc8OqC7clFdQTxKINIGsB0NXecYA0uP7W7k78=;
 b=410mGmdNOgN6jk8+/2wCpxjUqe47U+bg3aYkc0fxKENnuJDnz6X5VS9GlJH72aE3y9
 iBwrf1TxpXeAWB84kl3TscK7kMz9/NGdSWnCwqwzYc+LE70dRvIl5vSOcGrG+pZG2++L
 jIMSyAOrqjDdrrkgejSehu78MzFVQFh34p3fNqwJM+6qGdTUXz8yAhm/kQT0IfM0Qk7i
 6VOrJa83c2zGQfRiLjCC/oUjxUuV9d0PFH09eLYyyJlA3FlPmQafgu2epk4Q/tMqkXdn
 fw3+9oJxbBRY6BD8WKQ9mdQEq+BU1/KLXmlu+yGcwBbf/upISc/79e45+1XDhhbkAR8F
 9Saw==
X-Gm-Message-State: AOAM531YVPsyevmWKuyjoOepgZhkr4l3PTT/b7f4Lxmrc0BJ7B/vj3Va
 0FQ0vY4E8T4oF3GRbwhBKZjrnQ==
X-Google-Smtp-Source: ABdhPJxI6xCUpjBCqmH79kC+VS2aIykW6ObPxGxUX5LaCRPBLzK+fuG+C/VuEMqgpKAVvt/rNogj+A==
X-Received: by 2002:a17:903:22cf:b0:14b:5079:3fa7 with SMTP id
 y15-20020a17090322cf00b0014b50793fa7mr2562980plg.148.1642983921031; 
 Sun, 23 Jan 2022 16:25:21 -0800 (PST)
Received: from localhost ([2001:4479:e300:600:c66b:6249:d8f2:7a6])
 by smtp.gmail.com with ESMTPSA id q8sm7921571pfl.143.2022.01.23.16.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 16:25:20 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Greg KH <gregkh@linuxfoundation.org>, Nayna Jain <nayna@linux.ibm.com>
Subject: Re: [RFC PATCH 0/2] powerpc/pseries: add support for local secure
 storage called Platform Keystore(PKS)
In-Reply-To: <YeuyUVVdFADCuDr4@kroah.com>
References: <20220122005637.28199-1-nayna@linux.ibm.com>
 <YeuyUVVdFADCuDr4@kroah.com>
Date: Mon, 24 Jan 2022 11:25:17 +1100
Message-ID: <87sftec74i.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org,
 Douglas Miller <dougmill@linux.vnet.ibm.com>,
 George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg,

> Ok, this is like the 3rd or 4th different platform-specific proposal for
> this type of functionality.  I think we need to give up on
> platform-specific user/kernel apis on this (random sysfs/securityfs
> files scattered around the tree), and come up with a standard place for
> all of this.

I agree that we do have a number of platforms exposing superficially
similar functionality. Indeed, back in 2019 I had a crack at a unified
approach: [1] [2].

Looking back at it now, I am not sure it ever would have worked because
the semantics of the underlying firmware stores are quite
different. Here are the ones I know about:

 - OpenPower/PowerNV Secure Variables:
 
   * Firmware semantics:
     - flat variable space
     - variables are fixed in firmware, can neither be created nor
        destroyed
     - variable names are ASCII
     - no concept of policy/attributes
     
   * Current kernel interface semantics:
     - names are case sensitive
     - directory per variable     


 - (U)EFI variables:
 
   * Firmware semantics:
     - flat variable space
     - variables can be created/destroyed but the semantics are fiddly
        [3]
     - variable names are UTF-16 + UUID
     - variables have 32-bit attributes

   * efivarfs interface semantics:
     - file per variable
     - attributes are the first 4 bytes of the file
     - names are partially case-insensitive (UUID part) and partially
        case-sensitive ('name' part)

   * sysfs interface semantics (as used by CONFIG_GOOGLE_SMI)
     - directory per variable
     - attributes are a separate sysfs file
     - to create a variable you write a serialised structure to
        `/sys/firmware/efi/vars/new_var`, to delete a var you write
        to `.../del_var`
     - names are case-sensitive including the UUID


 - PowerVM Partition Key Store Variables:
 
   * Firmware semantics:
     - _not_ a flat space, there are 3 domains ("consumers"): firmware,
        bootloader and OS (not yet supported by the patch set)
     - variables can be created and destroyed but the semantics are
        fiddly and fiddly in different ways to UEFI [4]
     - variable names are arbitrary byte strings: the hypervisor permits
        names to contain nul and /.
     - variables have 32-bit attributes ("policy") that don't align with
        UEFI attributes

   * No stable kernel interface yet

Even if we could come up with some stable kernel interface features
(e.g. decide if we want file per variable vs directory per variable), I
don't know how easy it would be to deal with the underlying semantic
differences - I think userspace would still need substantial
per-platform knowledge.

Or have I misunderstood what you're asking for? (If you want them all to
live under /sys/firmware, these ones all already do...)

Kind regards,
Daniel


[1]: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-May/190735.html
[2]: discussion continues at https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-June/191365.html
[3]: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-June/191496.html

[4]: An unsigned variable cannot be updated, it can only be deleted
     (unless it was created with the immutable policy) and then
     re-created. A signed variable, on the other hand, can be updated
     and the only way to delete it is to submit a validly signed empty
     update.
