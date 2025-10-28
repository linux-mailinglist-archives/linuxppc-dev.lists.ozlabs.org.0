Return-Path: <linuxppc-dev+bounces-13427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9574C13ED2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 10:54:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwm1P4ndsz3f4Y;
	Tue, 28 Oct 2025 20:54:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761645257;
	cv=none; b=UwvOmqKEOlSdV1TVVkUq/qvi5qkGJi0Wu0+JHRo8ef7Ncoh/ihJJ9X0LGhOI3jomncqAIH5ygws1DkjOrEAXhvfZYXTfIue9I8Yv/+EkHQZD74LL/0VQhQqsNjBhfr/C2QhfiXCsdndNoFv0PdFpvoNW5XMhEa26A/8CqlUJ1gw8Lp4BOKYoGio5I0Yx8ger6QLHXn9G6l6mNX4Y+18A/BD4NmXPK95BrrDN3hjw4YY6lcHKpcwUtjEbGwngiPkHi2Q7Ryllyv86ZYaqJ603qGc8ZfVs+vsxE65qKxvFbeJDpbKTWrPcWXCkdec9RDlAWy/vMuhB2+BWBbOpcsNEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761645257; c=relaxed/relaxed;
	bh=Eov/MPh/YX8dO6loIW1fKNx4DJr3A70PfDx1JeMPyWU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NY3Wvnj6VPFXNoIqo+xkENxiGX5f68bLXgjlPj/sKBzuf/bO5LUk/6Lbq6bXxJZ+S1E6bwrGx7A9un3o6uLj0w1kfjEfZETZO5jv4HqRgYw+yUQb1BN9WVkI9c0KJbqWFKmW/V1S7Lz46X+MmRGB2hqOrb+N6jBSLstKOmViwrTAi+kB89zWb2pIpIgoykdfc8OoXVa6pBSNWIO6XHBVPFXA9fVIqBmiidMqrxYnY0fFjxmQxYnSxErVHzXAi/wqdfv9daGxaZL+TsoBFJUGOjTV5s1DdBNUAy0R5+mcX0ZqGL8bcUK1Mw62rb43HiAQwEC3Ik47/hE1xajd6zoeDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aGAuV6QE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aGAuV6QE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwm1M2rplz3f0P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 20:54:14 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so34137055e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761645250; x=1762250050; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eov/MPh/YX8dO6loIW1fKNx4DJr3A70PfDx1JeMPyWU=;
        b=aGAuV6QEPxiOr1FkynKjMmQs4As4XukctG7O0ZcNE76LcP6d4rYgr3mgKRtoiezzJW
         CGyqj2wAjo72EexdJiRC+bJU2Gb8IQdrlKEfP5S0+Fw8yTV0EPou1FlWEXmUFh3TIQHG
         sCgI0SFaGRO6WFDXbiLNjZniNfJqVqgix869buuJqD3+95jt6fp/mjuhMIjDhZc570so
         UnolipjShDYg41llEaVsGmzk4U3WNJPsXslTFd6etu7woHTkGMQX6EUbs854Otmc7ne2
         yp7+btQMMgMnugyK76Bv9i7lN5U4cQT7b2W+Y6m6iP6q9bpUWRmnoL1ZPEOCtjYTDZ98
         zoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645250; x=1762250050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eov/MPh/YX8dO6loIW1fKNx4DJr3A70PfDx1JeMPyWU=;
        b=tSSooT/sgiuGYUZJSEEb16ptShZQIoGn/ERG2iIzkaR8bbmn7knVJQtnG/h/hunZZ2
         k6hPTniNkt52fJuE4pvirC3S3ohlKQrsCcqmX9RpxmYzHF4e4auD1WntK/+66pc0huGy
         5v7l1gr1KEkP8Ew3PcspMoYmgFsANPOUrApXMoUEmp34BPrgISLtXHD9UtoKGUMqsHao
         e1zQ9FG/iVgbIapKGy9GU0IiIJZ0UXXks9HyASduZJRC3pz7rNS2jEJ+XoFvDoJL4MAj
         LRjN0UIbjzVPYPuAdi1S5bG4CYS9GzH2RQOzswoNO83FHH1jtyEygA6cQaXVkUpq77HI
         /wFg==
