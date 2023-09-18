Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7516A7A430C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 09:43:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=phceITw8;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=22C8pih7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpxc11zmzz3dgD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 17:43:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=phceITw8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=22C8pih7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpxNK0f7Rz3dCT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 17:33:04 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B1D941F88D;
	Mon, 18 Sep 2023 07:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1695022377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=w+ySytjv+OdIO+BaFLSyCcNRtEMVS87jgXKMyZiVNOI=;
	b=phceITw8/sMCELV+bEqm3YKj82HrxNx5uMVtNLgWxEyS9c98fQ6QkY9eXOF5/tlEoNynr4
	cWwLI+JL71K7UiSLyHZQDW0gYGw9SKru8shmhiwjYg891n++8Gcegh8Z4XbKMPtSG//GFU
	Rn3rjTTwb6j0/QImICRPA49woZ8uqLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695022377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=w+ySytjv+OdIO+BaFLSyCcNRtEMVS87jgXKMyZiVNOI=;
	b=22C8pih7TuVjwa5LzYa5jFE73R/kxyXAYNX02VOY/jaTaRUMfxZx86Ibq46KaOPzCj2F5N
	mEC95jbsOE7T0HAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E7BA13480;
	Mon, 18 Sep 2023 07:32:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id A42yGSn9B2V3VwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 18 Sep 2023 07:32:57 +0000
Message-ID: <862ff7d1-fef2-4f03-9529-3aa767bcaa45@suse.de>
Date: Mon, 18 Sep 2023 09:32:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] ppc, fbdev: Clean up fbdev mmap helper
Content-Language: en-US
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 arnd@arndb.de, deller@gmx.de
References: <20230912135050.17155-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20230912135050.17155-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Mdc807ec0uLcSCjop0Co0Z0C"
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Mdc807ec0uLcSCjop0Co0Z0C
Content-Type: multipart/mixed; boundary="------------o2c0nwwuwCtLWSGNnpzMvwIe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 arnd@arndb.de, deller@gmx.de
Cc: linuxppc-dev@lists.ozlabs.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org
Message-ID: <862ff7d1-fef2-4f03-9529-3aa767bcaa45@suse.de>
Subject: Re: [PATCH v4 0/5] ppc, fbdev: Clean up fbdev mmap helper
References: <20230912135050.17155-1-tzimmermann@suse.de>
In-Reply-To: <20230912135050.17155-1-tzimmermann@suse.de>

