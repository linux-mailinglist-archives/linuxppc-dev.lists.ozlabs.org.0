Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF8067343D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 10:19:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyHBR5767z3fDp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 20:19:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t5RprcE0;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bahfTcQi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t5RprcE0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bahfTcQi;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyH9V12DXz3cdp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 20:18:22 +1100 (AEDT)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1A1415CB81;
	Thu, 19 Jan 2023 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674119895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IhuKtN5ZwbeG1LAf/6K0MDNaLb/wViy9esipSpVoFLc=;
	b=t5RprcE0j3cdg8tIz0IBtODICr+D6h41Pp1LZBdUwd5L80Pf4cQ5rAkYUhhDYBkpEEvC8H
	CuM+2+JA29urDYeAMetRaR6kpXejpRA0sAkxoIKT3yqJ8toEh/4H3ioO397/ZLLx4ygOW4
	Onc3VkBTVPCwl+2zqPzXKVmErsMGV2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674119895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IhuKtN5ZwbeG1LAf/6K0MDNaLb/wViy9esipSpVoFLc=;
	b=bahfTcQijQdhjZYF27wRwvQ9/hoUfGJRshc/JONbJZ+36qIzQIpRm4+AKR/jUP8t9hDhgq
	tG3cSGxmpn8JBFBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E203B13644;
	Thu, 19 Jan 2023 09:18:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA
	id Sb5FNtYKyWMCLQAAGKfGzw
	(envelope-from <tzimmermann@suse.de>); Thu, 19 Jan 2023 09:18:14 +0000
Message-ID: <ecad3a6a-eb49-2383-c7ad-5dce0b80db2d@suse.de>
Date: Thu, 19 Jan 2023 10:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] of: Make of framebuffer devices unique
Content-Language: en-US
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20230117165804.18036-1-msuchanek@suse.de>
 <20230118211305.42e50a4a@yea> <20230118214618.GM16547@kitsune.suse.cz>
 <f57f29a6-1db3-ab0b-a1f7-77074d1c10e8@suse.de>
 <20230119090143.GN16547@kitsune.suse.cz>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230119090143.GN16547@kitsune.suse.cz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kS5si0FILNYfp0FqYO27VThx"
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
Cc: "Erhard F." <erhard_f@mailbox.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Javier Martinez Canillas <javierm@redhat.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kS5si0FILNYfp0FqYO27VThx
Content-Type: multipart/mixed; boundary="------------dWxOVShZWCxF8Yxs6ff3fbWY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Cc: "Erhard F." <erhard_f@mailbox.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Message-ID: <ecad3a6a-eb49-2383-c7ad-5dce0b80db2d@suse.de>
Subject: Re: [PATCH] of: Make of framebuffer devices unique
References: <20230117165804.18036-1-msuchanek@suse.de>
 <20230118211305.42e50a4a@yea> <20230118214618.GM16547@kitsune.suse.cz>
 <f57f29a6-1db3-ab0b-a1f7-77074d1c10e8@suse.de>
 <20230119090143.GN16547@kitsune.suse.cz>
In-Reply-To: <20230119090143.GN16547@kitsune.suse.cz>

