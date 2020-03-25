Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB13192311
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 09:45:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nMBY2PbVzDqcq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 19:45:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=balbif@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=atWEsClA; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nM8m15tjzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 19:43:34 +1100 (AEDT)
Received: by mail-ed1-x541.google.com with SMTP id i16so394678edy.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 01:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=u1JHVU3RAXWpWzxoEBTeSB/vNLewo28StJEFtqtyLoU=;
 b=atWEsClArOzGKdLN4osuAk7d+XSEIi82gzITfDKHYSAZ1c+WEd3Ip/J9eETstflnDX
 LqQd2q6Qz/8hg3HTYMLWyI1r/uM72eIqZfUXxCdkYr7yZws3ErK2kSKYsVGHg9Cm/mtf
 X32RT6WFx/DxNfiiCaK5OWiM6W7e7JeJWoOEDUpgi05XVpNAtJvKJtyzJhblBES6Z/65
 eVjEoRNppJWoaSaLMrUSnZYRRo6sbYBlTHOOD7K3R3s4Elu3PeBJ5C7L2ulwEL9qqsKz
 nUa//b6Qd9KEX8nStmeRXzWQurXqzw+nAWyASHspx5uRQOtfM4KAnUAZ5r+BnFZwaD/D
 axHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=u1JHVU3RAXWpWzxoEBTeSB/vNLewo28StJEFtqtyLoU=;
 b=Z6gXY4OleSgWnUDkz7nRysV6Ng+fM6DpsniQKRak2M1RfgYVg3A31L25W/nZ/L4iVN
 nidIq3/TTi+mJkVPTVfGc08j8U3jeus0Mti2clQjIQJPnAIRHDO8+dADSPWyHq7RQIPN
 w/79BwWAL0rodtxjIrnOTmWVTWcQ3NOp13UNwmz5K9Hb14MwucApxXG2YhBzw/P62P3x
 EO2Sef/JFn7XdAlKbnVlixfMhHbltbsXlCoaGPG8JXmAx0b7vlGuse31GvciEcQD1Gij
 Y3bjqqKSD0WazYcKXP35LNGCQrRx6knvAdbrSp3wl361lKfqCrHT1gU7dHpx7J56JE6F
 +CCQ==
X-Gm-Message-State: ANhLgQ0AwRfSBibyknFo/xZggYQMbEv5uU55ltTzxWiS7iPKOqSY3Wko
 HgiBjmlJZQLKczOKRTenQlcvuzEKssY=
X-Google-Smtp-Source: APiQypL8bMjMZDQevXNQgwWPs9QVjiJXOb2ocQYyMJ5E3G+qtV0tyxn/wNi26nCLubp8d+GA3TyEPA==
X-Received: by 2002:a2e:9797:: with SMTP id y23mr1235851lji.183.1585125484852; 
 Wed, 25 Mar 2020 01:38:04 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id f7sm522142ljj.4.2020.03.25.01.38.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Mar 2020 01:38:03 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch V3 03/20] usb: gadget: Use completion interface instead of
 open coding it
In-Reply-To: <20200321113241.043380271@linutronix.de>
References: <20200321112544.878032781@linutronix.de>
 <20200321113241.043380271@linutronix.de>
Date: Wed, 25 Mar 2020 10:37:57 +0200
Message-ID: <87blokde3e.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-ia64@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Sebastian Siewior <bigeasy@linutronix.de>, platform-driver-x86@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Davidlohr Bueso <dave@stgolabs.net>,
 kbuild test robot <lkp@intel.com>, Brian Cain <bcain@codeaurora.org>,
 linux-acpi@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
 linux-hexagon@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Greentime Hu <green.hu@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Nick Hu <nickhu@andestech.com>,
 Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 Davidlohr Bueso <dbueso@suse.de>, netdev@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, "David S.
 Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thomas Gleixner <tglx@linutronix.de> writes:

> From: Thomas Gleixner <tglx@linutronix.de>
>
> ep_io() uses a completion on stack and open codes the waiting with:
>
>   wait_event_interruptible (done.wait, done.done);
> and
>   wait_event (done.wait, done.done);
>
> This waits in non-exclusive mode for complete(), but there is no reason to
> do so because the completion can only be waited for by the task itself and
> complete() wakes exactly one exlusive waiter.
>
> Replace the open coded implementation with the corresponding
> wait_for_completion*() functions.
>
> No functional change.
>
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: linux-usb@vger.kernel.org

Do you want to carry it via your tree? If so:

Acked-by: Felipe Balbi <balbi@kernel.org>

Otherwise, let me know and I'll pick this patch.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl57GGUACgkQzL64meEa
mQY/phAAyKS/jK6b1hVevAPsOBS5Zyk+RBQmkmps/3C2lTyyturSmqT3TAMZyTZo
/HPtsvyUYn8RBI5Pa62mvcnGi+/Lmk76YzmUqn/VJRe+J8kjuFI6IoyT4uDxdUsB
qGTiuQ5qbV7Ft3fvLoEEbuyPZeDc/pbfFyK78ajdAYec4MGS8r12tWzhRZTRyRAG
4fb/PjPcfk8/9eTkdgnjgINZTiwT9YN7HWpEfajl3MhlYK9pZh/J7swRaYwZULBo
+eVd6a6ZYt0YLC8wVQ/kJ9Q3EttmWBwPJB4FIXMzYDkXx2Z898ZUKeIJ8IXlwKSh
CynbYGL7rNJQ+UDpVA8/y5Mqqnu3pAht/csgfrBxm/ukjkMphIDjpzuUaODgH5W3
Eb4EXNgvgspzEMgz6pv9INgPPh2tWRmBQex8qOLrs1xups+ZmhFSHGKCUs8hxlDj
Zk0U6Mce6mopXiCf2iVgrv9ItHlp4myA/HwWEub+LwOJi8tCt+vCjzXloWMx4Ha+
TNyxLHrqLaeTQoYgl1wJQMjIhmcrb9UMBaJ5FhKdaXAGfAeicPSzVqVHG/yl6nds
Z2cTMhW5kIxJDMAOuemeYZLY8PMzXrG5xHT7Da3yOzurIOmp2rhvhjpt9TpjKDLE
3qsBCaxpICoolHqV8bAov175RPtyVvv5zdyXWulMD/1c2kVYiiY=
=IAgh
-----END PGP SIGNATURE-----
--=-=-=--
