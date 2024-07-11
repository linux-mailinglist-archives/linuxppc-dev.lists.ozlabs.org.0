Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4568992EFB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 21:35:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gfeAd7B9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKlLS0P90z3dJM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 05:35:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gfeAd7B9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKlKm5Sxkz3cSn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 05:34:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EDCBE61DFB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 19:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3950C32786
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 19:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720726473;
	bh=rnJzywkRCd7XYg6cYxCjuRelZYp4cgYOJOVs+8goLSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gfeAd7B9+JBajYo0b3kC14jh+kBmxbqv7bidZiOID7K9OyOKX3/klen3euzhliSy3
	 o+fD75Ud3ceLwxK6C5MeSrJSMC1rfZO/+BoZsn/jRj2ciMsTBy9ko2l1xrsZYI0nC1
	 6ZLpINUj8BR0DXDAvswDYTZ9Mv1+i3ooxYSs4HXuyyr5ofy9bqMbStDHtjthR9xmtR
	 2olcv1Y+BdkhLvDOPRyWQm4mNbUpDZtd/ZhqBD06npY1MKQidRItvI4EUNOPX5BB+B
	 a9CY37X5ShD3yXJUbYHlmWvj9AkluCGuQ1c5i/KQsEN9Hp7LNCkxERJXBW90girPlm
	 cRGcCXE+jv5Eg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so16729721fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 12:34:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrveyCLmOEq7V4Z5A8fjJ3aBqXp14ID57byx3KnwjgIUu2pJWX5QIYoQo1/zaOaAJx7HzfB1uR9kRu0L670NNDZ5hB9AQO+y5Ze/qfoQ==
X-Gm-Message-State: AOJu0Yz0ElotVzM9NIO1ASEjAqsrLJH7pB4cK1lS4llTbhhSAUOecaKR
	3ZWldZDWVg1yqx2SWk2JDNQ/66Ox3oVzwlkSO5+3jG1o5VhTmyecw6Zo1NKF6uOl9KypIUktSQf
	QR6myKBYeMDM0KIq3OtDoiuAWEQ==
X-Google-Smtp-Source: AGHT+IF5ZwMkOUD5v9f290dZ5bmhnW8djdgJItCBBjgdP3+Qoa8fkAROjJ85zlq/0+vFIpGpC/6yq3d5B3hrGWl1RlU=
X-Received: by 2002:a05:6512:2348:b0:52b:bee3:dcc6 with SMTP id
 2adb3069b0e04-52eb99d150fmr6767379e87.51.1720726471999; Thu, 11 Jul 2024
 12:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240703141634.2974589-1-amachhiw@linux.ibm.com>
 <CAL_JsqL9hg8Hze4oOP1R55yVXBfTKE=RfwdBraNHiO71K21uNA@mail.gmail.com> <qcidmczsjdhaqz7hy3cqnpkjiaulxi7277ayzly3zyrrdbcr4w@5s4x5cgd3xk2>
In-Reply-To: <qcidmczsjdhaqz7hy3cqnpkjiaulxi7277ayzly3zyrrdbcr4w@5s4x5cgd3xk2>
From: Rob Herring <robh@kernel.org>
Date: Thu, 11 Jul 2024 13:34:19 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Mojbw9AXPZmGbzDbW7Tj=6zhBWtSKKdqrVhR=AUnp_g@mail.gmail.com>
Message-ID: <CAL_Jsq+Mojbw9AXPZmGbzDbW7Tj=6zhBWtSKKdqrVhR=AUnp_g@mail.gmail.com>
Subject: Re: [PATCH] PCI: Fix crash during pci_dev hot-unplug on pseries KVM guest
To: Amit Machhiwal <amachhiw@linux.ibm.com>, kernel-team@lists.ubuntu.com
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

+Ubuntu kernel team

On Thu, Jul 11, 2024 at 8:21=E2=80=AFAM Amit Machhiwal <amachhiw@linux.ibm.=
com> wrote:
>
> Hi Rob,
>
> On 2024/07/11 06:20 AM, Rob Herring wrote:
> > On Wed, Jul 3, 2024 at 8:17=E2=80=AFAM Amit Machhiwal <amachhiw@linux.i=
bm.com> wrote:
> > >
> > > With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug seque=
nce
> > > of a PCI device attached to a PCI-bridge causes following kernel Oops=
 on
> > > a pseries KVM guest:
> >
> > Can I ask why you have this option on in the first place? Do you have
> > a use for it or it's just a case of distros turn on every kconfig
> > option.
>
> Yes, this option is turned on in Ubuntu's distro kernel config where the =
issue
> was originally reported, while Fedora is keeping this turned off.
>
>     root@ubuntu:~# cat /boot/config-6.8.0-38-generic | grep PCI_DYN
>     CONFIG_PCI_DYNAMIC_OF_NODES=3Dy

Ubuntu should turn off this option. For starters, it is not complete
to be usable. Eventually, it should get removed in favor of some TBD
runtime option.

(And we should fix the crash too)

Rob
