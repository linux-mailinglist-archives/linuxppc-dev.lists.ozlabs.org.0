Return-Path: <linuxppc-dev+bounces-2091-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC02999B5B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 05:54:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPt6K3ln1z3bgl;
	Fri, 11 Oct 2024 14:54:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.52 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728618857;
	cv=pass; b=Gs8FxVoXkgGGV8M5HPtSMYrd8BCS4s+uyQ8ZOV4HjknsmuA1ArqgUy5Fx0HItq+Gfzb4FOjeyih3YJnvbKMg4HyA1FObWJao3cNQpMzxQYFMjkHYSGtu5AqKc6oViwDRN+5rTtgCWYuvntIjroU5RQfcAA0xo6SO+txHApHUo1fmM3PS+0wB1qsLBI2AvITc32RVmyUII05a7vJ+qzz7NqjB6Yz83ryU1IFjZklo2Db8lGJBCYIEnKuDagXlFJyKTBTuxalLJJVlDJs/1NSoM6G4XUH8zbKujPVLHB04D5tlRNbgkFvRfNIdT71BbsMmiCyWQIiPtH7urFQOjwzO8A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728618857; c=relaxed/relaxed;
	bh=Sw5kvAhQnV+uYxbzFDKschXQBdixLP9VwVOC5axrod8=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=XPB9lr81STcvlu3VlI5NG0eZHVMYRg9bYjySLqjShejkT/XPc7X8zFBFXHRhQ1+hr0uP0tHxqB2hMa08c6COaabcXqRG7iYXUIBKYoBPfua/2ToF1pAbA6RhLTRrGOmA+elT/6EUQ7FBwBh9ReVtmFxOyu+ml0kFqfiMcnvNKbxbbvE2B0EXQ1ZpdG6OmcMxYUQJGgd3uoZmSCRmal/Rx0tzKDN2otrUX0vgZYINJ3nRz4UQX5MzkDO0jg/Y4J6SY/lGmpbvafUAv9HwkIqf8kYzck78CrjBz9s6wVO7tfPsO4p4WWqJWd1vY0qySwxEk2a5OD5vSTqloFzHhwKLTw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Ac/Mr6jH; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=gq8bRrxB; dkim-atps=neutral; spf=pass (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Ac/Mr6jH;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=gq8bRrxB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPt6F4PSLz3bg4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 14:54:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728618844; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UiCljemeMgCdPUs2LOsRJrup3bkfI7rwwjcWMOrW+89zkzJ6VrGxNTOhRGCHzWPFce
    W70kopLomdhX5KRMPImd64yyC5ys5FpZ5R2t4rK0SSERe7VDFOPxukFPl7PnrMrLIXns
    vt4xMrvpncI0z7fSFmBlEgK3naie1DrZijIMmpQnbdnTkhu5joAKevYW5+xxRmAjaiXx
    xG+j7lwB8TskQheAUrM4/Dhidp/rtQP/XWzFkb0obpdHj2ne4E3FAZIo90Tt4rkv1wA9
    8FduEJvtXVweASfT9RLQgbtIaWuLHRtba0y9OkXcIdqbvyoN8AKxmhDo/+7i1z9mrqW9
    kFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728618844;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Sw5kvAhQnV+uYxbzFDKschXQBdixLP9VwVOC5axrod8=;
    b=C3iaajA2e5kdq6A/v64H37z3SJeh+esfn8atx1FIxW0Q2cihgqKxtv3T0ryFYkwDFS
    3gkNsycb12e/yvn8RW9bVDrKcl/MrvXVN1M+YdGkq3XhFumP8D/94cPmlgUtyHnh5tIo
    KaK7F505urv65G9Yy3z5p+w5Cvj+OxFn7LuGZahmZxzkLhKGQjpyWoSteJoVZPQFynXB
    fY0HX5oTQDsNfKbo7IGpBVfGM1h2yIAb4dBKXBIYI4rPCX3FlAsBIHbCV0bIUnpPmZ4s
    zkIt0iaCO6hNq0O8+GM2YZfOqY/0PiBGiYldjqmvxn3N9HaCQQj0gYcbWB56Uxr8ybuX
    EDvg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728618844;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Sw5kvAhQnV+uYxbzFDKschXQBdixLP9VwVOC5axrod8=;
    b=Ac/Mr6jH/SZwQXsnC26RqtCEQvjfa+EvFyOsBAQZFlSsbdFmG+LdcXBOGuJaz3qwAt
    WdowTPWtdQIBLTbjM5JcAJU2G2rDUBuH8t4l/O9FwlAMatoSiZYcgyHIqGO6nBqszf5n
    QMGQtZpadKg1L8Dv4trcpSF+9uonOTn5q4sGve1sv4nX7mtwl+xFolcWo0CJdyl+CrRL
    /2XlzmSzGHxnJyFR09YcjDrIV36h5cEb+UvNQGS1j+OZGJBmSFf39usHGCnd5oUWkGj2
    o2iM3TC7sm2Mx0dKVmJdFEZ9H168bCTIxlEu9sfmJ2OjAtBedLrHNf+V+Qh2E6vtXjae
    Wlew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728618844;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Sw5kvAhQnV+uYxbzFDKschXQBdixLP9VwVOC5axrod8=;
    b=gq8bRrxBanOYS2JJnQjyc23TjbXS02K3w8jBe+jzvZehVp7IB8zQEnnsShXQ5+l+XE
    jrfDIVPteDS0SLEeBSAw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5i8sy+VWyhJ8tyaNDmc6CleQOst1T66EaU95I4="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id e0da1a09B3s3wbG
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 11 Oct 2024 05:54:03 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (1.0)
Subject: [PATCHES] drm/radeon issues
Date: Fri, 11 Oct 2024 05:53:52 +0200
Message-Id: <14691DD3-987C-4CC7-AA58-D3BF952F6224@xenosoft.de>
References: <b7abd0b6-ac96-48ca-8165-a3b408137007@quicinc.com>
Cc: "R.T.Dickinson" <rtd@a-eon.com>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexdeucher@gmail.com>,
 alexander.deucher@amd.com
In-Reply-To: <b7abd0b6-ac96-48ca-8165-a3b408137007@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: iPhone Mail (22A3354)
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11 October 2024 at 01:49am, Jeff Johnson <quic_jjohnson@quicinc.com> wrot=
e:

Can you provide links to all 3 patches?

6.12-rc2 was back merged to my ath.git project, but then my laptop
stopped booting correctly and I discovered a few Radeon KASAN reports.
Based upon my search of lore I found:

20241003060650.18454-1-wuhoipok@gmail.com
[PATCH] drm/radeon: add late_register for connector

20241007183241.1584-1-christian.koenig@amd.com
[PATCH] drm/radeon: always set GEM function pointer

But that is only 2 patches.

- - -

The third patch: https://github.com/chzigotzky/kernels/blob/main/patches/X10=
00/radeon_encoders.patch=


