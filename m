Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0180D60C185
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 04:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxFnY5hHSz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 13:12:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=my+9s8y3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=my+9s8y3;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxFmX5Knvz2xZ7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 13:11:24 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P1DvqX000308;
	Tue, 25 Oct 2022 02:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=JjJEVuweh81pDXpK7bcTlFkaMbyxWMdQep3Gjapd1+Q=;
 b=my+9s8y3Ob4BMaLwCzByAgR4xeoMdzBbZYC4HT34HjbQTDcyGYnNttSjcdvQ69FiMAoM
 8l9HJ5NEdjEeXO2IPdyi1dS1GKh9QUsAi47kCvxhqawo/rXgc/MzaHnj4wfzx7+ZnvJC
 E1fzo5tAfPrRu1+1h4DhE5OxVfILQ362g40yKX8NeDUUWs5pBNpxwamJKYuexp7SnyzP
 uOUqbNYWh3Ocoy2GZiQMISoquJYZ9c+6K23oka2Qf+pnJTaiShWIDOzTE7yzTpKihSsR
 2oKkqTHyqQRg3iw3uXj03TC2cI3VTX4t8TI3l45bSQpF/eBwJEUH77EPsQ2hZQI7pK9j WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke5xthdem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 02:11:03 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29P1vJau017186;
	Tue, 25 Oct 2022 02:11:03 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke5xthdca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 02:11:03 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29P26oN6001374;
	Tue, 25 Oct 2022 02:11:00 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3kdugartwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 02:11:00 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29P25kDi42139944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 02:05:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7435911C05B;
	Tue, 25 Oct 2022 02:10:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C911511C050;
	Tue, 25 Oct 2022 02:10:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 25 Oct 2022 02:10:57 +0000 (GMT)
