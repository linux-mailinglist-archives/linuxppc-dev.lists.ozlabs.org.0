Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7084E1D76C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 13:23:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qc8M318wzDqTT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 21:23:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2f;
 helo=mail-vs1-xe2f.google.com; envelope-from=rsalvaterra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sCUogVFE; dkim-atps=neutral
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qc4g3VDXzDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 21:20:19 +1000 (AEST)
Received: by mail-vs1-xe2f.google.com with SMTP id 62so5310181vsi.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 04:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FwXuV2cpxUSmCy7up15Uwmqhyk5m3pVcIwxq8dUVwU4=;
 b=sCUogVFEgqxkFeiGS1deK6BYWcRs/bXc9mzN6EfpU9712ZjJIuFJleaiNG+HC6kgXQ
 4GSTmDjIU/Ex3AfcjCHJzMW8DDs+BpUpqFixdzvEMQvzkY2myC5K0hPne3wx5qtmC5Dm
 3T5cio7JzmeRqh4yk9I9/chSLU9NzPxqo6DFSPoxCLSuthQLgOYxggk/LjzNYN/k7HqO
 5KP5U2IRTZBkXAf0wvKQr30hKzTLSN8AqtfH4hdUGD6rj9k8BBmYogCn+ytv6V3ZWQi3
 SttAgxHwvmEctqoIjWPNh3hkhEbjG6W9dzoNzg8dw+p1h/z2k8PUUyAIAJB0k2ZwN7bt
 eJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FwXuV2cpxUSmCy7up15Uwmqhyk5m3pVcIwxq8dUVwU4=;
 b=flZtGfQwKyRthinmUIqd/DZnoeadtISwgKw+4r6ZgzrHdv1kzbgErGyA2IpgCTESzu
 wQKjdUN1RLVPTFJY/NdPydSaDWsfHqw67pNofbhSZRTqpT3jzPaUGZTKLPJZU9TmOY61
 hGuZq3RWIdWTKjYyldp5vbsxdJsuCfvaVxtBllFny6orZCv2Ta3jmzZBRuE8EYb8OCLm
 IHICi3ogAOxkhmCgE6zoKwGAB+uRwu07R1YjAg17cEw+KfpaV7uyDlf9BdznYMJVvs/J
 hFBRXVmutghnct0cE91xHLxhNjQ3CzxHsTYIw9i73lazrzfB48fju9TgDy/ca8yju7tm
 4GNg==
X-Gm-Message-State: AOAM531FmaPjb5xx6fa6Zi4K3uL27mvd0viYqgtEkwzct9quHThjUxcf
 1lyZf5gFmUucjixSH4moK3JWQqPdKZfoYYl4tjjYg/E=
X-Google-Smtp-Source: ABdhPJxEQFphj2Sq8hlQl6IfTRYt/YeeVPsYywLPPhfYBYSi0Ff97l30iN41++lXn0O8ZzPymnxpjXEHT6XT+J3SDEg=
X-Received: by 2002:a67:8d0a:: with SMTP id p10mr11245879vsd.45.1589800815636; 
 Mon, 18 May 2020 04:20:15 -0700 (PDT)
MIME-Version: 1.0
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Mon, 18 May 2020 12:20:04 +0100
Message-ID: <CALjTZvZ69v3Z=8MY28F+p8v8_Z5e+7NrH0PAJ7TGD9kh6Ab7bw@mail.gmail.com>
Subject: [Regression 5.7-rc1] Random hangs on 32-bit PowerPC (PowerBook6,7)
To: linuxppc-dev@lists.ozlabs.org, debian-powerpc@lists.debian.org
Content-Type: text/plain; charset="UTF-8"
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

[Resending since I messed up the subject, sorry]

Hi, everyone,

Something went wrong between Linux 5.6 and 5.7-rc1. This is an iBook
G4 laptop with 1.5 GiB of RAM running the Debian powerpc port. I
haven't bisected yet, since it's going to take quite a bit of time, so
I'm sending this mostly as a heads-up (and to see if anybody has any
clues about the possible cause). I'm using the following reproducer:

stress-ng --cpu 8 --io 8 --vm 8 --vm-bytes 1G --fork 8 --timeout 10m

On Linux 5.7-rc1, this completely hangs the machine in about 30
seconds. Linux 5.6 survives the test. Let me know if I can provide any
additional info, otherwise I'll just bite the bullet and start
bisecting.

Thanks,
Rui
