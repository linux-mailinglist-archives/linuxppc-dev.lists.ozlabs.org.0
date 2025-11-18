Return-Path: <linuxppc-dev+bounces-14303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBE2C69E6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 15:20:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9mx25cYhz2yvH;
	Wed, 19 Nov 2025 01:20:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763475638;
	cv=none; b=D53N48xLOd9XRK1ueWfofL5GqC8pgF7ggLNUMHqkGa06eLF8GVeDLnjV+ElIfBhD7Co525hNhz2ZaBprhP+qDdOG8yHguc3MSoA21XL6fHL3XMcojzE6l/avHZXL0PvSAMgqJdUr8kN8Ue8dd4g+m6MekAybwYk7m5h4nGCWe/zS00mgKg3RHTRDD9UYTW+l2ifVE3WP1DrCDT2fWLr04hs0y79mMqWmZMCwxJFSWCphTHaj4WsayOACxNs2e8PtQkb5NGKyAMlkyIFueTztLF6L6gl4/pY1w1oKMDQRh1yedqu127OBNSuX+ZPdx3s7eaIIhY7fJebttdsTol5E8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763475638; c=relaxed/relaxed;
	bh=qSZCTG/ydDCennnivzNrl8AIE8hPeFhzirIPGla4QLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWQE5nsam8jb0Guba3/kwwrY6+w6JjqiKGCvXFVfwuyQuHFDl45/EsGpYaZu6hHSZcak8iq/IR8Z91SDqadsnXDq3prf/8Dr+tUZaRn2kDOzfd723ovlTqu1diCRu/zIxZ4xW+IuDuvwWB7R/J5XzFwdvZaJBKBdlTxNxLGPWMxW0ILk0GsUEqkUZ45pf/bmB2tvaFqUYR0ao36R2gT6VNX1jguQxzIyPRXujuAm09BVQSljHvyXH5bF2YWaXJCE6G8bjutKX/AhCSuOLCKABRSFA83kteo/HjiFHwuv9g8t6XfBVQMIkoEkBafJkneJ/9L2USHPHqnS0cfoOUoOEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9mx14RXtz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 01:20:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d9mQG18jnz9sSL;
	Tue, 18 Nov 2025 14:57:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wNmMceKhfN5; Tue, 18 Nov 2025 14:57:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d9mQG0DQFz9sRg;
	Tue, 18 Nov 2025 14:57:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DD0398B769;
	Tue, 18 Nov 2025 14:57:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BPrxKOO5Guhc; Tue, 18 Nov 2025 14:57:25 +0100 (CET)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8191E8B763;
	Tue, 18 Nov 2025 14:57:25 +0100 (CET)
