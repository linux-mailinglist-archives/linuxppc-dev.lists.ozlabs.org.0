Return-Path: <linuxppc-dev+bounces-3506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 139AB9D64A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 20:41:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xw57R20w8z2yFP;
	Sat, 23 Nov 2024 06:41:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732304467;
	cv=none; b=VnQkPGuDTQOtUvoO6OwZQRgLBww15Ao4FabMfZVmNElH3ysrznkJi/37b3NjQ1BgME1xUniuhRIPEn/Sc+Oe8/4DSRDxd6FxjYKrMobA8xxF1U2LDUaxaEnTaGIMglCg0qU1G51ARS5jDoe92M361QPucWpCttSYtwLVdZN8RrW73UB4wlffP/CZsIjJ3v4Omdr74/TruTXjQEBjUWyC7r4wZOXse2yjmI01FKXMSjQgj+3I7Q6WRZSti0nlvpjgbE3sAdsFsEmiVseABDIgOgg0DFBvLEoJxihi6GlyuPWqTAE4A48HCZ37tQpcM/3Hqm0IN7RhQdvs3DBGV7Q32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732304467; c=relaxed/relaxed;
	bh=CcjD4yZx4glck5lWdZ00sfDwzVjZ7spLStaLiCSqhPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OkfP0LpMp/BCJjJbwXOuIVQVDNG521FecSSA+gLwaSFM9vZ2tXgkFYb57b+1a/Mae52D2q39r/H7feWss6YmjiutU9sZf65syd2xv5728xACKEoaQys45e7sGNVdr4M7WAH/SPNfiutd6snc3ztsoqpCLFEbWQOzMma8SVLqBWElWIeM1HMtPJDTwIAk/kIhw7LUiU0cqiRAJxWMCI/vUrq9XkdLeHgLYrcXeFmAUUztgnPU3l5nxncrXQ8k/QJo3PFFZ4VgUQ0jaQfmn27DSa1d0jF+Hy3fHDK8Kms/Jcza4ptugBHOzKv/lZrVmZmAkmCN9imz/kiHZyb2Piy2tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FIn+OQNH; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FIn+OQNH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xw57L0lJwz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 06:41:00 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9e8522c10bso410768766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 11:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732304454; x=1732909254; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CcjD4yZx4glck5lWdZ00sfDwzVjZ7spLStaLiCSqhPQ=;
        b=FIn+OQNH+uMeQ2kuhoXKq9MhNxfTHO3bIzw39kv9eFl32QiPWDlg0eZyie+/oIaRnt
         /vQAbOSOTJBcVgWC+iTikgCwM++BiTume2XEqS+AIvQM6ttQot5N9/YTn1gu6ZJ4S5UD
         4cD2ldXBp6iaTlW3rYgQfvBd7AOPuk2k7l9Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732304454; x=1732909254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcjD4yZx4glck5lWdZ00sfDwzVjZ7spLStaLiCSqhPQ=;
        b=Y68LYunxgalmtyIBjFW5OQWHAIWk0rUi24sDYZfwzClVxX+pMh0erMt7SJDPDnHiSZ
         YzXsXWcQsHr2DlSpef7dFbf0Qi5rWDygwLeVliwP7zG+4aD/djQeKy9JMy8OH+jU77yv
         L/5f83+5UquW/ZbI4y8nocYxYR67Rf/NmyqDtF8DBl7mde1tK+CtkRlOxX+VqD6YqRbq
         UqEg4SawbD7BKQG1H2VWYPnBHVnjNS/kjY/mQFM736+n3LgSPwlj/rcKMhtKcqihYjFr
         97EXX6BqKHIXbYBIyRpIwp2jHfRMibBLbUC3rztbQ/JZUf9GbhCf+Z9uIh4vXV6zG4Oo
         z5ug==
