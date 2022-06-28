Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9CA55C06E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 12:55:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXM2R3rDbz3chR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 20:55:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SgjVnFGo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SgjVnFGo;
	dkim-atps=neutral
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXM1t26kbz302N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 20:55:12 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-31772f8495fso112658057b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 03:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bx+nn3bN9pkcTAPrSO8SXuVhJpjdYzH6Wim9ZDKKiAY=;
        b=SgjVnFGomlUOotY/gew1wOdWrD475NDkUK1mb2rUT0EFvD8XhhNOIIykcSWEEL6YxM
         jJinJuo/gJhCW+dtmxOqBXMPReGrI3zwNRZ+WxliSN7Qpbi3jNvVW6ZwIMhSLVwOZY6t
         ByNEzLBuoiVfE3KB4iqfCywFWucy1UDCjq2jhO+UJZFD+1vUpogEWe/tfIk+C9HEG//B
         dURvYRrCbZJjIctxYxYIMKq5CBmVom2p/kc915BHwbw1lCKYOEFZKDEsHmdfX9irHD7j
         F1llsAgUDsNOJIVYDHW7Qal7uXAZjI8v4vAgdaHAB1+k39/T1eUyg4VTTYoCAmCLSqV5
         va5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bx+nn3bN9pkcTAPrSO8SXuVhJpjdYzH6Wim9ZDKKiAY=;
        b=Ozx/L10wBN96GJu1kaIUK0VzgJkc8HIHepjtqWUg78jxl+wEaTkllvMECwx5rENZUK
         5YJ2UrbfW4hPAIbL0UwrtkO7OtfrBpvOvNjEoAYEfjQKR8asU5m8QAeC+YrASbX61Uym
         JtXqf5azxJIdWxDGe/dd4sKNWiAKAeWsqWBSDprmu33PMevwZYC/iBpNsfvvrszAFTRg
         lkPpK91kckQCTSHrmVUms8EfqpkkzuH+KSrm24pwLKWLGZ9ZAln8E0Grm61u0ksigAC9
         w2yeVo8UmwbDPA1ZOEoCfpoFF0iYuknRHSZomUZtSsWSrqQhg74+XqbytUcS9TFKguGh
         DwTg==
X-Gm-Message-State: AJIora9Gd1fa78dctYEFGvIh4RilT9kuzTliGIOQDias10J5ug1dt8Y+
	D4QFfcMxi+8HSyagjfNFPxLgsSwoBJRVOWES3wX/eg==
X-Google-Smtp-Source: AGRyM1vz2ZG/AOoQ4vBN8VmbUXJLQvwRbaY4tA5etmPkx+EhZBLBb/NNp85KWwxKWmdK+O/VbOcVkqR614Ti4viQrKI=
X-Received: by 2002:a81:1a42:0:b0:318:3915:57d7 with SMTP id
 a63-20020a811a42000000b00318391557d7mr19561304ywa.327.1656413708510; Tue, 28
 Jun 2022 03:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com> <20220628095833.2579903-14-elver@google.com>
In-Reply-To: <20220628095833.2579903-14-elver@google.com>
From: Marco Elver <elver@google.com>
Date: Tue, 28 Jun 2022 12:54:32 +0200
Message-ID: <CANpmjNPapZ9p3dSB1RC-cBoJ588XkRxJRzbhxx4THLZ9aWsx=A@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] perf/hw_breakpoint: Optimize toggle_bp_slot()
 for CPU-independent task targets
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 at 11:59, Marco Elver <elver@google.com> wrote:
[...]
> +       /*
> +        * Update the pinned task slots, in per-CPU bp_cpuinfo and in the global
> +        * histogram. We need to take care of 5 cases:

This is a typo: "5 cases" -> "4 cases".
