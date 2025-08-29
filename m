Return-Path: <linuxppc-dev+bounces-11508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC09B3C594
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 01:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDDs060CLz2yPd;
	Sat, 30 Aug 2025 09:25:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756509924;
	cv=none; b=ebNgQvhKXxW7buwyehekmwRS3783i+R3cOQjuy2UtlsEmqEeRyedzlMCobqBGMRpGuG1l25sFnJ4f9sD2p5kjg9OTsfrHjGtXjwfdIMLRh/reKZKXm3jJ0KGN9NGa4fBrKHLAWCcNGKA6dNJASQ+TawHOZWwsYRCg6hOfv+u67fVzutwxoP33sMUCH73HIshlOScWvyo5H6Y8sz83KsQT/+pkfgVvj5jadz1nX6EEpl3e/qNLnk9N2haHZ+UpyVL1H5Jim3wNa14szB8FKFnnQejXNhoP9sC9AsgvV/neLP3SG/SKKYvpYfvkF/XYxfHwpBJlRC5IpuuAoY1AZyGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756509924; c=relaxed/relaxed;
	bh=oD8JqPOQqmYe3P5iUXgZlViA+A6aXFi+Sm0h/jvEQ9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZzlIrEzoM8+ZkqIWkdtVJLyv0Hp7csjTbNGD477J41vCkRrlM3k/rfT25JuI13H5u09z2SbDwXBhw/oVqaaLHZuLjHO1h9HnyW482kPA2R6ftYFMpANZowp+UyIKuM4X9TyIaUC1R4nLIskJtQ6lOG7PJ4wrhxSVE30KDHpIXAPCBt6bPDS3VO1I/noJZDgnhV09Wq/5opNoa6f62WMkmg8IaZdojUYaM7YCEuMppKpsRldQ6HoWr7defWOH17v05qB4Hmcu/6Qwqz1hSKtYzb8+JXoo7dSRk3TCGNKfftmVYwpF6hRIdGvMjNm8MGVRkt6VY6CB7InObO6QzD5Aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NvqrREU5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com; envelope-from=linasvepstas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NvqrREU5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com; envelope-from=linasvepstas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDDrz2Nlfz2xnp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 09:25:22 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-74526ca7d64so2212908a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 16:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756509919; x=1757114719; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oD8JqPOQqmYe3P5iUXgZlViA+A6aXFi+Sm0h/jvEQ9E=;
        b=NvqrREU50iG8Ha6Kv7xRI9l4t/+lA+y/ADWKJjOcZpIjqo/0QwrI23o6rK8SoA2vPM
         gv6VRQt8iaK9GkuwZn08cGSUHMGsX6pEhDS10V6MgDcVE42tKFmKAk8LmDKdfNEvIJiZ
         qpqNU8MVYi36EcPTcnAc6Vu9IaaxneAlTbQckWdjfPGjTRJJstu+vtd1mxXDs8nn+aRZ
         M4KxfanpWsoGLhuS06nuLzShyFGJa0WaZHZdB1Nx6WuSqA93Z9HJZDnYWmfAnDdVW6gN
         vLKxnoo1I1pNoZdER65MfzZAj+OV6q/yQVuJT0l1Nt5TewBivkZhr1Q5iNPWwC2o1RQ4
         DZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756509919; x=1757114719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oD8JqPOQqmYe3P5iUXgZlViA+A6aXFi+Sm0h/jvEQ9E=;
        b=Owgdy50lSPGJ3LwtuVDJZwfmmP8nFZbfVBGg0M+oL/VdIr+q4oUuGzHlLkDrZssk4T
         yP3pu0u7vDkInVUPVGy3Y7P9yueNOFVNGKU+FZGTrLS+oz3xc8e7bQE0gtNW9cvBtlwa
         EmMaxaHcrnvz1O2iRXspsm/4QTGy7GR6s6l8uoo1FkcALkQ2EM/aC95Vn6lEAa3AAAMT
         mIhqXce+tgMjZDQ8K7iUM+2EvkgO5bdfM2gkr4BHI4PGzIt3z3XkCNi0Bi7YkwE87znO
         1o6QfUtjZRm5PEkhvOjCg9RiE17IJWOji6nxiRdqxCudk+JDsR+qmBe0mJLq3qLoOen7
         Tw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDJU+2JZQE7zw4oT0t1xF8y0cPgrJ5jS5CnyGm+ho7dL8wuzI7d9zUZVTL8SkZrhNB90VAVHUyV/X18kU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw16omWSHK7nw2ydqoBQhvbGDAZNIwgoBQXS96TI/b9GiegDgwk
	yN1xhvbDHgl9nbzuAztxMPImlnBzKA6qFheoBSUyvIVHyZ9yZAUotVYKdBh5/OUq4raseaZUXg5
	bDfZV4yZuj6Nnb7PrR7qyLUFCU75LvA8=
