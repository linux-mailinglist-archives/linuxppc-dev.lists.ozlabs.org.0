Return-Path: <linuxppc-dev+bounces-8418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8197AAEC29
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 21:27:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt4yy240Qz30QJ;
	Thu,  8 May 2025 05:27:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746623129;
	cv=none; b=cCGxOaeDgoXhxVp4+Zw/qsohyzkIF7qHfpbYV1Au7xWA4rYklwlOOhc3tKRyLGFBRWd+VNaM0rOqJj1OXGe/zx9yK4PzMV6Ny4Ov2goDlq/JxPk0CTPtHZfdpbFoyKopW61dd3gzMC27dOmB+ViypOiehUS2l2F4PEY6f+A1+NWTYiT13AyGlAlSBB2aUnpdHgDKuxNkz8AQlukDT12CbMoJZyAv4q2AODKRww3Ea0slZU4H6SUSDInV5PaPJsWHbihU5Pv/J2V1XxnwoKfYdgSkaIhu8WrEq/GKmV90dyIpS4RhvM0VeSE6JVGBN+K4cW4vxe2RHaLdXKH18NR2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746623129; c=relaxed/relaxed;
	bh=IjdASnf0P/3DHSY41RODYZYYITbHGHJgGhvIKy0pPT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xah0+EMaI4dZ/cM0sKfUVtfWVonEQLxDizbVybppx5gUS5QrMBDJCT7PHN6zr3cFbqkSkXY+l63rkhL3uKVc8i9diNfeePvP+AMp8Vuf6KLectljSLqi8u/+yktgv7nGWgGL+GTZsv9w9SQ9bptTXOzgvX/D8NwBt/oTx9FQlxgTU+BePmAMX9S9yFM+bgWwdDvBRl5qwZ12J4FaVWvhD4BA/TEDSeS01+Okug2jLEhy32mJ5gDNYNR2wtoVZA4vZ6okbq25+tBov2mbkaJrTrdOR3yLE0Dqv6CNEIiSpxgGt6XbS6lhp6JRYgBJRhaoRjL88mynxHSf2RadxzP7rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QWyegGz8; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=fdmanana@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QWyegGz8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=fdmanana@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZswVJ2YVcz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 23:05:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5031629D5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 13:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE44C4CEE7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746623125;
	bh=IjdASnf0P/3DHSY41RODYZYYITbHGHJgGhvIKy0pPT8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QWyegGz89X5jZ51rYT3wl2t/EpNI8TV6qPgqu7Ag4/hw0vZbgsCiOIWyNe5mS3taJ
	 Pk2UnR5APEzYRzN8jGZh9sHFKGAxD6W3xAZURMUWogNJOituz6E3DmInwVExbCyVGK
	 JGSrcuQbsou0jOMfVGMhkdrpU4QuGAnUnjfwkNfFi65ep/UVGNpie29T5E+sbto/H5
	 UXf5qG+IhHbOey9OQ39u4HcJ7YrRnQRYq5+PWUNNOJcKvngX0BByM7dey/ZUxDQ8nu
	 sEsv6tlsMTVe5h5Bn9Yy8OYJOz3YABNTyWNblvQ9PCCNH5k2qekivk7hv1OKgCvsY5
	 LwYCysIWz8/fg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so10557491a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 May 2025 06:05:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvJlkQiQf7kiHB7FZdL3BX2jcjEP0BzVWMN07rz/Sb45N6odHYJGpXcL2aZeHmIU2YxVpUbEeAyZxf7h4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx9MXPRQBJfvaMi50CkJzlv4UQz3tOl2sbXiU8/8md7rmHCo9K+
	0tYFYyrj6SY+yOm/FhLV0V51npmh2FoNOgP57lsAXjpyMmPXf3cSecN/pp5FMiFnm2sZ+RwLfOp
	PruZphLq5/2BPNUyjFAOiKGq8RpQ=
X-Google-Smtp-Source: AGHT+IEJ/CaibXN6mzdK18KZL+vw3DGBUuRON4oUk/6Aj/iyvTAHbQ9DWHAfTSecBW+anB4utFQiqDadOX46QXFdPQU=
X-Received: by 2002:a17:907:868f:b0:ad1:d063:f326 with SMTP id
 a640c23a62f3a-ad1e8c91302mr333121466b.29.1746623123820; Wed, 07 May 2025
 06:05:23 -0700 (PDT)
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
References: <0B1A34F5-2EEB-491E-9DD0-FC128B0D9E07@linux.ibm.com>
In-Reply-To: <0B1A34F5-2EEB-491E-9DD0-FC128B0D9E07@linux.ibm.com>
From: Filipe Manana <fdmanana@kernel.org>
Date: Wed, 7 May 2025 14:04:47 +0100
X-Gmail-Original-Message-ID: <CAL3q7H7PqVRnDuooSr6OhvUQ3G5V2gq6VEDpqTqNX9jHmq97aw@mail.gmail.com>
X-Gm-Features: ATxdqUHY_FiOpTMf6FgP45M2NeW-CWyjYlECDizMemJa-649cnX3uHFZ9HE6m_A
Message-ID: <CAL3q7H7PqVRnDuooSr6OhvUQ3G5V2gq6VEDpqTqNX9jHmq97aw@mail.gmail.com>
Subject: Re: [linux-next-20250320][btrfs] Kernel OOPs while running btrfs/108
To: Venkat <venkat88@linux.ibm.com>
Cc: quwenruo.btrfs@gmx.com, linux-btrfs@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	maddy@linux.ibm.com, ritesh.list@gmail.com, disgoel@linux.ibm.com, 
	David Sterba <dsterba@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 7, 2025 at 10:02=E2=80=AFAM Venkat <venkat88@linux.ibm.com> wro=
te:
>
> +Disha,
>
> Hello Qu,
>
> I still see this failure on next-20250505.
>
> May I know, when will this be fixed.

The two patches pointed out before by Qu are still being added to linux-nex=
t.
Qu reported this on the thread for the patches:

https://lore.kernel.org/linux-btrfs/0146825e-a1b1-4789-b4f5-a0894347babe@gm=
x.com/

There was no reply from the author and David added them again to
for-next/linux-next.

David, can you drop them out from for-next? Why are they being added
again when there were no changes since last time?



>
> Same traces are seen, while running other Tests also.
>
> Disha,
>
> Can you please share the details of Test and the traces.
>
> Regards,
> Venkat.
>

