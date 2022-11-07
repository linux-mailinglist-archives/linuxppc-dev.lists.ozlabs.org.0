Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0124761FF60
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 21:17:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5jF66NMxz3f7m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 07:16:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bA2xI6jD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=farman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bA2xI6jD;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5gl85g8mz3cK5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 06:09:23 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A7IMGES008477;
	Mon, 7 Nov 2022 19:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=35tiOQSLtBhpiOtSDCyJvMTBa1BQEbmXkVMynO0AJNU=;
 b=bA2xI6jDXMw9GkKQ/17B2PsR08MngGD0BHr9lBdCncbze6ptiqW8yVYRlK8PyOz23yvD
 JJticYfnUSdWXwC0raCaPFMyDmDoTxVBT9GKCamiHjyfA3WaKPEVh69kCZEg5iupN8BC
 kspshGIvi7umhulLeej6gduBxnKXpRSRNfNc2nYBp7PJ6EPMDgBFDwRGeGK/qvilR8vM
 +K/1gvJLsVNYQtqHUdHQkOMXAFenkN/6JGFGZ61Aakroetl1TyzMfmKYgotX48AULjFp
 eig846ulngDwsfy+DjKBvTFBUri0aJLQSx2IXlOKn62ajHxUP8ret3ZPJA/CaddJtlwY cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1vspayt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 19:08:53 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A7GxdSO017285;
	Mon, 7 Nov 2022 19:08:52 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1vspay5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 19:08:52 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A7J6Qwe004644;
	Mon, 7 Nov 2022 19:08:51 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma05wdc.us.ibm.com with ESMTP id 3kngpksn53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 19:08:51 +0000
Received: from smtpav01.wdc07v.mail.ibm.com ([9.208.128.113])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A7J8nEF22807444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 19:08:50 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92AAC5805B;
	Mon,  7 Nov 2022 19:08:49 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 896CB5804B;
	Mon,  7 Nov 2022 19:08:44 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown [9.65.225.56])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Nov 2022 19:08:44 +0000 (GMT)
Message-ID: <c015f51c8011f1b8e9dbf55c8d3ffd7a3b001ba5.camel@linux.ibm.com>
Subject: Re: [PATCH 27/44] KVM: Drop kvm_arch_{init,exit}() hooks
From: Eric Farman <farman@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini
 <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen
 <chenhuacai@kernel.org>,
        Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul
 Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Matthew Rosato
 <mjrosato@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Mon, 07 Nov 2022 14:08:44 -0500
In-Reply-To: <20221102231911.3107438-28-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-28-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EGRhxfVownb69WBbMarN5b--dY5-Hx8c
X-Proofpoint-GUID: JbH8lnx2OyFdlHqJPERqpVN2xJ_qztsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_09,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=949
 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211070152
X-Mailman-Approved-At: Tue, 08 Nov 2022 07:10:51 +1100
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIyLTExLTAyIGF0IDIzOjE4ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOgo+IERyb3Aga3ZtX2FyY2hfaW5pdCgpIGFuZCBrdm1fYXJjaF9leGl0KCkgbm93IHRoYXQg
YWxsIGltcGxlbWVudGF0aW9ucwo+IGFyZSBub3BzLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdl
IGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPgo+IC0tLQo+IMKgYXJjaC9hcm02NC9rdm0vYXJtLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAxMSAtLS0tLS0tLS0tLQo+IMKgYXJjaC9taXBzL2t2bS9taXBz
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCAtLS0tLS0tLS0tCj4gwqBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8wqAgMSAtCj4gwqBhcmNoL3Bvd2VycGMv
a3ZtL3Bvd2VycGMuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNSAtLS0tLQo+IMKgYXJjaC9yaXNj
di9rdm0vbWFpbi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOSAtLS0tLS0tLS0K
PiDCoGFyY2gvczM5MC9rdm0va3ZtLXMzOTAuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCAt
LS0tLS0tLS0tCj4gwqBhcmNoL3g4Ni9rdm0veDg2LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTAgLS0tLS0tLS0tLQo+IMKgaW5jbHVkZS9saW51eC9rdm1faG9zdC5owqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyAtLS0KPiDCoHZpcnQva3ZtL2t2bV9tYWluLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE5ICsrLS0tLS0tLS0tLS0tLS0tLS0KPiDC
oDkgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3NiBkZWxldGlvbnMoLSkKClJldmll
d2VkLWJ5OiBFcmljIEZhcm1hbiA8ZmFybWFuQGxpbnV4LmlibS5jb20+CSMgczM5MAo=

