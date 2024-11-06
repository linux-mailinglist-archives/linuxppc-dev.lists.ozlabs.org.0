Return-Path: <linuxppc-dev+bounces-2903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CD49BE19E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 10:04:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xjzlh73Grz3028;
	Wed,  6 Nov 2024 20:04:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730883840;
	cv=none; b=oQFp5UwG/mUL5qAmkApCNqPGaPwHV6gL8Gab+i6L+xXCQib0J9AJu8cYQT1Rh+naJeyxI5mD+rh5GhmLdy017lHJ2xOqiBFsLh+afugeWXV2abkSBxH5uz/rh7fG13Ydrj8t+dKnWCRbDNcTySDYfqUU3IzG8y+Qwjdyc2lj4fJwOs7WNDAVPjvRK86tWaAwE0bPtVG7SmzAw/zhZLOl2qsWrxq1Y2tFc73o2iRK4MLntBwsU+yPCifOHvelf9SLsvJ7rQj4/GpD9xoNRswKQp9IdfCmLBxUMh9bTtEH8HN6n6LOE5juMgKZ7dyjWoL9Vx0B9C6+T8OBCUVsX/35rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730883840; c=relaxed/relaxed;
	bh=/VbmmPghqrzkfDXHRbkEgFY7wgZZwTeBy4+zs3iLQME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h9Z6w9vLiN12RkKKEwRuZxkL13IUWBwoK/IJex7Eg2bk3UCmaMk7936mHoIZVzxtFxaK2WIZuOuVuJ2gdcB3AwTgVI90Z9d2Kiqg+klyrGKtDCNy4N3uTG0swcwCHJv7vS9SHr3D+S7GTQrMBOFpqITvV4WXT5rgCC1DezLg975VzA0WCKyW38t5WKXHHffCK23WxDjIDInszzLiu2gAoPbMkP8RQDOpx4+M831bt5B6Nq64OPjDnjAyCOEMF29WmfKnlFJv8rerAEJda7vBU4oc2h/Ms5NWGVUt9tcetu2Ico1akzMYRM/KfpyO8nPtHL9kbYBwRIfOS8NC6CBniA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EvKoKn7t; dkim-atps=neutral; spf=pass (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EvKoKn7t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xjzlf42bCz2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 20:03:56 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730883832; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=/VbmmPghqrzkfDXHRbkEgFY7wgZZwTeBy4+zs3iLQME=;
	b=EvKoKn7tm41fmIj9SPhD3gkuUpZsf1yBuFqKC7V6x0VIfyecfcVqhDoVbueV/GACXaQQh/EpJEnHXaSoBzFlkqEAYYXZCf47wyZqrC4IXt4hyxdyJ4gIeHpgQZM2La3M8Ec0tsf60KWVGvA/kJxPD2bnU0iLoJFod6CBlseINPw=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WIqmpCP_1730883829 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 06 Nov 2024 17:03:50 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: bhelgaas@google.com,
	mahesh@linux.ibm.com,
	oohall@gmail.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	xueshuai@linux.alibaba.com
Subject: [RFC PATCH v1 0/2] PCI/AER: report fatal errors of RCiEP and EP if link recoverd
Date: Wed,  6 Nov 2024 17:03:37 +0800
Message-ID: <20241106090339.24920-1-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.44.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The AER driver has historically avoided reading the configuration space of an
endpoint or RCiEP that reported a fatal error, considering the link to that
device unreliable. Consequently, when a fatal error occurs, the AER and DPC
drivers do not report specific error types, resulting in logs like:

[  245.281980] pcieport 0000:30:03.0: EDR: EDR event received
[  245.287466] pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
[  245.295372] pcieport 0000:30:03.0: DPC: ERR_FATAL detected
[  245.300849] pcieport 0000:30:03.0: AER: broadcast error_detected message
[  245.307540] nvme nvme0: frozen state error detected, reset controller
[  245.722582] nvme 0000:34:00.0: ready 0ms after DPC
[  245.727365] pcieport 0000:30:03.0: AER: broadcast slot_reset message

But, if the link recovered after hot reset, we can safely access AER status of
the error device. In such case, report fatal error which helps to figure out the
error root case.

- Patch 1/2 identifies the error device by SOURCE ID register
- Patch 2/3 reports the AER status if link recoverd.

After this patch set, the logs like:

[  414.356755] pcieport 0000:30:03.0: EDR: EDR event received
[  414.362240] pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
[  414.370148] pcieport 0000:30:03.0: DPC: ERR_FATAL detected
[  414.375642] pcieport 0000:30:03.0: AER: broadcast error_detected message
[  414.382335] nvme nvme0: frozen state error detected, reset controller
[  414.645413] pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
[  414.788016] nvme 0000:34:00.0: ready 0ms after DPC
[  414.796975] nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
[  414.807312] nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
[  414.815305] nvme 0000:34:00.0:    [ 4] DLP                    (First)
[  414.821768] pcieport 0000:30:03.0: AER: broadcast slot_reset message

Shuai Xue (2):
  PCI/AER: run recovery on device that detected the error
  PCI/AER: report fatal errors of RCiEP and EP if link recoverd

 drivers/pci/pci.h      |  3 ++-
 drivers/pci/pcie/aer.c | 50 ++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pcie/dpc.c | 30 ++++++++++++++++++++-----
 drivers/pci/pcie/edr.c | 35 +++++++++++++++--------------
 drivers/pci/pcie/err.c |  6 +++++
 5 files changed, 100 insertions(+), 24 deletions(-)

-- 
2.39.3


