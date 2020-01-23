Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 808CE14708D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 19:16:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483Vpk1B07zDqND
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 05:16:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=R8rUnlTA; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483VgF1yvrzDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 05:10:15 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id 203so3011502lfa.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 10:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eDGhNOsnfRqZ1FkvFFgvc9AjFE5Ddur1Pg9CKAfnAxU=;
 b=R8rUnlTAVJ23suSGKIAk3x/NWMyIV1571Zyk795MWw02ibpxnwpaVKBgIpemglXFyP
 UyAn/M4pPrtxudOzb1Yimjimwf7PBh+D79Avp2N7YtdpAxKItUKS5GifZRNjNI8G6ljo
 pty5cnSbJVgpFW0/1axLB6FvRc4gFKR+F0mc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eDGhNOsnfRqZ1FkvFFgvc9AjFE5Ddur1Pg9CKAfnAxU=;
 b=V2jt041hnzEHCBCPM88Phdl5nLmotLMoidQ8m1tvrKZeOn/UvI0FMKGxRazx5tp6PI
 cIF0JiAOXGspinbTD4qfpwKUvZiV1DlJs86+vGvNHAHmASScQJMQy0kK6KKitP2Z2Hwf
 3P6Kde9gY05KDpzSv69a4CGqpacTyVSByX1eqnnu5GVPFUwQ+P6cQsX0xZGCQZ966yLQ
 cMnK9Z3qqy9JVUXcMYcOj/m894BzzCjS/Qo74xyM4yWKkxj0QyaB78qpo2BduHe0Bvor
 ipkd2SPFlE349lKPe1zDvlbB8HOhHAQ1V6aGh2uo0KFVZFFZoD4phIRgs5SUb1CA18D7
 a91Q==
X-Gm-Message-State: APjAAAUHwql+pKu+dLjCWyuNZUTOcZWu8b6gGMseRt2RV+73yAipF5Z9
 DuRFv/92nSTm4znyu/StcVyx28589GQ=
X-Google-Smtp-Source: APXvYqx/CFaWSKVnzXlpK1+qO4ubCS9oYBQnexIdJkDYB/ASVBX1HdBP20YnSfmkT4M6+QZFPCcz5Q==
X-Received: by 2002:ac2:5964:: with SMTP id h4mr5291092lfp.213.1579803011713; 
 Thu, 23 Jan 2020 10:10:11 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id s4sm1742074ljd.94.2020.01.23.10.10.11
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 10:10:11 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id j1so4659270lja.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 10:10:11 -0800 (PST)
X-Received: by 2002:a05:651c:282:: with SMTP id
 b2mr23878285ljo.41.1579802569766; 
 Thu, 23 Jan 2020 10:02:49 -0800 (PST)
MIME-Version: 1.0
References: <fed4f49349913cb6739dac647ba6a61d56b989d2.1579783936.git.christophe.leroy@c-s.fr>
 <e11a8f0670251267f87e3114e0bdbacb1eb72980.1579783936.git.christophe.leroy@c-s.fr>
In-Reply-To: <e11a8f0670251267f87e3114e0bdbacb1eb72980.1579783936.git.christophe.leroy@c-s.fr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Jan 2020 10:02:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
Message-ID: <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] uaccess: Tell user_access_begin() if it's for a
 write or not
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Linux-MM <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 23, 2020 at 4:59 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> On 32 bits powerPC (book3s/32), only write accesses to user are
> protected and there is no point spending time on unlocking for reads.

Honestly, I'm starting to think that 32-bit ppc just needs to look
more like everybody else, than make these changes.

We used to have a read/write argument to the old "verify_area()" and
"access_ok()" model, and it was a mistake. It was due to odd i386 user
access issues. We got rid of it. I'm not convinced this is any better
- it looks very similar and for odd ppc access issues.

But if we really do want to do this, then:

> Add an argument to user_access_begin() to tell when it's for write and
> return an opaque key that will be used by user_access_end() to know
> what was done by user_access_begin().

You should make it more opaque than "unsigned long".

Also, it shouldn't be a "is this a write". What if it's a read _and_ a
write? Only a write? Only a read?

                    Linus
