Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B296739A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 14:12:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyNMF1rVYz3fFq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 00:12:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UMdHW9c7;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WEqRGDrM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UMdHW9c7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WEqRGDrM;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyNLF5rcFz3c45
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 00:11:17 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 275C63F1FC;
	Thu, 19 Jan 2023 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674133874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1FirY7h0i2QIsVeYxDQ3RuTXuyrq437+DrvUPk5jmI0=;
	b=UMdHW9c71e6sFUDYGkQoJFuDR/DqdVp6yF3t3flD7KPM901AHIYv6ZRSQxkbdkobm0vG8L
	ajqKOgnW2OjAKmYqtjsznIV4CLe25b76+T0FQ3KnDtA6Iwpsg7JfYqUHUMpGFWonDxYknI
	MT0Ad0A4CkpgW9dvPz3rksACts3fy2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674133874;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1FirY7h0i2QIsVeYxDQ3RuTXuyrq437+DrvUPk5jmI0=;
	b=WEqRGDrMxWR8aD3mqFW3UHgOugEy5Xne1UyWGQ7MuGqdUg5ArwmQ2+kFWRjaOrxY5Kd0P5
	UMmQh6AbtZWv4NBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E895F134F5;
	Thu, 19 Jan 2023 13:11:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CMfNN3FByWM3eAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 19 Jan 2023 13:11:13 +0000
Message-ID: <57e026bf-c412-0c47-8956-b565894948e0@suse.de>
Date: Thu, 19 Jan 2023 14:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] of: Fix of platform build on powerpc due to bad of
 disaply code
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michal Suchanek <msuchanek@suse.de>, "Erhard F." <erhard_f@mailbox.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20230119095323.4659-1-msuchanek@suse.de>
 <8a9f7ba5-37a4-0927-4ab2-d212f1b098a9@csgroup.eu>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8a9f7ba5-37a4-0927-4ab2-d212f1b098a9@csgroup.eu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MC0t0GQxYToFVJIwzeIk8Qt3"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Frank Rowand <frowand.list@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MC0t0GQxYToFVJIwzeIk8Qt3
Content-Type: multipart/mixed; boundary="------------7aDZnfzFb63INJkMdZVpvxiM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michal Suchanek <msuchanek@suse.de>, "Erhard F." <erhard_f@mailbox.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Message-ID: <57e026bf-c412-0c47-8956-b565894948e0@suse.de>
Subject: Re: [PATCH v2] of: Fix of platform build on powerpc due to bad of
 disaply code
References: <20230119095323.4659-1-msuchanek@suse.de>
 <8a9f7ba5-37a4-0927-4ab2-d212f1b098a9@csgroup.eu>
In-Reply-To: <8a9f7ba5-37a4-0927-4ab2-d212f1b098a9@csgroup.eu>