X-Forwarded-Encrypted: i=1; AJvYcCVCinCTi5hngZ6go3vTtgDTG76oja5eXe+0294iIbAJ6MJXOh+z/Am2RGFIde5uqS3GTtpi8V1pWKs/QRA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyGfix1XWFrm3OE2NRVXo/VFSRzot9LCLq4wmEDcO0Kv7w4fYtO
	VopTEZHwj25dH/Z2MnIXGqmT8NrvIf2uVVhjRW8MNl11alofZTCskDW9zGXP/9fRKb5pBXFZjkp
	18Rlgsg==
X-Gm-Gg: ASbGncvHv/U9jOIhjitNRddlbzWUvvaZzVX7jaHhLNQM8aAOibG0AWdlwrYacd8FZ+7
	1u01iP5nNnsp23TujV5NiOPmTG/67ZdIeFHgW5FjxOEUjA9GmX/uZw1Uxxh/DtBkAK+q5O4NLig
	eyJ//I2R05YKbudgIoA6+poq7MVXPPvwFXlmYrGavUUeaCkDM65h9q8hePqml6CfPdNedA2qZIO
	+JeR3XMiT9/uPYiY/zkYpr/rc5wKUzvoIYJmtuPTt5yrOJgTJl2aVNuEQTmphH5i4qABekAh+VH
	dSUnddEJOpkTvsT8ljt/DEND
X-Google-Smtp-Source: AGHT+IFnDu3bgZloj8FxMYtH7W3wVor9WbQgkoV1Q5rzKStEhVt+emWX9XQ79V5ZWg7OcMctIr5ywA==
X-Received: by 2002:a17:907:8947:b0:aa5:1f77:c840 with SMTP id a640c23a62f3a-aa51f77ca90mr227826866b.14.1732304454542;
        Fri, 22 Nov 2024 11:40:54 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b28f6ccsm132250366b.17.2024.11.22.11.40.53
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 11:40:53 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cece886771so3371144a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 11:40:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFavnmlyMrYOteXVZAO1KoGGbZHH1XnElZMU0d4HWPu/9gHJ/pQBBCIa3Yh01vuFqmzIxvuBQVJsO7gic=@lists.ozlabs.org
X-Received: by 2002:a17:906:314f:b0:a9e:85f8:2a3a with SMTP id
 a640c23a62f3a-aa509984a5dmr479858666b.2.1732304131589; Fri, 22 Nov 2024
 11:35:31 -0800 (PST)
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
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe> <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
 <20241121214011.iiup2fdwsys7hhts@jpoimboe> <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
 <20241122001223.t4uywacusrplpefq@jpoimboe> <CAHk-=whm4fEYrzrrRrqEhELLFz2xNCMT9be+J0uiR_EwXwa0DA@mail.gmail.com>
 <20241122031115.5aasuktqrp2sidfj@jpoimboe> <CAHk-=wjJt49tgtmYv42bXU3h0Txb+mQZEOHseahA4EcK6s=BxA@mail.gmail.com>
 <CAHk-=wiL0TepguMNaR65ZdkkiBEoi4hTE7PwG3bBO1c5SOXmWw@mail.gmail.com>
In-Reply-To: <CAHk-=wiL0TepguMNaR65ZdkkiBEoi4hTE7PwG3bBO1c5SOXmWw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Nov 2024 11:35:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj4LHCiD8f75q-jf7mu7Jyn-wHgGoni6WSQtdh7+HtGNw@mail.gmail.com>
Message-ID: <CAHk-=wj4LHCiD8f75q-jf7mu7Jyn-wHgGoni6WSQtdh7+HtGNw@mail.gmail.com>
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

On Fri, 22 Nov 2024 at 11:13, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I've only compiled it so far, about to actually boot into it.

Looks fine. Sent out a proper patch with commit message etc at

   https://lore.kernel.org/all/20241122193305.7316-1-torvalds@linux-foundation.org/

because it looks good to me. Comments?

                 Linus

