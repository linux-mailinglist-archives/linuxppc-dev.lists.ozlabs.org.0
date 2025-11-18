Return-Path: <linuxppc-dev+bounces-14291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7451AC68D44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 11:28:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9gmd06byz2yjm;
	Tue, 18 Nov 2025 21:28:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::931"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763455928;
	cv=none; b=FWkPPIwJsWZLZSV6dJ5jFWciCUYyZbiSwCCIak7YFEvDtQI7rddZ9tOg49dLHXVYHYlQd0amxw03QAxyH09x6UdLFWPTorpyQH7F0l/RsmpDZMsarQIFDTRnvOxYnXgnJ82twhlktebBqfGBZQ0CvexHlSs49LqLHGnPmNy6btJR+nwnV298YURUT7b7J43pjEE0ugesmy6TSMhO0QGJHoMNR2EpAMWrCtXK6g61x9c7hO9SvldwmbgtiiyF9oeKh5G/1A1tFz1MjURlAAaZodmXl1uNo+dx/Vv0R+oqWJx4D4qm2g0QSMXqjJqxel9djccLEiUSfASuny5KnK446Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763455928; c=relaxed/relaxed;
	bh=E8xfy4n2OHuLtLbNyfrX7NiByvghxx45N0MvELa+eWg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=As0aDTQ9yDSESGjmUk64XI62rs0vD4txADGmFdb1dIvoVtqscqmCmNVQ+8Wc26Aapkd/EWW8ryrmn3wDnMqtSyyl/bnZy155TPhcvmA2QMKK6/xGlokZ4NXZYfWW5wUqchT1TcehNxHcvdUcOgJkG8Wat5WqL7xiaMlFJ86VtA9UrK+RUIxejunrwBznR3fz3GVrGqlhFaHiCU7vbBCqDU3zct2WWoY2Wsdy+TAlp8WLcgSNRgJuInN3npV8ChcyMvV7upNwienxfckLcWQSEFIoI4sNTinet27Aaz0JupVNDGDLJhQYyZVSXy93ppnnkKIF4RX6Ku5JV5618Ixm/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M1bmCinh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=wangxianying546@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M1bmCinh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=wangxianying546@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9ddy2Jbmz2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 19:52:05 +1100 (AEDT)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-93754419e10so2907417241.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 00:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763455921; x=1764060721; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E8xfy4n2OHuLtLbNyfrX7NiByvghxx45N0MvELa+eWg=;
        b=M1bmCinhO4w8AUaibm5541cm7UT41FSI39t5GIK9a1hlMv3E+KmDPF39HSkBCgM4+W
         /j/ht5HxrVj8A3c/o/RNh5f105m8VJPck1uvk2xy9elwhAvGmWUm9XDib12KutIRN0NI
         4fZLGYXBnzkFWUC0oKv8R1JZBS8yfmCHvhLMf5sYHQQRZQ3lkHxSze5Q9bIxMn3qyurq
         uCd8cvEYjlXb5nNrFHkEpoprRaH24M2Pidiwv9Z95AYxJvRJDTiczN/eZS/9OwxKvTB8
         vhHVlfOA7Pk/HRMlcSyGss1b5KspcFq1yC/Vx8wwmW/fFG0fuzD4l/qt5WQlsH+hIpXJ
         ncFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455921; x=1764060721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8xfy4n2OHuLtLbNyfrX7NiByvghxx45N0MvELa+eWg=;
        b=ZHyniXN2fHmh2hgN2uDzxoSX/DT+s233KqG1/o2MZzfFLH9ntV+LJrHjWegmhGKwze
         1EB+j4wiYlSQeDx22M93zYXh0HCmChdE11nKrWqvRtLLXTTyWI75XE/fUNcutNPav7ev
         9IGqBRlJzinJU3h7qu0UlY2k5ZDuFWZDhFNXNJbbbl2PhRuXkZ1QOgFU+B8UkuvvlOO3
         roqGNlmRiNJc5WtJCu8utrWEYDHQm0u6W/CaCXZqlZD7wtI/yW0E6aO6vpNnJsRiazwI
         E++hMXW/BXDnGWejfat/2lutuzVZYAouaaeh40VBOGjGjA1JACMLURlijY8FLi//2W+o
         UzMw==
