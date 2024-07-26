Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938693D7D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 19:53:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VAQh8Rs8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVwNN1zPWz3dSl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 03:53:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VAQh8Rs8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVwMh4Gxyz3dKF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 03:53:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F95BCE183D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 17:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5624EC4AF10
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722016381;
	bh=gbriWgUniQV5sMUGUpc7uG99BGb3pVKbc+1MWsqJxl0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VAQh8Rs86BVc0bQxBQpsw7E3oB7YUvEzDioyvNYyYRWg3/YE7BJZ9Bb5yeZktWUpE
	 1jI2lNv0JjHBTeMrqFoOx4732CF0GlVQ8ls/qKpBs5EaMagA0+TzO3hURk91b+c2nJ
	 GYh/ZaOkeTJ/Ehvehu29zHCbM1rfeyyShv0iZfQnHzViqUZtSQh7WwhFsgBPAwKaaR
	 nXKjVlm1GJwtqXN4zJMB6FcsT14q3jUJG4IAHR0gTYtnyeAzTexMgGLCGw3OqNya4Y
	 gHCfIMUscJ9mctMB6SDLSpL1yVxgIEmLbOAyZax3r6DQVedli9R+6goBy+Yf/JOwlD
	 YhO2AP739onfg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so21183071fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 10:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWD7gjTawDxLlmF2qL8pdH9OhALRsqMQTXdnKYKtjiOJ1CCpFPFzvfa2EPiskVhjZNrpJtkh3oC81OhLXwugHPTFMV3KuL6eUCEDTF3BQ==
X-Gm-Message-State: AOJu0YxmR9PRhBTMrvHV+J+CLbvyiIZxmO0GmIte9Kagsdki2VvVvt98
	tplHY8Nw4+h6BJSdZcA5eyJnp2TI1dEMCCMUj3oK4SiUiXY9rTlKezbY3ZLgcxxAzmVjC2WLgF/
	PD43gI9USjPgeSi0/ERfUKOuzCg==
X-Google-Smtp-Source: AGHT+IGIboFhjpqofVqlOelOMvR4+RrtFqzfu/57gAtHLJz3rx7lzmCVwhoRpixh1COmKEuQcel3sDSsZgJ8oYzdKa4=
X-Received: by 2002:a05:651c:a09:b0:2ef:2d54:f590 with SMTP id
 38308e7fff4ca-2f12ee278bamr4650001fa.24.1722016379634; Fri, 26 Jul 2024
 10:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240715080726.2496198-1-amachhiw@linux.ibm.com>
 <CAL_JsqKKkcXDJ2nz98WNCvsSFzzc3dVXVnxMCntFXsCP=MeKsA@mail.gmail.com>
 <a6c92c73-13fb-8e9c-29de-1437654c3880@amd.com> <20240723162107.GA501469-robh@kernel.org>
 <a8d2e310-9446-6cfa-fe00-4ef83cdb6590@amd.com> <CAL_JsqJjhaLFm9jiswJTfi4yZFYGKJUdC+HV662RLWEkJjxACw@mail.gmail.com>
 <ac3aeec4-70fc-cd9e-498c-acab0b218d9b@amd.com> <p6cs4fxzistpyqkc5bv2sb76inrw7fterocdcu3snnyjpqydbr@thxna6v2umrl>
 <d20b78cd-ed34-3e5a-0176-c20ee5afd0db@amd.com>
In-Reply-To: <d20b78cd-ed34-3e5a-0176-c20ee5afd0db@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Jul 2024 12:52:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJAuVexFAz6gWWuTtX1Go-FnHe6vJapv0znHBERSCtv+Q@mail.gmail.com>
Message-ID: <CAL_JsqJAuVexFAz6gWWuTtX1Go-FnHe6vJapv0znHBERSCtv+Q@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
To: Lizhi Hou <lizhi.hou@amd.com>
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lukas Wunner <lukas@wunner.de>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2024 at 6:06=E2=80=AFPM Lizhi Hou <lizhi.hou@amd.com> wrote=
:
>
> Hi Amit,
>
>
> I try to follow the option which add a OF flag. If Rob is ok with this,
> I would suggest to use it instead of V1 patch
>
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index dda6092e6d3a..a401ed0463d9 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -382,6 +382,11 @@ void of_node_release(struct kobject *kobj)
>                                 __func__, node);
>          }
>
> +       if (of_node_check_flag(node, OF_CREATED_WITH_CSET)) {
> +               of_changeset_revert(node->data);
> +               of_changeset_destroy(node->data);
> +       }

What happens if multiple nodes are created in the changeset?

> +
>          if (node->child)
>                  pr_err("ERROR: %s() unexpected children for %pOF/%s\n",
>                          __func__, node->parent, node->full_name);
> @@ -507,6 +512,7 @@ struct device_node *of_changeset_create_node(struct
> of_changeset *ocs,
>          np =3D __of_node_dup(NULL, full_name);
>          if (!np)
>                  return NULL;
> +       of_node_set_flag(np, OF_CREATED_WITH_CSET);

This should be set where the data ptr is set.

Rob
