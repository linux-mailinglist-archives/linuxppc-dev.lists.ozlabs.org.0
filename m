Return-Path: <linuxppc-dev+bounces-7096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E264BA62BC3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 12:24:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFJlq17lxz3cBd;
	Sat, 15 Mar 2025 22:24:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=58.251.27.85
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742019727;
	cv=none; b=JLxdUrV5xLYTXHobi4PHRhSwY1vblv8TrXNNz0lqzS0JOzp8lYORgx/CEbjDkL0U/OcIkClAFpVil+Q+VVDTw9frc3WFIhqUKo5JwPseH7gIpYv9Y03Bl7ccdFxOeAj5XhrySSCLiYqd3Tozc4gWButn4+WG8Hrt8cM3Dh/8m58xZTJEhyzDzOe1dy7V6N7nCotA/pQL5tJQBz8N11H+he69Fo7Vg8IBVpS2acHiEUnCDJBDV8ex0g+TvgttkaDJVjE/RbOa2ngXNNvS5y7Yp5RsLihgptgiGcVzKBSdqRJhRklKTWtL8hfDHoUniBz3VlKy/B61V0vJ8EyI9jWolg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742019727; c=relaxed/relaxed;
	bh=UOdhW/0DUJGiJOm8Zc5hGe/IdENUMKimXTZJ+qCqNj0=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=UC4eQJDRZ9BTLzP7i3kjEri1kqkIXeTWeZdHpWFdYCNfP1Wdm82yMD8S6PL/yD2nBMs1mhJEnS6ZimCq91zlwoGCf6pa4wGZZTqUoc0/OUuq0roAnBd6PNzXm5m7Z5g52zL/PMwlwgPcaBQbn4NcSZ1o9R8eH9KdIGC67gS0zc4PDg+R/Zxuus7bEbTAtzpKXeBvQegGm4MMgE4pd4u4ZnxHYGAQ0K05Xyues3jCv/jL8yORsidjUv6K6unuVpn5JyvwuLCxLR9KyO/5La0MOz7ds8fBok5V3CP+y2NRpC1axbYTN8z6CE1c9d2qZbfpJancgSsYGmMhgXQ9XeqZ5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass (client-ip=58.251.27.85; helo=mxct.zte.com.cn; envelope-from=xie.ludan@zte.com.cn; receiver=lists.ozlabs.org) smtp.mailfrom=zte.com.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zte.com.cn (client-ip=58.251.27.85; helo=mxct.zte.com.cn; envelope-from=xie.ludan@zte.com.cn; receiver=lists.ozlabs.org)
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFB3K7127z30Pl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 17:22:04 +1100 (AEDT)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZF9vX2hHHzKjL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 14:15:20 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4ZF9vR5cHSzBRHKK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 14:15:15 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZF9vD4629z5B1J5;
	Sat, 15 Mar 2025 14:15:04 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 52F6Eqfl010351;
	Sat, 15 Mar 2025 14:14:52 +0800 (+08)
	(envelope-from xie.ludan@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 15 Mar 2025 14:14:52 +0800 (CST)
Date: Sat, 15 Mar 2025 14:14:52 +0800 (CST)
X-Zmail-TransId: 2afa67d51adc771-6c561
X-Mailer: Zmail v1.0
Message-ID: <20250315141452917TgYukep-fMdORK2wh1T1w@zte.com.cn>
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
Mime-Version: 1.0
From: <xie.ludan@zte.com.cn>
To: <xiubo.lee@gmail.com>
Cc: <shengjiu.wang@gmail.com>, <festevam@gmail.com>, <nicoleotsuka@gmail.com>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <linux-sound@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIEFTb0M6IHVzZSBzeXNmc19lbWl0KCkgaW5zdGVhZCBvZiBzY25wcmludGYoKS4=?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL:mse-fl1.zte.com.cn 52F6Eqfl010351
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 67D51AF7.001 by FangMail milter!
X-FangMail-Envelope: 1742019320/4ZF9vX2hHHzKjL/67D51AF7.001/10.35.20.121/[10.35.20.121]/mxde.zte.com.cn/<xie.ludan@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D51AF7.001/4ZF9vX2hHHzKjL
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



--=====_001_next=====
Content-Type: multipart/related;
	boundary="=====_002_next====="


--=====_002_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbTogWGllTHVkYW4gPHhpZS5sdWRhbkB6dGUuY29tLmNuPg0KDQpGb2xsb3cgdGhlIGFkdmlj
ZSBpbiBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3N5c2ZzLnJzdDoNCnNob3coKSBzaG91bGQg
b25seSB1c2Ugc3lzZnNfZW1pdCgpIG9yIHN5c2ZzX2VtaXRfYXQoKSB3aGVuIGZvcm1hdHRpbmcN
CnRoZSB2YWx1ZSB0byBiZSByZXR1cm5lZCB0byB1c2VyIHNwYWNlLg0KDQpTaWduZWQtb2ZmLWJ5
OiBYaWVMdWRhbiA8eGllLmx1ZGFuQHp0ZS5jb20uY24+DQotLS0NCiBzb3VuZC9zb2MvZnNsL2lt
eC1hdWRtdXguYyB8IDI2ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvc291
bmQvc29jL2ZzbC9pbXgtYXVkbXV4LmMgYi9zb3VuZC9zb2MvZnNsL2lteC1hdWRtdXguYw0KaW5k
ZXggY2MyOTE4ZWUyY2Y1Li42MDYyNTAzZDM1NDMgMTAwNjQ0DQotLS0gYS9zb3VuZC9zb2MvZnNs
L2lteC1hdWRtdXguYw0KKysrIGIvc291bmQvc29jL2ZzbC9pbXgtYXVkbXV4LmMNCkBAIC03Nyw0
NSArNzcsNDEgQEAgc3RhdGljIHNzaXplX3QgYXVkbXV4X3JlYWRfZmlsZShzdHJ1Y3QgZmlsZSAq
ZmlsZSwgY2hhciBfX3VzZXIgKnVzZXJfYnVmLA0KIAlyZXQgPSBzeXNmc19lbWl0KGJ1ZiwgIlBE
Q1I6ICUwOHhcblBUQ1I6ICUwOHhcbiIsIHBkY3IsIHB0Y3IpOw0KIA0KIAlpZiAocHRjciAmIElN
WF9BVURNVVhfVjJfUFRDUl9URlNESVIpDQotCQlyZXQgKz0gc2NucHJpbnRmKGJ1ZiArIHJldCwg
UEFHRV9TSVpFIC0gcmV0LA0KKwkJcmV0ICs9IHN5c2ZzX2VtaXQoYnVmICsgcmV0LA0KIAkJCQki
VHhGUyBvdXRwdXQgZnJvbSAlcywgIiwNCiAJCQkJYXVkbXV4X3BvcnRfc3RyaW5nKChwdGNyID4+
IDI3KSAmIDB4NykpOw0KIAllbHNlDQotCQlyZXQgKz0gc2NucHJpbnRmKGJ1ZiArIHJldCwgUEFH
RV9TSVpFIC0gcmV0LA0KKwkJcmV0ICs9IHN5c2ZzX2VtaXQoYnVmICsgcmV0LA0KIAkJCQkiVHhG
UyBpbnB1dCwgIik7DQogDQogCWlmIChwdGNyICYgSU1YX0FVRE1VWF9WMl9QVENSX1RDTEtESVIp
DQotCQlyZXQgKz0gc2NucHJpbnRmKGJ1ZiArIHJldCwgUEFHRV9TSVpFIC0gcmV0LA0KKwkJcmV0
ICs9IHN5c2ZzX2VtaXQoYnVmICsgcmV0LA0KIAkJCQkiVHhDbGsgb3V0cHV0IGZyb20gJXMiLA0K
IAkJCQlhdWRtdXhfcG9ydF9zdHJpbmcoKHB0Y3IgPj4gMjIpICYgMHg3KSk7DQogCWVsc2UNCi0J
CXJldCArPSBzY25wcmludGYoYnVmICsgcmV0LCBQQUdFX1NJWkUgLSByZXQsDQotCQkJCSJUeENs
ayBpbnB1dCIpOw0KKwkJcmV0ICs9IHN5c2ZzX2VtaXQoYnVmICsgcmV0LCAiVHhDbGsgaW5wdXQi
KTsNCiANCi0JcmV0ICs9IHNjbnByaW50ZihidWYgKyByZXQsIFBBR0VfU0laRSAtIHJldCwgIlxu
Iik7DQorCXJldCArPSBzeXNmc19lbWl0KGJ1ZiArIHJldCwgIlxuIik7DQogDQogCWlmIChwdGNy
ICYgSU1YX0FVRE1VWF9WMl9QVENSX1NZTikgew0KLQkJcmV0ICs9IHNjbnByaW50ZihidWYgKyBy
ZXQsIFBBR0VfU0laRSAtIHJldCwNCi0JCQkJIlBvcnQgaXMgc3ltbWV0cmljIik7DQorCQlyZXQg
Kz0gc3lzZnNfZW1pdChidWYgKyByZXQsICJQb3J0IGlzIHN5bW1ldHJpYyIpOw0KIAl9IGVsc2Ug
ew0KIAkJaWYgKHB0Y3IgJiBJTVhfQVVETVVYX1YyX1BUQ1JfUkZTRElSKQ0KLQkJCXJldCArPSBz
Y25wcmludGYoYnVmICsgcmV0LCBQQUdFX1NJWkUgLSByZXQsDQorCQkJcmV0ICs9IHN5c2ZzX2Vt
aXQoYnVmICsgcmV0LA0KIAkJCQkJIlJ4RlMgb3V0cHV0IGZyb20gJXMsICIsDQogCQkJCQlhdWRt
dXhfcG9ydF9zdHJpbmcoKHB0Y3IgPj4gMTcpICYgMHg3KSk7DQogCQllbHNlDQotCQkJcmV0ICs9
IHNjbnByaW50ZihidWYgKyByZXQsIFBBR0VfU0laRSAtIHJldCwNCi0JCQkJCSJSeEZTIGlucHV0
LCAiKTsNCisJCQlyZXQgKz0gc3lzZnNfZW1pdChidWYgKyByZXQsICJSeEZTIGlucHV0LCAiKTsN
CiANCiAJCWlmIChwdGNyICYgSU1YX0FVRE1VWF9WMl9QVENSX1JDTEtESVIpDQotCQkJcmV0ICs9
IHNjbnByaW50ZihidWYgKyByZXQsIFBBR0VfU0laRSAtIHJldCwNCisJCQlyZXQgKz0gc3lzZnNf
ZW1pdChidWYgKyByZXQsDQogCQkJCQkiUnhDbGsgb3V0cHV0IGZyb20gJXMiLA0KIAkJCQkJYXVk
bXV4X3BvcnRfc3RyaW5nKChwdGNyID4+IDEyKSAmIDB4NykpOw0KIAkJZWxzZQ0KLQkJCXJldCAr
PSBzY25wcmludGYoYnVmICsgcmV0LCBQQUdFX1NJWkUgLSByZXQsDQotCQkJCQkiUnhDbGsgaW5w
dXQiKTsNCisJCQlyZXQgKz0gc3lzZnNfZW1pdChidWYgKyByZXQsICJSeENsayBpbnB1dCIpOw0K
IAl9DQogDQotCXJldCArPSBzY25wcmludGYoYnVmICsgcmV0LCBQQUdFX1NJWkUgLSByZXQsDQor
CXJldCArPSBzeXNmc19lbWl0KGJ1ZiArIHJldCwNCiAJCQkiXG5EYXRhIHJlY2VpdmVkIGZyb20g
JXNcbiIsDQogCQkJYXVkbXV4X3BvcnRfc3RyaW5nKChwZGNyID4+IDEzKSAmIDB4NykpOw0KIA0K
LS0gDQoyLjI1LjE=


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iemNvbnRlbnRSb3ciPjxwPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQXJp
YWwsIEhlbHZldGljYSwgJnF1b3Q7TWljcm9zb2Z0IFlhaGVpJnF1b3Q7LCBzYW5zLXNlcmlmOyBi
YWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij5Gcm9tOiBYaWVMdWRhbiAmbHQ7
eGllLmx1ZGFuQHp0ZS5jb20uY24mZ3Q7PC9zcGFuPjwvcD48cD48YnI+PC9wPjxwPkZvbGxvdyB0
aGUgYWR2aWNlIGluIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvc3lzZnMucnN0OjwvcD48cD5z
aG93KCkgc2hvdWxkIG9ubHkgdXNlIHN5c2ZzX2VtaXQoKSBvciBzeXNmc19lbWl0X2F0KCkgd2hl
biBmb3JtYXR0aW5nPC9wPjxwPnRoZSB2YWx1ZSB0byBiZSByZXR1cm5lZCB0byB1c2VyIHNwYWNl
LjwvcD48cD48YnI+PC9wPjxwPlNpZ25lZC1vZmYtYnk6IFhpZUx1ZGFuICZsdDt4aWUubHVkYW5A
enRlLmNvbS5jbiZndDs8L3A+PHA+LS0tPC9wPjxwPiZuYnNwO3NvdW5kL3NvYy9mc2wvaW14LWF1
ZG11eC5jIHwgMjYgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS08L3A+PHA+Jm5ic3A7MSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKTwvcD48cD48YnI+PC9w
PjxwPmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvZnNsL2lteC1hdWRtdXguYyBiL3NvdW5kL3NvYy9m
c2wvaW14LWF1ZG11eC5jPC9wPjxwPmluZGV4IGNjMjkxOGVlMmNmNS4uNjA2MjUwM2QzNTQzIDEw
MDY0NDwvcD48cD4tLS0gYS9zb3VuZC9zb2MvZnNsL2lteC1hdWRtdXguYzwvcD48cD4rKysgYi9z
b3VuZC9zb2MvZnNsL2lteC1hdWRtdXguYzwvcD48cD5AQCAtNzcsNDUgKzc3LDQxIEBAIHN0YXRp
YyBzc2l6ZV90IGF1ZG11eF9yZWFkX2ZpbGUoc3RydWN0IGZpbGUgKmZpbGUsIGNoYXIgX191c2Vy
ICp1c2VyX2J1Ziw8L3A+PHA+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwv
c3Bhbj5yZXQgPSBzeXNmc19lbWl0KGJ1ZiwgIlBEQ1I6ICUwOHhcblBUQ1I6ICUwOHhcbiIsIHBk
Y3IsIHB0Y3IpOzwvcD48cD4mbmJzcDs8L3A+PHA+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNw
YWNlOnByZSI+CTwvc3Bhbj5pZiAocHRjciAmYW1wOyBJTVhfQVVETVVYX1YyX1BUQ1JfVEZTRElS
KTwvcD48cD4tPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQk8L3NwYW4+cmV0ICs9IHNj
bnByaW50ZihidWYgKyByZXQsIFBBR0VfU0laRSAtIHJldCw8L3A+PHA+KzxzcGFuIHN0eWxlPSJ3
aGl0ZS1zcGFjZTpwcmUiPgkJPC9zcGFuPnJldCArPSBzeXNmc19lbWl0KGJ1ZiArIHJldCw8L3A+
PHA+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQkJCTwvc3Bhbj4iVHhGUyBv
dXRwdXQgZnJvbSAlcywgIiw8L3A+PHA+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnBy
ZSI+CQkJCTwvc3Bhbj5hdWRtdXhfcG9ydF9zdHJpbmcoKHB0Y3IgJmd0OyZndDsgMjcpICZhbXA7
IDB4NykpOzwvcD48cD4mbmJzcDs8c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFu
PmVsc2U8L3A+PHA+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJPC9zcGFuPnJldCAr
PSBzY25wcmludGYoYnVmICsgcmV0LCBQQUdFX1NJWkUgLSByZXQsPC9wPjxwPis8c3BhbiBzdHls
ZT0id2hpdGUtc3BhY2U6cHJlIj4JCTwvc3Bhbj5yZXQgKz0gc3lzZnNfZW1pdChidWYgKyByZXQs
PC9wPjxwPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJCQk8L3NwYW4+IlR4
RlMgaW5wdXQsICIpOzwvcD48cD4mbmJzcDs8L3A+PHA+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRl
LXNwYWNlOnByZSI+CTwvc3Bhbj5pZiAocHRjciAmYW1wOyBJTVhfQVVETVVYX1YyX1BUQ1JfVENM
S0RJUik8L3A+PHA+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJPC9zcGFuPnJldCAr
PSBzY25wcmludGYoYnVmICsgcmV0LCBQQUdFX1NJWkUgLSByZXQsPC9wPjxwPis8c3BhbiBzdHls
ZT0id2hpdGUtc3BhY2U6cHJlIj4JCTwvc3Bhbj5yZXQgKz0gc3lzZnNfZW1pdChidWYgKyByZXQs
PC9wPjxwPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJCQk8L3NwYW4+IlR4
Q2xrIG91dHB1dCBmcm9tICVzIiw8L3A+PHA+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNl
OnByZSI+CQkJCTwvc3Bhbj5hdWRtdXhfcG9ydF9zdHJpbmcoKHB0Y3IgJmd0OyZndDsgMjIpICZh
bXA7IDB4NykpOzwvcD48cD4mbmJzcDs8c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9z
cGFuPmVsc2U8L3A+PHA+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJPC9zcGFuPnJl
dCArPSBzY25wcmludGYoYnVmICsgcmV0LCBQQUdFX1NJWkUgLSByZXQsPC9wPjxwPi08c3BhbiBz
dHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JCQkJPC9zcGFuPiJUeENsayBpbnB1dCIpOzwvcD48cD4r
PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQk8L3NwYW4+cmV0ICs9IHN5c2ZzX2VtaXQo
YnVmICsgcmV0LCAiVHhDbGsgaW5wdXQiKTs8L3A+PHA+Jm5ic3A7PC9wPjxwPi08c3BhbiBzdHls
ZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPnJldCArPSBzY25wcmludGYoYnVmICsgcmV0LCBQ
QUdFX1NJWkUgLSByZXQsICJcbiIpOzwvcD48cD4rPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnBy
ZSI+CTwvc3Bhbj5yZXQgKz0gc3lzZnNfZW1pdChidWYgKyByZXQsICJcbiIpOzwvcD48cD4mbmJz
cDs8L3A+PHA+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj5pZiAo
cHRjciAmYW1wOyBJTVhfQVVETVVYX1YyX1BUQ1JfU1lOKSB7PC9wPjxwPi08c3BhbiBzdHlsZT0i
d2hpdGUtc3BhY2U6cHJlIj4JCTwvc3Bhbj5yZXQgKz0gc2NucHJpbnRmKGJ1ZiArIHJldCwgUEFH
RV9TSVpFIC0gcmV0LDwvcD48cD4tPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQkJCTwv
c3Bhbj4iUG9ydCBpcyBzeW1tZXRyaWMiKTs8L3A+PHA+KzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFj
ZTpwcmUiPgkJPC9zcGFuPnJldCArPSBzeXNmc19lbWl0KGJ1ZiArIHJldCwgIlBvcnQgaXMgc3lt
bWV0cmljIik7PC9wPjxwPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgk8L3Nw
YW4+fSBlbHNlIHs8L3A+PHA+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQk8
L3NwYW4+aWYgKHB0Y3IgJmFtcDsgSU1YX0FVRE1VWF9WMl9QVENSX1JGU0RJUik8L3A+PHA+LTxz
cGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJCTwvc3Bhbj5yZXQgKz0gc2NucHJpbnRmKGJ1
ZiArIHJldCwgUEFHRV9TSVpFIC0gcmV0LDwvcD48cD4rPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNl
OnByZSI+CQkJPC9zcGFuPnJldCArPSBzeXNmc19lbWl0KGJ1ZiArIHJldCw8L3A+PHA+Jm5ic3A7
PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQkJCQk8L3NwYW4+IlJ4RlMgb3V0cHV0IGZy
b20gJXMsICIsPC9wPjxwPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJCQkJ
PC9zcGFuPmF1ZG11eF9wb3J0X3N0cmluZygocHRjciAmZ3Q7Jmd0OyAxNykgJmFtcDsgMHg3KSk7
PC9wPjxwPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJPC9zcGFuPmVsc2U8
L3A+PHA+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJCTwvc3Bhbj5yZXQgKz0gc2Nu
cHJpbnRmKGJ1ZiArIHJldCwgUEFHRV9TSVpFIC0gcmV0LDwvcD48cD4tPHNwYW4gc3R5bGU9Indo
aXRlLXNwYWNlOnByZSI+CQkJCQk8L3NwYW4+IlJ4RlMgaW5wdXQsICIpOzwvcD48cD4rPHNwYW4g
c3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQkJPC9zcGFuPnJldCArPSBzeXNmc19lbWl0KGJ1ZiAr
IHJldCwgIlJ4RlMgaW5wdXQsICIpOzwvcD48cD4mbmJzcDs8L3A+PHA+Jm5ic3A7PHNwYW4gc3R5
bGU9IndoaXRlLXNwYWNlOnByZSI+CQk8L3NwYW4+aWYgKHB0Y3IgJmFtcDsgSU1YX0FVRE1VWF9W
Ml9QVENSX1JDTEtESVIpPC9wPjxwPi08c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JCQk8
L3NwYW4+cmV0ICs9IHNjbnByaW50ZihidWYgKyByZXQsIFBBR0VfU0laRSAtIHJldCw8L3A+PHA+
KzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJCTwvc3Bhbj5yZXQgKz0gc3lzZnNfZW1p
dChidWYgKyByZXQsPC9wPjxwPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJ
CQkJPC9zcGFuPiJSeENsayBvdXRwdXQgZnJvbSAlcyIsPC9wPjxwPiZuYnNwOzxzcGFuIHN0eWxl
PSJ3aGl0ZS1zcGFjZTpwcmUiPgkJCQkJPC9zcGFuPmF1ZG11eF9wb3J0X3N0cmluZygocHRjciAm
Z3Q7Jmd0OyAxMikgJmFtcDsgMHg3KSk7PC9wPjxwPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1z
cGFjZTpwcmUiPgkJPC9zcGFuPmVsc2U8L3A+PHA+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpw
cmUiPgkJCTwvc3Bhbj5yZXQgKz0gc2NucHJpbnRmKGJ1ZiArIHJldCwgUEFHRV9TSVpFIC0gcmV0
LDwvcD48cD4tPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQkJCQk8L3NwYW4+IlJ4Q2xr
IGlucHV0Iik7PC9wPjxwPis8c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JCQk8L3NwYW4+
cmV0ICs9IHN5c2ZzX2VtaXQoYnVmICsgcmV0LCAiUnhDbGsgaW5wdXQiKTs8L3A+PHA+Jm5ic3A7
PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj59PC9wPjxwPiZuYnNwOzwvcD48
cD4tPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj5yZXQgKz0gc2NucHJpbnRm
KGJ1ZiArIHJldCwgUEFHRV9TSVpFIC0gcmV0LDwvcD48cD4rPHNwYW4gc3R5bGU9IndoaXRlLXNw
YWNlOnByZSI+CTwvc3Bhbj5yZXQgKz0gc3lzZnNfZW1pdChidWYgKyByZXQsPC9wPjxwPiZuYnNw
OzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJCTwvc3Bhbj4iXG5EYXRhIHJlY2VpdmVk
IGZyb20gJXNcbiIsPC9wPjxwPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJ
CTwvc3Bhbj5hdWRtdXhfcG9ydF9zdHJpbmcoKHBkY3IgJmd0OyZndDsgMTMpICZhbXA7IDB4Nykp
OzwvcD48cD4mbmJzcDs8L3A+PHA+LS0mbmJzcDs8L3A+PHA+Mi4yNS4xPC9wPjxwIHN0eWxlPSJm
b250LXNpemU6MTRweDtmb250LWZhbWlseTrlvq7ova/pm4Xpu5EsTWljcm9zb2Z0IFlhSGVpOyI+
PGJyPjwvcD48cCBzdHlsZT0iZm9udC1zaXplOjE0cHg7Zm9udC1mYW1pbHk65b6u6L2v6ZuF6buR
LE1pY3Jvc29mdCBZYUhlaTsiPjxicj48L3A+PHAgc3R5bGU9ImZvbnQtc2l6ZToxNHB4O2ZvbnQt
ZmFtaWx5OuW+rui9r+mbhem7kSxNaWNyb3NvZnQgWWFIZWk7Ij48YnI+PC9wPjxwIHN0eWxlPSJm
b250LXNpemU6MTRweDtmb250LWZhbWlseTrlvq7ova/pm4Xpu5EsTWljcm9zb2Z0IFlhSGVpOyI+
PGJyPjwvcD48L2Rpdj4=


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--


