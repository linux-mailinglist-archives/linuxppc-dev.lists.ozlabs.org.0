Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224B582238
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 10:34:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt6Wf2JvCz3cjP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 18:34:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Pyym5C/t;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+Tybj6w4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Pyym5C/t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+Tybj6w4;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt6W01x7sz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 18:33:31 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3D01C204E5;
	Wed, 27 Jul 2022 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658910808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F45SS5cTvHcQQSA17+r3SzCVX3lAo+v4bUaGHLw2tVY=;
	b=Pyym5C/tmSvvOVDyyNf1yimejBz4pesGQedi0fHoxl1dLLHVZlqyE8bxzRtUn95KIlgLw4
	8j+M213MtfyA7Ctiq6MDwVMDNqb44Nao1koO2jLbsJ82FOBjdvWe4b2/qdM08kB6GuesRT
	ttdz3gdMrGQJH/Ab6egl5g/NGzEffhQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658910808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F45SS5cTvHcQQSA17+r3SzCVX3lAo+v4bUaGHLw2tVY=;
	b=+Tybj6w4VIvWQH5SGeTonzsKTJh3aHrmgUOQGTxrAyIf9vUtwf6ihuXhUvfPG79LGqc+sC
	72fZNdvSh6Jq6ADw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F23DA13A8E;
	Wed, 27 Jul 2022 08:33:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gD0XOlf44GJQMQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 08:33:27 +0000
Message-ID: <eb2945c3-dd02-7adf-1dc7-523bf3762fec@suse.de>
Date: Wed, 27 Jul 2022 10:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-10-tzimmermann@suse.de>
 <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
 <20220726144024.GP17705@kitsune.suse.cz>
 <90aef621-b686-12dd-de55-9a680f5783d7@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <90aef621-b686-12dd-de55-9a680f5783d7@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GFe1bAx5kBh3H3Py6PP7xodk"
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
Cc: linux-fbdev@vger.kernel.org, sam@ravnborg.org, airlied@linux.ie, deller@gmx.de, mark.cave-ayland@ilande.co.uk, dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech, geert@linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GFe1bAx5kBh3H3Py6PP7xodk
Content-Type: multipart/mixed; boundary="------------KKHTR7wNdYo0Hgu5O2OLUugY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, mpe@ellerman.id.au,
 deller@gmx.de, mark.cave-ayland@ilande.co.uk, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech,
 geert@linux-m68k.org, sam@ravnborg.org
Message-ID: <eb2945c3-dd02-7adf-1dc7-523bf3762fec@suse.de>
Subject: Re: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-10-tzimmermann@suse.de>
 <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
 <20220726144024.GP17705@kitsune.suse.cz>
 <90aef621-b686-12dd-de55-9a680f5783d7@redhat.com>
In-Reply-To: <90aef621-b686-12dd-de55-9a680f5783d7@redhat.com>