X-Forwarded-Encrypted: i=1; AJvYcCU/LFn54N5nhazinnei2gL+GicSAoqfhwgPAScugEV627q+zSshwx6GF5uo6q2C2SfW7y3FA66ciPsj8to=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZDZK0b4J7H62IEPCLHtLBsuEQTAV+tgIWSg3uvHsfuCjOycAk
	sd2mP4RC3VrS4ihw7QT74tQhGd3a33w+77VATyeqXICARF2FKtMU7Z6fRjyU8z5+6D1Wy6x/W/p
	HEpLemhzSi9VDMmRwHVwJOuP8NZAUbCk=
X-Gm-Gg: ASbGnctE+7p5NThkmA/k5jaGA/UOm9P2C/Z2zvjPzc0B9MBfuE0PxbT3UYICNx09Jzc
	OJuHluLqsNvwXLGkxi0Vyn7sSMxFq86c8Mi4vrIbBMrYauNPYYyzMHP7bQQcSpOTA1WnqweQKL2
	eZGpKbVBJKTdaLpSf7TvSjyTD7fB7v6oRFlcCNfm3bpKitbUeSyjrcn7HQ55NARTR+FoyJ4jc8d
	Ru5k3GU/34cgp906G54ZOxbYPHnQ+M+pi9fhFkeaE2zPdemB4AWhBndLqYaDIlSpLtnOTcr3cGu
	MzFpIr1gEnVQKiLaZq/exw==
X-Google-Smtp-Source: AGHT+IHLJD9ITP2kOO/IrA1/G8RrkFLrlSCEY3Ci3bTdfgBGCLvmgDoVdfs1LYZreBLmxlRTsZgp2dDxrkoA+xU3ss0=
X-Received: by 2002:a05:6102:5805:b0:5df:c10a:6683 with SMTP id
 ada2fe7eead31-5dfc5a6e650mr5258102137.35.1763455921544; Tue, 18 Nov 2025
 00:52:01 -0800 (PST)
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
From: Xianying Wang <wangxianying546@gmail.com>
Date: Tue, 18 Nov 2025 16:51:49 +0800
X-Gm-Features: AWmQ_bkva_QhRUL6XKIl3aGFId7vGWxwdgkbZsaTnIkhamQ3k48tVAXh7UZ7buQ
Message-ID: <CAOU40uCCXozxrKH4cXyNbb255SJ6fRS=doRysPiZ-XDpSF__rw@mail.gmail.com>
Subject: [BUG] general protection fault in input_unregister_device
To: luis.hernandez093@gmail.com
Cc: maddy@linux.ibm.com, rbm@suse.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,TRACKER_ID
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

I am running syzkaller on a KASAN-enabled x86_64 kernel based on Linux
6.17.0/6.18-rc2, and I hit a reproducible general protection fault in
input_unregister_device() which seems to be triggered by concurrent
writes to the dev.mac_hid.mouse_button_emulation sysctl.

From the stack trace, the faulting instruction in
input_unregister_device() is reached from the mac_hid emulated mouse
teardown path in drivers/macintosh/mac_hid.c.

The mac_hid driver keeps a global struct input_dev * for the emulated
mouse, and the sysctl handler for dev.mac_hid.mouse_button_emulation
toggles that device between =E2=80=9Ccreated=E2=80=9D and =E2=80=9Cdestroye=
d=E2=80=9D states. The
teardown helper calls input_unregister_device() on the global pointer
and then sets the pointer to NULL.

However, there may has no proper synchronization around this global
pointer in the sysctl handler.

The sysctl handler can end up calling input_unregister_device()
multiple times on the same device (or on a stale pointer) under
concurrent updates.

This issue can be reproduced on both v6.18-rc2 and v6.17.0.

This can be reproduced on:

HEAD commit:

e5f0a698b34ed76002dc5cff3804a61c80233a7a

6fab32bb6508abbb8b7b1c5498e44f0c32320ed5

report: https://pastebin.com/raw/Fxc8KiiH

console output : https://pastebin.com/raw/trZpGBDe

kernel config : https://pastebin.com/raw/1grwrT16

C reproducer :https://pastebin.com/raw/sdxjzABJ

Let me know if you need more details or testing.

Best regards,

Xianying

