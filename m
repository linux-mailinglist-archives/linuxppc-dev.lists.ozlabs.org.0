Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1B4375E04
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 02:43:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbs9v4zPNz3c7Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 10:42:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Z5h06f2c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=oywf=kc=gmail.com=oohall@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Z5h06f2c; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbs8s17z1z3bxf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 10:42:04 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4Fbs8m71Jxz9sW1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 10:42:00 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Fbs8m6ld8z9sW7; Fri,  7 May 2021 10:42:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Z5h06f2c; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Fbs8m6GGYz9sW1
 for <linuxppc-dev@ozlabs.org>; Fri,  7 May 2021 10:42:00 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id c11so5419218qth.2
 for <linuxppc-dev@ozlabs.org>; Thu, 06 May 2021 17:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8HUE7PAIPnOALLusVDIGByaTeHyb/UFOK9tOUgvJeO8=;
 b=Z5h06f2c0hRp0AWrUr6ObkRhDTRLY7AMYMRb/1VtKZHsvUBj2iL4qc+p0oZ6gIL49k
 h9PqkQXh14q9KMhGNpNBXUAvSrXQhCRIsmJCCxAlsUkTx5HF0Iw63ZiRMKnGg5kqf/yc
 aobW+LFJ6XmQfedc4M5mSQPlQAIgUdPjZk8mUvmrKxN+9cmEG2ZYwFRVoVXDcLIuPQhq
 VJmMujpEaktEMn+RHmJpB+4AhN1NsCIf8f5u6QZ3Hlay/3+UJfxwHCP333wmDJRL3c6Q
 fDu0jmGZL3HibFTSAq/ORv33+ZN/WTKY3LXRux1R8X+h3ti5ddzTXbnFlQa/DiV6ZUqZ
 T9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8HUE7PAIPnOALLusVDIGByaTeHyb/UFOK9tOUgvJeO8=;
 b=sFwm+r/jNRN22N4wxydIla3ArKAZ1MPER6c0yFxKk7uHCXF4fb5jBhppMzJuPlO0Vz
 m5NtmryfIpnrDoPeDjTtlGg0Y1A93tW0WrmXh9d/IeCa/F07BzsxagOvG6AtjFysYtrO
 exQtkzEaRpHOsf9YaXfYzTC3OxCeIl0YA0Xlf/dXnV21Fvet9PQCBlLTpkOOjHv9HNEu
 OCrT0u7eoe3tBGsfsrM11224ERqZhHY/N5ay34WRKegHzYZ+ueUth0IIWiXKh+O/ARvS
 qZ4VbEqMp1PCErWTyFMNYHQIaaLbwBzNOFCGn7wIvofTI84farRDPwQ33JQWC+fw9vuo
 Camg==
X-Gm-Message-State: AOAM532rb9JZ0hgUnd7HSqcqjYPzz7C5jvGqU/JY7EjF0C3hK1Kwh0ow
 Gb7q5dOMwMNQrXlsxb5PVfs19QQj5xwITTncX1I=
X-Google-Smtp-Source: ABdhPJx69Xc5fMqyFEfh+CSkYpNtTtlFN3hea8y4ZQS4ixx9h5Ago8wc/KhS8wr70XG7VdqT2zsD2Z4G3QiOWmNlzhA=
X-Received: by 2002:ac8:6044:: with SMTP id k4mr7085390qtm.374.1620348117256; 
 Thu, 06 May 2021 17:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <162032297784.225551.1220900342102038880.stgit@jupiter>
In-Reply-To: <162032297784.225551.1220900342102038880.stgit@jupiter>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 7 May 2021 10:41:46 +1000
Message-ID: <CAOSf1CG4H2GrxV5C=55vcNue4taSAkgFOUg32yVspgw9+meDAg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/eeh: skip slot presence check when PE is
 temporarily unavailable.
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 7, 2021 at 3:43 AM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
>
> When certain PHB HW failure causes phyp to recover PHB, it marks the PE
> state as temporarily unavailable. In this case, per PAPR, rtas call
> ibm,read-slot-reset-state2 returns a PE state as temporarily unavailable(5)
> and OS has to wait until that recovery is complete. During this state the
> slot presence check 'get-sensor-state(dr-entity-sense)' returns as DR
> connector empty which leads to assumption that the device has been
> hot-removed. This results into no EEH recovery on this device and it stays
> in failed state forever.
>
> This patch fixes this issue by skipping slot presence check only if device
> PE state is temporarily unavailable(5).
>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---
> * snip*
>
>         /*
>          * It should be corner case that the parent PE has been
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> index 3eff6a4888e79..a0913768f33de 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -851,6 +851,17 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>                 return;
>         }
>
> +       /*
> +        * When PE's state is temporarily unavailable, the slot
> +        * presence check returns as DR connector empty.

That sounds like a bug in either RTAS or the hotplug slot driver (or
both). The presence check is there largely to filter out events that
we can guarantee are not recoverable (i.e. surprise hot-unplug). In
every other case (especially if we can't determine the state) we
should be going down the recovery path. If the hotplug slot driver is
incorrectly reporting the card has been removed then you should be
fixing the slot driver.

> +        * to assumption that the device is hot-removed and causes EEH
> +        * recovery to stop leaving the device in failed state forever.
> +        * Hence skip the slot presence check if PE's state is
> +        * temporarily unavailable and go down EEH recovery path.
> +        */
> +       if (pe->state & EEH_PE_TEMP_UNAVAIL)
> +               goto skip_slot_presence_check;

There's a time-of-check-vs-time-of-use error here. You're setting this
flag at the point of detection, but there can be a significant lag
time between when an EEH is initially detected and when it's handled
by the recovery thread (usually due to other events being recovered).
Transitioning the PE into and out of PE_TEMP_UNAVAILABLE is handled
autonomously by the hypervisor so by the time we get to recovery the
PE may be back into a normal state where the slot check works fine.
