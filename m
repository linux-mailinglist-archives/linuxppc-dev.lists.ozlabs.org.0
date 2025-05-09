Return-Path: <linuxppc-dev+bounces-8472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44872AB13A4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 14:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv7rs4vC9z3bgX;
	Fri,  9 May 2025 22:40:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746794445;
	cv=none; b=K5DXPqGC9cTPeP1mHP7XH8F3K1UzayJp4CZK84ziqxcXh5m2EF8hMsL4b67FKt3tP/fW5hmQzj/RjVNsHqlZodoavopM7Alj36QWcrOk1pmDZwq7V2680d6tHysW1gQ7r78Vsrzd9jFOp1vCNPM0jkdrVAulnJDvIhMtNhhg6oJnyKn6+QykCMBWkVNxYrxOVh643vSWFMex5l1zc7XjXL8KRuvClWqUnDDYXZSJ0U2vc7Z57CiZF/3T4EYgb++z4sh0BeeQfo0Buquysmycc13ruCsf9AtCg9tAn6B1APCZ1Ima3CeGITKDspvwNWA0wrEuRrzs9S8DhGYm02thSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746794445; c=relaxed/relaxed;
	bh=+UtFR7vubZW89xp2cp1g2Mh8plnjtSualam5Fk+kOWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVtUMtdfvtjAeO3vLzotmrXSe5X3NnAeuBWiz5i1GyIrL3xjbE/Usr9mqFL1MLNYzF73EX82RyCX3+AdVsIdpRH1oCzA4a7vWFZaE6i2TF/znx49UXVNeybz7S5E6SHE5eRA9CyK3f5I3o7Td6pJQJY04uq8eZnySKB3iEDv59w5QKQxR6GI8tVcm6swSMUDvKuXLMzt7g9847RuzJvIqWbU//lMeVZyyaTIO3RbVu7FOiiG++CjEC6K31Mtds0fpzYCYCpoOqflpFgOQkX8V7+Lz3q5+3YeF4dOAHDVdSqaj4D3NzQXQHKBJjgs91FJ9XlySd5kDSXdUfvV+OUzSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cLMK7ie2; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cLMK7ie2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv7rq4ccGz3bgV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 22:40:42 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54fc64e8419so1070282e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 May 2025 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746794438; x=1747399238; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UtFR7vubZW89xp2cp1g2Mh8plnjtSualam5Fk+kOWg=;
        b=cLMK7ie25x7Qb7+Eee2ARwgnqqzm84TRqXlH0ZfPFGQ09q9dmpgDamMFyTIDJaMTV6
         wZm+3vb5q0aIw/D9R2dxaNDGPFucJEjRpQz6O77Q+h0ZTKk2RGn56LDvIpFR9my2ZK7t
         zIISHUmNg2Ax0tZM9t6zOs0YpoHP+pbqkRP9K4VqFO+0t7uILosLtujZiDUGCcJfrahL
         bKW69aOELpSTiMLPaiLGy7nTBnEcjeDy9DSTy4ZxfJUgNVk0elzaV7H+D+3VOEJMgpEj
         9M7oRAI4VCHVl9B18uGCJXDtn9Wp1/NO8mdgey3Fq/cdciKWAY+XVhiYqsRjjRycskKE
         pE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794438; x=1747399238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UtFR7vubZW89xp2cp1g2Mh8plnjtSualam5Fk+kOWg=;
        b=AAnnTtjQ5FFt54FpO00Sb2cTZkbROlj8+Fk3trZktZwwnupdVVm4Wv7c189UkLsXES
         Meyyoa9ji+mg4z2BSyT5D37V6ES740CLmWtgaTBO/Oiq5UzkiRlbFj1LXZQHoRFKrcFm
         Zx89eWAsx+OhMleV6K79n5e0Jqh/nWSOW6X9HKLejCFjfUljOgz9QPQX/dK3GO60Qbb1
         M1jc4q4GU6hxdUUhwotFQdx33i0V0Q0Audz4SC/vLJU4xvLwi4qkt0Yxu1d4BRYZ8G/w
         QV+gC+XsozX5MG1jZaPM9R2IXc01aW+PWB8rfa5NXVKYS4C7g6OCtvcFJyUWGQ8BpR7N
         URhw==
X-Forwarded-Encrypted: i=1; AJvYcCX3VHYDgFtMOE9d9HKt34itJMZ5c0UwUMdJvH0g3W1vWfwFdsXo6l5FFcYE1vXita+20ZV4z0m3uvQMnXE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzYlCps5s+O9VckaO281cJVstoV//R7GnyOp3HRF6BAy8KVKkD4
	PayR6DjGZuoqDeVedNK2p/0dSSfPWyMUCm3ZCsn0p0MgQQviqTWylxPLPfHHSv/oS1uBOGUxhOL
	mAy9IoqSfYdY5BGij0O2mC5AO0LhGiPY97t0gFw==
X-Gm-Gg: ASbGnctOlHhXx0Re6PrEOYuGjZF3nxhSOHDGDdW+MmHY1R+I9DU/fs9UY7WM6G4RU2B
	oz5+hhhmUuaI3GZZyTryu7rwr2KnqrvwIUdqXi/qGhZPWd7R4kNkaytoXPpWlEaBcmYkxKxkorm
	w8JHTIjvLkU2FBvcyXwnC6h3Q5odKj4YuO1/uH88wxBBy+Cn0rrq64Og==
X-Google-Smtp-Source: AGHT+IFdaNoxSwXadZPcFSu3s1a5OECzl0nPHiRim09tz00SJAtaxjhMC0Ms7Db/M0w/VxGQVS1tNGzED+Wljh/WZKI=
X-Received: by 2002:a05:6512:695:b0:549:8b4d:bd47 with SMTP id
 2adb3069b0e04-54fbe407821mr2923115e87.9.1746794438053; Fri, 09 May 2025
 05:40:38 -0700 (PDT)
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
References: <20250508130612.82270-1-markus.burri@mt.com> <20250508130612.82270-5-markus.burri@mt.com>
In-Reply-To: <20250508130612.82270-5-markus.burri@mt.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 9 May 2025 14:40:26 +0200
X-Gm-Features: ATxdqUE7pXlfCMv5H1Kgd5pteF0BctNTVcpk-CgS0AiKblrCPf4IDIEcE-yR17c
Message-ID: <CAMRc=MeYYUc=FKJdArpqv0D2fUt1vyCJiZzjYyN95aMv0-b1WA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] gpio: fix potential out-of-bound write
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Nuno Sa <nuno.sa@analog.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 8, 2025 at 3:07=E2=80=AFPM Markus Burri <markus.burri@mt.com> w=
rote:
>
> Check that the input size does not exceed the buffer size.
> If a caller write more characters, count is truncated to the max availabl=
e
> space in "simple_write_to_buffer".
> Write a zero termination afterwards.
>
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---

Looks good and does fix an issue that can be easily reproduced with
KASAN enabled. Please fix the issues reported by the build bot and
resend (as a patch separate from the rest of this series). Thanks.

Bartosz

