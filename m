Return-Path: <linuxppc-dev+bounces-3932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CF9EBBC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 22:21:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7BWF297yz2yD4;
	Wed, 11 Dec 2024 08:21:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.152.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733865283;
	cv=none; b=PmWqJrdpIHBxt5M8DH5vEqC8xlY8NA85gy//WwetpMB3UoHiz6g/C4mgEnsXJFTJztGzilMVGSvhXmQn7otyL7Znl+1AwOm5ZHdIVSlslBq8PgYOtRXW9nZd8y/kxrCObqoRXkGtI00A8ACCYB+zMR4XQpQQ5R2KvqLNnErrzwpItY1Wqs7T3amYJp0Gf/Vbutq5ChfvY7OdhA2OQaM4Sk1mzJgli0l6WvCAvkd0a0ta2+e9aL5Q0xpK3Jt0Cj0fTG/CswfVLayzFFXAJnHgF3EQcR/fWqrbc5yRHzpJp7juuLONY2zKyIz/XS8C81WnLkx4Ech9J16MKokrzfRirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733865283; c=relaxed/relaxed;
	bh=uWWb82MfPtRjjHyxXIswpvSWMmUlqgSV9x5gdwMFw2Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L6FixYmjUzE2eBAU2bWH0DJau9O+wZ/tkzD3Ss1LpvZjjAQCMrzIoyXoTNc910G/Hur12xeElqxp2m3tAvX5GFAZQVM1jWaEc0dpc6yISpHuVgzQEZvyIcPVFNqSPNapWQs8l3zYV3DGVcORpWlMms8tQiUoO4u16uV1i7bVOg8mg5pp/CXfqr1ZBBdp51E2+mG03NPXrVhBwKwMgDxmHVkACUgDbgYnhJNzFzn9CZLT08RpQE+N6Jl//Ix6PLSDd08CQ9cHkVlWNhmUkX6YPre2Kwoq50JwvOryUiJakn7+zCfXJPpyj3qEVhTbhCY5+xeHvJv87UhoCgK8VNj2MQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com; dkim=pass (2048-bit key; secure) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=KcwrhxSb; dkim-atps=neutral; spf=pass (client-ip=148.163.152.16; helo=mx0b-00206402.pphosted.com; envelope-from=prvs=40744c3adf=martin.kelly@crowdstrike.com; receiver=lists.ozlabs.org) smtp.mailfrom=crowdstrike.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=KcwrhxSb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=crowdstrike.com (client-ip=148.163.152.16; helo=mx0b-00206402.pphosted.com; envelope-from=prvs=40744c3adf=martin.kelly@crowdstrike.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1418 seconds by postgrey-1.37 at boromir; Wed, 11 Dec 2024 08:14:42 AEDT
