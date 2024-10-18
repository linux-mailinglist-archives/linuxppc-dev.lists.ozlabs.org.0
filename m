Return-Path: <linuxppc-dev+bounces-2417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDCC9A4A48
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2024 01:50:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVhKs2FR1z2ytV;
	Sat, 19 Oct 2024 10:50:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729295457;
	cv=none; b=BwdAzp1qjgsAp4iLBHJmiYy++puspbVU9PMQxFXwiHq+3TaSawo5e5O+HNq1xYXDpMsdzB4pkwYhz18ddIK33cMvCNkm/UUe72tPFwAElnt7OfI881dE5ZvKt6egZ27+azPkMXSzlch5e+BE+PqCRFAWwJegcNUoumZaoUNlIlsv5nTMiltkz3ki/DgRFugQR6wed7BUPcUm7x+aPEY/70Z8RRyX39RrKAYYcub5w2JpIR8K22pbIwxVVFh3bSSW7XxRlqW0wZxjz+Otuo2dIW4sRV3bA+w7DaF+SH5WqXmfzU63Czcsc0VPrwhCLxAgf9NRt5oRxX8xDOFDS6XmyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729295457; c=relaxed/relaxed;
	bh=fQIgcwOpF8GpQsLgj2FtogDbWZde+y8RaY8eMvCGFCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzmOr7UiU7rgG785FtdNZOw2F8+DFMWJC3vGQD5DHluss2ayhoTd2Njzie9EIy61oXPOaxFDT0YYWxHeFEeNGF4sw1tiNIzbr+nK7ITlBXIBebyuPWs1B6QMQptFHxD7q8ZkHXlPxfIf2edMIxOeUwZ7nCn/qxKPnWssUJmhpFO8B9r5liZP1JX7ja48JvZnrmPXxiSbimgte/LzbCDMx+QQnCVX4eP2AtGcPupwKHsV9WYU6RtD5dNTFgBrEihN2t3ZOEfJMsljHtrrMw+SRAapCflIoKCBBECCHEWxx3sKSielj3J6/8+9/Q9W1PllkCtG9dKnWYTbdzKrDMyvRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TBtUz/Mr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=paulo.miguel.almeida.rodenas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TBtUz/Mr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=paulo.miguel.almeida.rodenas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVhKq2lWMz2yVt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 10:50:54 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7ea8ecacf16so1930662a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 16:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729295452; x=1729900252; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQIgcwOpF8GpQsLgj2FtogDbWZde+y8RaY8eMvCGFCQ=;
        b=TBtUz/MrR2eCAKTTbdSEP0q/7r20SZvY+ZGzSjjbdO/4P77gmyDTqoZ0SbvZhXrGLv
         BfU2bIim3pMgwLNp0sSWBcZ0neGXTcboGDCpn7tSmvC+MVI5lC1SoiVPwcQEIT02DO4I
         6JrWxGdEIG4un3ATzGItc0M5VtF/eR3lpX7TldNlAXJqWfeD9iiG2M7+1QXL3QyRcHh3
         c0PVv/wMm3NICsxDU4fUVNBYDJOI5SwoZQYNkVJamYpsZiHX1/X6Ga21T+wXXHImqiW8
         jKQEJ/5LqX4eOjG33an9YEhtjeVlDPORHEAsw1asfKo86ar4RYqUhFoD5oAYqdcPXZ+w
         mqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729295452; x=1729900252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQIgcwOpF8GpQsLgj2FtogDbWZde+y8RaY8eMvCGFCQ=;
        b=kM6kJ/w1ZfTr3GupdGCQyBor3kRFpBlOaEyVzBNOCOQIhOyRFCv4ZPuksMd4CdHfAA
         tNBejIKWDkWQ1vaPVsUvGNHu1M6ioLKnAieoqPBBHwzHFSaPsFiXRXaCCVCsV/Sv6lqi
         MUnKH9t63cGVRsAh3hsEwj1lckhenLhEwRiuIwXHQhI3pkSJEyPb95kd/qPU1zoJY07M
         Phv3rkaEm4vQFUv9wPi3V0zp7ILmSrKhAZo3Cbw4QRasviFbLh6J0JN0Fz8eXWzp/jFA
         f2+gQ6kl3eBQDdtbVE1EjCDh+5e43z36OhebC1XoRf5ZzsB8uatKQp6KLagRIFiXwiMu
         BuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9N9Db5ut4HW7hVmFYoJdLY+g6Cb7O3aw3jCfoHioTVWbQv8HAwrMEpTl9bRnGhqbv49O9SMeBsbpeI3o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9tOpiW0IW9ik8olgiad0TYj0RCHu/KqIxX/yIeac3qBZfu0NC
	mfoluACdFmtbnBdZbn7YFxe/V8HOjABBRQ54UbiyeHMGKPyR+Yrw
X-Google-Smtp-Source: AGHT+IFE9JK6B3y21JfHyOThlSgy/691TKbKrXY/mee9sy3R9mQV71UR397nafsW1x5D8JSGyjZQmw==
X-Received: by 2002:a05:6a20:ac43:b0:1d9:9c6:5e7f with SMTP id adf61e73a8af0-1d92c49fa1fmr5518445637.4.1729295452467;
        Fri, 18 Oct 2024 16:50:52 -0700 (PDT)
Received: from mail.google.com (125-239-144-11-fibre.sparkbb.co.nz. [125.239.144.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea34b4b78sm2035852b3a.218.2024.10.18.16.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 16:50:52 -0700 (PDT)
Date: Sat, 19 Oct 2024 12:50:43 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	naveen@kernel.org, maddy@linux.ibm.com, arnd@arndb.de,
	chentao@kylinos.cn, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] powerpc/spufs: Replace snprintf() with the safer
 scnprintf() variant
Message-ID: <ZxL0U6bziCxhySUO@mail.google.com>
References: <ZxIcI0QRFGZLCNRl@mail.google.com>
 <20241018153843.GJ29862@gate.crashing.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018153843.GJ29862@gate.crashing.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 18, 2024 at 10:38:43AM -0500, Segher Boessenkool wrote:
> On Fri, Oct 18, 2024 at 09:28:19PM +1300, Paulo Miguel Almeida wrote:
> > The C99 standard specifies that {v}snprintf() returns the length of the
> > data that *would have been* written if there were enough space.
> 
> Not including the trailing zero byte, and it can also return negative if
> there was an encoding error.  Yes.
> 
> Not that this matters at all for your patch, so why mention it?
> 
> 
> Segher

Thanks for taking the time to review this patch.

Is the objection with the change in itself or just the commit message?

If it's the later, I'm happy to tweak it to what you would like see.

I added that bit for context so the motivation behind the preference for
scnprintf is clear, otherwise one would ask me why :)

We are phasing out snprint utilisations in which the result is being
used [1]. One of possible ways this *might* take form is that in near
future snprint will have it return void.

[1] https://github.com/KSPP/linux/issues/105#issuecomment-2421244722

- Paulo A.