X-Forwarded-Encrypted: i=1; AJvYcCW4P4SU+9pR+N2b6098j2n2r/gObs8S600WKumjmrt871uklrcnk3rIA87ryXXUO3YmtqNe9rmklJXgw7Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwruK0aLEDskUZ+PB3yCyOR3owXeC0tKjhfYZDhMsdDJ3nFMlE3
	/6Mref+/20er359c4+R5CKWec5HiB9aDyxUmjtV9UzxNxcpZG+mBtza/
X-Gm-Gg: ASbGncuYMD06xMjev30uLXL7O5Wj0G3oTdtPVpzuFDaTssQ+qtXu/G5OR2pbqupjmax
	0DLMKzhm/xLdFDyvbQmShF0qDvob/COQcd5l0olKIRZpruouwBXQbSpY4JQ66bmAOXCb8VSTdE2
	EKloYH4T+e+lHj7Vua66eJcuB5ExTpodT+vJgjnLNGwFWAYzjR4AxWTqR10pn3K8U+GhzytekeQ
	UNAVzH54jNADF61FceQffeyivm2K3k7hRIx9nzH/zqeGKqtsmEjqOBhXI75q90Pk6TO8NahUNWa
	dkoyLj/zluiKF0F1u1pknFNl5a7RXbclpFNw/Ld7L3N60vNw/woZktHJAvPrVglNUpwYeN7ZJlw
	sG32KVVYTZkiwXnMlAcvrersEau/3+ZShgdCE52660+QRD9XNPxD7gAf1SV7QMzFhgHk6Gxh9LY
	0DfLn/symlNgNG/ZoJo0Zerh743O+Nak4Qf7afEaDL/w==
X-Google-Smtp-Source: AGHT+IHTsad+5R9VyJ1jsBgS805AF7/gtOcePpU3LeuhaXctgbpE0MIvJRpdSfBK4sVPhc9XIgYUZg==
X-Received: by 2002:a05:600c:1e0f:b0:475:dbb5:2397 with SMTP id 5b1f17b1804b1-47717d488f1mr20861355e9.0.1761645249706;
        Tue, 28 Oct 2025 02:54:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4783b8sm187327045e9.15.2025.10.28.02.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:54:09 -0700 (PDT)
Date: Tue, 28 Oct 2025 09:54:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: dave.hansen@intel.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, catalin.marinas@arm.com,
 christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
 edumazet@google.com, hpa@zytor.com, kuni1840@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mingo@redhat.com, mpe@ellerman.id.au,
 npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, tglx@linutronix.de,
 torvalds@linux-foundation.org, will@kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Message-ID: <20251028095407.2bb53f85@pumpkin>
In-Reply-To: <20251028053330.2391078-1-kuniyu@google.com>
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
	<20251028053330.2391078-1-kuniyu@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 28 Oct 2025 05:32:13 +0000
Kuniyuki Iwashima <kuniyu@google.com> wrote:

....
> I rebased on 19ab0a22efbd and tested 4 versions on
> AMD EPYC 7B12 machine:

That is zen5 which I believe has much faster clac/stac than anything else.
(It might also have a faster lfence - not sure.)

Getting a 3% change for that diff also seems unlikely.
Even if you halved the execution time of that code the system would have
to be spending 6% of the time in that loop.
Even your original post only shows 1% in ep_try_send_events().

An 'interesting' test is to replicate the code you are optimising
to see how much slower it goes - you can't gain more than the slowdown.

What is more likely is that breathing on the code changes the cache
line layout and that causes a larger performance change.

A better test for epoll_put_event would be to create 1000 fd (pipes or events).
Then time calls epoll_wait() that return lots of events.

	David

