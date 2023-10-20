Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB927D0AEC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 10:52:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=H/6mMpCt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBddG0N1mz3dDq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 19:52:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=H/6mMpCt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBdcP1XJQz3cDd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 19:51:47 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 49B641F38C;
	Fri, 20 Oct 2023 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697791902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Sx6c/b3BNfpWksSQqdT6HOGDJovBDX7QQg69KCIxqB8=;
	b=H/6mMpCtAKnh+nbWOGqiJShom48YhD3dIGyXjcnl0s71pUvU9EdVkqtMu/5RyWZVdJMLQT
	UYdMvGDL3BszRYLHtzKVT8fW598upc9dFrE+SIlPpuoB3aGbESCz11fEnC0382bLeTCtNK
	wP8RnmthrxuWRwt+sZUIXjWtOzxyPpE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E7EDB138E2;
	Fri, 20 Oct 2023 08:51:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id x0ctN50/MmVuLAAAMHmgww
	(envelope-from <jgross@suse.com>); Fri, 20 Oct 2023 08:51:41 +0000
Message-ID: <36c9298d-2052-42de-9ef4-135c120a2417@suse.com>
Date: Fri, 20 Oct 2023 10:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvc/xen: fix event channel handling for secondary
 consoles
To: David Woodhouse <dwmw2@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <72609f999d9451c13240acb8e4a4e54f8c62f542.camel@infradead.org>
Content-Language: en-US
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
In-Reply-To: <72609f999d9451c13240acb8e4a4e54f8c62f542.camel@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZlGG2j4tKEV7xmIaEUbPt7TK"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.76
X-Spamd-Result: default: False [-6.76 / 50.00];
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
	 BAYES_HAM(-0.77)[84.34%];
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
--------------ZlGG2j4tKEV7xmIaEUbPt7TK
Content-Type: multipart/mixed; boundary="------------00whzQoLz1xVw85756gzGJ00";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dawei Li <set_pte_at@outlook.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Paul Durrant <paul@xen.org>
Message-ID: <36c9298d-2052-42de-9ef4-135c120a2417@suse.com>
Subject: Re: [PATCH] hvc/xen: fix event channel handling for secondary
 consoles
References: <72609f999d9451c13240acb8e4a4e54f8c62f542.camel@infradead.org>
In-Reply-To: <72609f999d9451c13240acb8e4a4e54f8c62f542.camel@infradead.org>

--------------00whzQoLz1xVw85756gzGJ00
Content-Type: multipart/mixed; boundary="------------gXm9r0J0R4GhK6yQaAcHe0Me"

