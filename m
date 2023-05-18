Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1966707A18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 08:12:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMKQG5Lgbz3fG6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 16:12:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LZxmYM7f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LZxmYM7f;
	dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMKPP1cWnz3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 16:11:52 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-3f38824a025so141321cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684390308; x=1686982308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIcLsEqKC+yr+YYE2WjsmqsRDHb0wRTZZ7t3w6tiqfo=;
        b=LZxmYM7f0rgzPxounlXLCt81a6InSzR6KuPfTwwlb/TPNCmiRHT1MuwkMDodH7wj/N
         hSZ71XdZVDPjJFvE5OKIxlJeNzgEoBWTBgb7gbZJafHJ8tpKpblfW8kUlh3YJ2/L1V2V
         JXunIqKl9p08LIgiEjSc87nYP3fvd3axMq4Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684390308; x=1686982308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIcLsEqKC+yr+YYE2WjsmqsRDHb0wRTZZ7t3w6tiqfo=;
        b=IEUmIp6daZLZ2Wq0eKWd/nSKp0YI97BdkbyAAMux+BnCICPVno8jhLKDsmn+u7sKnx
         +Zn5MyvCgX2YUejG2pztmvWNAMUkQEmREdU5SjFU4kLXlrncRZbgQtd43vlBrRy/G1ok
         ER2H/h5G6VjWSfReeNJrTvuDgt3NTanTlZt8juc7NrQk+DMJapDQyCia94j4A3Z4E0c0
         /IpvgATQK51qEUHuZt967k8qjfWL2dU5N7PCp6pbgSaJqqazX7UkRiDdOUaVUuL/gMZv
         TZ6RZSIvHMQyKN7FxFloKp8hRGioCzWuQQqYCMxmh58J/hOkkR4+fgXGGHpP8B84u6/S
         TFug==
X-Gm-Message-State: AC+VfDwnEfvB543nXAlpbhvmits3a8q/R3HsUXZVAfIAHsFMwQs7MDX9
	yduoRrwIanTWVZdJ2DBAk6OIasCi6LKnjljf20qplA==
X-Google-Smtp-Source: ACHHUZ7UcZ1YOkuaZFJDDRz7vpEArSW4FiyaB16wFsse5hJMzhWmGaUgqnEaO3WqQFo5JI+GGQCnACL2Sh3EitrLRkk=
X-Received: by 2002:a05:622a:14ca:b0:3ef:343b:fe7e with SMTP id
 u10-20020a05622a14ca00b003ef343bfe7emr248479qtx.2.1684390308438; Wed, 17 May
 2023 23:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <CANEJEGvKRVGLYPmD3kujg6veq5KR7J+rAu6ni92wUz72KGtyBA@mail.gmail.com>
 <20230407194645.GA3814486@bhelgaas>
In-Reply-To: <20230407194645.GA3814486@bhelgaas>
From: Grant Grundler <grundler@chromium.org>
Date: Wed, 17 May 2023 23:11:37 -0700
Message-ID: <CANEJEGscz3F-6cZcp7dBVekpxHMNXZWgUW2ic3xd6hm3xWH6ZQ@mail.gmail.com>
Subject: Re: [PATCHv2 pci-next 2/2] PCI/AER: Rate limit the reporting of the
 correctable errors
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 7, 2023 at 12:46=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
...
> But I don't think we need output in a single step; we just need a
> single instance of ratelimit_state (or one for CPER path and another
> for native AER path), and that can control all the output for a single
> error.  E.g., print_hmi_event_info() looks like this:
>
>   static void print_hmi_event_info(...)
>   {
>     static DEFINE_RATELIMIT_STATE(rs, ...);
>
>     if (__ratelimit(&rs)) {
>       printk("%s%s Hypervisor Maintenance interrupt ...");
>       printk("%s Error detail: %s\n", ...);
>       printk("%s      HMER: %016llx\n", ...);
>     }
>   }
>
> I think it's nice that the struct ratelimit_state is explicit and
> there's no danger of breaking it when adding another printk later.

Since the output is spread across at least two functions, I think your
proposal is a better solution.

I'm not happy with the patch series I sent in my previous reply as an
attachment. It's only marginally better than the original code.

I need another day or two to see if I can implement your proposal correctly=
.

cheers,
grant
