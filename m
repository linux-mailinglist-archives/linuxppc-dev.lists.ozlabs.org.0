Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE826319BA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 07:32:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFyHW162Wz3cMw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 17:32:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gZm8vdMh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gZm8vdMh;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFyGX6lnxz3c7B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 17:31:48 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL51cb9011591;
	Mon, 21 Nov 2022 06:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9GAyWkKzDEndYhiStTUbKVzIJ6UXbLEHzrGCpzwBTpA=;
 b=gZm8vdMh7eTgcYYgQEeWzQT5n+h7N+JwMW/VSh2oyjdDIhpMiQzfJaT46rQznGAU/pBW
 l42aksozWF7HiJ322DAhTLGw9NQ3IHl44oyUHBE+MiAD/lT663b6CFT4zOS/PZ41ceGL
 fBH3WK/m4KIpLTPt88i/Ecf+DGv0byFO6VE+A+9DJDMqRAGTBMgj7Lel9xj2Zj0GxOSt
 9YEMk/7PYUk1W/JzhsfR54/SI2E3rVUITl/njitGwgRpnSl1wgR/xrX3MMJYwmOVbNLz
 OVeg9jztFfzugqN7whBL1ua1fUFAF+PyRjj0dFZqtuROhX1jrAWR1HhLD2M1dcsK+rZD fQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky9798m41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 06:31:35 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AL6LIAX030304;
	Mon, 21 Nov 2022 06:31:33 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma02fra.de.ibm.com with ESMTP id 3kxps8smb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 06:31:33 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AL6VVBB34865632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Nov 2022 06:31:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 471575208D;
	Mon, 21 Nov 2022 06:31:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9C49252071;
	Mon, 21 Nov 2022 06:31:30 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 18BF46032A;
	Mon, 21 Nov 2022 17:31:29 +1100 (AEDT)
Message-ID: <b37b30140cefea48e18a44106f53bb8057dec462.camel@linux.ibm.com>
Subject: Re: [PATCH] ocxl: fix pci device refcount leak when calling
 get_function_0()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Yang Yingliang <yangyingliang@huawei.com>, fbarrat@linux.ibm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Date: Mon, 21 Nov 2022 17:31:28 +1100
