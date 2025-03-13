Return-Path: <linuxppc-dev+bounces-6978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C4CA5FB09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 17:15:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDCJg3WYYz3c8n;
	Fri, 14 Mar 2025 03:15:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741882515;
	cv=none; b=Xj7healsFTxB22byNz/buplxJfKrBMtGDMvFFUgWopL6cvH5lNRmEYOy18BoQq9KqTbiqNxSg1NEXc9FAV9iwhugRsRAC3mKLaPddI6hgsCyVoCtrOH2ceS1UVhEgNCpOFJjDKjE0snE1zX9x/8LdymCZr1EVQdZviFw2YtIYOj3Ahvy1HxsvBb6LSMPVB9waLfLLwmFf+McpvnpHf8la8qk6YiWaUGsYBLSelthOTJg/TBan+q95tiW2rfOSEtQ8GttjtxHBppxyaKdaueUl2ExwEaGvMPgGJ6enhRozUMK23YZPumoiRI3IRuzOw/0HDaqCFhN+3jlGxVSjSl/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741882515; c=relaxed/relaxed;
	bh=zmD7MNim/3VQcYsraUusSjJsXZ6QwmA46ppNX6yBUok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuKfBfbxRS4nIvOuqnnqOwWYoyl6Ap4Buf9X4jRR2Txf4JSdeqrsOdTN/6zEVvH8D9BImwKByG3QJQX21KPE+3w1r86hrI6OJfWFhzQ4uXud0hG+5SRH2KOCxCG/jdsaj8/UYHB5HayCkCsPfZd8laxAv1dBN+8g2XvRQN3EDG2B64Ou8++CdUnb+20DmDy2XXmeRnZNpXzcncBz0BIvwx5qK6dTMzQ3O70QwikUquHTXycvQ7Q98AsmnwsfPN4kV3JqptcFuuzQZ599Ko4QpcWxVb3lIx3wkIAZnByLibAt/XjQjejJGL2LMXCjHL33T0yux2qqVQoXSBvhknmcmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cpqL8Kgs; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cpqL8Kgs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDCJf1tZKz3c78
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 03:15:13 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so10974985e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 09:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741882510; x=1742487310; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmD7MNim/3VQcYsraUusSjJsXZ6QwmA46ppNX6yBUok=;
        b=cpqL8Kgs4yYnsnusjyzQX3O7cz4lQL5lhsjSetLab2r4a0QjSfYI39ItkSqZNQPjxL
         Z3E0bNL4m6/yxfsKOywkmshDW49MUCgZDbd6OUhe66V+nHmSgtH10SGGeC/kb7ylrpNj
         txi0Vv5nxf/kFT340sJMAL54rZz0WO2hXP9fWRacHD/J6P7m8U9VHVAY44LqvW+X/Zxp
         j13b95opBhtLbjOCdS1gg8Gi+O5c2lS0G543s4SKmiZOiJ5xRyz0+lQJpey1QzLl0Pz4
         V/qyT4b8xyZa5W1TYdYI+WqoxC78TwIWhOWHwNhhNXVOwik8DAx1j7sB7mxsK5S9OWbz
         ooMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741882510; x=1742487310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmD7MNim/3VQcYsraUusSjJsXZ6QwmA46ppNX6yBUok=;
        b=jUEeDMScRoCaJcnC0jdVa9wUVmQUcuTLFVviHz0IN9jsKlbZL1q0yd6qsThDoshIk0
         5DALWXRTDtnBjKDH40jCOtY24wJQvRee4PFqMoBIhrtBNLYG2audv9loDS3aX9x0Pnqs
         YHeUeLFNXE2KYycgUMJUsQ7HW/agKR+zXv2F0JdqCbt7XnVHMvY+RgW4jD4KJpb3Zu/2
         z5zXQ5tnPydAv2JmyO2l1x0rAieFDfedc7p52Lc7T7I3brzgB4P/gPz5K5BDKFGUiNNd
         9WqTETwbFKDKpUmnqVh19Ab5mc4lVM3L/lE8FVo3OHtm6WOe3z5aC0H0kMTs/CAhrD3j
         PsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo/QogtwnhwsCrmmWBOuWS95qRzj/ft/pZ0m+uUV8mSwX0/zzTqjvTxuBASTAYjIZKikeWt0cgjSeW174=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxH+4HEBwLcSjMPDDWF2ctbt97/AXw25Jmse5/HMxkKsdh9DEPs
	ocoe+CR06QR6jHbbvDR/kGe1egNfMY28ivrcf9bTU1UOZCDqhvcrPxv6wD6odY4=
