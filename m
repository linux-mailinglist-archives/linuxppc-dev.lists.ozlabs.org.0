Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C3574D838
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 15:53:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Oi9TRHgW;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jbYxkndX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R057416cWz3bw4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 23:53:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Oi9TRHgW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jbYxkndX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R056948zXz2xgw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 23:52:17 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A3A391FFD8;
	Mon, 10 Jul 2023 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688997133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4v5LeT3wEH/C9m2+W9XtcTPFhOIw+YSARWF0KgYWOtU=;
	b=Oi9TRHgWi+luule3ABD/ucSz147ye4oeC2K/JMDAOmAYTcgUWwXxeVPSKpDjXHpYa11W1b
	8C8Bt5/wUHu0a0OA32pmcll5SgGi043elwFxPW+2k+HMXFbILx2HOWYjXc6HGezxJD9KXX
	FIAJ8QgYE8tryF9ig8pdWfFgJafJlOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688997133;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4v5LeT3wEH/C9m2+W9XtcTPFhOIw+YSARWF0KgYWOtU=;
	b=jbYxkndX4Ti6Gn7nfRuP5KqH7ubZaqVqLQV4PJNSTcJTuw6/+68QjeWVEL52sklq3WE3DB
	U2LYGNcP3Dc/M0BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38D491361C;
	Mon, 10 Jul 2023 13:52:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id L6LYDA0NrGQpMAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 13:52:13 +0000
Message-ID: <54e3e070-52fb-9ccb-bc47-0f41690f6bfa@suse.de>
Date: Mon, 10 Jul 2023 15:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/17] arch/sh: Do not assign FBINFO_FLAG_DEFAULT to
 fb_videomode.flag
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, deller@gmx.de,
 javierm@redhat.com
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-9-tzimmermann@suse.de>
 <0a47ed93fe90a77180533f8c2e42e402827e8f1c.camel@physik.fu-berlin.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <0a47ed93fe90a77180533f8c2e42e402827e8f1c.camel@physik.fu-berlin.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ObI0DIYuPayIMER65keWCwGm"
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ObI0DIYuPayIMER65keWCwGm
Content-Type: multipart/mixed; boundary="------------y6Z9f06cQd6qaNtFSEQ4zER5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, deller@gmx.de,
 javierm@redhat.com
Cc: linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org,
 linux-nvidia@lists.surfsouth.com, linux-hyperv@vger.kernel.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>
Message-ID: <54e3e070-52fb-9ccb-bc47-0f41690f6bfa@suse.de>
Subject: Re: [PATCH 08/17] arch/sh: Do not assign FBINFO_FLAG_DEFAULT to
 fb_videomode.flag
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-9-tzimmermann@suse.de>
 <0a47ed93fe90a77180533f8c2e42e402827e8f1c.camel@physik.fu-berlin.de>
In-Reply-To: <0a47ed93fe90a77180533f8c2e42e402827e8f1c.camel@physik.fu-berlin.de>

