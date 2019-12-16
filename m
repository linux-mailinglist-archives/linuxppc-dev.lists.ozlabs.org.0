Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8E8121A14
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 20:37:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cBPq1FjlzDq9V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 06:37:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=akamai.com (client-ip=2620:100:9005:57f::1;
 helo=mx0b-00190b01.pphosted.com; envelope-from=ilubashe@akamai.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=akamai.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=akamai.com header.i=@akamai.com header.b="icziZlzR"; 
 dkim-atps=neutral
X-Greylist: delayed 1186 seconds by postgrey-1.36 at bilbo;
 Tue, 17 Dec 2019 03:33:29 AEDT
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [IPv6:2620:100:9005:57f::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c6K55ssZzDqD2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 03:33:28 +1100 (AEDT)
Received: from pps.filterd (m0050096.ppops.net [127.0.0.1])
 by m0050096.ppops.net-00190b01. (8.16.0.42/8.16.0.42) with SMTP id
 xBGG9eCE008464; Mon, 16 Dec 2019 16:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=jan2016.eng;
 bh=TlJtzvSQJY2PpRhXQCFBBcMUtctaSu6LA6YjngOX+UQ=;
 b=icziZlzR56P+iT9L8NT3+VAG4RQyiBAd/YOq5pI4YpuFW0t1+HL5RIYnzx6GmtTAd6ay
 2W0g2L4CYbMW4aPkTepW2fw28kdpei+5r4SIwX1d6PzJD06IB9Qdy6fJUnT2xu4uB8+1
 A1tXCJxmb3TMWcLptpeJYYPl1/+0yBcNMB3ydQApyuTuu9lJuXBheAJMBDGdqWx/S5Nl
 dXlhuEEeoS8fLZmF3qLYptE1Mr0fzi3i8TE4jBePnmj4Dgmc8Vqk+Nnl0LvmJuj91bEy
 qYl0PEE6IyrHlIkNJLQ/S2SjRE5gFgRb0pP6PWjzLToJOULkz2toJBCkQd7Aw2vwnXCq hg== 
Received: from prod-mail-ppoint6 (prod-mail-ppoint6.akamai.com [184.51.33.61]
 (may be forged))
 by m0050096.ppops.net-00190b01. with ESMTP id 2wvs1d0e6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2019 16:12:52 +0000
Received: from pps.filterd (prod-mail-ppoint6.akamai.com [127.0.0.1])
 by prod-mail-ppoint6.akamai.com (8.16.0.27/8.16.0.27) with SMTP id
 xBGFp46N000594; Mon, 16 Dec 2019 11:12:52 -0500
Received: from email.msg.corp.akamai.com ([172.27.165.112])
 by prod-mail-ppoint6.akamai.com with ESMTP id 2wvuxydunk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2019 11:12:51 -0500
Received: from ustx2ex-dag1mb6.msg.corp.akamai.com (172.27.165.124) by
 ustx2ex-dag1mb5.msg.corp.akamai.com (172.27.165.123) with Microsoft SMTP
 Server (TLS) id 15.0.1473.3; Mon, 16 Dec 2019 10:12:50 -0600
Received: from ustx2ex-dag1mb6.msg.corp.akamai.com ([172.27.165.124]) by
 ustx2ex-dag1mb6.msg.corp.akamai.com ([172.27.165.124]) with mapi id
 15.00.1473.005; Mon, 16 Dec 2019 08:12:50 -0800
From: "Lubashev, Igor" <ilubashe@akamai.com>
To: Alexey Budankov <alexey.budankov@linux.intel.com>, Peter Zijlstra
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "rodrigo.vivi@intel.com"
 <rodrigo.vivi@intel.com>, Alexei Starovoitov <ast@kernel.org>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, Casey Schaufler <casey@schaufler-ca.com>,
 "serge@hallyn.com" <serge@hallyn.com>, James Morris <jmorris@namei.org>
Subject: RE: [PATCH v2 2/7] perf/core: open access for CAP_SYS_PERFMON
 privileged process
Thread-Topic: [PATCH v2 2/7] perf/core: open access for CAP_SYS_PERFMON
 privileged process
Thread-Index: AQHVs+CfzGj9uMUtGUC4IRZHidt5Zae87MsA
Date: Mon, 16 Dec 2019 16:12:50 +0000
Message-ID: <9316a1ab21f6441eb2b421acb818a2a1@ustx2ex-dag1mb6.msg.corp.akamai.com>
References: <26101427-c0a3-db9f-39e9-9e5f4ddd009c@linux.intel.com>
 <fd6ffb43-ed43-14cd-b286-6ab4b199155b@linux.intel.com>
In-Reply-To: <fd6ffb43-ed43-14cd-b286-6ab4b199155b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.19.113.150]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-12-16_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912160139
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-16_06:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 clxscore=1011
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912160141
X-Mailman-Approved-At: Tue, 17 Dec 2019 06:30:54 +1100
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Song Liu <songliubraving@fb.com>, Andi Kleen <ak@linux.intel.com>,
 Kees Cook <keescook@chromium.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Jann Horn <jannh@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stephane
 Eranian <eranian@google.com>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Thomas
 Gleixner <tglx@linutronix.de>, "bgregg@netflix.com" <bgregg@netflix.com>,
 Jiri Olsa <jolsa@redhat.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMjoxNSBBTSwgQWxleGV5IEJ1ZGFua292IDxhbGV4ZXku
YnVkYW5rb3ZAbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+IE9wZW4gYWNjZXNzIHRvIHBl
cmZfZXZlbnRzIG1vbml0b3JpbmcgZm9yIENBUF9TWVNfUEVSRk1PTiBwcml2aWxlZ2VkDQo+IHBy
b2Nlc3Nlcy4NCj4gRm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgcmVhc29ucyBhY2Nlc3MgdG8g
cGVyZl9ldmVudHMgc3Vic3lzdGVtIHJlbWFpbnMNCj4gb3BlbiBmb3IgQ0FQX1NZU19BRE1JTiBw
cml2aWxlZ2VkIHByb2Nlc3NlcyBidXQgQ0FQX1NZU19BRE1JTiB1c2FnZQ0KPiBmb3Igc2VjdXJl
IHBlcmZfZXZlbnRzIG1vbml0b3JpbmcgaXMgZGlzY291cmFnZWQgd2l0aCByZXNwZWN0IHRvDQo+
IENBUF9TWVNfUEVSRk1PTiBjYXBhYmlsaXR5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleGV5
IEJ1ZGFua292IDxhbGV4ZXkuYnVkYW5rb3ZAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGlu
Y2x1ZGUvbGludXgvcGVyZl9ldmVudC5oIHwgOSArKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9wZXJmX2V2ZW50LmggYi9pbmNsdWRlL2xpbnV4L3BlcmZfZXZlbnQuaCBpbmRl
eA0KPiAzNGM3YzY5MTAwMjYuLjUyMzEzZDJjYzM0MyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9s
aW51eC9wZXJmX2V2ZW50LmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9wZXJmX2V2ZW50LmgNCj4g
QEAgLTEyODUsNyArMTI4NSw4IEBAIHN0YXRpYyBpbmxpbmUgaW50IHBlcmZfaXNfcGFyYW5vaWQo
dm9pZCkNCj4gDQo+ICBzdGF0aWMgaW5saW5lIGludCBwZXJmX2FsbG93X2tlcm5lbChzdHJ1Y3Qg
cGVyZl9ldmVudF9hdHRyICphdHRyKSAgew0KPiAtCWlmIChzeXNjdGxfcGVyZl9ldmVudF9wYXJh
bm9pZCA+IDEgJiYgIWNhcGFibGUoQ0FQX1NZU19BRE1JTikpDQo+ICsJaWYgKHN5c2N0bF9wZXJm
X2V2ZW50X3BhcmFub2lkID4gMSAmJg0KPiArCSAgICEoY2FwYWJsZShDQVBfU1lTX1BFUkZNT04p
IHx8IGNhcGFibGUoQ0FQX1NZU19BRE1JTikpKQ0KPiAgCQlyZXR1cm4gLUVBQ0NFUzsNCj4gDQo+
ICAJcmV0dXJuIHNlY3VyaXR5X3BlcmZfZXZlbnRfb3BlbihhdHRyLCBQRVJGX1NFQ1VSSVRZX0tF
Uk5FTCk7IEBADQo+IC0xMjkzLDcgKzEyOTQsOCBAQCBzdGF0aWMgaW5saW5lIGludCBwZXJmX2Fs
bG93X2tlcm5lbChzdHJ1Y3QNCj4gcGVyZl9ldmVudF9hdHRyICphdHRyKQ0KPiANCj4gIHN0YXRp
YyBpbmxpbmUgaW50IHBlcmZfYWxsb3dfY3B1KHN0cnVjdCBwZXJmX2V2ZW50X2F0dHIgKmF0dHIp
ICB7DQo+IC0JaWYgKHN5c2N0bF9wZXJmX2V2ZW50X3BhcmFub2lkID4gMCAmJiAhY2FwYWJsZShD
QVBfU1lTX0FETUlOKSkNCj4gKwlpZiAoc3lzY3RsX3BlcmZfZXZlbnRfcGFyYW5vaWQgPiAwICYm
DQo+ICsJICAgICEoY2FwYWJsZShDQVBfU1lTX1BFUkZNT04pIHx8IGNhcGFibGUoQ0FQX1NZU19B
RE1JTikpKQ0KPiAgCQlyZXR1cm4gLUVBQ0NFUzsNCj4gDQo+ICAJcmV0dXJuIHNlY3VyaXR5X3Bl
cmZfZXZlbnRfb3BlbihhdHRyLCBQRVJGX1NFQ1VSSVRZX0NQVSk7IEBAIC0NCj4gMTMwMSw3ICsx
MzAzLDggQEAgc3RhdGljIGlubGluZSBpbnQgcGVyZl9hbGxvd19jcHUoc3RydWN0IHBlcmZfZXZl
bnRfYXR0cg0KPiAqYXR0cikNCj4gDQo+ICBzdGF0aWMgaW5saW5lIGludCBwZXJmX2FsbG93X3Ry
YWNlcG9pbnQoc3RydWN0IHBlcmZfZXZlbnRfYXR0ciAqYXR0cikgIHsNCj4gLQlpZiAoc3lzY3Rs
X3BlcmZfZXZlbnRfcGFyYW5vaWQgPiAtMSAmJiAhY2FwYWJsZShDQVBfU1lTX0FETUlOKSkNCj4g
KwlpZiAoc3lzY3RsX3BlcmZfZXZlbnRfcGFyYW5vaWQgPiAtMSAmJg0KPiArCSAgICAhKGNhcGFi
bGUoQ0FQX1NZU19QRVJGTU9OKSB8fCBjYXBhYmxlKENBUF9TWVNfQURNSU4pKSkNCj4gIAkJcmV0
dXJuIC1FUEVSTTsNCj4gDQo+ICAJcmV0dXJuIHNlY3VyaXR5X3BlcmZfZXZlbnRfb3BlbihhdHRy
LCBQRVJGX1NFQ1VSSVRZX1RSQUNFUE9JTlQpOw0KPiAtLQ0KPiAyLjIwLjENCg0KVGhhbmtzLiAg
SSBsaWtlIHRoZSBpZGVhIG9mIENBUF9TWVNfUEVSRk1PTiB0aGF0IGRvZXMgbm90IHJlcXVpcmUg
Q0FQX1NZU19BRE1JTi4gIEl0IG1ha2VzIGdyYW50aW5nIHVzZXJzIGFiaWxpdHkgdG8gcnVuIHBl
cmYgYSBiaXQgc2FmZXIuDQoNCkkgc2VlIGEgbG90IG9mICIoY2FwYWJsZShDQVBfU1lTX1BFUkZN
T04pIHx8IGNhcGFibGUoQ0FQX1NZU19BRE1JTikiIGNvbnN0cnVjdHMgbm93LiAgTWF5YmUgd3Jh
cHBpbmcgaXQgaW4gYW4gIiBpbmxpbmUgYm9vbCBwZXJmbW9uX2NhcGFibGUoKSIgZGVmaW5lZCBz
b21ld2hlcmUgKGxpa2UgaW4gL2luY2x1ZGUvbGludXgvY2FwYWJpbGl0eS5oKT8NCg0KLSBJZ29y
DQo=
