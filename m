Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA39682267
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 03:55:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5V6B4J02z2ygG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 13:55:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lo9kKz9R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lo9kKz9R;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5V5C3vmlz30hl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 13:54:39 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V2qm7v010453;
	Tue, 31 Jan 2023 02:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2x9w1zrojCcY07Kq+MHFQCWrs4Se8Jgz6R92gGVRoHA=;
 b=lo9kKz9Ra5pkacDIu+ljnrMOqZ79Mlm39/2QcfzxNFXiMhyPD+/s2NFzF5XJF1ps5r4P
 99Og4Kr9psSLT2I68leRsBdWFHQf1hztFL/BKKMMzuMgfop+cqUK9WKbqTPqVZGmucDU
 J1kpsrkipNHarGA1Jc4rfZEzJ3lnnJbrL3bRfPKiPO554yGDz7piDvra5DnEftLuGZA3
 aEFFAd+JZIlVweZ0iVVo6TsbvsPuJORsn52VUYgZaqEYoAObZnpkcydQs96Y9UNJq1fO
 N91wLiyAWkYt+LksM24u/ib8ndrfMA7Zif2eksXkyDv0GtJymVqPAOWYy0PQlpmHCR5K Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3netkeg0rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 02:54:31 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30V2sVxk015393;
	Tue, 31 Jan 2023 02:54:31 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3netkeg0r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 02:54:31 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UGh7rp024026;
	Tue, 31 Jan 2023 02:54:29 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3ncvuqt3vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 02:54:29 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30V2sQeW30605570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 02:54:26 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6BED2004E;
	Tue, 31 Jan 2023 02:54:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA87720040;
	Tue, 31 Jan 2023 02:54:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 02:54:25 +0000 (GMT)
