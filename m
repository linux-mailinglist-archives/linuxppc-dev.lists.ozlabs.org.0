Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D36470D99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 23:21:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9ljb3xF8z3cYX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 09:21:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qC+ywnci;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5lxdmWfE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=qC+ywnci; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=5lxdmWfE; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9lfz0bqgz2xtW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 09:18:50 +1100 (AEDT)
Message-ID: <20211210221642.869015045@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639174723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IBbfy8DUMmeX2/DxJ4bxtqprC0vLuk1jWkG3suZ0PZw=;
 b=qC+ywncigd88uX881G7drnWnPitC8LQEDjIxWICRbmx1CnZuuhH2HOM78Mj73Xd+ZCv0Kb
 ncvkjbnzAtbd+ixrpTmp/mZ4pThJranbywfqMLopOdcOEGpsPc6uk3V8xaldwObLZfsa/F
 EQ9V2dZmFKR1bqfNssiazFt8n3Mf+7q1vPMaTRADEfAyYuxcvDch8l/qTyx/UZYaRnEdfG
 107k2ftTZl52fiKXc5XfVwoW5s/CdJw8zCMdv0ss6LKqyYgeRXX/LiA2+XXHlrLhd7JdKS
 +inOsrufS8ZmeqDmP1k3/yTr0mCeJApmaMV52ZYaBfM4TpXhGFC+GjjHRExr/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639174723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IBbfy8DUMmeX2/DxJ4bxtqprC0vLuk1jWkG3suZ0PZw=;
 b=5lxdmWfE59j3yHf4IXX2tpXuGGPaN2BKbOiQcB9ippOtvBNy75YsOs7y6x5FiIbDSi4ZaA
 +C6w+xOR5nRMXFBA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 00/35] genirq/msi, PCI/MSI: Spring cleaning - Part 2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 10 Dec 2021 23:18:43 +0100 (CET)
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
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, Will Deacon <will@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VGhpcyBpcyB0aGUgc2Vjb25kIHBhcnQgb2YgW1BDSV1NU0kgcmVmYWN0b3Jpbmcgd2hpY2ggYWlt
cyB0byBwcm92aWRlIHRoZQphYmlsaXR5IG9mIGV4cGFuZGluZyBNU0ktWCB2ZWN0b3JzIGFmdGVy
IGVuYWJsaW5nIE1TSS1YLgoKVGhpcyBpcyBiYXNlZCBvbiB0aGUgZmlyc3QgcGFydCBvZiB0aGlz
IHdvcmsgd2hpY2ggY2FuIGJlIGZvdW5kIGhlcmU6CgogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDIxMTIwNjIxMDE0Ny44NzI4NjU4MjNAbGludXRyb25peC5kZQoKYW5kIGhhcyBiZWVu
IGFwcGxpZWQgdG86CgogICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90aXAvdGlwLmdpdCBpcnEvbXNpCgoKVGhpcyBzZWNvbmQgcGFydCBoYXMgdGhlIGZv
bGxvd2luZyBpbXBvcnRhbnQgY2hhbmdlczoKCiAgIDEpIENsZWFudXAgb2YgdGhlIE1TSSByZWxh
dGVkIGRhdGEgaW4gc3RydWN0IGRldmljZQoKICAgICAgc3RydWN0IGRldmljZSBjb250YWlucyBh
dCB0aGUgbW9tZW50IHZhcmlvdXMgTVNJIHJlbGF0ZWQgcGFydHMuIFNvbWUKICAgICAgb2YgdGhl
bSAodGhlIGlycSBkb21haW4gcG9pbnRlcikgY2Fubm90IGJlIG1vdmVkIG91dCwgYnV0IHRoZSBy
ZXN0CiAgICAgIGNhbiBiZSBhbGxvY2F0ZWQgb24gZmlyc3QgdXNlLiBUaGlzIGlzIGluIHByZXBh
cmF0aW9uIG9mIGFkZGluZyBtb3JlCiAgICAgIHBlciBkZXZpY2UgTVNJIGRhdGEgbGF0ZXIgb24u
CgogICAyKSBDb25zb2xpZGF0aW9uIG9mIHN5c2ZzIGhhbmRsaW5nCgogICAgICBBcyBhIGZpcnN0
IHN0ZXAgdGhpcyBtb3ZlcyB0aGUgc3lzZnMgcG9pbnRlciBmcm9tIHN0cnVjdCBtc2lfZGVzYwog
ICAgICBpbnRvIHRoZSBuZXcgcGVyIGRldmljZSBNU0kgZGF0YSBzdHJ1Y3R1cmUgd2hlcmUgaXQg
YmVsb25ncy4KCiAgICAgIExhdGVyIGNoYW5nZXMgd2lsbCBjbGVhbnVwIHRoaXMgY29kZSBmdXJ0
aGVyLCBidXQgdGhhdCdzIG5vdCBwb3NzaWJsZQogICAgICBhdCB0aGlzIHBvaW50LgoKICAgMykg
VXNlIFBDSSBkZXZpY2UgcHJvcGVydGllcyBpbnN0ZWFkIG9mIGxvb2tpbmcgdXAgTVNJIGRlc2Ny
aXB0b3JzIGFuZAogICAgICBhbmFseXNpbmcgdGhlaXIgZGF0YS4KCiAgIDQpIFByb3ZpZGUgYSBm
dW5jdGlvbiB0byByZXRyaWV2ZSB0aGUgTGludXggaW50ZXJydXB0IG51bWJlciBmb3IgYSBnaXZl
bgogICAgICBNU0kgaW5kZXggc2ltaWxhciB0byBwY2lfaXJxX3ZlY3RvcigpIGFuZCBjbGVhbnVw
IGFsbCBvcGVuIGNvZGVkCiAgICAgIHZhcmlhbnRzLgoKSXQncyBhbHNvIGF2YWlsYWJsZSBmcm9t
IGdpdDoKCiAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RnbHgvZGV2ZWwuZ2l0IG1zaS12My1wYXJ0LTIKClBhcnQgMyBvZiB0aGlzIGVmZm9ydCBpcyBh
dmFpbGFibGUgb24gdG9wCgogICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90Z2x4L2RldmVsLmdpdCBtc2ktdjMtcGFydC0zCgogICAgIFBhcnQgMyBpcyBu
b3QgZ29pbmcgdG8gYmUgcmVwb3N0ZWQgYXMgdGhlcmUgaXMgbm8gY2hhbmdlIHZzLiBWMi4KClYy
IG9mIHBhcnQgMiBjYW4gYmUgZm91bmQgaGVyZToKCiAgICBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjExMjA2MjEwMzA3LjYyNTExNjI1M0BsaW51dHJvbml4LmRlCgpDaGFuZ2VzIHZlcnN1
cyBWMjoKCiAgLSBVc2UgUENJIGRldmljZSBwcm9wZXJ0aWVzIGluc3RlYWQgb2YgY3JlYXRpbmcg
YSBuZXcgc2V0IC0gSmFzb24KCiAgLSBQaWNrZWQgdXAgUmV2aWV3ZWQvVGVzdGVkL0Fja2VkLWJ5
IHRhZ3MgYXMgYXBwcm9wcmlhdGUKClRoYW5rcywKCgl0Z2x4Ci0tLQogYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9jZWxsL2F4b25fbXNpLmMgICAgICAgICAgICAgIHwgICAgNSAKIGFyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvcHNlcmllcy9tc2kuYyAgICAgICAgICAgICAgICB8ICAgMzggKy0tLQogYXJj
aC94ODYva2VybmVsL2FwaWMvbXNpLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNSAK
IGFyY2gveDg2L3BjaS94ZW4uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MTEgLQogZHJpdmVycy9iYXNlL3BsYXRmb3JtLW1zaS5jICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDE1MiArKysrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL2J1cy9mc2wtbWMvZHByYy1kcml2
ZXIuYyAgICAgICAgICAgICAgICAgICAgfCAgICA4IC0KIGRyaXZlcnMvYnVzL2ZzbC1tYy9mc2wt
bWMtYWxsb2NhdG9yLmMgICAgICAgICAgICAgICB8ICAgIDkgLQogZHJpdmVycy9idXMvZnNsLW1j
L2ZzbC1tYy1tc2kuYyAgICAgICAgICAgICAgICAgICAgIHwgICAyNiArLS0KIGRyaXZlcnMvZG1h
L212X3hvcl92Mi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTYgLS0KIGRyaXZl
cnMvZG1hL3Fjb20vaGlkbWEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNDQgKyst
LS0KIGRyaXZlcnMvZG1hL3RpL2szLXVkbWEtcHJpdmF0ZS5jICAgICAgICAgICAgICAgICAgICB8
ICAgIDYgCiBkcml2ZXJzL2RtYS90aS9rMy11ZG1hLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDE0IC0KIGRyaXZlcnMvaW9tbXUvYXJtL2FybS1zbW11LXYzL2FybS1zbW11LXYzLmMg
ICAgICAgICB8ICAgMjMgLS0KIGRyaXZlcnMvaXJxY2hpcC9pcnEtbWJpZ2VuLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgIDQgCiBkcml2ZXJzL2lycWNoaXAvaXJxLW12ZWJ1LWljdS5jICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEyIC0KIGRyaXZlcnMvaXJxY2hpcC9pcnEtdGktc2NpLWlu
dGEuYyAgICAgICAgICAgICAgICAgICB8ICAgIDIgCiBkcml2ZXJzL21haWxib3gvYmNtLWZsZXhy
bS1tYWlsYm94LmMgICAgICAgICAgICAgICAgfCAgICA5IC0KIGRyaXZlcnMvbmV0L2V0aGVybmV0
L2ZyZWVzY2FsZS9kcGFhMi9kcGFhMi1ldGguYyAgICB8ICAgIDQgCiBkcml2ZXJzL25ldC9ldGhl
cm5ldC9mcmVlc2NhbGUvZHBhYTIvZHBhYTItcHRwLmMgICAgfCAgICA0IAogZHJpdmVycy9uZXQv
ZXRoZXJuZXQvZnJlZXNjYWxlL2RwYWEyL2RwYWEyLXN3aXRjaC5jIHwgICAgNSAKIGRyaXZlcnMv
cGNpL21zaS9pcnFkb21haW4uYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMjAgKysKIGRy
aXZlcnMvcGNpL21zaS9sZWdhY3kuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDYg
CiBkcml2ZXJzL3BjaS9tc2kvbXNpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MTMzICsrKysrKy0tLS0tLS0tLS0KIGRyaXZlcnMvcGNpL3hlbi1wY2lmcm9udC5jICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgIDIgCiBkcml2ZXJzL3BlcmYvYXJtX3NtbXV2M19wbXUuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgICA1IAogZHJpdmVycy9zb2MvZnNsL2RwaW8vZHBpby1k
cml2ZXIuYyAgICAgICAgICAgICAgICAgIHwgICAgOCAtCiBkcml2ZXJzL3NvYy90aS9rMy1yaW5n
YWNjLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA2IAogZHJpdmVycy9zb2MvdGkvdGlf
c2NpX2ludGFfbXNpLmMgICAgICAgICAgICAgICAgICAgIHwgICAyMiAtLQogZHJpdmVycy92Zmlv
L2ZzbC1tYy92ZmlvX2ZzbF9tY19pbnRyLmMgICAgICAgICAgICAgIHwgICAgNCAKIGluY2x1ZGUv
bGludXgvZGV2aWNlLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMjUgKystCiBp
bmNsdWRlL2xpbnV4L2ZzbC9tYy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA0
IAogaW5jbHVkZS9saW51eC9tc2kuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICA5NSArKysrLS0tLS0tLS0KIGluY2x1ZGUvbGludXgvcGNpLmggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgIDEgCiBpbmNsdWRlL2xpbnV4L3NvYy90aS90aV9zY2lfaW50YV9t
c2kuaCAgICAgICAgICAgICAgfCAgICAxIAoga2VybmVsL2lycS9tc2kuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDE1OCArKysrKysrKysrKysrKystLS0tLQogMzUgZmls
ZXMgY2hhbmdlZCwgNDI5IGluc2VydGlvbnMoKyksIDQ1OCBkZWxldGlvbnMoLSkKCg==
