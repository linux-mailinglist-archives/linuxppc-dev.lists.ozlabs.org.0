Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8B7D2C6F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 10:15:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=RyYGDJJy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDSg71JX1z3cWC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 19:15:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=RyYGDJJy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDSfG3ZLXz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Oct 2023 19:14:46 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E9B9921AB7;
	Mon, 23 Oct 2023 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698048872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4FfvOpwjlog36ywUzg84FfOXKK9Om8G3lpLP62Xjiyc=;
	b=RyYGDJJy3hr01gEeJ76elvdTSyYsQXk/KJ33PHoon8GXzge2OWXmuTvswUfsGxeQ7ik0LY
	JE+lnLTaQrdwRdiOfZqaq5a1YE6IrO5ekchYq4lC41jD6CuVuGzqqiguigATmoByJgwGO3
	VCa+lGygQdFnvlfnwzpYGfWFOMMy0CA=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A098132FD;
	Mon, 23 Oct 2023 08:14:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id VCTkI2grNmWYEwAAMHmgww
	(envelope-from <jgross@suse.com>); Mon, 23 Oct 2023 08:14:32 +0000
Message-ID: <195567e6-a654-44f5-877c-0fc910f1f92b@suse.com>
Date: Mon, 23 Oct 2023 10:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hvc/xen: fix console unplug
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <20231020161529.355083-1-dwmw2@infradead.org>
 <20231020161529.355083-4-dwmw2@infradead.org>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20231020161529.355083-4-dwmw2@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UjcAWEH3Pph75UgDRNONF4yc"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.79
X-Spamd-Result: default: False [-7.79 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,citrix.com,outlook.com,lists.ozlabs.org,vger.kernel.org,xen.org];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[outlook.com];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 BAYES_HAM(-2.80)[99.14%];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Dawei Li <set_pte_at@outlook.com>, Jiri Slaby <jirislaby@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UjcAWEH3Pph75UgDRNONF4yc
Content-Type: multipart/mixed; boundary="------------78N371mFYmc0rYLCRFa1cYpX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dawei Li <set_pte_at@outlook.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Paul Durrant <paul@xen.org>
Message-ID: <195567e6-a654-44f5-877c-0fc910f1f92b@suse.com>
Subject: Re: [PATCH v2 3/3] hvc/xen: fix console unplug
References: <20231020161529.355083-1-dwmw2@infradead.org>
 <20231020161529.355083-4-dwmw2@infradead.org>
In-Reply-To: <20231020161529.355083-4-dwmw2@infradead.org>

--------------78N371mFYmc0rYLCRFa1cYpX
Content-Type: multipart/mixed; boundary="------------qWh3Pz1ShynpoG0MdqbauXYH"