--------------7aDZnfzFb63INJkMdZVpvxiM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDEuMjMgdW0gMTE6MjQgc2NocmllYiBDaHJpc3RvcGhlIExlcm95Og0K
PiANCj4gDQo+IExlIDE5LzAxLzIwMjMgw6AgMTA6NTMsIE1pY2hhbCBTdWNoYW5layBhIMOp
Y3JpdMKgOg0KPj4gVGhlIGNvbW1pdCAyZDY4MWQ2YTIzYTEgKCJvZjogTWFrZSBvZiBmcmFt
ZWJ1ZmZlciBkZXZpY2VzIHVuaXF1ZSIpDQo+PiBicmVha3MgYnVpbGQgYmVjYXVzZSBvZiB3
cm9uZyBhcmd1bWVudCB0byBzbnByaW50Zi4gVGhhdCBjZXJ0YWlubHkNCj4+IGF2b2lkcyB0
aGUgcnVudGltZSBlcnJvciBidXQgaXMgbm90IHRoZSBpbnRlbmRlZCBvdXRjb21lLg0KPj4N
Cj4+IEFsc28gdXNlIHN0YW5kYXJkIGRldmljZSBuYW1lIGZvcm1hdCBvZi1kaXNwbGF5Lk4g
Zm9yIGFsbCBjcmVhdGVkDQo+PiBkZXZpY2VzLg0KPj4NCj4+IEZpeGVzOiAyZDY4MWQ2YTIz
YTEgKCJvZjogTWFrZSBvZiBmcmFtZWJ1ZmZlciBkZXZpY2VzIHVuaXF1ZSIpDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYWwgU3VjaGFuZWsgPG1zdWNoYW5la0BzdXNlLmRlPg0KPj4gLS0t
DQo+PiB2MjogVXBkYXRlIHRoZSBkZXZpY2UgbmFtZSBmb3JtYXQNCj4+IC0tLQ0KPj4gICAg
ZHJpdmVycy9vZi9wbGF0Zm9ybS5jIHwgMTIgKysrKysrKystLS0tDQo+PiAgICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL29mL3BsYXRmb3JtLmMgYi9kcml2ZXJzL29mL3BsYXRmb3JtLmMN
Cj4+IGluZGV4IGYyYTVkNjc5YTMyNC4uOGMxYjFkZTIyMDM2IDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy9vZi9wbGF0Zm9ybS5jDQo+PiArKysgYi9kcml2ZXJzL29mL3BsYXRmb3JtLmMN
Cj4+IEBAIC01MjUsNyArNTI1LDkgQEAgc3RhdGljIGludCBfX2luaXQgb2ZfcGxhdGZvcm1f
ZGVmYXVsdF9wb3B1bGF0ZV9pbml0KHZvaWQpDQo+PiAgICAJaWYgKElTX0VOQUJMRUQoQ09O
RklHX1BQQykpIHsNCj4+ICAgIAkJc3RydWN0IGRldmljZV9ub2RlICpib290X2Rpc3BsYXkg
PSBOVUxMOw0KPj4gICAgCQlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXY7DQo+PiAtCQlp
bnQgZGlzcGxheV9udW1iZXIgPSAxOw0KPj4gKwkJaW50IGRpc3BsYXlfbnVtYmVyID0gMDsN
Cj4+ICsJCWNoYXIgYnVmWzE0XTsNCj4gDQo+IENhbiB5b3UgZGVjbGFyZSB0aGF0IGluIHRo
ZSBmb3IgYmxvY2sgd2hlcmUgaXQgaXMgdXNlZCBpbnN0ZWFkID8NCj4gDQo+PiArCQljaGFy
ICpvZl9kaXNwbGF5X2Zvcm1hdCA9ICJvZi1kaXNwbGF5LiVkIjsNCj4gDQo+IFNob3VsZCBi
ZSBjb25zdCA/DQoNClRoYXQgc2hvdWxkIGJlIHN0YXRpYyBjb25zdCBvZl9kaXNwbGF5X2Zv
cm1hdFtdID0gdGhlbg0KDQo+IA0KPj4gICAgCQlpbnQgcmV0Ow0KPj4gICAgDQo+PiAgICAJ
CS8qIENoZWNrIGlmIHdlIGhhdmUgYSBNYWNPUyBkaXNwbGF5IHdpdGhvdXQgYSBub2RlIHNw
ZWMgKi8NCj4+IEBAIC01NTYsNyArNTU4LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IG9mX3Bs
YXRmb3JtX2RlZmF1bHRfcG9wdWxhdGVfaW5pdCh2b2lkKQ0KPj4gICAgCQkJaWYgKCFvZl9n
ZXRfcHJvcGVydHkobm9kZSwgImxpbnV4LG9wZW5lZCIsIE5VTEwpIHx8DQo+PiAgICAJCQkg
ICAgIW9mX2dldF9wcm9wZXJ0eShub2RlLCAibGludXgsYm9vdC1kaXNwbGF5IiwgTlVMTCkp
DQo+PiAgICAJCQkJY29udGludWU7DQo+PiAtCQkJZGV2ID0gb2ZfcGxhdGZvcm1fZGV2aWNl
X2NyZWF0ZShub2RlLCAib2YtZGlzcGxheSIsIE5VTEwpOw0KPj4gKwkJCXJldCA9IHNucHJp
bnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksIG9mX2Rpc3BsYXlfZm9ybWF0LCBkaXNwbGF5X251bWJl
cisrKTsNCj4+ICsJCQlpZiAocmV0ID49IHNpemVvZihidWYpKQ0KPj4gKwkJCQljb250aW51
ZTsNCj4gDQo+IA0KPiBDYW4geW91IG1ha2UgYnVmIGJpZyBlbm91Z2ggdG8gYXZvaWQgdGhh
dCA/DQo+IA0KPiBBbmQgYnkgdGhlIHdheSBjb3VsZCBpdCBiZSBjYWxsZWQgc29tZXRoaW5n
IGVsc2UgdGhhbiAnYnVmJyA/DQo+IA0KPiBTZWUgZXhlbXBsZSBoZXJlIDoNCj4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMS9zb3VyY2UvZHJpdmVycy9mc2kvZnNp
LW9jYy5jI0w2OTANCj4gDQo+IA0KPj4gKwkJCWRldiA9IG9mX3BsYXRmb3JtX2RldmljZV9j
cmVhdGUobm9kZSwgYnVmLCBOVUxMKTsNCj4+ICAgIAkJCWlmIChXQVJOX09OKCFkZXYpKQ0K
Pj4gICAgCQkJCXJldHVybiAtRU5PTUVNOw0KPj4gICAgCQkJYm9vdF9kaXNwbGF5ID0gbm9k
ZTsNCj4+IEBAIC01NjQsMTAgKzU2OSw5IEBAIHN0YXRpYyBpbnQgX19pbml0IG9mX3BsYXRm
b3JtX2RlZmF1bHRfcG9wdWxhdGVfaW5pdCh2b2lkKQ0KPj4gICAgCQl9DQo+PiAgICANCj4+
ICAgIAkJZm9yX2VhY2hfbm9kZV9ieV90eXBlKG5vZGUsICJkaXNwbGF5Iikgew0KPj4gLQkJ
CWNoYXIgKmJ1ZlsxNF07DQo+PiAgICAJCQlpZiAoIW9mX2dldF9wcm9wZXJ0eShub2RlLCAi
bGludXgsb3BlbmVkIiwgTlVMTCkgfHwgbm9kZSA9PSBib290X2Rpc3BsYXkpDQo+PiAgICAJ
CQkJY29udGludWU7DQo+PiAtCQkJcmV0ID0gc25wcmludGYoYnVmLCAib2YtZGlzcGxheS0l
ZCIsIGRpc3BsYXlfbnVtYmVyKyspOw0KPj4gKwkJCXJldCA9IHNucHJpbnRmKGJ1Ziwgc2l6
ZW9mKGJ1ZiksIG9mX2Rpc3BsYXlfZm9ybWF0LCBkaXNwbGF5X251bWJlcisrKTsNCj4+ICAg
IAkJCWlmIChyZXQgPj0gc2l6ZW9mKGJ1ZikpDQo+PiAgICAJCQkJY29udGludWU7DQo+PiAg
ICAJCQlvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlKG5vZGUsIGJ1ZiwgTlVMTCk7DQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------7aDZnfzFb63INJkMdZVpvxiM--

