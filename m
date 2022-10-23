Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4936A609718
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 00:44:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MwYDM1wjdz3bym
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 09:44:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Unknown mechanism found: ipv4:218.92.28.120) smtp.mailfrom=jari.cn (client-ip=218.92.28.115; helo=jari.cn; envelope-from=wangkailong@jari.cn; receiver=<UNKNOWN>)
X-Greylist: delayed 131 seconds by postgrey-1.36 at boromir; Sun, 23 Oct 2022 23:49:11 AEDT
Received: from jari.cn (unknown [218.92.28.115])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MwJ1M2k9bz2xm2
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Oct 2022 23:49:10 +1100 (AEDT)
Received: by ajax-webmail-localhost.localdomain (Coremail) ; Sun, 23 Oct
 2022 20:44:20 +0800 (GMT+08:00)
X-Originating-IP: [182.148.15.254]
Date: Sun, 23 Oct 2022 20:44:20 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "KaiLong Wang" <wangkailong@jari.cn>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	farosas@linux.ibm.com, mirq-linux@rere.qmqm.pl, 
	dmitry.osipenko@collabora.com, kda@linux-powerpc.org, 
	naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH] powerpc: replace ternary operator with min()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.1 build 20210329(c53f3fee)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4ebda26c.346.18404df6852.Coremail.wangkailong@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwD3AG8lN1Vjk+RoAA--.1470W
X-CM-SenderInfo: 5zdqwypdlo00nj6mt2flof0/1tbiAQAIB2FEYxtOmwAAsG
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Mailman-Approved-At: Mon, 24 Oct 2022 09:44:07 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rml4IHRoZSBmb2xsb3dpbmcgY29jY2ljaGVjayB3YXJuaW5nOgoKYXJjaC9wb3dlcnBjL3htb24v
eG1vbi5jOjI5ODc6IFdBUk5JTkcgb3Bwb3J0dW5pdHkgZm9yIG1pbigpCmFyY2gvcG93ZXJwYy94
bW9uL3htb24uYzoyNTgzOiBXQVJOSU5HIG9wcG9ydHVuaXR5IGZvciBtaW4oKQoKU2lnbmVkLW9m
Zi1ieTogS2FpTG9uZyBXYW5nIDx3YW5na2FpbG9uZ0BqYXJpLmNuPgotLS0KIGFyY2gvcG93ZXJw
Yy94bW9uL3htb24uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMveG1vbi94bW9uLmMgYi9h
cmNoL3Bvd2VycGMveG1vbi94bW9uLmMKaW5kZXggZjUxYzg4MmJmOTAyLi5hNzc1MWNkMmNjOWQg
MTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy94bW9uL3htb24uYworKysgYi9hcmNoL3Bvd2VycGMv
eG1vbi94bW9uLmMKQEAgLTI1ODAsNyArMjU4MCw3IEBAIHN0YXRpYyB2b2lkIHhtb25fcmF3ZHVt
cCAodW5zaWduZWQgbG9uZyBhZHJzLCBsb25nIG5kdW1wKQogCXVuc2lnbmVkIGNoYXIgdGVtcFsx
Nl07CiAKIAlmb3IgKG4gPSBuZHVtcDsgbiA+IDA7KSB7Ci0JCXIgPSBuIDwgMTY/IG46IDE2Owor
CQlyID0gbWluKG4sIDE2KTsKIAkJbnIgPSBtcmVhZChhZHJzLCB0ZW1wLCByKTsKIAkJYWRycyAr
PSBucjsKIAkJZm9yIChtID0gMDsgbSA8IHI7ICsrbSkgewpAQCAtMjk4NCw3ICsyOTg0LDcgQEAg
cHJkdW1wKHVuc2lnbmVkIGxvbmcgYWRycywgbG9uZyBuZHVtcCkKIAlmb3IgKG4gPSBuZHVtcDsg
biA+IDA7KSB7CiAJCXByaW50ZihSRUcsIGFkcnMpOwogCQlwdXRjaGFyKCcgJyk7Ci0JCXIgPSBu
IDwgMTY/IG46IDE2OworCQlyID0gbWluKG4sIDE2KTsKIAkJbnIgPSBtcmVhZChhZHJzLCB0ZW1w
LCByKTsKIAkJYWRycyArPSBucjsKIAkJZm9yIChtID0gMDsgbSA8IHI7ICsrbSkgewotLSAKMi4y
NS4xCg==
