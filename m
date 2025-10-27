Return-Path: <linuxppc-dev+bounces-13345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B04C2C0F129
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 16:54:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwJ351J9Bz2yjy;
	Tue, 28 Oct 2025 02:54:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761580449;
	cv=none; b=MaBwr0QrqqtLWez1wZHSOaCv7VPlLs6zG2akrAj+armsS7053dssjvEgul4THDEEW/2Om3lvYQQZr3dWNjgTbRi2p4OFkABOvMokEjKghCdHomjpoDDWjxJ4pZrBpJTZuY76U6GHQ3d9UDOelpOpqVqVi1tVZj/QA8W+2htz8T3UCFxHXG+X1IaIOMHnk0Kc6HAuq7YmvbuXtzAQmWM094aRmEcJGZBiK5twcEVRfYjRb5QRJqnUM7GC6T+125nuA+0K13/akFTjp9mTSkTjJjNXukwVZIdtp1Nfq3lKADdnjcPnMZvB5r9oiN6FOjhBc/77KJcyorfNRSSPNhEp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761580449; c=relaxed/relaxed;
	bh=Lyo3P6jUrO11oV/07r7VEk3+sHuM/zfcTZIIBqJLkxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AeOrprJlSAXvXSIs6wYHosf1rsRvkBad0mUfsdkFoXkuzM0S8WjNpv3guoLSEBRpNa8SaS5pKAycXix289Bow+FW/qcyHE05ul0WZEJ6bIlB377Apb7WVM8GoNZ8cxymE/zvXMNAmtTRBXrHhwNOGMfeYw5h4VtSZInu8Em9BNIdwq2Js0ofCkaZ8Q7xSV2PbHL5lqEzslI5va/dp7ZAp+xA5kdWCxoGglv8KLQe0URlzbkav+U12dX20jXNaFB+dh+VukTh8MGzq9a5pXJTPP54o1fag1rrsuMLJlMDxN3hNOF8OrEWPKBDLrYcWEZ/zdpHO8ltHuNyvxprdzYaQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QD6cj4Lp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QD6cj4Lp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwJ333bqbz2xsq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 02:54:06 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b6d53684cfdso1083340066b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761580439; x=1762185239; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lyo3P6jUrO11oV/07r7VEk3+sHuM/zfcTZIIBqJLkxg=;
        b=QD6cj4LpcH+X/Kw4E++IWBCL429pSFTSS13VX86GLh/XXYJ/yba7Ii2OWIE0OWEW1M
         2rpsyYDFTOuB3zK3rdw5VdWS/+HWepW3s01H31exkNoA4IODHtKKLbfeTDk7rwKf7NKN
         81rdVmnUgvHRqKFDOfuxt/43UnaIrcdCG4CWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761580439; x=1762185239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lyo3P6jUrO11oV/07r7VEk3+sHuM/zfcTZIIBqJLkxg=;
        b=tzr5P48dgRiE1W+erEIM8BHhfe5ggc8SkmeM8crFdPckqQOdPfxtVkxpl25MdrEslU
         IqMkxQMHb+oi70UI5J8KG950w4gLnLX3QTejlS+gvxquflGvQIc1lyJunQYoe0U5/Y3W
         VFCR+A935nNM9EsdWgiU5Fpemt0q0EuFQ2yJwk9jfiqdbVEwvS8W22iQP0wf4Mbo4Egz
         H2C11gx96f9tioURukB1+fRvW6FY0QkQWNLx/SNrFwaw+hOnU/SYbtQk4HcF1+D6fVe5
         AIXpeUQYR2tacQA7kMOK8r22t8Pa3XDfz0RHNcH3EfZo9Tkv5Q6YltwiYZM+zig7H6Tk
         yhXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU9nKkE540as32Yq2CGWboipUwFzxajFX0nZPqdBkUfVbeRSCEWKp8lJVl6q0K7svBAoZQFGVnhOQT18k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZKUNyXmw5CLFjY282KpuLz7iEVMLoYT0ehYNG15KxootL/0W9
	3oFwxNQMESicsjiP5aUIeEb+G5QFSZ0wpIjRoAwfWAdx89NmuOhN5ISv2nv1tgpCtBqEJfoWSjW
	u34xeNko=
X-Gm-Gg: ASbGncsNefbfTIYfwsoW0mcKjNbUq5r/pJ210aQCsMC3rt18nX+gTyhdYqCYe3QKMl7
	mZw9YEWVZHvmZ0h00oyDlZhb1GUEQ51bEpV+4xPwrBgvmhEDhZzn18gOZsuAOn3nZlcUeaND3AI
	x24gKhpJBy84AMk+BFpLsYulHdC/FwQAG3fKUICki2abVZWOsp4rygMCSzBGi/EXeyOn3bHpexF
	AXlx23z4PGat7ZWG/3DWc3WOscE8ApkUHdAptvksfABJsu7dxcbb4zCWVpAUHfwvUz+iD9BiVXn
	9QJVhHkHFipnOaneuxqHVgHYanCdymg0VzuXFi7w3IGrqfxL61sI/DM3+aVrAR+yXGqwWq7V8AK
	ssefVg/MZUZFrt0qy+7ZGtBi72N0bUFfZBt3TyywXsQ1EjifH4wdI7vlmLWLpiVnRUYOsK/bfjb
	k75UiJcUViCnUH5oOQSrE/cOxxjiv/DD/Sw8gvEXsIU4qmchdaVYgWySndB37W
X-Google-Smtp-Source: AGHT+IGj1S7c6CtjTgy89f29lECmgzhoBf699yocpMxov+q1lFV4/MwbXlp5fgfC4/cxQf8FabswrQ==
X-Received: by 2002:a17:907:9455:b0:b47:de64:df1e with SMTP id a640c23a62f3a-b6dba446793mr41481666b.4.1761580438755;
        Mon, 27 Oct 2025 08:53:58 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7efb818esm6375734a12.24.2025.10.27.08.53.58
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 08:53:58 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63c4b5a1b70so9196257a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 08:53:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+SuI3hcKsMPwsUwhx3BDU0T/+RwszSsvMpymbaUJ4lsVJTo7dbaqsIV7/SOgWdFg3Y+C5l/d0etes9d0=@lists.ozlabs.org
X-Received: by 2002:a05:6402:4412:b0:628:b619:49bd with SMTP id
 4fb4d7f45d1cf-63ed84db9e2mr369134a12.25.1761580437926; Mon, 27 Oct 2025
 08:53:57 -0700 (PDT)
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
References: <20251027083700.573016505@linutronix.de>
In-Reply-To: <20251027083700.573016505@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Oct 2025 08:53:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiZ0RdDzpafUUduCn3gOVX3a=ZmGOw7wu1s-jqe8KypDA@mail.gmail.com>
X-Gm-Features: AWmQ_blZNXFTqWGx07mPO-qNDyYJc9sRx0MxijvPg_spVplnaBKcigb1OKRcACM
Message-ID: <CAHk-=wiZ0RdDzpafUUduCn3gOVX3a=ZmGOw7wu1s-jqe8KypDA@mail.gmail.com>
Subject: Re: [patch V5 00/12] uaccess: Provide and use scopes for user access
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 27 Oct 2025 at 01:43, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> This is a follow up on the V4 feedback:

This series looks all sane to me, and I think the naming etc now all
makes perfect sense.

                  Linus

