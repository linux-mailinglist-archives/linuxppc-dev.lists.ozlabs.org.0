Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E13E92ACFAC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 07:28:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVdGp6FZnzDqjb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 17:28:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.149;
 helo=m176149.mail.qiye.163.com; envelope-from=wangqing@vivo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from m176149.mail.qiye.163.com (m176149.mail.qiye.163.com
 [59.111.176.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVdDm2XVwzDqcq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 17:26:47 +1100 (AEDT)
Received: from vivo.com (wm-9.qy.internal [127.0.0.1])
 by m176149.mail.qiye.163.com (Hmail) with ESMTP id 7AF8A282FE5;
 Tue, 10 Nov 2020 14:26:40 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AJAAOQDzDcbjqrJ8gOXru4r0.3.1604989600488.Hmail.wangqing@vivo.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gc2NoZWQvcnQsIHBvd2VycGM6IFByZXBhcmUgZm9yIFBSRUVNUFRfUlQ=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.213.83.157
In-Reply-To: <20201110071839.Horde.h-QuHo16fxj_ok8Qgdbdnw8@messagerie.c-s.fr>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [58.213.83.157) ] by ajax-webmail (
 [127.0.0.1] ) ; Tue, 10 Nov 2020 14:26:40 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date: Tue, 10 Nov 2020 14:26:40 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZT0lNGEpPTB1NQxpNVkpNS09CQ0JNS0tOTkhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU5CTU5PTU5MSkhLN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6MTo6NCo*AT8YGREKCTFDHDQjCQ5PCUtVSFVKTUtPQkNCTUtKSk5OVTMWGhIXVQwaFRwKEhUc
 Ow0SDRRVGBQWRVlXWRILWUFZTkNVSUpIVUNIVUpOTFlXWQgBWUFOQk9CNwY+
X-HM-Tid: 0a75b0d5c3029395kuws7af8a282fe5
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, tglx@linutronix.de,
 Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PlF1b3RpbmcgV2FuZyBRaW5nIDx3YW5ncWluZ0B2aXZvLmNvbT46Cj4KPj4gQWRkIFBSRUVNUFRf
UlQgb3V0cHV0IHRvIGRpZSgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFFpbmcgPHdhbmdx
aW5nQHZpdm8uY29tPgo+PiAtLS0KPj4gIGFyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYyB8IDEw
ICsrKysrKysrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYyBiL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYwo+PiBpbmRleCA1MDA2ZGNiLi42ZGZlNTY3Cj4+IC0t
LSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYwo+PiArKysgYi9hcmNoL3Bvd2VycGMva2Vy
bmVsL3RyYXBzLmMKPj4gQEAgLTI1OCw2ICsyNTgsMTQgQEAgc3RhdGljIGNoYXIgKmdldF9tbXVf
c3RyKHZvaWQpCj4+ICAJcmV0dXJuICIiOwo+PiAgfQo+Pgo+PiArI2lmZGVmIENPTkZJR19QUkVF
TVBUCj4+ICsjZGVmaW5lIFNfUFJFRU1QVCAiIFBSRUVNUFQiCj4+ICsjZWxpZiBkZWZpbmVkKENP
TkZJR19QUkVFTVBUX1JUKQo+PiArI2RlZmluZSBTX1BSRUVNUFQgIiBQUkVFTVBUX1JUIgo+PiAr
I2Vsc2UKPj4gKyNkZWZpbmUgU19QUkVFTVBUICIiCj4+ICsjZW5kaWYKPgo+SSBkb24ndCBsaWtl
IHRvbyBtdWNoIHRoYXQgZm9yZXN0IG9mICNpZmRlZnMuIElTX0VOQUJMRUQoKSBpcyBwcmVmZXJl
ZCAgCj53aGVuZXZlciBwb3NzaWJsZS4KPgo+PiArCj4+ICBzdGF0aWMgaW50IF9fZGllKGNvbnN0
IGNoYXIgKnN0ciwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGxvbmcgZXJyKQo+PiAgewo+PiAgCXBy
aW50aygiT29wczogJXMsIHNpZzogJWxkIFsjJWRdXG4iLCBzdHIsIGVyciwgKytkaWVfY291bnRl
cik7Cj4+IEBAIC0yNjUsNyArMjczLDcgQEAgc3RhdGljIGludCBfX2RpZShjb25zdCBjaGFyICpz
dHIsIHN0cnVjdCBwdF9yZWdzICAKPj4gKnJlZ3MsIGxvbmcgZXJyKQo+PiAgCXByaW50aygiJXMg
UEFHRV9TSVpFPSVsdUslcyVzJXMlcyVzJXMgJXNcbiIsCj4+ICAJICAgICAgIElTX0VOQUJMRUQo
Q09ORklHX0NQVV9MSVRUTEVfRU5ESUFOKSA/ICJMRSIgOiAiQkUiLAo+PiAgCSAgICAgICBQQUdF
X1NJWkUgLyAxMDI0LCBnZXRfbW11X3N0cigpLAo+PiAtCSAgICAgICBJU19FTkFCTEVEKENPTkZJ
R19QUkVFTVBUKSA/ICIgUFJFRU1QVCIgOiAiIiwKPj4gKwkgICAgICAgU19QUkVFTVBULAo+PiAg
CSAgICAgICBJU19FTkFCTEVEKENPTkZJR19TTVApID8gIiBTTVAiIDogIiIsCj4+ICAJICAgICAg
IElTX0VOQUJMRUQoQ09ORklHX1NNUCkgPyAoIiBOUl9DUFVTPSIgX19zdHJpbmdpZnkoTlJfQ1BV
UykpIDogIiIsCj4+ICAJICAgICAgIGRlYnVnX3BhZ2VhbGxvY19lbmFibGVkKCkgPyAiIERFQlVH
X1BBR0VBTExPQyIgOiAiIiwKPj4gLS0KPj4gMi43LjQKPgo+SSdkIHByZWZlciB0byByZW1haW4g
aW4gbGluZSB3aXRoIHRoZSBleGlzdGluZyBhbmQgdXNlIElTX0VOQUJMRUQoKSAgCj5pbnN0ZWFk
IG9mICNpZmRlZnMsIHNlZSBiZWxvdzoKPgo+ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvdHJhcHMuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYwo+aW5kZXggNTAwNmRjYmUx
ZDlmLi5kZWM3YjgxYzcyYTQgMTAwNjQ0Cj4tLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3RyYXBz
LmMKPisrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYwo+QEAgLTI2MiwxMCArMjYyLDEx
IEBAIHN0YXRpYyBpbnQgX19kaWUoY29uc3QgY2hhciAqc3RyLCBzdHJ1Y3QgcHRfcmVncyAgCj4q
cmVncywgbG9uZyBlcnIpCj4gIHsKPiAgCXByaW50aygiT29wczogJXMsIHNpZzogJWxkIFsjJWRd
XG4iLCBzdHIsIGVyciwgKytkaWVfY291bnRlcik7Cj4KPi0JcHJpbnRrKCIlcyBQQUdFX1NJWkU9
JWx1SyVzJXMlcyVzJXMlcyAlc1xuIiwKPisJcHJpbnRrKCIlcyBQQUdFX1NJWkU9JWx1SyVzJXMl
cyVzJXMlcyVzICVzXG4iLAo+ICAJICAgICAgIElTX0VOQUJMRUQoQ09ORklHX0NQVV9MSVRUTEVf
RU5ESUFOKSA/ICJMRSIgOiAiQkUiLAo+ICAJICAgICAgIFBBR0VfU0laRSAvIDEwMjQsIGdldF9t
bXVfc3RyKCksCj4gIAkgICAgICAgSVNfRU5BQkxFRChDT05GSUdfUFJFRU1QVCkgPyAiIFBSRUVN
UFQiIDogIiIsCj4rCSAgICAgICBJU19FTkFCTEVEKENPTkZJR19QUkVFTVBUX1JUKSA/ICIgUFJF
RU1QVF9SVCIgOiAiIiwKPiAgCSAgICAgICBJU19FTkFCTEVEKENPTkZJR19TTVApID8gIiBTTVAi
IDogIiIsCj4gIAkgICAgICAgSVNfRU5BQkxFRChDT05GSUdfU01QKSA/ICgiIE5SX0NQVVM9IiBf
X3N0cmluZ2lmeShOUl9DUFVTKSkgOiAiIiwKPiAgCSAgICAgICBkZWJ1Z19wYWdlYWxsb2NfZW5h
YmxlZCgpID8gIiBERUJVR19QQUdFQUxMT0MiIDogIiIsCj4tLS0KPkNocmlzdG9waGUKClllYWgs
IEkgYWdyZWUgd2l0aCBpdC4KCldhbmcgUWluZwoNCg0K