X-Gm-Gg: ASbGncuYRMPF04CvPK8+O8dw+PSiPZQkXRQZb7PfDGcfPGvW26xmM7A4WvYPDgnRtfr
	/4E0Fnoo4svIuyo+jN0ydp/yS2F/AGmF5tV+t1ofmO0p8O14KDBvptatXmRQ7fc8qXCCh4pH/hD
	+y/XOyjl5xHMr6VNfGwrDVxePypy2QYNAZ8gK1V3EHPZcgt5IQzY0fUpJCSsLn3jLHwdtfhzsy6
	Hvc21B43zZGDWn9390ApVrc73nRspJ9fYueGuMPGkvGH6Yn/AQAzm9pkWg7HL0jeUoVyxZUOlgO
	ZK04uTnm//5JZ9bhZclez9eFTBoh6Ow1bj3wQkr1yG3tVOU=
X-Google-Smtp-Source: AGHT+IFjIwacJKCHP0dnkNtlm25kdYN3UhdeehaflwmpbcpOVEH+KkVK3wJpO9PY4hmEX1fJPFgkvw==
X-Received: by 2002:a05:600c:3146:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-43d1d8afa48mr3000805e9.11.1741882510053;
        Thu, 13 Mar 2025 09:15:10 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188b0cc7sm25704255e9.3.2025.03.13.09.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:15:09 -0700 (PDT)
Date: Thu, 13 Mar 2025 17:15:07 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
Message-ID: <Z9MEi-hWiGf9W4gi@pathway.suse.cz>
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
 <202503072046.34DAF614E6@keescook>
 <CAJ-ks9kTO-u+Wqp0K-vdMLAs08fBeoovSeb_pGkMjSHFnBKysA@mail.gmail.com>
 <CAJ-ks9=zHBmOApsqa=UZcKtg1cH0tp34Kt9_5AEJ7vzwt2QeOA@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9=zHBmOApsqa=UZcKtg1cH0tp34Kt9_5AEJ7vzwt2QeOA@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat 2025-03-08 07:52:49, Tamir Duberstein wrote:
> On Sat, Mar 8, 2025 at 7:51 AM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > On Fri, Mar 7, 2025 at 11:49 PM Kees Cook <kees@kernel.org> wrote:
> > >
> > > On Fri, Mar 07, 2025 at 05:08:55PM -0500, Tamir Duberstein wrote:
> > > > This is one of just 3 remaining "Test Module" kselftests (the others
> > > > being bitmap and scanf), the rest having been converted to KUnit.
> > > >
> > > > I tested this using:
> > > >
> > > > $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf
> > > >
> > > > I have also sent out a series converting scanf[0].
> > > >
> > > > Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]
> > > >
> > > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > > > ---
> > > > Changes in v6:
> > > > - Use __printf correctly on `__test`. (Petr Mladek)
> > > > - Rebase on linux-next.
> > >
> > > Thanks for doing this!
> > >
> > > If Petr, Rasmus, Andy, and/or others Ack this I can carry it in my
> > > "lib/ kunit tests move to lib/tests/" tree, as that's where all the
> > > infrastructure in lib/tests/ exists.
> >
> > I think the plan is to take it through the printk tree.

It would be much easier when Kees takes it together with the move
to lib/texts. It causes several conflicts...

Kees, could you take it, please?

Note that %pGg test currently fails in linux-next. It is a regression caused
by a change in tracing code and should be fixed in the tracing code,
see https://lore.kernel.org/all/Z9L5HsVzQ0bVZtjp@pathway.suse.cz/

Best Regards,
Petr