Received: from [9.192.255.228] (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B349C60112;
	Tue, 31 Jan 2023 13:54:22 +1100 (AEDT)
Message-ID: <9f16d86e855f22823ee24e6a6236a16556425f29.camel@linux.ibm.com>
Subject: Re: [PATCH v4 22/24] powerpc/pseries: Implement secvars for dynamic
 secure boot
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        linux-integrity@vger.kernel.org
Date: Tue, 31 Jan 2023 13:54:22 +1100
In-Reply-To: <CQ05ZDYG6KNU.1G9O3ITQDIHEM@bobo>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
	 <20230120074306.1326298-23-ajd@linux.ibm.com>
	 <CQ05ZDYG6KNU.1G9O3ITQDIHEM@bobo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hshNw6igQM1SdUwtgrRK-7x7reJhyg4p
X-Proofpoint-ORIG-GUID: GpSv42SRHTgEBaAug9f99WmxD3IkWYQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_19,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301310021
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

T24gVHVlLCAyMDIzLTAxLTI0IGF0IDE1OjE3ICsxMDAwLCBOaWNob2xhcyBQaWdnaW4gd3JvdGU6
Cj4gPiArc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBwbHBrc192YXJfbmFtZXNbXSA9IHsKPiA+
ICvCoMKgwqDCoMKgwqDCoCJQSyIsCj4gPiArwqDCoMKgwqDCoMKgwqAiS0VLIiwKPiA+ICvCoMKg
wqDCoMKgwqDCoCJkYiIsCj4gPiArwqDCoMKgwqDCoMKgwqAiZGJ4IiwKPiA+ICvCoMKgwqDCoMKg
wqDCoCJncnViZGIiLAo+ID4gK8KgwqDCoMKgwqDCoMKgImdydWJkYngiLAo+ID4gK8KgwqDCoMKg
wqDCoMKgInNiYXQiLAo+ID4gK8KgwqDCoMKgwqDCoMKgIm1vZHVsZWRiIiwKPiA+ICvCoMKgwqDC
oMKgwqDCoCJ0cnVzdGVkY2FkYiIsCj4gPiArwqDCoMKgwqDCoMKgwqBOVUxMLAo+ID4gK307Cj4g
Cj4gVmFyIGFuZCBrZXkgYXJlIHVzZWQgc29tZXdoYXQgaW50ZXJjaGFuZ2VhYmx5PyBUaGVzZSBh
cmUga2V5cywgSQo+IHRoaW5rPwo+IEFuZCBwbHBrcyBjb3VsZCBoYXZlIG90aGVyIHZhcnMgYnV0
IHdlJ3JlIG9ubHkgaW50ZXJlc3RlZCBpbiAoYXQKPiBsZWFzdCBhCj4gc3Vic2V0IG9mKSBrZXlz
IGhlcmUgaWYgSSB1bmRlcnN0b29kIHJpZ2h0Lgo+IAo+IEkgZ3Vlc3MgdGhlIHRlcm1pbm9sb2d5
IGlzIGxpa2UgdGhhdCB0aHJvdWdob3V0IHNlY3ZhciBzbyBtYXliZQo+IG5vdGhpbmcKPiB0byBi
ZSBkb25lLgoKVGhlICJrZXkiIHRlcm1pbm9sb2d5IHNlZW1zIHRvIGNvbWUgZnJvbSBPUEFMLCB3
aGlsZSBvbiB0aGUgUExQS1Mgc2lkZQppdCdzIGEgYml0IG9mIGEgbWVzcyBidXQgInZhciIgZm9s
bG93cyB0aGUgdXNhZ2UgaW4gZXhpc3RpbmcgY29kZSAodGhlCnNwZWMgcmVmZXJzIG1vcmUgdG8g
Im9iamVjdHMiKS4KCj4gCj4gPiArCj4gPiArc3RhdGljIGludCBwbHBrc19nZXRfdmFyaWFibGUo
Y29uc3QgY2hhciAqa2V5LCB1NjQga2V5X2xlbiwgdTgKPiA+ICpkYXRhLAo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU2NCAqZGF0
YV9zaXplKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBwbHBrc192YXIgdmFyID0g
ezB9Owo+ID4gK8KgwqDCoMKgwqDCoMKgaW50IHJjID0gMDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKg
wqDCoHZhci5uYW1lID0ga2NhbGxvYyhrZXlfbGVuIC0gMSwgc2l6ZW9mKHdjaGFyX3QpLAo+ID4g
R0ZQX0tFUk5FTCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIXZhci5uYW1lKQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ID4gK8KgwqDCoMKgwqDC
oMKgcmMgPSB1dGY4c190b191dGYxNnMoa2V5LCBrZXlfbGVuIC0gMSwgVVRGMTZfTElUVExFX0VO
RElBTiwKPiA+ICh3Y2hhcl90ICopdmFyLm5hbWUsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtleV9sZW4gLSAxKTsKPiA+ICvCoMKg
wqDCoMKgwqDCoGlmIChyYyA8IDApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z290byBlcnI7Cj4gCj4gT2theSBJIGNhbid0IHdvcmsgb3V0IHdoeSBpdCdzIGtleV9sZW4gLSAx
IHJhdGhlciB0aGFuIGtleV9sZW4uCgpUaGUgZXhpc3RpbmcgY29kZSBpbiBzZWN2YXItc3lzZnMu
YyBjYWxscyBzZWN2YXJfb3BzLT5nZXQoKSB3aXRoCmtleV9sZW4gPSBzdHJsZW4obmFtZSkgKyAx
LCB0byBpbmNsdWRlIHRoZSBudWxsIGJ5dGUsIHdoaWNoIGlzIHdoYXQKT1BBTCBleHBlY3RzLiBG
b3IgUExQS1MsIHRoZSB2YXJpYWJsZSBuYW1lIGV4cGxpY2l0bHkgZG9lcyBub3QgaW5jbHVkZQph
IHRyYWlsaW5nIG51bGwgYnl0ZS4KCkknbGwgYWRkIGEgY29tbWVudCBpbmRpY2F0aW5nIGFzIHN1
Y2gsIHBlcmhhcHMgYXQgc29tZSBsYXRlciBwb2ludCBpdApjYW4gYmUgcmV3b3JrZWQuCgo+IAo+
ID4gK8KgwqDCoMKgwqDCoMKgdmFyLm5hbWVsZW4gPSByYyAqIDI7Cj4gPiArCj4gPiArwqDCoMKg
wqDCoMKgwqB2YXIub3MgPSBQTFBLU19WQVJfTElOVVg7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAo
ZGF0YSkgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZhci5kYXRhID0gZGF0
YTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2YXIuZGF0YWxlbiA9ICpkYXRh
X3NpemU7Cj4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gPiArwqDCoMKgwqDCoMKgwqByYyA9IHBscGtz
X3JlYWRfb3NfdmFyKCZ2YXIpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJjKQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyOwo+ID4gKwo+ID4gK8KgwqDC
oMKgwqDCoMKgKmRhdGFfc2l6ZSA9IHZhci5kYXRhbGVuOwo+ID4gKwo+ID4gK2VycjoKPiA+ICvC
oMKgwqDCoMKgwqDCoGtmcmVlKHZhci5uYW1lKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChyYyAm
JiByYyAhPSAtRU5PRU5UKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJf
ZXJyKCJGYWlsZWQgdG8gcmVhZCB2YXJpYWJsZSAnJXMnOiAlZFxuIiwga2V5LAo+ID4gcmMpOwo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8vIFJldHVybiAtRUlPIHNpbmNlIHVz
ZXJzcGFjZSBwcm9iYWJseSBkb2Vzbid0Cj4gPiBjYXJlIGFib3V0IHRoZQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8vIHNwZWNpZmljIGVycm9yCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmMgPSAtRUlPOwo+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gK8Kg
wqDCoMKgwqDCoMKgcmV0dXJuIHJjOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IHBscGtz
X3NldF92YXJpYWJsZShjb25zdCBjaGFyICprZXksIHU2NCBrZXlfbGVuLCB1OAo+ID4gKmRhdGEs
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdTY0IGRhdGFfc2l6ZSkKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcGxw
a3NfdmFyIHZhciA9IHswfTsKPiA+ICvCoMKgwqDCoMKgwqDCoGludCByYyA9IDA7Cj4gPiArwqDC
oMKgwqDCoMKgwqB1NjQgZmxhZ3M7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAvLyBTZWN1cmUg
dmFyaWFibGVzIG5lZWQgdG8gYmUgcHJlZml4ZWQgd2l0aCA4IGJ5dGVzIG9mCj4gPiBmbGFncy4K
PiA+ICvCoMKgwqDCoMKgwqDCoC8vIFdlIG9ubHkgd2FudCB0byBwZXJmb3JtIHRoZSB3cml0ZSBp
ZiB3ZSBoYXZlIGF0IGxlYXN0Cj4gPiBvbmUgYnl0ZSBvZiBkYXRhLgo+ID4gK8KgwqDCoMKgwqDC
oMKgaWYgKGRhdGFfc2l6ZSA8PSBzaXplb2YoZmxhZ3MpKQo+IAo+IFNvIGl0J3MgdW5zdHJ1Y3R1
cmVkIDggYnl0ZSBvZiBmbGFncywgbm90IGEgdTY0IGludGVnZXI/IFdoeSBub3QgdTgKPiBmbGFn
c1s4XSB0aGVuPwoKTm8sIGl0J3MgYSB1NjQgYW5kIGl0J3MgcGFzc2VkIGluIHRoZSBoY2FsbCBh
cyBhIHNpbmdsZSB1NjQuCgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgdmFyLm5hbWUgPSBrY2FsbG9j
KGtleV9sZW4gLSAxLCBzaXplb2Yod2NoYXJfdCksCj4gPiBHRlBfS0VSTkVMKTsKPiA+ICvCoMKg
wqDCoMKgwqDCoGlmICghdmFyLm5hbWUpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIC1FTk9NRU07Cj4gPiArwqDCoMKgwqDCoMKgwqByYyA9IHV0ZjhzX3RvX3V0ZjE2
cyhrZXksIGtleV9sZW4gLSAxLCBVVEYxNl9MSVRUTEVfRU5ESUFOLAo+ID4gKHdjaGFyX3QgKil2
YXIubmFtZSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAga2V5X2xlbiAtIDEpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJjIDwgMCkK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycjsKPiA+ICvCoMKgwqDC
oMKgwqDCoHZhci5uYW1lbGVuID0gcmMgKiAyOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgbWVt
Y3B5KCZmbGFncywgZGF0YSwgc2l6ZW9mKGZsYWdzKSk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKg
wqB2YXIuZGF0YWxlbiA9IGRhdGFfc2l6ZSAtIHNpemVvZihmbGFncyk7Cj4gPiArwqDCoMKgwqDC
oMKgwqB2YXIuZGF0YSA9IGRhdGEgKyBzaXplb2YoZmxhZ3MpOwo+ID4gK8KgwqDCoMKgwqDCoMKg
dmFyLm9zID0gUExQS1NfVkFSX0xJTlVYOwo+ID4gK8KgwqDCoMKgwqDCoMKgdmFyLnBvbGljeSA9
IGdldF9wb2xpY3koa2V5KTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8vIFVubGlrZSBpbiB0
aGUgcmVhZCBjYXNlLCB0aGUgcGxwa3MgZXJyb3IgY29kZSBjYW4gYmUKPiA+IHVzZWZ1bCB0bwo+
ID4gK8KgwqDCoMKgwqDCoMKgLy8gdXNlcnNwYWNlIG9uIHdyaXRlLCBzbyB3ZSByZXR1cm4gaXQg
cmF0aGVyIHRoYW4ganVzdCAtCj4gPiBFSU8KPiA+ICvCoMKgwqDCoMKgwqDCoHJjID0gcGxwa3Nf
c2lnbmVkX3VwZGF0ZV92YXIoJnZhciwgZmxhZ3MpOwo+ID4gKwo+ID4gK2VycjoKPiA+ICvCoMKg
wqDCoMKgwqDCoGtmcmVlKHZhci5uYW1lKTsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiByYzsK
PiA+ICt9Cj4gPiArCj4gPiArLy8gUExQS1MgZHluYW1pYyBzZWN1cmUgYm9vdCBkb2Vzbid0IGdp
dmUgdXMgYSBmb3JtYXQgc3RyaW5nIGluCj4gPiB0aGUgc2FtZSB3YXkgT1BBTCBkb2VzLgo+ID4g
Ky8vIEluc3RlYWQsIHJlcG9ydCB0aGUgZm9ybWF0IHVzaW5nIHRoZSBTQl9WRVJTSU9OIHZhcmlh
YmxlIGluIHRoZQo+ID4ga2V5c3RvcmUuCj4gPiArc3RhdGljIHNzaXplX3QgcGxwa3Nfc2VjdmFy
X2Zvcm1hdChjaGFyICpidWYsIHNpemVfdCBidWZzaXplKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKg
wqDCoHN0cnVjdCBwbHBrc192YXIgdmFyID0gezB9Owo+ID4gK8KgwqDCoMKgwqDCoMKgc3NpemVf
dCByZXQ7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqB2YXIuY29tcG9uZW50ID0gTlVMTDsKPiA+
ICvCoMKgwqDCoMKgwqDCoC8vIE9ubHkgdGhlIHNpZ25lZCB2YXJpYWJsZXMgaGF2ZSBudWxsIGJ5
dGVzIGluIHRoZWlyCj4gPiBuYW1lcywgdGhpcyBvbmUgZG9lc24ndAo+ID4gK8KgwqDCoMKgwqDC
oMKgdmFyLm5hbWUgPSAiU0JfVkVSU0lPTiI7Cj4gPiArwqDCoMKgwqDCoMKgwqB2YXIubmFtZWxl
biA9IDEwOwo+IAo+IENvdWxkIHlvdSBtYWtlIHRoYXQgc3RybGVuKHZhci5uYW1lKSBmb3IgdGhl
IGJlbmVmaXQgb2YgdGhvc2Ugb2YgdXMKPiB3aXRoCj4gbWlzc2luZyBmaW5nZXJzPwoKV2lsbCBk
by4KCj4gCj4gPiArwqDCoMKgwqDCoMKgwqB2YXIuZGF0YWxlbiA9IDE7Cj4gPiArwqDCoMKgwqDC
oMKgwqB2YXIuZGF0YSA9IGt6YWxsb2MoMSwgR0ZQX0tFUk5FTCk7Cj4gCj4gVGhpcyBjb3VsZCBq
dXN0IHBvaW50IHRvIGEgdTggb24gc3RhY2sgSSB0aGluaz8KClVudGlsIHdlIGdldCBWTUFQX1NU
QUNLIGFuZCB3ZSdsbCBoYXZlIHRvIHN3aXRjaCBiYWNrLgoKPiAKPiAKPiA+ICvCoMKgwqDCoMKg
wqDCoGlmICghdmFyLmRhdGEpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAvLyBVbmxpa2UgdGhlIG90aGVy
IHZhcnMsIFNCX1ZFUlNJT04gaXMgb3duZWQgYnkgZmlybXdhcmUKPiA+IGluc3RlYWQgb2YgdGhl
IE9TCj4gPiArwqDCoMKgwqDCoMKgwqByZXQgPSBwbHBrc19yZWFkX2Z3X3ZhcigmdmFyKTsKPiA+
ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZiAocmV0ID09IC1FTk9FTlQpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gc25wcmludGYoYnVmLCBidWZzaXplLCAiaWJtLHBs
cGtzLXNiLQo+ID4gdW5rbm93biIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oH0gZWxzZSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHByX2VycigiRXJyb3IgJWxkIHJlYWRpbmcgU0JfVkVSU0lPTiBmcm9tCj4gPiBmaXJtd2Fy
ZVxuIiwgcmV0KTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0ID0gLUVJTzsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4g
Cj4gSXMgdGhlcmUgYSBtZWFuaW5nZnVsIGRpc3RpbmN0aW9uPyBEb2VzIGFueXRoaW5nIGdvb2Qg
Y29tZSBvZgo+IGFkdmVydGlzaW5nIGFuIHVua25vd24gZm9ybWF0IGxpa2UgdGhpcz8KCk91ciB0
aGlua2luZyB3YXMgc2ltcGx5IHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gY2FzZXMgd2hlcmUgdGhl
IEFQSSBpcwpvdGhlcndpc2Ugd29ya2luZyBoYXBwaWx5IGJ1dCBmb3Igc29tZSByZWFzb24gc2lt
cGx5IG5vdCBhZHZlcnRpc2luZyBhCnZlcnNpb24gbnVtYmVyICh5b3UgbWlnaHQgc3RpbGwgd2Fu
dCB0byB0cnkgdG8gaW50ZXJhY3Qgd2l0aCB0aGUga2V5CnN0b3JlIHJlZ2FyZGxlc3MpIHZzIHRo
ZSBjYXNlIHdoZXJlIHRoZSBoeXBlcnZpc29yIGlzIHJldHVybmluZyBhIHJlYWwKZXJyb3IuCgpJ
IHBsYW4gdG8ga2VlcCB0aGlzIGFzIGlzIGZvciB0aGUgbmV4dCByZXZpc2lvbiwgYnV0IEknbSBo
YXBweSB0bwpjaGFuZ2UgaXQgaWYgdGhlcmUncyBhIHN0cm9uZyBvYmplY3Rpb24sIGl0IGNvdWxk
IGdvIGVpdGhlciB3YXkuCgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdv
dG8gZXJyOwo+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgLy8g
VGhpcyBzdHJpbmcgaXMgbWFkZSB1cCBieSB1cyAtIHRoZSBoeXBlcnZpc29yIGRvZXNuJ3QKPiA+
IHByb3ZpZGUgdXMKPiA+ICvCoMKgwqDCoMKgwqDCoC8vIHdpdGggYSBmb3JtYXQgc3RyaW5nIGlu
IHRoZSB3YXkgdGhhdCBPUEFMIGZpcm13YXJlIGRvZXMuCj4gPiBIeXBlcnZpc29yCj4gPiArwqDC
oMKgwqDCoMKgwqAvLyBkZWZpbmVzIFNCX1ZFUlNJT04gYXMgYSAiMSBieXRlIHVuc2lnbmVkIGlu
dGVnZXIgdmFsdWUiLgo+IAo+IEknZCBwdXQgdGhlIGNvbW1lbnQgYWJvdXQgU0JfVkVSU0lPTiBh
dCB0aGUgdG9wIHdoZXJlIHlvdSB1c2UvZGVmaW5lCj4gaXQKPiBvciBtZW50aW9uIGl0IGluIHRo
ZSBjb21tZW50LgoKV2lsbCBmaXguCgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gc25wcmlu
dGYoYnVmLCBidWZzaXplLCAiaWJtLHBscGtzLXNiLXYlaGh1IiwKPiA+IHZhci5kYXRhWzBdKTsK
PiA+ICsKPiA+ICtlcnI6Cj4gPiArwqDCoMKgwqDCoMKgwqBrZnJlZSh2YXIuZGF0YSk7Cj4gPiAr
wqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IHBs
cGtzX21heF9zaXplKHU2NCAqbWF4X3NpemUpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgLy8g
VGhlIG1heCBvYmplY3Qgc2l6ZSByZXBvcnRlZCBieSB0aGUgaHlwZXJ2aXNvciBpcwo+ID4gYWNj
dXJhdGUgZm9yIHRoZQo+ID4gK8KgwqDCoMKgwqDCoMKgLy8gb2JqZWN0IGl0c2VsZiwgYnV0IHdl
IHVzZSB0aGUgZmlyc3QgOCBieXRlcyBvZiBkYXRhIG9uCj4gPiB3cml0ZSBhcyB0aGUKPiA+ICvC
oMKgwqDCoMKgwqDCoC8vIHNpZ25lZCB1cGRhdGUgZmxhZ3MsIHNvIHRoZSBtYXggc2l6ZSBhIHVz
ZXIgY2FuIHdyaXRlIGlzCj4gPiBsYXJnZXIuCj4gPiArwqDCoMKgwqDCoMKgwqAqbWF4X3NpemUg
PSAodTY0KXBscGtzX2dldF9tYXhvYmplY3RzaXplKCkgKyA4Owo+IAo+IFlvdSBoYXZlIHRoaXMg
OCBvcGVuIGNvZGVkIHR3aWNlIChvbmNlIGFzIHNpemVvZih1NjQpKS4gWW91IGNvdWxkCj4gbWFr
ZQo+IGl0IGEgI2RlZmluZSBhdCB0aGUgdG9wIHdpdGggYSBicmllZiBvdmVydmlldyBvZiB0aGUg
aGNhbGwgZm9ybWF0IHNvCj4geW91Cj4gZG9uJ3QgbmVlZCBzbyBtdWNoIGNvbW1lbnRhZ2UgZm9y
IGl0LiBBbHRob3VnaCBhIG5vdGUgaGVyZSB0aGF0IHRoZQo+IG9ianNpemUgZG9lcyBub3QgaW5j
bHVkZSB0aGUgZmxhZ3MgYnl0ZXMgaXMgZ29vZCB0byBrZWVwLgoKV2lsbCBkby4KCi0tIApBbmRy
ZXcgRG9ubmVsbGFuICAgIE96TGFicywgQURMIENhbmJlcnJhCmFqZEBsaW51eC5pYm0uY29tICAg
SUJNIEF1c3RyYWxpYSBMaW1pdGVkCg==

