Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE6B28FEC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 09:01:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCH9n2DGSzDqXv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 18:01:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zte.com.cn (client-ip=63.217.80.70; helo=mxhk.zte.com.cn;
 envelope-from=wang.yi59@zte.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=zte.com.cn
X-Greylist: delayed 924 seconds by postgrey-1.36 at bilbo;
 Fri, 16 Oct 2020 17:59:06 AEDT
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCH7Z3XGWzDqL5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 17:59:05 +1100 (AEDT)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 27FF1C550EC2BD117663;
 Fri, 16 Oct 2020 14:43:31 +0800 (CST)
Received: from kjyxapp03.zte.com.cn ([10.30.12.202])
 by mse-fl1.zte.com.cn with SMTP id 09G6hJMu020756;
 Fri, 16 Oct 2020 14:43:19 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain (unknown [10.234.72.110])
 by smtp (Zmail) with SMTP; Fri, 16 Oct 2020 14:43:19 +0800
X-Zmail-TransId: 3e885f894106006-5cc45
From: Yi Wang <wang.yi59@zte.com.cn>
To: Roy.Pledge@nxp.com, laurentiu.tudor@nxp.com
Subject: [PATCH v2] soc: fsl: dpio: Change 'cpumask_t mask' to the driver's
 private data
Date: Fri, 16 Oct 2020 14:48:58 +0800
Message-Id: <20201016064858.9438-1-wang.yi59@zte.com.cn>
X-Mailer: X-Zmail-Txt
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse-fl1.zte.com.cn 09G6hJMu020756
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
Cc: wang.yi59@zte.com.cn, jiang.xuexin@zte.com.cn, Hao Si <si.hao@zte.com.cn>,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, xue.zhihong@zte.com.cn,
 Lin Chen <chen.lin5@zte.com.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbTogSGFvIFNpIDxzaS5oYW9AenRlLmNvbS5jbj4NCg0KVGhlIGxvY2FsIHZhcmlhYmxlICdj
cHVtYXNrX3QgbWFzaycgaXMgaW4gdGhlIHN0YWNrIG1lbW9yeSwgYW5kIGl0cyBhZGRyZXNzDQpp
cyBhc3NpZ25lZCB0byAnZGVzYy0+YWZmaW5pdHknIGluICdpcnFfc2V0X2FmZmluaXR5X2hpbnQo
KScuDQpCdXQgdGhlIG1lbW9yeSBhcmVhIHdoZXJlIHRoaXMgdmFyaWFibGUgaXMgbG9jYXRlZCBp
cyBhdCByaXNrIG9mIGJlaW5nDQptb2RpZmllZC4NCg0KRHVyaW5nIExUUCB0ZXN0aW5nLCB0aGUg
Zm9sbG93aW5nIGVycm9yIHdhcyBnZW5lcmF0ZWQ6DQoNClVuYWJsZSB0byBoYW5kbGUga2VybmVs
IHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyBmZmZmMDAwMDEyZTliNzkwDQpNZW0g
YWJvcnQgaW5mbzoNCiAgRVNSID0gMHg5NjAwMDAwNw0KICBFeGNlcHRpb24gY2xhc3MgPSBEQUJU
IChjdXJyZW50IEVMKSwgSUwgPSAzMiBiaXRzDQogIFNFVCA9IDAsIEZuViA9IDANCiAgRUEgPSAw
LCBTMVBUVyA9IDANCkRhdGEgYWJvcnQgaW5mbzoNCiAgSVNWID0gMCwgSVNTID0gMHgwMDAwMDAw
Nw0KICBDTSA9IDAsIFduUiA9IDANCnN3YXBwZXIgcGd0YWJsZTogNGsgcGFnZXMsIDQ4LWJpdCBW
QXMsIHBnZHAgPSAwMDAwMDAwMDc1YWM1ZTA3DQpbZmZmZjAwMDAxMmU5Yjc5MF0gcGdkPTAwMDAw
MDI3ZGJmZmUwMDMsIHB1ZD0wMDAwMDAyN2RiZmZkMDAzLA0KcG1kPTAwMDAwMDI3YjZkNjEwMDMs
IHB0ZT0wMDAwMDAwMDAwMDAwMDAwDQpJbnRlcm5hbCBlcnJvcjogT29wczogOTYwMDAwMDcgWyMx
XSBQUkVFTVBUIFNNUA0KTW9kdWxlcyBsaW5rZWQgaW46IHh0X2Nvbm50cmFjaw0KUHJvY2VzcyBy
ZWFkX2FsbCAocGlkOiAyMDE3MSwgc3RhY2sgbGltaXQgPSAweDAwMDAwMDAwNDRlYTQwOTUpDQpD
UFU6IDE0IFBJRDogMjAxNzEgQ29tbTogcmVhZF9hbGwgVGFpbnRlZDogRyAgICBCICAgVw0KSGFy
ZHdhcmUgbmFtZTogTlhQIExheWVyc2NhcGUgTFgyMTYwQVJEQiAoRFQpDQpwc3RhdGU6IDgwMDAw
MDg1IChOemN2IGRhSWYgLVBBTiAtVUFPKQ0KcGMgOiBpcnFfYWZmaW5pdHlfaGludF9wcm9jX3No
b3crMHg1NC8weGIwDQpsciA6IGlycV9hZmZpbml0eV9oaW50X3Byb2Nfc2hvdysweDRjLzB4YjAN
CnNwIDogZmZmZjAwMDAxMTM4YmMxMA0KeDI5OiBmZmZmMDAwMDExMzhiYzEwIHgyODogMDAwMGZm
ZmZkMTMxZDFlMA0KeDI3OiAwMDAwMDAwMDAwNzAwMGMwIHgyNjogZmZmZjgwMjViOTQ4MGRjMA0K
eDI1OiBmZmZmODAyNWI5NDgwZGE4IHgyNDogMDAwMDAwMDAwMDAwMDNmZg0KeDIzOiBmZmZmODAy
NzMzNGY4MzAwIHgyMjogZmZmZjgwMjcyZTk3ZDAwMA0KeDIxOiBmZmZmODAyNzJlOTdkMGIwIHgy
MDogZmZmZjgwMjViOTQ4MGQ4MA0KeDE5OiBmZmZmMDAwMDA5YTQ5MDAwIHgxODogMDAwMDAwMDAw
MDAwMDAwMA0KeDE3OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjogMDAwMDAwMDAwMDAwMDAwMA0KeDE1
OiAwMDAwMDAwMDAwMDAwMDAwIHgxNDogMDAwMDAwMDAwMDAwMDAwMA0KeDEzOiAwMDAwMDAwMDAw
MDAwMDAwIHgxMjogMDAwMDAwMDAwMDAwMDA0MA0KeDExOiAwMDAwMDAwMDAwMDAwMDAwIHgxMDog
ZmZmZjgwMjczNWI3OWI4OA0KeDkgOiAwMDAwMDAwMDAwMDAwMDAwIHg4IDogMDAwMDAwMDAwMDAw
MDAwMA0KeDcgOiBmZmZmMDAwMDA5YTQ5ODQ4IHg2IDogMDAwMDAwMDAwMDAwMDAwMw0KeDUgOiAw
MDAwMDAwMDAwMDAwMDAwIHg0IDogZmZmZjAwMDAwODE1N2Q2Yw0KeDMgOiBmZmZmMDAwMDExMzhi
YzEwIHgyIDogZmZmZjAwMDAxMmU5Yjc5MA0KeDEgOiAwMDAwMDAwMDAwMDAwMDAwIHgwIDogMDAw
MDAwMDAwMDAwMDAwMA0KQ2FsbCB0cmFjZToNCiBpcnFfYWZmaW5pdHlfaGludF9wcm9jX3Nob3cr
MHg1NC8weGIwDQogc2VxX3JlYWQrMHgxYjAvMHg0NDANCiBwcm9jX3JlZ19yZWFkKzB4ODAvMHhk
OA0KIF9fdmZzX3JlYWQrMHg2MC8weDE3OA0KIHZmc19yZWFkKzB4OTQvMHgxNTANCiBrc3lzX3Jl
YWQrMHg3NC8weGYwDQogX19hcm02NF9zeXNfcmVhZCsweDI0LzB4MzANCiBlbDBfc3ZjX2NvbW1v
bi5jb25zdHByb3AuMCsweGQ4LzB4MWEwDQogZWwwX3N2Y19oYW5kbGVyKzB4MzQvMHg4OA0KIGVs
MF9zdmMrMHgxMC8weDE0DQpDb2RlOiBmOTAwMWJiZiA5NDNlMDczMiBmOTQwNjZjMiBiNDAwMDA2
MiAoZjk0MDAwNDEpDQotLS1bIGVuZCB0cmFjZSBiNDk1YmRjYjBiM2I3MzJiIF0tLS0NCktlcm5l
bCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBGYXRhbCBleGNlcHRpb24NClNNUDogc3RvcHBpbmcgc2Vj
b25kYXJ5IENQVXMNClNNUDogZmFpbGVkIHRvIHN0b3Agc2Vjb25kYXJ5IENQVXMgMCwyLTQsNiw4
LDExLDEzLTE1DQpLZXJuZWwgT2Zmc2V0OiBkaXNhYmxlZA0KQ1BVIGZlYXR1cmVzOiAweDAsMjEw
MDYwMDgNCk1lbW9yeSBMaW1pdDogbm9uZQ0KLS0tWyBlbmQgS2VybmVsIHBhbmljIC0gbm90IHN5
bmNpbmc6IEZhdGFsIGV4Y2VwdGlvbiBdLS0tDQoNCkZpeCBpdCBieSBjaGFuZ2luZyAnY3B1bWFz
a190IG1hc2snIHRvIHRoZSBkcml2ZXIncyBwcml2YXRlIGRhdGEuDQoNClNpZ25lZC1vZmYtYnk6
IEhhbyBTaSA8c2kuaGFvQHp0ZS5jb20uY24+DQpTaWduZWQtb2ZmLWJ5OiBMaW4gQ2hlbiA8Y2hl
bi5saW41QHp0ZS5jb20uY24+DQpTaWduZWQtb2ZmLWJ5OiBZaSBXYW5nIDx3YW5nLnlpNTlAenRl
LmNvbS5jbj4NCi0tLQ0KdjI6IFBsYWNlICdjcHVtYXNrX3QgbWFzaycgaW4gdGhlIGRyaXZlcidz
IHByaXZhdGUgZGF0YSBhbmQgd2hpbGUgYXQgaXQsDQpyZW5hbWUgaXQgdG8gY3B1X21hc2suDQoN
CiBkcml2ZXJzL3NvYy9mc2wvZHBpby9kcGlvLWRyaXZlci5jIHwgOSArKysrKy0tLS0NCiBpbmNs
dWRlL2xpbnV4L2ZzbC9tYy5oICAgICAgICAgICAgIHwgMiArKw0KIDIgZmlsZXMgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
b2MvZnNsL2RwaW8vZHBpby1kcml2ZXIuYyBiL2RyaXZlcnMvc29jL2ZzbC9kcGlvL2RwaW8tZHJp
dmVyLmMNCmluZGV4IDdiNjQyYzMuLmU5ZDgyMGQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NvYy9m
c2wvZHBpby9kcGlvLWRyaXZlci5jDQorKysgYi9kcml2ZXJzL3NvYy9mc2wvZHBpby9kcGlvLWRy
aXZlci5jDQpAQCAtOTUsNyArOTUsNyBAQCBzdGF0aWMgaW50IHJlZ2lzdGVyX2RwaW9faXJxX2hh
bmRsZXJzKHN0cnVjdCBmc2xfbWNfZGV2aWNlICpkcGlvX2RldiwgaW50IGNwdSkNCiB7DQogCWlu
dCBlcnJvcjsNCiAJc3RydWN0IGZzbF9tY19kZXZpY2VfaXJxICppcnE7DQotCWNwdW1hc2tfdCBt
YXNrOw0KKwljcHVtYXNrX3QgKmNwdV9tYXNrOw0KIA0KIAlpcnEgPSBkcGlvX2Rldi0+aXJxc1sw
XTsNCiAJZXJyb3IgPSBkZXZtX3JlcXVlc3RfaXJxKCZkcGlvX2Rldi0+ZGV2LA0KQEAgLTExMiw5
ICsxMTIsMTAgQEAgc3RhdGljIGludCByZWdpc3Rlcl9kcGlvX2lycV9oYW5kbGVycyhzdHJ1Y3Qg
ZnNsX21jX2RldmljZSAqZHBpb19kZXYsIGludCBjcHUpDQogCX0NCiANCiAJLyogc2V0IHRoZSBh
ZmZpbml0eSBoaW50ICovDQotCWNwdW1hc2tfY2xlYXIoJm1hc2spOw0KLQljcHVtYXNrX3NldF9j
cHUoY3B1LCAmbWFzayk7DQotCWlmIChpcnFfc2V0X2FmZmluaXR5X2hpbnQoaXJxLT5tc2lfZGVz
Yy0+aXJxLCAmbWFzaykpDQorCWNwdV9tYXNrID0gJmRwaW9fZGV2LT5tYXNrOw0KKwljcHVtYXNr
X2NsZWFyKGNwdV9tYXNrKTsNCisJY3B1bWFza19zZXRfY3B1KGNwdSwgY3B1X21hc2spOw0KKwlp
ZiAoaXJxX3NldF9hZmZpbml0eV9oaW50KGlycS0+bXNpX2Rlc2MtPmlycSwgY3B1X21hc2spKQ0K
IAkJZGV2X2VycigmZHBpb19kZXYtPmRldiwNCiAJCQkiaXJxX3NldF9hZmZpbml0eSBmYWlsZWQg
aXJxICVkIGNwdSAlZFxuIiwNCiAJCQlpcnEtPm1zaV9kZXNjLT5pcnEsIGNwdSk7DQpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9mc2wvbWMuaCBiL2luY2x1ZGUvbGludXgvZnNsL21jLmgNCmlu
ZGV4IGE0MjhjNjEuLmViZGZiNTQgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2xpbnV4L2ZzbC9tYy5o
DQorKysgYi9pbmNsdWRlL2xpbnV4L2ZzbC9tYy5oDQpAQCAtMTUxLDYgKzE1MSw3IEBAIHN0cnVj
dCBmc2xfbWNfb2JqX2Rlc2Mgew0KIC8qKg0KICAqIHN0cnVjdCBmc2xfbWNfZGV2aWNlIC0gTUMg
b2JqZWN0IGRldmljZSBvYmplY3QNCiAgKiBAZGV2OiBMaW51eCBkcml2ZXIgbW9kZWwgZGV2aWNl
IG9iamVjdA0KKyAqIEBtYXNrOiBjcHUgbWFzayBmb3IgYWZmaW5pdHlfaGludA0KICAqIEBkbWFf
bWFzazogRGVmYXVsdCBETUEgbWFzaw0KICAqIEBmbGFnczogTUMgb2JqZWN0IGRldmljZSBmbGFn
cw0KICAqIEBpY2lkOiBJc29sYXRpb24gY29udGV4dCBJRCBmb3IgdGhlIGRldmljZQ0KQEAgLTE4
NCw2ICsxODUsNyBAQCBzdHJ1Y3QgZnNsX21jX29ial9kZXNjIHsNCiAgKi8NCiBzdHJ1Y3QgZnNs
X21jX2RldmljZSB7DQogCXN0cnVjdCBkZXZpY2UgZGV2Ow0KKwljcHVtYXNrX3QgbWFzazsNCiAJ
dTY0IGRtYV9tYXNrOw0KIAl1MTYgZmxhZ3M7DQogCXUxNiBpY2lkOw0KLS0gDQoyLjE1LjI=


--=====_003_next=====--

--=====_001_next=====--

