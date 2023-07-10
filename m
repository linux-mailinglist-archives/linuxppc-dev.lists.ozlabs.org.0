Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0174DB0A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 18:26:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=V8r9oUmN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R08XC66wKz3bwY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 02:26:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=V8r9oUmN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R08WL3QWSz2yxK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 02:25:49 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bd0a359ca35so4292694276.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 09:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689006346; x=1691598346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcUxYhRfSgJ6UJMmI4gvN/iDnQgX6gIvJpFELMHmLcE=;
        b=V8r9oUmNILl8gpI7KePWigjGb6juPhMnDQ/wrv4DQP5As/oXU9XrXK246f9ZHhlBJL
         NgW9whpWQvfU7c+x8gRKyIabFQLq8y1KB/91koW4cjzXCsMLGDiimO1rnhQ4A+SGtHR5
         0qPaQafXZZht0IpaBmneBm8MpeuLhudZwHH96ZviOLxHsfACKzldhpgZodjAA0l922q2
         pnlbiw/dn1xzxjuAiZWozy6KLAqPUfb7KpDVMBORNS1iEcJq7uIR6HeZQpCMJbhktMq6
         tW+actNpC+n4lGbQUGm2PT9us1+XZ/aHXZ8LEEsgbXOFg1elQLdqT5ptELvD1jDfTUxq
         L3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689006346; x=1691598346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcUxYhRfSgJ6UJMmI4gvN/iDnQgX6gIvJpFELMHmLcE=;
        b=FEt4ZqOXaNyS/19ktuKDDDR6Wq6GK86obRMoEiO6o0sHmd6I4Jq+fE4YSS/nzZy1He
         NAUGnl9uci1K0xt9ndgw56ZPio9Xugno4DcrkDqb3+rMRppCHvzRRztkWiSC6B9ECxHT
         wW0qCrDPkCZOWufHcoz2nTWWqzTTH1mKh4VB9yUZzCBZtayu5/Qs9QfyOt6MKUmZKUmu
         W2NjfyroEPmw3fKGRW9OmdT7wK3S+osqWMpNItmn4cE4UoX1guu8nGrbAZz3Hm6koJvI
         5gEJbK6ZYKrAznAAq15a9HjOihltlDGkDtskGJamtNoMmT4q2rfbE3O6t3giHZtHwtst
         VKrQ==
X-Gm-Message-State: ABy/qLZXDCXB58nIjQtwAeMs6kKQTTZ2c6bnLjbeQ+hHut8p8VOjWCSS
	RjHqoPr51Vnrs7Y1w0SOwKoeHn8Fjuto4Xeka4E=
X-Google-Smtp-Source: APBJJlE/krGaema6oAIGHffoO9jr9rNxV2NJ9f2ty64/UeXp1MrrtGwo2Rtyks4ROqL/F/KxuN96NsyBfRrrBujlbXI=
X-Received: by 2002:a25:c0c8:0:b0:c86:55c7:d053 with SMTP id
 c191-20020a25c0c8000000b00c8655c7d053mr2292204ybf.25.1689006345894; Mon, 10
 Jul 2023 09:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de> <20230710130113.14563-10-tzimmermann@suse.de>
 <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com> <733273ad-89e1-d952-37ee-bb75c3ab8188@suse.de>
In-Reply-To: <733273ad-89e1-d952-37ee-bb75c3ab8188@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Jul 2023 18:25:34 +0200
Message-ID: <CANiq72kPh2KE=ADUxhPyyr7noWhC0fkzmDu8EBn_20focnZqtw@mail.gmail.com>
Subject: Re: [PATCH 09/17] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>, deller@gmx.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, javierm@redhat.com, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 10, 2023 at 5:22=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> I'll append a patch to the series that documents this.
>
> Sure.

Thanks!

If you are planning to take it into some other tree:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I can take it into the `auxdisplay` tree.

Cheers,
Miguel
