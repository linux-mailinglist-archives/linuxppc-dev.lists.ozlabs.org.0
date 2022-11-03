Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A0D6174C6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 04:12:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2phM28nVz3cMc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 14:12:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GtwUWeGV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GtwUWeGV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2pgM0vVRz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 14:11:10 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A337NHa004332;
	Thu, 3 Nov 2022 03:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5u/G7Q7oOqNLlrC/8IFpd9IpbJ9M4l/0MebsRcU0w0A=;
 b=GtwUWeGV4ODXa/ohXbty8ez6nYzsBLKWGRDidYOIFV9azpp9B6aHHngH24+oHbiWGgQN
 vYVwO3el0GrwtvOfIlJt23ov5YbIFBdgoREX10KzHHDkFmDP5FhGmfyz+k65lmtsHSRZ
 749P5WJJxFKlMxLS/BUlaSUQFYqTvOMY5r0Q6TatErEPYt8eraz20kUyM5aKS1vLMpAv
 of+rAcNTvYW+Xt8S1rZ/sgz6CdXkzmy5nMon7DR0yehlwdszcaacx43AR5UaqrAjiVcH
 rKi+MJwOFi9MO2HZpDAA/vExdWuGS4XdV6N6iyZviNKiUuipbyjSiQNH55qMmIvi1b5R 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km2jjut2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 03:10:58 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A339pJv015638;
	Thu, 3 Nov 2022 03:10:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km2jjut1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 03:10:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A335hrY026533;
	Thu, 3 Nov 2022 03:10:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3kgut90046-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 03:10:55 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A33AqTi58130864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Nov 2022 03:10:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B50A011C050;
	Thu,  3 Nov 2022 03:10:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15FD311C04C;
	Thu,  3 Nov 2022 03:10:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  3 Nov 2022 03:10:52 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 93DBC6010C;
	Thu,  3 Nov 2022 14:10:42 +1100 (AEDT)
Message-ID: <bf8ccc134cfb81a3625afdfe40b8ca5ff08bef30.camel@linux.ibm.com>
Subject: Re: [PATCH v9 6/7] powerpc/code-patching: Use temporary mm for
 Radix MMU
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 03 Nov 2022 14:10:42 +1100
In-Reply-To: <5c1976e4-8a66-2651-3968-5f23d9cb9bd3@csgroup.eu>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
	 <20221025044409.448755-7-bgray@linux.ibm.com>
	 <5c1976e4-8a66-2651-3968-5f23d9cb9bd3@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JRa773Le2yR8xsOrcPAsIcIuEBfTy9jz
X-Proofpoint-ORIG-GUID: fDS8nxFH0lEgWpIQUGD01BrZ66fE0dHk
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030020
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

