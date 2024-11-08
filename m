Return-Path: <linuxppc-dev+bounces-3064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA3B9C27B4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 23:45:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlYt82wDJz2y8d;
	Sat,  9 Nov 2024 09:45:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731079930;
	cv=none; b=MHX17rmCPnENP7BgSkgO1aTm9K0i1cnvSTNxaXqMxhcryS+TG5TpBg7e5yetQ3aORCYlwyJ/N1VOcSf7WCBAI4o6+qQTYvMKTR3x64unJRMLYIDiRi2FKZuivNOKtJWXVmRGxy5viX+vIMJ7nP0LjoYwLGvrG3Otal0VRC2mmEW5gYhrKdmOP9sdXcoFtvTFgG2+n+u78tdHroeh40MlH7er/Fn9VMGjG/euGiQN3c2GgNSIG4jODXIR9xR+Um7ve+46911vPerRMuzc8aOppoPrSA28WKpOKRStZ6HWh82wxY/zFQr36mz1I9rkjkh+IniW+Mngd20GgRTyDqe57g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731079930; c=relaxed/relaxed;
	bh=YBes01HIGxCY9uAMUwOSqshjVdaMRIIeY82NB1cajGY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=R4GvWszAVvI/U+rowtH28xKP7Wyrp055O0N4tG3/WGg5Nj9pNqo2cNhWDJ4eiCPfS/vsSug5aslEM/9RgBLOLBGJv8UfvERfAi93KXYSgmjdRaou4CvX+7056GukZ3fRBiM9WmJleBTkKJYJhg013MDAEM6n03vfCSWRogrwGC4P3eKy26TwrUhCUSfOcfp9WeJgSq/viM6U6d1y1hUd7DIPbndkW1fr9gFYiJ/7i6QmT6YWGdE2nZlUsE1dVBhx4RI7KlH5uxzK77VmmSbsEFYTzAOr5xHiWG0PFCHpev1RkixtcHNZF6CWoRZii1N4P4gR4YcrsAldyKM6F1iYJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=fail (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HaUjtcWH reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=220.197.31.5; helo=m16.mail.163.com; envelope-from=00107082@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HaUjtcWH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.5; helo=m16.mail.163.com; envelope-from=00107082@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 112 seconds by postgrey-1.37 at boromir; Sat, 09 Nov 2024 02:32:06 AEDT
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlNGZ5wBSz3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 02:32:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=iQMcJa4BmFPVqKmXobn4cIhRx4UhLAzJDxklpcxlLI8=; b=H
	aUjtcWHDFt1bKqSXkqJGs1dRc5kfURcXD/snEVL02VfzHVmJDJvgfdNFSH25sFJS
	e/QmXTeDXcuNeFVAyRIvkZptmIV0qg/a2iU0Q4ogCM+qEHNRN03W89MpCkKtr4sE
	EYlKvW6V2O6HdedRW0CAf+PWbdmw0x1Jl4G7mFEXQs=
Received: from 00107082$163.com ( [111.35.191.191] ) by
 ajax-webmail-wmsvr-40-148 (Coremail) ; Fri, 8 Nov 2024 23:28:00 +0800 (CST)
X-Originating-IP: [111.35.191.191]
Date: Fri, 8 Nov 2024 23:28:00 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Thomas Gleixner" <tglx@linutronix.de>
Cc: richard.henderson@linaro.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, guoren@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, James.Bottomley@HansenPartnership.com, 
	deller@gmx.de, mpe@ellerman.id.au, paul.walmsley@sifive.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, 
	glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org
Subject: Re: [PATCH] kernel/irq/proc: performance: replace seq_printf with
 seq_put_decimal_ull_width
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <87r07lol9y.ffs@tglx>
References: <20241103080552.4787-1-00107082@163.com> <87r07lol9y.ffs@tglx>
X-NTES-SC: AL_Qu2YA/yctk4j5iSfbOkZnEYQheY4XMKyuPkg1YJXOp80uSbP/wc5cnBJEkHY4sOvLTmSvxeqUTR3+8t1RrNYQqbBTxgILkv4stMHL//JBWTB
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
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
Message-ID: <3319cd6e.b980.1930c63b1e5.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:lCgvCgD3fwoBLi5nnLAiAA--.7283W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqQKRqmcuF0eQdwACss
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

SGksICAKCkF0IDIwMjQtMTEtMDggMjI6MjU6MTMsICJUaG9tYXMgR2xlaXhuZXIiIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+RGF2aWQhCj4KPk9uIFN1biwgTm92IDAzIDIwMjQgYXQgMTY6
MDUsIERhdmlkIFdhbmcgd3JvdGU6Cj4KPiRTdWJqZWN0OiBbUEFUQ0hdIGtlcm5lbC9pcnEvcHJv
YzogcGVyZm9ybWFuY2U6IC4uLgo+Cj5UaGF0J3Mgbm90IGEgdmFsaWQgc3Vic3lzdGVtIHByZWZp
eC4KCmNvcHkgdGhhdH4KCj4KPj4gc2VxX3ByaW50ZiBpcyBjb3N0eSwgd2hlbiBzdHJlc3MgcmVh
ZGluZyAvcHJvYy9pbnRlcnJ1cHRzLCBwcm9maWxpbmcgaW5kaWNhdGVzCj4+IHNlcV9wcmludGYg
dGFrZXMgYWJvdXQgfjQ3JSBvZiBzaG93X2ludGVycnVwdHMgc2FtcGxlczoKPgo+QWxzbyBwbGVh
c2UgZm9sbG93IHRoZSBkb2N1bWVudGF0aW9uIGZvciBkZW5vdGluZyBmdW5jdGlvbnMgaW4gY2hh
bmdlCj5sb2dzOgo+Cj5odHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9j
ZXNzL21haW50YWluZXItdGlwLmh0bWwjZnVuY3Rpb24tcmVmZXJlbmNlcy1pbi1jaGFuZ2Vsb2dz
Cj4KCmNvcHkgdGhhdH4KCj4+ICBhcmNoL2FscGhhL2tlcm5lbC9pcnEuYyAgICAgfCAgIDggKy0t
Cj4+ICBhcmNoL2FybS9rZXJuZWwvc21wLmMgICAgICAgfCAgIDQgKy0KPj4gIGFyY2gvYXJtNjQv
a2VybmVsL3NtcC5jICAgICB8ICAgMyArLQo+PiAgYXJjaC9jc2t5L2tlcm5lbC9zbXAuYyAgICAg
IHwgICA0ICstCj4+ICBhcmNoL2xvb25nYXJjaC9rZXJuZWwvc21wLmMgfCAgIDIgKy0KPj4gIGFy
Y2gvcGFyaXNjL2tlcm5lbC9pcnEuYyAgICB8ICAzNCArKysrKystLS0tLS0KPj4gIGFyY2gvcG93
ZXJwYy9rZXJuZWwvaXJxLmMgICB8ICA0NCArKysrKysrKy0tLS0tLS0tCj4+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9zbXAuYyAgICAgfCAgIDMgKy0KPj4gIGFyY2gvc2gva2VybmVsL2lycS5jICAgICAg
ICB8ICAgNCArLQo+PiAgYXJjaC9zcGFyYy9rZXJuZWwvaXJxXzMyLmMgIHwgIDEyICsrLS0tCj4+
ICBhcmNoL3NwYXJjL2tlcm5lbC9pcnFfNjQuYyAgfCAgIDQgKy0KPj4gIGFyY2gveDg2L2tlcm5l
bC9pcnEuYyAgICAgICB8IDEwMCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0K
Pj4gIGFyY2gveHRlbnNhL2tlcm5lbC9pcnEuYyAgICB8ICAgMiArLQo+PiAgYXJjaC94dGVuc2Ev
a2VybmVsL3NtcC5jICAgIHwgICA0ICstCj4+ICBrZXJuZWwvaXJxL3Byb2MuYyAgICAgICAgICAg
fCAgIDYgKystCj4KPlRoZXJlIGlzIG5vIGRlcGVuZGVuY3kgb24gdGhlc2UgY2hhbmdlcy4gU28g
cGxlYXNlIHNwbGl0IHRoZW0gdXAgaW50bwo+c2VwZXJhdGUgcGF0Y2hlcyBmb3IgY29yZSBhbmQg
dGhlIGluZGl2aWR1YWwgYXJjaGl0ZWN0dXJlcy5hbgoKVGhhbmtzIGZvciBhbGwgdGhlIHJldmll
dywgSSB3aWxsIG1ha2UgYSBwYXRjaHNldCBmb3IgdGhpcy4KPgo+VGhhbmtzLAo+Cj4gICAgICAg
IHRnbHgKCgpEYXZpZA==

