Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3772770C22
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 00:51:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ek9nbT4v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHgtv5fnvz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 08:51:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ek9nbT4v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHgs93X5mz2xPH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 08:50:05 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-522ab301692so3344102a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 15:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1691189398; x=1691794198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oufc1x89nwlrXRNKkHYYKDDdEzz4I9gpw2oNWdbuYSU=;
        b=ek9nbT4vbgPZ+azcPAsdQeyAtqMClxBQIb8nCm29XApExRJ17/WKFjpsdwi3RSEuk2
         1KmSDZS5bXxELfliRFMmhmdSZrHbJHpGwfVSKdgn07uxP+LubfbPCHjr3bZXjEQ4pk2/
         7deNEx8srUlgb/B3l4aiIVpxz0wuZPETY2Jt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691189398; x=1691794198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oufc1x89nwlrXRNKkHYYKDDdEzz4I9gpw2oNWdbuYSU=;
        b=Y+fOfbURflGpeFn3NHnoWTQTC1L09B5E+P9EVsiBFza7BZPOt/YaGehLic9BWUSfl9
         su2/4kMX8at5R0XU/ii3eeOhS+j03VkdRoG4OaEPCLV5NS4Y60nHhM08h0mQJHQGe44T
         KjUzgZlBNxkCoHPbUZO6XRjm4wr/bd1hn3ynl5N7OWt3eE5DvS0Mo+zNrifuWLLJ3VXf
         lB7Q64NudsV5KeALBTfVpkxRwesmH2xSTBh4STF8q2B5LNwCSyypE4kSeHuxK9voxHju
         RGxqBNxK0gx9hbo85jSH41KfVQIyAO8UvAvNGVtvQlmsTK1bHWsX+Ejs/DYhsYF3kQsx
         O45Q==
X-Gm-Message-State: AOJu0YxzwyDQbcxtx1iMnl2FOeJh2jKu16bbPRa7Op3F6xWMaoXDuZ7E
	RNzOrVxqDoXixl+4XYT2ncdBFWUhpvy4moD10gtMHg==
X-Google-Smtp-Source: AGHT+IEAQA7tp2YEtXBOFLBxiCPVeNUH8DEdS1i4oU9EY3cHI4FVifX+FgSgeLqHCBDmDlbhF+vVTw==
X-Received: by 2002:a17:906:31c8:b0:99c:55a9:3925 with SMTP id f8-20020a17090631c800b0099c55a93925mr2621139ejf.24.1691189398550;
        Fri, 04 Aug 2023 15:49:58 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id d8-20020a1709063ec800b009927d4d7a6bsm1890029ejj.53.2023.08.04.15.49.57
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 15:49:57 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5230df1ce4fso3129453a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 15:49:57 -0700 (PDT)
X-Received: by 2002:a05:6402:514:b0:521:d75d:ef69 with SMTP id
 m20-20020a056402051400b00521d75def69mr2790287edv.31.1691189397521; Fri, 04
 Aug 2023 15:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f>
In-Reply-To: <20230804214620.btgwhsszsd7rh6nf@f>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Aug 2023 15:49:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
Message-ID: <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Mateusz Guzik <mjguzik@gmail.com>
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, gregkh@linuxfoundation.org, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 4 Aug 2023 at 14:46, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> I don't see it mentioned in the discussion, so at a risk of ruffling
> feathers or looking really bad I'm going to ask: is the locking of any
> use if the forking process is single-threaded? T

Sadly, we've always been able to access the mm from other processes,
so the locking is - I think - unavoidable.

And some of those "access from other processes" aren't even uncommon
or special. It's things like "ps" etc, that do it just to see the
process name and arguments.

            Linus
