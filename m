Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24CB7537F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 12:24:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZfVUZTYx;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=i9uyf4Nb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2SK35X1Dz3c2k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 20:24:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZfVUZTYx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=i9uyf4Nb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2SJB3csSz3c1H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 20:24:10 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE2461FD60;
	Fri, 14 Jul 2023 10:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689330246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bB3ajJzlHzH/NCavasHXOu44UGyH8PhtuwbaAsRiUs=;
	b=ZfVUZTYxKgmlcgDz3AHjqL+8kKqOPlM48so6SAp4bPoDCqqDz+3/+UNtLxmMlKTi7krayp
	P98fFJUBwfL3/ZEjSpwYWcoFDAWmaSZLprBhqZqP0RU9FZezuOmH3c4Tej5E/gtnnmKjK0
	9VuzaJtqrKln18Yvq2tUKpEvLJSSsc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689330246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bB3ajJzlHzH/NCavasHXOu44UGyH8PhtuwbaAsRiUs=;
	b=i9uyf4NbLjtrEiMsl2L+V6st/ysF7iZUMveLAhVTrl60zcT/tjGmmWLGkqqm4zfDOP/ch4
	ZMBJeoOcV2Ws7pDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8784513A15;
	Fri, 14 Jul 2023 10:24:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id s3zkH0YisWS7EgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 14 Jul 2023 10:24:06 +0000
Message-ID: <47a3ab8d-5e8c-db2c-fcde-5c2b1bac32aa@suse.de>
Date: Fri, 14 Jul 2023 12:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/18] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230714075155.5686-1-tzimmermann@suse.de>
 <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ytQioUjfc867nfoK1gzl7Kf7"
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
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, javierm@redhat.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ytQioUjfc867nfoK1gzl7Kf7
Content-Type: multipart/mixed; boundary="------------e1VN5UoecP2KMs2cwDKg5iZ3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Message-ID: <47a3ab8d-5e8c-db2c-fcde-5c2b1bac32aa@suse.de>
Subject: Re: [PATCH v3 00/18] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
References: <20230714075155.5686-1-tzimmermann@suse.de>
 <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
In-Reply-To: <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>