X-Gm-Gg: ASbGncvnTGG9x61XRAcM+LCXTs2GeV1HauWwcRWOy/h7FhpvYFK6VI/tj0diski7x5n
	3RWv73VysT+Cpy70i1GafaU+VV3EdQJ4pTrxcKf6epafJ0EQW1R/bodOh6/mEWuw0uL3qhdFObn
	JTKGA1Jzv7FtuWe5bNtvxLM1Y+at+WLCD8HvKHS/FaPy2IloVPZDEgxErGWJP4FxOgoZoNzyOgY
	y7EXRrLmUNWUKHHkSQEGOfTJkJ/R4M7Rk5k0rSLR2ZIwL5UsoF5Kcr1RsQ1vOcjlPWoaDIa8FEC
	huZW
X-Google-Smtp-Source: AGHT+IHaij0sVaJ6ogaPQCO9IKBgADMM0ztIHx86w8groy7y8g8JAMnXJW1JkHtngSu5rwitc9gzhu/qbDgn8SocPoM=
X-Received: by 2002:a05:6808:23c3:b0:437:e679:79c with SMTP id
 5614622812f47-437f7ceafe3mr137481b6e.12.1756509919345; Fri, 29 Aug 2025
 16:25:19 -0700 (PDT)
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
References: <cover.1756451884.git.lukas@wunner.de> <42726e2fd197959d6228d25552504353ffb53545.1756451884.git.lukas@wunner.de>
In-Reply-To: <42726e2fd197959d6228d25552504353ffb53545.1756451884.git.lukas@wunner.de>
Reply-To: linasvepstas@gmail.com
From: Linas Vepstas <linasvepstas@gmail.com>
Date: Fri, 29 Aug 2025 18:25:08 -0500
X-Gm-Features: Ac12FXzU95lbyYwfEX8tEnCZZpSB4eS1i5zDWjaJAsRdUyyG8eFVpBZdfMozsGI
Message-ID: <CAHrUA364QSpcJOu=96JV-3hR9G5M0FSUPNhb4AspULAcXvQP6w@mail.gmail.com>
Subject: Re: [PATCH 3/4] PCI/ERR: Amend documentation with DPC and AER specifics
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Terry Bowman <terry.bowman@amd.com>, Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 29, 2025 at 2:41=E2=80=AFAM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> +   On platforms supporting Downstream Port Containment, the link to the
> +   sub-hierarchy with the faulting device is re-enabled in STEP 3 (Link
> +   Reset). Hence devices in the sub-hierarchy are inaccessible until
> +   STEP 4 (Slot Reset).

I'm confused. In the good old days, w/EEH, a slot reset was literally turni=
ng
the power off and on again to the device, for that slot. So it's not so muc=
h
that the device becomes "accessible again", but that it is now fresh, clean
but also unconfigured. I have not studied DPC, but the way this is worded
here makes me think that something else is happening.

-- Linas

