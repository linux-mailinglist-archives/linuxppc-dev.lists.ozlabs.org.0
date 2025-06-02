Return-Path: <linuxppc-dev+bounces-9079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBAFACB3E2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 16:46:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9xVj0h89z2y8l;
	Tue,  3 Jun 2025 00:46:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748875581;
	cv=none; b=U4yhN6hSX61xHqaNGZosXUwfMM4OeZkG8n+LTG817Wy9c+8KvpR0ArL3z95yTSv/HtdxBT/QP8v1zMPEA+k9rloJsjAmVRnWD2g3F1/hcEYdHWC2lmHilzks99gjdCHKLN7RKZ2if12hBfJZmXEi7tu070UZXzOU8XIU8zj2TtPXPpRj2WtUQ2Vn09RscbKt4s1q03AFwa4uF9qO3S0tmHJArmKU6Nt4dPZ4T5gLsHtvHLUsBoJTYpPb/BB0vXJBiEol1BE3F0g9MDYVb7mFlKct7urWzA/RdAFYHAiPVsgDWm1C2x/8slNHpobZkc4HqywbkgqYVLFDZ6B91opaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748875581; c=relaxed/relaxed;
	bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c12ZOvcQTSXuBC5N7TcedNUu+0Eu8V9uv5rQcYUf43GJOXuYRV8pB7lPcAGtmoOu+lTNlsUHfCuE0lNIWtHR64uY6mxmgyPM3K+bLqT6LQbHO7eoM1jIhxWAnQZ8nE0+nlEoHXZB8SYxH5YK3pEFTER9HBH+aMtAl8X84JiOBjTpZB5l1wZxAU1ugabfhWYIJFa/+sPkiUEfzSzxJu6yL/e86OqJ2zN7M7F1j8O6cWs2eCu+VfIjQT4cTF1tBs7teQfWu9qHAq/aJ7GPk7AW09KQJZBdUnjDFGn8iHHwXmU+i3KorOY0lmMvkG5LMjPwFrzumC2ovd4jrAt9Gns7mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gq31CYq3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gq31CYq3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9xVg6G73z2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 00:46:18 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso1355720a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Jun 2025 07:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748875575; x=1749480375; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=;
        b=gq31CYq3+O0c9JC1WnwTtMHm6z6P2t8n6pUmDrDnmLhZJsKySyzWmLESWPGlqvtfqn
         bOryDK+VQuxBDxwdaCo3NSq0dKT6Cj2ik5cJuhoPkgKxc4pDvwn8hXtNvdY9NP9ba/Hw
         6U1C1i17A5OsQx7hKTB5MXRTwyVQW4b7gb9ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875575; x=1749480375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=;
        b=exKBFlp+7FfN2HqGG+q5DGyE4mGbEhugyOKSzX0pESh5/jgyqSmuFDqeQmQCHlMndw
         dUnN25ZENGo3FkKDS6jtt9ajf+cscn4W47A/TFCmI6dBnZ0quY2np2n0ohhxFlUHsJRr
         ZwBJGWBsc7YNbXF8DvQtzYGNzvIBBB2aCVnTuqWK+LOrKVAD/yLokOd3QnsTkmpwCLwP
         agOCly296h2xPLcnw/l9ZnN95BY0whI5uo3Hfmv5qbE5Ixkfmk4hkPxlsPen33A/Uj1p
         3SCDzHmJxlffL83dCNe+NSu3joLfXT6iR9m8+2kUEW1KDqRdh72s2HQzjF/fBw7rvdg2
         Rtnw==
X-Forwarded-Encrypted: i=1; AJvYcCWdDiPtVQjdxKvBx5qSPpkr/fned7BD/vPKO96WBsPmX4ymNJhIHm15MpgKOqd0T7eW7902fb96DS7AStc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwvUNQpJH+WtroxtF464JNzTc8dVxh03UqBmiLqm6QXBNTsPJT8
	iJW8yB5bTcz/RmJAQPlhDZJxoSp67NlavQuxIdXK71WIq23Pq+FfwUIB9Qnb0KyNgfJVsUVmvBo
	I6ZeQfjM=
X-Gm-Gg: ASbGncvtWYXMZ/GyzoFyZkKVVegfqT2dUWY4FD3q5RZ0f5QFLwx3idHVvSBEQC1+1lr
	wZzS/cgHBJDLn6DoQBiXxrEd1k9u03JSNDxXA1SZ3Nx92SVk8emBVtsqHHqBkId19Eym7xMyYqe
	3JhTfu1bSP9TpTGlEYx77wXbv8QqI4fhHKF9CamcElLB2Lmv5Qba5vJBqyhe2J4G5UJ3at+dDHs
	OgAXkdlpivE7T9+UkWiVLKiVyUDGwCgWyvv2uvtaYUXru2Bt4tMH/JTSf3VQ9bWdc0kI4SwERcK
	e1yeORtV5OXM8WeLfGsYqEs3Qj1qBCUDJMieWUihLLq6BcPYi/GwglDzw1VmWa+n/Im5P0qlIeG
	5zO3o3WvTp5uGxtaRZ7ihetSN0w==
X-Google-Smtp-Source: AGHT+IFjdZsSZBMh1mZkjyJLljldDyvwRATtWCcgCeABJ2c6uOWvPx3OQf3FteX8eiNH4Sk1pGOQ/g==
X-Received: by 2002:a17:907:940a:b0:ace:c505:3349 with SMTP id a640c23a62f3a-adb322b3517mr1144304066b.12.1748875575079;
        Mon, 02 Jun 2025 07:46:15 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm798294566b.47.2025.06.02.07.46.13
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 07:46:13 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso1355625a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Jun 2025 07:46:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqtSdtQdfbOleEEhju/OkbxyDdBZuX+ArwhSOOygxtzr+9trk6CmoLP3Db6yv2LoFV3VspZRNEfXChcE8=@lists.ozlabs.org
X-Received: by 2002:a05:6402:5205:b0:606:3146:4e85 with SMTP id
 4fb4d7f45d1cf-60631464feemr3563572a12.4.1748875572780; Mon, 02 Jun 2025
 07:46:12 -0700 (PDT)
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
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
 <20250529211639.GD23614@sol> <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
 <20250530001858.GD3840196@google.com> <20250601230014.GB1228@sol>
In-Reply-To: <20250601230014.GB1228@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Jun 2025 07:45:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjO+t0FBrg=bHkbnXVsZ_U0TPgT9ZWUzu12-5NurCaWCA@mail.gmail.com>
X-Gm-Features: AX0GCFuodXM8SKmhJCuuDQhW2iq8pjrSnsjy_QXiBCm4TA9D0azfhocKT2KWhmk
Message-ID: <CAHk-=wjO+t0FBrg=bHkbnXVsZ_U0TPgT9ZWUzu12-5NurCaWCA@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 1 Jun 2025 at 16:00, Eric Biggers <ebiggers@kernel.org> wrote:
>
> I implemented my proposal, for lib/crc first,

Ok, I scanned through that series, and it looks good to me. A clear improvement.

         Linus

