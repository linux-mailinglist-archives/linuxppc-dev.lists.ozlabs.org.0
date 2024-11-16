Return-Path: <linuxppc-dev+bounces-3313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFD99CFBF9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 02:27:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqx8N0Wk5z3bbT;
	Sat, 16 Nov 2024 12:27:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731720451;
	cv=none; b=kIHNXC76Ah/7NlAOhYtk2AvoZ4kK+pwAc2V5g6QMWgrUDwtGDsM1SMi9sktSzLz/mq6nK5ogJcZTiq6SUA4FNSsJ5QQ6O/mj/6qqVejLYObr7znM7L06tu1iJ3ppkAJ9FP74+yUDsRua40fZhj7/sn7CuCn+vnymQFmj4T/wtREntc0GL0NebfK7fXcehHNAcrfT/gV7Sq3MnfHPqgmFra2oqC+rJPcJ8yTatXK+W/43DoN3L+AvaTDwq1LQ/qedVt+YnkKDDZsTihWClRONgEL2guhi4ndyz/zrHEE2AH74cICzWPej9hRUu0pQZUU9RQhjj+Z+gr8gaGyhLTOzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731720451; c=relaxed/relaxed;
	bh=CVYMo6RE4YtZC72bkP/PJmu2mQS4HXZjPFfcPWBRsOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Czcu6wjd5HEwkprZbQAIYEcYPDuMmzAV8AGO3/pzDGY9j0Qd2d6Y8NHr0K5iDdxgCUEWp9a5pZDfdU2VubW5i1k9efqaCSryuOL3d2KXjE1icBxqxY9Zvjv5ZOHBEM5/+WRfTbVxemRLTEhoWEkgMheWoKeMrMDIFjw5go0eTn9aMB50WL2Z5P0+ieYJ0WVupWg1jR5c6UtTzR1+14RaQLXntJRvVVVNeEF4Xktw6Zo4v55z4oH9BE+q8HuFmqTdhkRwdUqSVlZDVJa3MipbbO2tojvizzCCm0yjssvifSdcF8jA8UmgDAB9d6dH/beKHPFXduByyE9IcBbxAiShwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=O40tbmew; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=O40tbmew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xqx8L2tqNz3bZR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 12:27:29 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a9ef275b980so223053566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 17:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1731720444; x=1732325244; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CVYMo6RE4YtZC72bkP/PJmu2mQS4HXZjPFfcPWBRsOU=;
        b=O40tbmew1urMk6RQ74R2K0YFNXMno4N1svxBOTqCJ/4XEgvBZ/V+DvAeyLidXYKwqL
         U64P6b++towAzBOEQwwfAJ2hZ70CQtsVqWUYJX9D/ta6neVM47KLbjgpxymoAW35xhWM
         76Ef85c7gcSiI12oEYbxOE/29xaT9YqaJL1OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731720444; x=1732325244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVYMo6RE4YtZC72bkP/PJmu2mQS4HXZjPFfcPWBRsOU=;
        b=F4pHeIwqRE7rdHoU2ODCpQl5iJFZ5UKCygPIURYE5PvuirRHV7U+aBYciDTcN+ddKc
         txZU1klcLDyv4j/faveanisXPs0N4rCNOxG3gE1+4E0KcPMDnHudI9WRDIOf62jcfctN
         3gAJtz11bJUHYckU6lf6Kkkg7OhsBXN45GknsSWXvNtG/8vQE5P1rjtZ5kjlqlxjsypi
         Lf2ca9DJvwBGkg+vtTi/m1xRUOSPaQPmyLzkLctSCfZ/MXcMH+EMmwMMO0lbDpkI/oJx
         mB4ua28pDHf3KPNJ3P5RqJTt2ezVC4eigSdMykKZF+7YqIseeIP8boL8AukbmShXHMsb
         xfyw==
X-Forwarded-Encrypted: i=1; AJvYcCUE1ccGdTgU1M0VezeMgHHxHVu2i3ornKbSlnTWv7ir/AiQNuM+ruJz+SdqIH8LGknK5p2Hol6FCczqtko=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQ0DHyaVbzTepBTWwfbEVWObR8EZtEFhmo5SeKSuRrfn6lk9Vs
	J9kQdg43r4dlrWu1tscRekY4TpHn/mXbYv0+zBg94+T1Ie7OL71iWobPXTMoXpDFLBP6DLPd7is
	tpRY=
X-Google-Smtp-Source: AGHT+IEmWJByJlWcwtDHr0HBWabij54HEoTf27CEdPG0ZS/ceDuVH3FQ3jHXu0V9pdijIY1sJMj+yA==
X-Received: by 2002:a17:907:9623:b0:a9e:b093:2422 with SMTP id a640c23a62f3a-aa483508b15mr389104566b.48.1731720443670;
        Fri, 15 Nov 2024 17:27:23 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dfffc2esm241018366b.124.2024.11.15.17.27.22
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 17:27:23 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9e44654ae3so201218566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 17:27:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhNFqO76tODiMtK85YeP1u4y18NU9dK80rfcE4RPLZibW26tiQvz2FXa0/ZgMYdKu1U90XY43+v44fTHw=@lists.ozlabs.org
X-Received: by 2002:a17:907:7f8a:b0:a9a:e91:68c5 with SMTP id
 a640c23a62f3a-aa483454536mr357189766b.33.1731720442701; Fri, 15 Nov 2024
 17:27:22 -0800 (PST)
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
MIME-Version: 1.0
References: <cover.1730166635.git.jpoimboe@kernel.org> <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net> <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe>
In-Reply-To: <20241115230653.hfvzyf3aqqntgp63@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 15 Nov 2024 17:27:06 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
Message-ID: <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: David Laight <David.Laight@aculab.com>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Mark Rutland <mark.rutland@arm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 15 Nov 2024 at 15:06, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> It's sad that __get_user() is now slower than get_user() on x86, it kind
> of defeats the whole point!

Well, honestly, we've been trying to get away from __get_user() and
__put_user() for a long long time.

With CLAC/STAC, it's been probably a decade or two since __get_user()
and friends were actually a worthwhile optimization, so let's just
strive to get rid of the ones that matter.

So I think the thing to do is

 (a) find out which __get_user() it is that matters so much for that load

Do you have a profile somewhere?

 (b) convert them to use "unsafe_get_user()", with that whole

                if (can_do_masked_user_access())
                        from = masked_user_access_begin(from);
                else if (!user_read_access_begin(from, sizeof(*from)))
                        return -EFAULT;

     sequence before it.

And if it's just a single __get_user() (rather than a sequence of
them), just convert it to get_user().

Hmm?

                Linus

