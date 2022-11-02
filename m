Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C656170CC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 23:43:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2hkx6db2z3cBw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:43:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J9YGc3oQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J9YGc3oQ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2hk201lkz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 09:43:05 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A2MaGnI031679;
	Wed, 2 Nov 2022 22:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0UM5spAl6BFDVsyKaMfuCJ4448A/bxUXIfsRGP87API=;
 b=J9YGc3oQ/0L0RK1OOys/Z+BiZsgFR3dlwnAUqwcAdp+ruk+4Vgh8NHOmP+CAisssWUWN
 jCjCvuaq+rjBIip1CqU5lXM5RoyOZHgTGzE/7HsSXQU7nBZfjkco3Kh032Qwe9VNq6Fg
 QExHA6AhfdeWEzVSLx+zGjNi08CIUF+uXHQaUmFf5vh89OBEE3acjm53GVoQbCSH6cPs
 m5K96oCbezHJyzf4IFDIq6TbV7Rl8tPaYSNr5xFH5mr34jQ2fpFFLBDMCj90zYvxNmvj
 CfZglmgKGgOxzQkcql3M8z922SBHYIgtcemh8ZolzpU8VmZQH1Q6a9RNs78IAvioJtQE 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km0kq9frs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:42:55 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2MbQru009798;
	Wed, 2 Nov 2022 22:42:54 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km0kq9fr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:42:54 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A2Ma6hX007640;
	Wed, 2 Nov 2022 22:42:52 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3kguehyphw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:42:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A2Mgo2K1114828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:42:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43D76AE045;
	Wed,  2 Nov 2022 22:42:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2F09AE04D;
	Wed,  2 Nov 2022 22:42:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  2 Nov 2022 22:42:49 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6040460100;
	Thu,  3 Nov 2022 09:42:48 +1100 (AEDT)
Message-ID: <fe8be91f769831e9720edc8d4c4392bdc08382eb.camel@linux.ibm.com>
Subject: Re: [PATCH v9 3/7] powerpc/code-patching: Use WARN_ON and fix check
 in poking_init
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 03 Nov 2022 09:42:48 +1100
In-Reply-To: <90f075a3-54b3-b74e-385d-b9f40f055a3c@csgroup.eu>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
	 <20221025044409.448755-4-bgray@linux.ibm.com>
	 <90f075a3-54b3-b74e-385d-b9f40f055a3c@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zCc68V5d_NiiaM5dfoZUjOFwtojHJrNB
X-Proofpoint-GUID: EXYpO-ufD9vv5tLBOO4vDu1yg90nBYQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211020149
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIyLTExLTAyIGF0IDA5OjM4ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Ogo+IExlIDI1LzEwLzIwMjIgw6AgMDY6NDQsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoKPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYwo+ID4gYi9hcmNo
L3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYwo+ID4gaW5kZXggNTRlMTQ1MjQ3NjQzLi4zYjNi
MDlkNWQyZTEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcu
Ywo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMKPiA+IEBAIC04Miwx
NiArODIsMTMgQEAgc3RhdGljIGludCB0ZXh0X2FyZWFfY3B1X2Rvd24odW5zaWduZWQgaW50IGNw
dSkKPiA+IMKgIAo+ID4gwqAgc3RhdGljIF9fcm9fYWZ0ZXJfaW5pdCBERUZJTkVfU1RBVElDX0tF
WV9GQUxTRShwb2tpbmdfaW5pdF9kb25lKTsKPiA+IMKgIAo+ID4gLS8qCj4gPiAtICogQWx0aG91
Z2ggQlVHX09OKCkgaXMgcnVkZSwgaW4gdGhpcyBjYXNlIGl0IHNob3VsZCBvbmx5IGhhcHBlbgo+
ID4gaWYgRU5PTUVNLCBhbmQKPiA+IC0gKiB3ZSBqdWRnZSBpdCBhcyBiZWluZyBwcmVmZXJhYmxl
IHRvIGEga2VybmVsIHRoYXQgd2lsbCBjcmFzaAo+ID4gbGF0ZXIgd2hlbgo+ID4gLSAqIHNvbWVv
bmUgdHJpZXMgdG8gdXNlIHBhdGNoX2luc3RydWN0aW9uKCkuCj4gPiAtICovCj4gPiDCoCB2b2lk
IF9faW5pdCBwb2tpbmdfaW5pdCh2b2lkKQo+ID4gwqAgewo+ID4gLcKgwqDCoMKgwqDCoMKgQlVH
X09OKCFjcHVocF9zZXR1cF9zdGF0ZShDUFVIUF9BUF9PTkxJTkVfRFlOLAo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJwb3dlcnBjL3RleHRfcG9rZTpvbmxpbmUiLCB0ZXh0X2Fy
ZWFfY3B1X3VwLAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRleHRfYXJlYV9j
cHVfZG93bikpOwo+ID4gK8KgwqDCoMKgwqDCoMKgV0FSTl9PTihjcHVocF9zZXR1cF9zdGF0ZShD
UFVIUF9BUF9PTkxJTkVfRFlOLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInBvd2VycGMvdGV4dF9wb2tlOm9ubGlu
ZSIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB0ZXh0X2FyZWFfY3B1X3VwLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGV4dF9hcmVh
X2NwdV9kb3duKSA8IDApOwo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0YXRpY19icmFuY2hf
ZW5hYmxlKCZwb2tpbmdfaW5pdF9kb25lKTsKPiAKPiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8g
bm90IGVuYWJsZSB0aGUgcG9raW5nX2luaXRfZG9uZSBicmFuY2ggaWYKPiB0aGUgCj4gYWxsb2Nh
dGlvbiBmYWlsZWQgPwoKWWVhaCB0aGF0IHByb2JhYmx5IHdvcmtzIGJldHRlci4gSWYgaXQgbWFu
YWdlcyB0byByZWFjaCBhIHBhdGNoIGF0dGVtcHQKYWZ0ZXIgdGhhdCBpdCBzaG91bGQgZmFpbCBh
bnl3YXkgd2l0aCBzdHJpY3QgUldYLgo=

