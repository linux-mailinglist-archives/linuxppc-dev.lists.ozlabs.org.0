Return-Path: <linuxppc-dev+bounces-12948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2779BE52AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 21:03:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cncn53hJcz3cBW;
	Fri, 17 Oct 2025 06:03:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760641433;
	cv=none; b=Olz86tiVlc0w76nvd9IsjOdd82Hfuf/OrlMJhh+z2yF9oe+IOoQBWa5Bbubah8yXStO3Q7hJb9QetG1n/1Q1N10hmcd9Cx80nEgJCYe8bkVxz4VkNaNG8O3FX4KL0tFxDeR7xlaj3/ZFUawV2UoTQOM7j67rSmRV01UNKgh3qY1Bd2qi3TcAqT7EgZJVWSP00Y/7D3BOFfAN5mEXkehPokk/Vwsh/3VDAK9fjsDkejpW1sTc0B3ovgth+TyAEDfldTbaS2oZi09yHgiYrj3dHN6LdeewlKA/Wjv/mlJYyui57niegh6l/GYeX4B0/uha2MvZEb+PNy8DIUvNSWh+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760641433; c=relaxed/relaxed;
	bh=4nIFNEks8PbBGhBJr2VhwfXZ1rIHGH2xm1/3ooFrK4w=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=JLNUme3MWfz+VjwIUNgw51Cxm0iKGya2tPbqrkuWd7lbL/4cWyNix+N7rgVm7UAdLlyogsGoKDT84ImHgibmknUvczoZd32VdpKpVIeDJlzACUllP6NAS/MPBtSQduRW6G4+nxtauelcRDAxSCtsfP6jx4Qfs+gNykW+bCZ4p7iSRzikH9UbCaTZhfclxA9ua6Q224AmEfEVKUtgnRwxSN93iInuOIQ6o2XZUM0Z7uXqagDkSNW5WBCy5bE2JWifopq80e50QLOizp5XzPG5h9pZK7DfFbYGj07naksdoinXtNkJMpnTXtbgI9hSCoaM7sAGEXrAElncZUWa4AybQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=XXGxHtvP; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=XXGxHtvP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cncn16SCwz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 06:03:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:From:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=4nIFNEks8PbBGhBJr2VhwfXZ1rIHGH2xm1/3ooFrK4w=; t=1760641430; x=1761246230; 
	b=XXGxHtvPUafTByzopSDf4pFypP/BNbgcKwPpnQbb+ExIFPjgu6oH84k/O0n+LGw0WwFl3+8/tJL
	yJNTnGLUOBFC8huVNkKgF9xWrKZ0UqNEn3FVCExmrrEl3FMKFgufYOriwnyElfx5rHiioCiLuW6VY
	R3teJ57pSanjb+zPATRx17xjRVtCfr4zHLn9VzuM9Djd/3VKboDOWZqBPU6n67pFXYSO+w/4JMwml
	BGrykLLRYdupFR45GboAeomjLOciSMbkRPg4g5fmwiE/P/KHP+k26U6rZn1ZzplkVgeEW5nnW+5UT
	8I2KUyJ/zRnAp49+PTYXr5wg5riD3N7Txj4g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1v9TGJ-00000003o6E-46xg; Thu, 16 Oct 2025 21:03:44 +0200
Received: from dynamic-077-011-113-241.77.11.pool.telefonica.de ([77.11.113.241] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1v9TGJ-000000034zE-3Grf; Thu, 16 Oct 2025 21:03:43 +0200
Message-ID: <eb8a89e43f01a920244bde9252cbe4f5c0e2d75a.camel@physik.fu-berlin.de>
Subject: Kernel failing to build on 32-bit powerpc
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-powerpc <debian-powerpc@lists.debian.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 16 Oct 2025 21:03:43 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
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
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.11.113.241
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

could someone investigate the following build failure on powerpc [1], pleas=
e?

In file included from /build/reproducible-path/linux-6.16.12/kernel/sched/b=
uild_policy.c:64:
/build/reproducible-path/linux-6.16.12/kernel/sched/ext_idle.c: In function=
 =E2=80=98is_bpf_migration_disabled=E2=80=99:
/build/reproducible-path/linux-6.16.12/kernel/sched/ext_idle.c:893:14: erro=
r: =E2=80=98const struct task_struct=E2=80=99 has no member named =E2=80=98=
migration_disabled=E2=80=99
  893 |         if (p->migration_disabled =3D=3D 1)
      |              ^~
/build/reproducible-path/linux-6.16.12/kernel/sched/ext_idle.c:896:25: erro=
r: =E2=80=98const struct task_struct=E2=80=99 has no member named =E2=80=98=
migration_disabled=E2=80=99
  896 |                 return p->migration_disabled;
      |                         ^~

Thanks,
Adrian

> [1] https://buildd.debian.org/status/fetch.php?pkg=3Dlinux&arch=3Dpowerpc=
&ver=3D6.16.12-2&stamp=3D1760639059&raw=3D0

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

