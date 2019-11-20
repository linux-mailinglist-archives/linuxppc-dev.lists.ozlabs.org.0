Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A236A103129
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:31:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HlXl5vpgzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:31:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LgjJuyge"; 
 dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlTl5nBKzDqfC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:15 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id r18so12441921pgu.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dVR6DS1QQF/YzvHjzuQS9yFsVNDkRPFEhh2zMU9GLCI=;
 b=LgjJuygeDoF0EVzmJGs4UBU6IUs6rS5g88v0x4tC6hbFxzPxzTGF1eZD1XcqNIWyw5
 TjzNPmOhwBIRlsEfs5R1IEH+QS9jHxyhUyr4gxrOE7w8A6PgF3QloFQX94LKnQsUd94u
 SLiECxcNmoRmBmY8IH9Jn2UgTTLhY7yWS1ejzO5vAn8pwKJ9xxW3WjiREO0gBiU4OTdQ
 aSlubgmtFR0R/7TuS6+CU1FJMqaDKZf8BlgF2LsacZ7c+6fpQUgR1zKP2CQN1GGMeRa7
 wLK3NegByaebL7EZwbqgvKxEQ/YGrtmaIIRNwEU/aC+kCdkB3asrJ7RNFg+veHNStWhG
 5ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dVR6DS1QQF/YzvHjzuQS9yFsVNDkRPFEhh2zMU9GLCI=;
 b=Sq9KZX/HPQqPK423sH5hftRs+mVZkh8kf7wUwZoQzzVoHbq/IfuXN4Yhum3fUdu17X
 3+p+svxP+tVWQ6dqymmgmu7MQrKETBYu7EVAU2B5YcoQrqmIYjOIno87MmmvVJYDTZn/
 e+tzWw2VTfkQE7ywqk0cuVEGkhXn0JJxtIhBWsAh1Yn/go7sneME3azBTEc6Ca0/f/cK
 cUe+evHEmUW2qXMBPWpIa+ncjSCSGnkZ2cpDUhG5PBLoHvc7+Sf3T6yAJuMaP//vPVDj
 BOyt2Je8l8eDdAzJfe8I7f0Xg4ULXJvSRxwWRvmMF3zwXxbQwPi0tp8r74mbvQ/YZljB
 sI6Q==
X-Gm-Message-State: APjAAAWfPBRe4/HWn76AJoJ/5beNSy1DFi5zcHLFVbh747nUVp/Hk8V/
 nmeZdZcuKOCBrUs7qqPQrui+DGOS
X-Google-Smtp-Source: APXvYqw50JjD73Qb76XsKhj2YCEqrHQ8NrgM3PzMp9dottv5VgZzQfDrwdeWEToUMPGZIpbAQBkGMA==
X-Received: by 2002:a63:9247:: with SMTP id s7mr181505pgn.334.1574213351974;
 Tue, 19 Nov 2019 17:29:11 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:11 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: PCIPOCALYPSE
Date: Wed, 20 Nov 2019 12:28:13 +1100
Message-Id: <20191120012859.23300-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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
Cc: alistair@popple.id.au, s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series does a few things and probably needs to be split into two or
three smaller ones. I figured I'd post it as-is since I'm sick of sitting
on it and some people wanted people to take a look at it. There's three
parts:

1) Reworking EEH to move the "pseudo-generic" into the platform backend.
2) Moving the point where do do PE assignments for PCIe devices out of
   pcibios_setup_bridge() and into pcibios_bus_add_device().
3) Killing the use of pci_dn in powernv entirely.

It used to be a (much) longer series, but bits and pieces of been
upstreamed or at least posted to the list so I've omitted most of the
pre-reqs. Here is a tree you can build based on today's -next with
everything in it:

	https://github.com/oohal/linux/tree/eeh-no-pdn-working

Keep in mind this is all pretty raw and I've tested it on precisely one
P8 PowerNV system. Things not tested:

 -> pseries (not recently anyway)
 -> CAPI
 -> OpenCAPI
 -> Any kind of NVLink

The main TODO is to finish what was started in 2) so that we handle PE
assignments, IOMMU configuration, etc in the same place for each PHB
type. Right now there's three distinct paths:

 1) For normal IODA PHBs (PHB3 and 4) the PE we can assign a device to is
 pinned by the location of it's MMIO BARs. How this is handled depends on
 whether the device is a VF or not, so the two sub cases are:

  a) For normal devices all the devices under a bridge are assigned to a
     PE in a walk done after configuring the bridge window. This causes a
     pile of wierd edge cases when a PCI device is removed without also
     removing it's parent bridge.

  b) For VFs PEs (and MMIO BARs) are assigned when we call sriov_enable() on
     the PF and we "fix up" the software state later on. As a result there's
     some IOMMU group stuff that happens in a bus notifier which runs after
     adding the device to a bus.

 2) For bullshit IODA PHBs (OpenCAPI / NVLink) there is no MMIO pinning
    so we can assign a BDFN to an arbitrary PE. For devices under those
    PEs are assigned in a per-PHB fixup that runs only once at boot,
    just after the the PHB is probed. There doesn't seem to be good
    reason for this and the lack of pinning means we should be able to
    do it whenever.

This series fixes 1a) by moving the PE assignment into
pcibios_bus_add_device(), which is run per-device. With that change
fixing the other two cases should be relatively straight forward. VFs
will probably still require some special casing since their setup
works differently to normal PCI devices, but we should be able to do
better than the current trainwreck of random hacks occuring in random
places.