In-Reply-To: <20221119144433.2454759-1-yangyingliang@huawei.com>
References: <20221119144433.2454759-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R5tCrashTA3SebOzbm6s8QyfvfuqO4Cf
X-Proofpoint-ORIG-GUID: R5tCrashTA3SebOzbm6s8QyfvfuqO4Cf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210047
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gU2F0LCAyMDIyLTExLTE5IGF0IDIyOjQ0ICswODAwLCBZYW5nIFlpbmdsaWFuZyB3cm90ZToK
PiBBcyBjb21tZW50IG9mIHBjaV9nZXRfZG9tYWluX2J1c19hbmRfc2xvdCgpIHNheXMsIGl0IHJl
dHVybnMKPiBhIHBjaSBkZXZpY2Ugd2l0aCByZWZjb3VudCBpbmNyZW1lbnQsIHNvIHdoZW4gZmlu
aXNoIHVzaW5nIGl0LAo+IHBjaV9kZXZfcHV0KCkgbmVlZHMgYmUgY2FsbGVkLgo+IAo+IEluIGdl
dF9kdnNlY192ZW5kb3IwKCksIGluIG5vcm1hbCBwYXRoLCB0aGUgcmV0dXJuZWQgcGNpIGRldmlj
ZQo+IGlzIHBhc3NlZCB0byBkZXYwLCBzbyBhZnRlciB1c2luZyBkZXYwIGluIHRoZSBjYWxsZXJz
LCBpdCBuZWVkCj4gYmUgcHV0LCBpbiBlcnJvciBwYXRoLCBwY2lfZGV2X3B1dCgpIGFsc28gbmVl
ZHMgYmUgY2FsbGVkLgo+IAo+IHBjaV9nZXRfZG9tYWluX2J1c19hbmRfc2xvdCgpIGlzIGNhbGxl
ZCB3aGVuIFBDSV9GVU5DKCkgcmV0dXJucwo+IG5vbi16ZXJvLCBjaGVjayB0aGlzIGJlZm9yZSBw
dXQuCj4gCj4gRml4ZXM6IDg3ZGI3NTc5ZWJkNSAoIm9jeGw6IGNvbnRyb2wgdmlhIHN5c2ZzIHdo
ZXRoZXIgdGhlIEZQR0EgaXMKPiByZWxvYWRlZCBvbiBhIGxpbmsgcmVzZXQiKQo+IFNpZ25lZC1v
ZmYtYnk6IFlhbmcgWWluZ2xpYW5nIDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+CgpJdCBtaWdo
dCBiZSBuZWF0ZXIgdG8gdGFrZSBhbiBhZGRpdGlvbmFsIHJlZmVyZW5jZSBvbiBkZXYgaW4KZ2V0
X2R2c2VjX3ZlbmRvcjAoKSBpbiB0aGUgY2FzZSB3aGVyZSBkZXYgaXMgZnVuY3Rpb24gMCwgd2hp
Y2ggd291bGQKbWVhbiB5b3UgY291bGQgY2FsbCBwY2lfZGV2X3B1dCgpIHVuY29uZGl0aW9uYWxs
eSBpbiB0aGUgY2FsbGVycz8KCkVpdGhlciB3YXkgLSBJIHRoaW5rIHRoZXJlIG5lZWRzIHRvIGJl
IGEgY29tbWVudCBhYm92ZQpnZXRfZHZzZWNfdmVuZG9yMCgpIGRvY3VtZW50aW5nIHdoZW4gYW4g
YWRkaXRpb25hbCByZWZlcmVuY2UgbmVlZHMgdG8KYmUgcmVsZWFzZWQuCgo+IC0tLQo+IMKgZHJp
dmVycy9taXNjL29jeGwvY29uZmlnLmMgfCAxMSArKysrKysrKysrLQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9taXNjL29jeGwvY29uZmlnLmMgYi9kcml2ZXJzL21pc2Mvb2N4bC9jb25maWcuYwo+IGlu
ZGV4IGU0MDFhNTE1OTZiOS4uNGRhNWEyYjg1MTRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWlz
Yy9vY3hsL2NvbmZpZy5jCj4gKysrIGIvZHJpdmVycy9taXNjL29jeGwvY29uZmlnLmMKPiBAQCAt
MTk2LDE2ICsxOTYsMjEgQEAgc3RhdGljIGludCByZWFkX2R2c2VjX3ZlbmRvcihzdHJ1Y3QgcGNp
X2Rldgo+ICpkZXYpCj4gwqBzdGF0aWMgaW50IGdldF9kdnNlY192ZW5kb3IwKHN0cnVjdCBwY2lf
ZGV2ICpkZXYsIHN0cnVjdCBwY2lfZGV2Cj4gKipkZXYwLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCAqb3V0X3BvcykKPiDCoHsK
PiArwqDCoMKgwqDCoMKgwqBib29sIG5lZWRfcHV0Owo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgcG9z
Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChQQ0lfRlVOQyhkZXYtPmRldmZuKSAhPSAwKSB7
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXYgPSBnZXRfZnVuY3Rpb25fMChk
ZXYpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFkZXYpCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC0xOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBuZWVkX3B1dCA9IHRydWU7Cj4gwqDCoMKgwqDC
oMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgcG9zID0gZmluZF9kdnNlYyhkZXYsIE9DWExfRFZT
RUNfVkVORE9SX0lEKTsKPiAtwqDCoMKgwqDCoMKgwqBpZiAoIXBvcykKPiArwqDCoMKgwqDCoMKg
wqBpZiAoIXBvcykgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAobmVlZF9w
dXQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwY2lf
ZGV2X3B1dChkZXYpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC0x
Owo+ICvCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgKmRldjAgPSBkZXY7Cj4gwqDC
oMKgwqDCoMKgwqDCoCpvdXRfcG9zID0gcG9zOwo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsK
PiBAQCAtMjIyLDYgKzIyNyw4IEBAIGludCBvY3hsX2NvbmZpZ19nZXRfcmVzZXRfcmVsb2FkKHN0
cnVjdCBwY2lfZGV2Cj4gKmRldiwgaW50ICp2YWwpCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcGNp
X3JlYWRfY29uZmlnX2R3b3JkKGRldjAsIHBvcyArCj4gT0NYTF9EVlNFQ19WRU5ET1JfUkVTRVRf
UkVMT0FELAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJnJlc2V0X3JlbG9hZCk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKFBDSV9GVU5D
KGRldi0+ZGV2Zm4pICE9IDApCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBjaV9k
ZXZfcHV0KGRldjApOwo+IMKgwqDCoMKgwqDCoMKgwqAqdmFsID0gISEocmVzZXRfcmVsb2FkICYg
QklUKDApKTsKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqB9Cj4gQEAgLTI0Myw2ICsy
NTAsOCBAQCBpbnQgb2N4bF9jb25maWdfc2V0X3Jlc2V0X3JlbG9hZChzdHJ1Y3QgcGNpX2Rldgo+
ICpkZXYsIGludCB2YWwpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXNldF9y
ZWxvYWQgJj0gfkJJVCgwKTsKPiDCoMKgwqDCoMKgwqDCoMKgcGNpX3dyaXRlX2NvbmZpZ19kd29y
ZChkZXYwLCBwb3MgKwo+IE9DWExfRFZTRUNfVkVORE9SX1JFU0VUX1JFTE9BRCwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVz
ZXRfcmVsb2FkKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoUENJX0ZVTkMoZGV2LT5kZXZmbikgIT0g
MCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGNpX2Rldl9wdXQoZGV2MCk7Cj4g
wqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IMKgfQo+IMKgCgotLSAKQW5kcmV3IERvbm5lbGxh
biAgICBPekxhYnMsIEFETCBDYW5iZXJyYQphamRAbGludXguaWJtLmNvbSAgIElCTSBBdXN0cmFs
aWEgTGltaXRlZAo=

