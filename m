Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5EC506DC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 15:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjQ2z1sYBz3bZX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 23:42:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fgboA1x+;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NbxbkNkB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fgboA1x+; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NbxbkNkB; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjQ2H5jTBz2xBF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 23:41:43 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 007BD2112B;
 Tue, 19 Apr 2022 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650375699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OU924VncPndQwLZyBXE5JWyC1rgAj1xobyIWoZiX7+w=;
 b=fgboA1x+o5bDijssIofMI7BJHQYsy4PSPUIdBRcrfcLF0FI6qBXbLuvHF64hI2w+E4iSKu
 dmMFNuwRfGrAEomEMe8gf7xYuU5rI/AgyjbDlD8LJcyLDtkvcmTtzW0S/+AO5P4tT32Cz1
 Lg4o12K1srfbbY2Yy3wTPeaY9UsW4Uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650375699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OU924VncPndQwLZyBXE5JWyC1rgAj1xobyIWoZiX7+w=;
 b=NbxbkNkBAUZOMG/8GB1TtbxlLg5awOQvOTbJZbeCA2bQfiu3Bm5wgJ/CdBGoUZm/L7sFbk
 pdti2XXM+wk7uHBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB239139BE;
 Tue, 19 Apr 2022 13:41:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jLLLLBK8XmIiDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Apr 2022 13:41:38 +0000
Message-ID: <5f7d1b9e-4c92-13b1-8556-ab67f17846cc@suse.de>
Date: Tue, 19 Apr 2022 15:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] of: Create platform devices for OF framebuffers
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220419100405.12600-1-tzimmermann@suse.de>
 <20220419100405.12600-2-tzimmermann@suse.de>
 <Yl65by+ZjQdK8nIv@robh.at.kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Yl65by+ZjQdK8nIv@robh.at.kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------H2Ei4jFDsCdAEGbJSqAuxH3d"
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, sam@ravnborg.org,
 frowand.list@gmail.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------H2Ei4jFDsCdAEGbJSqAuxH3d
Content-Type: multipart/mixed; boundary="------------V6Ezpezy3p0yw0t0S0BNfgzr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 frowand.list@gmail.com, deller@gmx.de, linuxppc-dev@lists.ozlabs.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, paulus@samba.org,
 mpe@ellerman.id.au, sam@ravnborg.org, linux@roeck-us.net
Message-ID: <5f7d1b9e-4c92-13b1-8556-ab67f17846cc@suse.de>
Subject: Re: [PATCH v2 1/2] of: Create platform devices for OF framebuffers
References: <20220419100405.12600-1-tzimmermann@suse.de>
 <20220419100405.12600-2-tzimmermann@suse.de>
 <Yl65by+ZjQdK8nIv@robh.at.kernel.org>
In-Reply-To: <Yl65by+ZjQdK8nIv@robh.at.kernel.org>

