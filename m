Return-Path: <linuxppc-dev+bounces-13494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D543C19709
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 10:44:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxMl75tkFz3bfN;
	Wed, 29 Oct 2025 20:44:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:c206:3008:6895::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761731043;
	cv=none; b=eGjDUfSL8s8YdKejdddmXWD60NxlUv2JC3NFU8gBwBjND+moT6+PXa84rPCz4Wolry79yN7Sf0IRLPz005959jG4t9fGbnLv3V+hsTxPUJxMowCZpkgqdQCTYVdMY63EvtukILvxZFEk1LOUbh8WwuGzRE7v2/RUsGmBjFk6x27d3iDp6hueSEWPA3KwUojTV/qGlw0d90NuISDNh6zgLNTP5oEv18zId6LFnbkdiC9DxoPqh0BMB9AGr2iNamPhpTvX7UbgpdlIjTo8ioFa2KO7qNX/zZBw4+gyeZ+QoXFOhp6JF07BZ3SJDdyqtfTWq/emb0nfkncuhB9Vx/vnzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761731043; c=relaxed/relaxed;
	bh=M5YA5nGvpypfGYGPEHuR4uia7ULlbYmJYNHdL77eqgY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=NhOEVV00OgWqABxTvLhI9Im1Og/G8A0jEEDRwyA0g33KZPtpmWsPNBvyC2QL6V84hDpTA36d0mAYwzk5haRhygJvtIHULk6Ph6mThLJcOntbMR4MTu+WcVEjd6sqPalPKdkJJVi/dcc/HKBZ/BSPGHVk/bFF6QqtHGcqo7NLE5NcIefKK43oWyOH/vTGN4Vej8bRt1Y4Ke4bm0N11egvYF9ij8JUAcQnVvPDuKj0iTUA8M9TaXJor4Gu967BicJwO3yguDMN6cBK3ObZnNA7WHfq9498ADtnv9bIbs03D/dTtnTzUopS6AZR9s7Yy9oqHNMWAB7r5aSQzf5XCU0BDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass (client-ip=2a02:c206:3008:6895::1; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org) smtp.mailfrom=hogyros.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hogyros.de (client-ip=2a02:c206:3008:6895::1; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org)
Received: from psionic.psi5.com (psionic.psi5.com [IPv6:2a02:c206:3008:6895::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxMl65wbsz30hP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 20:44:00 +1100 (AEDT)
Received: from [192.168.10.92] (unknown [39.110.247.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id CB06D3F11A
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 10:43:55 +0100 (CET)
Message-ID: <03a03e41-caf4-441f-9dcd-ed81b420e074@hogyros.de>
Date: Wed, 29 Oct 2025 18:43:48 +0900
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
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
From: Simon Richter <Simon.Richter@hogyros.de>
Subject: Missing interrupt for MEI on Intel Xe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

I have an Intel B580 GPU inside a POWER9 (TalosII) system, and the 
embedded management engine fails to start with

[    6.867316] mei_gsc xe.mei-gscfi.3146496: error -EINVAL: 
request_irq(96) mei_me_irq_quick_handler [mei_me] 
mei_me_irq_thread_handler [mei_me] mei_gsc
[    6.867346] mei_gsc xe.mei-gscfi.3146496: irq register failed -22
[    6.867368] mei_gsc xe.mei-gscfi.3146496: probe failed: -22
[    6.867377] mei_gsc xe.mei-gscfi.3146496: probe with driver mei_gsc 
failed with error -22

According to /proc/interrupts, irq 96 does not exist, there is only 95 
(xe) and 97 (snd_hda_intel:card0), so it appears the number has been 
reserved somehow, but something stops us from attaching to it.

The closest thing to a clue I have is

[    6.845878] pci 0030:02:01.0: Failed to create device link (0x124) 
with supplier 0.interrupt-controller for 
/pciex@620c3c0000000/pci@0/pci@0/pci@1
[    6.845959] pci 0030:01:00.0: Failed to create device link (0x124) 
with supplier 0.interrupt-controller for /pciex@620c3c0000000/pci@0/pci@0
[    6.846010] pci 0030:00:00.0: Failed to create device link (0x124) 
with supplier 0.interrupt-controller for /pciex@620c3c0000000/pci@0

This might need the eyes of someone who understands interrupt routing on 
OpenFirmware.

Other observations from last week's debugging session:

1. If I add a few printf to the device_link code, it appears creating 
the link fails because a link already exists in the other direction.
2. The bridges in between do not have pcieport attached to them, as the 
driver is disabled by pcie_ports_disabled = true;

    Simon

