Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EC2220806
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 11:02:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6BGl4cpbzDqf6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 19:02:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a4Ag6XZN; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6BDZ3HQJzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 19:00:28 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id x9so1339893ila.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bx+mAAqnrHgAzXQXG6WKZvX5m5t6d99W/4/GZ8ZVf2s=;
 b=a4Ag6XZNdeqNafqKobNciKBW0q9tqBTCO9JCniCHk5xWrDQ6RWS6ryjVWcqnTbm7Vv
 k4mlthzRu5FYdSx2ZBuDlEyTCUtHYmoJpo4hDjzvW2sS6Bp+dAaBUSVCsYi4atyxwshR
 JhxpRbu95DCcY1OHr+RqF/UNbRjYnCBeDv/HkUdLXLVw6JLdlsCUIqchMXa2xCGIFWAr
 IwThvnlDlLYlntUIEhe3iRy+k8W1WXMb09221BgpghM92E8/pV8/J74XxsFAB6i6a3rx
 nutkyXkl7Jmp+Q/VKpYJFKxU1LnjcYCbLH1lbvbtDudcrzmiJ3kOXDV6/H8KqWA/TWa2
 mqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bx+mAAqnrHgAzXQXG6WKZvX5m5t6d99W/4/GZ8ZVf2s=;
 b=KFb6xxOK4H+qJAPRDgnAQQDLCw2ttkDFfa0zH+Le4iiBrfZOW4YNqX/Nye4/1X4cUb
 HQqEdoBTz6EKleyAT621yAn7o0IKERN/w477WaieqQ5nqmVMDDFOUHZJCMZ+wc6QkhSf
 wfAFKZRi9Z8Ln3/IiAFJsdi4Lo5LhJ5V+aEaMxA2fDQpP+bOtfaHbeK/sSrXBVNHM2bG
 eUIwBVH/28jKY/LCMJHK0/pfjYduqlQFV3fIw7g1FAHYXk+v/dzrQJIzvr03petggrSH
 zfS6zVN3BjNjG+qBFCM3ysHZ/mVRq1qy3WonUw2dTcSebwZrpNHBOuEmhzmYfIRzZr3M
 aPTA==
X-Gm-Message-State: AOAM5328Czp201ndGPXZtAH6BbCquV3j60vJXeHGTdcAg7Apu+EiZz0o
 2x/UAa9yenhd5DJazG4RKEZ8pHh92zjPmNNsljc=
X-Google-Smtp-Source: ABdhPJxbq4sJKDYTI0IhkoaYzjTowB4eKtuSsRdhUGeUlLlyHoE344wvjqNBVNXYpoR71mhCvjnoMTTXmH7nI6j0a18=
X-Received: by 2002:a92:58d6:: with SMTP id z83mr8767661ilf.186.1594803622036; 
 Wed, 15 Jul 2020 02:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-4-oohall@gmail.com>
 <ee5a00db-badd-12fe-1c46-eaba5afc8dea@ozlabs.ru>
 <CAOSf1CESRPypebf6+rnkZkNmi6+xL4+QP1xgAS1szGsZDBcs8A@mail.gmail.com>
 <34f7eea2-4ace-9931-7b5f-98ec159f3532@ozlabs.ru>
 <CAOSf1CGhc1i64_DS18evMhwoXvMWyafOk3r2czUz49F6gERtfw@mail.gmail.com>
 <1da1c482-a720-d5ec-a39c-a4b4869352d5@ozlabs.ru>
 <5a1c3bd9-3a35-6e63-2f51-1626b178a7c8@kaod.org>
In-Reply-To: <5a1c3bd9-3a35-6e63-2f51-1626b178a7c8@kaod.org>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 15 Jul 2020 19:00:09 +1000
Message-ID: <CAOSf1CHWLH3Km3bj1fFVLXvQu-vE=_K4VWZQLyUFfwCVJbJBuA@mail.gmail.com>
Subject: Re: [PATCH 03/15] powerpc/powernv/pci: Add explicit tracking of the
 DMA setup state
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 5:05 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> I could but can we fix the issue below before I reboot ?  I don't have a
> console anymore on these boxes.
>
> Firmware is :
> *snip*

Do you know when that started happening? I don't think anything
console related has changed in a very long time, but we probably
haven't tested it on p7 in even longer.
