Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33721DA07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 02:08:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44slP52MxJzDqNf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 10:08:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Or6uEcGq"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44slMW0dVlzDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 10:07:02 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id i21so840244pgi.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 17:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=n2mvnFGe7DhWnAVJ4HPTWEsItuKdoQBnBqAP6kIcYug=;
 b=Or6uEcGq20/dbV741dpgRcmnluoZolSsauu907Q2n5IqtHesTqLypagpN4KylfV4J4
 gV/Ri1WN8QiMSpSFwMNVrtg+g50Mh9dq9f59O5tPGvKm4CoKzYz808goOti/dswLGmR1
 AYMHlHdbG1/yE0hzyy72pnjLNc6uo7AC6CMfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=n2mvnFGe7DhWnAVJ4HPTWEsItuKdoQBnBqAP6kIcYug=;
 b=Ozcb41vbtvqlTxcwldI8PgrpBN4PUFIy8oLINLzv1aOqwqH1TsiSYIQ0myHdy3pc5/
 cXVA2hfwubhzBo/i2Px1MNm/KEswaB0AJPiogJpshe/KLIlRzpqbAvR6WdgTf5IUHCQb
 pBRbCDm4cWeS9kr4EMJo22j0drohZSxGtiQ4Z6P64xWcC4yFR7LQB4W0vvXB1TdM2h4a
 /KkU/thNB8lPIUZORp/OORkUsPWWD+D9mpVRBIGeXRE0UyUG5Kl0+/23Gh9M8q1KRdjF
 /gSzqQZB5DRBAxR0eEYf/Y2LjW1GKUNTuazRsOF/+c7/lyuA+YYv4ih0VZ/i49u0sm/7
 Jimg==
X-Gm-Message-State: APjAAAVpd4E7doGh74QMyHWoJtUzY9Z2dQGjpp8IEdeFskLO5xdJnXQ0
 l9o/lqIUQILfSYt51MlCh9FvIg==
X-Google-Smtp-Source: APXvYqwb6MwKjVD4beBIgVSrqvnOCys+S049kGs7qQXovjqAUY28iQ+jdtiBGffI7iAuh/EIjCR1vg==
X-Received: by 2002:a63:4714:: with SMTP id u20mr47465141pga.316.1556496419070; 
 Sun, 28 Apr 2019 17:06:59 -0700 (PDT)
Received: from localhost (ppp121-45-207-92.bras1.cbr1.internode.on.net.
 [121.45.207.92])
 by smtp.gmail.com with ESMTPSA id w23sm44714029pgj.72.2019.04.28.17.06.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 28 Apr 2019 17:06:57 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Matthew Garrett <mjg59@google.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: Re: [PATCH V32 01/27] Add the ability to lock down access to the
 running kernel image
In-Reply-To: <CACdnJus9AhAAYs-R94BH7HDuuQfXjgdhdqUR6Pvk9mxbuPx1=Q@mail.gmail.com>
References: <20190404003249.14356-1-matthewgarrett@google.com>
 <20190404003249.14356-2-matthewgarrett@google.com>
 <059c523e-926c-24ee-0935-198031712145@au1.ibm.com>
 <CACdnJus9AhAAYs-R94BH7HDuuQfXjgdhdqUR6Pvk9mxbuPx1=Q@mail.gmail.com>
Date: Mon, 29 Apr 2019 10:06:51 +1000
Message-ID: <87wojdy8ro.fsf@dja-thinkpad.axtens.net>
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
Cc: Linux API <linux-api@vger.kernel.org>, cmr <cmr@informatik.wtf>,
 James Morris <jmorris@namei.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 LSM List <linux-security-module@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Matthew Garrett <mjg59@google.com> writes:

> On Tue, Apr 16, 2019 at 1:40 AM Andrew Donnellan
> <andrew.donnellan@au1.ibm.com> wrote:
>> I'm thinking about whether we should lock down the powerpc xmon debug
>> monitor - intuitively, I think the answer is yes if for no other reason
>> than Least Astonishment, when lockdown is enabled you probably don't
>> expect xmon to keep letting you access kernel memory.
>
> The original patchset contained a sysrq hotkey to allow physically
> present users to disable lockdown, so I'm not super concerned about
> this case - I could definitely be convinced otherwise, though.

So currently (and I'm pretty new to this as I've only recently rejoined
IBM) we aren't considering access to the console to be sufficient to
assert physical presence on bare-metal server-class Power machines. The
short argument for this is that with IPMI and BMCs, a server's console
isn't what it used to be. Our console is also a bit different to x86:
we don't generally have bios configuration screens on the console.

In your example, a sysrq key would allow you to disable lockdown after
the system has booted. On Power though, we use Linux as a bootloader
(Petitboot: https://github.com/open-power/petitboot) so being able to
disable lockdown there allows an IPMI-connected user to prevent a signed
kernel being loaded in the first place. I don't know if this is
_actually_ worse, but it certainly feels worse.

There are of course some arguments against our approach. I'm aware of
some of them. I'm also very open to being told that not equating console
access with physical access is fundamentally silly or broken and that we
should rethink things.

Regards,
Daniel
