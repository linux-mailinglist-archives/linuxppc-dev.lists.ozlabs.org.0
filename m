Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4C25388DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 00:26:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBqkF0pSQz3bmc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:25:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Unknown mechanism found: ipv4:218.92.28.120) smtp.mailfrom=jari.cn (client-ip=218.92.28.120; helo=jari.cn; envelope-from=chenxuebing@jari.cn; receiver=<UNKNOWN>)
X-Greylist: delayed 117 seconds by postgrey-1.36 at boromir; Mon, 30 May 2022 01:18:16 AEST
Received: from jari.cn (unknown [218.92.28.120])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LB2HD2Ffxz2xMS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 01:18:15 +1000 (AEST)
Received: by ajax-webmail-localhost.localdomain (Coremail) ; Sun, 29 May
 2022 23:09:36 +0800 (GMT+08:00)
X-Originating-IP: [182.148.15.20]
Date: Sun, 29 May 2022 23:09:36 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "XueBing Chen" <chenxuebing@jari.cn>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, 
	npiggin@gmail.com, farosas@linux.ibm.com, bharata@linux.ibm.com, 
	aneesh.kumar@linux.ibm.com
Subject: [PATCH] KVM: PPC: Book3S HV Nested: clean up warnings found by
 checkpatch
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.1 build 20210329(c53f3fee)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <45da8ea8.a92.181105d91bc.Coremail.chenxuebing@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwAHEW+wjJNinyY6AA--.671W
X-CM-SenderInfo: hfkh05pxhex0nj6mt2flof0/1tbiAQABCmFEYxsmlgACsl
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Mailman-Approved-At: Tue, 31 May 2022 08:25:41 +1000
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
Cc: aik@ozlabs.ru, nathan@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CkNsZWFuIHVwIGEgaGFuZGZ1bCBvZiBjaGVja3BhdGNoIHdhcm5pbmdzOgotIFdBUk5JTkc6IFBy
ZWZlciAnbG9uZycgb3ZlciAnbG9uZyBpbnQnIGFzIHRoZSBpbnQgaXMgdW5uZWNlc3NhcnkKLSBX
QVJOSU5HOiBNaXNzaW5nIGEgYmxhbmsgbGluZSBhZnRlciBkZWNsYXJhdGlvbnMKLSBXQVJOSU5H
OiBQcmVmZXIgJ3Vuc2lnbmVkIGludCAqJyB0byBiYXJlIHVzZSBvZiAndW5zaWduZWQgKicKLSBX
QVJOSU5HOiB1bm5lY2Vzc2FyeSB3aGl0ZXNwYWNlIGJlZm9yZSBhIHF1b3RlZCBuZXdsaW5lCi0g
V0FSTklORzogcGxlYXNlLCBubyBzcGFjZXMgYXQgdGhlIHN0YXJ0IG9mIGEgbGluZQotIFdBUk5J
Tkc6IENvbXBhcmlzb25zIHNob3VsZCBwbGFjZSB0aGUgY29uc3RhbnQgb24gdGhlIHJpZ2h0CnNp
ZGUgb2YgdGhlIHRlc3QKClNpZ25lZC1vZmYtYnk6IFh1ZUJpbmcgQ2hlbiA8Y2hlbnh1ZWJpbmdA
amFyaS5jbj4KLS0tCiBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9uZXN0ZWQuYyB8IDIxICsr
KysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfaHZfbmVz
dGVkLmMgYi9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9uZXN0ZWQuYwppbmRleCA5ZDM3M2Y4
OTYzZWUuLmFmNTY5NThiMGEyOCAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3Nf
aHZfbmVzdGVkLmMKKysrIGIvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfaHZfbmVzdGVkLmMKQEAg
LTI4OCw3ICsyODgsNyBAQCBzdGF0aWMgdm9pZCBsb2FkX2wyX2h2X3JlZ3Moc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAogCiBsb25nIGt2bWh2X2VudGVyX25lc3RlZF9ndWVzdChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpCiB7Ci0JbG9uZyBpbnQgZXJyLCByOworCWxvbmcgZXJyLCByOwogCXN0cnVjdCBr
dm1fbmVzdGVkX2d1ZXN0ICpsMjsKIAlzdHJ1Y3QgcHRfcmVncyBsMl9yZWdzLCBzYXZlZF9sMV9y
ZWdzOwogCXN0cnVjdCBodl9ndWVzdF9zdGF0ZSBsMl9odiA9IHswfSwgc2F2ZWRfbDFfaHY7CkBA
IC00MzAsNyArNDMwLDcgQEAgbG9uZyBrdm1odl9lbnRlcl9uZXN0ZWRfZ3Vlc3Qoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQogCiBsb25nIGt2bWh2X25lc3RlZF9pbml0KHZvaWQpCiB7Ci0JbG9uZyBp
bnQgcHRiX29yZGVyOworCWxvbmcgcHRiX29yZGVyOwogCXVuc2lnbmVkIGxvbmcgcHRjcjsKIAls
b25nIHJjOwogCkBAIC02NDYsNiArNjQ2LDcgQEAgc3RhdGljIHZvaWQga3ZtaHZfdXBkYXRlX3B0
YmxfY2FjaGUoc3RydWN0IGt2bV9uZXN0ZWRfZ3Vlc3QgKmdwKQogCXB0YmxfYWRkciA9IChrdm0t
PmFyY2gubDFfcHRjciAmIFBSVEJfTUFTSykgKyAoZ3AtPmwxX2xwaWQgPDwgNCk7CiAJaWYgKGdw
LT5sMV9scGlkIDwgKDF1bCA8PCAoKGt2bS0+YXJjaC5sMV9wdGNyICYgUFJUU19NQVNLKSArIDgp
KSkgewogCQlpbnQgc3JjdV9pZHggPSBzcmN1X3JlYWRfbG9jaygma3ZtLT5zcmN1KTsKKwogCQly
ZXQgPSBrdm1fcmVhZF9ndWVzdChrdm0sIHB0YmxfYWRkciwKIAkJCQkgICAgICZwdGJsX2VudHJ5
LCBzaXplb2YocHRibF9lbnRyeSkpOwogCQlzcmN1X3JlYWRfdW5sb2NrKCZrdm0tPnNyY3UsIHNy
Y3VfaWR4KTsKQEAgLTg0OSw3ICs4NTAsNyBAQCBzdGF0aWMgc3RydWN0IGt2bV9uZXN0ZWRfZ3Vl
c3QgKmt2bWh2X2ZpbmRfbmVzdGVkKHN0cnVjdCBrdm0gKmt2bSwgaW50IGxwaWQpCiB9CiAKIHB0
ZV90ICpmaW5kX2t2bV9uZXN0ZWRfZ3Vlc3RfcHRlKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQg
bG9uZyBscGlkLAotCQkJCSB1bnNpZ25lZCBsb25nIGVhLCB1bnNpZ25lZCAqaHNoaWZ0KQorCQkJ
CSB1bnNpZ25lZCBsb25nIGVhLCB1bnNpZ25lZCBpbnQgKmhzaGlmdCkKIHsKIAlzdHJ1Y3Qga3Zt
X25lc3RlZF9ndWVzdCAqZ3A7CiAJcHRlX3QgKnB0ZTsKQEAgLTg1OSw3ICs4NjAsNyBAQCBwdGVf
dCAqZmluZF9rdm1fbmVzdGVkX2d1ZXN0X3B0ZShzdHJ1Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxv
bmcgbHBpZCwKIAkJcmV0dXJuIE5VTEw7CiAKIAlWTV9XQVJOKCFzcGluX2lzX2xvY2tlZCgma3Zt
LT5tbXVfbG9jayksCi0JCSIlcyBjYWxsZWQgd2l0aCBrdm0gbW11X2xvY2sgbm90IGhlbGQgXG4i
LCBfX2Z1bmNfXyk7CisJCSIlcyBjYWxsZWQgd2l0aCBrdm0gbW11X2xvY2sgbm90IGhlbGRcbiIs
IF9fZnVuY19fKTsKIAlwdGUgPSBfX2ZpbmRfbGludXhfcHRlKGdwLT5zaGFkb3dfcGd0YWJsZSwg
ZWEsIE5VTEwsIGhzaGlmdCk7CiAKIAlyZXR1cm4gcHRlOwpAQCAtMTAwMyw2ICsxMDA0LDcgQEAg
dm9pZCBrdm1odl9yZW1vdmVfbmVzdF9ybWFwX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwKIAogCWZv
ciAoOyBnZm4gPCBlbmRfZ2ZuOyBnZm4rKykgewogCQl1bnNpZ25lZCBsb25nICpybWFwID0gJm1l
bXNsb3QtPmFyY2gucm1hcFtnZm5dOworCiAJCWt2bWh2X3JlbW92ZV9uZXN0X3JtYXBfbGlzdChr
dm0sIHJtYXAsIGhwYSwgYWRkcl9tYXNrKTsKIAl9CiB9CkBAIC0xNDc1LDcgKzE0NzcsNyBAQCBz
dGF0aWMgaW5saW5lIGludCBrdm1wcGNfcmFkaXhfc2hpZnRfdG9fbGV2ZWwoaW50IHNoaWZ0KQog
fQogCiAvKiBjYWxsZWQgd2l0aCBncC0+dGxiX2xvY2sgaGVsZCAqLwotc3RhdGljIGxvbmcgaW50
IF9fa3ZtaHZfbmVzdGVkX3BhZ2VfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorc3RhdGlj
IGxvbmcgX19rdm1odl9uZXN0ZWRfcGFnZV9mYXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJ
CQkJCSAgc3RydWN0IGt2bV9uZXN0ZWRfZ3Vlc3QgKmdwKQogewogCXN0cnVjdCBrdm0gKmt2bSA9
IHZjcHUtPmt2bTsKQEAgLTE0OTEsNyArMTQ5Myw3IEBAIHN0YXRpYyBsb25nIGludCBfX2t2bWh2
X25lc3RlZF9wYWdlX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAl1bnNpZ25lZCBpbnQg
c2hpZnQsIGwxX3NoaWZ0LCBsZXZlbDsKIAlib29sIHdyaXRpbmcgPSAhIShkc2lzciAmIERTSVNS
X0lTU1RPUkUpOwogCWJvb2wga3ZtX3JvID0gZmFsc2U7Ci0JbG9uZyBpbnQgcmV0OworCWxvbmcg
cmV0OwogCiAJaWYgKCFncC0+bDFfZ3JfdG9faHIpIHsKIAkJa3ZtaHZfdXBkYXRlX3B0YmxfY2Fj
aGUoZ3ApOwpAQCAtMTYxNCw3ICsxNjE2LDggQEAgc3RhdGljIGxvbmcgaW50IF9fa3ZtaHZfbmVz
dGVkX3BhZ2VfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCWlmIChzaGlmdCA+IGwxX3No
aWZ0KSB7CiAJCXU2NCBtYXNrOwogCQl1bnNpZ25lZCBpbnQgYWN0dWFsX3NoaWZ0ID0gUEFHRV9T
SElGVDsKLQkJaWYgKFBNRF9TSElGVCA8IGwxX3NoaWZ0KQorCisJCWlmIChsMV9zaGlmdCA+IFBN
RF9TSElGVCkKIAkJCWFjdHVhbF9zaGlmdCA9IFBNRF9TSElGVDsKIAkJbWFzayA9ICgxVUwgPDwg
c2hpZnQpIC0gKDFVTCA8PCBhY3R1YWxfc2hpZnQpOwogCQlwdGUgPSBfX3B0ZShwdGVfdmFsKHB0
ZSkgfCAoZ3BhICYgbWFzaykpOwpAQCAtMTY0NCwxMCArMTY0NywxMCBAQCBzdGF0aWMgbG9uZyBp
bnQgX19rdm1odl9uZXN0ZWRfcGFnZV9mYXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJcmV0
dXJuIFJFU1VNRV9HVUVTVDsKIH0KIAotbG9uZyBpbnQga3ZtaHZfbmVzdGVkX3BhZ2VfZmF1bHQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQorbG9uZyBrdm1odl9uZXN0ZWRfcGFnZV9mYXVsdChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7CiAJc3RydWN0IGt2bV9uZXN0ZWRfZ3Vlc3QgKmdwID0gdmNw
dS0+YXJjaC5uZXN0ZWQ7Ci0JbG9uZyBpbnQgcmV0OworCWxvbmcgcmV0OwogCiAJbXV0ZXhfbG9j
aygmZ3AtPnRsYl9sb2NrKTsKIAlyZXQgPSBfX2t2bWh2X25lc3RlZF9wYWdlX2ZhdWx0KHZjcHUs
IGdwKTsKLS0gCjIuMzYuMQo=
