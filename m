Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D26745F7F3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 02:20:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1DLj3RwFz3dbs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 12:20:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DCccYnZ0;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=l69jhsGH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=DCccYnZ0; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=l69jhsGH; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1DK05kcWz2xC3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 12:18:44 +1100 (AEDT)
Message-ID: <20211126222700.862407977@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yycwdrBPyffnUpJMIEsWOSM4kLQ6cxBvXzwUm35xG8E=;
 b=DCccYnZ0yiKVC0u4+n9H7FGmyRWRAGxhw5lrXeLif2IGAZr2rY9i+43Gc7Jsnud/oidZaZ
 LrE05UjXTCVSyDbmgOY0HxqDRbgAp4/y2qAPiBbi9Kif3xh1IRuv+y3cBqvYsowoPm/WUk
 on0YrcUZq1Cix85vFTL/gxX7VMgOIB65lC5o4RFDq43U76Ck4A4DQQ8l0aK00NPb8MNzf1
 +R+QnmSKpPY5SIbzSJT2d2nsAUVEpzoB+W6mglKPZfD5NcRonwy3W9aAXRIOuuFkxKApoo
 q69j8LzAaUKTG+q9KEnL6HEfmmniRk/WIf4JJGwI6N1sJcqzmoeXfX/O3IGlFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yycwdrBPyffnUpJMIEsWOSM4kLQ6cxBvXzwUm35xG8E=;
 b=l69jhsGH0nQzlU5HDD675NHbpXuRhbgyrkanFSndKRF1Uq0JyAqp7+zU1xeEBSXpgtUx6d
 EqGASFw1EGmh4PDQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 00/22] genirq/msi, PCI/MSI: Spring cleaning - Part 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sat, 27 Nov 2021 02:18:34 +0100 (CET)
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
aXMgc2VyaWVzIGlzIGJhc2VkIG9uIDUuMTYtcmMyIGFuZCBhbHNvIGF2YWlsYWJsZSB2aWEgZ2l0
OgoKICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGds
eC9kZXZlbC5naXQgbXNpLXYxLXBhcnQtMQoKRm9yIHRoZSBjdXJpb3VzIHdobyBjYW4ndCB3YWl0
IGZvciB0aGUgbmV4dCBwYXJ0IHRvIGFycml2ZSB0aGUgZnVsbCBzZXJpZXMKaXMgYXZhaWxhYmxl
IHZpYToKCiAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RnbHgvZGV2ZWwuZ2l0IG1zaS12MS1wYXJ0LTQKClRoYW5rcywKCgl0Z2x4Ci0tLQogYXJjaC9w
b3dlcnBjL3BsYXRmb3Jtcy80eHgvbXNpLmMgICAgICAgICAgICB8ICAyODEgLS0tLS0tLS0tLS0t
CiBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9wY2kvcGNpLnJzdCAgICAgIHwgICAgMiAKIGIv
YXJjaC9taXBzL3BjaS9tc2ktb2N0ZW9uLmMgICAgICAgICAgICAgICAgfCAgIDMyIC0KIGIvYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy80eHgvTWFrZWZpbGUgICAgICAgfCAgICAxIAogYi9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zL2NlbGwvYXhvbl9tc2kuYyAgICB8ICAgIDIgCiBiL2FyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvcG93ZXJudi9wY2ktaW9kYS5jIHwgICAgNCAKIGIvYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9wc2VyaWVzL21zaS5jICAgICAgfCAgICA2IAogYi9hcmNoL3Bvd2VycGMvc3lzZGV2
L0tjb25maWcgICAgICAgICAgICAgICB8ICAgIDYgCiBiL2FyY2gvczM5MC9wY2kvcGNpX2lycS5j
ICAgICAgICAgICAgICAgICAgIHwgICAgNCAKIGIvYXJjaC9zcGFyYy9rZXJuZWwvcGNpX21zaS5j
ICAgICAgICAgICAgICAgfCAgICA0IAogYi9hcmNoL3g4Ni9oeXBlcnYvaXJxZG9tYWluLmMgICAg
ICAgICAgICAgICB8ICAgNTUgLS0KIGIvYXJjaC94ODYvaW5jbHVkZS9hc20veDg2X2luaXQuaCAg
ICAgICAgICAgfCAgICA2IAogYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vaHlwZXJ2aXNvci5o
ICAgICB8ICAgIDggCiBiL2FyY2gveDg2L2tlcm5lbC9hcGljL21zaS5jICAgICAgICAgICAgICAg
IHwgICAgOCAKIGIvYXJjaC94ODYva2VybmVsL3g4Nl9pbml0LmMgICAgICAgICAgICAgICAgfCAg
IDEyIAogYi9hcmNoL3g4Ni9wY2kveGVuLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTkg
CiBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYybS5jICAgICAgICAgICAgIHwgICAgMSAKIGIv
ZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMtaXRzLXBjaS1tc2kuYyAgfCAgICAxIAogYi9kcml2
ZXJzL2lycWNoaXAvaXJxLWdpYy12My1tYmkuYyAgICAgICAgICB8ICAgIDEgCiBiL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcGNpLmMgICAgIHwgICAgMiAKIGIvZHJpdmVycy9wY2kv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgICAzIAogYi9kcml2ZXJzL3BjaS9tc2kv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgIDcgCiBiL2RyaXZlcnMvcGNpL21zaS9pcnFk
b21haW4uYyAgICAgICAgICAgICAgIHwgIDI2NyArKysrKysrKysrKwogYi9kcml2ZXJzL3BjaS9t
c2kvbGVnYWN5LmMgICAgICAgICAgICAgICAgICB8ICAgNzkgKysrCiBiL2RyaXZlcnMvcGNpL21z
aS9tc2kuYyAgICAgICAgICAgICAgICAgICAgIHwgIDY0NSArKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiBiL2RyaXZlcnMvcGNpL21zaS9tc2kuaCAgICAgICAgICAgICAgICAgICAgIHwgICAz
OSArCiBiL2RyaXZlcnMvcGNpL21zaS9wY2lkZXZfbXNpLmMgICAgICAgICAgICAgIHwgICA0MyAr
CiBiL2RyaXZlcnMvcGNpL3BjaS1zeXNmcy5jICAgICAgICAgICAgICAgICAgIHwgICAgNyAKIGIv
ZHJpdmVycy9wY2kveGVuLXBjaWZyb250LmMgICAgICAgICAgICAgICAgfCAgICAyIAogYi9pbmNs
dWRlL2xpbnV4L21zaS5oICAgICAgICAgICAgICAgICAgICAgICB8ICAxMzUgKystLS0KIGIvaW5j
bHVkZS9saW51eC9wY2kuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxIAogYi9rZXJuZWwv
aXJxL21zaS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNDEgKwogMzIgZmlsZXMgY2hh
bmdlZCwgNjk2IGluc2VydGlvbnMoKyksIDEwMjggZGVsZXRpb25zKC0pCg==
