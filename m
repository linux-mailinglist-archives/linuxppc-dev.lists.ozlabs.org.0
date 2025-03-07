Return-Path: <linuxppc-dev+bounces-6808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A570DA56D92
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 17:25:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8Wq11zhgz3cTv;
	Sat,  8 Mar 2025 03:25:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::230"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741364717;
	cv=none; b=E72MkCnaHr925MSN746UIGrsu+yWKIICucf/X0MZHvqdmFSZIiyVH1uZDNqvBBU1k+AY47hRkFO2r43iOfuxaJjSw+OsNn1Ft4bUSjLHccFYKdnGosqbnGO2B8lISUFXdGemTgxFCg2413319EQ+n3yRA7Um9dBSDyPfp4JtFGL1+kfB0luzUBpqFOEglh83sn/5y7/WJteLUfvMbZ0fnA5aS9aBoiMEB/UseZW6mJTMD4no9/xM6okQJ7Hj1GYASWe4dnTQYk3Z8sVSJnH+7etqHArnRB35RiZmsCDGj9oN5hWnuP3ZC9x3b4XVfHLb35dwI/+6CISM7xFLbGYzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741364717; c=relaxed/relaxed;
	bh=k2CFQJbmHziqfZ1WlA8nTaS4u+SIYAl6KppF5R5h+0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POB8oDtm5y+ZVsBmIZxvmZ/yN/G3kmwxWT4sdzpzYnZ9idrEyGciaDrqM8VqEy9rHpF02+qlHm6s0piN7J7AuPKCRURWr71DCiY7zDglykagG5UovKPScu6ipkqlRemUsqJrb0Qzo7907rzQJj9qIsTefoSppybvBlf8R9Xjnt1o1ZBPEmTmnTMyO8Pxysiz3fX+luPKKnMg60urCz0GEWoIAbjJ/hoqXBvSknuBNb9RZiE5aKOZz72T0MoiHmYnItxL+iu9kfU3BbUw82t96RP4TLCGCesJs0vPTpcAOEfVyfgv2zcEvdO4E5q8otq89hXz04PcXSBCyoA+FbwgnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I0H67D8S; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I0H67D8S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8Wq029Q1z3cG5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 03:25:16 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so21375911fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 08:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364712; x=1741969512; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2CFQJbmHziqfZ1WlA8nTaS4u+SIYAl6KppF5R5h+0M=;
        b=I0H67D8S6NUXgAAng8YpHG2mn1UCT1pWZ/8axkfzsotuEJgUQkA4y3tYdiia9z5b6r
         PkonTsmXnlaDlH25vmBC39mkzrYt0N9+vLJq2QC8NEHBfceQOELf2pD4bTxe/yR/WET/
         XHGnywikYm+qOa97BypHX/GFJDcRHBJIqGLY233ogfCnfGvinX5aYQfvGUH0/bOUS/oP
         J4nG55I8HAA3C7Wo+Xc0HjK4jJrOmNN0OThTpLzZ+8SQvjT8v1ad4aBi0BS5hNlg8DCk
         hkERNh4yFUWr7ThxeOTMqvrnjw9N+12wmqCQJRHefAfc5hAKaTRHa6iai/79g/mJDF5v
         rLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364712; x=1741969512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2CFQJbmHziqfZ1WlA8nTaS4u+SIYAl6KppF5R5h+0M=;
        b=renIqMlKRtoT49pRC5rDhHts7m/lFTGEF4g340ftDawDO2cm/Ryxr+6NeFwy5CMMx1
         0xdZAWj6Or/pBtHIZVMtytrLgBvle+Nc2OZd3Nbx56JMVp2xTC6eZK9Nvl5PIWq9LXI9
         dQ8snyJWlJ+L1k7J3O3xcpJlaueaZakFrISZiijAbh36eiLVaBhAvls3ebCqUbcBZDFv
         CXnarwNcDloLvVSN4TqZgp9OYnELag5rqENjoVALjja+p4WqYa/OS/XBHxBK5Xdq9HjF
         cKkwMrzy2YVtp5j/rEhJn2oLUj3yDwVjKeLUGCH9nsuYrQp89e7zp3fG3oVFMnWVhKB9
         QdVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiAHqBV1qNCTe6EkRHL0c3W/AriZOlq0oK0vA5PjcGvPO6JvCmK38A1gx4s2EuOCy4tyY8AJ6UCBJVbAc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgVOD8AdMgZ7qaPi4hiGxEuFXrszd8eo8WOMSWX/IOEYiHjII+
	Rknvmgha6C/+78wi1rj2UiPAxH7V3zRKtEPTeWDCvyv1ELeAXfX2gXqy/iWjo1gDcWdK7azJHST
	Rldax9RXP5VUsd/pRpNGEYJ0M6as=
X-Gm-Gg: ASbGncsSMLR7fizlKPbNX1uFK/UtyOBAN5NK22pwVkCjOLp39YObRFzxAiqyOXSYEu0
	Y1/Jp1D5UoYGfWSTZ62ytHi3I7K+L/E95K7pBkIW1JzL9UowNLSvfJcE2muzAvI6ZFUIetvExn1
	6Oveo/KnGcao6XuPW+rxUPrH2KbqBqPAybga74i3Xt1qhgGJs7lWYCbFLWc3Bu
X-Google-Smtp-Source: AGHT+IGqyL09z7u4Xuju8syY9+78OKZgCCJj4/AtHOZWHMIXhvltnjRbnmZl42z4OZBt1oV5UKnpsTKVfQtr+7NbeCg=
X-Received: by 2002:a2e:7207:0:b0:302:48fd:6922 with SMTP id
 38308e7fff4ca-30bf461caecmr13567401fa.37.1741364710717; Fri, 07 Mar 2025
 08:25:10 -0800 (PST)
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
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-3-5db840301730@gmail.com> <Z8sdm7Nhk4h3hoUq@pathway.suse.cz>
In-Reply-To: <Z8sdm7Nhk4h3hoUq@pathway.suse.cz>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 7 Mar 2025 11:24:34 -0500
X-Gm-Features: AQ5f1Jo_IFcC3B8zSbUncIFkWnLYFACfJ9QNhhH044lkvIrDkmW2XRTqrixiWvY
Message-ID: <CAJ-ks9nA-393OaE8SbttaoQz9s8MUKqED5GNoh8tQyaJm-0GxQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] printf: implicate test line in failure messages
To: Petr Mladek <pmladek@suse.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 7, 2025 at 11:23=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Fri 2025-02-21 15:34:32, Tamir Duberstein wrote:
> > This improves the failure output by pointing to the failing line at the
> > top level of the test, e.g.:
> >       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:103
> >   lib/printf_kunit.c:167: vsnprintf(buf, 256, "%#-12x", ...) wrote '0x1=
234abcd  ', expected '0x1234abce  '
> >       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:142
> >   lib/printf_kunit.c:167: kvasprintf(..., "%#-12x", ...) returned '0x12=
34abcd  ', expected '0x1234abce  '
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Just for record. I like this improvement. But  I am going to wait for the
> next version of the patchset which is going to add back the trailing '\n'=
.

=F0=9F=91=8D

