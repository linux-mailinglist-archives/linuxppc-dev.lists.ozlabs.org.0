Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6F518E168
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 13:56:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l0y31MdGzF0ZM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 23:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p00-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5300::7;
 helo=mo6-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=NvocYwx0; 
 dkim-atps=neutral
X-Greylist: delayed 177 seconds by postgrey-1.36 at bilbo;
 Sat, 21 Mar 2020 23:53:33 AEDT
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48l0v14w0KzDrR7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 23:53:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1584795207;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:Cc:From:References:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ldimWoRLsCAE5JRXdvCkK4s0HAn6/zloCegzZ88k+n0=;
 b=NvocYwx0dHaxNLEQOMRuH/L/xQIG8WMXJY2HaUV0IcZh6rtX6bixjtGEzTS/ndqSWL
 azSWHBKNtNnl7i4Cyc+eYNNjAlqFsgyTdZ3RiN/6rF9SX+azmoThwb6mI6/jxESOCjyc
 ROZrvF67EAWXNM5DYOBFDQEdmR0H5+AdTIrDWChteslaXpUmd3+JLM6h/9Jv5behVim7
 1oMCF+mP98byOuQaUR0xJ1PkEasm6PfmdzVf87BQdAc6/DFuic8bzJFlLqRcEPVUfggR
 URJnMHj2rxgxz9aCx4WmzBhzp1WnCQoXSLP/CD/fFviH4q+Vpbs8BYKwFA1PT/0GBRTu
 u3aw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhQL/vFUhOeFBFYLgGijN1As3g7WQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:3924:3dd8:fb3f:a8eb]
 by smtp.strato.de (RZmta 46.2.1 AUTH) with ESMTPSA id c060e4w2LCoNBZf
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 21 Mar 2020 13:50:23 +0100 (CET)
Subject: FSL P5020/Cyrus+ Board: Poweroff and Restart Support
To: linuxppc-dev@lists.ozlabs.org
References: <mailman.1087.1584789896.27067.linuxppc-dev@lists.ozlabs.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <fb1762ec-5c08-a92d-0b2a-5e2b48380b29@xenosoft.de>
Date: Sat, 21 Mar 2020 13:50:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <mailman.1087.1584789896.27067.linuxppc-dev@lists.ozlabs.org>
Content-Type: multipart/mixed; boundary="------------A627FEAA91B13DF283D309DA"
Content-Language: de-DE
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
Cc: Julian Margetson <runaway@candw.ms>,
 Darren Stevens <darren@stevens-zone.net>,
 "contact@a-eon.com" <contact@a-eon.com>, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------A627FEAA91B13DF283D309DA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

We would like to add poweroff and restart support for the Cyrus+ board 
[1] [2] to the mainline vanilla kernel.
There is a patch for adding poweroff and restart support. (attached)
It works but I am not sure if it is good enough for the mainline vanilla 
kernel.
Please post some suggestions and comments about this patch.

Thanks,
Christian


[1] http://wiki.amiga.org/index.php?title=X5000
[2] https://www.amigaos.net/hardware/133/amigaone-x5000

--------------A627FEAA91B13DF283D309DA
Content-Type: text/plain; charset=UTF-8;
 name="cyrus_5.6-2.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="cyrus_5.6-2.txt"