Received: from mx0b-00206402.pphosted.com (mx0b-00206402.pphosted.com [148.163.152.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7BM61hMtz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 08:14:40 +1100 (AEDT)
Received: from pps.filterd (m0354655.ppops.net [127.0.0.1])
	by mx0b-00206402.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAJn2AF006248;
	Tue, 10 Dec 2024 20:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=default; bh=uWWb82MfPtRjjHyxXIswpvSWMmUlqgSV9x5gdwMFw2Y=; b=K
	cwrhxSbtEYBRvzsvsdx1itGQHsRJHy9PNRLA66zz6oyTYnQVI4c1q6FUCu9xMPRJ
	x0sAFGTiqVpRUS1SpETm2fRLQ/m1uglh5GD2r43bUKz3rGW28EvMRm8p4o+NC4tC
	h4lDRk+xz2rzDJfXliu7ZUCvW43PKN/YME0gxCX6zj+RcR7aLx7D6DWBN6w0Mz2l
	uzjY4YVow0UhdvthHLIJkmc2TrD2MFIV4qkETzPE1q8RletPrvfLIQhEt/EyicLy
	wW1C8eXBIGk7cxfwmGw6tyrSUH2ku/gOHcA1gY2p9uFvB/ssGOW+VTovtgSmKYTf
	erSvpHH7AVT+6jFL/bhFQ==
Received: from mail.crowdstrike.com (dragosx.crowdstrike.com [208.42.231.60] (may be forged))
	by mx0b-00206402.pphosted.com (PPS) with ESMTPS id 43enarhfqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 20:49:53 +0000 (GMT)
Received: from 04WPEXCH006.crowdstrike.sys (10.100.11.70) by
 04wpexch08.crowdstrike.sys (10.100.11.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 20:49:52 +0000
Received: from 04wpexch06.crowdstrike.sys (10.100.11.99) by
 04WPEXCH006.crowdstrike.sys (10.100.11.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 12:49:51 -0800
Received: from 04wpexch06.crowdstrike.sys ([fe80::9386:41e4:ec25:9fd5]) by
 04wpexch06.crowdstrike.sys ([fe80::9386:41e4:ec25:9fd5%9]) with mapi id
 15.02.1544.009; Tue, 10 Dec 2024 20:49:51 +0000
From: Martin Kelly <martin.kelly@crowdstrike.com>
To: "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "ojeda@kernel.org"
	<ojeda@kernel.org>,
        "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
        "pasha.tatashin@soleen.com" <pasha.tatashin@soleen.com>,
        "mhiramat@kernel.org" <mhiramat@kernel.org>,
        "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>,
        "james.clark@arm.com" <james.clark@arm.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "nathan@kernel.org"
	<nathan@kernel.org>,
        "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "nicolas@fjasle.eu" <nicolas@fjasle.eu>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "hpa@zytor.com"
	<hpa@zytor.com>,
        "surenb@google.com" <surenb@google.com>,
        "zhengyejian@huaweicloud.com" <zhengyejian@huaweicloud.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "naveen.n.rao@linux.ibm.com"
	<naveen.n.rao@linux.ibm.com>,
        "kent.overstreet@linux.dev"
	<kent.overstreet@linux.dev>,
        "bp@alien8.de" <bp@alien8.de>, "mcgrof@kernel.org" <mcgrof@kernel.org>
CC: Amit Dang <amit.dang@crowdstrike.com>,
        "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: Re: [PATCH v2 0/5] kallsyms: Emit symbol for holes in text and
 fix weak function issue
Thread-Topic: Re: [PATCH v2 0/5] kallsyms: Emit symbol for holes in text and
 fix weak function issue
Thread-Index: AQHbS0UOy5EKb9eED0ygRLeYfQd4Mg==
Date: Tue, 10 Dec 2024 20:49:51 +0000
Message-ID: <d25741d8a6f88d5a6c219fb53e8aa0bcc1fea982.camel@crowdstrike.com>
References: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
	 <44353f4cd4d1cc7170d006031819550b37039dd2.camel@crowdstrike.com>
	 <364aaf7c-cdc4-4e57-bb4c-f62e57c23279@csgroup.eu>
In-Reply-To: <364aaf7c-cdc4-4e57-bb4c-f62e57c23279@csgroup.eu>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.100.11.122]
x-disclaimer: USA
Content-Type: text/plain; charset="utf-8"
Content-ID: <B02A2CB1C4F11649B171690F94820629@crowdstrike.sys>
Content-Transfer-Encoding: base64
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
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: PMYGstxHIcTVLjDkxVGTLGYbNtmnvdZh
X-Authority-Analysis: v=2.4 cv=d6sPyQjE c=1 sm=1 tr=0 ts=6758a971 cx=c_pps a=1d8vc5iZWYKGYgMGCdbIRA==:117 a=1d8vc5iZWYKGYgMGCdbIRA==:17 a=xqWC_Br6kY4A:10 a=EjBHVkixTFsA:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=VwQbUJbxAAAA:8 a=AiHppB-aAAAA:8
 a=PLFCH0Z3ytBysqgyJFcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: PMYGstxHIcTVLjDkxVGTLGYbNtmnvdZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=831
 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100150
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

T24gVHVlLCAyMDI0LTEyLTEwIGF0IDIxOjAxICswMTAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiA+IA0KPiA+IEhpIGFsbCwgd2hhdCBpcyB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2ggc2Vy
aWVzPyBJJ2QgcmVhbGx5IGxpa2UgdG8NCj4gPiBzZWUNCj4gPiBpdCBvciBzb21lIG90aGVyIGZp
eCB0byB0aGlzIGlzc3VlIG1lcmdlZC4gVGhlIHVuZGVybHlpbmcgYnVnIGlzIGENCj4gPiBzaWdu
aWZpY2FudCBvbmUgdGhhdCBjYW4gY2F1c2UgZnRyYWNlL2xpdmVwYXRjaC9CUEYgZmVudHJ5IHRv
IGZhaWwNCj4gPiBzaWxlbnRseS4gSSd2ZSBub3RpY2VkIHRoaXMgYnVnIGluIGFub3RoZXIgY29u
dGV4dFsxXSBhbmQgcmVhbGl6ZWQNCj4gPiB0aGV5J3JlIHRoZSBzYW1lIGlzc3VlLg0KPiA+IA0K
PiA+IEknbSBoYXBweSB0byBoZWxwIHdpdGggdGhpcyBwYXRjaCBzZXJpZXMgdG8gYWRkcmVzcyBh
bnkgaXNzdWVzIGFzDQo+ID4gbmVlZGVkLg0KPiANCj4gQXMgZmFyIGFzIEkgY2FuIHNlZSB0aGVy
ZSBhcmUgcHJvYmxlbXMgb24gYnVpbGQgd2l0aCBwYXRjaCAxLCBzZWUgDQo+IGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tb2R1bGVzL3BhdGNoLzIwMjQwNzIzMDYz
MjU4LjIyNDA2MTAtMi16aGVuZ3llamlhbkBodWF3ZWljbG91ZC5jb20vDQo+IMKgDQo+IA0KPiAN
Cg0KWWVhaCwgSSBzZWUgdGhvc2UuIEFkZGl0aW9uYWxseSwgdGhpcyBwYXRjaCBubyBsb25nZXIg
YXBwbGllcyBjbGVhbmx5DQp0byBjdXJyZW50IG1hc3RlciwgdGhvdWdoIGZpeGluZyBpdCB1cCB0
byBkbyBzbyBpcyBwcmV0dHkgZWFzeS4gSGF2aW5nDQpkb25lIHRoYXQsIHRoaXMgc2VyaWVzIGFw
cGVhcnMgdG8gcmVzb2x2ZSB0aGUgaXNzdWVzIEkgc2F3IGluIHRoZSBvdGhlcg0KbGlua2VkIHRo
cmVhZC4NCg0KWmhlbmcsIGRvIHlvdSBwbGFuIHRvIHNlbmQgYSB2Mz8gSSdkIGJlIGhhcHB5IHRv
IGhlbHAgb3V0IHdpdGggdGhpcw0KcGF0Y2ggc2VyaWVzIGlmIHlvdSdkIGxpa2UsIGFzIEknbSBo
b3BpbmcgdG8gZ2V0IHRoaXMgaXNzdWUgcmVzb2x2ZWQNCih0aG91Z2ggSSBhbSBub3QgYW4gZnRy
YWNlIGV4cGVydCkuDQo=