--------------o2c0nwwuwCtLWSGNnpzMvwIe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZyBmb3IgYSByZXZpZXcuDQoNCkknZCBsaWtlIHRvIGdldCBhdCBsZWFzdCB0aGUgZmly
c3QgdHdvIHBhdGNoZXMgaW50byB0aGUgRFJNIGdpdCB0cmVlLiANClRoZSBQUEMgcGF0Y2hl
cyBjb3VsZCBsYXRlciBiZSBtZXJnZWQgdGhyb3VnaCBhbm90aGVyIHRyZWUuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCkFtIDEyLjA5LjIzIHVtIDE1OjQ4IHNjaHJpZWIgVGhvbWFz
IFppbW1lcm1hbm46DQo+IENsZWFuIHVwIGFuZCByZW5hbWUgZmJfcGdwcm90ZWN0KCkgdG8g
d29yayB3aXRob3V0IHN0cnVjdCBmaWxlLiBUaGVuDQo+IHJlZmFjdG9yIHRoZSBpbXBsZW1l
bnRhdGlvbiBmb3IgUG93ZXJQQy4gVGhpcyBjaGFuZ2UgaGFzIGJlZW4gZGlzY3Vzc2VkDQo+
IGF0IFsxXSBpbiB0aGUgY29udGV4dCBvZiByZWZhY3RvcmluZyBmYmRldidzIG1tYXAgY29k
ZS4NCj4gDQo+IFRoZSBmaXJzdCB0d28gcGF0Y2hlcyB1cGRhdGUgZmJkZXYgYW5kIHJlcGxh
Y2UgZmJkZXYncyBmYl9wZ3Byb3RlY3QoKQ0KPiB3aXRoIHBncHJvdF9mcmFtZWJ1ZmZlcigp
IG9uIGFsbCBhcmNoaXRlY3R1cmVzLiBUaGUgbmV3IGhlbHBlcidzIHN0cmVhbS0NCj4gbGlu
ZWQgaW50ZXJmYWNlIGVuYWJsZXMgbW9yZSByZWZhY3RvcmluZyB3aXRoaW4gZmJkZXYncyBt
bWFwDQo+IGltcGxlbWVudGF0aW9uLg0KPiANCj4gUGF0Y2hlcyAzIHRvIDUgYWRhcHQgUG93
ZXJQQydzIGludGVybmFsIGludGVyZmFjZXMgdG8gcHJvdmlkZQ0KPiBwaHlzX21lbV9hY2Nl
c3NfcHJvdCgpIHRoYXQgd29ya3Mgd2l0aG91dCBzdHJ1Y3QgZmlsZS4gTmVpdGhlciB0aGUN
Cj4gYXJjaGl0ZWN0dXJlIGNvZGUgb3IgZmJkZXYgaGVscGVycyBuZWVkIHRoZSBwYXJhbWV0
ZXIuDQo+IA0KPiB2NDoNCj4gCSogZml4IGNvbW1pdCBtZXNzYWdlIChDaHJpc3RvcGhlKQ0K
PiB2MzoNCj4gCSogcmVuYW1lIGZiX3Bncm90ZWN0KCkgdG8gcGdwcm90X2ZyYW1lYnVmZmVy
KCkgKEFybmQpDQo+IHYyOg0KPiAJKiByZW9yZGVyIHBhdGNoZXMgdG8gc2ltcGxpZnkgbWVy
Z2luZyAoTWljaGFlbCkNCj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eHBwYy1kZXYvNTUwMWJhODAtYmRiMC02MzQ0LTE2YjAtMDQ2NmE5NTBmODJjQHN1c2UuY29t
Lw0KPiANCj4gVGhvbWFzIFppbW1lcm1hbm4gKDUpOg0KPiAgICBmYmRldjogQXZvaWQgZmls
ZSBhcmd1bWVudCBpbiBmYl9wZ3Byb3RlY3QoKQ0KPiAgICBmYmRldjogUmVwbGFjZSBmYl9w
Z3Byb3RlY3QoKSB3aXRoIHBncHJvdF9mcmFtZWJ1ZmZlcigpDQo+ICAgIGFyY2gvcG93ZXJw
YzogUmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzDQo+ICAgIGFyY2gvcG93ZXJwYzogUmVt
b3ZlIGZpbGUgcGFyYW1ldGVyIGZyb20gcGh5c19tZW1fYWNjZXNzX3Byb3QgY29kZQ0KPiAg
ICBhcmNoL3Bvd2VycGM6IENhbGwgaW50ZXJuYWwgX19waHlzX21lbV9hY2Nlc3NfcHJvdCgp
IGluIGZiZGV2IGNvZGUNCj4gDQo+ICAgYXJjaC9pYTY0L2luY2x1ZGUvYXNtL2ZiLmggICAg
ICAgICAgICAgICAgfCAxNSArKysrKysrLS0tLS0tLS0NCj4gICBhcmNoL202OGsvaW5jbHVk
ZS9hc20vZmIuaCAgICAgICAgICAgICAgICB8IDE5ICsrKysrKysrKystLS0tLS0tLS0NCj4g
ICBhcmNoL21pcHMvaW5jbHVkZS9hc20vZmIuaCAgICAgICAgICAgICAgICB8IDExICsrKysr
LS0tLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy9wZ3RhYmxlLmgg
fCAxMCArKysrKysrKy0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ZiLmggICAg
ICAgICAgICAgfCAxMyArKysrKy0tLS0tLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL21hY2hkZXAuaCAgICAgICAgfCAxMyArKysrKystLS0tLS0tDQo+ICAgYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wZ3RhYmxlLmggfCAxMCArKysrKysrKy0tDQo+ICAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BjaS5oICAgICAgICAgICAgfCAgNCArLS0tDQo+
ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9wY2ktY29tbW9uLmMgICAgICAgICAgfCAgMyArLS0N
Cj4gICBhcmNoL3Bvd2VycGMvbW0vbWVtLmMgICAgICAgICAgICAgICAgICAgICB8ICA4ICsr
KystLS0tDQo+ICAgYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9mYi5oICAgICAgICAgICAgICAg
fCAxNSArKysrKysrKystLS0tLS0NCj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9mYi5oICAg
ICAgICAgICAgICAgICB8IDEwICsrKysrKy0tLS0NCj4gICBhcmNoL3g4Ni92aWRlby9mYmRl
di5jICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrLS0tLS0tLQ0KPiAgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYl9jaHJkZXYuYyAgICAgIHwgIDMgKystDQo+ICAgaW5j
bHVkZS9hc20tZ2VuZXJpYy9mYi5oICAgICAgICAgICAgICAgICAgfCAxMiArKysrKystLS0t
LS0NCj4gICAxNSBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspLCA3NSBkZWxldGlv
bnMoLSkNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------o2c0nwwuwCtLWSGNnpzMvwIe--

--------------Mdc807ec0uLcSCjop0Co0Z0C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUH/SgFAwAAAAAACgkQlh/E3EQov+C3
RhAAugJc5QCacM/Zag5uBZeCi3eOhWeVFDRrAq9Q0HOHIjp7YCzCxhpTbr9JAVb5pGXwFpD7noej
FZno5exXaHcWtD9rIZp4oyBiqx0jrn3/Ym6LczZS4aGckoagoynX5OaIxx31inJ8LxxH09fk99uS
hZBy1AM3RVxg1DRCDfIEttDP8j9bjQyABBFgzCtUYRzRSGA3/cg+T7eSV4X4YzhH954/DqK411oF
xh91OX/F7ZK8oYuhJ+t+5+z3d4rxyOwNvlNQT5Ce5XFHn4Rir4R7GC9asypwMQA1GgrecyE0YY1M
mwoAAEKc2RBB8rPdoVLOuzKIOWjhgKl702W1SJ/E3XlD4bs7hkuVsHdEsccRWzcA/V1IWtD83kKM
TEWNoIHOeL/F/Cji/ITy+d0rby0YBVgmzS1ioPJqbGqp9lP4Hvr4tRcfg7sJH3VWImQceY/Nf5ly
atxkUpH9tnvc5zNkVHvejc1dYglKTrIArjiUB4w2LpsTNveO4pKqQBzWh/WMzWAAybak+LwyN4aa
kEzLmy48hughCWvjb08pyvHjdfTOegpWDwCQ8HxcHH06J1Z42zqm9SzJUE0I5kh6ca3AO4AYDB8Y
2bnh2zzRF438+A28AWY+1Y1gldx/opEHNH56cWk9G0Zr8P6oTl5BuZnUur3cotM+MeysHgaDGsrH
y7k=
=2CHQ
-----END PGP SIGNATURE-----

--------------Mdc807ec0uLcSCjop0Co0Z0C--
