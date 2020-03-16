Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E9186A00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 12:24:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gv856cb2zDqFZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 22:24:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=123.58.177.129;
 helo=m177129.mail.qiye.163.com; envelope-from=wenhu.wang@vivo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from m177129.mail.qiye.163.com (m177129.mail.qiye.163.com
 [123.58.177.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gv3k5DBhzDqLw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 22:20:15 +1100 (AEDT)
Received: from vivo.com (wm-2.qy.internal [127.0.0.1])
 by m177129.mail.qiye.163.com (Hmail) with ESMTP id A7DED5C3187;
 Mon, 16 Mar 2020 19:20:05 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AJUA5gAVCMaMlIkPsaTC0KqL.3.1584357605616.Hmail.wenhu.wang@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2M10gcG93ZXJwYy9mc2wtODV4eDogZml4IGNvbXBpbGUgZXJyb3I=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.226
In-Reply-To: <875zf4r613.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Received: from wenhu.wang@vivo.com( [58.251.74.226) ] by ajax-webmail (
 [127.0.0.1] ) ; Mon, 16 Mar 2020 19:20:05 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>
Date: Mon, 16 Mar 2020 19:20:05 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VCQktCQkJNQkNNSENCSVlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUhNTEpOQ0NKTE9NN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6MS46Thw6LTg2GjYXMhArCBovOEswCjdVSFVKTkNPSE5MTUtMQkJMVTMWGhIXVQweFRMOVQwa
 FRw7DRINFFUYFBZFWVdZEgtZQVlOQ1VJTkpVTE9VSUlNWVdZCAFZQU5IQ0o3Bg++
X-HM-Tid: 0a70e31281416447kursa7ded5c3187
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
Cc: trivial@kernel.org, kernel@vivo.com, linux-kernel@vger.kernel.org,
 stable <stable@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PgogRGF0ZTogMjAyMC0w
My0xNiAxNzo0MToxMgpUbzpXQU5HIFdlbmh1IDx3ZW5odS53YW5nQHZpdm8uY29tPixCZW5qYW1p
biBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+LFBhdWwgTWFja2VycmFz
IDxwYXVsdXNAc2FtYmEub3JnPixXQU5HIFdlbmh1IDx3ZW5odS53YW5nQHZpdm8uY29tPixBbGxp
c29uIFJhbmRhbCA8YWxsaXNvbkBsb2h1dG9rLm5ldD4sUmljaGFyZCBGb250YW5hIDxyZm9udGFu
YUByZWRoYXQuY29tPixHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPixUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4sbGludXhwcGMtZGV2QGxp
c3RzLm96bGFicy5vcmcsbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwogY2M6IHRyaXZpYWxA
a2VybmVsLm9yZyxrZXJuZWxAdml2by5jb20sc3RhYmxlIDxzdGFibGVAdmdlci5rZXJuZWwub3Jn
PgpTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBwb3dlcnBjL2ZzbC04NXh4OiBmaXggY29tcGlsZSBl
cnJvcj5XQU5HIFdlbmh1IDx3ZW5odS53YW5nQHZpdm8uY29tPiB3cml0ZXM6Cj4+IEluY2x1ZGUg
ImxpbnV4L29mX2FkZHJlc3MuaCIgdG8gZml4IHRoZSBjb21waWxlIGVycm9yIGZvcgo+PiBtcGM4
NXh4X2wyY3Rscl9vZl9wcm9iZSgpIHdoZW4gY29tcGlsaW5nIGZzbF84NXh4X2NhY2hlX3NyYW0u
Yy4KPj4KPj4gICBDQyAgICAgIGFyY2gvcG93ZXJwYy9zeXNkZXYvZnNsXzg1eHhfbDJjdGxyLm8K
Pj4gYXJjaC9wb3dlcnBjL3N5c2Rldi9mc2xfODV4eF9sMmN0bHIuYzogSW4gZnVuY3Rpb24g4oCY
bXBjODV4eF9sMmN0bHJfb2ZfcHJvYmXigJk6Cj4+IGFyY2gvcG93ZXJwYy9zeXNkZXYvZnNsXzg1
eHhfbDJjdGxyLmM6OTA6MTE6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlv
biDigJhvZl9pb21hcOKAmTsgZGlkIHlvdSBtZWFuIOKAmHBjaV9pb21hcOKAmT8gWy1XZXJyb3I9
aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4+ICAgbDJjdGxyID0gb2ZfaW9tYXAoZGV2
LT5kZXYub2Zfbm9kZSwgMCk7Cj4+ICAgICAgICAgICAgXn5+fn5+fn4KPj4gICAgICAgICAgICBw
Y2lfaW9tYXAKPj4gYXJjaC9wb3dlcnBjL3N5c2Rldi9mc2xfODV4eF9sMmN0bHIuYzo5MDo5OiBl
cnJvcjogYXNzaWdubWVudCBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2Fz
dCBbLVdlcnJvcj1pbnQtY29udmVyc2lvbl0KPj4gICBsMmN0bHIgPSBvZl9pb21hcChkZXYtPmRl
di5vZl9ub2RlLCAwKTsKPj4gICAgICAgICAgXgo+PiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0
cmVhdGVkIGFzIGVycm9ycwo+PiBzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI2NzogcmVjaXBlIGZv
ciB0YXJnZXQgJ2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsXzg1eHhfbDJjdGxyLm8nIGZhaWxlZAo+
PiBtYWtlWzJdOiAqKiogW2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsXzg1eHhfbDJjdGxyLm9dIEVy
cm9yIDEKPj4KPj4gRml4ZXM6IGNvbW1pdCA2ZGI5MmNjOWQwN2QgKCJwb3dlcnBjLzg1eHg6IGFk
ZCBjYWNoZS1zcmFtIHN1cHBvcnQiKQo+Cj5UaGUgc3ludGF4IGlzOgo+Cj5GaXhlczogNmRiOTJj
YzlkMDdkICgicG93ZXJwYy84NXh4OiBhZGQgY2FjaGUtc3JhbSBzdXBwb3J0IikKPgo+PiBDYzog
c3RhYmxlIDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+Cj5UaGUgY29tbWl0IGFib3ZlIHdlbnQg
aW50byB2Mi42LjM3Lgo+Cj5TbyBubyBvbmUgaGFzIG5vdGljZWQgdGhpcyBidWcgc2luY2UgdGhl
biwgaG93PyBPciBkaWQgc29tZXRoaW5nIGVsc2UKPmNoYW5nZSB0byBleHBvc2UgdGhlIHByb2Js
ZW0/CgpBY3R1YWxseSBhIGhhcmQgcXVlc3Rpb24gdG8gYW5zd2VyIGNhdXNlIGl0IGFsc28gbGVm
dCBtZSBzY3JhdGNoaW5nIGZvciBsb25nLgpIb3dldmVyLCBJIGNhbiBub3QgZmluZCByaWdodCBv
ciBkZWZpbml0ZSBhbnN3ZXIuCgpBIGNvbnZpbmNpbmcgZXhwbGFuYXRpb24gaXMgdGhlIGRyaXZl
ciBoYXMgbm90IGJlZW4gaW4gdXNlIHNpbmNlIHYyLjYuMzcsCmJ1dCBzb21laG93LCB3ZSBhcmUg
dG8gdXNlIGl0IHJlY2VudGx5LgpBbnl3YXksIGl0J3MgYmV0dGVyIGZvciBtZSBhcyB3ZWxsIGFz
IG5vIGhhcm0gdG8gYW55b25lIHRvIGZpeCBpdCBldmVuIHRob3VnaC4KClRoYW5rcywgV2VuaHUK
Pgo+Y2hlZXJzCg0KDQo=
