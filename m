Return-Path: <linuxppc-dev+bounces-12484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BC9B8CCE1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 18:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTZWz261Cz2ytg;
	Sun, 21 Sep 2025 02:26:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758385615;
	cv=none; b=XvB+T5mNvxLsdpeC0rIdh8JznvfURJRwYEmtYFQ6msK6KykKuWPPvG1XSnYdiK2VUu1yhrMu49wdllD2lUnfAhhx0A0L1T2gKl3GWg1gikbcmTOLDv/zDUvfCI8QfYBSbOtLsaNPK1xaDgALzudvaQ4sNqpJk8jkXLmAH4KanXi45P1Pvjy1dQnPMDhWITORra7GjaW8eNW5IlKL0VX5MrQJStJ11hmSzncbp3jfickg7dglgkC74vnxbtpdI0Ev0q91Ob7Ti1UwF/tVpMsvkOOrOeCltdjRRzE3Dajjq0wBctBz6PHKnISeAD0I53c2n0/Mdd1R9I2ZsOQGSnYXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758385615; c=relaxed/relaxed;
	bh=GvLRCncIiqRrC6qT6Y0+vbtoZaqXeTLbbsZoYra2n2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCwLbdy3WDogvidunsr/QvSxw7DU7CuAuIijMlTC7e35k1pZErx5TH03vOTR3CKy9eYCwauRG3Tw5fB+v4lTNi18faOKmDTK4HaBA590ARGlbGQz4cSuPzsBxXsjPyOl85wmsFYqkpRch+3Vn7S/bGhI9PUQPfMgY8S/5sbFbPVkoOfnce0Y6sc5XW2b9gnz4nUHBjdcucDLjyngofARZF5iC5hoaWuIlffWfHcjkZTCBqSIoNY17deYDz9KYSooE8T/anEwUVMWSN2LNzV4xOO3fVLwr4xygvobJAFeE5NdKzt/p171xAyY/5DJGB44z/Q5kB1E84/nBZqswlPXBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hV/yDF1B; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hV/yDF1B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTZWx3JLvz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Sep 2025 02:26:52 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b07883a5feeso600166366b.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1758385607; x=1758990407; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GvLRCncIiqRrC6qT6Y0+vbtoZaqXeTLbbsZoYra2n2s=;
        b=hV/yDF1BTOImJHQjDuz4OebZblJJzAUMECHt+MV5o0IVkBdyt+IBejc1TnHIA0pbuA
         4eFJWTDl+OwmlpgCJtau9T792rreTFH+4wg4H4gSbhsU6I1FkGDr2sbGUDJAcIswf5B4
         JYV0juR19jOcRmTIsP6EbXA0pVl/CFETuhGcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758385607; x=1758990407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvLRCncIiqRrC6qT6Y0+vbtoZaqXeTLbbsZoYra2n2s=;
        b=NtuNVlXOKk69TrAkfLBmnkQlT7oxGtpLM+oAyZwBt6TijAbGqRllZSJLm5JMGKxjb8
         ka+nhsYHEZ8lXcVqPfDWgslqHJNSciUEtf/TY/tcuPDLhHkfjs0+xWw1DzEEhWH/YF9V
         4EzQGbZ62FKYOytyXqBA2u5wqN2L32RavonBZVPhmmkCUKzfWUo4We5Eqq+4AgpLmRtN
         UP/EmuJRgIOpn9osAcl7TqS1+/ivICJxNrcmyA/C+cxXUo5oCo2W1akYaG/urtJX9MpC
         Y4IXDj1dKJvfsRWh9M3/P999/2d81IGs/fjZTykYJze63TYjDlkRMLeXVVjafCRsM0Mv
         4xyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbxVGZau9G0qFU32Vr7MmKVnloXHd1eRnllO0tTn55QNKLDxtzlAea/8DWPvpuu6XAhj7n8doX2uLXMl4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywsv5cp+KdHCHMakAtRQ/z3A3+vz6xTSTIJCXPqQ1BW8k/2PZU5
	QFwYwXcLOvX4a7sVelmVOsUqxPcdWOJoSJEpB1suWL4CRmuI2Tr84LqJM+PYdTQPYTlhCR2ZXLq
	WW4lihGg=
