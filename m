Return-Path: <linuxppc-dev+bounces-337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2711D95B04F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 10:28:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqGYp69V6z2yT0;
	Thu, 22 Aug 2024 18:28:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.155.80.173
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 172429 seconds by postgrey-1.37 at boromir; Thu, 22 Aug 2024 18:28:29 AEST
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqGYn6V8gz2yR3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 18:28:27 +1000 (AEST)
X-QQ-GoodBg: 2
X-BAN-DOWNLOAD: 1
X-BAN-SHARE: 1
X-QQ-SSF: 0040000000000060
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-XMAILINFO: MACXe2l6e7j9rZDyaHszD6Ag/sFotdZB77/1Wflyigy8PcKZViu+Ipe6
	xwn68OHeSDmwvgn/oPigZnHmKJa0KynmBCRRIVxox5jZg3RiV3gTtIJIcpmNd+Y5PbVSO78
	UqvZdswKd7vjHEE0FSFS64yoyF/S73jsi4gvaBkRgqBB/R1JJ1JOYz1g/oLAH8C3Ocv2Xjo
	5thxRzAqPijZLlZvnZY1SMYRQlLkAfkk+FliGGtpxuBQpianZcryrk86SehvcBvt0ma22Tz
	5IpardxidG6Cp7koVVFelqIvCdeSCBGF9+HaOQLiGeWECfu3YZ58CN8MBXYzLZEmCu//xdo
	18grZZw+WpRs9a/hztjUEU/eYcGbxWHZbZUzBSLtyGLgrDqJET4Hh7aN2hDn9kyr/1QW+rx
	UeCKQg63XF4p7qeNLUYofVce2A1ESc/H2ysEfPlgD6/3GOcGVYzyA3AW4EIPHEhtb00Oqdx
	7A0f3Y2mVC2FYxe0bBHOlwdefrl83bfCyq4rxNyeFzReSpOe8xLEp2UurzblyuuXn8X0k5U
	G7FSSCEjV1k0367topgbgl6xj9yzugIwcF07GvR61hEgfvizTNuaLm01ck0tWb5zI/rH2Yp
	6IlSWDOKyC24lN5rqZDZjtQZTi6HnPG9A1SAOoVVWvupoMHX1qQjny3l/tPiLhT6dT2O1T1
	+dxmESFBdph1bBdN1N4lWfjTMlbPS2ftcloqvENYtS3zIQ/tMsUY8iT+3sdTXD4XKbYqfaP
	JBwRHptMuuQtrE9zKEIr7QJONN3BLu2U7+BpFxPj9LodIRNmGM9NtrA6DyS5VO82qXY6I1T
	QIl0Wij1hU84n41u6fm9r3z2G7PNLw0YEe2t4FtXi2/RnLvlRUEu79GDlsCLAfD9B0pPjMn
	9fSfrLtaXJzZ95THbbhQh9Y+s4vuFmIZb1LhEP0t8/bqdLHHNZwFnZ0XqVZaG4FZnc5vbmI
	2L6L9LSze17Jji7qdEXqaTD5m7xnBN35WapY=
X-QQ-FEAT: D4aqtcRDiqQpBpTnjIJt3/f21w9WO3enREO5ZSgO7MU=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: 6zO2TPojsj8VbTvLISuVTo04vR7DXYHYD6MGGpBLkrA=
X-Originating-IP: 58.34.222.244
X-QQ-STYLE: 
X-QQ-mid: t6gz5a-0t1724315196t9664861
From: "=?utf-8?B?6Jme6ZmG6ZOt?=" <luming.yu@shingroup.cn>
To: "=?utf-8?B?6Jme6ZmG6ZOt?=" <luming.yu@shingroup.cn>, "=?utf-8?B?bGludXhwcGMtZGV2?=" <linuxppc-dev@lists.ozlabs.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bXBl?=" <mpe@ellerman.id.au>, "=?utf-8?B?bnBpZ2dpbg==?=" <npiggin@gmail.com>, "=?utf-8?B?Y2hyaXN0b3BoZS5sZXJveQ==?=" <christophe.leroy@csgroup.eu>
Cc: "=?utf-8?B?bHVtaW5nLnl1?=" <luming.yu@gmail.com>, "=?utf-8?B?5p2o5L2z6b6Z?=" <jialong.yang@shingroup.cn>, "=?utf-8?B?c2hlbmdodWkucXU=?=" <shenghui.qu@shingroup.cn>
Subject: Re:[PATCH 2/2] powerpc/locking: enable HAVE_CMPXCHG_LOCAL in kconfig
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_66C6F63C_1E0B4ED0_4D4D5B1E"
Content-Transfer-Encoding: 8Bit
Date: Thu, 22 Aug 2024 16:26:36 +0800
X-Priority: 3
Message-ID: <tencent_08DFF4F960C378A66F8D0BD9@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20231204022303.528-1-luming.yu@shingroup.cn>
	<4250629DA95C6D4F+20231204022303.528-2-luming.yu@shingroup.cn>
