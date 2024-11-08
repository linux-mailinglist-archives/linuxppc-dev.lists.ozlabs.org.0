Return-Path: <linuxppc-dev+bounces-3033-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BED5C9C1856
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 09:48:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlCK62mcSz3bsM;
	Fri,  8 Nov 2024 19:48:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731055722;
	cv=none; b=E4MALFQFi/nnrr6jbSZMObmeY0iAleVArTFk/h0ySAv8GFqKo49ACU0/paj5ANyVdtwGc9j+G7+L2xZwO6bCjrVK1gqpWva77pNgVNq/8waqgvlR9cQXI4IKxco0lFe9PNVxHNRdfYXyU437g/0/4Y4UUVkS8WU2CSQ5DnHgUhhaXzftDMdpKWv8ux3ocSwg+QdYaLDEdMASWD2UHPwexDxAVUbjF02hHXaJvHfo2YvTnc7lkGw6GSaPpSt6dmtmQGceJliMS0b3xURzVHD49BE/amz2lpAoRctxvMNFXiraf/Y5wZtE/36rtolvTlCXT1J4UBDbJeiAezkJUDiVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731055722; c=relaxed/relaxed;
	bh=ecEDt1lJOmPu8q4ArxHuiYSrzWLT2wQdzWYf+ZUa9tQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVBGodONrTsrCUvbJPP10LnOFiX0grVS9dDV5Tt4FnIaMSF9ZgzVVDq73gLE/NDxvErSYZTJ9Qw/qSh7t0E6WZFztgLr82uJHmw4LdIn7BTwGfS9AtPqLLkuZxYpdh9S0x8espDgmLyuwMI0C2eFz8uFzqzRIfs8I2yvJhNuINnifFQFZP/8Z2qQBr7Sc4TuirjaGIyk1FOHiPsKLtgYeAGa05E9f15LG54j3QbHNdi6NTdgA3yIt2KaTQ4n566ZRy9JFmyenikZDiWYTvuEW8hRXmHVEyrK1OM1df8YppoyayTvgXARiROQHLfMOHQzUZyyaDyt0/LmThX97s3eYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.128.177; helo=mail-yw1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.177; helo=mail-yw1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlCK36Lhqz2yVD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 19:48:39 +1100 (AEDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e377e4aea3so15935207b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2024 00:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731055715; x=1731660515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecEDt1lJOmPu8q4ArxHuiYSrzWLT2wQdzWYf+ZUa9tQ=;
        b=FYAygtyKhy9mpIOSdvjVYMWlpmhdX7siJZT5IEZxgPvzzGdD2Is5gCRIrQHsyH5TQA
         mzx4Bci3HA15yCd075kqMvBZ63GasO+rspuxWmZiT/AEXZJOWs836URdPg5SSoBy3zEb
         iqhpy3IlSB24lBMXm/VIQj/PJAvo+g+sp4Fbm1qRs+KZ1CilcqgXIFHEgAiJgPNVMjTL
         wABtHsc5uRu17O5+7AtdCBj1I2MlQQ62D544LZNJGLgc2COhZpbYQN9Dq86aCsasZ3Bp
         K2IRY1qbeTpNh7yef9CvCG9ahYS3HFMy2E3GUI7CNt9yLkack8ntyQ2ZY8c5cdekrBIM
         n/6g==
X-Forwarded-Encrypted: i=1; AJvYcCXVXtEs18idwLKU5Ts29ioIicF6uFuWlUEY4FLhbE3D7cdPtdAFjn6LrBvaktbeuKisHS9+x8OCXC9lTtk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJKJpIW8vkuQs4vFHhHlW6lebqzSf4zchUL8emCvdeLh4Wan77
	MvByoZU4vvoX8K6d5biGOkfjeKLBgMc3sBl/VrSEFXLWor8c6vbQz15gDRgh
X-Google-Smtp-Source: AGHT+IGnpoweMSAIT1QPRSzJIz9QRK4OrgwduNdrkVVMS1kjWZLI+KzazQNP+aGdFOM5mBrPKNcyjA==
X-Received: by 2002:a05:690c:7485:b0:6e2:2c72:3aaf with SMTP id 00721157ae682-6eaddf81805mr24901017b3.31.1731055715016;
        Fri, 08 Nov 2024 00:48:35 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eace8faca1sm6250237b3.54.2024.11.08.00.48.34
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 00:48:34 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea5003deccso21034667b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2024 00:48:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXd0I3ZZr3CBILbp+v3Hu8NOvwwEV7CGZBEHo+ZBelVbNO8FA+yieZf7PNq33x8ur5xZGF4EtmhPAAHisM=@lists.ozlabs.org
X-Received: by 2002:a05:690c:4c0b:b0:6e3:31e8:7155 with SMTP id
 00721157ae682-6eaddfb8f93mr20220047b3.40.1731055714114; Fri, 08 Nov 2024
 00:48:34 -0800 (PST)
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
References: <20241106171028.3830266-1-robh@kernel.org> <87jzdfcm3l.fsf@mpe.ellerman.id.au>
In-Reply-To: <87jzdfcm3l.fsf@mpe.ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Nov 2024 09:48:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWk83QpTcbuBz=m6UZ+ShFM4rTt_UL-frzR3LmAf_Tb2Q@mail.gmail.com>
Message-ID: <CAMuHMdWk83QpTcbuBz=m6UZ+ShFM4rTt_UL-frzR3LmAf_Tb2Q@mail.gmail.com>
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, linuxppc-dev@lists.ozlabs.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 7, 2024 at 12:37=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
> "Rob Herring (Arm)" <robh@kernel.org> writes:
> > While OpenFirmware originally allowed walking parent nodes and default
> > root values for #address-cells and #size-cells, FDT has long required
> > explicit values. It's been a warning in dtc for the root node since the
> > beginning (2005) and for any parent node since 2007. Of course, not all
> > FDT uses dtc, but that should be the majority by far. The various
> > extracted OF devicetrees I have dating back to the 1990s (various
> > PowerMac, OLPC, PASemi Nemo) all have explicit root node properties.
>
> I have various old device trees that have been given to me over the
> years, and as far as I can tell they all have these properties (some of
> them are partial trees so it's hard to be 100% sure).

Apparently CHRP LongTrail only had #address-cells in the root node.
Interestingly, /cpus does have a (zero) @size-cells property.
http://g33rt.be/migrated/Linux/PPC/root.html
http://g33rt.be/migrated/Linux/PPC/DeviceTree.html

No idea if any of them are still alive.

> So LGTM.

Indeed.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

