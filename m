Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F345FB3B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 02:34:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1Dfk5Ytgz3fqb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 12:34:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hN+4spS3;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ioOSz9Cw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=hN+4spS3; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=ioOSz9Cw; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1DKp4x6dz3cZJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 12:19:26 +1100 (AEDT)
Message-ID: <20211126222700.862407977@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dz+OhqNvUr9qcj4hBHSmJm3StmH1ayKUMDsS7c1/nyo=;
 b=hN+4spS3TMXDkqfUqEmJ9Q/KMS5D3jtlbPyy5sFM0vzt9tJ3OucTlyqxTh7IuZUj2aDMLU
 ZDeZKf2CAQVkg9z9CU43DNWnFg3/7hrZysWDOJqScxW19/nlOEosiGVfhdaSnv61zNTAq3
 g8lkERFO5y4Qc+o4XLLxHi0GiCVc5ZuC7/w5ZICrpMqUWqvGnO0bJ0nL9cfQwryG/4zhht
 TimG/GUiuetxcX9A8Nd/BSKpP30RdpOJ9eS1hnRikPx67uOv2VP1PtM5IklK87WgluDjxQ
 Eo7Kjh8fdnYYl56I9o1wJZcBbTmg2/I87rdi9HCQOAll7+/Yqf8ukFR78eJhvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dz+OhqNvUr9qcj4hBHSmJm3StmH1ayKUMDsS7c1/nyo=;
 b=ioOSz9CwpOLy5rcIumddu0bfOCT14ff5PEJyDJRFQjcGIrrDsZc99q5ItizXds9+ZxdIaJ
 E+I1dFNX0j5JSrBg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 00/22] genirq/msi, PCI/MSI: Spring cleaning - Part 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sat, 27 Nov 2021 02:19:20 +0100 (CET)
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
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Megha Dey <megha.dey@intel.com>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VGhlIFtQQ0ldIE1TSSBjb2RlIGhhcyBnYWluZWQgcXVpdGUgc29tZSB3YXJ0cyBvdmVyIHRpbWUu
IEEgcmVjZW50CmRpc2N1c3Npb24gdW5lYXJ0aGVkIGEgc2hvcnRjb21pbmc6IHRoZSBsYWNrIG9m
IHN1cHBvcnQgZm9yIGV4cGFuZGluZwpQQ0kvTVNJLVggdmVjdG9ycyBhZnRlciBpbml0aWFsaXph
dGlvbiBvZiBNU0ktWC4KClBDSS9NU0ktWCBoYXMgbm8gcmVxdWlyZW1lbnQgdG8gc2V0dXAgYWxs
IHZlY3RvcnMgd2hlbiBNU0ktWCBpcyBlbmFibGVkIGluCnRoZSBkZXZpY2UuIFRoZSBub24tdXNl
ZCB2ZWN0b3JzIGhhdmUganVzdCB0byBiZSBtYXNrZWQgaW4gdGhlIHZlY3Rvcgp0YWJsZS4gRm9y
IFBDSS9NU0kgdGhpcyBpcyBub3QgcG9zc2libGUgYmVjYXVzZSB0aGUgbnVtYmVyIG9mIHZlY3Rv
cnMKY2Fubm90IGJlIGNoYW5nZWQgYWZ0ZXIgaW5pdGlhbGl6YXRpb24uCgpUaGUgUENJL01TSSBj
b2RlLCBidXQgYWxzbyB0aGUgY29yZSBNU0kgaXJxIGRvbWFpbiBjb2RlIGFyZSBidWlsdCBhcm91
bmQKdGhlIGFzc3VtcHRpb24gdGhhdCBhbGwgcmVxdWlyZWQgdmVjdG9ycyBhcmUgaW5zdGFsbGVk
IGF0IGluaXRpYWxpemF0aW9uCnRpbWUgYW5kIGZyZWVkIHdoZW4gdGhlIGRldmljZSBpcyBzaHV0
IGRvd24gYnkgdGhlIGRyaXZlci4KClN1cHBvcnRpbmcgZHluYW1pYyBleHBhbnNpb24gYXQgbGVh
c3QgZm9yIE1TSS1YIGlzIGltcG9ydGFudCBmb3IgVkZJTyBzbwp0aGF0IHRoZSBob3N0IHNpZGUg
aW50ZXJydXB0cyBmb3IgcGFzc3Rocm91Z2ggZGV2aWNlcyBjYW4gYmUgaW5zdGFsbGVkIG9uCmRl
bWFuZC4KClRoaXMgaXMgdGhlIGZpcnN0IHBhcnQgb2YgYSBsYXJnZSAodG90YWwgMTAxIHBhdGNo
ZXMpIHNlcmllcyB3aGljaApyZWZhY3RvcnMgdGhlIFtQQ0ldTVNJIGluZnJhc3RydWN0dXJlIHRv
IG1ha2UgcnVudGltZSBleHBhbnNpb24gb2YgTVNJLVgKdmVjdG9ycyBwb3NzaWJsZS4gVGhlIGxh
c3QgcGFydCAoMTAgcGF0Y2hlcykgcHJvdmlkZSB0aGlzIGZ1bmN0aW9uYWxpdHkuCgpUaGUgZmly
c3QgcGFydCBpcyBtb3N0bHkgYSBjbGVhbnVwIHdoaWNoIGNvbnNvbGlkYXRlcyBjb2RlLCBtb3Zl
cyB0aGUgUENJCk1TSSBjb2RlIGludG8gYSBzZXBhcmF0ZSBkaXJlY3RvcnkgYW5kIHNwbGl0cyBp
dCB1cCBpbnRvIHNldmVyYWwgcGFydHMuCgpObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZCBl
eGNlcHQgZm9yIHBhdGNoIDIvTiB3aGljaCBjaGFuZ2VzIHRoZQpiZWhhdmlvdXIgb2YgcGNpX2dl
dF92ZWN0b3IoKS9hZmZpbml0eSgpIHRvIGdldCByaWQgb2YgdGhlIGFzc3VtcHRpb24gdGhhdAp0
aGUgcHJvdmlkZWQgaW5kZXggaXMgdGhlICJpbmRleCIgaW50byB0aGUgZGVzY3JpcHRvciBsaXN0
IGluc3RlYWQgb2YgdXNpbmcKaXQgYXMgdGhlIGFjdHVhbCBNU0lbWF0gaW5kZXggYXMgc2VlbiBi
eSB0aGUgaGFyZHdhcmUuIFRoaXMgd291bGQgYnJlYWsKdXNlcnMgb2Ygc3BhcnNlIGFsbG9jYXRl
ZCBNU0ktWCBlbnRyaWVzLCBidXQgbm9uIG9mIHRoZW0gdXNlIHRoZXNlCmZ1bmN0aW9ucy4KClRo
ZSBzZXJpZXMgaXMgYmFzZWQgb24gNS4xNi1yYzIgYW5kIGFsc28gYXZhaWxhYmxlIHZpYSBnaXQ6
CgogICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90Z2x4
L2RldmVsLmdpdCBtc2ktdjEtcGFydC0xCgpGb3IgdGhlIGN1cmlvdXMgd2hvIGNhbid0IHdhaXQg
Zm9yIHRoZSBuZXh0IHBhcnQgdG8gYXJyaXZlIHRoZSBmdWxsIHNlcmllcwppcyBhdmFpbGFibGUg
dmlhOgoKICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dGdseC9kZXZlbC5naXQgbXNpLXYxLXBhcnQtNAoKVGhhbmtzLAoKCXRnbHgKLS0tCiBhcmNoL3Bv
d2VycGMvcGxhdGZvcm1zLzR4eC9tc2kuYyAgICAgICAgICAgIHwgIDI4MSAtLS0tLS0tLS0tLS0K
IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3BjaS9wY2kucnN0ICAgICAgfCAgICAyIAogYi9h
cmNoL21pcHMvcGNpL21zaS1vY3Rlb24uYyAgICAgICAgICAgICAgICB8ICAgMzIgLQogYi9hcmNo
L3Bvd2VycGMvcGxhdGZvcm1zLzR4eC9NYWtlZmlsZSAgICAgICB8ICAgIDEgCiBiL2FyY2gvcG93
ZXJwYy9wbGF0Zm9ybXMvY2VsbC9heG9uX21zaS5jICAgIHwgICAgMiAKIGIvYXJjaC9wb3dlcnBj
L3BsYXRmb3Jtcy9wb3dlcm52L3BjaS1pb2RhLmMgfCAgICA0IAogYi9hcmNoL3Bvd2VycGMvcGxh
dGZvcm1zL3BzZXJpZXMvbXNpLmMgICAgICB8ICAgIDYgCiBiL2FyY2gvcG93ZXJwYy9zeXNkZXYv
S2NvbmZpZyAgICAgICAgICAgICAgIHwgICAgNiAKIGIvYXJjaC9zMzkwL3BjaS9wY2lfaXJxLmMg
ICAgICAgICAgICAgICAgICAgfCAgICA0IAogYi9hcmNoL3NwYXJjL2tlcm5lbC9wY2lfbXNpLmMg
ICAgICAgICAgICAgICB8ICAgIDQgCiBiL2FyY2gveDg2L2h5cGVydi9pcnFkb21haW4uYyAgICAg
ICAgICAgICAgIHwgICA1NSAtLQogYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ODZfaW5pdC5oICAg
ICAgICAgICB8ICAgIDYgCiBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9oeXBlcnZpc29yLmgg
ICAgIHwgICAgOCAKIGIvYXJjaC94ODYva2VybmVsL2FwaWMvbXNpLmMgICAgICAgICAgICAgICAg
fCAgICA4IAogYi9hcmNoL3g4Ni9rZXJuZWwveDg2X2luaXQuYyAgICAgICAgICAgICAgICB8ICAg
MTIgCiBiL2FyY2gveDg2L3BjaS94ZW4uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxOSAK
IGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjJtLmMgICAgICAgICAgICAgfCAgICAxIAogYi9k
cml2ZXJzL2lycWNoaXAvaXJxLWdpYy12My1pdHMtcGNpLW1zaS5jICB8ICAgIDEgCiBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtZ2ljLXYzLW1iaS5jICAgICAgICAgIHwgICAgMSAKIGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYyAgICAgfCAgICAyIAogYi9kcml2ZXJzL3BjaS9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgIDMgCiBiL2RyaXZlcnMvcGNpL21zaS9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgICAgNyAKIGIvZHJpdmVycy9wY2kvbXNpL2lycWRv
bWFpbi5jICAgICAgICAgICAgICAgfCAgMjY3ICsrKysrKysrKysrCiBiL2RyaXZlcnMvcGNpL21z
aS9sZWdhY3kuYyAgICAgICAgICAgICAgICAgIHwgICA3OSArKysKIGIvZHJpdmVycy9wY2kvbXNp
L21zaS5jICAgICAgICAgICAgICAgICAgICAgfCAgNjQ1ICsrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIGIvZHJpdmVycy9wY2kvbXNpL21zaS5oICAgICAgICAgICAgICAgICAgICAgfCAgIDM5
ICsKIGIvZHJpdmVycy9wY2kvbXNpL3BjaWRldl9tc2kuYyAgICAgICAgICAgICAgfCAgIDQzICsK
IGIvZHJpdmVycy9wY2kvcGNpLXN5c2ZzLmMgICAgICAgICAgICAgICAgICAgfCAgICA3IAogYi9k
cml2ZXJzL3BjaS94ZW4tcGNpZnJvbnQuYyAgICAgICAgICAgICAgICB8ICAgIDIgCiBiL2luY2x1
ZGUvbGludXgvbXNpLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDEzNSArKy0tLQogYi9pbmNs
dWRlL2xpbnV4L3BjaS5oICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgCiBiL2tlcm5lbC9p
cnEvbXNpLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0MSArCiAzMiBmaWxlcyBjaGFu
Z2VkLCA2OTYgaW5zZXJ0aW9ucygrKSwgMTAyOCBkZWxldGlvbnMoLSkK
