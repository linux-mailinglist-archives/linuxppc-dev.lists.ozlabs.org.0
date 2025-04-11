Return-Path: <linuxppc-dev+bounces-7588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2635A8538E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 07:53:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYm7H545bz3bs0;
	Fri, 11 Apr 2025 15:52:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744350779;
	cv=none; b=eKkn2vG31jlR3GqeTU8FWi+htjJ7bBpdOw/HldDVSRZUKstLTDOynYsUD4JA8/KLRVXJy2YaAYK1jB4HCKr+pzNMbmPHKJ10mj4jjZMfHYULFg6dtF+PCcyg5lPiQKMtTJ5pspEvin6vpa45LxQk/32ukD3N7eLxzdV7DwqKITDHgGQkTgCEyPVFQx9AqXkm4Mt8JHO3Sg+MTRmQLwfEsLsgQjjJziYWW3QmSyV/BszJNvWPVaplzAlg6R/+oM0RQ3QpE7ju46g16w3uVIvSK7d9btprN7LOQ3KgB2xoOCQ7CGdpULcePL+PEsdbWe4c2NrPjJJRzlywpGHx1cVitA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744350779; c=relaxed/relaxed;
	bh=6815fdXt5wx/NIZwToT5MJ1KOs1DW9jxPYWMNNSKLkM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WfA2q5CySd3n6Xk4W31JWlnIL2DjccCCEEdchBt5rHqjpTsvKNDGL/WHuPsnJOWTR+N0fHGzO18ijAV8OpLB1V34ZzZWl8hpk+tUK6BQ+ellv7GE7STWgsHKTmAeazA4oO2IsXHcS2suZv0R9ZCooT6iGthUSfx+nP+6FzIQimXUTLYRa36lQGlaSUmObjD06QzYS6vS2aq6ucvFwZkcM/TNt2v4vp/UsEK4yKKnWQWiKEnmc6A40X0oE9wdmsIbxnPbA/MdmKR5NOTdrBPn/pZ1edHuCsBMwFY97sRcGV27mwzX40RIfVtIQorOZyp9kmF/yoRbkQmJrOmNcF50Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dDywqT0H; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dDywqT0H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYm7G6LZyz3brr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 15:52:58 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ALeKFZ003742;
	Fri, 11 Apr 2025 05:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6815fd
	Xt5wx/NIZwToT5MJ1KOs1DW9jxPYWMNNSKLkM=; b=dDywqT0HCG42MA3lFXxlOx
	If33JtZB1VBcsPEgGE1kfQUAVh7XUAbAteN+SzNGPemXoF/Ax8+wuQJr+aX76fyD
	ou6jK4UtumMGSG+AFDmPBrBcbvsQsx8zFO02lVUElPhkWMzGdPKBabYlt3Rcbmsx
	82cQexdGSvQef6v4QwZ3zJIuyp41HKyHMR4hi603Ki/LaVWLDz6HJQi2C4Q1IbNy
	IGYVOnPAlfQ4PiOj4QCAfODygKhsfN61nTGwmZQQCY0o0gzTZEPn1kSvlhp+NUJu
	N6hjDRSRZ2dKD7rF+j6AnBo3r+rzKBUS+rW0nGoLeTLpF09QoLCgYEs/b7841LMw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xe13vgnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:52:48 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1blvD025510;
	Fri, 11 Apr 2025 05:52:47 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbm9hrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:52:47 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53B5qjmG34275820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:52:45 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB03320043;
	Fri, 11 Apr 2025 05:52:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E76220040;
	Fri, 11 Apr 2025 05:52:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Apr 2025 05:52:45 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DD900602EA;
	Fri, 11 Apr 2025 15:52:41 +1000 (AEST)
