Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D89BD67A972
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 05:00:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1qr65TH1z3cFw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 15:00:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ku5DMrJp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=michaele@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ku5DMrJp;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1qq82SmMz3bh4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 14:59:47 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30P2G2Sr002408;
	Wed, 25 Jan 2023 03:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=uuiJH8YjO2+c+q+zzr4MO1DxH/FNu9H2XTbtEmBynsI=;
 b=ku5DMrJp7p9pIzkgme7aE+7kpx9kvlNOMQXK0Kh4TM5A5F5+4GWLNev6FL9WdifkMhZE
 zjrgZ+26x07Gsm4P2tK3xQZjwFsL8DlPruMpJXZaj7BnRoXyd41BCO5byZDbUJrvXC/d
 Ui8GADcT7EgTjA+6/Hzp+uHTmZcY856B+/94eZjHGJtxAWGZhECHwrUPRRhDRa9BPthj
 3WV7si3C7mlLK1ssnaq9+7wXaSteSUhzt6mtqTlfnzNcqJem50NzMgzSixs8spqyecSo
 Nfine21x5q+9Mp+7/dMwxKej2cV6+4ihjTqDsliLDJQdEOE2/JlKpGDtxNwIN3vkmjxS lA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3na838wfte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 03:59:40 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30P3uLDH016680;
	Wed, 25 Jan 2023 03:59:39 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3na838wfsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 03:59:39 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30P3dEdE019104;
	Wed, 25 Jan 2023 03:59:37 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3n87p6mjv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 03:59:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30P3xZZ322610280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 03:59:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF64D20043;
	Wed, 25 Jan 2023 03:59:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71A5A20040;
	Wed, 25 Jan 2023 03:59:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jan 2023 03:59:34 +0000 (GMT)
Received: from localhost (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B9CF6600D5;
	Wed, 25 Jan 2023 14:59:30 +1100 (AEDT)
From: Michael Ellerman <michaele@au1.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 21/24] powerpc/pseries: Pass PLPKS password on kexec
In-Reply-To: <700184879c5f78c72930ba69f09c9d4eddaf933f.camel@linux.ibm.com>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
 <20230120074306.1326298-22-ajd@linux.ibm.com>
 <CQ053TUZQIPP.1OHV7MVS4F4HT@bobo>
 <700184879c5f78c72930ba69f09c9d4eddaf933f.camel@linux.ibm.com>
Date: Wed, 25 Jan 2023 14:59:30 +1100
Message-ID: <874jsfqn6l.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AgAjsWGpYHV2XTXQpjMH7k-gf4lfKQj6
X-Proofpoint-ORIG-GUID: 78vV16f0SF1vqq5MSoZDpsLm-ddIFycf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_17,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 mlxlogscore=819 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1011 malwarescore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301250029
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
Cc: gjoyce@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, sudhakar@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

QW5kcmV3IERvbm5lbGxhbiA8YWpkQGxpbnV4LmlibS5jb20+IHdyaXRlczoNCj4gT24gVHVlLCAy
MDIzLTAxLTI0IGF0IDE0OjM2ICsxMDAwLCBOaWNob2xhcyBQaWdnaW4gd3JvdGU6DQo+PiANCj4+
ID4gK8KgwqDCoMKgwqDCoMKgcHJvcCA9IG9mX2ZpbmRfcHJvcGVydHkob2ZfY2hvc2VuLCAiaWJt
LHBscGtzLXB3IiwgJmxlbik7DQo+PiA+ICvCoMKgwqDCoMKgwqDCoGlmIChwcm9wKSB7DQo+PiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvc3Bhc3N3b3JkbGVuZ3RoID0gKHUxNils
ZW47DQo+PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvc3Bhc3N3b3JkID0ga3ph
bGxvYyhvc3Bhc3N3b3JkbGVuZ3RoLCBHRlBfS0VSTkVMKTsNCj4+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGlmICghb3NwYXNzd29yZCkgew0KPj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG9mX3JlbW92ZV9wcm9wZXJ0eShvZl9jaG9z
ZW4sIHByb3ApOw0KPj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAtRU5PTUVNOw0KPj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgfQ0KPj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWVtY3B5KG9zcGFzc3dv
cmQsIHByb3AtPnZhbHVlLCBsZW4pOw0KPj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIG9mX3JlbW92ZV9wcm9wZXJ0eShvZl9jaG9zZW4sIHByb3ApOw0KPj4gDQo+PiBX
aHkgZG8geW91IHJlbW92ZSB0aGUgcHJvcGVydHkgYWZ0ZXJ3YXJkPw0KPg0KPiBCZWNhdXNlIG90
aGVyd2lzZSB0aGUgcGFzc3dvcmQgd2lsbCBiZSBzaXR0aW5nIGFyb3VuZCBpbiAvcHJvYy9kZXZp
Y2UtDQo+IHRyZWUgZm9yIHRoZSB3b3JsZCB0byBnbyBhbmQgcmVhZC4NCg0KVGhlIGFib3ZlIHJl
bW92ZXMgaXQgZnJvbSB0aGUgdW5mbGF0dGVuZWQgdHJlZSwgYnV0IGl0IHdpbGwgc3RpbGwgZXhp
c3QNCmluIHRoZSBmbGF0dGVuZWQgdHJlZSwgd2hpY2ggaXMgcmVhZGFibGUgYnkgcm9vdCBpbiAv
c3lzL2Zpcm13YXJlL2ZkdC4NCg0KSSdtIG5vdCBzdXJlIGlmIHRoYXQncyBhIG1ham9yIHNlY3Vy
aXR5IHByb2JsZW0sIGJ1dCBpdCBkb2VzIHNlZW0gcmlza3kuDQoNClRvIHNjcnViIGl0IGZyb20g
dGhlIGZsYXQgdHJlZSB5b3UnZCBuZWVkIHRvIGhhdmUgYW4gZWFybHlfaW5pdF9kdCBzdHlsZQ0K
cm91dGluZSB0aGF0IGZpbmRzIHRoZSBwYXNzd29yZCBlYXJseSwgc2F2ZXMgdGhlIHZhbHVlIHNv
bWV3aGVyZSBmb3IgdGhlDQpwbHBrcyBkcml2ZXIsIGFuZCB0aGVuIHplcm9lcyBvdXQgdGhlIHZh
bHVlIGluIHRoZSBmbGF0IHRyZWUuIFNlZSB0aGUNCmV4YW1wbGUgb2Ygcm5nLXNlZWQgaW4gZWFy
bHlfaW5pdF9kdF9zY2FuX2Nob3NlbigpLg0KDQpjaGVlcnMNCg==