ZGlmZiAtcnVwTiBhL2FyY2gvcG93ZXJwYy9ib290L2R0cy9mc2wvY3lydXNfcDUwMjAuZHRz
IGIvYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL2ZzbC9jeXJ1c19wNTAyMC5kdHMKLS0tIGEvYXJj
aC9wb3dlcnBjL2Jvb3QvZHRzL2ZzbC9jeXJ1c19wNTAyMC5kdHMJMjAyMC0wMi0xMCAwMTow
ODo0OC4wMDAwMDAwMDAgKzAxMDAKKysrIGIvYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL2ZzbC9j
eXJ1c19wNTAyMC5kdHMJMjAyMC0wMi0xMCAwODo0OTo0Ny45NTM2ODA5NDcgKzAxMDAKQEAg
LTE0Niw2ICsxNDYsMjUgQEAKIAkJCQkgIDAgMHgwMDAxMDAwMD47CiAJCX07CiAJfTsKKwor
CWdwaW8tcG93ZXJvZmYgeworCQljb21wYXRpYmxlID0gImdwaW8tcG93ZXJvZmYiOworCQln
cGlvcyA9IDwmZ3BpbzAgMyAxPjsKKwl9OworCisJZ3Bpby1yZXN0YXJ0IHsKKwkJY29tcGF0
aWJsZSA9ICJncGlvLXJlc3RhcnQiOworCQlncGlvcyA9IDwmZ3BpbzAgMiAxPjsKKwl9Owor
CisJbGVkcyB7CisJCWNvbXBhdGlibGUgPSAiZ3Bpby1sZWRzIjsKKwkJaGRkIHsKKwkJCWxh
YmVsID0gIkRpc2sgYWN0aXZpdHkiOworCQkJZ3Bpb3MgPSA8JmdwaW8wIDUgMD47CisJCQls
aW51eCxkZWZhdWx0LXRyaWdnZXIgPSAiZGlzay1hY3Rpdml0eSI7CisJCX07CisJfTsKIH07
CiAKIC9pbmNsdWRlLyAicDUwMjBzaS1wb3N0LmR0c2kiCmRpZmYgLXJ1cE4gYS9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zLzg1eHgvY29yZW5ldF9nZW5lcmljLmMgYi9hcmNoL3Bvd2VycGMv
cGxhdGZvcm1zLzg1eHgvY29yZW5ldF9nZW5lcmljLmMKLS0tIGEvYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy84NXh4L2NvcmVuZXRfZ2VuZXJpYy5jCTIwMjAtMDItMTAgMDE6MDg6NDguMDAw
MDAwMDAwICswMTAwCisrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9jb3JlbmV0
X2dlbmVyaWMuYwkyMDIwLTAyLTEwIDA4OjQ5OjQ3Ljk1MzY4MDk0NyArMDEwMApAQCAtNDYs
NiArNDYsMTYgQEAgdm9pZCBfX2luaXQgY29yZW5ldF9nZW5fcGljX2luaXQodm9pZCkKIAlt
cGljX2luaXQobXBpYyk7CiB9CiAKKy8qIElmIHNvbWVvbmUgaGFzIHJlZ2lzdGVyZWQgYSBw
b3dlcm9mZiBjYWxsYmFjaywgaW52b2tlIGl0ICovCitzdGF0aWMgdm9pZCBfX25vcmV0dXJu
IGNvcmVuZXRfZ2VuZXJpY19oYWx0KHZvaWQpCit7CisJaWYgKHBtX3Bvd2VyX29mZikKKwlw
bV9wb3dlcl9vZmYoKTsKKworCS8qIFNob3VsZCBub3QgcmV0dXJuICovCisJZm9yKDs7KTsK
K30KKwogLyoKICAqIFNldHVwIHRoZSBhcmNoaXRlY3R1cmUKICAqLwpAQCAtOTksNiArMTA5
LDE1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX2RldmkKIAl7CiAJ
CS5uYW1lCQk9ICJoYW5kbGVzIiwKIAl9LAorCXsKKwkJLm5hbWUJCT0gImdwaW8tcG93ZXJv
ZmYiLAorCX0sCisJeworCQkubmFtZQkJPSAiZ3Bpby1yZXN0YXJ0IiwKKwl9LAorCXsKKwkJ
Lm5hbWUJCT0gImxlZHMiLAorCX0sCiAJe30KIH07CiAKQEAgLTE0OSw2ICsxNjgsOCBAQCBz
dGF0aWMgaW50IF9faW5pdCBjb3JlbmV0X2dlbmVyaWNfcHJvYmUoCiAJZXh0ZXJuIHN0cnVj
dCBzbXBfb3BzX3Qgc21wXzg1eHhfb3BzOwogI2VuZGlmCiAKKwlwcGNfbWQuaGFsdCA9IGNv
cmVuZXRfZ2VuZXJpY19oYWx0OworCiAJaWYgKG9mX2RldmljZV9jb21wYXRpYmxlX21hdGNo
KG9mX3Jvb3QsIGJvYXJkcykpCiAJCXJldHVybiAxOwogCg==
--------------A627FEAA91B13DF283D309DA--
