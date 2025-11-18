Return-Path: <linuxppc-dev+bounces-14306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F21C6A192
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 15:50:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9nbc6Vtvz2yvW;
	Wed, 19 Nov 2025 01:50:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763477436;
	cv=none; b=MFNEyOw1LdFczXf4aAjGDp4YonWSJIQK4+kjq5PzKvWk+A8v5y8fe7pa2P0opeTP9BkWVD/C59sBn8iOOTdwMSCPeR9WrQbud/GR7aqxO75m7B6fGDYA6sXEHWV297RUekoiqSKqRRqH129ZjbAlb1FvHPMNAu6VztrbI68mtYteVXTsaiaWCjMjQejV7S/r3KK/8umlsVLUQwvKddNKP0j7oM/UgR0Agn95rDo4NXJU2aJ0cs0ktKjH8nHyD102N5SzsoCNRZXCaI7Aq8dvKb9LGjt9Fn1CbcApZqMpV5c7ptXNrkTVw831D6GEFj46HvOvUR2RGKopiVIbg070dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763477436; c=relaxed/relaxed;
	bh=rZkmb7zFofZfvDjvYK75CVHmmfpZ76lCH7TYpvuCr9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAC98QVyWBcC7yEwmPiTidTG2/93m3DCV7iwIFn6iiT/NHq8EpJMhi2L/yZktJIiucU0cUwrAXL/HuwokUsbcEutgegp1Brz8scDcCS5CBgrZUhLdNA4162Bh85I1Fg3KSiuBudvscYNSREVIuj5UvrHSv+Rxs9bkMv2B2mEs+c9uNmIBYvQVX5FHPwErqkL9kFySE6Gwq9gsH98BgkIw4aNxp6Y4czW59B5Ujh0w8H0qlhb76izCjGoPn+Zecyf1tFaEx+KkKTJNb7BOARheyZPWHG53NLccTNIyibNsVN9SlwOo8MZrwm4wvkuh+cMvyOvu3FaSdwsYEhLCBTn8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9nbb1T4Kz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 01:50:34 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d9n2N6Btgz9sSL;
	Tue, 18 Nov 2025 15:25:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycg5OWnpwCW8; Tue, 18 Nov 2025 15:25:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d9n2N5KGnz9sRg;
	Tue, 18 Nov 2025 15:25:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 90FBD8B769;
	Tue, 18 Nov 2025 15:25:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Qafumh8Gab3i; Tue, 18 Nov 2025 15:25:16 +0100 (CET)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DCE948B763;
	Tue, 18 Nov 2025 15:25:15 +0100 (CET)