--------------dWxOVShZWCxF8Yxs6ff3fbWY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDEuMjMgdW0gMTA6MDEgc2NocmllYiBNaWNoYWwgU3VjaMOhbmVrOg0K
PiBPbiBUaHUsIEphbiAxOSwgMjAyMyBhdCAwOTowMDo0NEFNICswMTAwLCBUaG9tYXMgWmlt
bWVybWFubiB3cm90ZToNCj4+IEhpIE1pY2hhbCwNCj4+DQo+PiB0aGFua3MgZm9yIGZpeGlu
ZyB0aGlzIGlzc3VlLiBCdXQgdGhlIHJldmlldyB0aW1lIHdhcyB3YXkgdG9vIHNob3J0LiBQ
bGVhc2UNCj4+IHNlZSBteSBjb21tZW50cyBiZWxvdy4NCj4+DQo+PiBBbSAxOC4wMS4yMyB1
bSAyMjo0NiBzY2hyaWViIE1pY2hhbCBTdWNow6FuZWs6DQo+Pj4gT24gV2VkLCBKYW4gMTgs
IDIwMjMgYXQgMDk6MTM6MDVQTSArMDEwMCwgRXJoYXJkIEYuIHdyb3RlOg0KPj4+PiBPbiBU
dWUsIDE3IEphbiAyMDIzIDE3OjU4OjA0ICswMTAwDQo+Pj4+IE1pY2hhbCBTdWNoYW5layA8
bXN1Y2hhbmVrQHN1c2UuZGU+IHdyb3RlOg0KPj4+Pg0KPj4+Pj4gU2luY2UgTGludXggNS4x
OSB0aGlzIGVycm9yIGlzIG9ic2VydmVkOg0KPj4+Pj4NCj4+Pj4+IHN5c2ZzOiBjYW5ub3Qg
Y3JlYXRlIGR1cGxpY2F0ZSBmaWxlbmFtZSAnL2RldmljZXMvcGxhdGZvcm0vb2YtZGlzcGxh
eScNCj4+Pj4+DQo+Pj4+PiBUaGlzIGlzIGJlY2F1c2UgbXVsdGlwbGUgZGV2aWNlcyB3aXRo
IHRoZSBzYW1lIG5hbWUgJ29mLWRpc3BsYXknIGFyZQ0KPj4+Pj4gY3JlYXRlZCBvbiB0aGUg
c2FtZSBidXMuDQo+Pj4+Pg0KPj4+Pj4gVXBkYXRlIHRoZSBjb2RlIHRvIGNyZWF0ZSBudW1i
ZXJlZCBkZXZpY2UgbmFtZXMgZm9yIHRoZSBub24tYm9vdA0KPj4+Pj4gZGlzYXBsYXkuDQo+
Pj4+Pg0KPj4+Pj4gY2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+Pj4+PiBS
ZWZlcmVuY2VzOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lk
PTIxNjA5NQ0KPj4+Pj4gRml4ZXM6IDUyYjFiNDZjMzlhZSAoIm9mOiBDcmVhdGUgcGxhdGZv
cm0gZGV2aWNlcyBmb3IgT0YgZnJhbWVidWZmZXJzIikNCj4+Pj4+IFJlcG9ydGVkLWJ5OiBF
cmhhcmQgRi4gPGVyaGFyZF9mQG1haWxib3gub3JnPg0KPj4+Pj4gU3VnZ2VzdGVkLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhbCBTdWNoYW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+DQo+Pj4+PiAtLS0N
Cj4+Pj4+ICAgIGRyaXZlcnMvb2YvcGxhdGZvcm0uYyB8IDggKysrKysrKy0NCj4+Pj4+ICAg
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4+
DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9wbGF0Zm9ybS5jIGIvZHJpdmVycy9v
Zi9wbGF0Zm9ybS5jDQo+Pj4+PiBpbmRleCA4MWM4YzIyN2FiNmIuLmYyYTVkNjc5YTMyNCAx
MDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvb2YvcGxhdGZvcm0uYw0KPj4+Pj4gKysrIGIv
ZHJpdmVycy9vZi9wbGF0Zm9ybS5jDQo+Pj4+PiBAQCAtNTI1LDYgKzUyNSw3IEBAIHN0YXRp
YyBpbnQgX19pbml0IG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGVfaW5pdCh2b2lkKQ0K
Pj4+Pj4gICAgCWlmIChJU19FTkFCTEVEKENPTkZJR19QUEMpKSB7DQo+Pj4+PiAgICAJCXN0
cnVjdCBkZXZpY2Vfbm9kZSAqYm9vdF9kaXNwbGF5ID0gTlVMTDsNCj4+Pj4+ICAgIAkJc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqZGV2Ow0KPj4+Pj4gKwkJaW50IGRpc3BsYXlfbnVtYmVy
ID0gMTsNCj4+Pj4+ICAgIAkJaW50IHJldDsNCj4+Pj4+ICAgIAkJLyogQ2hlY2sgaWYgd2Ug
aGF2ZSBhIE1hY09TIGRpc3BsYXkgd2l0aG91dCBhIG5vZGUgc3BlYyAqLw0KPj4+Pj4gQEAg
LTU2MSwxMCArNTYyLDE1IEBAIHN0YXRpYyBpbnQgX19pbml0IG9mX3BsYXRmb3JtX2RlZmF1
bHRfcG9wdWxhdGVfaW5pdCh2b2lkKQ0KPj4+Pj4gICAgCQkJYm9vdF9kaXNwbGF5ID0gbm9k
ZTsNCj4+Pj4+ICAgIAkJCWJyZWFrOw0KPj4+Pj4gICAgCQl9DQo+Pj4+PiArDQo+Pj4+PiAg
ICAJCWZvcl9lYWNoX25vZGVfYnlfdHlwZShub2RlLCAiZGlzcGxheSIpIHsNCj4+Pj4+ICsJ
CQljaGFyICpidWZbMTRdOw0KDQpBbm90aGVyIGlzc3VlIGhlcmU6IFRoaXMgc2hvdWxkIHNp
bXBseSBiZSBidWZbMTRdOyBub3QgYSBwb2ludGVyLiBJcyAxNCANCmNoYXJzIGVub3VnaCBm
b3IgdGhlIHN0cmluZyBwbHVzIGEgZnVsbCBudW1iZXI/DQoNCj4+Pj4+ICAgIAkJCWlmICgh
b2ZfZ2V0X3Byb3BlcnR5KG5vZGUsICJsaW51eCxvcGVuZWQiLCBOVUxMKSB8fCBub2RlID09
IGJvb3RfZGlzcGxheSkNCj4+Pj4+ICAgIAkJCQljb250aW51ZTsNCj4+Pj4+IC0JCQlvZl9w
bGF0Zm9ybV9kZXZpY2VfY3JlYXRlKG5vZGUsICJvZi1kaXNwbGF5IiwgTlVMTCk7DQo+Pj4+
PiArCQkJcmV0ID0gc25wcmludGYoYnVmLCAib2YtZGlzcGxheS0lZCIsIGRpc3BsYXlfbnVt
YmVyKyspOw0KDQpUaGUgc2Vjb25kIGFyZ3VtZW50IHRvIHNucHJpbnRmKCkgaXMgc2l6ZW9m
KGJ1Zik7IHRoZSBudW1iZXIgb2YgDQpjaGFyYWN0ZXJzIGluIGJ1Zi4NCg0KPj4NCj4+IFBs
YXRmb3JtIGRldmljZXMgdXNlIGEgc2luZ2xlIGRvdCAoLikgYXMgc2VwYXJhdG9yIGJlZm9y
ZSB0aGUgaW5kZXguDQo+PiBDb3VudGluZyBzdGFydHMgYXQgemVyby4gU2VlIC9zeXMvYnVz
L3BsYXRmb3JtLyBmb3IgZXhhbXBsZXMuIENhbiB3ZSBwbGVhc2UNCj4+IHN0aWNrIHdpdGgg
dGhhdCBzY2hlbWU/IEdlbmVyYXRlZCBuYW1lcyB3b3VsZCB0aGVuIGJlIG9mLWRpc3BsYXku
MCwNCj4+IG9mLWRpc3BsYXkuMSwgZXRjLg0KPiANCj4gWWVzLCB0aGVyZSB3YXMgc3VycHJp
c2luZ2x5IG5vIGJpa2VzaGVkZGluZy4NCj4gDQo+IERvIHdlIGFsc28gd2FudCB0byBjaGFu
Z2UgdGhlIG5hbWUgb2YgdGhlIGRldmljZSB0aGF0IGRpZCBtYW5hZ2UgdG8NCj4gaW5zdGFu
dGlhdGUgYmVmb3JlPw0KPiANCj4gVGhpcyBzY2hlbWUgY2hhbmdlcyB0aGUgbmFtZSBvbmx5
IGZvciB0aG9zZSB0aGF0IGRpZCBub3QgaW4gdGhlIHBhc3QsDQo+IGhlbmNlICJvZi1kaXNw
bGF5IiBhbmQgIm9mLWRpc3BsYXktJWQiLCBzdGFydGluZyBmcm9tIDEuDQoNCkkgZmluZCB0
aGF0IHZlcnkgY29uZnVzaW5nLiBJdCBpcyBpcyBiZXR0ZXIgdG8gY291bnQgYWxsIGRldmlj
ZXMgZnJvbSAwLiANCkkgZG9uJ3QgZXhwZWN0IHRoaXMgdG8gYmUgYW4gaXNzdWUgZm9yIHVz
ZXJzcGFjZS4gQnV0IGlmIG5lY2Vzc2FyeSwgDQpkZXZmcyBjYW4gY3JlYXRlIHNvZnRsaW5r
cyB0byBvZi1kaXNwbGF5LjAuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFN1
cmUsIHJlcGxhY2luZyAnLScgd2l0aCAnLicgaXMgZWFzeSBlbm91Z2gsIGFuZCB1c2luZyB0
aGUgc2FtZSBmb3JtYXQNCj4gZm9yIGJvdGggYXMgd2VsbC4NCj4gDQo+IFRoYW5rcw0KPiAN
Cj4gTWljaGFsDQo+IA0KPj4NCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFzDQo+Pg0KPj4N
Cj4+DQo+Pj4+PiArCQkJaWYgKHJldCA+PSBzaXplb2YoYnVmKSkNCj4+Pj4+ICsJCQkJY29u
dGludWU7DQo+Pj4+PiArCQkJb2ZfcGxhdGZvcm1fZGV2aWNlX2NyZWF0ZShub2RlLCBidWYs
IE5VTEwpOw0KPj4+Pj4gICAgCQl9DQo+Pj4+PiAgICAJfSBlbHNlIHsNCj4+Pj4+IC0tIA0K
Pj4+Pj4gMi4zNS4zDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBUaGFuayB5b3UgZm9yIHRoZSBwYXRj
aCBNaWNoYWwhDQo+Pj4+DQo+Pj4+IEl0IGFwcGxpZXMgb24gNi4yLXJjNCBidXQgSSBnZXQg
dGhpcyBidWlsZCBlcnJvciB3aXRoIG15IGNvbmZpZzoNCj4+Pg0KPj4+IEluZGVlZCwgaXQn
cyBkb3VibHkgYmFkLg0KPj4+DQo+Pj4gV2hlcmUgaXMgdGhlIGtlcm5lbCB0ZXN0IHJvYm90
IHdoZW4geW91IG5lZWQgaXQ/DQo+Pj4NCj4+PiBJdCBzaG91bGQgbm90IGJlIHRoYXQgZWFz
eSB0byBtaXNzIHRoaXMgZmlsZSBidXQgY2xlYXJseSBpdCBjYW4gaGFwcGVuLg0KPj4+DQo+
Pj4gSSB3aWxsIHNlbmQgYSBmaXh1cC4NCj4+Pg0KPj4+IFNvcnJ5IGFib3V0IHRoZSBtZXNz
Lg0KPj4+DQo+Pj4gVGhhbmtzDQo+Pj4NCj4+PiBNaWNoYWwNCj4+DQo+PiAtLSANCj4+IFRo
b21hcyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
Pj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0KPiANCj4gDQo+IA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------dWxOVShZWCxF8Yxs6ff3fbWY--