Message-ID: <4c32923d60e8d67a4a3194a405b5a422e08e280c.camel@linux.ibm.com>
Subject: Re: [PATCH v13 04/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_clear()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mm@kvack.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
        sweettea-kernel@dorminy.me
Date: Fri, 11 Apr 2025 15:52:37 +1000
In-Reply-To: <20250313161038.8bd10fa54778e984d8f849d7@linux-foundation.org>
References: <20250211161404.850215-1-ajd@linux.ibm.com>
		<20250211161404.850215-5-ajd@linux.ibm.com>
	 <20250313161038.8bd10fa54778e984d8f849d7@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: a9C5cwqg82L-CU9EonpgcGBjo0_UaNDx
X-Proofpoint-GUID: a9C5cwqg82L-CU9EonpgcGBjo0_UaNDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110038
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTAzLTEzIGF0IDE2OjEwIC0wNzAwLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+
IE9uIFdlZCwgMTIgRmViIDIwMjUgMDM6MTM6NTcgKzExMDAgQW5kcmV3IERvbm5lbGxhbgo+IDxh
amRAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGlzIHJldmVydHMgY29tbWl0IDkzMWMz
OGUxNjQ5OSAoIm1tL3BhZ2VfdGFibGVfY2hlY2s6IHJlbW92ZQo+ID4gdW51c2VkCj4gPiBwYXJh
bWV0ZXIgaW4gW19fXXBhZ2VfdGFibGVfY2hlY2tfcHVkX2NsZWFyIikuCj4gPiAKPiA+IFJlaW5z
dGF0ZSBwcmV2aW91c2x5IHVudXNlZCBwYXJhbWV0ZXJzIGZvciB0aGUgcHVycG9zZSBvZgo+ID4g
c3VwcG9ydGluZwo+ID4gcG93ZXJwYyBwbGF0Zm9ybXMsIGFzIG1hbnkgZG8gbm90IGVuY29kZSB1
c2VyL2tlcm5lbCBvd25lcnNoaXAgb2YKPiA+IHRoZQo+ID4gcGFnZSBpbiB0aGUgcHRlLCBidXQg
aW5zdGVhZCBpbiB0aGUgYWRkcmVzcyBvZiB0aGUgYWNjZXNzLgo+IAo+IE15IHg4Ni02NCBhbGxt
b2Rjb25maWcgZXhwbG9kZWQuCj4gCj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlLmg6
IEluIGZ1bmN0aW9uICdwdWRwX2VzdGFibGlzaCc6Cj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmg6MTQ0Mzo0NjogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMgo+IG9mICdwYWdlX3Rh
YmxlX2NoZWNrX3B1ZF9zZXQnIG1ha2VzIGludGVnZXIgZnJvbSBwb2ludGVyIHdpdGhvdXQgYQo+
IGNhc3QgWy1XZXJyb3I9aW50LWNvbnZlcnNpb25dCj4gwqAxNDQzIHzCoMKgwqDCoMKgwqDCoMKg
IHBhZ2VfdGFibGVfY2hlY2tfcHVkX3NldCh2bWEtPnZtX21tLCBwdWRwLCBwdWQpOwo+IMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+Cj4gwqDCoMKgwqDC
oCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiDCoMKgwqDCoMKgIHzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHVkX3QgKgo+IAo+IAo+IAo+ICNpZmRlZiBD
T05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRAo+IHN0YXRpYyBpbmxpbmUg
cHVkX3QgcHVkcF9lc3RhYmxpc2goc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHVkX3QgKnB1
ZHAsIHB1ZF90IHB1ZCkKPiB7Cj4gCXBhZ2VfdGFibGVfY2hlY2tfcHVkX3NldCh2bWEtPnZtX21t
LCBwdWRwLCBwdWQpOwo+IAkuLi4KPiAKClNvcnJ5LCBteSBlbWFpbCBmaWx0ZXJzIHNlbnQgdGhp
cyB0byB0aGUgd3JvbmcgZm9sZGVyIGZvciBzb21lIHJlYXNvbgphbmQgSSBkaWRuJ3Qgc2VlIHRo
aXMuIEkndmUgc2VudCB2MTQ6CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
bGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz00NTIyNDcKClRoYW5rcywKLS0gCkFuZHJldyBEb25u
ZWxsYW4gICAgT3pMYWJzLCBBREwgQ2FuYmVycmEKYWpkQGxpbnV4LmlibS5jb20gICBJQk0gQXVz
dHJhbGlhIExpbWl0ZWQK


