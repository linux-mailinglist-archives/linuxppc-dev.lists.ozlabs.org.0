Return-Path: <linuxppc-dev+bounces-10458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEEFB1613B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 15:17:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsXn71Hb2z30Vs;
	Wed, 30 Jul 2025 23:17:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.221 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753881435;
	cv=pass; b=fCZLht5gGo9wsElsNcvWOf5uZJnjtLLyJHtH+I5PpiurA5P5x+TJYB7edHZQW7Ibph4/TpS1kc5hX5KuP4g+f9xMutLnZgg/34dXq/wFZscsdqVx8HdeqpX3qtadYZuDmTuDUdH/iF8TB7J5haWci09NH/1G8hSlY0OANOTffmK13saeaU6SfNy/sQpzrJZazacCRU2NJUbAiGZ8ikOMgWwtQDcBDnb66VC/WlVYY7iDjFmsCw8sCytH492zuxkiuNN3NtWXpADSxUG3MVZITm34Ipd5jTvF+WRi1PMW7MSN2yYo0zcQqnUvQNeW9VC45G5vTYnn8FlBuUgASwPKzg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753881435; c=relaxed/relaxed;
	bh=6/tj94J5qAjk0aEhTz6SogSCgzWuoJFHB3XbBkZVPpo=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To; b=XwIUyq/1gWxiW+L9XqE8G3Q1f0Kc9xFhjf1yaEuwLjx6v76R/QV2gXriuYQLu1RR7k7KnFdW0t27b2RitEFqPENlxS4GXpVtbuYt6vw3KgBY7o0pHpsbMjgOj0mFUSHSDGwbB5iidT8d9bHzyuzJJae6KPWP41pNPuqrK3zoxsBcbR8N2aShaacoUVsRl/Yj+GUq00I4uC5T6cC4kUe85jFbwLelSgXtYR1rz4zQdgn1qKsqPyX4S005fKKMxYm9Q49Bvd993agxTWtBxKu85cyKEfO8meS8kJxG+0JancEdXdSMMYr6dBn6X/YzWzl7ji1XnT3SpYQ3rulXspKWDw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=kf4t03+I; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=gOZXrF75; dkim-atps=neutral; spf=pass (client-ip=81.169.146.221; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=kf4t03+I;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=gOZXrF75;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.221; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 180 seconds by postgrey-1.37 at boromir; Wed, 30 Jul 2025 23:17:11 AEST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsXn32pwvz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 23:17:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1753881245; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=h/LwW9cZ20s7ALflckva075l/NI7WIj5zNl1hZvuGfBXevaszjI/+jHrkLFbVbJAhR
    WhEg2sKIihg9SfoJao+i8JShRAmOfm6IL6TBUVhQiV+RfkgPSsKvRiEhEbDc7cqGtUdJ
    MdNqjXR5fGc+Ctr2D0uBnH/q7PTUAFvV4YKkFGDJjnNMxzcnHNKT2S+mPPUVxzbr7OI+
    XqT5N0A2lzv79wNy5qg3ZEhz+GnGtN9rIyRbxR9pAe9kB/tnlsVSiFOiwRLVSlbk08wz
    F1mXRuD80X8/l8NveX4yMxFI7RPQx190PJ45WeaGaSgEjZ2vfIyWOPxJhBQ5OAx+oR1v
    UR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1753881245;
    s=strato-dkim-0002; d=strato.com;
    h=To:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=6/tj94J5qAjk0aEhTz6SogSCgzWuoJFHB3XbBkZVPpo=;
    b=AXEjfQxHj/b3hPJAURP4tP0LBQgU7ZbGqhDHWCZf9TIDDPXI/boW9/NTXK864ZbnHu
    Y2adXdvj8axbO4b7PBd4F6EcxwZeoaXG0EGej5juaBcdq4LBOba/15XqIWb4hSpKRsVn
    B6V2GxLhIMAJy/kf7slroW0CubszzjiXuWejILk657EkkxXw2WoqR1LRx01qMXApn84X
    LcsnSWJUOB+4m5lwrtxTYbQbJpR5FEynqW8gAaViP02mHT16ZqJaP6v1uy44pgBS605L
    oJj0YgJIe1YDbYrkN7h75+gj9mItXjh87968kBufePLeYZgJ1rPRDVG5+f2mIk9uSPgj
    6FQQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1753881245;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=6/tj94J5qAjk0aEhTz6SogSCgzWuoJFHB3XbBkZVPpo=;
    b=kf4t03+I5eySgx9tUlrzwFINmkGeEWbJ9LGFxfkkPOUjI5DYfiAlSQV+77lPkw04j6
    SA+i/hzNSzWobi5GznBjMf4UNh1lz1aumMqPw0A5UhDQLZ5DD2iqNV0fB8mdFP+t0Oj+
    mkPpzLqdVsx1HiHqx15CmLjBeTid+IukDRL/LAWMFR/L15CnWlho35EkwBwCHdMwFzxj
    XKuGLz8R0ZJJcbR6yeG9pc37PSvJhKuJwRn6GJ6adUzi4N0nWMtNqYXJLg4ScyBNgrSG
    o0hZ1mbsWKTbXbVe6nQTbgncQpEcaFoJsHqNydGXsbPGgLdsui06owrdyIyM3MiN6Qxb
    wv8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1753881245;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=6/tj94J5qAjk0aEhTz6SogSCgzWuoJFHB3XbBkZVPpo=;
    b=gOZXrF75bJ6Hzu7hqErwhmvLv8wSN8gmHn93qnhSGZJNcJs5lg13e+Clr3xvU6uscb
    ruAvRuqwlcuWpzc4O4BQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5ngsy/CW3yGhU8fYuVA3geGyCkt3iJ6t3tsliw="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c16UDE4cCB
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate)
    for <linuxppc-dev@lists.ozlabs.org>;
    Wed, 30 Jul 2025 15:14:04 +0200 (CEST)
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
Date: Wed, 30 Jul 2025 15:13:54 +0200
Subject: PowerPC updates 6.17-1: Switching VT failed
Message-Id: <D8BCBAE7-8D8B-4A71-9616-ACEDB1281E8F@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: iPhone Mail (22F76)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi All,

Could you please test Xorg with the latest Git kernel including the new Powe=
rPC updates 6.17-1?=20
Xorg doesn=E2=80=99t start anymore.

Error message:

xf86OpenConsole: Switching VT failed.

I tested it with QEMU with virtio-gpu-pci and VGA,vgamem_mb=3D256 with some L=
inux distributions today.

Unfortunately I can=E2=80=99t bisect because of the lack of time.

Thanks,
Christian=