Received: from [9.43.182.119] (unknown [9.43.182.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4050D607D0;
	Tue, 25 Oct 2022 13:10:47 +1100 (AEDT)
Message-ID: <05571d7c9bc1f8287cfd44ed519ba668d1cfdb86.camel@linux.ibm.com>
Subject: Re: [PATCH v4 2/6] powerpc/module: Handle caller-saved TOC in
 module linker
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 25 Oct 2022 13:10:26 +1100
In-Reply-To: <20221010002957.128276-3-bgray@linux.ibm.com>
References: <20221010002957.128276-1-bgray@linux.ibm.com>
	 <20221010002957.128276-3-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qv6GM0twPHHmN_WKJM904AtLyMusMdJC
X-Proofpoint-ORIG-GUID: hpy3uc4vV4-ZDmN61s8TUKUEzdOpmbO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_09,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1011 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210250010
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
Cc: peterz@infradead.org, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIyLTEwLTEwIGF0IDExOjI5ICsxMTAwLCBCZW5qYW1pbiBHcmF5IHdyb3RlOgo+
ID4gQSBmdW5jdGlvbiBzeW1ib2wgbWF5IHNldCBhIHZhbHVlIGluIHRoZSBzdF9vdGhlciBmaWVs
ZCB0byBpbmRpY2F0ZQo+ID4gdGhlIFRPQyBzaG91bGQgYmUgdHJlYXRlZCBhcyBjYWxsZXItc2F2
ZWQuIFRoZSBsaW5rZXIgc2hvdWxkCj4gPiBlbnN1cmU+IHRoZQo+ID4gY3VycmVudCBUT0MgaXMg
c2F2ZWQgYmVmb3JlIGNhbGxpbmcgaXQgYW5kIHJlc3RvcmUgdGhlIFRPQz4KPiA+IGFmdGVyd2Fy
ZHMsCj4gPiBtdWNoIGxpa2UgZXh0ZXJuYWwgY2FsbHMuCgpBcyBJIHN1Z2dlc3RlZCBvbiB0aGUg
bGFzdCByZXZpc2lvbiwgd29ydGggbWVudGlvbmluZyBoZXJlIHRoYXQgaXQncwp0aGUgJy5sb2Nh
bGVudHJ5IDxOQU1FPiwgMScgZGlyZWN0aXZlIHdlJ3JlIHRhbGtpbmcgYWJvdXQgaGVyZS4KCj4g
PiAKPiA+IFRoaXMgaXMgbmVjZXNzYXJ5IGZvciBzdXBwb3J0aW5nIFYyIEFCSSBzdGF0aWMgY2Fs
bHMgdGhhdCBkbyBub3QKPiA+IHByZXNlcnZlIHRoZSBUT0MuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IEJlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+Cj4gPiAtLS0KPiA+IMKgYXJj
aC9wb3dlcnBjL2tlcm5lbC9tb2R1bGVfNjQuYyB8IDE0ICsrKysrKysrKysrKystCj4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZV82NC5jPgo+ID4gYi9hcmNoL3Bv
d2VycGMva2VybmVsL21vZHVsZV82NC5jCj4gPiBpbmRleCA3ZTQ1ZGM5OGRmOGEuLjgzYTZmNmUy
MmUzYiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlXzY0LmMKPiA+
ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlXzY0LmMKPiA+IEBAIC01NSw2ICs1NSwx
MiBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGxvY2FsX2VudHJ5X29mZnNldChjb25zdD4KPiA+IEVs
ZjY0X1N5bSAqc3ltKQo+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIG9mIGZ1bmN0aW9uIGFuZCB0cnkg
dG8gZGVyaXZlIHIyIGZyb20gaXQpLiAqLwo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBQUEM2
NF9MT0NBTF9FTlRSWV9PRkZTRVQoc3ltLT5zdF9vdGhlcik7Cj4gPiDCoH0KPiA+ICsKPiA+ICtz
dGF0aWMgYm9vbCBuZWVkX3Iyc2F2ZV9zdHViKHVuc2lnbmVkIGNoYXIgc3Rfb3RoZXIpCj4gPiAr
ewo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIChzdF9vdGhlciAmIFNUT19QUEM2NF9MT0NBTF9N
QVNLKSA9PSAoMSA8PD4KPiA+IFNUT19QUEM2NF9MT0NBTF9CSVQpOwo+ID4gK30KPiA+ICsKPiA+
IMKgI2Vsc2UKPiA+IMKgCj4gPiDCoHN0YXRpYyBmdW5jX2Rlc2NfdCBmdW5jX2Rlc2ModW5zaWdu
ZWQgbG9uZyBhZGRyKQo+ID4gQEAgLTY2LDYgKzcyLDExIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQg
bG9jYWxfZW50cnlfb2Zmc2V0KGNvbnN0Pgo+ID4gRWxmNjRfU3ltICpzeW0pCj4gPiDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiDCoH0KPiA+IMKgCj4gPiArc3RhdGljIGJvb2wgbmVlZF9y
MnNhdmVfc3R1Yih1bnNpZ25lZCBjaGFyIHN0X290aGVyKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKg
wqDCoHJldHVybiBmYWxzZTsKPiA+ICt9Cj4gPiArCj4gPiDCoHZvaWQgKmRlcmVmZXJlbmNlX21v
ZHVsZV9mdW5jdGlvbl9kZXNjcmlwdG9yKHN0cnVjdCBtb2R1bGUgKm1vZCw+Cj4gPiB2b2lkICpw
dHIpCj4gPiDCoHsKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAocHRyIDwgKHZvaWQgKiltb2QtPmFy
Y2guc3RhcnRfb3BkIHx8Cj4gPiBAQCAtNjMyLDcgKzY0Myw4IEBAIGludCBhcHBseV9yZWxvY2F0
ZV9hZGQoRWxmNjRfU2hkciAqc2VjaGRycywKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgY2FzZSBSX1BQQ19SRUwyNDoKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoC8qIEZJWE1FOiBIYW5kbGUgd2VhayBzeW1ib2xzIGhlcmUgLS1S
UiAqLwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWYgKHN5bS0+c3Rfc2huZHggPT0gU0hOX1VOREVGIHx8Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzeW0tPnN0X3NobmR4ID09IFNITl9M
SVZFUEFUQ0gpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN5bS0+c3Rfc2huZHggPT0gU0hOX0xJVkVQQVRDSCB8fAo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmVlZF9yMnNh
dmVfc3R1YihzeW0tPnN0X290aGVyKSkgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIEV4dGVybmFsOiBnbyB2aWEg
c3R1YiAqLwoKUGVyaGFwcyB0aGlzIGNvbW1lbnQgc2hvdWxkIGJlIHVwZGF0ZWQgdG8gbWVudGlv
biB0aGF0IHRoZXJlIGFyZSBub24tCmV4dGVybmFsIGJ1dCBleHRlcm5hbC1saWtlIGNhbGxzPwoK
T3RoZXJ3aXNlCgpSZXZpZXdlZC1ieTogQW5kcmV3IERvbm5lbGxhbiA8YWpkQGxpbnV4LmlibS5j
b20+Cgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHZhbHVlID0gc3R1Yl9mb3JfYWRkcihzZWNoZHJzLAo+ID4gdmFsdWUs
PiBtZSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnRhYiAr
PiBzeW0tCj4gPiA+c3RfbmFtZSk7CgotLSAKQW5kcmV3IERvbm5lbGxhbiAgICBPekxhYnMsIEFE
TCBDYW5iZXJyYQphamRAbGludXguaWJtLmNvbSAgIElCTSBBdXN0cmFsaWEgTGltaXRlZAo=