In-Reply-To: <4250629DA95C6D4F+20231204022303.528-2-luming.yu@shingroup.cn>
X-QQ-ReplyHash: 1814028533
X-BIZMAIL-ID: 5680682146119398929
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Thu, 22 Aug 2024 16:26:37 +0800 (CST)
Feedback-ID: t:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-0

This is a multi-part message in MIME format.

------=_NextPart_66C6F63C_1E0B4ED0_4D4D5B1E
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCg0Kc3BlY2lmaWMgZm9yIGxvY2FsIGNtcHhjaGcgZW5hYmxlZCBvbiBwOCBwb3dl
cm52IHBsYXRmb3JtIG9uIHdoaWNoIHRoZSBwYXRjaCBlbmFibGVkIHZtX3N0YXRlIHVwZGF0
ZSBwYXRoLA0KZnRyYWNlIGRhdGEgYmVsb3cgaW5kaWNhdGVzIGl0IGlzJm5ic3A7IGF0IHRo
ZSBsZXZlbCZuYnNwOyBvZmFib3V0IDR1cyBvciA1dXMgbGF0ZW5jeSwmbmJzcDsgZm9yIHN1
Y2ggYSBiaWcgY2FjaGUgY29sZCBvcGVyYXRpb25zLg0KDQombmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPC4uLiZndDstMjc3Nzg3Jm5i
c3A7IFswMDhdIC4uLi4uIDg4MzY2LjIzMzY0MzogcmVmcmVzaF9jcHVfdm1fc3RhdHMgPC12
bXN0YXRfdXBkYXRlDQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgPGlkbGUmZ3Q7LTAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgWzAwOF0gZC4uLi4gODgzNjYuMjMzNjQ4OiB0aWNrX25vaHpfaWRsZV9zdG9w
X3RpY2sgPC1kb19pZGxlDQoNCg0KSSBoYXZlIG5vIGRpZmYgZGF0YSBhZ2FpbnN0IHRoZSBs
YXRlbmN5IHdpdGhvdXQgdGhlIHBhdGNoLiBCdXQgYmFzZWQgb24gdGhlIGVzdGltYXRpb24g
b2YgdGhlIHBpcGVsaW5lIG92ZXJoZWFkIGZvcg0Kc3VjaCBhIGJpZyBvcGVyYXRpb24gaW5j
dXJyZWQgYnkgdGhlIHZtIHN0YXRzIHVwZGF0ZSwgaXQgbG9va3Mgbm90IGJhZC4NCiZuYnNw
O0kgd2lsbCBkbyBtb3JlIHRlc3RpbmcgYW5kIGNvbGxlY3QgbW9yZSBoaXN0b2dyYW0gZm9y
IGRpZmZlcmVudCBzY2VuYXJpb3MgdG8gZW5zdXJlIHRoYXQNCnRoZSBsYXRlbmN5IGxldmVs
IG9mIHVuZGVyc3RhbmRpbmcgaXMgc29tZXRoaW5nIHN0YXRpc3RpY2FsbHkgbWFrZSBzZW5z
ZS4NCg0KDQpKdXN0IGZvciB0aGUgcmVjb3JkIHRoYXQgdGhlIHNtYWxsIHBhdGNoIHdvcmtz
IGFzIGV4cGVjdGVkLiA6LSkNCg0KDQpCUg0KTHVtaW5nDQoNCi0tLS0tLS0tLS0tLS0tLS0t
LSZuYnNwO09yaWdpbmFsJm5ic3A7LS0tLS0tLS0tLS0tLS0tLS0tDQpGcm9tOiAmbmJzcDsi
6Jme6ZmG6ZOtIjxsdW1pbmcueXVAc2hpbmdyb3VwLmNuJmd0OzsNCkRhdGU6ICZuYnNwO01v
biwgRGVjIDQsIDIwMjMgMTA6MjMgQU0NClRvOiAmbmJzcDsibGludXhwcGMtZGV2IjxsaW51
eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyZndDs7ICJsaW51eC1rZXJuZWwiPGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcmZ3Q7OyAibXBlIjxtcGVAZWxsZXJtYW4uaWQuYXUmZ3Q7
OyAibnBpZ2dpbiI8bnBpZ2dpbkBnbWFpbC5jb20mZ3Q7OyAiY2hyaXN0b3BoZS5sZXJveSI8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Jmd0OzsgDQpDYzogJm5ic3A7Imx1bWluZy55
dSI8bHVtaW5nLnl1QGdtYWlsLmNvbSZndDs7ICJrZS56aGFvIjxrZS56aGFvQHNoaW5ncm91
cC5jbiZndDs7ICJkYXdlaS5saSI8ZGF3ZWkubGlAc2hpbmdyb3VwLmNuJmd0OzsgInNoZW5n
aHVpLnF1IjxzaGVuZ2h1aS5xdUBzaGluZ3JvdXAuY24mZ3Q7OyAi6Jme6ZmG6ZOtIjxsdW1p
bmcueXVAc2hpbmdyb3VwLmNuJmd0OzsgDQpTdWJqZWN0OiAmbmJzcDtbUEFUQ0ggMi8yXSBw
b3dlcnBjL2xvY2tpbmc6IGVuYWJsZSBIQVZFX0NNUFhDSEdfTE9DQUwgaW4ga2NvbmZpZw0K
DQombmJzcDsNCg0KZW5hYmxlIGFyY2ggZmVhdHVyZSBIQVZFX0NNUFhDSEdfTE9DQUwgZm9y
IHBwYyBieSBkZWZhdWx0DQoNClNpZ25lZC1vZmYtYnk6IEx1bWluZyBZdSA8bHVtaW5nLnl1
QHNoaW5ncm91cC5jbiZndDsNCi0tLQ0KJm5ic3A7YXJjaC9wb3dlcnBjL0tjb25maWcgfCAx
ICsNCiZuYnNwOzEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KaW5kZXgg
NmYxMDVlZTRmM2NmLi5jMTAyMjljMDI0M2MgMTAwNjQ0DQotLS0gYS9hcmNoL3Bvd2VycGMv
S2NvbmZpZw0KKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCkBAIC0yMjYsNiArMjI2LDcg
QEAgY29uZmlnIFBQQw0KJm5ic3A7CXNlbGVjdCBIQVZFX0FSQ0hfU0VDQ09NUF9GSUxURVIN
CiZuYnNwOwlzZWxlY3QgSEFWRV9BUkNIX1RSQUNFSE9PSw0KJm5ic3A7CXNlbGVjdCBIQVZF
X0FTTV9NT0RWRVJTSU9OUw0KKwlzZWxlY3QgSEFWRV9DTVBYQ0hHX0xPQ0FMDQombmJzcDsJ
c2VsZWN0IEhBVkVfQ09OVEVYVF9UUkFDS0lOR19VU0VSDQombmJzcDsJc2VsZWN0IEhBVkVf
Q19SRUNPUkRNQ09VTlQNCiZuYnNwOwlzZWxlY3QgSEFWRV9ERUJVR19LTUVNTEVBSw0KLS0g
DQoyLjQyLjAud2luZG93cy4y