--------------y6Z9f06cQd6qaNtFSEQ4zER5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDcuMjMgdW0gMTU6NDIgc2NocmllYiBKb2huIFBhdWwgQWRyaWFuIEds
YXViaXR6Og0KPiBIaSBUaG9tYXMhDQo+IA0KPiBPbiBNb24sIDIwMjMtMDctMTAgYXQgMTQ6
NTAgKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gRkJJTkZPX0ZMQUdfREVG
QVVMVCBpcyBhIGZsYWcgZm9yIGEgZnJhbWVidWZmZXIgaW4gc3RydWN0IGZiX2luZm8uDQo+
PiBGbGFncyBmb3IgdmlkZW9tb2RlcyBhcmUgcHJlZml4ZWQgd2l0aCBGQl9NT0RFXy4gRkJJ
TkZPX0ZMQUdfREVGQVVMVA0KPj4gaXMgMCBhbmQgdGhlIHN0YXRpYyBkZWNsYXJhdGlvbiBh
bHJlYWR5IGNsZWFycyB0aGUgbWVtb3J5IGFyZWEgb2YNCj4+IHNoNzc2M2ZiX3ZpZGVvbW9k
ZS4gU28gcmVtb3ZlIHRoZSBhc3NpZ25tZW50Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gQ2M6IFlvc2hpbm9y
aSBTYXRvIDx5c2F0b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcD4NCj4+IENjOiBSaWNoIEZlbGtl
ciA8ZGFsaWFzQGxpYmMub3JnPg0KPj4gQ2M6IEpvaG4gUGF1bCBBZHJpYW4gR2xhdWJpdHog
PGdsYXViaXR6QHBoeXNpay5mdS1iZXJsaW4uZGU+DQo+PiAtLS0NCj4+ICAgYXJjaC9zaC9i
b2FyZHMvbWFjaC1zaDc3NjNyZHAvc2V0dXAuYyB8IDEgLQ0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3NoL2JvYXJkcy9t
YWNoLXNoNzc2M3JkcC9zZXR1cC5jIGIvYXJjaC9zaC9ib2FyZHMvbWFjaC1zaDc3NjNyZHAv
c2V0dXAuYw0KPj4gaW5kZXggOTdlNzE1ZTRlOWIzLi4zNDVmMmI3NmM4NWEgMTAwNjQ0DQo+
PiAtLS0gYS9hcmNoL3NoL2JvYXJkcy9tYWNoLXNoNzc2M3JkcC9zZXR1cC5jDQo+PiArKysg
Yi9hcmNoL3NoL2JvYXJkcy9tYWNoLXNoNzc2M3JkcC9zZXR1cC5jDQo+PiBAQCAtMTE5LDcg
KzExOSw2IEBAIHN0YXRpYyBzdHJ1Y3QgZmJfdmlkZW9tb2RlIHNoNzc2M2ZiX3ZpZGVvbW9k
ZSA9IHsNCj4+ICAgCS52c3luY19sZW4gPSAxLA0KPj4gICAJLnN5bmMgPSAwLA0KPj4gICAJ
LnZtb2RlID0gRkJfVk1PREVfTk9OSU5URVJMQUNFRCwNCj4+IC0JLmZsYWcgPSBGQklORk9f
RkxBR19ERUZBVUxULA0KPj4gICB9Ow0KPj4gICANCj4+ICAgc3RhdGljIHN0cnVjdCBzaDc3
NjBmYl9wbGF0ZGF0YSBzaDc3NjNmYl9kZWZfcGRhdGEgPSB7DQo+IA0KPiBJIHdvdWxkIGFy
Z3VlIHRoYXQgdGhlIGN1cnJlbnQgY29kZSBpcyBtb3JlIHJlYWRhYmxlIHRoYXQgeW91ciBw
cm9wb3NlZCBjaGFuZ2UuDQo+IA0KPiBJIGFncmVlIHRoYXQgaXQncyBhIG5vLW9wLCBidXQg
Y29kZSBpcyBub3QganVzdCBhYm91dCBmdW5jdGlvbmFsaXR5IGJ1dCBhbHNvDQo+IHJlYWRh
YmlsaXR5LCBpc24ndCBpdD8NCg0KSSB3b24ndCBhcmd1ZSB3aXRoIHRoYXQsIGJ1dCB0aGUg
ZmxhZyBpdHNlbGYgaXMgd3JvbmcuIA0KRkJJTkZPX0ZMQUdfREVGQVVMVCBpcy93YXMgZm9y
IHN0cnVjdCBmYl9pbmZvLmZsYWdzLiBZb3UgaGF2ZSBzdHJ1Y3QgDQpmYl92aWRlb21vZGUu
ZmxhZy4gVGhlIHZhbGlkIGZsYWdzIGZvciB0aGlzIGZpZWxkIGFyZSBhdCBbMV0uIElmIA0K
YW55dGhpbmcsIHRoZSBmaWVsZCBjb3VsZCBiZSBpbml0aWFsaXplZCB0byBGQl9NT0RFX0lT
X1VOS05PV04sIHdoaWNoIA0KaGFzIHRoZSBzYW1lIHZhbHVlLg0KDQpbMV0gaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9pbmNsdWRlL2xpbnV4L2Zi
LmgjTDY4MQ0KDQo+IA0KPiBBbHNvLCBJIHByZWZlciAic2g6IiBhcyB0aGUgYXJjaGl0ZWN0
dXJlIHByZWZpeCwgbm90ICJhcmNoL3NoOiIuDQoNCk9rLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KPiANCj4gVGhhbmtzLA0KPiBBZHJpYW4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcs
IEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxk
LCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------y6Z9f06cQd6qaNtFSEQ4zER5--

--------------ObI0DIYuPayIMER65keWCwGm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSsDQwFAwAAAAAACgkQlh/E3EQov+Dq
UxAAgxMgxU6Vr1M0nKcJyYj4sBGwi4F9uEC7pJWH9/enjSUh+BceCBIJjCWRNv6aEUdyY0PT5sdz
dYTeYaX+5Wm02K1aKeDauyMFsWlLCopJjZMbXgEaUTAqSWCnWSZR3G8S/+crcCG7HNMrNrL3cMPn
azjGASDNtOZNOjcei6o2k1mEzVy/no+UPAP6VUY2PD3lfpd+1qXm7bNpsGrK7vJJYZQPfPa2NpSe
aslguDTa278xr+dD9Rf2qJbNt/USGI/Nn8jHi+IW9FigyKiG/tKLu5vf8zYYUihidWYe2YuV1zl5
ALOxcb0CK+KW1htlRCGyOe+YPmY67Qd7iWSQQ4Q/ljzuXy3BfCAZhoTLLhs/26Ne1Gtg/o1Ey59i
v5KC77N8Y41+VgnUuTdjT6vFeIgaZQxTvq/8OTsJ5eAmteQqyUTFZ/Ls+ohLOOtyT7Stjfbv9z8w
/mdVDcfD5sVho5w4yOnVPl1/yNY+WAM9amQq3vJaPwD03CgAYhc/LsfMUKlVsxvPZIpYScmxK0Vg
NugH4iNcFKdkVQxhuwXH7bcINQj7y9TfBTQnG51LfaBrtldkMzbO5IN/m10bkS42GiBQpSNBL6NR
+4AlANALC2HzJi0pctl2TXlRuVJHBQpwyukgc06o5FMJfF6w8fZ3jOU2wxODUTat8spdC/CORdgv
of4=
=M2aI
-----END PGP SIGNATURE-----

--------------ObI0DIYuPayIMER65keWCwGm--