Message-ID: <a376f125-649e-4939-9363-ec73f1c1ea48@csgroup.eu>
Date: Tue, 18 Nov 2025 14:57:25 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ppc/lv1call: Fix PS3 LV1 clobbering SRR
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 linuxppc-dev@lists.ozlabs.org
Cc: Geoff Levand <geoff@infradead.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20251118.144230.697987246761031674.rene@exactco.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251118.144230.697987246761031674.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQoNCkxlIDE4LzExLzIwMjUgw6AgMTQ6NDIsIFJlbsOpIFJlYmUgYSDDqWNyaXTCoDoNCj4g
W1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgcmVuZUBleGFj
dGNvLmRlLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRw
czovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gU2lu
Y2UgYSB3aGlsZSBib290aW5nIGEgUFMzIGluc3RhbnRseSB5aWVsZHM6DQoNCkNhbiB5b3Ug
YmlzZWN0IHRvIHNheSBzaW5jZSB3aGVuLCBhbmQgYWRkIGEgRml4ZXM6IHRhZyB0byB0aGUg
Y29tbWl0ID8NCg0KPiANCj4gPDQ+U1JSMCB3YXM6IGMwMDAwMDAwMDAwOTcxYjQgc2hvdWxk
IGJlOiBjMDAwMDAwMDAwMmQ1NWM0DQo+IDw0PlNSUjEgd2FzOiA4MDAwMDAwMDAwMDA4MDMy
IHNob3VsZCBiZTogODAwMDAwMDAwMDAwODAzMg0KPiANCj4gRml4IExWMSBjbG9iYmVyaW5n
IFNSUiBieSBzcnJfcmVnc19jbG9iYmVyZWQoKSBlYWNoIGx2MSBjYWxsLg0KPiBBdHRyaWJ1
dGUgc3JyX3JlZ3NfY2xvYmJlcmVkIGFsd2F5c19pbmxpbmUgZm9yIHVzZSBieSBtb2R1bGVz
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUmVuw6kgUmViZSA8cmVuZUBleGFjdGNvLmRlPg0K
PiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW50ZXJydXB0LmggfCAxICsN
Cj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbHYxY2FsbC5oICAgfCAzICsrLQ0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ludGVycnVwdC5oIGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ludGVycnVwdC5oDQo+IGluZGV4IGViMGU0YTIw
YjgxOC4uNzgzYzZmMzJhMzk1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vaW50ZXJydXB0LmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2lu
dGVycnVwdC5oDQo+IEBAIC0xMDYsNiArMTA2LDcgQEAgc3RhdGljIGlubGluZSBib29sIGlz
X2ltcGxpY2l0X3NvZnRfbWFza2VkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQ0KPiAgICAgICAg
ICByZXR1cm4gc2VhcmNoX2tlcm5lbF9zb2Z0X21hc2tfdGFibGUocmVncy0+bmlwKTsNCj4g
ICB9DQo+IA0KPiArX19hdHRyaWJ1dGVfXygoYWx3YXlzX2lubGluZSkpDQo+ICAgc3RhdGlj
IGlubGluZSB2b2lkIHNycl9yZWdzX2Nsb2JiZXJlZCh2b2lkKQ0KDQpJbnN0ZWFkLCB1c2U6
DQoNCglzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgc3JyX3JlZ3NfY2xvYmJlcmVkKHZv
aWQpDQoNCj4gICB7DQo+ICAgICAgICAgIGxvY2FsX3BhY2EtPnNycl92YWxpZCA9IDA7DQo+
IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbHYxY2FsbC5oIGIvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2x2MWNhbGwuaA0KPiBpbmRleCBhZTcwMTIwOTUzYTgu
LjQ4ZGQ1NWEyYjcyZSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L2x2MWNhbGwuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbHYxY2FsbC5o
DQo+IEBAIC0xNCw2ICsxNCw3IEBADQo+IA0KPiAgICNpbmNsdWRlIDxsaW51eC90eXBlcy5o
Pg0KPiAgICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4NCj4gKyNpbmNsdWRlIDxhc20vaW50
ZXJydXB0Lmg+DQo+IA0KPiAgIC8qIGx2MSBjYWxsIGRlY2xhcmF0aW9uIG1hY3JvcyAqLw0K
PiANCj4gQEAgLTIwOCw3ICsyMDksNyBAQA0KPiAgICNkZWZpbmUgTFYxX0NBTEwobmFtZSwg
aW4sIG91dCwgbnVtKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICAgICBl
eHRlcm4gczY0IF9sdjFfIyNuYW1lKExWMV8jI2luIyNfSU5fIyNvdXQjI19PVVRfQVJHX0RF
Q0wpOyAgICAgIFwNCj4gICAgIHN0YXRpYyBpbmxpbmUgaW50IGx2MV8jI25hbWUoTFYxXyMj
aW4jI19JTl8jI291dCMjX09VVF9BUkdfREVDTCkgXA0KPiAtICAgIHtyZXR1cm4gX2x2MV8j
I25hbWUoTFYxXyMjaW4jI19JTl8jI291dCMjX09VVF9BUkdTKTt9DQo+ICsgICAge3Nycl9y
ZWdzX2Nsb2JiZXJlZCgpOyByZXR1cm4gX2x2MV8jI25hbWUoTFYxXyMjaW4jI19JTl8jI291
dCMjX09VVF9BUkdTKTt9DQo+ICAgI2VuZGlmDQo+IA0KPiAgICNlbmRpZiAvKiAhZGVmaW5l
ZChfX0FTU0VNQkxFUl9fKSAqLw0KPiAtLQ0KPiAyLjQ2LjANCj4gDQo+IC0tDQo+IFJlbsOp
IFJlYmUsIEV4YWN0Q09ERSBHbWJILCBCZXJsaW4sIEdlcm1hbnkNCj4gaHR0cHM6Ly9ldXIw
MS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJG
ZXhhY3Rjby5kZSUyRiZkYXRhPTA1JTdDMDIlN0NjaHJpc3RvcGhlLmxlcm95MiU0MGNzLXNv
cHJhc3RlcmlhLmNvbSU3QzA3YmI5NGNmZGJhNTQ0ODljOTBjMDhkZTI2YTg1NDUxJTdDOGI4
N2FmN2Q4NjQ3NGRjNzhkZjQ1ZjY5YTIwMTFiYjUlN0MwJTdDMCU3QzYzODk5MDcwNTA0NDA5
MzM4OCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJ
bFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxk
VUlqb3lmUSUzRCUzRCU3QzYwMDAwJTdDJTdDJTdDJnNkYXRhPWQybDFhMWliTlZ6R0x3U0Rv
MXdEZEhSb05XZ3ZxN0FrZlpRcDJLcDh1WkUlM0QmcmVzZXJ2ZWQ9MCDigKIgaHR0cHM6Ly9l
dXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJG
JTJGdDJsaW51eC5jb20lMkYmZGF0YT0wNSU3QzAyJTdDY2hyaXN0b3BoZS5sZXJveTIlNDBj
cy1zb3ByYXN0ZXJpYS5jb20lN0MwN2JiOTRjZmRiYTU0NDg5YzkwYzA4ZGUyNmE4NTQ1MSU3
QzhiODdhZjdkODY0NzRkYzc4ZGY0NWY2OWEyMDExYmI1JTdDMCU3QzAlN0M2Mzg5OTA3MDUw
NDQxMzA0MjAlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlk
V1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJ
c0lsZFVJam95ZlElM0QlM0QlN0M2MDAwMCU3QyU3QyU3QyZzZGF0YT1oWmNiUWFYelBpbE5T
Zm0zakpEJTJCNjQ3NnR4UWtCayUyRjBYTHI0Ylo5RThPZyUzRCZyZXNlcnZlZD0wIOKAoiBo
dHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHMlM0ElMkYlMkZwYXRyZW9uLmNvbSUyRnJlbmVyZWJlJmRhdGE9MDUlN0MwMiU3Q2Nocmlz
dG9waGUubGVyb3kyJTQwY3Mtc29wcmFzdGVyaWEuY29tJTdDMDdiYjk0Y2ZkYmE1NDQ4OWM5
MGMwOGRlMjZhODU0NTElN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3QzAl
N0MwJTdDNjM4OTkwNzA1MDQ0MTU2NDEyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZi
WEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJ
c0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDNjAwMDAlN0MlN0MlN0Mmc2Rh
dGE9SVlDRU1KRU04V0NoOEoweFBONkRXZGRuakpZclRhdmpDOUdGMk5zdDAlMkZBJTNEJnJl
c2VydmVkPTANCj4gDQoNCg==

