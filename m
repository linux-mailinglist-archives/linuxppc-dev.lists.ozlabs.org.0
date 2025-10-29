Return-Path: <linuxppc-dev+bounces-13478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B9C17D43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 02:18:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx8Vv66vxz3bfF;
	Wed, 29 Oct 2025 12:17:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761700663;
	cv=none; b=eh7Q3RJWDdPgy+pNRoekBbMGBjB365zWCp4GV62qdat46Lm8YvLZ71Obti85Z3UGrjLYd/tLkZAxYQav9PPZjnnLU9eH/5LLDidJDojnk3fxNWOIZblKgotp8dsDdIkzRF99xIEv3hQpjW6nI62sBZJ+KzRN57BkJge37al6gJC59xdwCEy6d3QDgo6RpvhwRnPaGIx8ZDG1dlAgL2d+uwVM1ilnrPHGuVmlirG9iEFP+Q97P+6oNKZm8nA/n8Mf924sV38Dlxi05zzlvvD8IV9t3XPBkBFtlK6N4F0D4jajmBxU/HXRdcKWuKkA+hXh+oyEHobQxfpUeNAZN+z31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761700663; c=relaxed/relaxed;
	bh=C0CDCgiJ8x0hvDnQ9rVgMefWSHW2D06xPe+Fo8lJHjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D7Q8+MKugJ6RJTaiiV67fBJkxygr+R5FGruL50MEFXQqzA0bq7ewUupjnLeYtIB44XYjzcA6XrrcZ2NQY1R9gGN5LDJ+EYrfIS+B1bnWMzVUNly/Gq7DSTyEnhiDCKbiHEwyLTvXOO8F3cUmTT6MlJNDE2ryIazSb6kMRz2hFkea9cIa8N3LjZw38DrCQ0z+/134PD0ieamd+RZrZY91ydYpxbnCBB9cCqVH81wtNPAwg17pROVFpIr8+KfEui9DeXr+GDMvi/DJDWb/hr3uFjTvsPqHS29flax3WbnVlP7TgXtq5jcsRyIc4QT3/FgupykBVqjlvtkpyy+wRbo8VA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VSAC2Xxa; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VSAC2Xxa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx8Vv1MvWz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 12:17:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7175260253
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 01:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2ACC116B1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 01:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761700660;
	bh=C0CDCgiJ8x0hvDnQ9rVgMefWSHW2D06xPe+Fo8lJHjM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VSAC2XxarW5YvzgilU1DarcfuwZgpSiT8XzM5uwOby+o5sPww0kSqz09+TY6ntliU
	 CAzhj+bvnNbfhhP7ZeiAy+VZxF64030GcftELaWf1S0pCyR8gJg5uC5kKh9U+PdDkh
	 PoGsoJxqHbYmrzqzYTADGDh8AvcIWKwP5hKi9HiOoZhQPT4pGfS7jrrrWdNMwm2wWg
	 bqaJhvDpIa2qV14ifN0tYagYGy/5pFynBzuEWKmDOSlcbi74gIv7oGa5t4P9zVZGuw
	 +oc1asN4JoDlteAFCq4X3BIH0+J0HOSCNXiqL5+ggtpsTmmz44tBBUEyh+EGH7UFxp
	 K9DVW7x4IWMLg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b6d5b756284so1423986366b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 18:17:40 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx3juN1o5173UfwRYjFz2GnOHROi3fg4oOt2cDL+4+eRun2zi68
	hPsUc8M1rGvZtsZ7AQOdneJcaZ1RWlkP3UH/xAPjTK2sO4iA1Kat6/UW3EkmEBX6SonZD3A+GgJ
	3lVYQwnq6G3PK3TyOptc7wls6Pzqv8Q==
X-Google-Smtp-Source: AGHT+IE9CK8UQYhtNwcOKnwYyopCI4f2n23+FukmrM7Wpeqj9d6+J+ZUZBSu+fFQV42iztsGY6fdVEQJoh6i307bCRE=
X-Received: by 2002:a17:907:3d45:b0:b3a:b22e:dd35 with SMTP id
 a640c23a62f3a-b703d295ce8mr108527366b.2.1761700658688; Tue, 28 Oct 2025
 18:17:38 -0700 (PDT)
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
References: <70d76dcf-c7d4-43c5-c169-07054a37195c@yahoo.com> <78e43ec2-a60a-9876-9f03-c0ad92b7da1d@yahoo.com>
In-Reply-To: <78e43ec2-a60a-9876-9f03-c0ad92b7da1d@yahoo.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Oct 2025 20:17:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ8amo2ggUVfL=YzRrA9UnqKfKCipn-_yOkahJKZVs5=A@mail.gmail.com>
X-Gm-Features: AWmQ_bmiuTZWvsHcyK6FWVhiVNJOfV5xXAbHqqPgdKGsU5uDnntdZ5mJUEakWzQ
Message-ID: <CAL_JsqJ8amo2ggUVfL=YzRrA9UnqKfKCipn-_yOkahJKZVs5=A@mail.gmail.com>
Subject: Re: Excluded List for "#size-cells" warning
To: Stan Johnson <userm57@yahoo.com>
Cc: linuxppc-dev@lists.ozlabs.org, Finn Thain <fthain@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 7:05=E2=80=AFPM Stan Johnson <userm57@yahoo.com> wr=
ote:
>
> -------- Forwarded Message --------
> Subject: Excluded List for "#size-cells" warning
> Date: Tue, 28 Oct 2025 10:00:25 -0600
> From: Stan Johnson <userm57@yahoo.com>
> To: debian-powerpc@lists.debian.org
> CC: Finn Thain <fthain@linux-m68k.org>, Christophe Leroy
> <christophe.leroy@csgroup.eu>
>
> Hello,
>
> On a PowerBook G3 Pismo running the latest Debian SID, dmesg reports the
> warning shown below. I've also seen the warning on PowerBook Lombard and
> Wallstreet systems. I haven't checked PowerBook 3400c or Kanga.

Can you send me a dump of the device tree on these systems:

dtc -O dts /proc/device-tree

We've been fixing up these cases such as in commit 7e67ef889c9a
("powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7")

Rob