--------------e1VN5UoecP2KMs2cwDKg5iZ3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDcuMjMgdW0gMTI6MDQgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIEZyaSwgSnVsIDE0LCAyMDIzIGF0IDk6NTPigK9B
TSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+PiBS
ZW1vdmUgdGhlIHVudXNlZCBmbGFncyBGQklORk9fREVGQVVMVCBhbmQgRkJJTkZPX0ZMQUdf
REVGQVVMVCBmcm9tDQo+PiBmYmRldiBhbmQgZHJpdmVycywgYXMgYnJpZWZseSBkaXNjdXNz
ZWQgYXQgWzFdLiBCb3RoIGZsYWdzIHdlcmUgbWF5YmUNCj4+IHVzZWZ1bCB3aGVuIGZiZGV2
IGhhZCBzcGVjaWFsIGhhbmRsaW5nIGZvciBkcml2ZXIgbW9kdWxlcy4gV2l0aA0KPj4gY29t
bWl0IDM3NmIzZmY1NGM5YSAoImZiZGV2OiBOdWtlIEZCSU5GT19NT0RVTEUiKSwgdGhleSBh
cmUgYm90aCAwDQo+PiBhbmQgaGF2ZSBubyBmdXJ0aGVyIGVmZmVjdC4NCj4+DQo+PiBQYXRj
aGVzIDEgdG8gNyByZW1vdmUgRkJJTkZPX0RFRkFVTFQgZnJvbSBkcml2ZXJzLiBQYXRjaGVz
IDIgdG8gNQ0KPj4gc3BsaXQgdGhpcyBieSB0aGUgd2F5IHRoZSBmYl9pbmZvIHN0cnVjdCBp
cyBiZWluZyBhbGxvY2F0ZWQuIEFsbCBmbGFncw0KPj4gYXJlIGNsZWFyZWQgdG8gemVybyBk
dXJpbmcgdGhlIGFsbG9jYXRpb24uDQo+Pg0KPj4gUGF0Y2hlcyA4IHRvIDE2IGRvIHRoZSBz
YW1lIGZvciBGQklORk9fRkxBR19ERUZBVUxULiBQYXRjaCA4IGZpeGVzDQo+PiBhbiBhY3R1
YWwgYnVnIGluIGhvdyBhcmNoL3NoIHVzZXMgdGhlIHRva2VuIGZvciBzdHJ1Y3QgZmJfdmlk
ZW9tb2RlLA0KPj4gd2hpY2ggaXMgdW5yZWxhdGVkLg0KPj4NCj4+IFBhdGNoIDE3IHJlbW92
ZXMgYm90aCBmbGFnIGNvbnN0YW50cyBmcm9tIDxsaW51eC9mYi5oPiBhbmQgcGF0Y2ggMTgN
Cj4+IGRvY3VtZW50cyB0aGUgemVybydlZCBtZW1vcnkgcmV0dXJuZWQgYnkgZnJhbWVidWZm
ZXJfYWxsb2MoKS4NCj4+DQo+PiB2MzoNCj4+ICAgICAgICAgICogc2g6IGluY2x1ZGUgYm9h
cmQgbmFtZSBpbiBjb21taXQgbWVzc2FnZSAoQWRyaWFuKQ0KPj4gICAgICAgICAgKiBkb2Nz
OiByZXdvcmQgdGV4dCAoTWlndWVsKQ0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0K
PiANCj4+ICAgIGZiZGV2OiBSZW1vdmUgZmxhZyBGQklORk9fREVGQVVMVCBmcm9tIGZiZGV2
IGRyaXZlcnMNCj4+ICAgIGZiZGV2OiBSZW1vdmUgZmxhZyBGQklORk9fREVGQVVMVCBmcm9t
IGZiZGV2IGRyaXZlcnMNCj4+ICAgIGZiZGV2OiBSZW1vdmUgZmxhZyBGQklORk9fREVGQVVM
VCBmcm9tIGZiZGV2IGRyaXZlcnMNCj4+ICAgIGZiZGV2OiBSZW1vdmUgZmxhZyBGQklORk9f
REVGQVVMVCBmcm9tIGZiZGV2IGRyaXZlcnMNCg0KSSB3YXNuJ3QgaGFwcHkgYWJvdXQgdGhp
cyBlaXRoZXIuIEJ1dCBJIGNvdWxkIG5vdCBjb21lIHVwIHdpdGggYSANCmRlc2NyaXB0aW9u
IHRoYXQgZml0cyBpbnRvIHRoZSA3NC1jaGFyIGxpbWl0IGZvciBlYWNoIGNvbW1pdC4gVGhl
eSBvbmx5IA0KZGlmZmVyIGluIHRoZSBtZXRob2Qgb2YgbWVtb3J5IGFsbG9jYXRpb24uIERv
IHlvdSBoYXZlIGFueSBpZGVhcz8NCg0KPiANCj4gRm91ciBwYXRjaGVzIHdpdGggdGhlIGV4
YWN0IHNhbWUgb25lLWxpbmUgc3VtbWFyeS4gUGxlYXNlIG1ha2UgdGhlbQ0KPiB1bmlxdWUu
DQo+IA0KPj4gICAgZmJkZXY6IFJlbW92ZSBmbGFnIEZCSU5GT19GTEFHX0RFRkFVTFQgZnJv
bSBmYmRldiBkcml2ZXJzDQo+PiAgICBmYmRldjogUmVtb3ZlIGZsYWcgRkJJTkZPX0ZMQUdf
REVGQVVMVCBmcm9tIGZiZGV2IGRyaXZlcnMNCj4gDQo+IFR3byBwYXRjaGVzIHdpdGggdGhl
IGV4YWN0IHNhbWUgb25lLWxpbmUgc3VtbWFyeS4gUGxlYXNlIG1ha2UgdGhlbQ0KPiB1bmlx
dWUuDQoNClNhbWUgcHJvYmxlbSBoZXJlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rl
diwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJC
IDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------e1VN5UoecP2KMs2cwDKg5iZ3--

--------------ytQioUjfc867nfoK1gzl7Kf7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSxIkUFAwAAAAAACgkQlh/E3EQov+A5
ZBAAlrHgFf58BneZE6hcC+r5o5NXfcPpZXyll0zbPfn6bgz+XFX3WjCIOEeFVAtRj4l1NZP2gLDL
7XNg57GaZUV+3tu12rPUwqHB/PP8fo4xN1zoUFHh6n/bZ/IPtqK261weN3XdIE0++yBbi9uX0OJw
sbnYwY9bEjuVCVxhLzZwkvB7OBMd2W4tyY44Dk7zY4Tr5kFLfrU2fPIyaM4i7DDof+JsxDbgeISQ
lb1J6DuP7jxc23B/dIP1KcbGvuw9IpA6HM5annXZkHPBb0LvAOn5k8RJsCdLsPrMA9csWZO3BPeN
ilViiWFtO27QGJPFU+vXC/4HWySxkpaAf3fqgFlrLFoQLNg7n37nnIqOdjz+eE3wHkiTd0h2LwVu
k6gemHqCKMgJwK9bLRFTueMM5lp0GwsC4vpChviNYECfzzTLZKYZHHyWtYeoh/i5VxZezHuk+8io
i8pcC79dy1b6ahi3hR3yLqwxihfje3jfrNjYPf1woeuEUsMr25eBK2/+mRmIvnFtg19/X14rJbPg
aipPmZE4z4DiVVhiEbx/6XFlOflHehdn2hw2hyyfXEXNftSgzOV/Jshfga/TCLtbRs3Asg5U81Cd
l+g39cAV4H0yoCaPnygHuLklnZ7tW2yfrjbwJJoFu65tFJDiV22dChid3jEfYbm9OZJVJPko4Oi7
y34=
=brtE
-----END PGP SIGNATURE-----

--------------ytQioUjfc867nfoK1gzl7Kf7--
