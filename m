Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31515908036
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 02:44:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ww+9t8Yr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0gXM04hjz3chF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 10:44:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ww+9t8Yr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0gWc5mJqz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 10:43:54 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3c9b74043b1so776177b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 17:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718325827; x=1718930627; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eWVs6LwRBJG+U3k9Ejxz2oBmjdXJxvB7EaltXDx1Yc=;
        b=Ww+9t8YrE/AU8Yaq2LUHgeVE8VzZc3pFEIrXqBT60iM/6F8xpHurXbywoyLQN3Aay/
         124mkkRuBqJkG/mfh3g9ndKHQmxs5Jx2JuG9J6lv0XdbC9R8YAqsMQL8J46aET38M7mv
         Qf0eyYUwR92piymwpIBtV5V2spEUUual5TPKcYdXXEaAZEM9DbQkSBkmWSo1oKhIv9lp
         ahff3Y7plQBIsntEJrHtRj82Kcky+VuIhW4ZbZJr4MqXVJpcr3CehXew1GwBOJMFwexX
         gbKZzsbYs18vTjXw8b65nTykgBl3o7rwFtxjuNH0yeKggGd69wWkn3lP1p3QmSo2U4pY
         aKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718325827; x=1718930627;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/eWVs6LwRBJG+U3k9Ejxz2oBmjdXJxvB7EaltXDx1Yc=;
        b=O2wWzMCrYdcWLiybt0m1yWalwWjefZc3lSrZ4o6nGSp+t8LcPVclHGTsfUtgq55ngZ
         MVlj+FZOAAdfuFsetvbpKAxGsGxtnPdLXhJJHNzZeiIF5yFC3fqH+WlHbsIwupJju4T3
         ZqIhWsOdPa+uTMJK6yhB6qG/UngFlb3xea6IJISEEjeWWsA3E7zqHn2+fABkDx37f+ey
         5KU4wAfQEX9RknNXSPQpiog58cXxDzfomsfCovRjhK3UlpUXnh4Vh6enTqw7gqFmAMfO
         UclX7e2V+RQ8aj8kyxEiJ3it1c6GhBK75HH1roadTaIykq8DkJWQ5yvtpwr0iSm19dJk
         B6+A==
X-Forwarded-Encrypted: i=1; AJvYcCV5DU6/umjo12yh1xJilBZ9wOkgf0aCr90Kac3v5B8svmW5+dU1s57X83fMBj30f0saJop3jBP7oQ3GlRwDtpwbTfZxocX59pvbVJw+IQ==
X-Gm-Message-State: AOJu0Yzasr4eBCuUX3wCl+w7RdYPxJxB7Xo98oP/o/03yKIb5TSAXRZ4
	hSy4emwInTMNp6BNNch015KoC3cxQwdQNzSRruh2Voj5BNIxqcge
X-Google-Smtp-Source: AGHT+IG/WsixQvvfFJeL2cK/SvFU0QWQIcY3fHQHS0r/xzXjpdjaDngQ5f4l/dQsk2QM6rvOkN+UjQ==
X-Received: by 2002:a05:6808:1992:b0:3d2:24d3:80f3 with SMTP id 5614622812f47-3d24e9dc797mr1382862b6e.43.1718325826876;
        Thu, 13 Jun 2024 17:43:46 -0700 (PDT)
Received: from localhost (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc922643sm1950344b3a.31.2024.06.13.17.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 17:43:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Jun 2024 10:43:39 +1000
Message-Id: <D1ZBO021MLHV.3C7E4V3WOHO8V@gmail.com>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Segher Boessenkool" <segher@kernel.crashing.org>
Subject: Re: [kvm-unit-tests PATCH] build: retain intermediate .aux.o
 targets
X-Mailer: aerc 0.17.0
References: <20240612044234.212156-1-npiggin@gmail.com>
 <20240612082847.GG19790@gate.crashing.org>
In-Reply-To: <20240612082847.GG19790@gate.crashing.org>
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
Cc: linux-s390@vger.kernel.org, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jun 12, 2024 at 6:28 PM AEST, Segher Boessenkool wrote:
> On Wed, Jun 12, 2024 at 02:42:32PM +1000, Nicholas Piggin wrote:
> > arm, powerpc, riscv, build .aux.o targets with implicit pattern rules
> > in dependency chains that cause them to be made as intermediate files,
> > which get removed when make finishes. This results in unnecessary
> > partial rebuilds. If make is run again, this time the .aux.o targets
> > are not intermediate, possibly due to being made via different
> > dependencies.
> >=20
> > Adding .aux.o files to .PRECIOUS prevents them being removed and solves
> > the rebuild problem.
> >=20
> > s390x does not have the problem because .SECONDARY prevents dependancie=
s
> > from being built as intermediate. However the same change is made for
> > s390x, for consistency.
>
> This is exactly what .SECONDARY is for, as its documentation says,
> even.  Wouldn't it be better to just add a .SECONDARY to the other
> targets as well?

Yeah we were debating that and agreed .PRECIOUS may not be the
cleanest fix but since we already use that it's okay for a
minimal fix.

Thanks,
Nick
