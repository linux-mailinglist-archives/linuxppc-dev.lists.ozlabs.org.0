Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B43B02F36BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 18:13:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFcbd6LskzDsgV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 04:13:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=DZu8uG7d; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=AKcWVL8y; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFcQ11q26zDr6L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 04:04:54 +1100 (AEDT)
Message-Id: <20210112170136.078559026@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1610471087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tKnPKgOdjqfVE5gq0YQdeK/yGmcuA2zAsck1bmF/D2g=;
 b=DZu8uG7dTU5Kj0d7WCp3vFU/NgxGwfsBId0ZYpWKrO15VrKfOHQ6VNm/AGD9Py4Zjoack9
 2n+EPNzSvQqfyOwfkk96Z87e4Pq1KmrDUp17O1affQ/OFlq60kvrkgtScr1iU+zVdIkXuK
 m1GyqTRgqqO0eZG6iCqMzaRr1vdmwSNLArKM93EmnsyMUK4caj8oAC6alWjfqVfme4sC/A
 qx6W84y9Q/ntYJbhe9XWeFH2XyVfGdOuRMN8l7qSlw5Yws/H0/dghrl5wfLxZ7RwlyPhW1
 bDTmxl3bJdT7jw3sehfBeQNPG5nsZlR0g4lZxxDRe/u/qWOt47kl3wG1FvJbew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1610471087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tKnPKgOdjqfVE5gq0YQdeK/yGmcuA2zAsck1bmF/D2g=;
 b=AKcWVL8y0uJsz/xWkNM+tA6hNPXTIuoAZNyLRkg4cPuyuS0WZRjVpxmVSK2WtpLZB8fv81
 v0zLeIaJtJQT/5AQ==
Date: Tue, 12 Jan 2021 18:01:36 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 0/4] mm/highmem: Fix fallout from generic kmap_local
 conversions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andreas Larsson <andreas@gaisler.com>, Peter Zijlstra <peterz@infradead.org>,
 Paul Cercueil <paul@crapouillou.net>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VGhlIGttYXBfbG9jYWwgY29udmVyc2lvbiB3cmVja2FnZWQgc3BhcmMsIG1pcHMgYW5kIHBvd2Vy
cGMgYXMgaXQgbWlzc2VkCnNvbWUgb2YgdGhlIGRldGFpbHMgaW4gdGhlIG9yaWdpbmFsIGltcGxl
bWVudGF0aW9uLgoKVGhlIGZvbGxvd2luZyBzZXJpZXMgYWRkcmVzc2VzIHRoYXQuCgpUaGFua3Ms
CgoJdGdseAotLS0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9oaWdobWVtLmggICAgICB8ICAgIDEg
KwogYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9oaWdobWVtLmggICAgIHwgICAgOSArKysrKy0tLS0K
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2hpZ2htZW0uaCB8ICAgIDIgKysKIG1tL2hpZ2ht
ZW0uYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDcgKysrKysrLQogNCBmaWxlcyBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKCg==
