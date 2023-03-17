Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD5D6BEA09
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 14:24:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdPwx4B0Jz3f3f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 00:24:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ErskkrqT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=jgross@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ErskkrqT;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdPw04F44z3cDp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 00:23:28 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 937862187E;
	Fri, 17 Mar 2023 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679059397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gF7651brT7caQSsc2jrEix3SN7RITX7+MOeFG4i9BS4=;
	b=ErskkrqTCLfexaVF7cv1PKz0rDT/m5kwVhpWTpqGd767kBAroYAUHZ+6FVQNkCLETmfxv6
	N43Z0kWlkh/uqLOHp9Oy8tzgl5syN3f5DywjhaXI7Ejcfumr06+XmfN7p+7tJRYIAk6Zgd
	oCy4CPnFOdLc7pmNbbi8b9hS1Tgl+Uo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 334FF13428;
	Fri, 17 Mar 2023 13:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mE2tCsVpFGTSVAAAMHmgww
	(envelope-from <jgross@suse.com>); Fri, 17 Mar 2023 13:23:17 +0000
Message-ID: <25fd6eca-a7c7-9b08-80a0-a0c998df664a@suse.com>
Date: Fri, 17 Mar 2023 14:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] hvc/xen: prevent concurrent accesses to the shared
 ring
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20221130150919.13935-1-roger.pau@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221130150919.13935-1-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gie0V2XxEfCsFniL0HzrnZyl"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jeremy Fitzhardinge <jeremy@xensource.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Chris Wright <chrisw@sous-sol.org>, Jan Beulich <jbeulich@suse.com>, Olof Johansson <olof@lixom.net>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@elte.hu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gie0V2XxEfCsFniL0HzrnZyl
Content-Type: multipart/mixed; boundary="------------AZPK0VwxiAmD9f0gJJzyGN8v";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chris Wright <chrisw@sous-sol.org>, Ingo Molnar <mingo@elte.hu>,
 Jeremy Fitzhardinge <jeremy@xensource.com>, Olof Johansson <olof@lixom.net>,
 linuxppc-dev@lists.ozlabs.org
Message-ID: <25fd6eca-a7c7-9b08-80a0-a0c998df664a@suse.com>
Subject: Re: [PATCH v2] hvc/xen: prevent concurrent accesses to the shared
 ring
References: <20221130150919.13935-1-roger.pau@citrix.com>
In-Reply-To: <20221130150919.13935-1-roger.pau@citrix.com>

--------------AZPK0VwxiAmD9f0gJJzyGN8v
Content-Type: multipart/mixed; boundary="------------FGQVLPfXwFLtDKIHICeFHKy1"

--------------FGQVLPfXwFLtDKIHICeFHKy1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMTEuMjIgMTY6MDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gVGhlIGh2YyBt
YWNoaW5lcnkgcmVnaXN0ZXJzIGJvdGggYSBjb25zb2xlIGFuZCBhIHR0eSBkZXZpY2UgYmFz
ZWQgb24NCj4gdGhlIGh2IG9wcyBwcm92aWRlZCBieSB0aGUgc3BlY2lmaWMgaW1wbGVtZW50
YXRpb24uICBUaG9zZSB0d28NCj4gaW50ZXJmYWNlcyBob3dldmVyIGhhdmUgZGlmZmVyZW50
IGxvY2tzLCBhbmQgdGhlcmUncyBubyBzaW5nbGUgbG9ja3MNCj4gdGhhdCdzIHNoYXJlZCBi
ZXR3ZWVuIHRoZSB0dHkgYW5kIHRoZSBjb25zb2xlIGltcGxlbWVudGF0aW9ucywgaGVuY2UN
Cj4gdGhlIGRyaXZlciBuZWVkcyB0byBwcm90ZWN0IGl0c2VsZiBhZ2FpbnN0IGNvbmN1cnJl
bnQgYWNjZXNzZXMuDQo+IE90aGVyd2lzZSBjb25jdXJyZW50IGNhbGxzIHVzaW5nIHRoZSBz
cGxpdCBpbnRlcmZhY2VzIGFyZSBsaWtlbHkgdG8NCj4gY29ycnVwdCB0aGUgcmluZyBpbmRl
eGVzLCBsZWF2aW5nIHRoZSBjb25zb2xlIHVudXNhYmxlLg0KPiANCj4gSW50cm9kdWNlIGEg
bG9jayB0byB4ZW5jb25zX2luZm8gdG8gc2VyaWFsaXplIGFjY2Vzc2VzIHRvIHRoZSBzaGFy
ZWQNCj4gcmluZy4gIFRoaXMgaXMgb25seSByZXF1aXJlZCB3aGVuIHVzaW5nIHRoZSBzaGFy
ZWQgbWVtb3J5IGNvbnNvbGUsDQo+IGNvbmN1cnJlbnQgYWNjZXNzZXMgdG8gdGhlIGh5cGVy
Y2FsbCBiYXNlZCBjb25zb2xlIGltcGxlbWVudGF0aW9uIGFyZQ0KPiBub3QgYW4gaXNzdWUu
DQo+IA0KPiBOb3RlIHRoZSBjb25kaXRpb25hbCBsb2dpYyBpbiBkb21VX3JlYWRfY29uc29s
ZSgpIGlzIHNsaWdodGx5IG1vZGlmaWVkDQo+IHNvIHRoZSBub3RpZnlfZGFlbW9uKCkgY2Fs
bCBjYW4gYmUgZG9uZSBvdXRzaWRlIG9mIHRoZSBsb2NrZWQgcmVnaW9uOg0KPiBpdCdzIGFu
IGh5cGVyY2FsbCBhbmQgdGhlcmUncyBubyBuZWVkIGZvciBpdCB0byBiZSBkb25lIHdpdGgg
dGhlIGxvY2sNCj4gaGVsZC4NCj4gDQo+IEZpeGVzOiBiNTM2YjRiOTYyMzAgKCd4ZW46IHVz
ZSB0aGUgaHZjIGNvbnNvbGUgaW5mcmFzdHJ1Y3R1cmUgZm9yIFhlbiBjb25zb2xlJykNCj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0K
SnVlcmdlbg0KDQo=
--------------FGQVLPfXwFLtDKIHICeFHKy1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------FGQVLPfXwFLtDKIHICeFHKy1--

--------------AZPK0VwxiAmD9f0gJJzyGN8v--

--------------gie0V2XxEfCsFniL0HzrnZyl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQUacQFAwAAAAAACgkQsN6d1ii/Ey+K
PggAn0AyCpypkmATVWalZEldbjHh3OyR1GoRNfBjBG2NVjTZmvSitO3cqe8RgL9fZ36WF21XtQ5q
XvthG06ZtxvCfecd63jJ0tajxTlG+A/g9+VKuJKGIHaaHtBe/YcceveDS3r5GaFSiBNTOWqPkclP
CvPB59452Rf7Y57wBN1+rYJXTE15e1huGagXZpbIjtdW5iHrQKQT9QpSBlcEfyYdZHjUhTUaSsUp
hRmp1WM4cyPUTgdg5W/I77rk9JWHMzWC56f8d4z4ApaajqzLTuTohbuB0s6YC1ahcy+ftXcaAT8Q
USRNpt1OFrNYts8gCwcQiXWYeFeO5UDFr/vMtCKpyw==
=oESl
-----END PGP SIGNATURE-----

--------------gie0V2XxEfCsFniL0HzrnZyl--