------=_NextPart_66C6F63C_1E0B4ED0_4D4D5B1E
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGRpdj48YnI+PC9kaXY+PGRpdj5IaSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnNwZWNp
ZmljIGZvciBsb2NhbCBjbXB4Y2hnIGVuYWJsZWQgb24gcDggcG93ZXJudiBwbGF0Zm9ybSBv
biB3aGljaCB0aGUgcGF0Y2ggZW5hYmxlZCB2bV9zdGF0ZSB1cGRhdGUgcGF0aCw8L2Rpdj48
ZGl2PmZ0cmFjZSBkYXRhIGJlbG93IGluZGljYXRlcyBpdCBpcyZuYnNwOyBhdCB0aGUgbGV2
ZWwmbmJzcDsgb2ZhYm91dCA0dXMgb3IgNXVzIGxhdGVuY3ksJm5ic3A7IGZvciBzdWNoIGEg
YmlnIGNhY2hlIGNvbGQgb3BlcmF0aW9ucy48YnI+PC9kaXY+PGRpdj48aW5jbHVkZXRhaWw+
PGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgJmx0Oy4uLiZndDstMjc3Nzg3Jm5ic3A7IFswMDhdIC4uLi4uIDg4MzY2LjIzMzY0
MzogcmVmcmVzaF9jcHVfdm1fc3RhdHMgJmx0Oy12bXN0YXRfdXBkYXRlPGJyPiZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAmbHQ7aWRs
ZSZndDstMCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBbMDA4XSBkLi4u
LiA4ODM2Ni4yMzM2NDg6IHRpY2tfbm9oel9pZGxlX3N0b3BfdGljayAmbHQ7LWRvX2lkbGU8
YnI+PGJyPjwvZGl2PjxkaXY+SSBoYXZlIG5vIGRpZmYgZGF0YSBhZ2FpbnN0IHRoZSBsYXRl
bmN5IHdpdGhvdXQgdGhlIHBhdGNoLiBCdXQgYmFzZWQgb24gdGhlIGVzdGltYXRpb24gb2Yg
dGhlIHBpcGVsaW5lIG92ZXJoZWFkIGZvcjwvZGl2PjxkaXY+c3VjaCBhIGJpZyBvcGVyYXRp
b24gaW5jdXJyZWQgYnkgdGhlIHZtIHN0YXRzIHVwZGF0ZSwgaXQgbG9va3Mgbm90IGJhZC48
L2Rpdj48ZGl2PiZuYnNwO0kgd2lsbCBkbyBtb3JlIHRlc3RpbmcgYW5kIGNvbGxlY3QgbW9y
ZSBoaXN0b2dyYW0gZm9yIGRpZmZlcmVudCBzY2VuYXJpb3MgdG8gZW5zdXJlIHRoYXQ8L2Rp
dj48ZGl2PnRoZSBsYXRlbmN5IGxldmVsIG9mIHVuZGVyc3RhbmRpbmcgaXMgc29tZXRoaW5n
IHN0YXRpc3RpY2FsbHkgbWFrZSBzZW5zZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkp1
c3QgZm9yIHRoZSByZWNvcmQgdGhhdCB0aGUgc21hbGwgcGF0Y2ggd29ya3MgYXMgZXhwZWN0
ZWQuIDotKTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QlI8L2Rpdj48ZGl2Pkx1bWluZzxi
cj48L2Rpdj48ZGl2IHN0eWxlPSJmb250OlZlcmRhbmEgbm9ybWFsIDE0cHg7Y29sb3I6IzAw
MDsiPjxkaXYgc3R5bGU9IkZPTlQtU0laRTogMTJweDtGT05ULUZBTUlMWTogQXJpYWwgTmFy
cm93O3BhZGRpbmc6MnB4IDAgMnB4IDA7Ij4tLS0tLS0tLS0tLS0tLS0tLS0mbmJzcDtPcmln
aW5hbCZuYnNwOy0tLS0tLS0tLS0tLS0tLS0tLTwvZGl2PjxkaXYgc3R5bGU9IkZPTlQtU0la
RTogMTJweDtiYWNrZ3JvdW5kOiNlZmVmZWY7cGFkZGluZzo4cHg7Ij48ZGl2IGlkPSJtZW51
X3NlbmRlciI+PGI+RnJvbTogPC9iPiZuYnNwOyLomZ7pmYbpk60iJmx0O2x1bWluZy55dUBz
aGluZ3JvdXAuY24mZ3Q7OzwvZGl2PjxkaXY+PGI+RGF0ZTogPC9iPiZuYnNwO01vbiwgRGVj
IDQsIDIwMjMgMTA6MjMgQU08L2Rpdj48ZGl2PjxiPlRvOiA8L2I+Jm5ic3A7ImxpbnV4cHBj
LWRldiImbHQ7bGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcmZ3Q7OyAibGludXgta2Vy
bmVsIiZsdDtsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnJmd0OzsgIm1wZSImbHQ7bXBl
QGVsbGVybWFuLmlkLmF1Jmd0OzsgIm5waWdnaW4iJmx0O25waWdnaW5AZ21haWwuY29tJmd0
OzsgImNocmlzdG9waGUubGVyb3kiJmx0O2NocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldSZn
dDs7IDx3YnI+PC9kaXY+PGRpdj48Yj5DYzogPC9iPiZuYnNwOyJsdW1pbmcueXUiJmx0O2x1
bWluZy55dUBnbWFpbC5jb20mZ3Q7OyAia2UuemhhbyImbHQ7a2Uuemhhb0BzaGluZ3JvdXAu
Y24mZ3Q7OyAiZGF3ZWkubGkiJmx0O2Rhd2VpLmxpQHNoaW5ncm91cC5jbiZndDs7ICJzaGVu
Z2h1aS5xdSImbHQ7c2hlbmdodWkucXVAc2hpbmdyb3VwLmNuJmd0OzsgIuiZnumZhumTrSIm
bHQ7bHVtaW5nLnl1QHNoaW5ncm91cC5jbiZndDs7IDx3YnI+PC9kaXY+PGRpdj48Yj5TdWJq
ZWN0OiA8L2I+Jm5ic3A7W1BBVENIIDIvMl0gcG93ZXJwYy9sb2NraW5nOiBlbmFibGUgSEFW
RV9DTVBYQ0hHX0xPQ0FMIGluIGtjb25maWc8L2Rpdj48L2Rpdj48ZGl2PiZuYnNwOzwvZGl2
PjxkaXYgc3R5bGU9InBvc2l0aW9uOnJlbGF0aXZlOyI+PGRpdiBpZD0idG1wY29udGVudF9y
ZXMiPjwvZGl2PmVuYWJsZSBhcmNoIGZlYXR1cmUgSEFWRV9DTVBYQ0hHX0xPQ0FMIGZvciBw
cGMgYnkgZGVmYXVsdDxicj48YnI+U2lnbmVkLW9mZi1ieTogTHVtaW5nIFl1ICZsdDtsdW1p
bmcueXVAc2hpbmdyb3VwLmNuJmd0Ozxicj4tLS08YnI+Jm5ic3A7YXJjaC9wb3dlcnBjL0tj
b25maWcgfCAxICs8YnI+Jm5ic3A7MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspPGJy
Pjxicj5kaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMv
S2NvbmZpZzxicj5pbmRleCA2ZjEwNWVlNGYzY2YuLmMxMDIyOWMwMjQzYyAxMDA2NDQ8YnI+
LS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWc8YnI+KysrIGIvYXJjaC9wb3dlcnBjL0tjb25m
aWc8YnI+QEAgLTIyNiw2ICsyMjYsNyBAQCBjb25maWcgUFBDPGJyPiZuYnNwOwlzZWxlY3Qg
SEFWRV9BUkNIX1NFQ0NPTVBfRklMVEVSPGJyPiZuYnNwOwlzZWxlY3QgSEFWRV9BUkNIX1RS
QUNFSE9PSzxicj4mbmJzcDsJc2VsZWN0IEhBVkVfQVNNX01PRFZFUlNJT05TPGJyPisJc2Vs
ZWN0IEhBVkVfQ01QWENIR19MT0NBTDxicj4mbmJzcDsJc2VsZWN0IEhBVkVfQ09OVEVYVF9U
UkFDS0lOR19VU0VSPGJyPiZuYnNwOwlzZWxlY3QgSEFWRV9DX1JFQ09SRE1DT1VOVDxicj4m
bmJzcDsJc2VsZWN0IEhBVkVfREVCVUdfS01FTUxFQUs8YnI+LS0gPGJyPjIuNDIuMC53aW5k
b3dzLjI8YnI+PC9kaXY+PC9kaXY+PCEtLTwhW2VuZGlmXS0tPjwvaW5jbHVkZXRhaWw+PC9k
aXY+

------=_NextPart_66C6F63C_1E0B4ED0_4D4D5B1E--