T24gV2VkLCAyMDIyLTExLTAyIGF0IDEwOjExICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Ogo+IExlIDI1LzEwLzIwMjIgw6AgMDY6NDQsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoKPiA+
ICtzdGF0aWMgaW50IHRleHRfYXJlYV9jcHVfdXBfbW0odW5zaWduZWQgaW50IGNwdSkKPiA+ICt7
Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbW1fc3RydWN0ICptbTsKPiA+ICvCoMKgwqDCoMKg
wqDCoHVuc2lnbmVkIGxvbmcgYWRkcjsKPiA+ICvCoMKgwqDCoMKgwqDCoHBnZF90ICpwZ2RwOwo+
ID4gK8KgwqDCoMKgwqDCoMKgcDRkX3QgKnA0ZHA7Cj4gPiArwqDCoMKgwqDCoMKgwqBwdWRfdCAq
cHVkcDsKPiA+ICvCoMKgwqDCoMKgwqDCoHBtZF90ICpwbWRwOwo+ID4gK8KgwqDCoMKgwqDCoMKg
cHRlX3QgKnB0ZXA7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBtbSA9IGNvcHlfaW5pdF9tbSgp
Owo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKFdBUk5fT04oIW1tKSkKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBnb3RvIGZhaWxfbm9fbW07Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKg
wqAvKgo+ID4gK8KgwqDCoMKgwqDCoMKgICogQ2hvb3NlIGEgcmFuZG9tIHBhZ2UtYWxpZ25lZCBh
ZGRyZXNzIGZyb20gdGhlIGludGVydmFsCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBbUEFHRV9TSVpF
IC4uIERFRkFVTFRfTUFQX1dJTkRPVyAtIFBBR0VfU0laRV0uCj4gPiArwqDCoMKgwqDCoMKgwqAg
KiBUaGUgbG93ZXIgYWRkcmVzcyBib3VuZCBpcyBQQUdFX1NJWkUgdG8gYXZvaWQgdGhlIHplcm8t
Cj4gPiBwYWdlLgo+ID4gK8KgwqDCoMKgwqDCoMKgICovCj4gPiArwqDCoMKgwqDCoMKgwqBhZGRy
ID0gKDEgKyAoZ2V0X3JhbmRvbV9sb25nKCkgJSAoREVGQVVMVF9NQVBfV0lORE9XIC8KPiA+IFBB
R0VfU0laRSAtIDIpKSkgPDwgUEFHRV9TSElGVDsKPiAKPiBUaGVyZSBpcyBzb21lIHdvcmsgaW4g
cHJvZ3Jlc3MgdG8gZ2V0IHJpZCBvZiAoZ2V0X3JhbmRvbV9sb25nKCkgJSAKPiBzb21ldGhpbmcp
LCBzZWUgCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlh
L2NvdmVyLzIwMjIxMDEwMjMwNjEzLjEwNzY5MDUtMS1KYXNvbkB6eDJjNC5jb20vCgpJIGhhZCBi
ZWVuIHJlYWQgdGhhdCBzZXJpZXMgYmVmb3JlIHNlbmRpbmcuIGdldF9yYW5kb21faW50IGlzIHJl
bW92ZWQsCmFuZCB0aGUgZ3VpZGVsaW5lcyBnaXZlIGluc3RydWN0aW9ucyBmb3IgZml4ZWQgdmFs
dWUgc2l6ZXMgKHUzMiwgdTY0KSwKYnV0IGdldF9yYW5kb21fbG9uZygpIGRvZXNuJ3QgaGF2ZSBh
IGNvcnJlc3BvbmRpbmcKZ2V0X3JhbmRvbV9sb25nX21heCgpLgoKPiA+ICsKPiA+ICvCoMKgwqDC
oMKgwqDCoC8qCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBQVEUgYWxsb2NhdGlvbiB1c2VzIEdGUF9L
RVJORUwgd2hpY2ggbWVhbnMgd2UgbmVlZCB0bwo+ID4gK8KgwqDCoMKgwqDCoMKgICogcHJlLWFs
bG9jYXRlIHRoZSBQVEUgaGVyZSBiZWNhdXNlIHdlIGNhbm5vdCBkbyB0aGUKPiA+ICvCoMKgwqDC
oMKgwqDCoCAqIGFsbG9jYXRpb24gZHVyaW5nIHBhdGNoaW5nIHdoZW4gSVJRcyBhcmUgZGlzYWJs
ZWQuCj4gPiArwqDCoMKgwqDCoMKgwqAgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoHBnZHAgPSBwZ2Rf
b2Zmc2V0KG1tLCBhZGRyKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHA0ZHAgPSBwNGRfYWxs
b2MobW0sIHBnZHAsIGFkZHIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKFdBUk5fT04oIXA0ZHAp
KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZmFpbF9ub19wNGQ7Cj4g
PiArCj4gPiArwqDCoMKgwqDCoMKgwqBwdWRwID0gcHVkX2FsbG9jKG1tLCBwNGRwLCBhZGRyKTsK
PiA+ICvCoMKgwqDCoMKgwqDCoGlmIChXQVJOX09OKCFwdWRwKSkKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBnb3RvIGZhaWxfbm9fcHVkOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDC
oMKgcG1kcCA9IHBtZF9hbGxvYyhtbSwgcHVkcCwgYWRkcik7Cj4gPiArwqDCoMKgwqDCoMKgwqBp
ZiAoV0FSTl9PTighcG1kcCkpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290
byBmYWlsX25vX3BtZDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHB0ZXAgPSBwdGVfYWxsb2Nf
bWFwKG1tLCBwbWRwLCBhZGRyKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChXQVJOX09OKCFwdGVw
KSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGZhaWxfbm9fcHRlOwo+
IAo+IEluc24ndCB0aGVyZSBzdGFuZGFyZCBnZW5lcmljIGZ1bmN0aW9ucyB0byBkbyB0aGF0ID8K
PiAKPiBGb3IgaW5zdGFuY2UsIF9fZ2V0X2xvY2tlZF9wdGUoKSBzZWVtcyB0byBkbyBtb3JlIG9y
IGxlc3MgdGhlIHNhbWUuCgpfX2dldF9sb2NrZWRfcHRlIGludm9rZXMgd2Fsa190b19wbWQsIHdo
aWNoIGxlYWtzIG1lbW9yeSBpZiB0aGUKYWxsb2NhdGlvbiBmYWlscy4gVGhpcyBtYXkgbm90IGJl
IGEgY29uY2VybiBuZWNlc3NhcmlseSBhdCBib290ICh0aG91Z2gKSSBzdGlsbCBkb24ndCBsaWtl
IGl0KSwgYnV0IHN0YXJ0dXAgaXMgcnVuIGV2ZXJ5IHRpbWUgYSBDUFUgY29tZXMKb25saW5lLCBz
byB0aGUgbGVhayBpcyB0aGVvcmV0aWNhbGx5IHVuYm91bmRlZC4KClRoZXJlJ3Mgbm8gbmVlZCB0
byBsZWFrIGl0IGluIHRoaXMgY29udGV4dCwgYmVjYXVzZSB3ZSBrbm93IHRoYXQgZWFjaApwYWdl
IGlzIGV4Y2x1c2l2ZWx5IHVzZWQgYnkgdGhlIGNvcnJlc3BvbmRpbmcgcGF0Y2hpbmcgbW0uCgo+
ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgdGhpc19jcHVfd3JpdGUoY3B1X3BhdGNoaW5nX21tLCBt
bSk7Cj4gPiArwqDCoMKgwqDCoMKgwqB0aGlzX2NwdV93cml0ZShjcHVfcGF0Y2hpbmdfYWRkciwg
YWRkcik7Cj4gPiArwqDCoMKgwqDCoMKgwqB0aGlzX2NwdV93cml0ZShjcHVfcGF0Y2hpbmdfcHRl
LCBwdGVwKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gKwo+ID4gK2Zh
aWxfbm9fcHRlOgo+ID4gK8KgwqDCoMKgwqDCoMKgcG1kX2ZyZWUobW0sIHBtZHApOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgbW1fZGVjX25yX3BtZHMobW0pOwo+ID4gK2ZhaWxfbm9fcG1kOgo+ID4gK8Kg
wqDCoMKgwqDCoMKgcHVkX2ZyZWUobW0sIHB1ZHApOwo+ID4gK8KgwqDCoMKgwqDCoMKgbW1fZGVj
X25yX3B1ZHMobW0pOwo+ID4gK2ZhaWxfbm9fcHVkOgo+ID4gK8KgwqDCoMKgwqDCoMKgcDRkX2Zy
ZWUocGF0Y2hpbmdfbW0sIHA0ZHApOwo+ID4gK2ZhaWxfbm9fcDRkOgo+ID4gK8KgwqDCoMKgwqDC
oMKgbW1wdXQobW0pOwo+ID4gK2ZhaWxfbm9fbW06Cj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
LUVOT01FTTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCB0ZXh0X2FyZWFfY3B1X2Rvd25f
bW0odW5zaWduZWQgaW50IGNwdSkKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbW1f
c3RydWN0ICptbTsKPiA+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgYWRkcjsKPiA+ICvC
oMKgwqDCoMKgwqDCoHB0ZV90ICpwdGVwOwo+ID4gK8KgwqDCoMKgwqDCoMKgcG1kX3QgKnBtZHA7
Cj4gPiArwqDCoMKgwqDCoMKgwqBwdWRfdCAqcHVkcDsKPiA+ICvCoMKgwqDCoMKgwqDCoHA0ZF90
ICpwNGRwOwo+ID4gK8KgwqDCoMKgwqDCoMKgcGdkX3QgKnBnZHA7Cj4gPiArCj4gPiArwqDCoMKg
wqDCoMKgwqBtbSA9IHRoaXNfY3B1X3JlYWQoY3B1X3BhdGNoaW5nX21tKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoGFkZHIgPSB0aGlzX2NwdV9yZWFkKGNwdV9wYXRjaGluZ19hZGRyKTsKPiA+ICsKPiA+
ICvCoMKgwqDCoMKgwqDCoHBnZHAgPSBwZ2Rfb2Zmc2V0KG1tLCBhZGRyKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoHA0ZHAgPSBwNGRfb2Zmc2V0KHBnZHAsIGFkZHIpOwo+ID4gK8KgwqDCoMKgwqDCoMKg
cHVkcCA9IHB1ZF9vZmZzZXQocDRkcCwgYWRkcik7Cj4gPiArwqDCoMKgwqDCoMKgwqBwbWRwID0g
cG1kX29mZnNldChwdWRwLCBhZGRyKTsKPiA+ICvCoMKgwqDCoMKgwqDCoHB0ZXAgPSBwdGVfb2Zm
c2V0X21hcChwbWRwLCBhZGRyKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHB0ZV9mcmVlKG1t
LCBwdGVwKTsKPiA+ICvCoMKgwqDCoMKgwqDCoHBtZF9mcmVlKG1tLCBwbWRwKTsKPiA+ICvCoMKg
wqDCoMKgwqDCoHB1ZF9mcmVlKG1tLCBwdWRwKTsKPiA+ICvCoMKgwqDCoMKgwqDCoHA0ZF9mcmVl
KG1tLCBwNGRwKTsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIHBnZCBpcyBkcm9wcGVkIGluIG1tcHV0
ICovCj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBtbV9kZWNfbnJfcHRlcyhtbSk7Cj4gPiArwqDC
oMKgwqDCoMKgwqBtbV9kZWNfbnJfcG1kcyhtbSk7Cj4gPiArwqDCoMKgwqDCoMKgwqBtbV9kZWNf
bnJfcHVkcyhtbSk7Cj4gCj4gU2FtZSBxdWVzdGlvbiwgY2FuJ3Qgc29tZXRoaW5nIGdlbmVyaWMg
YmUgdXNlZCwgc29tZXRoaW5nIGxpa2UgCj4gZnJlZV9wZ2RfcmFuZ2UoKSA/CgpQb3NzaWJseSwg
YnV0IEkgZG9uJ3QgaGF2ZSBhIHN0cnVjdCBtbXVfZ2F0aGVyIHRvIGdpdmUgaXQuIElmIHRoZXJl
J3MgYQp3YXkgdG8gbWFrZSBvbmUgdGVtcG9yYXJpbHkgdGhlbiBpdCBtaWdodCB3b3JrLgoKPiA+
ICtzdGF0aWMgaW50IF9fZG9fcGF0Y2hfaW5zdHJ1Y3Rpb25fbW0odTMyICphZGRyLCBwcGNfaW5z
dF90IGluc3RyKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDCoGludCBlcnI7Cj4gPiArwqDCoMKg
wqDCoMKgwqB1MzIgKnBhdGNoX2FkZHI7Cj4gPiArwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBsb25n
IHRleHRfcG9rZV9hZGRyOwo+ID4gK8KgwqDCoMKgwqDCoMKgcHRlX3QgKnB0ZTsKPiA+ICvCoMKg
wqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgcGZuID0gZ2V0X3BhdGNoX3BmbihhZGRyKTsKPiA+ICvC
oMKgwqDCoMKgwqDCoHN0cnVjdCBtbV9zdHJ1Y3QgKnBhdGNoaW5nX21tOwo+ID4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IG1tX3N0cnVjdCAqb3JpZ19tbTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDC
oHBhdGNoaW5nX21tID0gX190aGlzX2NwdV9yZWFkKGNwdV9wYXRjaGluZ19tbSk7Cj4gPiArwqDC
oMKgwqDCoMKgwqBwdGUgPSBfX3RoaXNfY3B1X3JlYWQoY3B1X3BhdGNoaW5nX3B0ZSk7Cj4gPiAr
wqDCoMKgwqDCoMKgwqB0ZXh0X3Bva2VfYWRkciA9IF9fdGhpc19jcHVfcmVhZChjcHVfcGF0Y2hp
bmdfYWRkcik7Cj4gPiArwqDCoMKgwqDCoMKgwqBwYXRjaF9hZGRyID0gKHUzMiAqKSh0ZXh0X3Bv
a2VfYWRkciArCj4gPiBvZmZzZXRfaW5fcGFnZShhZGRyKSk7Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqBpZiAodW5saWtlbHkoIXBhdGNoaW5nX21tKSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHNldF9w
dGVfYXQocGF0Y2hpbmdfbW0sIHRleHRfcG9rZV9hZGRyLCBwdGUsIHBmbl9wdGUocGZuLAo+ID4g
UEFHRV9LRVJORUwpKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIG9yZGVyIFBURSB1cGRh
dGUgYmVmb3JlIHVzZSwgYWxzbyBzZXJ2ZXMgYXMgdGhlIGh3c3luYwo+ID4gKi8KPiA+ICvCoMKg
wqDCoMKgwqDCoGFzbSB2b2xhdGlsZSgicHRlc3luYyI6IDogOiJtZW1vcnkiKTsKPiAKPiBZb3Ug
YXNzdW1lIGl0IGlzIHJhZGl4IG9ubHkgPwoKSSBlbmZvcmNlIGl0IGluIG1tX3BhdGNoX2VuYWJs
ZWQK
