Return-Path: <linuxppc-dev+bounces-7273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4088CA6C0A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 17:54:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK7p34ch6z30CF;
	Sat, 22 Mar 2025 03:54:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::235"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742576059;
	cv=none; b=M3NmjXy18P0JpH/2M9AOcBK7xPTIgNYLvLrBXibzUYQa9a4gKeWgZaYSWoHh6o+VMl5m7DyZJpQVa2h8CsVbscHChT7ozLQw96FvsIJ2eKS1Y9KI4OAs8QKoTnalGcAFKoO4zLM1h4ziQNpjluQp+wFI2N1u2kCBkjIeVyXg54PvaRjz9gmmgwnKjbX+8Eh0TwE8/gSkSIyCMTv9GMh68j8bnPIBKImufBhbaDkIKsC9hkutIJI7yEwhgSTZmKN88/XKDbUY5iEf7MYrEghroJlYol+pF469LzI7p7oiY/nudp2O8EzWAm8z9Qh5K9ZF0VwOTlSm1D2PO2P+HBjD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742576059; c=relaxed/relaxed;
	bh=UOuUAOdU6fzwILEwoTUwQrZ3IxBywdm7PqAVnZyzNrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4FI8f3AT0r6rOjisaR2l1FXWEgVbGGECHSBTWwOX/UoEGha57LZimHlfJjNM32VMoHtLuu15GyNNJAgCN5ENzkxF9n9q4KJ002AgUjSc8QVONTVLxavOji4hyHMaGbyexfNF2zRuBvI6gOq21zTq85AIs4qoPRImjLJRTT+SVSZENQZjVTNuWZ+OikAxkFIjWCKkHMEAgIBA4vDdwE65J29+0d+j2Jt/x00TOXE61y3LTtOD2m66UQd9pOk/XZt8dvA485fRPeOsZbAXKPbkDmY+B4EbelUlkxUJOzN77DE3rh3u2UhkHIcV2RX+fs0mp/9i2/cTWlMb3Gf2Nd3rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Etq30h3F; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Etq30h3F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK7p20t9vz3089
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 03:54:17 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30bef9b04adso23219611fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742576053; x=1743180853; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UOuUAOdU6fzwILEwoTUwQrZ3IxBywdm7PqAVnZyzNrk=;
        b=Etq30h3F20ZscfrE6OhwLkkhZuehAMjNRDmLykKoWXaIjEOnWZfGksxRNBlD5bN280
         Q7uIObY1Z49+hobNjpgtlo9O+3UZc+PBe8Yy4y7/xyN6/lcZc5gXK2X5RF042HRiQ5Kj
         rVLX1Ixf3XWuaYL+y6st1Te7FOh7HloO17RwFvpRON2H1NSz3tV5HgOzvwDfLY9jeYo3
         3bqfp3err+JrnVYgtCvnSf4GYArXCRs0dKkQJc59HBXp3mLa4C7WpGzVCwK4Uyj39Fn/
         WOQLwcy2JooW5neG0Z6xP6/7UkJWr+1f2E4w3XO5IzMFRcjUFwQAzsaQ3k80sZtJYxzd
         vRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742576053; x=1743180853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOuUAOdU6fzwILEwoTUwQrZ3IxBywdm7PqAVnZyzNrk=;
        b=Vmu4vtX4Teg3UPz3g/kmS1wQ+bMSMiXk+VqnlccAhIB3z19YH4svt+r6Sjge/Z+EmR
         KSpkxHiwjLa6qTvXzTJUukM/IPKRG6nooqUKfImeQ7Nrt1Be6UxJEP2dlLXNgdMcSSaK
         rWDvBc0OypeK70Bviwv87kqVMUNXyrsaZa+FArSnT04vaSBLexYcOesuMKbDaxnpqKEN
         nqlRX7Zr2VemaE4d19GFCGLF/AS6kXvOAMdzmNqwseMppHOtFDDxU6xXX6AXmJBRhcyW
         SWksStvqTMP5i7hQ6UsWJHy4QXE+vJvI29/tBQ8BRBLNVAiawY2AvIj1V3ze8CFozWi8
         2mLw==
X-Forwarded-Encrypted: i=1; AJvYcCX0dB5+X+1/BjxbTUAAwvpsFqmuGShmz52Fyc/VBmZCkXhusod5ueT6FnLDKPZSa05yiiRPlM8CR5f4rO4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YytEy3EdqBR6m/8dFMMOzJloqE2fd12JZ3R422aHN06aZKCRuWm
	tsRReAcODcEQR6CnrncrdAjg7193zdzV+IFkcLulDWVUN3uGdCGfmPAvp0rvFYHjUPxCLUmlFcS
	a9BI88EpLEVb13TuHcnQ2kXavFhg=
X-Gm-Gg: ASbGncsmecfD4rJY5BFkiJtYD+57qE/SUvCTaG08mQHcDh9Ts5JUg5twtiASlvtXC6g
	g5hulicsSRHzNykDzFjjylH+YSQwGCIvBktLW0IFoTcX+3y1eG/rNmYz/nJaOY0ET32Gg0i3qSS
	ywkQPYEA8I5BVGY/CjmMkuRbLIAReCqC49G4GammRG5g==
X-Google-Smtp-Source: AGHT+IG4olNJH+a7c6RlZFJF8zMksT58/wvmA/7TP25sQDIbCAdnPDYZgYQ8vKGk1x10x0tRVyTKoEGU45fo+N4bqok=
X-Received: by 2002:a2e:8e73:0:b0:30b:b7c3:949a with SMTP id
 38308e7fff4ca-30d7e2383b9mr16939331fa.18.1742576052901; Fri, 21 Mar 2025
 09:54:12 -0700 (PDT)
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
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad> <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com> <Z6pfomw-3LuWoQQo@thinkpad> <CABVgOS=KZrM2dWyp1HzVS0zh7vquLxmTY2T2Ti53DQADrW+sJg@mail.gmail.com>
In-Reply-To: <CABVgOS=KZrM2dWyp1HzVS0zh7vquLxmTY2T2Ti53DQADrW+sJg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 21 Mar 2025 12:53:36 -0400
X-Gm-Features: AQ5f1JocXlnKOaYntHf6DffQI-TKvt-QvytM7DCEc6s7gdq0Tj17rR69Ljw6v-g
Message-ID: <CAJ-ks9mevv68v1Mh0GdGd9Y2EEp3_kdV6FygOiAenYG0=e4=Tw@mail.gmail.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
To: David Gow <davidgow@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org, Brad Figg <bfigg@nvidia.com>, 
	David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi all, now that the printf and scanf series have been taken via kees'
tree[0] and sent in for v6.15-rc1[1], I wonder if we'd like to revisit
this discussion.

As I understand it, the primary objections to moving bitmap to KUnit were:
- Unclear benefits.
- Source churn.
- Extra dependencies for benchmarks.

Hopefully David's enumeration of the benefits of KUnit was compelling.
Regarding source churn: it is inevitable, but I did pay attention to
this and minimized the diff where possible.

The last point is trickiest, because KUnit doesn't have first-class
benchmark support, but nor is there a blessed benchmark facility in
the kernel generally. I'd prefer not to tie this series to distros
enabling KUNIT_CONFIG by default, which will take $time.

I think the most sensible thing we can do - if we accept that KUnit
has benefits to offer - is to split test_bitmap.c into
benchmark_bitmap.c and bitmap_kunit.c.

Please let me know your thoughts.
Tamir

[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=move-lib-kunit-v6.15-rc1
[1] https://lore.kernel.org/all/202503170842.FFEE75351@keescook/

