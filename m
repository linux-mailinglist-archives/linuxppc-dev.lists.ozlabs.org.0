Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7FC93CD27
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 06:15:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jsBNIjim;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVZDk30Xtz3dBh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 14:15:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jsBNIjim;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVZD24B09z3c05
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 14:15:13 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7a10b293432so417049a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2024 21:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721967309; x=1722572109; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3jDQgJjkOPkFdNASGIQMdZJ31Vgc4apYAqzb/U5CKI=;
        b=jsBNIjimbhWaRILx9Sk+or/jb2wwQHnrtTQV8wZ2ZyIVtFeOKeHHb51+ecHUO0G1Y1
         KVKJB7tUpGhLH3lh0LYl2/s/1YRbX/8mLxDuhHqddUmU2GTG1YiPr2tlEXP1v5NUV60Q
         qgPKXMXE4My1XzbMtmySeOeRwAOSAQT7zcbOnEJDd2RAj/yWK1GS/D/nsfPwthKidxuv
         sOtvbQqCd/+medztcOWAjkGZ4ke9RyIWOTLMRoU1hlourpwnEUeG5TBhePsBetNy8lrd
         bVUYRmx40M3XbQWyysqzL0qldawYMgAh1FLtqhCE71gP4vq7DlnK07lDOnfzJe7GEQxA
         +geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721967309; x=1722572109;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f3jDQgJjkOPkFdNASGIQMdZJ31Vgc4apYAqzb/U5CKI=;
        b=aRrafqWyJ2UmVInN6CtYgNRtTQadmUyQM6VEfWpZm10GAmYPc58vbg2jxjLLN61YnT
         gyO1RJV8ffxgbsQFnsiHrRziQDKFs66OgpxJn3mnLftbAA7+rUGkxKgSK/OuH/8gj0sa
         XvhrVk/R+jGr2f9Tw6qaWVsSOOeBpTTSUgODSZEIGWFfyPv1DK0XmkhtaQ6ca/+jFTjU
         FaxJ9YWa/IOusEUM64YjEzH0BwE4I1yDCPR64gV4uI65Md7f6NGDzKKvgG70r7b47xSH
         /wh79hW3L2LsknVeJxqyUiFdTvqwaTcI/36HWsZrxTI/pyYj07Xci+X4dUykznzzB8fP
         7jIw==
X-Forwarded-Encrypted: i=1; AJvYcCVgMrB1tyisul9rUtqdgA4az8WnZwt5eopEGqxbt6mD0zQP6NfSUjyyXulEB8wISlARL+iqJLW8OwT8Bpw0knreds3LWjgKF4WMdrJGaA==
X-Gm-Message-State: AOJu0Yxlp0gGbXXWhKm/bUZzvNYYfh8O6veo9rk5O25qJgBJRzSc5cX6
	f5uneyD2N5Eyt5LxjA6e0+dKwwXa9UMgggBCi8VBhprwYyrLGvBz
X-Google-Smtp-Source: AGHT+IFmN17I4J5GSEbfLIh57WYix6Z4DqY06Of+f+JtOC/7oBUIVl0iyJ5AherVGcrUqk8gycWzzw==
X-Received: by 2002:a17:90b:3e8b:b0:2c8:538d:95b7 with SMTP id 98e67ed59e1d1-2cf238ccb87mr5415523a91.32.1721967308684;
        Thu, 25 Jul 2024 21:15:08 -0700 (PDT)
Received: from localhost ([1.146.16.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c9cef7sm2365286a91.29.2024.07.25.21.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 21:15:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jul 2024 14:15:00 +1000
Message-Id: <D2Z6GP2VFOJ8.2KU7OB25CUXTC@gmail.com>
Subject: Re: [kvm-unit-tests PATCH] build: retain intermediate .aux.o
 targets
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nicholas Piggin" <npiggin@gmail.com>, "Segher Boessenkool"
 <segher@kernel.crashing.org>
X-Mailer: aerc 0.18.0
References: <20240612044234.212156-1-npiggin@gmail.com>
 <20240612082847.GG19790@gate.crashing.org>
 <D1ZBO021MLHV.3C7E4V3WOHO8V@gmail.com>
 <20240614010856.GK19790@gate.crashing.org>
 <D1ZLRVNGPWTV.5H76A3E8DJCV@gmail.com>
In-Reply-To: <D1ZLRVNGPWTV.5H76A3E8DJCV@gmail.com>
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

On Fri Jun 14, 2024 at 6:38 PM AEST, Nicholas Piggin wrote:
> On Fri Jun 14, 2024 at 11:08 AM AEST, Segher Boessenkool wrote:
> > On Fri, Jun 14, 2024 at 10:43:39AM +1000, Nicholas Piggin wrote:
> > > On Wed Jun 12, 2024 at 6:28 PM AEST, Segher Boessenkool wrote:
> > > > On Wed, Jun 12, 2024 at 02:42:32PM +1000, Nicholas Piggin wrote:
> > > > > arm, powerpc, riscv, build .aux.o targets with implicit pattern r=
ules
> > > > > in dependency chains that cause them to be made as intermediate f=
iles,
> > > > > which get removed when make finishes. This results in unnecessary
> > > > > partial rebuilds. If make is run again, this time the .aux.o targ=
ets
> > > > > are not intermediate, possibly due to being made via different
> > > > > dependencies.
> > > > >=20
> > > > > Adding .aux.o files to .PRECIOUS prevents them being removed and =
solves
> > > > > the rebuild problem.
> > > > >=20
> > > > > s390x does not have the problem because .SECONDARY prevents depen=
dancies
> > > > > from being built as intermediate. However the same change is made=
 for
> > > > > s390x, for consistency.
> > > >
> > > > This is exactly what .SECONDARY is for, as its documentation says,
> > > > even.  Wouldn't it be better to just add a .SECONDARY to the other
> > > > targets as well?
> > >=20
> > > Yeah we were debating that and agreed .PRECIOUS may not be the
> > > cleanest fix but since we already use that it's okay for a
> > > minimal fix.
> >
> > But why add it to s390x then?  It is not a fix there at all!
>
> Eh, not a big deal. I mentioned that in the changelog it doesn't seem to
> pracicaly fix something. And I rather the makefiles converge as much as
> possible rather than diverge more.
>
> .SECONDARY was added independently and not to fix this problem in
> s390x. And s390x has .SECONDARY slightly wrong AFAIKS. It mentions
> .SECONDARY: twice in a way that looks like it was meant to depend on
> specific targets, it actually gives it no dependencies and the
> resulting semantics are that all intermediate files in the build are
> treated as secondary. So somethig there should be cleaned up. If the
> .SECONDARY was changed to only depend on the .gobj and .hdr.obj then
> suddenly that would break .aux.o if I don't make the change.
>
> So I'm meaning to work out what to do with all that, i.e., whether to
> add blanket .SECONDARY for all and trim or remove the .PRECIOUS files,
> or remove s390x's secondary, or make it more specific, or something
> else. But it takes a while for me to do makefile work.

Hi Thomas,

Ping on this patch?

Thanks,
Nick
