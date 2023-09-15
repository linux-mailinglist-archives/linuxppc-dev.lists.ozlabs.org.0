Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E07A21EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 17:07:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kFDvk+M5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnHcD3zRKz3dHL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 01:07:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kFDvk+M5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=timur@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnHbK6j1Fz3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 01:06:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 3540BCE29A0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 15:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750F4C433C9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694790408;
	bh=IQ4jNnb8O59E3cdlKNIHXXCnhjQ3SLQvaH2x8wn4EKA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kFDvk+M5XPChCC0bsDB28I+oa6wrT8Irzf80KeRAm/Xl+6opjFbtjN8N6FJd5jrIK
	 PK8g5R+xbX9SkaBvmTbeGIpxnqQ4rzWmipFvVKR6GD9esa+SAIcGzMBMv7zL1ADHAX
	 ZwUrVOfAaHxTxccBm0VN5X1b5E594AK9CyN9cdfmEtB8R3VCDA9IYvaM6Rl5vFb5IS
	 9ts8OwOzsS3S2N08jWIcy/4qS/k9lrxCjukgutbO6Q8b8CNaTjtc/ShIr7vgOcTL5n
	 SYnzT4qWze+BMcrptcYE3qepQu4fQaKCwwYqZO/SX9o/xRysxF9wx/f4B+e015/xEv
	 E8vNpY/niCj5Q==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9ad810be221so290471866b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 08:06:48 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz2f2TojNaUWONu35pa9+r0iE5uKhInbg19fDFslIMgEPYmrW4n
	Hdo/4FHkk/jLamviD6nM3wYSLsMbKimY0WUyFbk=
X-Google-Smtp-Source: AGHT+IEkpvL8z9mod1wRru0al+0HgtxhmY/i66NFpzanejWLMwonmLjSDsnChchGQ87ISgJ662MIgIUOXG6g3QhoMKc=
X-Received: by 2002:a17:906:105c:b0:9a3:c4f4:12de with SMTP id
 j28-20020a170906105c00b009a3c4f412demr1601827ejj.37.1694790406842; Fri, 15
 Sep 2023 08:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230914183831.587273-1-john.ogness@linutronix.de> <20230914183831.587273-73-john.ogness@linutronix.de>
In-Reply-To: <20230914183831.587273-73-john.ogness@linutronix.de>
From: Timur Tabi <timur@kernel.org>
Date: Fri, 15 Sep 2023 10:06:10 -0500
X-Gmail-Original-Message-ID: <CAOZdJXVRXwsq2c5dTbHJCYojU=_Ck6=VOtmyKXPP3TzTQs8MiA@mail.gmail.com>
Message-ID: <CAOZdJXVRXwsq2c5dTbHJCYojU=_Ck6=VOtmyKXPP3TzTQs8MiA@mail.gmail.com>
Subject: Re: [PATCH tty v1 72/74] serial: ucc_uart: Use port lock wrappers
To: John Ogness <john.ogness@linutronix.de>
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
Cc: Petr Mladek <pmladek@suse.com>, Timur Tabi <timur@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 14, 2023 at 1:39=E2=80=AFPM John Ogness <john.ogness@linutronix=
.de> wrote:

> Converted with coccinelle. No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/tty/serial/ucc_uart.c | 4 ++--

Acked-by: Timur Tabi <timur@kernel.org>