--------------MC0t0GQxYToFVJIwzeIk8Qt3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPJQXEFAwAAAAAACgkQlh/E3EQov+DW
HQ/+NMKu8FFc3SPvTeXiYwlozz3pBcghEOj/ojkuRXGFmflBbiYd3/jQbGHjkGhOTa11yMNu8Pce
R9jl4Ga15yBfGGjmYsTiXb9DAwsxyqPM6VNHdu09YlxxMPhbpUJFKAFYLN2fqOrlSYlJroMjTuz8
EnOPAmGFerYwO/O8G0aoYYZkCH582xPb+tQT9ykKwOjsOo0cNr56WNPTfwiTWXwDKKq01c7gQzvj
g2rheJ/Oz2J0fI6aR25nKDZ/tpFrYNb3kZwTxX0mA8ya1lsEEsnWVo3BXQ4KIozu8IRnXRWuA/mC
GfLt79DppQB7z+j1rY6+pGbQYl/LVdjbPcduR3/tt3RABV/RudCiwsSCI8D2623BHcxUFhe/wuM+
jnlW17eIfDqgXO9+fn8pAkx+UbMZ741TxdI/m0qKiNRn7xmlfeLZK7Tp0fqGrwIcJDFUEOypry4Y
ibEf6GrScRkj3pzdM3VTec2yoxsrYixUjSh3H5rYxeTxPJjcOYHg26a/HltDj6sDquLib/m/95xQ
Q9YTWLKS9YI/JD44ra4XrTvQcbkD5MQtvPyQC1CNuxjQ2J/t4UoKa/3BRKzjN8G/5UWUsy2oRKfu
+EMoq7lBvm5GQLiZBYXe+DR3wNvQILfadvFmhLncYh4hSSUGiIxtvm4kDMopaH4MpQxLQMsUypHf
ueE=
=ivhp
-----END PGP SIGNATURE-----

--------------MC0t0GQxYToFVJIwzeIk8Qt3--
