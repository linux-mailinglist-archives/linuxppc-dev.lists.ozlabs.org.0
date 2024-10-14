Return-Path: <linuxppc-dev+bounces-2218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 677A299CADF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 15:00:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRy4h0hWLz3bmk;
	Tue, 15 Oct 2024 00:00:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728910804;
	cv=none; b=LqwdxREc1DnKPd/sXGN+AphsIchuNIYhjsJPCESSjTp0rxjfNXZ7ncGo6RMw5BWATYoJW/aupS1V2a/xQlGYwVgRTxEovr9o17b5YojvnYRhi/GmhW2XgWURujvSExwIFMkqYChdo3ue09/XtPzdccBrkXzFrpL1RUlTt9JOhiGZtZ1CM9SIxHe2/+vyborTwv3fO+1EJnVhIY8lAmGTjr+vG/+TGdojtwV1NyA+UNG9rwv4xnNm/iHjTigVx3E3b20cttAoiX3h7BSkX+t5q7tdaCAD+tF5uuQr9OG4UM2CK+bw2tTGSMNjuH5ek+gM7XIeP+Ay4fnhc4J0sEz9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728910804; c=relaxed/relaxed;
	bh=wAMRWz6Ni06FH5Y8K1vQ9Qj2l9tEBktBQKcD7nmm0Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVjAwEM/ZIySudWNt4Sgvx/JOBG8QKk3JiwauXe5/JCfSCew9EP3FW/DbYaVBlH8FB80Go1+JxmfKTyfboCVmZKUOY4NXoVhBiBWSAUvIwwLQo8XexBIUutG3k0cxdyeltJEiuDc3Ut5yJ4m+rfl5n0AfEm8uCTbzlpH0YhPZS0wp7X09Go9iPDfgu70oeEb/9i/2R/UaGnoGV8ft9byCT1Qo4a0YJirF5s3InXbQ/5pHE0FLUMeRyiw+46KWly6CIUAnvidXc7w0dWGPgX55n+dERzjijJ00BWHQAeKyjT7lUSDiqy55hJ1LZoCNXTMHKb2P7Qvnufo2Lzzp7syjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LlK/hov8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LlK/hov8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRy4f0DKsz3bgy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 00:00:01 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e2da8529e1so772221a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728910799; x=1729515599; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAMRWz6Ni06FH5Y8K1vQ9Qj2l9tEBktBQKcD7nmm0Is=;
        b=LlK/hov8JmxP2smoRyubvsTcQhulibaGS9IPyOo4vyw3Xiq77JUp6uueBkDiSKoueU
         qpnGW0IK6llT+8x4Z7QM5qm1yiwOGXMRQEjXY5AVSNzaoAulac/viVhg0W8uQkwkyO9F
         coEoaev99AXoigygRnUcMtbR+qqyZo2lfQJMkZtD/xmoOTM3MaJDtEO35mOf5twNdi03
         c6D7q55hXhh89sDq1zRUKDOlOS8H4pLNqkedvhR2I7eEmSsWW9DiTKxFAJdwyfXVPDaN
         LR6f0Lv3k/AYdmpPNv2pRtY3CShblTHxzHa0CPlnf3t0+pZAsLk5K4v8RX0V2N5UFB0P
         Iqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728910799; x=1729515599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAMRWz6Ni06FH5Y8K1vQ9Qj2l9tEBktBQKcD7nmm0Is=;
        b=BpTRKPduBp4UZwqS2CpfBnfEH3jh7E5fuzoh524hw+2IzAobNvbJt3CrBwPW1ocM9l
         MlI1YXfSKlhadEf7wvOhEuwy6RH3mE7SM6XaOuGE0qziDSrHpediAGETxEeM+xB/K3we
         2Bj38bxj8z3tfzz2ASveh0uU3L0W1ZkMYW2P07GqGoTFfEUUxXUcGKzFEF/7N3uZ8PIt
         fjuH+++/AjhtDcSnCJrroWUgnRmvdCrAlkmquYg5j+jvoMoUvYnzzvRLq1dcRt+hrr/m
         lFqUI9RUSx2k6IaiMsDalHOKLKQP1u7YAf1JJl8XH7jw+pJ/XzFDRVPCxgu3FOirkWZe
         Zscw==
X-Forwarded-Encrypted: i=1; AJvYcCXMH8irOJD+POQA/MOVi3pa3awr+lkp+apDqwnQArFt41HpJaGP9sPqZxLlLc1mYi9dn2ZDLTDZPCgbUO0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzjtQuHLoMznHO/D3ROFgf26qNrHHvz6pX0+5OQG/XftYtM8sxv
	UcbbgPrub3AeB8pJCcmjrdvu2D8yYSQrd0DRXgiru5eL/ohfPHBtXdYUGG0tFesyG2MSnpN1ujo
	7IUqCafrSZUQrkRVrGOXs1+iSOL8=
X-Google-Smtp-Source: AGHT+IHfIAI1KziMC/DpdOh4Ht7tKvRl7oyBCPkuLH+YiiEzGOEzkHIUZOUW4RIFxrbxcyqit0oMQ6Lffaa8FkPP6P0=
X-Received: by 2002:a17:90a:6f83:b0:2e2:a667:1a11 with SMTP id
 98e67ed59e1d1-2e2f0a22892mr5663503a91.1.1728910798760; Mon, 14 Oct 2024
 05:59:58 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <b7abd0b6-ac96-48ca-8165-a3b408137007@quicinc.com> <14691DD3-987C-4CC7-AA58-D3BF952F6224@xenosoft.de>
In-Reply-To: <14691DD3-987C-4CC7-AA58-D3BF952F6224@xenosoft.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Oct 2024 08:59:47 -0400
Message-ID: <CADnq5_PUi_2+kDYX8R_eanNF4iYN79MdXJ_PLcQbZKi6e4S8tg@mail.gmail.com>
Subject: Re: [PATCHES] drm/radeon issues
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, "R.T.Dickinson" <rtd@a-eon.com>, 
	mad skateman <madskateman@gmail.com>, Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>, amd-gfx@lists.freedesktop.org, 
	alexander.deucher@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 11:54=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> On 11 October 2024 at 01:49am, Jeff Johnson <quic_jjohnson@quicinc.com> w=
rote:
>
> Can you provide links to all 3 patches?
>
> 6.12-rc2 was back merged to my ath.git project, but then my laptop
> stopped booting correctly and I discovered a few Radeon KASAN reports.
> Based upon my search of lore I found:
>
> 20241003060650.18454-1-wuhoipok@gmail.com
> [PATCH] drm/radeon: add late_register for connector
>
> 20241007183241.1584-1-christian.koenig@amd.com
> [PATCH] drm/radeon: always set GEM function pointer
>
> But that is only 2 patches.
>
> - - -
>
> The third patch: https://github.com/chzigotzky/kernels/blob/main/patches/=
X1000/radeon_encoders.patch

Can whoever wrote this send it out as a proper patch?

Alex

