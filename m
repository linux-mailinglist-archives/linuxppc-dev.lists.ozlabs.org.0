Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635B77BD45
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 17:41:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=l+cCvhAB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPdsf5glSz3cKc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 01:41:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=l+cCvhAB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=grundler@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPdrl2FXFz30f4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 01:40:22 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-40a47e8e38dso406861cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 08:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692027618; x=1692632418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dLgm844GB6Z3fMbxyoE9eaBHbokNuf66/HVIlaX7MM=;
        b=l+cCvhAB9wOLXvKNN1PPOKmB4IOF9ISPjTYdgNK1gPENn3ARa+QjY3NGulY8JEqZWB
         ti6JsTRa2BVhDdsNmXcMqRrXZvV7ZHQnfUdmgWy2fPU10hIUz8VpfUfq7Ezxjwuy6iZW
         qvDga0XHQiklD2L8nSSrqRSidJke0G5GtxABM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692027618; x=1692632418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dLgm844GB6Z3fMbxyoE9eaBHbokNuf66/HVIlaX7MM=;
        b=ZbD3xXVpkqNWC+4GfLWUqAzzsehRldfriIxHCYDI3i7MuDnJ4KgaDthXbvVKsf20PI
         5PZzCv+AoS3SUGAo3f5jc0bqhtpjRLWJdIHa7BT3f6mMUQWZS/1jtAT6A2tdTkMbaU6T
         WNfAcwVQtwahn07GqdTLrYyj1VLdVtvC50H23OrmoA9p1lYfTAdSjAeEQvl7kErFURNc
         EFY/spP6ZHz+h51hynFroEM2wG1jWd4PyK8k25dvkOTJ1LGNRW+jmIIXsW2nlOidPmDY
         dJy4sO4WpmKOFNcedxNbMt1Hp0L+nDb5DIfLUMGCgJvj3s/zdq+cJ9DWlzoevEQIJOvn
         w5DQ==
X-Gm-Message-State: AOJu0YwkYowSUF8KpG9BZWOKhxcu41Y+Qywj6bD4n5LHshPZHcoNdE8Y
	QE+TNoCqdc1MAkaK/8MS2BteSXjM7fG6uz45mmiAvA==
X-Google-Smtp-Source: AGHT+IEgKSIl2LLAEhDVdA1r7ugEIxS2NS6kEgSE2VqUH4qw73YE2OrO5yXybxuZ1jkiYNr+8vQAJw08v4XNzTCFNP8=
X-Received: by 2002:a05:622a:c1:b0:410:4c49:1aeb with SMTP id
 p1-20020a05622a00c100b004104c491aebmr170281qtw.7.1692027617881; Mon, 14 Aug
 2023 08:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230606035442.2886343-1-grundler@chromium.org> <4fa1e0fe-eec4-4e5c-8acd-274a039c048a@ixit.cz>
In-Reply-To: <4fa1e0fe-eec4-4e5c-8acd-274a039c048a@ixit.cz>
From: Grant Grundler <grundler@chromium.org>
Date: Mon, 14 Aug 2023 08:40:06 -0700
Message-ID: <CANEJEGt-6+AGGSdZb9OTv3UrBn1fFFqk=A6TdYjBsq4SqTTxsA@mail.gmail.com>
Subject: Re: [PATCHv3 pci-next 1/2] PCI/AER: correctable error message as KERN_INFO
To: 20230606035442.2886343-1-grundler@chromium.org
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
Cc: rajatja@chromium.org, rajat.khandelwal@linux.intel.com, grundler@chromium.org, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 12, 2023 at 5:45=E2=80=AFPM David Heidelberg <david@ixit.cz> wr=
ote:
>
> Tested-by: David Heidelberg <david@ixit.cz>

Thanks David!

> For PATCH v4 please fix the typo reported by the bot :)

Sorry - I'll do that today.

> Seeing messages as
>
> __aer_print_error: 72 callbacks suppressed
>
> but it still prints many errors on my laptop. Anyway, the log is less
> filled with this patch, so great!

Awesome! That's what I'm hoping for. :)

cheers,
grant

>
>
> Thank you
> David
>
> --
> David Heidelberg
> Certified Linux Magician
>