--------------gXm9r0J0R4GhK6yQaAcHe0Me
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMTAuMjMgMDE6NDYsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4gRnJvbTogRGF2
aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4NCj4gDQo+IFRoZSB4ZW5jb25zX2Nv
bm5lY3RfYmFja2VuZCgpIGZ1bmN0aW9uIGFsbG9jYXRlcyBhIGxvY2FsIGludGVyZG9tYWlu
DQo+IGV2ZW50IGNoYW5uZWwgd2l0aCB4ZW5idXNfYWxsb2NfZXZ0Y2huKCksIHRoZW4gY2Fs
bHMNCj4gYmluZF9pbnRlcmRvbWFpbl9ldnRjaG5fdG9faXJxX2xhdGVlb2koKSB0byBiaW5k
IHRvIHRoYXQgcG9ydCMgb24gdGhlDQo+ICpyZW1vdGUqIGRvbWFpbi4NCj4gDQo+IFRoYXQg
ZG9lc24ndCB3b3JrIHZlcnkgd2VsbDoNCj4gDQo+IChxZW11KSBkZXZpY2VfYWRkIHhlbi1j
b25zb2xlLGlkPWNvbjEsY2hhcmRldj1wdHkwDQo+IFsgICA0NC4zMjM4NzJdIHhlbmNvbnNv
bGUgY29uc29sZS0xOiAyIHhlbmJ1c19kZXZfcHJvYmUgb24gZGV2aWNlL2NvbnNvbGUvMQ0K
PiBbICAgNDQuMzIzOTk1XSB4ZW5jb25zb2xlOiBwcm9iZSBvZiBjb25zb2xlLTEgZmFpbGVk
IHdpdGggZXJyb3IgLTINCj4gDQo+IEZpeCBpdCB0byB1c2UgYmluZF9ldnRjaG5fdG9faXJx
X2xhdGVlb2koKSwgd2hpY2ggZG9lcyB0aGUgcmlnaHQgdGhpbmcNCj4gYnkganVzdCBiaW5k
aW5nIHRoYXQgKmxvY2FsKiBldmVudCBjaGFubmVsIHRvIGFuIGlycS4gVGhlIGJhY2tlbmQg
d2lsbA0KPiBkbyB0aGUgaW50ZXJkb21haW4gYmluZGluZy4NCj4gDQo+IFRoaXMgZGlkbid0
IGFmZmVjdCB0aGUgcHJpbWFyeSBjb25zb2xlIGJlY2F1c2UgdGhlIHNldHVwIGZvciB0aGF0
IGlzDQo+IHNwZWNpYWwg4oCUIHRoZSB0b29sc3RhY2sgYWxsb2NhdGVzIHRoZSBndWVzdCBl
dmVudCBjaGFubmVsIGFuZCB0aGUgZ3Vlc3QNCj4gZGlzY292ZXJzIGl0IHdpdGggSFZNT1Bf
Z2V0X3BhcmFtLg0KPiANCj4gT25jZSB0aGF0J3MgZml4ZWQsIHRoZXJlJ3MgYWxzbyBhIHdh
cm5pbmcgb24gaG90LXVucGx1ZyBiZWNhdXNlDQo+IHhlbmNvbnNfZGlzY29ubmVjdF9iYWNr
ZW5kKCkgdW5jb25kaXRpb25hbGx5IGNhbGxzIGZyZWVfaXJxKCkgdmlhDQo+IHVuYmluZF9m
cm9tX2lycWhhbmRsZXIoKToNCj4gDQo+IChxZW11KSBkZXZpY2VfZGVsIGNvbjENCj4gWyAg
IDMyLjA1MDkxOV0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+IFsg
ICAzMi4wNTA5NDJdIFRyeWluZyB0byBmcmVlIGFscmVhZHktZnJlZSBJUlEgMzMNCj4gWyAg
IDMyLjA1MDk5MF0gV0FSTklORzogQ1BVOiAwIFBJRDogNTEgYXQga2VybmVsL2lycS9tYW5h
Z2UuYzoxODk1IF9fZnJlZV9pcnErMHgxZDQvMHgzMzANCj4gDQo+IEZpeCB0aGF0IGJ5IGNh
bGxpbmcgbm90aWZpZXJfZGVsX2lycSgpIGZpcnN0LCB3aGljaCBvbmx5IGNhbGxzDQo+IGZy
ZWVfaXJxKCkgaWYgdGhlIGlycSB3YXMgcmVxdWVzdGVkIGluIHRoZSBmaXJzdCBwbGFjZS4g
VGhlbiB1c2UNCg0KSSBkb24ndCB0aGluayB0aGUgImlmIHRoZSBpcnEgd2FzIHJlcXVlc3Rl
ZCBpbiB0aGUgZmlyc3QgcGxhY2UiIGlzIHRoZSBjb3JyZWN0DQpyZWFzb25pbmcuDQoNCkkg
dGhpbmsgdGhlIHByb2JsZW0gaXMgdGhhdCBub3RpZmllcl9kZWxfaXJxKCkgd2lsbCBiZSBj
YWxsZWQgYW5vdGhlciB0aW1lDQp0aHJvdWdoIHRoZSAubm90aWZpZXJfZGVsIGhvb2suIFR3
byBjYWxscyBvZiBub3RpZmllcl9kZWxfaXJxKCkgYXJlIGZpbmUsIGJ1dA0Kb25lIGNhbGwg
b2YgaXQgYW5kIGFub3RoZXIgY2FsbCBvZiBmcmVlX2lycSgpIHZpYSB1bmJpbmRfZnJvbV9p
cnFoYW5kbGVyKCkgaXMNCmEgcHJvYmxlbS4NCg0KPiBldnRjaG5fcHV0KCkgdG8gcmVsZWFz
ZSB0aGUgaXJxIGFuZCBldmVudCBjaGFubmVsLiBBdm9pZCBjYWxsaW5nDQo+IHhlbmJ1c19m
cmVlX2V2dGNobigpIGluIHRoZSBub3JtYWwgY2FzZSwgYXMgZXZ0Y2huX3B1dCgpIHdpbGwg
ZG8gdGhhdA0KPiB0b28uIFRoZSBvbmx5IHRpbWUgeGVuYnVzX2ZyZWVfZXZ0Y2huKCkgbmVl
ZHMgdG8gYmUgY2FsbGVkIGlzIGZvciB0aGUNCj4gY2xlYW51cCB3aGVuIGJpbmRfZXZ0Y2hu
X3RvX2lycV9sYXRlZW9pKCkgZmFpbHMuDQo+IA0KPiBGaW5hbGx5LCBmaXggdGhlIGVycm9y
IHBhdGggaW4geGVuX2h2Y19pbml0KCkgd2hlbiB0aGVyZSdzIG5vIHByaW1hcnkNCj4gY29u
c29sZS4gSXQgc2hvdWxkIHN0aWxsIHJlZ2lzdGVyIHRoZSBmcm9udGVuZCBkcml2ZXIsIGFz
IHRoZXJlIG1heSBiZQ0KPiBzZWNvbmRhcnkgY29uc29sZXMuIChRZW11IGNhbiBhbHdheXMg
YWRkIHNlY29uZGFyeSBjb25zb2xlcywgYnV0IG9ubHkNCj4gdGhlIHRvb2xzdGFjayBjYW4g
YWRkIHRoZSBwcmltYXJ5IGJlY2F1c2UgaXQncyBzcGVjaWFsLikNCj4gDQo+IEZpeGVzOiBm
ZTQxNTE4NmI0ICgieGVuL2NvbnNvbGU6IGhhcmRlbiBodmNfeGVuIGFnYWluc3QgZXZlbnQg
Y2hhbm5lbCBzdG9ybXMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3
bXdAYW1hem9uLmNvLnVrPg0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KDQpXaXRo
IGFib3ZlIGZpeGVkIGluIHRoZSBjb21taXQgbWVzc2FnZToNCg0KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------gXm9r0J0R4GhK6yQaAcHe0Me
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------gXm9r0J0R4GhK6yQaAcHe0Me--

--------------00whzQoLz1xVw85756gzGJ00--

--------------ZlGG2j4tKEV7xmIaEUbPt7TK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUyP50FAwAAAAAACgkQsN6d1ii/Ey/Q
Qgf/bvZD/IabgI1gRWTi/vIi1b36ZkMGWfFnZbXCE1ND8eGlezRgQDri0Zt+l9DG62juTECd/BSM
ZD2OAulGS3VceLcWhbplqrwGs+OrexJJfkFWwd/p0FtPwQPr9r4ClX+FeF3wGQlUd7XOwVeMoJr8
TQ3pNdq38O9paW620O466JhS6PE0lGK7eaiO07I6Z0ICtgRMgWZgmB4jIuHjXMZfQg6Zhm0f3gRg
MNM7mblE7vegLv8jZHceGXDJLONRZFABQ+s+5JopsQ08Tr1AfJb31fAFouakveuarF+6RsQyCr3u
H4X3DPB0mb0S9Wvlb0HzFlawhCK++tp/ljaQEgCnPA==
=24Co
-----END PGP SIGNATURE-----

--------------ZlGG2j4tKEV7xmIaEUbPt7TK--