X-Gm-Gg: ASbGncvc8fgUlA35e1r7GtqnH7MtgU7FX5HOMZdPC3TI8hL5yZDVSRyQKDjR3Jic9GS
	U5FjxI3hCu6BuYKj5hy7qoj8IZq+FQv0ODc1jqAld8ND//NJc7Rt3mdqxe94PzuX7bBUAK5stik
	bK4GvYQ8GwsrNJqnKVURet2vUAoiHgFb9SdGFOBMqICtlwTWYoEBSqDdMuzY+u7P6DkexkkWKsm
	HEH2W7WAgLW/aZ6CVKGRgmBHgOHtMj+hZY9M+WLPQpoXOiG66ScyfT1cufnHYI8Bu9XIhv3zSa0
	E0G1UPKgWJ/QXGiqeURPEMJiVEMdbPlzu0aWUqh7i+37raFL1keAhe07gQU5BU/1aeeIFxr1ELz
	ZpIcxTHodKNapizaB3qMuqXI0VoX2xWcLVQX9LkATCb4X7kdiKGb70+F4VbLDTbAFlhNEcpuo
X-Google-Smtp-Source: AGHT+IEJ3g7lhZO46hMxt5RfiFT/gZzeQnJBZBrdVTEkjeoBIhNgOEVTyI4oOnGmMnuEvXupWub/Jw==
X-Received: by 2002:a17:907:6d1b:b0:b08:85d0:3d8b with SMTP id a640c23a62f3a-b24ee9ddcb0mr707244166b.21.1758385607309;
        Sat, 20 Sep 2025 09:26:47 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm20634966b.28.2025.09.20.09.26.44
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Sep 2025 09:26:44 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b2350899a40so402018966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 09:26:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5dsQOIkn0uzZfqkMQnYDdSuY5tAzoRv5nLJP5e1gaiT21yN7HACELUXjSdwg6Vepa0C2HUK7NrFfkneg=@lists.ozlabs.org
X-Received: by 2002:a17:907:1c89:b0:b1d:285d:155c with SMTP id
 a640c23a62f3a-b24ed88702cmr706169166b.7.1758385604052; Sat, 20 Sep 2025
 09:26:44 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250920074156.GK39973@ZenIV>
In-Reply-To: <20250920074156.GK39973@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 20 Sep 2025 09:26:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiXPnY9vWFC87sHudSDYY+wpfTrs-uxd7DBypeE+15Y0g@mail.gmail.com>
X-Gm-Features: AS18NWCBuRxfjxFE7tKBAQqhhkva7pQWM9EJwSLVmis6atYjgiGA5eqHrxKhjLE
Message-ID: <CAHk-=wiXPnY9vWFC87sHudSDYY+wpfTrs-uxd7DBypeE+15Y0g@mail.gmail.com>
Subject: Re: [PATCHES][RFC] the meat of tree-in-dcache series
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Jan Kara <jack@suse.cz>, Ian Kent <raven@themaw.net>, Miklos Szeredi <miklos@szeredi.hu>, 
	Andreas Hindborg <a.hindborg@kernel.org>, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, Kees Cook <kees@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, linuxppc-dev@lists.ozlabs.org, 
	Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 20 Sept 2025 at 00:42, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> The branch is -rc5-based; it lives in
> git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git #work.persistency

I reacted to the "d_make_persistent() + dput()" pattern, and wondered
if it should just use the refcount that the caller has, but it does
look like that alternate approach would just result in a
"d_make_persistent(dget()))" pattern instead.

And I guess you already get the lock for d_make_persistent(), so it's
better to do the dget while having it - but arguably that is also true
for the dput().

I think you did pick the right model, with d_make_persistent() taking
a ref, and d_make_discardable() releasing it, but this series did make
me think that the refcounting on the caller side is a bit odd.

Because some places would clearly want a "d_make_persistent_and_put()"
function. But probably not worth the extra interface.

Anyway, apart from that I only had one reaction: I think
d_make_discardable() should have a

        WARN_ON(!(dentry->d_flags & DCACHE_PERSISTENT))

because without that I think it can mistakenly be used as some kind of
"dput that always takes the dentry lock", which seems bad.

Or was that intentional for some reason?

Talking about WARN_ON() - please don't add new BUG_ON() cases. I
realize that those will never trigger, but *if* they were to trigger,
some of them would do so during early boot and be a pain for people to
ever even report to us.

BUG_ON() really should be shunned. I think it makes sense to you and
for automated testing, but it really is absolutely *horrendously* bad
for the case where the code hits actual users.

                 Linus

