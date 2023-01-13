Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0446F6688A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 01:47:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtN6L6gClz3fCp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 11:47:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JoBSiJ5W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JoBSiJ5W;
	dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtN5R28RBz3c8C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 11:46:17 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id h21so17821583qta.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 16:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2NTaM5u/ATlZU8U3e3WvV5gfzoNU+qW6R9htWny5BOo=;
        b=JoBSiJ5WmBrGf5rLKSnrJyBODh9urLGI6Wrozq8w13amzHGmJLCIBNjhwil1+JiTd9
         Mifocp28Xk6jGJoTQZeb8EdPYmi8ZC+hx7nuzLHDp0CiWD5gj+YUNdZGTpd/M7iDknuI
         +Q5T0QzxFSIXFcGfNIeJ/Er3TJJvFiw09OuR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NTaM5u/ATlZU8U3e3WvV5gfzoNU+qW6R9htWny5BOo=;
        b=AqqGJBeM6DKUV3AvH9dSEWX2MQ/102yQbvq0pSfWCYJ1t0StKofgZG3V3Mp0hUNBGx
         6OJd0uBFK4qPjrheJJN0Hua1iitmAqLUVuV9c66PbNaba/EPrgtLACJ+aIq4RcKXGcdZ
         q9qWm4xmLC3D30gMLwAjIH1Q082Bk+X66wsE6LNkJs/cATa8ROWHMcuZvgIqtwRnML12
         Hy/e8ilwEOuyYltCezLjqWt8KuQlqIIWOPhqeCGoAcraHFecRzvF3dOIUeATwnAZbD+4
         OpIQEcRz4D43eGcsXz/XMezQKSwTAQGHBRVM8wKCiLZ5+I6HUV+ULqNxCLQT9wvE87yJ
         HSGQ==
X-Gm-Message-State: AFqh2krYYpeHvJsCDYaRr8N7YgSqBFRJKdx3XdPTgg/Xf4EMX3pvpDDv
	EvbwlrDezaeLyEl0rep17SJN3y1sqPRNQ+y6taE=
X-Google-Smtp-Source: AMrXdXvWbmfqbhgFpPcEhBY3BEYY6FKei2OkTTtETPOHDajqxSy6Z5c0OaCgoxMMK33F1tSXYg+tjg==
X-Received: by 2002:a05:622a:1750:b0:3ad:d7a6:76d8 with SMTP id l16-20020a05622a175000b003add7a676d8mr29126101qtk.38.1673570772413;
        Thu, 12 Jan 2023 16:46:12 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id d5-20020ac851c5000000b003afbf704c7csm4187069qtn.24.2023.01.12.16.46.11
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 16:46:11 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id p17so13868621qvn.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 16:46:11 -0800 (PST)
X-Received: by 2002:a0c:f38d:0:b0:534:252f:b091 with SMTP id
 i13-20020a0cf38d000000b00534252fb091mr369358qvk.130.1673570771350; Thu, 12
 Jan 2023 16:46:11 -0800 (PST)
MIME-Version: 1.0
References: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
 <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com> <SJ1PR11MB6083368BCA43E5B0D2822FD3FCC29@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083368BCA43E5B0D2822FD3FCC29@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Jan 2023 18:45:55 -0600
X-Gmail-Original-Message-ID: <CAHk-=wg6opc5nb1qMuCO-R36Pfz_JJbx1DsU1P0cvLAeM2+eLQ@mail.gmail.com>
Message-ID: <CAHk-=wg6opc5nb1qMuCO-R36Pfz_JJbx1DsU1P0cvLAeM2+eLQ@mail.gmail.com>
Subject: Re: lockref scalability on x86-64 vs cpu_relax
To: "Luck, Tony" <tony.luck@intel.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Jan Glauber <jan.glauber@gmail.com>, Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 12, 2023 at 6:31 PM Luck, Tony <tony.luck@intel.com> wrote:
>
> There's not much "simultaneous" in the SMT on ia64.

Oh, I forgot about the whole SoEMT fiasco.

Yeah, that might make ia64 act a bit differently here.

But I don't think anybody cares any more, so I don't think that merits
making this a per-architecture choice.

The s390 people hated cpu_relax() here, but for them it was really
because it was bad *everywhere*, and they just made it a no-op (see
commit 22b6430d3665 "locking/core, s390: Make cpu_relax() a barrier
again"). There had been a (failed) attempt at "cpu_relax_lowlatency()"
for the s390 issues.

                  Linus
