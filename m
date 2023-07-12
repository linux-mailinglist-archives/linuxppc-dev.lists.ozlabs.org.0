Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD874FF9F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 08:45:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=um9f/BNF;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QWOqGp5b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R17Xy2PSSz3byH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 16:45:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=um9f/BNF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QWOqGp5b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R17X147mVz30f4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 16:44:48 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 542932257C;
	Wed, 12 Jul 2023 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689144281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3XnKIdyYzs9WzUUslFZfdtKZkW2mVfTAiy9Yfh4sv0=;
	b=um9f/BNFht0hF6qfEMiGec1WN+rwJTel0EZVGynCUBznu+naWlk/+sSsvExpMvKu2fA+TF
	e3cpze2sA7owkkecnk/V4YXnfwmlAxT6rqW7FxRf0F/0Af4v/KMvZvHVolenSGFhfbKMvY
	d9RMt5QDxIw1HFGAPOtocjcVjh8L3q8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689144281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3XnKIdyYzs9WzUUslFZfdtKZkW2mVfTAiy9Yfh4sv0=;
	b=QWOqGp5bh9cit+mxGXUzK2PdJyS+BJcR1fc5EKRw6uHa2kCnZ1oPtAWdiEqMdfRABSdVXt
	4TPwQ84Doc2bduBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EDE32133DD;
	Wed, 12 Jul 2023 06:44:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id we7SONhLrmRTEgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 12 Jul 2023 06:44:40 +0000
Message-ID: <b8d28b32-62ff-93fd-ad24-990f82efa38a@suse.de>
Date: Wed, 12 Jul 2023 08:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/17] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710171903.GA14712@ravnborg.org>
 <ab92f8d9-36ab-06bc-b85b-d52b7a1bfe9a@suse.de>
 <20230711144744.GA117276@ravnborg.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230711144744.GA117276@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K7I6QDTtJR3cKkqc48HZx2aU"
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
Cc: linux-hyperv@vger.kernel.org, linux-media@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev, javierm@redhat.com, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K7I6QDTtJR3cKkqc48HZx2aU
Content-Type: multipart/mixed; boundary="------------O4sBmtVossZBjDercKZUVHqN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de,
 linux-staging@lists.linux.dev, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-geode@lists.infradead.org, linux-media@vger.kernel.org
Message-ID: <b8d28b32-62ff-93fd-ad24-990f82efa38a@suse.de>
Subject: Re: [PATCH 00/17] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710171903.GA14712@ravnborg.org>
 <ab92f8d9-36ab-06bc-b85b-d52b7a1bfe9a@suse.de>
 <20230711144744.GA117276@ravnborg.org>
In-Reply-To: <20230711144744.GA117276@ravnborg.org>

