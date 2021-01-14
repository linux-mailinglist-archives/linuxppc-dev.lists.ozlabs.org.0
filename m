Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB3D2F58E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 04:29:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGVCy4d2BzDrcG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 14:29:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LAITRyyI; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGV8Z2cw0zDrpm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 14:26:21 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id n10so2821869pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 19:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=zB37YcxtPTMw6gNDLMA5sNYUExUjrie1n7CZCF8Dguk=;
 b=LAITRyyI4iDv859jDxPlKtINnt1WERsmNIKUPn7j0PI3ntVXH3lAkeVVsB2SlPCuFI
 GgXX/54+JyEPwGj+ceimhqrNwdC+d/yWSc/WiW5moNFdfktdGyxNl6zJxKbwy0pkA4rb
 vWMfUWmU/gIgoxlBMcO6aGcHsvOq0Q+zMPQzBIRcNwzDQzSMBLQLDxe7UNaMaIBesJhW
 NeG9ATRkHU4tZE/3CfFUi3DvsfJ5jWGDChlEI2yP+torokqTHu2B1euhcR0ZOia+Jn8a
 6UybUq4Tu2rsSAkrkcNzeafcmpxzfUar8DgW7piyykPO8YwG3kFmGBdKrGuD4p9w5zx/
 9GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zB37YcxtPTMw6gNDLMA5sNYUExUjrie1n7CZCF8Dguk=;
 b=DHQTj7B5sYUzj9vxypD6eXG3HiiQWXkJ+MlsZYKp7b0CoeyC17deLSqwnNRpSr+rPm
 A+/2602tkVDKTal3CFN6gZd0GXCd7qRtLGGTg3Q1hg+kZueaE6/3w0XaD4Zywl1fcYz2
 TaYzjKLO27r26k/L83RzFYd3Oinn0ObLva4VB+eD2gCWp8JFSEzsjMa3CtFGd8HJgIQb
 P8GAg1nopi8YbsGQj/Nv5z40wqT2wXNLCKc1u+KQ8Fz4S/kG9O54hrLbnJYjeNm7VKNi
 sjYMxGbv6L7/uNn558EYiSsDU2MKS0H6I0TADA2ItGxDObAShzvOFtRIAXAmjHZiwuAn
 Pyqw==
X-Gm-Message-State: AOAM533wc+ohUx8lP7hO73cxMwD8HUabN10SkkmvDzyK/54VgjTQDKfb
 N3tToM/OhpYa35hlHLsJsrY=
X-Google-Smtp-Source: ABdhPJxE2AYAGcuXIzSZ4W11PCIT7GdHwTBuQl2yUabziBagU+vISkX8B2wp+HXT7E9LuEmwFXjr4Q==
X-Received: by 2002:a62:7a43:0:b029:19e:c33b:c498 with SMTP id
 v64-20020a627a430000b029019ec33bc498mr5712994pfc.20.1610594777747; 
 Wed, 13 Jan 2021 19:26:17 -0800 (PST)
Received: from localhost ([1.132.229.93])
 by smtp.gmail.com with ESMTPSA id l8sm732888pjn.46.2021.01.13.19.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 19:26:17 -0800 (PST)
Date: Thu, 14 Jan 2021 13:26:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 04/21] powerpc: bad_page_fault, do_break get registers
 from regs
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-5-npiggin@gmail.com>
 <27997243-fbec-acb5-6399-f0ee4cccfa27@csgroup.eu>
In-Reply-To: <27997243-fbec-acb5-6399-f0ee4cccfa27@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1610594717.i0rllts6sj.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of January 14, 2021 12:25 am:
>=20
>=20
> Le 13/01/2021 =C3=A0 08:31, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Similar to the previous patch this makes interrupt handler function
>> types more regular so they can be wrapped with the next patch.
>>=20
>> bad_page_fault and do_break are not performance critical.
>=20
> It's a bit different between do_break() and bad_page_fault():
> - do_break() is not performance critical for sure
> - bad_page_fault(), it doesn't matter, because bad_page_fault() was not u=
sing the address param so=20
> it doesn't get anything from regs at the end.
>=20
> Maybe it would be worth splitting in two patches, one for bad_page_fault(=
) and one for do_break()

Okay I'll try it.

Thanks,
Nick