Message-ID: <748c8f8c-23ed-4589-9521-a948cce40922@csgroup.eu>
Date: Tue, 18 Nov 2025 15:25:14 +0100
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
Subject: Re: [PATCH] modpost: amend ppc symnames for -Os build
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20251118.131735.802732108462696577.rene@exactco.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251118.131735.802732108462696577.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGksDQoNCkxlIDE4LzExLzIwMjUgw6AgMTM6MTcsIFJlbsOpIFJlYmUgYSDDqWNyaXTCoDoN
Cj4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgcmVuZUBl
eGFjdGNvLmRlLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4g
QnVpbGRpbmcgYSBzaXplIG9wdGltaXplZCBwcGMga2VybmVsLCBnY2MgZW1taXRzIG1vcmUg
c3ltYm9scyB0aGFuDQo+IGN1cnJlbnRseSBhbGxvd2VkIGxpc3RlZCBpbiBzY3JpcHRzL21v
ZC9tb2Rwb3N0LmMuIEFkZCB0byBmaXg6DQoNCllvdSBzaG91bGQgc2F5IHdoZW4gdGhlIHBy
b2JsZW0gc3RhcnRlZCB0byBoYXBwZW4sIGFuZCB3aGF0IHRob3NlIA0KZnVuY3Rpb25zIGFy
ZSBzdXBwb3NlZCB0byBzYXZlIGFuZCByZXN0b3JlLg0KDQpBcyBhbiBleGVtcGxlIHNlZSBj
b21taXQgOGZlOWM5M2U3NDUzICgicG93ZXJwYzogQWRkIHZyIHNhdmUvcmVzdG9yZSANCmZ1
bmN0aW9ucyIpDQoNCkFsc28gY29uZmlybSBpdCBpcyBvbmx5IG5lZWRlZCBvbiBwb3dlcnBj
NjQsIGlmIHNvIG1ha2UgaXQgY2xlYXIgaW4gdGhlIA0KY29tbWl0IG1lc3NhZ2UuDQoNCkNo
cmlzdG9waGUNCg0KDQo+IA0KPiBNT0RQT1NUIE1vZHVsZS5zeW12ZXJzDQo+IEVSUk9SOiBt
b2Rwb3N0OiAiX3Jlc3RmcHJfMjAiIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHUua29dIHVuZGVmaW5lZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJfcmVzdGZwcl8yNiIgW2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5rb10gdW5kZWZpbmVkIQ0KPiBFUlJP
UjogbW9kcG9zdDogIl9yZXN0ZnByXzIyIiBbZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmtvXSB1bmRlZmluZWQhDQo+IEVSUk9SOiBtb2Rwb3N0OiAiX3NhdmVncHIxXzI3
IiBbZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmtvXSB1bmRlZmluZWQhDQo+
IEVSUk9SOiBtb2Rwb3N0OiAiX3NhdmVncHIxXzI1IiBbZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmtvXSB1bmRlZmluZWQhDQo+IEVSUk9SOiBtb2Rwb3N0OiAiX3Jlc3Rm
cHJfMjgiIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua29dIHVuZGVmaW5l
ZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJfc2F2ZWdwcjFfMjkiIFtkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHUua29dIHVuZGVmaW5lZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJf
c2F2ZWZwcl8yMCIgW2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5rb10gdW5k
ZWZpbmVkIQ0KPiBFUlJPUjogbW9kcG9zdDogIl9zYXZlZnByXzIyIiBbZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmtvXSB1bmRlZmluZWQhDQo+IEVSUk9SOiBtb2Rwb3N0
OiAiX3Jlc3RmcHJfMTUiIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua29d
IHVuZGVmaW5lZCENCj4gV0FSTklORzogbW9kcG9zdDogc3VwcHJlc3NlZCA1NiB1bnJlc29s
dmVkIHN5bWJvbCB3YXJuaW5ncyBiZWNhdXNlIHRoZXJlIHdlcmUgdG9vIG1hbnkpDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBSZW7DqSBSZWJlIDxyZW5lQGV4YWN0Y28uZGU+DQo+IA0KPiAt
LS0NCj4gICBzY3JpcHRzL21vZC9tb2Rwb3N0LmMgfCA0ICsrKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9tb2Qv
bW9kcG9zdC5jIGIvc2NyaXB0cy9tb2QvbW9kcG9zdC5jDQo+IGluZGV4IDQ3YzhhYTJhNjkz
OS4uMTMzZGZhMTYzMDhhIDEwMDY0NA0KPiAtLS0gYS9zY3JpcHRzL21vZC9tb2Rwb3N0LmMN
Cj4gKysrIGIvc2NyaXB0cy9tb2QvbW9kcG9zdC5jDQo+IEBAIC02MDIsNiArNjAyLDEwIEBA
IHN0YXRpYyBpbnQgaWdub3JlX3VuZGVmX3N5bWJvbChzdHJ1Y3QgZWxmX2luZm8gKmluZm8s
IGNvbnN0IGNoYXIgKnN5bW5hbWUpDQo+ICAgICAgICAgICAgICAgICAgLyogU3BlY2lhbCBy
ZWdpc3RlciBmdW5jdGlvbiBsaW5rZWQgb24gYWxsIG1vZHVsZXMgZHVyaW5nIGZpbmFsIGxp
bmsgb2YgLmtvICovDQo+ICAgICAgICAgICAgICAgICAgaWYgKHN0cnN0YXJ0cyhzeW1uYW1l
LCAiX3Jlc3RncHIwXyIpIHx8DQo+ICAgICAgICAgICAgICAgICAgICAgIHN0cnN0YXJ0cyhz
eW1uYW1lLCAiX3NhdmVncHIwXyIpIHx8DQo+ICsgICAgICAgICAgICAgICAgICAgc3Ryc3Rh
cnRzKHN5bW5hbWUsICJfcmVzdGdwcjFfIikgfHwNCj4gKyAgICAgICAgICAgICAgICAgICBz
dHJzdGFydHMoc3ltbmFtZSwgIl9zYXZlZ3ByMV8iKSB8fA0KPiArICAgICAgICAgICAgICAg
ICAgIHN0cnN0YXJ0cyhzeW1uYW1lLCAiX3Jlc3RmcHJfIikgfHwNCj4gKyAgICAgICAgICAg
ICAgICAgICBzdHJzdGFydHMoc3ltbmFtZSwgIl9zYXZlZnByXyIpIHx8DQo+ICAgICAgICAg
ICAgICAgICAgICAgIHN0cnN0YXJ0cyhzeW1uYW1lLCAiX3Jlc3R2cl8iKSB8fA0KPiAgICAg
ICAgICAgICAgICAgICAgICBzdHJzdGFydHMoc3ltbmFtZSwgIl9zYXZldnJfIikgfHwNCj4g
ICAgICAgICAgICAgICAgICAgICAgc3RyY21wKHN5bW5hbWUsICIuVE9DLiIpID09IDApDQo+
IC0tDQo+IDIuNDYuMA0KPiANCj4gLS0NCj4gUmVuw6kgUmViZSwgRXhhY3RDT0RFIEdtYkgs
IEJlcmxpbiwgR2VybWFueQ0KPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9u
Lm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZleGFjdGNvLmRlJTJGJmRhdGE9MDUl
N0MwMiU3Q2NocmlzdG9waGUubGVyb3klNDBjc2dyb3VwLmV1JTdDYmRmODFiZWNmZjc2NGIw
MGQ4YTcwOGRlMjY5YzcxNzYlN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3
QzAlN0MwJTdDNjM4OTkwNjUxOTU4NjUwMzk3JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5
SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6
TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDNjAwMDAlN0MlN0MlN0Mm
c2RhdGE9MkE0aWxxUXUlMkJOeGV5Y0JRVU1GSU42R1ZXM3g0amt3anBJd3dFelZhZzV3JTNE
JnJlc2VydmVkPTAg4oCiIGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnQybGludXguY29tJTJGJmRhdGE9MDUlN0Mw
MiU3Q2NocmlzdG9waGUubGVyb3klNDBjc2dyb3VwLmV1JTdDYmRmODFiZWNmZjc2NGIwMGQ4
YTcwOGRlMjY5YzcxNzYlN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3QzAl
N0MwJTdDNjM4OTkwNjUxOTU4Njc2ODI4JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZi
WEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJ
c0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDNjAwMDAlN0MlN0MlN0Mmc2Rh
dGE9NnRvRnhjbnQxNk9XNk5MT0hCSkVBTjBERnkyVVdOWVY3R3haNWhxcHdsUSUzRCZyZXNl
cnZlZD0wIOKAoiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cHMlM0ElMkYlMkZwYXRyZW9uLmNvbSUyRnJlbmVyZWJlJmRhdGE9MDUl
N0MwMiU3Q2NocmlzdG9waGUubGVyb3klNDBjc2dyb3VwLmV1JTdDYmRmODFiZWNmZjc2NGIw
MGQ4YTcwOGRlMjY5YzcxNzYlN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3
QzAlN0MwJTdDNjM4OTkwNjUxOTU4NjkzNDgyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5
SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6
TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDNjAwMDAlN0MlN0MlN0Mm
c2RhdGE9dTFqNU9HQ2JWd2NFRHdsZncwQ1poVEU3NVN5JTJCSmlUNFZBM09QZVNlYlg0JTNE
JnJlc2VydmVkPTANCg0K

