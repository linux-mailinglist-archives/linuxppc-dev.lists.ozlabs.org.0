Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB0892E830
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 14:21:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=txXmhDxB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKYkN6hmSz3cWP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 22:21:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=txXmhDxB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKYjg4RBlz30TB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 22:21:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5093261D15
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 12:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041B3C4AF0A
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720700468;
	bh=+52FPB3c3wjL8TK+FFddWZnDSoZX6pDi9JJHJg3PmM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=txXmhDxBnfB4WsObEh60Wz/HWAhiv1UHOL9xVuJr5eJMo6eNntbRTubtEOmYtvAx5
	 MZPSR8dWBtmqFhf/K9vhx/CAjVBSkqvW/yMec4ZXSiovpKm9iZwIXnVo/A+hcK/ueC
	 QLXMkKKo9REZvYCxxY4AJF8TiqS8svW0fqjJpne9iXzkcbjAcDG2MqYPXfPu8UGlf0
	 Np1k2LljjwfxHRgRINTVDyRQdXs9E//KUa6PehdBrAjVT/XTrMz9FePL9xArOO3Yzw
	 GdQNHM6lg9H6XjtaCjl4UzispM9UAimG91ccNKrxAgZqgrZdeCgNXxJU5Z9Aymv03z
	 p89mraxfXKTeg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52eafec1e84so1185859e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 05:21:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZj/9c/e3OTTaxV1nkwZ02MRVTY/0b5DdZXdGlHyeqPZv7d2GuIlqUVTleHgK6QSpbYxU0bEaSbsjXgQXLBaIZ9nYEWJpn9YwtAbCYmA==
X-Gm-Message-State: AOJu0YyG/q/3d8XKuEByL5k3Al9Hu8VOZs0OlpCRuQAPgm5EHqaKWwpm
	LB20xy17cPayUV/yuq1AwzdTyTz81rhHXVC/ddKYOtQqCegeAiwqHIt1FtWtXkGIAP/1jU0Mg9q
	s5TjT+5z6WDMix7//OpJdmReiuw==
X-Google-Smtp-Source: AGHT+IFq48139LTNoH/EhDszKQ0cYnElGlN8CYXm4ZkgPD7yDdzVEKydnwQDyrr05M9kqxOePrrTaeMoYkQOQDIYnOY=
X-Received: by 2002:a05:6512:401a:b0:52e:9423:867f with SMTP id
 2adb3069b0e04-52eb99a137bmr6375363e87.36.1720700466351; Thu, 11 Jul 2024
 05:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240703141634.2974589-1-amachhiw@linux.ibm.com>
In-Reply-To: <20240703141634.2974589-1-amachhiw@linux.ibm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 11 Jul 2024 06:20:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL9hg8Hze4oOP1R55yVXBfTKE=RfwdBraNHiO71K21uNA@mail.gmail.com>
Message-ID: <CAL_JsqL9hg8Hze4oOP1R55yVXBfTKE=RfwdBraNHiO71K21uNA@mail.gmail.com>
Subject: Re: [PATCH] PCI: Fix crash during pci_dev hot-unplug on pseries KVM guest
To: Amit Machhiwal <amachhiw@linux.ibm.com>
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
Cc: Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lizhi Hou <lizhi.hou@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 3, 2024 at 8:17=E2=80=AFAM Amit Machhiwal <amachhiw@linux.ibm.c=
om> wrote:
>
> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
> of a PCI device attached to a PCI-bridge causes following kernel Oops on
> a pseries KVM guest:

Can I ask why you have this option on in the first place? Do you have
a use for it or it's just a case of distros turn on every kconfig
option.

Rob
