Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF046625D26
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:36:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81Vb5vHqz3fgQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:36:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=realitydiluted.com (client-ip=63.228.164.32; helo=home.bethel-hill.org; envelope-from=sjhill@realitydiluted.com; receiver=<UNKNOWN>)
Received: from home.bethel-hill.org (home.bethel-hill.org [63.228.164.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N81JL2qGgz3fWc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:27:46 +1100 (AEDT)
Received: by home.bethel-hill.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <sjhill@realitydiluted.com>)
	id 1otV0Q-0007VH-Tr; Fri, 11 Nov 2022 14:27:43 +0000
Message-ID: <f7bf5383-eebd-8ab9-59b0-4fc159d61926@realitydiluted.com>
Date: Fri, 11 Nov 2022 08:27:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Writing not working to CPLD/FPGA.
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <8893e416-007c-f7b8-3b67-2ceec7db2e01@realitydiluted.com>
 <4521e89b-a05b-a7b5-4fe0-35f7c898eb8f@csgroup.eu>
From: "Steven J. Hill" <sjhill@realitydiluted.com>
In-Reply-To: <4521e89b-a05b-a7b5-4fe0-35f7c898eb8f@csgroup.eu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4PMjUFIV9bZLNZruGaloV0Kw"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4PMjUFIV9bZLNZruGaloV0Kw
Content-Type: multipart/mixed; boundary="------------VEMhonIi5vdbd1pjV9MKKQXV";
 protected-headers="v1"
From: "Steven J. Hill" <sjhill@realitydiluted.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Message-ID: <f7bf5383-eebd-8ab9-59b0-4fc159d61926@realitydiluted.com>
Subject: Re: Writing not working to CPLD/FPGA.
References: <8893e416-007c-f7b8-3b67-2ceec7db2e01@realitydiluted.com>
 <4521e89b-a05b-a7b5-4fe0-35f7c898eb8f@csgroup.eu>
In-Reply-To: <4521e89b-a05b-a7b5-4fe0-35f7c898eb8f@csgroup.eu>

--------------VEMhonIi5vdbd1pjV9MKKQXV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTEvMjIgMDI6NTMsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+IA0KPiBGaXJz
dCBvZiBhbGwsIGtlcm5lbCAzLjEyIGlzIHByZWhpc3RvcmljLiBIYXZlIHlvdSB0cmllZCB3
aXRoIGxhdGVzdA0KPiBrZXJuZWwsIG9yIGF0IGxlYXN0IHdpdGggb25lIG9mIHRoZSBsb25n
IHRlcm0gc3VwcG9ydCByZWxlYXNlcyAoc2VlDQo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
Y2F0ZWdvcnkvcmVsZWFzZXMuaHRtbCkgPw0KPiANCkl0IGlzIHdoYXQgbXkgY3VzdG9tZXIg
d2FudHMuIEZvciB0aGlzIHByb2plY3QsIHVwZ3JhZGluZyB0aGUga2VybmVsIGlzIG5vdCAN
CmFuIG9wdGlvbi4gSSBhbSB1c2luZyB0aGUgSU8gYWNjZXNzb3Igb3V0X2JlMzIoKSBhbG9u
ZyB3aXRoIGEgQkFUOg0KDQogICAgc2V0YmF0KDYsIDB4ZTUwMDAwMDAwLCAweGU1MDAwMDAw
LCA0MDk2KjEwMjQsIFBBR0VfS0VSTkVMX05DRyk7DQoNClRoZXJlIGFyZSBubyBwYW5pY3Mg
b3IgZXJyb3JzLiBUaGUgd3JpdGVzIGFyZSBqdXN0IHNpbGVudGx5IGlnbm9yZWQuDQoNCi1T
dGV2ZQ0K

--------------VEMhonIi5vdbd1pjV9MKKQXV--

--------------4PMjUFIV9bZLNZruGaloV0Kw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQQ7FeQaKpedass6DAiDIrkfYhzfpwUCY25b3gUDAAAAAAAKCRCDIrkfYhzfp72b
AJ9N+YfizM9GhyRl1tmN8Si6gyIfdQCgmvziZHFMXtfVOLgx/gjS6Ak3flw=
=yHO7
-----END PGP SIGNATURE-----

--------------4PMjUFIV9bZLNZruGaloV0Kw--
