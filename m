Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF62727343
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:44:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc3qD49cgz3dxZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 09:44:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iBoEHAOv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iBoEHAOv;
	dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc3pL59M5z2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 09:44:10 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-62884fa0e53so677116d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686181446; x=1688773446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+jSOn4aArekcx3+zLzXPOVm14+fmJKsE3biZ6If6cY=;
        b=iBoEHAOvZpF0XyN9RWJAGfMnlZ/EaWFGG0ooI7cWYmEc5IE99yqvy7MoXxG64cSomx
         gFc7ubGWOFVWFEAq61vsbRYZIVR61ELHfWXAO8PbyIO4r6voI0dgLweX4dyqBTb5HrC9
         YDi7LT2WEe7dc/AGwHXkAqqOBsbpMz7VZDXPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686181446; x=1688773446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+jSOn4aArekcx3+zLzXPOVm14+fmJKsE3biZ6If6cY=;
        b=Dkymc40SiN48rqwzMbUqBhOSXEp9IJYalI3xkrq+VdhEtI/dr4pBJvm4t1++yyfhT5
         z5+1wXYJg1BHzDsZJnvjXdnzERvAN0NqlwH0dy+/grxKgEYpwb2vNIFj6J9ueFEs/zOo
         +voVWXAC+yAKw/2qv3wCC1qa/dZn+bZzNuz0sqMTQUjp0e1n2fy7Q7j6ou2EPNeqX1nG
         rt7NJNOPj6ym4k8ag8zYjVKjqDU9j6yG5PYgC6FYzlSIl36IHcrq7p6DRSwRUbYN1jBu
         Hs+nEPdRaMy9WO2409KOgtZhUfZZJ0OAINKZFPymupOT/GbB7IsNrZ0BU8ehzDpKF2Oz
         zbgg==
X-Gm-Message-State: AC+VfDwKC7g888ISqb6/HCpqnlAx/k8EBGgHen7CHYcF2Derwnn1v6F+
	zIqK47OT+sBhg+R7ZbaOpCUwUSS0ogjRGV62XXw=
X-Google-Smtp-Source: ACHHUZ5E/PE+++D6HRhunz+wV7Ajm0hMU+ZoOO9jZHI5NhR1P0ruzXyc0+v5sIIoyiiULNhm1AOoWw==
X-Received: by 2002:ac8:5951:0:b0:3f4:f2db:8210 with SMTP id 17-20020ac85951000000b003f4f2db8210mr6088762qtz.32.1686181446161;
        Wed, 07 Jun 2023 16:44:06 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id r20-20020ac87ef4000000b003e64303bd2dsm274630qtc.63.2023.06.07.16.44.05
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 16:44:06 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-3f6c6320d4eso45031cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:44:05 -0700 (PDT)
X-Received: by 2002:a05:6e02:170c:b0:33c:a46c:23b3 with SMTP id
 u12-20020a056e02170c00b0033ca46c23b3mr99141ill.1.1686181022226; Wed, 07 Jun
 2023 16:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com> <20230607152432.5435-7-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-7-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:36:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-H9z20zT8Oop5+Hnf-S3QgiotzQ=f3LGvN6AiLUxi=Q@mail.gmail.com>
Message-ID: <CAD=FV=V-H9z20zT8Oop5+Hnf-S3QgiotzQ=f3LGvN6AiLUxi=Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] watchdog/sparc64: Define HARDLOCKUP_DETECTOR_SPARC64
To: Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Jun 7, 2023 at 8:26=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> The HAVE_ prefix means that the code could be enabled. Add another
> variable for HAVE_HARDLOCKUP_DETECTOR_SPARC64 without this prefix.
> It will be set when it should be built. It will make it compatible
> with the other hardlockup detectors.
>
> Before, it is far from obvious that the SPARC64 variant is actually used:
>
> $> make ARCH=3Dsparc64 defconfig
> $> grep HARDLOCKUP_DETECTOR .config
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64=3Dy
>
> After, it is more clear:
>
> $> make ARCH=3Dsparc64 defconfig
> $> grep HARDLOCKUP_DETECTOR .config
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64=3Dy
> CONFIG_HARDLOCKUP_DETECTOR_SPARC64=3Dy
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  arch/sparc/Kconfig.debug | 10 +++++++++-
>  include/linux/nmi.h      |  4 ++--
>  kernel/watchdog.c        |  2 +-
>  lib/Kconfig.debug        |  2 +-
>  4 files changed, 13 insertions(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
