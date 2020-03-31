Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1BB199305
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 12:00:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s4b36bgfzDqZn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 21:00:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=shiva.jaishankar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J/EqjWzz; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s2Jk3wY9zDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 19:18:11 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id j17so16512887lfe.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=V7fuHVPz3lx46P59CWAG0NcrtXbR0iGK6GXsoD3H490=;
 b=J/EqjWzzOYlqO5wL8ydFVeEpjEezh+oW4Lcj9lznzriOEfhblMu4jf3u4NC81iOehP
 dMR5ShJ1iFO1mTmm1m35rZ06Ws2ZgEsezUwCwLF2APdpuasWEnF1lrGcqtVt0+KnH5r3
 6slWwkw5zRdBy7SP9l1hCctWaHPfWcXidCqGXYTF0TCUjZH2VqyppSloY1V24r3WtFxf
 SbBm2cEzRZ9UMBp+FGgv25CL3Uac4vOhy0CzdnpCnR5Ja6jy3FPTzQ1bLMtyy+luFNQo
 Jinq2N31CVEWdIayGTzoMoVvUVcgJKKRtLm0gZpy+Csms7StW4a+FTl7eXBPBuazzRiD
 HT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=V7fuHVPz3lx46P59CWAG0NcrtXbR0iGK6GXsoD3H490=;
 b=gFkKwkAaExKXu6NFHi/VhjJlG6c20ME8AN4jfn3tyuDxIqeLzVlDJZhdWwzS7qgNK9
 ExH7pUtIY7wT0g/kaQWcKBg3+K9e6WvhQ5t1bo41Z7L2ZsuXLMZYnR6csY8uv2sc5bHE
 MXAsChVna+5E/lGDAtanOqoO4ePLmn94xNjaC/3zsaVopdN0NgzzbXwSQ/8KFiuzwMA0
 c8NpqXn0ob4ce2+JrFuDKPJl9qF9479SD2hcqq5vyDYxoG1wLlHD0uqVIpBzkNojp5xC
 uIWNKqNByviEbsihst6tkfuTsiJHiSnviQx/IbE1yFdyhsg+MT1+xZ7eVc8cyFUpxzzq
 UoUg==
X-Gm-Message-State: AGi0PuYmi9HpeOBp1pKW0+jfDb7VgnFe6xpip0sbwGMMoAGgq72/2dEU
 NjG52etv3uvEbEwjVkEPa0TT0NzOaB/rmGtGYXBLGQ==
X-Google-Smtp-Source: APiQypJZD/fUo26vUbWHS5iCAItKNfwgmFznCxLgYuW+B/PVTiJ/QPjbqUZDaoIQOc4mC0cOedxxQjSk8bjhCywjt2M=
X-Received: by 2002:a05:6512:2023:: with SMTP id
 s3mr10406997lfs.121.1585642685914; 
 Tue, 31 Mar 2020 01:18:05 -0700 (PDT)
MIME-Version: 1.0
From: shivakanth k <shiva.jaishankar@gmail.com>
Date: Tue, 31 Mar 2020 13:47:55 +0530
Message-ID: <CAMksNJXP5BKoS245igR2aNXVnf6Yvh_zXseyvg=Q7+h-0gavcQ@mail.gmail.com>
Subject: Emulate ppc64le builds on x86/x64 machine
To: linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000008e53805a22235ea"
X-Mailman-Approved-At: Tue, 31 Mar 2020 20:57:31 +1100
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

--00000000000008e53805a22235ea
Content-Type: text/plain; charset="UTF-8"

Hi ,
Could you please help me to set up ppc64le 0n liunux machine

--00000000000008e53805a22235ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi ,<div>Could you please help me to set up ppc64le 0n liu=
nux machine=C2=A0</div></div>

--00000000000008e53805a22235ea--