--------------kS5si0FILNYfp0FqYO27VThx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPJCtYFAwAAAAAACgkQlh/E3EQov+AE
jhAAzm3NXIMj6PZgBQ0sOPzOpFB/x8BsNkJjB/pHWuWTXLENQL6n9gWSJacd6rpJ+TEp1oGyYC+0
Xfxihd+S0tIpjuzduSx8AimBwiQwUAq/65TbPrUigzQAuxj6bvAzUs/TM7LOWaqlQvZpzrALhet+
X4AUQsMUifkOVlmUmmtSlyqstFswBbGY9wW8SsqJDxI2lRi6V/trWGMMF+3vEG+NZH/H5VjdnYKp
wZa0WBY5T5DaQ6TgDlGdjUAqYbIqDpyvW3egn1ukpGJbfVokZDN7X+vRaG4bnCadPB12nMIUb1FV
a5pGPR9husPKr9GzyFUimT/JEgjcudHTQrpnWJWIRsOPKcMDpjbaQthvvA33W3M+/kIAgLtRDsYi
LRJCTf5KqrQHYC7z/X+hC5gwC0es/lYLbqUAJomij/zGAwQr+d37iMQ1vpW7kYH+j8LMa8SmEUYg
Ik/3MpmD7N4SkoE+xdnioKOgoRv6veEw05mt1mGieT2THLKSdauhfDg7y2QwN5qSansMgT9CcMlY
JFH0+8MY4XVsFVroHgok9ez5HziGvx5xoPJ+1yCAxfHvxLMfCPHjTOZW2aYDHOJ4v3SaYXH0G0H8
aYhRLOQggnGLxYrcFHWxlYb1Xu+gRdb49DsnK/5AJJ+FdXsmxsUHI1Y7Jqsv0Ntx5xM97MXxU6XM
5Co=
=IlLL
-----END PGP SIGNATURE-----

--------------kS5si0FILNYfp0FqYO27VThx--
