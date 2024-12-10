Return-Path: <linuxppc-dev+bounces-3930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F03609EBB3C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 21:55:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y79x95K3pz3020;
	Wed, 11 Dec 2024 07:55:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.148.77
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733858987;
	cv=none; b=eFUg8dGXclNskM6Q2BopXN2jPMafgLklBM4nmWE0R3HU0W0IfQAgUfDHfMO62ZeojJ71M4UAKhXSaPmwgRGF177fkAgS+SYnwpQxJPcEEZR85LBWxmJ9Z/6ZebSLynZVn0YTv2Czuk2A7AZZlUntvnZC9XlcqNgruUu1GdYduI9HroEAym+TYmYHrwjyeFqBsy5mmNyizzqD8Fg7QbI9SXBmE15oDIGLVRrgSnHt7etxHvUxbsn4yJ1KpaFKdSp8RyNX2fY21xYwXBTGXk8n6vKIxWYHtNjKKYsdX6UIS4xCL+1t868Ad1NuVJYucFScidMt+pommBJ8488msrqPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733858987; c=relaxed/relaxed;
	bh=B1adUjR1VE80f1PTstNu785YA4jDE4rVDXmLSCYT2aI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mgJPIV/f3ouPsUlo4txgIMlAfjKSX6NCBiK0CwaMoTLKY0m31x/NMQHqAIKxt+7ULf3peOhAdARgKFC4KTDm7DCIWz674z0vHll86wbyNoL3a5qTtbhgDQVHZqmZk/s5IN4EJTmwvBbdIyuygmiyVnvok4/cuszYV6lAewVELBPkY5LeqtFvfe9LL2+GlUh+MXxr0aLVm/Yp8y0XcPZK0cLSHipznuAx1xhBodj/aqf+F4agGBhr7M5duFNH2MRti/xcKzHad0WzpQ8HSLkDW0fTUUKTXRf4dAF0TCku3Opw0Hw4TVSdHR9Zky5M6VeRmLaP/DzZIJAn/aYkZ3vEVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com; dkim=pass (2048-bit key; secure) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=Q5WLWETe; dkim-atps=neutral; spf=pass (client-ip=148.163.148.77; helo=mx0a-00206402.pphosted.com; envelope-from=prvs=40744c3adf=martin.kelly@crowdstrike.com; receiver=lists.ozlabs.org) smtp.mailfrom=crowdstrike.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=crowdstrike.com header.i=@crowdstrike.com header.a=rsa-sha256 header.s=default header.b=Q5WLWETe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=crowdstrike.com (client-ip=148.163.148.77; helo=mx0a-00206402.pphosted.com; envelope-from=prvs=40744c3adf=martin.kelly@crowdstrike.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 742 seconds by postgrey-1.37 at boromir; Wed, 11 Dec 2024 06:29:46 AEDT
Received: from mx0a-00206402.pphosted.com (mx0a-00206402.pphosted.com [148.163.148.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y78220GN3z2yft
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 06:29:45 +1100 (AEDT)
Received: from pps.filterd (m0354652.ppops.net [127.0.0.1])
	by mx0a-00206402.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAGAf2t018432;
	Tue, 10 Dec 2024 19:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=default; bh=B1adUjR1VE80f1PTstNu785YA4jDE4rVDXmLSCYT2aI=; b=Q
	5WLWETej/0uKO6cQ1WldX4CJ3IaLH90EjGr1lkk0cGOEJj9n5PVIBgjR9chPXsbh
	WXfczIGo4DVHR8tSYL60ElqL20UzdQeCSsvKfZtraVBvxMfQNWA7GJ/+SG0UnDNz
	aKyYPDoWR4XmnBmuqNDUlpXmXzhsu7tfSKi8/HI7jvRVcAEOEgNbqvgw9dFh+4zI
	mwo5kSulGhKEyf1/Qm32CpBkx88bzZXpktbqg7i1aCI4I3PP2pU9IC1qmoqodYQA
	abjRiSXTTPxt3IO7dNESBuZUu7pikklfjV20zIHwzNeudEq0BlTJggjPmdZvr173
	tg/P8MaftEbtGDXHPrYtg==
Received: from mail.crowdstrike.com (dragosx.crowdstrike.com [208.42.231.60] (may be forged))
	by mx0a-00206402.pphosted.com (PPS) with ESMTPS id 43erxfgjqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 19:15:15 +0000 (GMT)
Received: from 04wpexch06.crowdstrike.sys (10.100.11.99) by
 04wpexch05.crowdstrike.sys (10.100.11.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 19:15:13 +0000
Received: from 04wpexch06.crowdstrike.sys ([fe80::9386:41e4:ec25:9fd5]) by
 04wpexch06.crowdstrike.sys ([fe80::9386:41e4:ec25:9fd5%9]) with mapi id
 15.02.1544.009; Tue, 10 Dec 2024 19:15:13 +0000
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
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "nathan@kernel.org"
	<nathan@kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
        "nicolas@fjasle.eu" <nicolas@fjasle.eu>,
        "surenb@google.com"
	<surenb@google.com>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "hpa@zytor.com"
	<hpa@zytor.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "zhengyejian@huaweicloud.com" <zhengyejian@huaweicloud.com>,
        "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
        "bp@alien8.de"
	<bp@alien8.de>,
        "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
        "mcgrof@kernel.org" <mcgrof@kernel.org>
CC: Amit Dang <amit.dang@crowdstrike.com>,
        "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
        "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] kallsyms: Emit symbol for holes in text and fix
 weak function issue
Thread-Topic: [PATCH v2 0/5] kallsyms: Emit symbol for holes in text and fix
 weak function issue
Thread-Index: AQHbSzfWIbF4ko3yU0yIDGnRxekZ5w==
Date: Tue, 10 Dec 2024 19:15:13 +0000
Message-ID: <44353f4cd4d1cc7170d006031819550b37039dd2.camel@crowdstrike.com>
References: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
In-Reply-To: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.100.11.122]
x-disclaimer: USA
Content-Type: text/plain; charset="utf-8"
Content-ID: <894EEA24DDE3DA4C924E664F311AA9D3@crowdstrike.sys>
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
X-Authority-Analysis: v=2.4 cv=Td5stQQh c=1 sm=1 tr=0 ts=67589343 cx=c_pps a=1d8vc5iZWYKGYgMGCdbIRA==:117 a=1d8vc5iZWYKGYgMGCdbIRA==:17 a=xqWC_Br6kY4A:10 a=EjBHVkixTFsA:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8
 a=pl6vuDidAAAA:8 a=eHuGQ7gFT_7OOu_YEIIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: mM4J9j6hWFAPRFjVNI4NhQBKWaTtiq1Z
X-Proofpoint-GUID: mM4J9j6hWFAPRFjVNI4NhQBKWaTtiq1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=658
 adultscore=0 clxscore=1011 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412100140
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

T24gVHVlLCAyMDI0LTA3LTIzIGF0IDE0OjMyICswODAwLCBaaGVuZyBZZWppYW4gd3JvdGU6DQo+
IEJhY2tncm91bmQgb2YgdGhpcyBwYXRjaCBzZXQgY2FuIGJlIGZvdW5kIGluIHYxOg0KPiANCj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNjEzMTMzNzExLjI4Njc3NDUtMS16aGVu
Z3llamlhbjFAaHVhd2VpLmNvbS8NCj4gwqANCj4gDQo+IEhlcmUgYWRkIGEgcmVwcm9kdWN0aW9u
IHRvIHNob3cgdGhlIGltcGFjdCB0byBsaXZlcGF0Y2g6DQo+IDEuIEFkZCBmb2xsb3dpbmcgaGFj
ayB0byBtYWtlIGxpdmVwYXRjaC1zYW1wbGUua28gZG8gcGF0Y2ggb24NCj4gZG9fb25lX2luaXRj
YWxsKCkNCj4gwqDCoCB3aGljaCBoYXMgYW4gb3ZlcnJpZGVuIHdlYWsgZnVuY3Rpb24gYmVoaW5k
IGluIHZtbGludXgsIHRoZW4gcHJpbnQNCj4gdGhlDQo+IMKgwqAgYWN0dWFsbHkgdXNlZCBfX2Zl
bnRyeV9fIGxvY2F0aW9uOg0KPiANCg0KSGkgYWxsLCB3aGF0IGlzIHRoZSBzdGF0dXMgb2YgdGhp
cyBwYXRjaCBzZXJpZXM/IEknZCByZWFsbHkgbGlrZSB0byBzZWUNCml0IG9yIHNvbWUgb3RoZXIg
Zml4IHRvIHRoaXMgaXNzdWUgbWVyZ2VkLiBUaGUgdW5kZXJseWluZyBidWcgaXMgYQ0Kc2lnbmlm
aWNhbnQgb25lIHRoYXQgY2FuIGNhdXNlIGZ0cmFjZS9saXZlcGF0Y2gvQlBGIGZlbnRyeSB0byBm
YWlsDQpzaWxlbnRseS4gSSd2ZSBub3RpY2VkIHRoaXMgYnVnIGluIGFub3RoZXIgY29udGV4dFsx
XSBhbmQgcmVhbGl6ZWQNCnRoZXkncmUgdGhlIHNhbWUgaXNzdWUuDQoNCkknbSBoYXBweSB0byBo
ZWxwIHdpdGggdGhpcyBwYXRjaCBzZXJpZXMgdG8gYWRkcmVzcyBhbnkgaXNzdWVzIGFzDQpuZWVk
ZWQuDQoNClsxXQ0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzcxMzY2MDVkMjRkZTliMWZj
NjJkMDJhMzU1ZWYxMWM5NTBhOTQxNTMuY2FtZWxAY3Jvd2RzdHJpa2UuY29tL1QvI21iN2U2Zjg0
YWM5MGZhNzg5ODllOWUyYzNjZDhkMjlmNjVhNzg4NDViDQo=

