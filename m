Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 692E32932F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 04:15:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFcdz32nnzDqWT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 13:15:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zte.com.cn (client-ip=63.217.80.70; helo=mxhk.zte.com.cn;
 envelope-from=wang.yi59@zte.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=zte.com.cn
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFccJ5LTFzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 13:13:23 +1100 (AEDT)
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id A3E73973B30690451C97;
 Tue, 20 Oct 2020 10:13:03 +0800 (CST)
Received: from kjyxapp01.zte.com.cn ([10.30.12.200])
 by mse-fl2.zte.com.cn with SMTP id 09K2D2x6088964;
 Tue, 20 Oct 2020 10:13:02 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain (unknown [10.234.72.110])
 by smtp (Zmail) with SMTP; Tue, 20 Oct 2020 10:13:02 +0800
X-Zmail-TransId: 3e885f8e47ad000-a1f05
From: Yi Wang <wang.yi59@zte.com.cn>
To: Roy.Pledge@nxp.com, leoyang.li@nxp.com
Subject: [PATCH v3] soc: fsl: dpio: Get the cpumask through cpumask_of(cpu)
Date: Tue, 20 Oct 2020 10:18:32 +0800
Message-Id: <20201020021832.36846-1-wang.yi59@zte.com.cn>
X-Mailer: X-Zmail-Txt
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse-fl2.zte.com.cn 09K2D2x6088964
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
 linux-kernel@vger.kernel.org, Lin Chen <chen.lin5@zte.com.cn>,
 xue.zhihong@zte.com.cn, linuxppc-dev@lists.ozlabs.org,
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
bmNpbmc6IEZhdGFsIGV4Y2VwdGlvbiBdLS0tDQoNCkZpeCBpdCBieSB1c2luZyAnY3B1bWFza19v
ZihjcHUpJyB0byBnZXQgdGhlIGNwdW1hc2suDQoNClNpZ25lZC1vZmYtYnk6IEhhbyBTaSA8c2ku
aGFvQHp0ZS5jb20uY24+DQpTaWduZWQtb2ZmLWJ5OiBMaW4gQ2hlbiA8Y2hlbi5saW41QHp0ZS5j
b20uY24+DQpTaWduZWQtb2ZmLWJ5OiBZaSBXYW5nIDx3YW5nLnlpNTlAenRlLmNvbS5jbj4NCi0t
LQ0KdjM6IFVzZSBjcHVtYXNrX29mKGNwdSkgdG8gZ2V0IHRoZSBwcmUtZGVmaW5lZCBjcHVtYXNr
IGluIHRoZSBzdGF0aWMgDQpjcHVfYml0X2JpdG1hcCBhcnJheS4NCnYyOiBQbGFjZSAnY3B1bWFz
a190IG1hc2snIGluIHRoZSBkcml2ZXIncyBwcml2YXRlIGRhdGEgYW5kIHdoaWxlIGF0IGl0LCAN
CnJlbmFtZSBpdCB0byBjcHVfbWFzay4NCg0KIGRyaXZlcnMvc29jL2ZzbC9kcGlvL2RwaW8tZHJp
dmVyLmMgfCA1ICstLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL2RwaW8vZHBpby1kcml2ZXIu
YyBiL2RyaXZlcnMvc29jL2ZzbC9kcGlvL2RwaW8tZHJpdmVyLmMNCmluZGV4IDdiNjQyYzMuLjdm
Mzk3YjQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NvYy9mc2wvZHBpby9kcGlvLWRyaXZlci5jDQor
KysgYi9kcml2ZXJzL3NvYy9mc2wvZHBpby9kcGlvLWRyaXZlci5jDQpAQCAtOTUsNyArOTUsNiBA
QCBzdGF0aWMgaW50IHJlZ2lzdGVyX2RwaW9faXJxX2hhbmRsZXJzKHN0cnVjdCBmc2xfbWNfZGV2
aWNlICpkcGlvX2RldiwgaW50IGNwdSkNCiB7DQogCWludCBlcnJvcjsNCiAJc3RydWN0IGZzbF9t
Y19kZXZpY2VfaXJxICppcnE7DQotCWNwdW1hc2tfdCBtYXNrOw0KIA0KIAlpcnEgPSBkcGlvX2Rl
di0+aXJxc1swXTsNCiAJZXJyb3IgPSBkZXZtX3JlcXVlc3RfaXJxKCZkcGlvX2Rldi0+ZGV2LA0K
QEAgLTExMiw5ICsxMTEsNyBAQCBzdGF0aWMgaW50IHJlZ2lzdGVyX2RwaW9faXJxX2hhbmRsZXJz
KHN0cnVjdCBmc2xfbWNfZGV2aWNlICpkcGlvX2RldiwgaW50IGNwdSkNCiAJfQ0KIA0KIAkvKiBz
ZXQgdGhlIGFmZmluaXR5IGhpbnQgKi8NCi0JY3B1bWFza19jbGVhcigmbWFzayk7DQotCWNwdW1h
c2tfc2V0X2NwdShjcHUsICZtYXNrKTsNCi0JaWYgKGlycV9zZXRfYWZmaW5pdHlfaGludChpcnEt
Pm1zaV9kZXNjLT5pcnEsICZtYXNrKSkNCisJaWYgKGlycV9zZXRfYWZmaW5pdHlfaGludChpcnEt
Pm1zaV9kZXNjLT5pcnEsIGNwdW1hc2tfb2YoY3B1KSkpDQogCQlkZXZfZXJyKCZkcGlvX2Rldi0+
ZGV2LA0KIAkJCSJpcnFfc2V0X2FmZmluaXR5IGZhaWxlZCBpcnEgJWQgY3B1ICVkXG4iLA0KIAkJ
CWlycS0+bXNpX2Rlc2MtPmlycSwgY3B1KTsNCi0tIA0KMi4xNS4y


--=====_003_next=====--

--=====_001_next=====--

