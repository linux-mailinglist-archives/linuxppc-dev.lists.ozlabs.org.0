Return-Path: <linuxppc-dev+bounces-10753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE80B1E37E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 09:36:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bywny3KRmz3cPG;
	Fri,  8 Aug 2025 17:36:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.166 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754638598;
	cv=pass; b=CNozxQvmVy7Z3iLDA8OKcbUdLPKXRlpTXgoX7SGzA3uB51i8clTqKR3XZjJUu18lr9UFfhsaMwJ9Ld5VHgCxEwC0xx/QZlWMh3eOPYELyRPSe+vslzzJFkewqRyjquC+Nc5cqbaD7gnnH0H3EkC9/5nD/JAV/TyPvtUV9VQyrbyMUeNdRkQIBAbxmR0N1BWetcoWeVFsK4k0T97f0bPJ6WIV7NfkLI1D4a0ttzEYqcr36oBF/GAQH5o390YEwlqXxOecz9l5zYZUFTyo7bB9ECHabZ+s0173XO6pIIyFTVRFuE40s03q0frIPPcLustdv3QhaSWvXxKh61sbYbAPbA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754638598; c=relaxed/relaxed;
	bh=hEibWoeKfJI5icTt/pHJWWZJzdwlXwFgqSZtoHw9OSA=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=kNsAEE2+R0ZIOidophBJ9em5Ol9ZjkavlFunKKhkIZT8iZzrBDfRvzhi3yHrVQ4M/y/R1YE/PndYN6EgVr6gVXzZZBkTJXBDOmFTT2zXrHTnP3642fOQRoL9GKJdL9DLBYVNsgRXd9CT4wHv1FHVN+RnzIuQD5D5EbtwUrahhcrRfrRkqCGZiBtwh6Ac9ihHNWIJ1GNSpzY9CCXxVT36mBZ+eLU8RknUWLuQ8N5mywEr3QWxAUlFKfIipxF89U2RZ7H7CUpbgFyVDQcOGaULHZEY5hiuhuh9EBipW/3e8tklmfTcuPrXOfRGIDYgD70T9NdTPb/zpKMPM/bz5I1kXg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=eDTuwjDp; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=4r7JARm8; dkim-atps=neutral; spf=pass (client-ip=81.169.146.166; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=eDTuwjDp;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=4r7JARm8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.166; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bywnv2Gbvz3cBW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 17:36:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1754638579; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lNFGPDPDPyWlkENtmbBcYkUImtRUUkhRK2lJV73EnS7yQNJ6/C4XDrDbnmf3et8XDv
    VqHUYmrDmpw7YZ5hAwLIrPdgjI60Os0O/FEJgBfN0FQKYY2X4Xplh18b6pwvvF9MFg72
    eENx5CK4Cal5T+Moni8bP2R+QG8OpPcxXnz0hBKN/VW1YkZwhIoBiqKdsMrDwxWR6v65
    7+1PbP4vsxao9aFvRii4yoM8WTLgC7XRXrFtE53rD3L7IjjW6ThSLIOPjroy+jyu/dGp
    u2XN2/yMeSkfC73WsQaQhZ1DR20UFKO2DVLjdYSHHHVTG4TCzzj96ks1ZIjkrb3lKTUn
    MGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754638579;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=hEibWoeKfJI5icTt/pHJWWZJzdwlXwFgqSZtoHw9OSA=;
    b=SsYw6tz+ebCEhxv9XYJ0i9lQId1YYk7qKKWosq9ZUc216aZQVSCpze9Tmo7WU6yW/O
    xdwqYtpcSyqD5S/Onwj1w2rZWxINq8jJzFu+MWmdbSyN6kBhh0UgwEowsw+JSrr9ax8N
    2lFK9knE44UCpUwW+GvSsRIS7IC278Sqgl/+wAV0SyqQCpXAEgIzvZHJKK0mvisBhaNJ
    8GvEU1EtGImlEGDZO4Z959uH0nPfQoiMmqo/AqMhlJn5Khj39/xfGUwsuN3HW3M4l0HS
    yto+0qbkAaEmB/M5bhMilKIzSxbm+EgEpvwEC4lbD+LkXYicdONxjo7lhlpXBvZsEvK4
    kk9w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754638579;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=hEibWoeKfJI5icTt/pHJWWZJzdwlXwFgqSZtoHw9OSA=;
    b=eDTuwjDp1I2+vEC0dHNxIwj2UFtw7MYrGlbkfGwKBtsKS676wYO5ZiTARWgl+VVXJg
    yd2BXK9txMDbQk7FhI2SkttKvTuoUh+j6PK/cJlAW/pLm28feZLXueBKzZRivStNvsnZ
    3pKCk5P3GuqJewfDun/bs8tW9TgXOcLQBfJSsg2CSHJegSRccE6Nt2JfcPRoIgO/U2NM
    ZyYCV9M4bVl42wEe2k7mv5dH8tvpEViJgeHZE5mVhWthU2ugmhiiQ+KX6KoNIFkYpKeD
    bDMnGcfrRVGuvz96+eRM9l7cLlTZk/q+Nz0GlXe9kFH8nLJLgO/M9ibHnOIaW5ACFahZ
    5tSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754638579;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=hEibWoeKfJI5icTt/pHJWWZJzdwlXwFgqSZtoHw9OSA=;
    b=4r7JARm8pW8v67SeR9uuTEeKoERBacRf2PFvge3VdfmH4q6QOXihdcTJGyRwJDzkj0
    mCVOO+j6zTzlb0zWo9Dw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m2s3nHCn41v9Nkb0mWmpM67xZiJcLlItnQ0v4="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c1787aI5lK
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 8 Aug 2025 09:36:18 +0200 (CEST)
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
Subject: radeon_fbdev_river_fbdev: failed to initialize framebuffer and setup emulation
Date: Fri, 8 Aug 2025 09:36:07 +0200
Message-Id: <EBCB1171-0CF8-4B7A-97C9-0E7816EBA6B5@xenosoft.de>
References: <69bac1ee-4fea-4225-b222-d7f274a8ea3c@amd.com>
Cc: mad skateman <madskateman@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>, ville.syrjala@linux.intel.com,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, bhelgaas@google.com,
 benato.denis96@gmail.com, Yijun_Shen@dell.com,
 David Perry <David.Perry@amd.com>, rafael@kernel.org,
 dri-devel@lists.freedesktop.org
In-Reply-To: <69bac1ee-4fea-4225-b222-d7f274a8ea3c@amd.com>
To: Mario Limonciello <Mario.Limonciello@amd.com>
X-Mailer: iPhone Mail (22G86)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 07 August 2025 at 04:21 pm, Limonciello, Mario <Mario.Limonciello@amd.com=
> wrote:

Does applying
https://github.com/torvalds/linux/commit/907a7a2e5bf40c6a359b2f6cc53d6fdca04=
009e0
help?

- - -

Hello Mario,

Thanks a lot for your patch.

I tested it today but unfortunately it doesn=E2=80=99t solve the issue with t=
he Radeon framebuffer.

I have created two kernels with and without the drm-next-2025-07-30 updates [=
1] because of the issue with the Radeon graphics framebuffer device #15. [2]=


Download and further information: https://github.com/chzigotzky/kernels/rele=
ases/tag/v6.17.0-alpha5

I have tested both kernels this week and I can definitely confirm, that the i=
ssue is somewhere in the commit drm-next-2025-07-30 updates [1].

The Radeon graphics framebuffer doesn't work with the kernel with the drm-ne=
xt-2025-07-30 updates [1]. Without these updates, the framebuffer works.

I bisected yesterday. [2]

There are some other user reports:

- https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60606#p60606
- https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60595#p60595

They use other Radeon graphics chips.

@All
Please check the drm-next-2025-07-30 updates [1]

Thanks,
Christian

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3D260f6f4fda93c8485c8037865c941b42b9cba5d2

[2] https://github.com/chzigotzky/kernels/issues/15=