--------------qWh3Pz1ShynpoG0MdqbauXYH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMTAuMjMgMTg6MTUsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4gRnJvbTogRGF2
aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4NCj4gDQo+IE9uIHVucGx1ZyBvZiBh
IFhlbiBjb25zb2xlLCB4ZW5jb25zX2Rpc2Nvbm5lY3RfYmFja2VuZCgpIHVuY29uZGl0aW9u
YWxseQ0KPiBjYWxscyBmcmVlX2lycSgpIHZpYSB1bmJpbmRfZnJvbV9pcnFoYW5kbGVyKCks
IGNhdXNpbmcgYSB3YXJuaW5nIG9mDQo+IGZyZWVpbmcgYW4gYWxyZWFkeS1mcmVlIElSUToN
Cj4gDQo+IChxZW11KSBkZXZpY2VfZGVsIGNvbjENCj4gWyAgIDMyLjA1MDkxOV0gLS0tLS0t
LS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+IFsgICAzMi4wNTA5NDJdIFRyeWlu
ZyB0byBmcmVlIGFscmVhZHktZnJlZSBJUlEgMzMNCj4gWyAgIDMyLjA1MDk5MF0gV0FSTklO
RzogQ1BVOiAwIFBJRDogNTEgYXQga2VybmVsL2lycS9tYW5hZ2UuYzoxODk1IF9fZnJlZV9p
cnErMHgxZDQvMHgzMzANCj4gDQo+IEl0IHNob3VsZCBiZSB1c2luZyBldnRjaG5fcHV0KCkg
dG8gdGVhciBkb3duIHRoZSBldmVudCBjaGFubmVsIGJpbmRpbmcsDQo+IGFuZCBsZXQgdGhl
IExpbnV4IElSUSBzaWRlIG9mIGl0IGJlIGhhbmRsZWQgYnkgbm90aWZpZXJfZGVsX2lycSgp
IHRocm91Z2gNCj4gdGhlIEhWQyBjb2RlLg0KPiANCj4gT24gd2hpY2ggdG9waWMuLi4geGVu
Y29uc19kaXNjb25uZWN0X2JhY2tlbmQoKSBzaG91bGQgY2FsbCBodmNfcmVtb3ZlKCkNCj4g
KmZpcnN0KiwgcmF0aGVyIHRoYW4gdGVhcmluZyBkb3duIHRoZSBldmVudCBjaGFubmVsIGFu
ZCBncmFudCBtYXBwaW5nDQo+IHdoaWxlIHRoZXkgYXJlIGluIHVzZS4gQW5kIHRoZW4gdGhl
IElSUSBpcyBndWFyYW50ZWVkIHRvIGJlIGZyZWVkIGJ5DQo+IHRoZSB0aW1lIGl0J3MgdG9y
biBkb3duIGJ5IGV2dGNobl9wdXQoKS4NCj4gDQo+IFNpbmNlIGV2dGNobl9wdXQoKSBhbHNv
IGNsb3NlcyB0aGUgYWN0dWFsIGV2ZW50IGNoYW5uZWwsIGF2b2lkIGNhbGxpbmcNCj4geGVu
YnVzX2ZyZWVfZXZ0Y2huKCkgZXhjZXB0IGluIHRoZSBmYWlsdXJlIHBhdGggd2hlcmUgdGhl
IElSUSB3YXMgbm90DQo+IHN1Y2Nlc3NmdWxseSBzZXQgdXAuDQo+IA0KPiBIb3dldmVyLCBj
YWxsaW5nIGh2Y19yZW1vdmUoKSBhdCB0aGUgc3RhcnQgb2YgeGVuY29uc19kaXNjb25uZWN0
X2JhY2tlbmQoKQ0KPiBzdGlsbCBpc24ndCBlYXJseSBlbm91Z2guIEFuIHVucGx1ZyByZXF1
ZXN0IGlzIGluZGljYXRlZCBieSB0aGUgYmFja2VuZA0KPiBzZXR0aW5nIGl0cyBzdGF0ZSB0
byBYZW5idXNTdGF0ZUNsb3NpbmcsIHdoaWNoIHRyaWdnZXJzIGEgbm90aWZpY2F0aW9uDQo+
IHRvIHhlbmNvbnNfYmFja2VuZF9jaGFuZ2VkKCksIHdoaWNoLi4uIGRvZXMgbm90aGluZyBl
eGNlcHQgc2V0IGl0cyBvd24NCj4gZnJvbnRlbmQgc3RhdGUgZGlyZWN0bHkgdG8gWGVuYnVz
U3RhdGVDbG9zZWQgd2l0aG91dCAqYWN0dWFsbHkqIHRlYXJpbmcNCj4gZG93biB0aGUgSFZD
IGRldmljZSBvciwgeW91IGtub3csIG1ha2luZyBzdXJlIGl0IGlzbid0IGFjdGl2ZWx5IGlu
IHVzZS4NCj4gDQo+IFNvIHRoZSBiYWNrZW5kIHNlZXMgdGhlIGd1ZXN0IGZyb250ZW5kIHNl
dCBpdHMgc3RhdGUgdG8gWGVuYnVzU3RhdGVDbG9zZWQNCj4gYW5kIHN0b3BzIHNlcnZpY2lu
ZyB0aGUgaW50ZXJydXB0Li4uIGFuZCB0aGUgZ3Vlc3Qgc3BpbnMgZm9yIGV2ZXIgaW4gdGhl
DQo+IGRvbVVfd3JpdGVfY29uc29sZSgpIGZ1bmN0aW9uIHdhaXRpbmcgZm9yIHRoZSByaW5n
IHRvIGRyYWluLg0KPiANCj4gRml4IHRoYXQgb25lIGJ5IGNhbGxpbmcgaHZjX3JlbW92ZSgp
IGZyb20geGVuY29uc19iYWNrZW5kX2NoYW5nZWQoKSBiZWZvcmUNCj4gc2lnbmFsbGluZyB0
byB0aGUgYmFja2VuZCB0aGF0IGl0J3MgT0sgdG8gcHJvY2VlZCB3aXRoIHRoZSByZW1vdmFs
Lg0KPiANCj4gVGVzdGVkIHdpdGggJ2RkIGlmPS9kZXYvemVybyBvZj0vZGV2L2h2YzEnIHdo
aWxlIHRlbGxpbmcgUWVtdSB0byByZW1vdmUNCj4gdGhlIGNvbnNvbGUgZGV2aWNlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4N
Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------qWh3Pz1ShynpoG0MdqbauXYH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------qWh3Pz1ShynpoG0MdqbauXYH--

--------------78N371mFYmc0rYLCRFa1cYpX--

--------------UjcAWEH3Pph75UgDRNONF4yc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmU2K2gFAwAAAAAACgkQsN6d1ii/Ey/r
hwf/R5NPrDHGszvsupV8nUShAm59eGETFsI1EB/AvEh0WDprobcPhX/2f7r/f9XEEWRcuLWHKq73
6mTUYHKuOE7X2/qvSFgBsjSRo6y9oJObTjGVbMjVi8EapETjuUE3z5rvKctHTOjz3hJ/f+ZcDPVS
VmyRNR8VpYNp1KLeX+tUqbHyAuspCxARVXX5cMO5QCCrgzuvtCkQGWfdtXB4G2i31Q2Ky80+dvCN
i5uL+ihmFqTqlqBhXsxswTdfOylQgly/bYwVpoE54zJZpyRgquYhY6CRrqCddVGbdUj94GUpjgYb
OZdOitqBQ0qM2bcNUs2ej0NVV9tFl3sQ5bsTleiB9g==
=yJGa
-----END PGP SIGNATURE-----

--------------UjcAWEH3Pph75UgDRNONF4yc--