--------------O4sBmtVossZBjDercKZUVHqN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDExLjA3LjIzIHVtIDE2OjQ3IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0KPiBIaSBU
aG9tYXMsDQo+IA0KPiBPbiBUdWUsIEp1bCAxMSwgMjAyMyBhdCAwODoyNDo0MEFNICswMjAw
LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpIFNhbQ0KPj4NCj4+IEFtIDEwLjA3
LjIzIHVtIDE5OjE5IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0KPj4+IEhpIFRob21hcywNCj4+
Pg0KPj4+IE9uIE1vbiwgSnVsIDEwLCAyMDIzIGF0IDAyOjUwOjA0UE0gKzAyMDAsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+PiBSZW1vdmUgdGhlIHVudXNlZCBmbGFncyBGQklO
Rk9fREVGQVVMVCBhbmQgRkJJTkZPX0ZMQUdfREVGQVVMVCBmcm9tDQo+Pj4+IGZiZGV2IGFu
ZCBkcml2ZXJzLCBhcyBicmllZmx5IGRpc2N1c3NlZCBhdCBbMV0uIEJvdGggZmxhZ3Mgd2Vy
ZSBtYXliZQ0KPj4+PiB1c2VmdWwgd2hlbiBmYmRldiBoYWQgc3BlY2lhbCBoYW5kbGluZyBm
b3IgZHJpdmVyIG1vZHVsZXMuIFdpdGgNCj4+Pj4gY29tbWl0IDM3NmIzZmY1NGM5YSAoImZi
ZGV2OiBOdWtlIEZCSU5GT19NT0RVTEUiKSwgdGhleSBhcmUgYm90aCAwDQo+Pj4+IGFuZCBo
YXZlIG5vIGZ1cnRoZXIgZWZmZWN0Lg0KPj4+Pg0KPj4+PiBQYXRjaGVzIDEgdG8gNyByZW1v
dmUgRkJJTkZPX0RFRkFVTFQgZnJvbSBkcml2ZXJzLiBQYXRjaGVzIDIgdG8gNQ0KPj4+PiBz
cGxpdCB0aGlzIGJ5IHRoZSB3YXkgdGhlIGZiX2luZm8gc3RydWN0IGlzIGJlaW5nIGFsbG9j
YXRlZC4gQWxsIGZsYWdzDQo+Pj4+IGFyZSBjbGVhcmVkIHRvIHplcm8gZHVyaW5nIHRoZSBh
bGxvY2F0aW9uLg0KPj4+Pg0KPj4+PiBQYXRjaGVzIDggdG8gMTYgZG8gdGhlIHNhbWUgZm9y
IEZCSU5GT19GTEFHX0RFRkFVTFQuIFBhdGNoIDggZml4ZXMNCj4+Pj4gYW4gYWN0dWFsIGJ1
ZyBpbiBob3cgYXJjaC9zaCB1c2VzIHRoZSB0b2tuZSBmb3Igc3RydWN0IGZiX3ZpZGVvbW9k
ZSwNCj4+Pj4gd2hpY2ggaXMgdW5yZWxhdGVkLg0KPj4+Pg0KPj4+PiBQYXRjaCAxNyByZW1v
dmVzIGJvdGggZmxhZyBjb25zdGFudHMgZnJvbSA8bGludXgvZmIuaD4NCj4+Pg0KPj4+IFdl
IGhhdmUgYSBmZXcgbW9yZSBmbGFncyB0aGF0IGFyZSB1bnVzZWQgLSBzaG91bGQgdGhleSBi
ZSBudWtlZCB0b28/DQo+Pj4gRkJJTkZPX0hXQUNDRUxfRklMTFJFQ1QNCj4+PiBGQklORk9f
SFdBQ0NFTF9ST1RBVEUNCj4+PiBGQklORk9fSFdBQ0NFTF9YUEFODQo+Pg0KPj4gSXQgc2Vl
bXMgdGhvc2UgYXJlIHRoZXJlIGZvciBjb21wbGV0ZW5lc3MuIE5vdGhpbmcgc2V0cyBfUk9U
QVRFLCB0aGUgb3RoZXJzDQo+PiBhcmUgc2ltcGx5IG5ldmVyIGNoZWNrZWQuIEFjY29yZGlu
ZyB0byB0aGUgY29tbWVudHMsIHNvbWUgYXJlIHJlcXVpcmVkLCBzb21lDQo+PiBhcmUgb3B0
aW9uYWwuIEkgZG9uJ3Qga25vdyB3aGF0IHRoYXQgbWVhbnMuDQo+Pg0KPj4gSUlSQyB0aGVy
ZSB3ZXJlIGNvbXBsYWlucyBhYm91dCBwZXJmb3JtYW5jZSB3aGVuIERhbmllbCB0cmllZCB0
byByZW1vdmUNCj4+IGZiY29uIGFjY2VsZXJhdGlvbiwgc28gbm90IGFsbCBfSFdBQ0NFTF8g
ZmxhZ3MgYXJlIHVubmVlZGVkLg0KPj4NCj4+IExlYXZpbmcgdGhlbSBpbiBmb3IgcmVmZXJl
bmNlL2NvbXBsZXRlbmVzcyBtaWdodCBiZSBhbiBvcHRpb247IG9yIG5vdC4gSQ0KPj4gaGF2
ZSBubyBzdHJvbmcgZmVlbGluZ3MgYWJvdXQgdGhvc2UgZmxhZ3MuDQo+Pg0KPj4+DQo+Pj4g
VW51c2VkIGFzIGluIG5vIHJlZmVyZW5jZXMgZnJvbSBmYmRldi9jb3JlLyoNCj4+Pg0KPj4+
IEkgd291bGQgcmF0aGVyIHNlZSBvbmUgc2VyaWVzIG51a2UgYWxsIHVudXNlZCBGQklORk8g
ZmxhZ3MgaW4gb25lIGdvLg0KPj4+IEFzc3VtaW5nIG15IHF1aWNrIGdyZXAgYXJlIHJpZ2h0
IGFuZCB0aGUgYWJvdmUgY2FuIGJlIGRyb3BwZWQuDQo+Pg0KPj4gSSB3b3VsZCBub3Qgd2Fu
dCB0byBleHRlbmQgdGhpcyBzZXJpZXMuIEknbSByZW1vdmluZyBfREVGQVVMVCBhcyBpdCdz
DQo+PiBhYnNvbHV0ZWx5IHBvaW50bGVzcyBhbmQgY29uZnVzaW5nLg0KPiANCj4gT0ssIG1h
a2VzIHNlbnNlIGFuZCB0aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4NCj4gDQo+IFRoZSBz
ZXJpZXMgaXM6DQo+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
DQoNClRoYW5rcyBhIGxvdC4NCg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0K
R0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4g
TW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------O4sBmtVossZBjDercKZUVHqN--

--------------K7I6QDTtJR3cKkqc48HZx2aU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSuS9gFAwAAAAAACgkQlh/E3EQov+Bh
IQ//T0PiPxd+GFmqKROILrPIawDb/I+fuq60CvxBHVfPPlvkdxBPBDUE4WuUFhGYCE/oZ6jRlZJX
YKYHYEJ5vEcWCNRR8mfGpNGLyDbuJY9mqzUHWHqhbhHvrEPV2V7WnCjp7UrnMUvqnvnwDDifBkgA
YXI94XN/fqrNmjRzAFvQitvZb1pz3pGlsldbPi/3va2wdNY2h4xtmY4WRd0I/wgVN5YfNjYGeEGb
GQT466I6XnDIzQurY+q0dxDn3Ab3NQQZAr704nfyTZrFfOAJcIz89vrWU29+Qcr/yjEtFtdNamic
WIEJ3DWexIdWBplaQDqxUySBlzU3c3pLLaFwE0SyVPwaUcI5qOpfhMeWgwEwZb1W6+Or4ehLxoIY
muVgE8o2WeQSRihUXz0b/nAclqW/WDHaVhpjURRzviYnD+urODodyuQn0dt36yxciVfsmifL6PCe
Y6X+ADFjH7mB4JZw4zJIl6XSOEGkMXRwkvU0WOXdNcsg8xYuZ8y2OI+ybBeWuLMyJcPQMlqRzbI8
FZ0vgeM3VyTooQheJDh3psIr6oGhJabMlXIVsjocTCvbf9KjSQHwhF9qRcp30sh5PjRGBH4WRtua
KmtCjiBbCfjcF8l9I4RiBoehwlJ4rIqyDx8KvMljftLG7YkgfWCariHTeYa7wA2l91erXQEi5RZc
GMo=
=HzCA
-----END PGP SIGNATURE-----

--------------K7I6QDTtJR3cKkqc48HZx2aU--
