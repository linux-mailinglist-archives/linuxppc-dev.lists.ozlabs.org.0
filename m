Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBF90559C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 16:47:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iklUHcJN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzpLK5PmZz3dDy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 00:47:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iklUHcJN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzpKd06cRz3cbB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 00:47:15 +1000 (AEST)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4ecf8213dc6so612019e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718203627; x=1718808427; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=++Zx8ONfAby/2OtMVElgCEc8JDEMc6Y8wL+JtS/yQjQ=;
        b=iklUHcJNkuumWeoG3ovb/ISKhIc7V35g+I5mnqnZRkIuvDDSscrKcnx+tX4YfbC/da
         jDzTx3E0ZEPPgR9cKp7SoCbolMnCpdoUb29t/0G5mOeEmltIoO4OUKRLASktsoNTrbTF
         v5ZBhHPmhpxLu5yuZAaWMjVeOFvsbqtQamb5iCQrH6XutrjMqlNJrS9KODEKh9V5hb3P
         16oyFXE7k0kAQTc/PwuY/F7MscXUcvtpI3ZWZ5FzSUwm1/Mm228DXkcwKqtFkeC9BQPy
         UZ+8Ek/YaTw0UyHXO/nS9MfPHu/Dx3Qs4no6wtO6yW9EBrI3si0m7FfMJJKX2pl7M0xz
         wMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718203627; x=1718808427;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++Zx8ONfAby/2OtMVElgCEc8JDEMc6Y8wL+JtS/yQjQ=;
        b=hJ1ppe5sFciN4TNwzoB4Lnzt657xbbAiiMOX4TEOlbx+/bJuYomxo6R4uvNYyIhfWL
         aCZao7VXje6Mj8J41/34GhmPVsJbMA+oN0r+0i21Az+9IAut3m1M3tio+VwnsYPe9Xmg
         +5PSKMLb1RQmTQCC+xifReI7OrlAMlFbVNdae7O/1J9BbnVRy3gU3+5nDzkZd6cV+PHY
         4X4M2u5Oso+l/ATA4WtTq9W9Rrlu0qD57mPi1/kbmjOC0mqHX23b4Em/ilWnD4BrYxyh
         dKMxSCJdVO6y2ePhjoNaVUxEYiUq7zgF56g9DA/WXNJ+MNLOQTvBksEszFBllEaDVC7g
         /yOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZfjDGcneiqCJAqcJFqKGHNEQIxTbVxDUgsXYDRMzhmis8Og/SGeBAaApwnMGV9UnJazegqgeRNfZ/tgmK/E2BA9/vHuLkBofUq7SQmA==
X-Gm-Message-State: AOJu0Ywe9OEjbSh23ZhK22sGDVX/GHD+XChTVgSk1jFGoYZAYSW9F1N6
	crL1xaxxqkPZZhwKVZO5dfRNgs7+6BmHfAz8c5g7xNsXY8hDYIL9W3mYxqyojDmXjPswdE9nwQY
	RUTbWpEpNUT+SJ85qbNp49AO/Sc9r3ya/QHHxkg==
X-Google-Smtp-Source: AGHT+IE5P3IQInC9wWtv70wSp8po3FWb69qqf+bxQ75emaTzlLqrY0LRHyhuBJIuANHnPI7mv7v1ThkTM9vYm3WEo4w=
X-Received: by 2002:a05:6122:2310:b0:4df:261c:fc0c with SMTP id
 71dfb90a1353d-4ed07c12bbcmr1905731e0c.13.1718203627121; Wed, 12 Jun 2024
 07:47:07 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 12 Jun 2024 20:16:55 +0530
Message-ID: <CA+G9fYs7qh=9h5X1hp=7v3zcW9DovJ726x0Bf=8K4_QAOk=2EQ@mail.gmail.com>
Subject: stable-rc: queue_5.10: arch/powerpc/include/asm/uaccess.h:472:4:
 error: implicit declaration of function '__get_user_size' [-Werror,-Wimplicit-function-declaration]
To: linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Powerpc tinyconfig builds started failing on stable-rc queues for
queue_5.10 branch from June 5, 2024.

Please find the build log and related links below.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

powerpc:

  * build/clang-18-tinyconfig
  * build/clang-nightly-tinyconfig
  * build/gcc-12-tinyconfig


Build error:
--------
arch/powerpc/include/asm/uaccess.h:472:4: error: implicit declaration
of function '__get_user_size'
[-Werror,-Wimplicit-function-declaration]
  472 |                         __get_user_size(*(u8 *)to, from, 1, ret);
      |

metadata:
--------
  git_describe: v5.10.218-265-g807add29e709
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc-queues
  git_short_log: 807add29e709 ("SUNRPC: Fix loop termination condition
in gss_free_in_token_pages()")

Links:
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-queues-queue_5.10/build/v5.10.218-265-g807add29e709/testrun/24294414/suite/build/test/clang-18-tinyconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-queues-queue_5.10/build/v5.10.218-265-g807add29e709/testrun/24294414/suite/build/test/clang-18-tinyconfig/log
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-queues-queue_5.10/build/v5.10.218-265-g807add29e709/testrun/24294414/suite/build/test/gcc-12-tinyconfig/details/

--
Linaro LKFT
https://lkft.linaro.org