--------------V6Ezpezy3p0yw0t0S0BNfgzr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDQuMjIgdW0gMTU6MzAgc2NocmllYiBSb2IgSGVycmluZzoNCi4uLg0K
Pj4gLSNpZm5kZWYgQ09ORklHX1BQQw0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCByZXNlcnZlZF9tZW1fbWF0Y2hlc1tdID0gew0KPj4gICAJeyAuY29tcGF0aWJs
ZSA9ICJxY29tLHJtdGZzLW1lbSIgfSwNCj4+ICAgCXsgLmNvbXBhdGlibGUgPSAicWNvbSxj
bWQtZGIiIH0sDQo+PiBAQCAtNTIwLDMzICs1MTksODEgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgcmVzZXJ2ZWRfbWVtX21hdGNoZXNbXSA9IHsNCj4+ICAgDQo+PiAg
IHN0YXRpYyBpbnQgX19pbml0IG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGVfaW5pdCh2
b2lkKQ0KPj4gICB7DQo+PiAtCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZTsNCj4+IC0NCj4g
DQo+IEFzIGJvdGggaWYvZWxzZSBjbGF1c2VzIG5lZWQgJ25vZGUnLCBJJ2Qga2VlcCB0aGlz
IGRlY2xhcmVkIGhlcmUuDQoNCk9rLg0KDQo+IA0KPj4gICAJZGV2aWNlX2xpbmtzX3N1cHBs
aWVyX3N5bmNfc3RhdGVfcGF1c2UoKTsNCj4+ICAgDQo+PiAgIAlpZiAoIW9mX2hhdmVfcG9w
dWxhdGVkX2R0KCkpDQo+PiAgIAkJcmV0dXJuIC1FTk9ERVY7DQo+PiAgIA0KPj4gLQkvKg0K
Pj4gLQkgKiBIYW5kbGUgY2VydGFpbiBjb21wYXRpYmxlcyBleHBsaWNpdGx5LCBzaW5jZSB3
ZSBkb24ndCB3YW50IHRvIGNyZWF0ZQ0KPj4gLQkgKiBwbGF0Zm9ybV9kZXZpY2VzIGZvciBl
dmVyeSBub2RlIGluIC9yZXNlcnZlZC1tZW1vcnkgd2l0aCBhDQo+PiAtCSAqICJjb21wYXRp
YmxlIiwNCj4+IC0JICovDQo+PiAtCWZvcl9lYWNoX21hdGNoaW5nX25vZGUobm9kZSwgcmVz
ZXJ2ZWRfbWVtX21hdGNoZXMpDQo+PiAtCQlvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlKG5v
ZGUsIE5VTEwsIE5VTEwpOw0KPj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfUFBDKSkgew0K
Pj4gKwkJc3RydWN0IGRldmljZV9ub2RlICpib290X2Rpc3BsYXkgPSBOVUxMOw0KPj4gKwkJ
c3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KPj4gKwkJc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqZGV2Ow0KPj4gKwkJaW50IHJldDsNCj4+ICsNCj4+ICsJCS8qIENoZWNrIGlmIHdlIGhh
dmUgYSBNYWNPUyBkaXNwbGF5IHdpdGhvdXQgYSBub2RlIHNwZWMgKi8NCj4+ICsJCWlmIChv
Zl9nZXRfcHJvcGVydHkob2ZfY2hvc2VuLCAibGludXgsYm9vdHgtbm9zY3JlZW4iLCBOVUxM
KSkgew0KPj4gKwkJCS8qDQo+PiArCQkJICogVGhlIG9sZCBjb2RlIHRyaWVkIHRvIHdvcmsg
b3V0IHdoaWNoIG5vZGUgd2FzIHRoZSBNYWNPUw0KPj4gKwkJCSAqIGRpc3BsYXkgYmFzZWQg
b24gdGhlIGFkZHJlc3MuIEknbSBkcm9wcGluZyB0aGF0IHNpbmNlIHRoZQ0KPj4gKwkJCSAq
IGxhY2sgb2YgYSBub2RlIHNwZWMgb25seSBoYXBwZW5zIHdpdGggb2xkIEJvb3RYIHZlcnNp
b25zDQo+PiArCQkJICogKHVzZXJzIGNhbiB1cGRhdGUpIGFuZCB3aXRoIHRoaXMgY29kZSwg
dGhleSdsbCBzdGlsbCBnZXQNCj4+ICsJCQkgKiBhIGRpc3BsYXkgKGp1c3Qgbm90IHRoZSBw
YWxldHRlIGhhY2tzKS4NCj4+ICsJCQkgKi8NCj4+ICsJCQlkZXYgPSBwbGF0Zm9ybV9kZXZp
Y2VfYWxsb2MoImJvb3R4LW5vc2NyZWVuIiwgMCk7DQo+PiArCQkJaWYgKFdBUk5fT04oIWRl
dikpDQo+PiArCQkJCXJldHVybiAtRU5PTUVNOw0KPj4gKwkJCXJldCA9IHBsYXRmb3JtX2Rl
dmljZV9hZGQoZGV2KTsNCj4+ICsJCQlpZiAoV0FSTl9PTihyZXQpKSB7DQo+PiArCQkJCXBs
YXRmb3JtX2RldmljZV9wdXQoZGV2KTsNCj4+ICsJCQkJcmV0dXJuIHJldDsNCj4+ICsJCQl9
DQo+PiArCQl9DQo+PiAgIA0KPj4gLQlub2RlID0gb2ZfZmluZF9ub2RlX2J5X3BhdGgoIi9m
aXJtd2FyZSIpOw0KPj4gLQlpZiAobm9kZSkgew0KPj4gLQkJb2ZfcGxhdGZvcm1fcG9wdWxh
dGUobm9kZSwgTlVMTCwgTlVMTCwgTlVMTCk7DQo+PiAtCQlvZl9ub2RlX3B1dChub2RlKTsN
Cj4+IC0JfQ0KPj4gKwkJLyoNCj4+ICsJCSAqIEZvciBPRiBmcmFtZWJ1ZmZlcnMsIGZpcnN0
IGNyZWF0ZSB0aGUgZGV2aWNlIGZvciB0aGUgYm9vdCBkaXNwbGF5LA0KPj4gKwkJICogdGhl
biBmb3IgdGhlIG90aGVyIGZyYW1lYnVmZmVycy4gT25seSBmYWlsIGZvciB0aGUgYm9vdCBk
aXNwbGF5Ow0KPj4gKwkJICogaWdub3JlIGVycm9ycyBmb3IgdGhlIHJlc3QuDQo+PiArCQkg
Ki8NCj4+ICsJCWZvcl9lYWNoX25vZGVfYnlfdHlwZShub2RlLCAiZGlzcGxheSIpIHsNCj4+
ICsJCQlpZiAoIW9mX2dldF9wcm9wZXJ0eShub2RlLCAibGludXgsb3BlbmVkIiwgTlVMTCkg
fHwNCj4+ICsJCQkgICAgIW9mX2dldF9wcm9wZXJ0eShub2RlLCAibGludXgsYm9vdC1kaXNw
bGF5IiwgTlVMTCkpDQo+PiArCQkJCWNvbnRpbnVlOw0KPj4gKwkJCWRldiA9IG9mX3BsYXRm
b3JtX2RldmljZV9jcmVhdGUobm9kZSwgIm9mLWRpc3BsYXkiLCBOVUxMKTsNCj4+ICsJCQlp
ZiAoV0FSTl9PTighZGV2KSkNCj4+ICsJCQkJcmV0dXJuIC1FTk9NRU07DQo+PiArCQkJYm9v
dF9kaXNwbGF5ID0gbm9kZTsNCj4+ICsJCQlicmVhazsNCj4+ICsJCX0NCj4+ICsJCWZvcl9l
YWNoX25vZGVfYnlfdHlwZShub2RlLCAiZGlzcGxheSIpIHsNCj4+ICsJCQlpZiAoIW9mX2dl
dF9wcm9wZXJ0eShub2RlLCAibGludXgsb3BlbmVkIiwgTlVMTCkgfHwgbm9kZSA9PSBib290
X2Rpc3BsYXkpDQo+PiArCQkJCWNvbnRpbnVlOw0KPj4gKwkJCW9mX3BsYXRmb3JtX2Rldmlj
ZV9jcmVhdGUobm9kZSwgIm9mLWRpc3BsYXkiLCBOVUxMKTsNCj4+ICsJCX0NCj4+ICAgDQo+
PiAtCW5vZGUgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChvZl9jaG9zZW4sICJzaW1wbGUt
ZnJhbWVidWZmZXIiKTsNCj4+IC0Jb2ZfcGxhdGZvcm1fZGV2aWNlX2NyZWF0ZShub2RlLCBO
VUxMLCBOVUxMKTsNCj4+IC0Jb2Zfbm9kZV9wdXQobm9kZSk7DQo+PiArCX0gZWxzZSB7DQo+
PiArCQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7DQo+PiArDQo+PiArCQkvKg0KPj4gKwkJ
ICogSGFuZGxlIGNlcnRhaW4gY29tcGF0aWJsZXMgZXhwbGljaXRseSwgc2luY2Ugd2UgZG9u
J3Qgd2FudCB0byBjcmVhdGUNCj4+ICsJCSAqIHBsYXRmb3JtX2RldmljZXMgZm9yIGV2ZXJ5
IG5vZGUgaW4gL3Jlc2VydmVkLW1lbW9yeSB3aXRoIGENCj4+ICsJCSAqICJjb21wYXRpYmxl
IiwNCj4+ICsJCSAqLw0KPj4gKwkJZm9yX2VhY2hfbWF0Y2hpbmdfbm9kZShub2RlLCByZXNl
cnZlZF9tZW1fbWF0Y2hlcykNCj4+ICsJCQlvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlKG5v
ZGUsIE5VTEwsIE5VTEwpOw0KPj4gICANCj4+IC0JLyogUG9wdWxhdGUgZXZlcnl0aGluZyBl
bHNlLiAqLw0KPj4gLQlvZl9wbGF0Zm9ybV9kZWZhdWx0X3BvcHVsYXRlKE5VTEwsIE5VTEws
IE5VTEwpOw0KPj4gKwkJbm9kZSA9IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvZmlybXdhcmUi
KTsNCj4+ICsJCWlmIChub2RlKSB7DQo+PiArCQkJb2ZfcGxhdGZvcm1fcG9wdWxhdGUobm9k
ZSwgTlVMTCwgTlVMTCwgTlVMTCk7DQo+PiArCQkJb2Zfbm9kZV9wdXQobm9kZSk7DQo+PiAr
CQl9DQo+PiArDQo+PiArCQlub2RlID0gb2ZfZ2V0X2NvbXBhdGlibGVfY2hpbGQob2ZfY2hv
c2VuLCAic2ltcGxlLWZyYW1lYnVmZmVyIik7DQo+PiArCQlvZl9wbGF0Zm9ybV9kZXZpY2Vf
Y3JlYXRlKG5vZGUsIE5VTEwsIE5VTEwpOw0KPj4gKwkJb2Zfbm9kZV9wdXQobm9kZSk7DQo+
IA0KPiBJbiB2MSwgeW91IHN1cHBvcnRlZCAic2ltcGxlLWZyYW1lYnVmZmVyIiBvbiBQUEMu
IERvbid0IHdlIHdhbnQgdG8gYWxsb3cNCj4gdGhhdD8gTWF5YmUgbm8gb25lIGNhcmVzIEFU
TSwgYnV0IHRoYXQgY291bGQgY2hhbmdlLiBFaXRoZXIgd2F5Og0KDQpTdXBwb3J0IGZvciB0
aGVzZSBmcmFtZWJ1ZmZlcnMgaGFzIGFsd2F5cyBiZWVuIG11dHVhbGx5IGV4Y2x1c2l2ZS4g
VGhlIA0Kb2ZmYiBkcml2ZXIsIHdoaWNoIG9yaWdpbmFsbHkgY29udGFpbmVkIHRoZSBjb2Rl
LCBkZXBlbmRzIG9uIENPTkZJR19QUEMuIA0KQW5kIFBQQyBuZXZlciBzdXBwb3J0ZWQgc2lt
cGxlLWZyYW1lYnVmZmVyIGFueXdoZXJlLg0KDQo+IA0KPiBSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCg0KVGhhbmsgeW91Lg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KPiANCj4+ICsNCj4+ICsJCS8qIFBvcHVsYXRlIGV2ZXJ5dGhpbmcg
ZWxzZS4gKi8NCj4+ICsJCW9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGUoTlVMTCwgTlVM
TCwgTlVMTCk7DQo+PiArCX0NCj4+ICAgDQo+PiAgIAlyZXR1cm4gMDsNCj4+ICAgfQ0KPj4g
QEAgLTU1OCw3ICs2MDUsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBvZl9wbGF0Zm9ybV9zeW5j
X3N0YXRlX2luaXQodm9pZCkNCj4+ICAgCXJldHVybiAwOw0KPj4gICB9DQo+PiAgIGxhdGVf
aW5pdGNhbGxfc3luYyhvZl9wbGF0Zm9ybV9zeW5jX3N0YXRlX2luaXQpOw0KPj4gLSNlbmRp
Zg0KPj4gICANCj4+ICAgaW50IG9mX3BsYXRmb3JtX2RldmljZV9kZXN0cm95KHN0cnVjdCBk
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkNCj4+ICAgew0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------V6Ezpezy3p0yw0t0S0BNfgzr--

