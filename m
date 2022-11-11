Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5E1625D10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:31:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81P62qtpz3g4q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:31:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GthpV0+b;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=N5w5QY6e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GthpV0+b;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=N5w5QY6e;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80pN3p1kz3f58
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:16 +1100 (AEDT)
Message-ID: <20221111122015.397739421@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=UuC1MepTqQIaLcqFkObf7DFyoADcBMPY/PEQtFoZlnk=;
	b=GthpV0+bUwZ0On/zDcLYLzsswb8L1Lyf03t32FEBRxX4PnOlz+khlP72rDfyiJ1x9wRgx0
	QZBHxxrL4JkPQLW7wxnFxQQP1C3bGSUtkFuYA7n7ImHn09T6nJKXmSRNq6GMcgez9zHcBr
	/sXuwxE+KMFFbdY6PdL0GaHWRYeq2JTEl73uUqyXZcW+aV/4sFTHIWAWRwSUxCox9LTE9G
	hYCMBp2pxhJCSf4Vrdt9VkoToU9NxPEz3oqd083h7hlHGv5jYqQ13ynW5aQ/L+OWRe7yr0
	HZqb6OTN06vPLw7H/xCHtuHUesG4QYeE53KYO3lB8wsG9XL+fgCEqmcpWHMg5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=UuC1MepTqQIaLcqFkObf7DFyoADcBMPY/PEQtFoZlnk=;
	b=N5w5QY6eUkXGEGiXNQj1Q3SBpVNANVHkPj6Rf+UFoASB2T/i/8da2rW7Kz59cuUMxbBlwY
	9I6yIp/HKRYP4CAQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject:  [patch 31/39] Documentation: PCI: Add reference to PCI/MSI device driver APIs
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 11 Nov 2022 14:55:04 +0100 (CET)
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQWhtZWQgUy4gRGFyd2lzaCA8ZGFyd2lAbGludXRyb25peC5kZT4KCkFsbCBleHBvcnRl
ZCBkZXZpY2UtZHJpdmVyIE1TSSBBUElzIGFyZSBub3cgZ3JvdXBlZCBpbiBvbmUgcGxhY2UgYXQK
ZHJpdmVycy9wY2kvbXNpL2FwaS5jIHdpdGggY29tcHJlaGVuc2l2ZSBrZXJuZWwtZG9jcyBhZGRl
ZC4KClJlZmVyZW5jZSB0aGVzZSBrZXJuZWwtZG9jcyBpbiB0aGUgb2ZmaWNpYWwgUENJL01TSSBo
b3d0by4KClNpZ25lZC1vZmYtYnk6IEFobWVkIFMuIERhcndpc2ggPGRhcndpQGxpbnV0cm9uaXgu
ZGU+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgoK
LS0tCiBEb2N1bWVudGF0aW9uL1BDSS9tc2ktaG93dG8ucnN0IHwgICAxMCArKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQotLS0KLS0tIGEvRG9jdW1lbnRhdGlvbi9Q
Q0kvbXNpLWhvd3RvLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL1BDSS9tc2ktaG93dG8ucnN0CkBA
IC0yODUsMyArMjg1LDEzIEBAIHRvIGJyaWRnZXMgYmV0d2VlbiB0aGUgUENJIHJvb3QgYW5kIHRo
ZQogSXQgaXMgYWxzbyB3b3J0aCBjaGVja2luZyB0aGUgZGV2aWNlIGRyaXZlciB0byBzZWUgd2hl
dGhlciBpdCBzdXBwb3J0cyBNU0lzLgogRm9yIGV4YW1wbGUsIGl0IG1heSBjb250YWluIGNhbGxz
IHRvIHBjaV9hbGxvY19pcnFfdmVjdG9ycygpIHdpdGggdGhlCiBQQ0lfSVJRX01TSSBvciBQQ0lf
SVJRX01TSVggZmxhZ3MuCisKKworTGlzdCBvZiBkZXZpY2UgZHJpdmVycyBNU0koLVgpIEFQSXMK
Kz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisKK1RoZSBQQ0kvTVNJIHN1Ynlz
dGVtIGhhcyBhIGRlZGljYXRlZCBDIGZpbGUgZm9yIGl0cyBleHBvcnRlZCBkZXZpY2UgZHJpdmVy
CitBUElzIOKAlCBgZHJpdmVycy9wY2kvbXNpL2FwaS5jYC4gVGhlIGZvbGxvd2luZyBmdW5jdGlv
bnMgYXJlIGV4cG9ydGVkOgorCisuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9wY2kvbXNpL2FwaS5j
CisgICA6ZXhwb3J0OgoK