--------------KKHTR7wNdYo0Hgu5O2OLUugY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjIgdW0gMjE6MjIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIE1pY2hhbCwNCj4gDQo+IE9uIDcvMjYvMjIgMTY6NDAsIE1pY2hh
bCBTdWNow6FuZWsgd3JvdGU6DQo+PiBIZWxsbywNCj4+DQo+PiBPbiBUdWUsIEp1bCAyNiwg
MjAyMiBhdCAwMzozODozN1BNICswMjAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgd3Jv
dGU6DQo+Pj4gT24gNy8yMC8yMiAxNjoyNywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
Pj4+IEFkZCBhIHBlci1tb2RlbCBkZXZpY2UtZnVuY3Rpb24gc3RydWN0dXJlIGluIHByZXBh
cmF0aW9uIG9mIGFkZGluZw0KPj4+PiBjb2xvci1tYW5hZ2VtZW50IHN1cHBvcnQuIERldGVj
dGlvbiBvZiB0aGUgaW5kaXZpZHVhbCBtb2RlbHMgaGFzIGJlZW4NCj4+Pj4gdGFrZW4gZnJv
bSBmYmRldidzIG9mZmIuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+PiAtLS0NCj4+Pg0KPj4+IFJldmll
d2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4N
Cj4+Pg0KPj4+IFsuLi5dDQo+Pj4NCj4+Pj4gK3N0YXRpYyBib29sIGlzX2F2aXZvKF9fYmUz
MiB2ZW5kb3IsIF9fYmUzMiBkZXZpY2UpDQo+Pj4+ICt7DQo+Pj4+ICsJLyogVGhpcyB3aWxs
IG1hdGNoIG1vc3QgUjV4eCAqLw0KPj4+PiArCXJldHVybiAodmVuZG9yID09IDB4MTAwMikg
JiYNCj4+Pj4gKwkgICAgICAgKChkZXZpY2UgPj0gMHg3MTAwICYmIGRldmljZSA8IDB4Nzgw
MCkgfHwgKGRldmljZSA+PSAweDk0MDApKTsNCj4+Pj4gK30NCj4+Pg0KPj4+IE1heWJlIGFk
ZCBzb21lIGNvbnN0YW50IG1hY3JvcyB0byBub3QgaGF2ZSB0aGVzZSBtYWdpYyBudW1iZXJz
ID8NCj4+DQo+PiBUaGlzIGlzIGJhc2VkIG9uIHRoZSBleGlzdGluZyBmYmRldiBpbXBsZW1l
bnRhdGlvbidzIG1hZ2ljIG51bWJlcnM6DQo+Pg0KPj4gZHJpdmVycy92aWRlby9mYmRldi9v
ZmZiLmM6ICAgICAgICAgICAgICAgICAoKCpkaWQgPj0gMHg3MTAwICYmICpkaWQgPCAweDc4
MDApIHx8DQo+Pg0KPiANCj4gQWgsIEkgc2VlLiBUaGVuIHdlIG1pZ2h0IGhhdmUgdG8gZ28g
d2l0aCB0aGUgbWFnaWMgbnVtYmVycy4uLg0KPiAgIA0KPj4gT2YgY291cnNlLCBpdCB3b3Vs
ZCBiZSBncmVhdCBpZiBzb21lYm9keSBrbm93bGVkZ2VhYmxlIGNvdWxkIGNsYXJpZnkNCj4+
IHRob3NlLg0KDQpUaG9zZSBhcmUgUENJIGlkcy4gSWYgSSBmaW5kIHRoZW0gYWxyZWFkeSBk
ZWZpbmVkLCBJJ2xsIHVzZSB0aGUgbWFjcm9zIA0KaW5zdGVhZC4NCg0KQmVzdCByZWdhcmRz
DQpUaG9tYXMNCg0KPj4NCj4gDQo+IEluZGVlZC4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------KKHTR7wNdYo0Hgu5O2OLUugY--

--------------GFe1bAx5kBh3H3Py6PP7xodk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLg+FcFAwAAAAAACgkQlh/E3EQov+DL
HQ//W0i/DfBxU9yWTrRzhX8PNkOm/PPl4KJkOslegBGwOhwZqbpO6Cj2cUOIJqLacrCA1CewC/Ti
Swl7VeI3VoAeQm9lrxf4b81VrNcbUBlcGjVif2xqLvv8nDbEyrmbezYAzMMnCpS5rTPncB1GHAkD
9zWbzcQ+XOzSp1h8w38JJ9L6184qKbWe4RO6JFQd+1p/XxEGUTCAKJnJ53ZvxMdjRz0064DjnBFL
uc+sN7BllZyw5PO6UECABJGxcFbeU/3rEb1be04uMNI7KIe9+7tZH9cpvoPreMGk49i6hbDTATro
azbVjP0MNPbqJbVE1smoXh8sDZ7mQ6GYpM7lJBcuPl/Ct30b25zG9iN8Oc1Ytsh5bm4ZzfcdV34e
3cs+8kuJkZQSL9XpERN+42cyCo9zR0OX8K/lYtGz8QqzkWsU8fWHtgSdExFQFW8XhSNbQt/allyW
U7HIG8L5m1yQwZoVsfFSCwxsrUzWcR3i+5v2jl0LZqTngyyuYBLAFT1xW/b23HRRZHvNZOAo4qhS
luVhLJSoldyaKT+2nOSEcIZjMYlhA0w0GCz3G9NJiqezlIxEGcm1024t3btmO9mwoF7toMDHxVTy
ZPNC4XMmwGK68bTIayHuGHSA/YYPC9aWbarOe2J0AojzqxXxgJUefnVSdK3BZQsUo2JXaCFASZEe
Jac=
=ZwVb
-----END PGP SIGNATURE-----

--------------GFe1bAx5kBh3H3Py6PP7xodk--
