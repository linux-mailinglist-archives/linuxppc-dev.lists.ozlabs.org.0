Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6514A2C76
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 08:25:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jm5TZ21VTz3bbW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 18:25:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WOuM/rN3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WOuM/rN3; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jm5Sx5zLbz2x9g
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 18:25:20 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id s16so7177738pgs.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 23:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7elEtC38Xr0AufcFIotDQ6aLYzZaegBw7JB0XN5zN4c=;
 b=WOuM/rN3KY2MxlAHwn1j3Ie/TA7xtTeFKpXaRptJY8Bw9BzlsEnht/CmAkwtl0zzK5
 FajFCqDy3JHXEIgd2jkKe4mJjvQKSC9F4T7kGdJHHqTLgtW6Bi0CeIGBt71vpc9i5U59
 aX80IwkK69epyhVT/VnlulcLz6WKv+m2z7IOBeOdhgXZ5DA3+r1mgQshXsVLvIXqdd5K
 Ljp+RKVFzlTlHc/mKxcC0Mdm+L5FkMXHclm2wuWxDfDEnC/PhwUYQBv1qWrgTVoSdQUm
 GxXpXIXE73NAnGyOt+Tt0k6wEVn7FWrXRjUbOzioJ4oyFfneYguywFx52VZUCM0MKKwL
 LAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7elEtC38Xr0AufcFIotDQ6aLYzZaegBw7JB0XN5zN4c=;
 b=WTgHYCmRc3yirasEJot4r35YpzWIFYpAyR+q4vVCI+BWyl/hY0jjD1YUsJ7xLYne5i
 CpJmLbYen+3qB3Gv7dRRU2lZYGsFU/Yv9IEhrNv7TZLIKMUjf2p1brU9HcZATu1CylI5
 Ktgnx0pw2Gi7AnO+bTDiV2hOepIYpmgrf+gyRSNdltqPG1E9PeYu2Bm9yUM2zaRsXBPf
 l+uTyu9IocF6ccnVmKFGYJSBkufa8PrfGHOrx4jkjY/XP7AhW/caYXAO+a8zEOGExCRz
 VsipX0KIFhp1dGMhvBheZeckUV7s6Y789ueozEiDVBgKDlBLe3sIlhbZ77P2pa8gbUzw
 bm5g==
X-Gm-Message-State: AOAM5333dmB1ZxDW1naJlXf5bpcgWpkaTKpC59VfXwTontFKQwZ9+ASD
 PSqeOMTNJ4UiHgIGkOzv09RfS/lCSlUsDg==
X-Google-Smtp-Source: ABdhPJw/uwS1qFvw3SmFIzs51TaLo+yTvwJCrSm5jE4XGQeiJ3/s12qBREsZB7KYXzyZvOwL8LY28g==
X-Received: by 2002:a05:6a00:23ce:: with SMTP id
 g14mr11150747pfc.78.1643441117978; 
 Fri, 28 Jan 2022 23:25:17 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.111.178.100])
 by smtp.gmail.com with ESMTPSA id 12sm3917449pgb.71.2022.01.28.23.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 23:25:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] KVM: PPC: Book3S PR: Fixes for AIL and SCV
Date: Sat, 29 Jan 2022 17:25:09 +1000
Message-Id: <20220129072511.105523-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The first patch in this series fixes a KVM PR host crash due to a
guest executing the scv instruction or with a pseries SMP host, the
host CPUs executing the scv instruction while a PR guest is running.

The second patch fixes unimplemented H_SET_MODE AIL modes by returning
failure from the hcall rather than succeeding but not implementing
the required behaviour. This works around missing host scv support for
scv-capable Linux guests by causing them to disable the facility.

Still looking at doing a proper capability for QEMU/KVM so we can get
consistency between HV, PR, and TCG. That shouldn't change these
patches though.

Thanks,
Nick

Nicholas Piggin (2):
  KVM: PPC: Book3S PR: Disable SCV when AIL could be disabled
  KVM: PPC: Book3S PR: Disallow AIL != 0

 arch/powerpc/kernel/exceptions-64s.S |  4 ++++
 arch/powerpc/kernel/setup_64.c       | 28 ++++++++++++++++++++++++++++
 arch/powerpc/kvm/Kconfig             |  9 +++++++++
 arch/powerpc/kvm/book3s_pr.c         | 20 ++++++++++++++------
 arch/powerpc/kvm/book3s_pr_papr.c    | 20 ++++++++++++++++++++
 5 files changed, 75 insertions(+), 6 deletions(-)

-- 
2.23.0

