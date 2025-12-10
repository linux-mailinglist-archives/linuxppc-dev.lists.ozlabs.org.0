Return-Path: <linuxppc-dev+bounces-14712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD4CCB2225
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Dec 2025 08:02:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dR6902m12z2yFQ;
	Wed, 10 Dec 2025 18:02:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.219 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765350132;
	cv=pass; b=KKY50RBO/AevFiN80hEVrPg3dsJrREUNiApAuJ/AAYDU+IfelIIECSQ08oxYc1VnnV9394kBi4ad+vY35xMFT7ed3SVpZwQgjeyw23WCI6q2fYUkzkqbKBsXAijLsYtHetTCzND9NXK/vNT4nm/s8V6BP7RHJwQ4Wk2B45irotdG6BW5a3vXKPjfavIsEwgldjKEcaPkey5JXvJlPrVkI4vIhHXLos13rssMTeQTqsuE2dmXtqkmK6jbiIJ9/z+DIwBXq5SX7QNdrwAzpOAXMxEl5TaiOQTFKbB8qZKxbMukm6fJfZUqqMwiznq9Mf5siLlgvIBq8NGSfxrUyGa+ug==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765350132; c=relaxed/relaxed;
	bh=Mwf4D3Fq840bhyEBY4riGBn7KOPTk+Qetq8+W5eIbps=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=I/8udV5060Ug9LJA2gGr8ynz76UVKEPfUwpwMIQRZL8bJbcuBMcD9QYFVfZGJ7+5l25mDcoaurrl579KpblJwJOcY4mv8iwxVuGfg2znm30EDcD3YRiRl4l0JR2GHXpedBj2qN5PV2eze6Ao1BR0CX4lq65P437or9O3zmducDrQpSQs0NPf6mutS/QyUjHV9Ml/TlUhcwPg7fdMwgzCKzNnGPZk5EKs6dsiHi0/LB4a+bMh9sQlei7d1HIX97Ze7k/R4XBUA+grTfPxdGh0yL6omXFdaY4OdTJfMm0ozwvhKi7kX0DW4yrq8oM+zk6ztMnMGBPCbx46U0NyP4bnJQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Mtha7Tqc; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=b8EL0jmg; dkim-atps=neutral; spf=pass (client-ip=81.169.146.219; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Mtha7Tqc;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=b8EL0jmg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.219; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dR68s2L0bz2y7c
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 18:02:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1765350109; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XRJQN6FFG1Qev9jLV059gOueOksOlvke6R42sWB49m5ZkGrypeQQw9u50gwILAxbjh
    q83IEqOq7YhmVrvJ8mwvDCOwX2+7wFRU6xSzffGQ22JtKpOr7Ezd3ON/pgDxyOkraiQC
    GqOgB7KCOtlms2WpzOZ8OX7XTuK8i70eJDompRIq056gROwfRPZxXDegCad1zLAQFbOz
    5WJoqrA/ftPeNv7EzKzk6ozCOTpWI/pFlcuXgb0ovjNGZkoVX1VGZgVNirrmYWKaxOL0
    uLimpKcQeV1t2RlOnahPsJSPi48xQ4W5ix+jSf8PpaMIZwcRY4aMmQNAbbTitixedchk
    Ot5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1765350109;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Mwf4D3Fq840bhyEBY4riGBn7KOPTk+Qetq8+W5eIbps=;
    b=BCxgCZ7Ug3LKFZi6lmYmVZEG7B7HU8DclptrXOT3pmvaMoBwv59CmfzlflYN26fHK3
    Rl09Tqr0rCjT3ojzU8ZSh1wGUArQfMhUM/z9g9s1v3UDyZh0ZZKrfvzqBY38Lb4Ba5XK
    1rg7iW1dFfev3tHwJMf82bMeB8u/dOlhtVXi85YMyaDjVGeuBITecUKk1Det7r04DVZW
    6CFG6660E2H1YxNbSTIL+slMJ2BALACagm6NDD9qIC98Oieq6EbFTKruTFe8AQb+5pLw
    AmT4nBOdY3Q93hz+5T6pQ/RFSNdflL/XwQhgLWkWmlVrL8gHMyTQw/y+iJ68zciEiHju
    Aebw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765350109;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Mwf4D3Fq840bhyEBY4riGBn7KOPTk+Qetq8+W5eIbps=;
    b=Mtha7TqchkPpe9rFhDgk8UKvxNVb7EOriKdTbqXQRoJ0hyd357e2WB4dsu1cwB0i6U
    L5EvdgQTcAwVOcOfFwXmL8ODmRkJhtkG2eVAA9i7dTJVzlFpF0f2Vv4EqMpfRflppAbj
    RaJF83RuvzWpLo+v4mHpIOa9tR2KfF2WJK6drtFgXrg7McReA/Br0+vtuvnMk56yO7Wj
    e3m7LZLVwDUZYCfov7AyClfAeu6GovUCqYotR+bHINisUELL4lt8sTh0sOK3AX/bhJ8y
    sSJdmqTN6rVA42LXfc2qLh0Yqdyv2+C23JYyIX/tZ4DRbaxQaLwzoKGNsNnHXlrGg1N9
    ARSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765350109;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Mwf4D3Fq840bhyEBY4riGBn7KOPTk+Qetq8+W5eIbps=;
    b=b8EL0jmg/eeEbaHLcJGnWd10QKee02qKzPyq1ev6qtosV5WGL4HgFfRF0eJhR8s4HB
    ivbNYyqKeU81i6+3dVBw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mys32XCHulOMyhh2V+cjE2tdCVbFyp+vTs"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 54.0.0 AUTH)
    with ESMTPSA id ed69d81BA71nJ85
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 10 Dec 2025 08:01:49 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
Date: Wed, 10 Dec 2025 08:01:38 +0100
Message-Id: <13B0A253-0AED-4B02-BC95-242A9480C321@xenosoft.de>
References: <3CA22041-688B-4237-BD85-B3B3CB523C75@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <3CA22041-688B-4237-BD85-B3B3CB523C75@xenosoft.de>
To: Christophe Leroy <chleroy@kernel.org>
X-Mailer: iPhone Mail (23B85)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Christophe,

The following commit is responsible for the boot issue.

2997876c4a1a5864baa13d7393c2b68cf5b51183 powerpc/32: Restore clearing of MSR=
[RI] at interrupt/syscall exit

I don't think the commit is faulty.

Could you please check my kernel config and the serial log?

- https://github.com/chzigotzky/kernels/blob/main/configs/e5500_defconfig

- https://github.com/user-attachments/files/24035394/Kernel_6.19.0_Cyrus_Plu=
s_board_P5040.log

Maybe, the kernel config isn=E2=80=99t correct for the kernel 6.19.

Thanks in advance,
Christian=