--------------H2Ei4jFDsCdAEGbJSqAuxH3d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJevBIFAwAAAAAACgkQlh/E3EQov+Cs
nQ/+PjxVvHS4ZjtQ7GRnq5WdGi01qeBkHRyzBvlJv/+sAV8+440CNa5FhBIs6xnr4qXnnZn/U8Y5
esGtU6VEVhKPsN9WRrwnpmzxJRHFnkg68Uxk9BRVJfnCkj4ajHlQeCJPvB8ibTeiY/E+b5bkQ098
6DKFHE0Aypr3Drw7c633xlCJnjQ738I7xfcAvyI3DSjWdBC9ikZOU3Qx5p6gHoV/YW1fXmvmvZvf
oGm+9fi2xfeu1k/K4NW52HqqPu8zjXQy8p0NGhq9aR7ayfQLYLijLMgaLOYRorKWX+F4gPfO1y4X
AADeO++G5KyyNPNpA0N74GsaFVQ+R2N4a/xOHlBahj8HJSDrjfUOHH30P0rKfcZmi2iZ851nzRzn
E7ZPN+BODCwHx2Y42Jl30dvNINNRDd9CeGCtNNeiBQ6jZqQt98MAPEmhvQ4d1rBOphIRYtm3QaY3
LOz8BBWcekdEBQ+GoxiQYXV/XreJY/6VGQctesiwnwJfuWzvMzdr+s2mI3xX+jWWA+HIeZCgabk9
zb5KMz2HbfhnIcg8Wl/mpCvkjH7MjMJNaMG/xu3LelH9iA5whwzClevDStMJ7au7ZY1Jqz03bB8T
76vjPG/YP5tmvdSnUbErFsoYzfG25b2biIgRY4vm0g4RLCfejdMxi5CLmfw6gzAeC5v4zoHZiEsd
on4=
=16Z/
-----END PGP SIGNATURE-----

--------------H2Ei4jFDsCdAEGbJSqAuxH3d--
