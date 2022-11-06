Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C2161E311
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 16:35:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4z2b2VCPz3f3X
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 02:35:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Unknown mechanism found: ipv4:218.92.28.120) smtp.mailfrom=jari.cn (client-ip=218.92.28.115; helo=jari.cn; envelope-from=wangkailong@jari.cn; receiver=<UNKNOWN>)
Received: from jari.cn (unknown [218.92.28.115])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4z2401Pcz3cCn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 02:34:51 +1100 (AEDT)
Received: by ajax-webmail-localhost.localdomain (Coremail) ; Sun, 6 Nov 2022
 23:28:44 +0800 (GMT+08:00)
X-Originating-IP: [182.148.13.29]
Date: Sun, 6 Nov 2022 23:28:44 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: wangkailong@jari.cn
To: benh@kernel.crashing.org, mpe@ellerman.id.au, gregkh@linuxfoundation.org, 
	sohu0106@126.com, christophe.leroy@csgroup.eu
Subject: [PATCH] macintosh/adb: Fix warning comparing pointer to 0
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.1 build 20210329(c53f3fee)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2ef267c.c4.1844d8ef2d8.Coremail.wangkailong@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwCXq+Gs0mdjLYwBAA--.53W
X-CM-SenderInfo: 5zdqwypdlo00nj6mt2flof0/1tbiAQACB2FEYx0CzgAIsb
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
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

Rml4IHRoZSBmb2xsb3dpbmcgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9tYWNpbnRvc2gv
YWRiLmM6Njc2OjE0LTE1OiBXQVJOSU5HIGNvbXBhcmluZyBwb2ludGVyIHRvIDAuCgpTaWduZWQt
b2ZmLWJ5OiBLYWlMb25nIFdhbmcgPHdhbmdrYWlsb25nQGphcmkuY24+Ci0tLQogZHJpdmVycy9t
YWNpbnRvc2gvYWRiLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21hY2ludG9zaC9hZGIuYyBiL2RyaXZl
cnMvbWFjaW50b3NoL2FkYi5jCmluZGV4IDFiYmI5Y2EwOGQ0MC4uMDc2MjUzNTk5YmQ0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL21hY2ludG9zaC9hZGIuYworKysgYi9kcml2ZXJzL21hY2ludG9zaC9h
ZGIuYwpAQCAtNjczLDcgKzY3Myw3IEBAIHN0YXRpYyBpbnQgYWRiX29wZW4oc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGUpCiAJCWdvdG8gb3V0OwogCX0KIAlzdGF0ZSA9IGtt
YWxsb2Moc2l6ZW9mKHN0cnVjdCBhZGJkZXZfc3RhdGUpLCBHRlBfS0VSTkVMKTsKLQlpZiAoc3Rh
dGUgPT0gMCkgeworCWlmIChzdGF0ZSkgewogCQlyZXQgPSAtRU5PTUVNOwogCQlnb3RvIG91dDsK
IAl9Ci0tIAoyLjI1LjEK
