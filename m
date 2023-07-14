Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 102D37538B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 12:47:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JZN2yI8r;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/epw2Tag;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2Sqc4tHCz3cBV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 20:47:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JZN2yI8r;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/epw2Tag;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2Spg4MmVz3c4X
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 20:47:07 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7ECEB1FD8E;
	Fri, 14 Jul 2023 10:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689331623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i6h55HQftgQvvkADA67nYyBV+C/0slxTlkvYG6YPBpQ=;
	b=JZN2yI8rzL18Kd+zDHxd/TnFZF8NcWznRSUZbF+sDr4OinPC2cSxFcSkTAzJSwhPTy5GER
	8RR7GB8vyS+yJ9Vrf2sPB8e5nfnWH646KN34d0NT1VKITWZcIQd3H5Uf54bGaP42JBn9z2
	caBWuuGKXdn5VW0NsACfB7CapldgqfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689331623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i6h55HQftgQvvkADA67nYyBV+C/0slxTlkvYG6YPBpQ=;
	b=/epw2TagvC6JEinSwpHEJxmj1PG/pM/YY2ZPJdrmm2KOfeJr3f2ATmf8+LQH8TDFG9gdkX
	Z7hM/OF80gyVoJCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 060C213A15;
	Fri, 14 Jul 2023 10:47:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qw1yO6YnsWQgHgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 14 Jul 2023 10:47:02 +0000
Message-ID: <12d980f4-e681-378d-6d94-da5cc6be5210@suse.de>
Date: Fri, 14 Jul 2023 12:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/18] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20230714075155.5686-1-tzimmermann@suse.de>
 <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
 <47a3ab8d-5e8c-db2c-fcde-5c2b1bac32aa@suse.de>
 <b3c23ea3-f46c-43b9-b12a-9f55de2294c6@kadam.mountain>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b3c23ea3-f46c-43b9-b12a-9f55de2294c6@kadam.mountain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vCsdIumFTGHoRkqMx9FMKvYN"
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
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, javierm@redhat.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vCsdIumFTGHoRkqMx9FMKvYN
Content-Type: multipart/mixed; boundary="------------Nh1ETrjj519EbQRvF1jjXvLz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org,
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 deller@gmx.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Message-ID: <12d980f4-e681-378d-6d94-da5cc6be5210@suse.de>
Subject: Re: [PATCH v3 00/18] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
References: <20230714075155.5686-1-tzimmermann@suse.de>
 <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
 <47a3ab8d-5e8c-db2c-fcde-5c2b1bac32aa@suse.de>
 <b3c23ea3-f46c-43b9-b12a-9f55de2294c6@kadam.mountain>
In-Reply-To: <b3c23ea3-f46c-43b9-b12a-9f55de2294c6@kadam.mountain>

--------------Nh1ETrjj519EbQRvF1jjXvLz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDcuMjMgdW0gMTI6Mjkgc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBP
biBGcmksIEp1bCAxNCwgMjAyMyBhdCAxMjoyNDowNVBNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+Pg0KPj4+PiAgICAgZmJkZXY6IFJlbW92ZSBmbGFnIEZCSU5GT19E
RUZBVUxUIGZyb20gZmJkZXYgZHJpdmVycw0KPj4+PiAgICAgZmJkZXY6IFJlbW92ZSBmbGFn
IEZCSU5GT19ERUZBVUxUIGZyb20gZmJkZXYgZHJpdmVycw0KPj4+PiAgICAgZmJkZXY6IFJl
bW92ZSBmbGFnIEZCSU5GT19ERUZBVUxUIGZyb20gZmJkZXYgZHJpdmVycw0KPj4+PiAgICAg
ZmJkZXY6IFJlbW92ZSBmbGFnIEZCSU5GT19ERUZBVUxUIGZyb20gZmJkZXYgZHJpdmVycw0K
Pj4NCj4+DQo+PiBJIHdhc24ndCBoYXBweSBhYm91dCB0aGlzIGVpdGhlci4gQnV0IEkgY291
bGQgbm90IGNvbWUgdXAgd2l0aCBhIGRlc2NyaXB0aW9uDQo+PiB0aGF0IGZpdHMgaW50byB0
aGUgNzQtY2hhciBsaW1pdCBmb3IgZWFjaCBjb21taXQuIFRoZXkgb25seSBkaWZmZXIgaW4g
dGhlDQo+PiBtZXRob2Qgb2YgbWVtb3J5IGFsbG9jYXRpb24uIERvIHlvdSBoYXZlIGFueSBp
ZGVhcz8NCj4gDQo+IGZiZGV2OiBSZW1vdmUgRkJJTkZPX0RFRkFVTFQgZnJvbSBzdGF0aWMg
c3RydWN0cw0KPiBmYmRldjogUmVtb3ZlIEZCSU5GT19ERUZBVUxUIGZyb20ga3phbGxvYygp
IHN0cnVjdHMNCj4gZmJkZXY6IFJlbW92ZSBGQklORk9fREVGQVVMVCBmcm9tIGRldm1fa3ph
bGxvYygpIHN0cnVjdHMNCg0KU291bmRzIGdvb2QsIEknbGwgdXNlIHRoYXQuIFRoYW5rcyEN
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gcmVnYXJkcywNCj4gZGFuIGNhcnBl
bnRlcg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------Nh1ETrjj519EbQRvF1jjXvLz--

--------------vCsdIumFTGHoRkqMx9FMKvYN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSxJ6YFAwAAAAAACgkQlh/E3EQov+Bc
Ww//WC0tumM5S+EfD4Q3tfllL5EPhego1FSEQVXnQdTPZc8IN3W/NQ8i9WsQ6fo9LKFvVgpf95fb
Kfd8xqKPvezuQuHVb2IAFP7ibxikAyWlb4WNOFJB4Ah0CMaPvo84TGqc1PsVTLxN4RjfxW1TIWo/
tTSL1DLFkQcZyyf9Ob45Xhziifbry/gBRBLnFod84polfZ43cqBSY3/Hq2LjXpJCQTj9Hqr46qe6
B48hMgAHnh80y+nol5nDEpssM51l6ZHeoHTjmyzfZRGqSKVPLWqIj+ptehPA119yW2bUvFILYbJy
RbZitdzmNooqtDyQ+6Pz4UKvyYr0nROzPQSwNoOLXMl8RZ5THCdy0yS734X7KL5NoVH0CM7O7olG
5tDK5ZzrMItI+Q1OZALGcEJ6T+gFPn+lIvE8EIeY0aFS+rrtSYA2ATXOjI08LVKAF9ATH7+RiDQX
owVo7azYHBZshazZ1oYIzErxlpf1eBhF9c8I2+nL7uVgG4QtfFt/xIVifp/DOWfRdRNKgelVhi33
a9bW51tp/GdqwqIdJ/QeLWUpbJT7kDVinHpA8PqYaTI3Z6TlWR1n+/2UN7pj2QE3YSwIwLBMdgv4
ZD+RBXHdIo8W4ChCFELPyYjW9ixpmLgCNjta6dhBpYODkuM0XtTLdHmTqOkISlup+qdi9vk/9H8t
Cbg=
=ZWbe
-----END PGP SIGNATURE-----

--------------vCsdIumFTGHoRkqMx9FMKvYN--
