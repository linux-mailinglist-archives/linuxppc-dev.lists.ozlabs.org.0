Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6088468B0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 07:58:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TsfH7z69;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR67V5tk5z3dCV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 17:58:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TsfH7z69;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TR66k0k1mz3c57
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 17:58:04 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d928a8dee8so20120775ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 22:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857080; x=1707461880; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/vDd2wgYFMcjNJFhzb4jvCxGWjleUG2mUvo4O12Bto=;
        b=TsfH7z69ri0FpR+0xWf1NKiJKEkqU2rAnHWCab90cWFdjEN/FeRbTwN6BuT1AFVaI+
         iMvUa56AJHuOVHBLeE2Z6v2PFPu/Ed+HeLVV+BEvpPOQe7W/QughoBNB1hkzA3enTm6L
         b9LfOMFgL1dCJYDnLjBPUXIkWepo34FG+Gq1NF6wQy1WOBXXN64rCcBiVtjmnd72XoMQ
         +nhs+LJO9kvpHG1+66R1xrwZpaUfcMyhOxhbjOriXgolOv4+0a2FI18Ki3/fnWLoXKW2
         6IQ22XVhk9vD/P85F0H/E69XY9j/koqruGJgHjnTGmz4ItV2DJYCWS0rFEHPNTLAAPMu
         nRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857080; x=1707461880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/vDd2wgYFMcjNJFhzb4jvCxGWjleUG2mUvo4O12Bto=;
        b=iNyBtQnbZ5wfXS0jxTnWBmpipnryojgdNFvA4C/Xri8OZEd4FUc0/UblfO+BzEWHyn
         kqIKOkyxlW74p+hWrHo4LyxLudZjIxPrJXbPCF5h0Xza6bC34mMVFOZYzNQPGlXmfR+/
         98aml9nduUX0J+mLJua3HT06U7cS5lzqUPjC16ROoJmNqY3vijqZuAvtghkUOVttBeuX
         nj5eRCiDXO3DaU2istBH3wdju9rDJUye93QzLwiQ6UsT7XxOKAggaVnOIp0xqB3fzuLn
         dHJYZoCsI9oHYUHREWjNWMyaX/gYet7EEXcl+QDGWEVZiyvcrHvycAgFtH/Jq/3ADDCy
         G4+g==
X-Gm-Message-State: AOJu0Ywk9u0x3XfgiOgLSON/W1j0iJ7xuuy4yAHzrjb+/oU+LSnECm8B
	mkC1tc8HaJSUnVoRedNop5CcBSDvmHdMy6g+sVbIjKxIN/HHW3Vi
X-Google-Smtp-Source: AGHT+IGvWMO95PcN7pxJxhTwc5bvzblFArUoEi14KMGjTdeCja7Ua1kX5fGYBB4wx1ubSAWO93T2uQ==
X-Received: by 2002:a17:902:d511:b0:1d3:f344:6b01 with SMTP id b17-20020a170902d51100b001d3f3446b01mr2424651plg.3.1706857080038;
        Thu, 01 Feb 2024 22:58:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUPuBFBBUlP1POmXUq/7h79MjiGh3Fb+mUy8N0UtV29d36M8bpCkahEq2fBI12IF+E2V3w2wkb1AY1J5N5Mq6dcaLElXt9euCwD1asMtGBMENTsh3t5qRBApH9FJ27tgAzBxPBOWVbeN6j11hEQBnq8Kq/gtoGDRUHPovJP7hSkwpRmKAtFnJj23Xwc80WxpIBcbcOUV3n5D1fLgw24RKKZeuGdKUg0zDQ0L3JhuH8IaHVQ49tNvfe15pQylzqD8MMSviLW6EJpNB/DoyUOkkoK5tsxuSw9lHUNsmEnp5VL/preOc20OLi5OINKuq2J+OPc47YeqUuthIys4aGZ8sl2UvynTs6wt6kBRSRWWEMGuqCzVn6rWU8ff3+rbGssrIqWwuoXklN4c8qymt7QvGw4skVzrFDlYLKgqcIbW5+3RKwhZhhZkKJUBIFnhKxaSc4pKaDkzsHezYbgD6ndnKL66CEeMswERnvxbjl1AddT5WEz4nIAsiOt0WXb67q+R7UCUihOY5LvYpI=
Received: from wheely.local0.net ([1.146.53.155])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903209200b001d948adc19fsm905734plc.46.2024.02.01.22.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:57:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v2 0/9] Multi-migration support
Date: Fri,  2 Feb 2024 16:57:31 +1000
Message-ID: <20240202065740.68643-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There were not many comments on the previous post last year, so
this a rebase and resend. No significant change to migration patches,
but this rebases on Marc's better fix for cleaning auxinfo. So that
s390 patch is dropped, but added a minor fix for it instead :).

Multi migration works fine. And arm now has a reason to implement a
a getchar that can run more than 15 times.

Thanks,
Nick

Nicholas Piggin (9):
  (arm|powerpc|s390x): Makefile: Fix .aux.o generation
  arch-run: Clean up temporary files properly
  arch-run: Clean up initrd cleanup
  migration: use a more robust way to wait for background job
  migration: Support multiple migrations
  arch-run: rename migration variables
  migration: Add quiet migration support
  Add common/ directory for architecture-independent tests
  migration: add a migration selftest

 arm/Makefile.common         |   3 +-
 arm/sieve.c                 |   2 +-
 arm/unittests.cfg           |   6 ++
 common/selftest-migration.c |  34 +++++++
 common/sieve.c              |  51 ++++++++++
 lib/migrate.c               |  20 +++-
 lib/migrate.h               |   2 +
 powerpc/Makefile.common     |   3 +-
 powerpc/unittests.cfg       |   4 +
 s390x/Makefile              |   3 +-
 s390x/sieve.c               |   2 +-
 s390x/unittests.cfg         |   4 +
 scripts/arch-run.bash       | 181 ++++++++++++++++++++++++++----------
 x86/sieve.c                 |  52 +----------
 14 files changed, 260 insertions(+), 107 deletions(-)
 create mode 100644 common/selftest-migration.c
 create mode 100644 common/sieve.c
 mode change 100644 => 120000 x86/sieve.c

-- 
2.42.0

