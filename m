Return-Path: <linuxppc-dev+bounces-16618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCbhNp+uhGk14QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 15:52:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DADE4F4421
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 15:52:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6Kv00P6Vz2yFb;
	Fri, 06 Feb 2026 01:52:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770303131;
	cv=none; b=ndv2Zwuow32wYP3hMkbB+VlaSZg6yTYeRiEYeBUZdBdY/BAlZfThD3TEvaiOe7+jUbbVeYB5Q77ZjlYpj7uS06PZqu2IqTN9uZDJEJHiFaqrUepBQGhV8+Qcbb7roVxO2KdoZtPkUsYUWWUBfWNXWNKbd6qiX7jXuPnFYlHfdGLqDVUv97/gl8W3VwbucV0OjpiL9Az+fvvLvn7O8EZBMK1VdLP7Tw1TmBlnj1WDgGDPabtl++Rm7HhwrflSk9+9O4sG0iHPMaAYGm5FcdjAcmrcXCaPSGuZ7SwaLoxvHqYNXqr9uteU9gcqUwQnFuJGQdLgLCy+9hRZ6PUe5+ARUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770303131; c=relaxed/relaxed;
	bh=TxacMwtUd/EpNVTPDCr3b2sksE45h6y7u1Pt53OIqPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jcq0bHykFSxh7QQ9ySCHQJ3955O0h4zLpsNnDggMKAb/ibIOHMop8hZvWc3z5sNxdCoYsjI8HDNW7x4BlAVVCUwlrT8InpzKhW4myJTey8mofFlcseWinGLT+DwKn4hQ4JPwEUk3fkho/X01c2FlZvt3WPv/i8dzendffxfeYk1j7+FOLJdeiLn241WrUxCTJFkk2IwN2+XzEoaPNmattnEs4MfBp88j6woQ5BHoM6gASLrAkKYccUfYslbwQSf5CJy47PjJn7/GGORtyAM/6cAf9Tpi1riMuXRFrrAOM4zVIypeL4lkcL5GOM3hgp+0gSndRJ2+tblIqZxe9ggIlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cArAsybV; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cArAsybV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6Ktz0Wcqz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 01:52:10 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6152ioXH013833;
	Thu, 5 Feb 2026 14:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TxacMw
	tUd/EpNVTPDCr3b2sksE45h6y7u1Pt53OIqPA=; b=cArAsybV6QCyd0UR0G1alh
	izfN2ZwvhUnQkJ+2+XtpxBjXqFcjq83QRQzP1LAdcjPcakFoeNXVK/NMxShm1ZAE
	Ya+LcKx3d/DlxUQY1CDkdPg5gKtPyEcKczbaTiGHtNeVZfrcU8rtpkHOd909t82X
	loG8gxi5QI/HgIB75HT7cnv28diFt9BUrqeawqMUIc3xcWr8Cyqm4IFw7kjMkEtF
	UDterI1BQxKzIKLsK7lOVf45zpxwtHDvV4LgOmxsj9kkxVexjDFtPDyC6XEewsI6
	sEe031N2HUSfMFMc28rfAs+apmpVaL2vqVPJBz52PU9BhZJ5nd4vunopTjUmEgwg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c1986q94f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 14:51:43 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 615EphdR009674;
	Thu, 5 Feb 2026 14:51:43 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c1986q94a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 14:51:43 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 615AoN3W015724;
	Thu, 5 Feb 2026 14:51:41 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c4gsgthar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 14:51:41 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 615EpLXu28443324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Feb 2026 14:51:21 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78C655805A;
	Thu,  5 Feb 2026 14:51:41 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6506658062;
	Thu,  5 Feb 2026 14:51:33 +0000 (GMT)
Received: from [9.61.246.105] (unknown [9.61.246.105])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Feb 2026 14:51:33 +0000 (GMT)
Message-ID: <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
Date: Thu, 5 Feb 2026 20:21:31 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Link Mauve <linkmauve@linkmauve.fr>,
        "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
        bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
        aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
        corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org,
        jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org,
        ardb@kernel.org, rust-for-linux@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com> <aYSgjPD5KRcNN0j4@luna>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <aYSgjPD5KRcNN0j4@luna>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEwOCBTYWx0ZWRfXz3PhVC72ECBK
 zhm/fVwlA3T1Z0XnkUG46SgVkOuonyNvDOol6EJgT7LgPwTP91cuT9qdnEtuIZeg/5DRNW4BB17
 fLZGOjTMNTCERKVSZVJ4Pieo3+NV+M5KaLJm6HhamecqY6s/ak5f9t4RGpG3p09z/+t549OKTNm
 4WW6namea3KmxvLW42iUt4MGiVVSjXsqIzyWxU4SAicY7FNACu1O2hsLIV97Ie4IVlFK5f3yuId
 ENdI7SwJ8JZ1OiVszkyIlShPyw3n4rFEsNmJo95gm7Dkoar5YkP00Aeoz0Qaf5LJYBhYLal32QS
 2v4tfV5scunURnbA2sH08NDiLeu1RCeORC1NEUU5kTsn/H8pRc1iuV0bxdJnr46y/i19p9n/Mc6
 69MJ4e99KROlGuaDSkmxVtC9k4Zg+aR5/a/mw2qNYYO1TR4Rd7xBWi2ZYTV44y3XhbXaY69d+ff
 JWl5R4fJBLOT1Z8NVMA==
X-Proofpoint-GUID: TmIaki1Kociz90ArLoqh1sa57plXg0Am
X-Authority-Analysis: v=2.4 cv=DbAaa/tW c=1 sm=1 tr=0 ts=6984ae7f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Tx9jBxk8UmNcsKEdj9kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Szx1FUN-Sd1pQ3hTZcz9SJ5g_yjp1VaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2602050108
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16618-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linkmauve.fr,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:mkchauras@gmail.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DADE4F4421
X-Rspamd-Action: no action

DQpPbiAwNS8wMi8yNiA3OjIyIHBtLCBMaW5rIE1hdXZlIHdyb3RlOg0KPiBPbiBUaHUsIEZl
YiAwNSwgMjAyNiBhdCAwMjozMToyNUFNICswNTMwLCBNdWtlc2ggS3VtYXIgQ2hhdXJhc2l5
YSAoSUJNKSB3cm90ZToNCj4gW+KApl0NCj4+IGRpZmYgLS1naXQgYS9ydXN0L01ha2VmaWxl
IGIvcnVzdC9NYWtlZmlsZQ0KPj4gaW5kZXggYWUyMmYyYzVmMGIzLi5jMzk2MWZkMGQ5YTQg
MTAwNjQ0DQo+PiAtLS0gYS9ydXN0L01ha2VmaWxlDQo+PiArKysgYi9ydXN0L01ha2VmaWxl
DQo+PiBAQCAtMzkyLDEwICszOTIsMTcgQEAgQklOREdFTl9UQVJHRVRfeDg2CTo9IHg4Nl82
NC1saW51eC1nbnUNCj4+ICAgQklOREdFTl9UQVJHRVRfYXJtNjQJOj0gYWFyY2g2NC1saW51
eC1nbnUNCj4+ICAgQklOREdFTl9UQVJHRVRfYXJtCTo9IGFybS1saW51eC1nbnVlYWJpDQo+
PiAgIEJJTkRHRU5fVEFSR0VUX2xvb25nYXJjaAk6PSBsb29uZ2FyY2g2NC1saW51eC1nbnVz
Zg0KPj4gLUJJTkRHRU5fVEFSR0VUX3Bvd2VycGMJOj0gcG93ZXJwYy1saW51eC1nbnUNCj4+
ICAgQklOREdFTl9UQVJHRVRfdW0JOj0gJChCSU5ER0VOX1RBUkdFVF8kKFNVQkFSQ0gpKQ0K
Pj4gICBCSU5ER0VOX1RBUkdFVAkJOj0gJChCSU5ER0VOX1RBUkdFVF8kKFNSQ0FSQ0gpKQ0K
Pj4gICANCj4+ICtpZmRlZiBDT05GSUdfUFBDNjQNCj4+ICtpZmRlZiBDT05GSUdfQ1BVX0xJ
VFRMRV9FTkRJQU4NCj4+ICtCSU5ER0VOX1RBUkdFVF9wb3dlcnBjCTo9IHBvd2VycGM2NGxl
LWxpbnV4LWdudQ0KPj4gK2VuZGlmDQo+PiArZWxzZQ0KPj4gK0JJTkRHRU5fVEFSR0VUX3Bv
d2VycGMJOj0gcG93ZXJwYy1saW51eC1nbnUNCj4+ICtlbmRpZg0KPiBZb3UgZGVmaW5lIEJJ
TkRHRU5fVEFSR0VUX3Bvd2VycGMgYWZ0ZXIgQklOREdFTl9UQVJHRVQgaGFzIGJlZW4gc2V0
IHRvDQo+IHRoZSB2YWx1ZSBvZiAkKEJJTkRHRU5fVEFSR0VUXyQoU1JDQVJDSCkpLCBzbyBp
dCBpcyBlbXB0eSBhbmQgYmluZGdlbg0KPiB0aGVuIGdldHMgcGFzc2VkIC0tdGFyZ2V0PSB3
aGljaCBtYWtlcyBpdCBmYWlsIGhlcmUsIHdpdGggdGhpcyBlcnJvcg0KPiBtZXNzYWdlOg0K
PiBgYGANCj4gYmluZGdlbiAuLi9ydXN0L2JpbmRpbmdzL2JpbmRpbmdzX2hlbHBlci5oIC0t
YmxvY2tsaXN0LXR5cGUgX19rZXJuZWxfcz9zaXplX3QgLS1ibG9ja2xpc3QtdHlwZSBfX2tl
cm5lbF9wdHJkaWZmX3QgLS1vcGFxdWUtdHlwZSB4cmVnc19zdGF0ZSAtLW9wYXF1ZS10eXBl
IGRlc2Nfc3RydWN0IC0tb3BhcXVlLXR5cGUgYXJjaF9sYnJfc3RhdGUgLS1vcGFxdWUtdHlw
ZSBsb2NhbF9hcGljIC0tb3BhcXVlLXR5cGUgYWx0X2luc3RyIC0tb3BhcXVlLXR5cGUgeDg2
X21zaV9kYXRhIC0tb3BhcXVlLXR5cGUgeDg2X21zaV9hZGRyX2xvIC0tb3BhcXVlLXR5cGUg
a3VuaXRfdHJ5X2NhdGNoIC0tb3BhcXVlLXR5cGUgc3BpbmxvY2sgLS1uby1kb2MtY29tbWVu
dHMgLS1ibG9ja2xpc3QtZnVuY3Rpb24gX19saXN0Xy4qX3JlcG9ydCAtLWJsb2NrbGlzdC1p
dGVtIEFSQ0hfU0xBQl9NSU5BTElHTiAtLWJsb2NrbGlzdC1pdGVtIEFSQ0hfS01BTExPQ19N
SU5BTElHTiAtLXdpdGgtZGVyaXZlLWN1c3RvbS1zdHJ1Y3QgLio9TWF5YmVaZXJvYWJsZSAt
LXdpdGgtZGVyaXZlLWN1c3RvbS11bmlvbiAuKj1NYXliZVplcm9hYmxlIC0tcnVzdC10YXJn
ZXQgMS42OCAtLXVzZS1jb3JlIC0td2l0aC1kZXJpdmUtZGVmYXVsdCAtLWN0eXBlcy1wcmVm
aXggZmZpIC0tbm8tbGF5b3V0LXRlc3RzIC0tbm8tZGVidWcgJy4qJyAtLWVuYWJsZS1mdW5j
dGlvbi1hdHRyaWJ1dGUtZGV0ZWN0aW9uIC1vIHJ1c3QvYmluZGluZ3MvYmluZGluZ3NfZ2Vu
ZXJhdGVkLnJzIC0tIC1XcCwtTU1ELHJ1c3QvYmluZGluZ3MvLmJpbmRpbmdzX2dlbmVyYXRl
ZC5ycy5kIC1ub3N0ZGluYyAtSS4uL2FyY2gvcG93ZXJwYy9pbmNsdWRlIC1JLi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9nZW5lcmF0ZWQgLUkuLi9pbmNsdWRlIC1JLi9pbmNsdWRlIC1JLi4v
YXJjaC9wb3dlcnBjL2luY2x1ZGUvdWFwaSAtSS4vYXJjaC9wb3dlcnBjL2luY2x1ZGUvZ2Vu
ZXJhdGVkL3VhcGkgLUkuLi9pbmNsdWRlL3VhcGkgLUkuL2luY2x1ZGUvZ2VuZXJhdGVkL3Vh
cGkgLWluY2x1ZGUgLi4vaW5jbHVkZS9saW51eC9jb21waWxlci12ZXJzaW9uLmggLWluY2x1
ZGUgLi4vaW5jbHVkZS9saW51eC9rY29uZmlnLmggLWluY2x1ZGUgLi4vaW5jbHVkZS9saW51
eC9jb21waWxlcl90eXBlcy5oIC1EX19LRVJORUxfXyAtbWJpZy1lbmRpYW4gLW0zMiAtSSAu
Li9hcmNoL3Bvd2VycGMgLWZtYWNyby1wcmVmaXgtbWFwPS4uLz0gLXN0ZD1nbnUxMSAtZnNo
b3J0LXdjaGFyIC1mdW5zaWduZWQtY2hhciAtZm5vLWNvbW1vbiAtZm5vLVBJRSAtZm5vLXN0
cmljdC1hbGlhc2luZyAtbXNvZnQtZmxvYXQgLW1jcHU9cG93ZXJwYyAtbW5vLXByZWZpeGVk
IC1tbm8tcGNyZWwgLW1uby1hbHRpdmVjIC1tbm8tdnN4IC1tbm8tbW1hIC1mbm8tYXN5bmNo
cm9ub3VzLXVud2luZC10YWJsZXMgLW1iaWctZW5kaWFuIC1mbm8tZGVsZXRlLW51bGwtcG9p
bnRlci1jaGVja3MgLU9zIC1mbm8tc3RhY2stcHJvdGVjdG9yIC1mb21pdC1mcmFtZS1wb2lu
dGVyIC1mdHJpdmlhbC1hdXRvLXZhci1pbml0PXplcm8gLWZuby1zdHJpY3Qtb3ZlcmZsb3cg
LWZuby1zdGFjay1jaGVjayAtZm5vLWJ1aWx0aW4td2NzbGVuIC1XYWxsIC1XZXh0cmEgLVd1
bmRlZiAtV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uIC1XZXJyb3I9aW1w
bGljaXQtaW50IC1XZXJyb3I9cmV0dXJuLXR5cGUgLVdlcnJvcj1zdHJpY3QtcHJvdG90eXBl
cyAtV25vLWZvcm1hdC1zZWN1cml0eSAtV25vLXRyaWdyYXBocyAtV25vLWZyYW1lLWFkZHJl
c3MgLVduby1hZGRyZXNzLW9mLXBhY2tlZC1tZW1iZXIgLVdtaXNzaW5nLWRlY2xhcmF0aW9u
cyAtV21pc3NpbmctcHJvdG90eXBlcyAtV2ZyYW1lLWxhcmdlci10aGFuPTEyODAgLVduby1t
YWluIC1Xbm8tZGFuZ2xpbmctcG9pbnRlciAtV3ZsYS1sYXJnZXItdGhhbj0xIC1Xbm8tcG9p
bnRlci1zaWduIC1XY2FzdC1mdW5jdGlvbi10eXBlIC1Xbm8tYXJyYXktYm91bmRzIC1Xbm8t
c3RyaW5nb3Atb3ZlcmZsb3cgLVduby1hbGxvYy1zaXplLWxhcmdlci10aGFuIC1XaW1wbGlj
aXQtZmFsbHRocm91Z2g9NSAtV2Vycm9yPWRhdGUtdGltZSAtV2Vycm9yPWluY29tcGF0aWJs
ZS1wb2ludGVyLXR5cGVzIC1XZXJyb3I9ZGVzaWduYXRlZC1pbml0IC1XZW51bS1jb252ZXJz
aW9uIC1XdW51c2VkIC1Xbm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVduby11bnVzZWQt
Y29uc3QtdmFyaWFibGUgLVduby1wYWNrZWQtbm90LWFsaWduZWQgLVduby1mb3JtYXQtb3Zl
cmZsb3cgLVduby1mb3JtYXQtdHJ1bmNhdGlvbiAtV25vLXN0cmluZ29wLXRydW5jYXRpb24g
LVduby1vdmVycmlkZS1pbml0IC1Xbm8tbWlzc2luZy1maWVsZC1pbml0aWFsaXplcnMgLVdu
by10eXBlLWxpbWl0cyAtV25vLXNoaWZ0LW5lZ2F0aXZlLXZhbHVlIC1Xbm8tbWF5YmUtdW5p
bml0aWFsaXplZCAtV25vLXNpZ24tY29tcGFyZSAtV25vLXVudXNlZC1wYXJhbWV0ZXIgLURH
Q0NfUExVR0lOUyAtSS4uL3J1c3QgLUlydXN0IC1ES0JVSUxEX01PREZJTEU9JyJydXN0L2Jp
bmRpbmdzX2dlbmVyYXRlZCInIC1ES0JVSUxEX0JBU0VOQU1FPSciYmluZGluZ3NfZ2VuZXJh
dGVkIicgLURLQlVJTERfTU9ETkFNRT0nImJpbmRpbmdzX2dlbmVyYXRlZCInIC1EX19LQlVJ
TERfTU9ETkFNRT1rbW9kX2JpbmRpbmdzX2dlbmVyYXRlZCAtdyAtLXRhcmdldD0gLWZuby1i
dWlsdGluIC1EX19CSU5ER0VOX18gLURNT0RVTEUgIDsgc2VkIC1FaSAncy9wdWIgY29uc3Qg
UlVTVF9DT05TVF9IRUxQRVJfKFthLXpBLVowLTlfXSopL3B1YiBjb25zdCAvZycgcnVzdC9i
aW5kaW5ncy9iaW5kaW5nc19nZW5lcmF0ZWQucnMNCj4gZXJyb3I6IHVuc3VwcG9ydGVkIG9w
dGlvbiAnLW1iaWctZW5kaWFuJyBmb3IgdGFyZ2V0ICcnDQo+IGVycm9yOiB1bnN1cHBvcnRl
ZCBvcHRpb24gJy1tY3B1PScgZm9yIHRhcmdldCAnJw0KPiBlcnJvcjogdW5zdXBwb3J0ZWQg
b3B0aW9uICctbW5vLXByZWZpeGVkJyBmb3IgdGFyZ2V0ICcnDQo+IGVycm9yOiB1bnN1cHBv
cnRlZCBvcHRpb24gJy1tbm8tcGNyZWwnIGZvciB0YXJnZXQgJycNCj4gZXJyb3I6IHVuc3Vw
cG9ydGVkIG9wdGlvbiAnLW1uby1hbHRpdmVjJyBmb3IgdGFyZ2V0ICcnDQo+IGVycm9yOiB1
bnN1cHBvcnRlZCBvcHRpb24gJy1tbm8tdnN4JyBmb3IgdGFyZ2V0ICcnDQo+IGVycm9yOiB1
bnN1cHBvcnRlZCBvcHRpb24gJy1tbm8tbW1hJyBmb3IgdGFyZ2V0ICcnDQo+IGVycm9yOiB1
bnN1cHBvcnRlZCBvcHRpb24gJy1tYmlnLWVuZGlhbicgZm9yIHRhcmdldCAnJw0KPiBlcnJv
cjogdW5rbm93biB0YXJnZXQgdHJpcGxlICd1bmtub3duJw0KPiBwYW5pY2tlZCBhdCBiaW5k
Z2VuL2lyL2NvbnRleHQucnM6NTYyOjE1Og0KPiBsaWJjbGFuZyBlcnJvcjsgcG9zc2libGUg
Y2F1c2VzIGluY2x1ZGU6DQo+IC0gSW52YWxpZCBmbGFnIHN5bnRheA0KPiAtIFVucmVjb2du
aXplZCBmbGFncw0KPiAtIEludmFsaWQgZmxhZyBhcmd1bWVudHMNCj4gLSBGaWxlIEkvTyBl
cnJvcnMNCj4gLSBIb3N0IHZzLiB0YXJnZXQgYXJjaGl0ZWN0dXJlIG1pc21hdGNoDQo+IElm
IHlvdSBlbmNvdW50ZXIgYW4gZXJyb3IgbWlzc2luZyBmcm9tIHRoaXMgbGlzdCwgcGxlYXNl
IGZpbGUgYW4gaXNzdWUgb3IgYSBQUiENCj4gYGBgDQo+DQo+IERpZCB0aGlzIHdvcmsgb24g
UFBDNjQ/DQoNCk9uIHBwYzY0bGUsIEkgYW0gbm90IGFibGUgdG8gZ2V0IGEgc3VjY2Vzc2Z1
bCBSdXN04oCRZW5hYmxlZCBidWlsZCB5ZXQuDQpJIGFtIGNvbnNpc3RlbnRseSBoaXR0aW5n
IGJpbmRnZW4vbGliY2xhbmcgZmFpbHVyZXMgZHVyaW5nIHRoZSBwcmVwYXJlIA0KcGhhc2Uu
DQoNCg0KQnVpbGQgRmFpbHVyZXM6DQoNCmVycm9yOiB1bnN1cHBvcnRlZCBvcHRpb24gJy1t
bG9uZy1kb3VibGUtMTI4JyBmb3IgdGFyZ2V0ICd1bmtub3duJw0KZXJyb3I6IHVuc3VwcG9y
dGVkIGFyZ3VtZW50ICdtZWRpdW0nIHRvIG9wdGlvbiAnLW1jbW9kZWw9JyBmb3IgdGFyZ2V0
IA0KJ3Vua25vd24nDQplcnJvcjogdW5rbm93biB0YXJnZXQgdHJpcGxlICd1bmtub3duJw0K
cGFuaWNrZWQgYXQgYmluZGdlbi0wLjcyLjEvaXIvY29udGV4dC5yczo1NjI6MTU6DQpsaWJj
bGFuZyBlcnJvcjsgcG9zc2libGUgY2F1c2VzIGluY2x1ZGU6DQotIEludmFsaWQgZmxhZyBz
eW50YXgNCi0gVW5yZWNvZ25pemVkIGZsYWdzDQotIEludmFsaWQgZmxhZyBhcmd1bWVudHMN
Ci0gRmlsZSBJL08gZXJyb3JzDQotIEhvc3QgdnMuIHRhcmdldCBhcmNoaXRlY3R1cmUgbWlz
bWF0Y2gNCg0KbWFrZVsyXTogKioqIFtydXN0L01ha2VmaWxlOjQ2ODogcnVzdC9iaW5kaW5n
cy9iaW5kaW5nc19nZW5lcmF0ZWQucnNdIA0KRXJyb3IgMTAxDQptYWtlWzJdOiAqKiogRGVs
ZXRpbmcgZmlsZSAncnVzdC9iaW5kaW5ncy9iaW5kaW5nc19nZW5lcmF0ZWQucnMnDQoNCm1h
a2VbMl06ICoqKiBbcnVzdC9NYWtlZmlsZTo0ODg6IA0KcnVzdC9iaW5kaW5ncy9iaW5kaW5n
c19oZWxwZXJzX2dlbmVyYXRlZC5yc10gRXJyb3IgMTAxDQptYWtlWzJdOiAqKiogRGVsZXRp
bmcgZmlsZSAncnVzdC9iaW5kaW5ncy9iaW5kaW5nc19oZWxwZXJzX2dlbmVyYXRlZC5ycycN
Cg0KbWFrZVsyXTogKioqIFtydXN0L01ha2VmaWxlOjQ3NDogcnVzdC91YXBpL3VhcGlfZ2Vu
ZXJhdGVkLnJzXSBFcnJvciAxMDENCm1ha2VbMl06ICoqKiBEZWxldGluZyBmaWxlICdydXN0
L3VhcGkvdWFwaV9nZW5lcmF0ZWQucnMnDQoNCm1ha2VbMl06ICoqKiBbcnVzdC9NYWtlZmls
ZTo2NDM6IHJ1c3QvY29yZS5vXSBFcnJvciAxDQptYWtlWzFdOiAqKiogWy9yb290L2xpbnV4
L01ha2VmaWxlOjEzMjA6IHByZXBhcmVdIEVycm9yIDINCm1ha2U6ICoqKiBbTWFrZWZpbGU6
MjQ4OiBfX3N1Yi1tYWtlXSBFcnJvciAyDQoNCg0KUmVnYXJkcywNCg0KVmVua2F0Lg0KDQo+
PiArDQo+PiAgICMgQWxsIHdhcm5pbmdzIGFyZSBpbmhpYml0ZWQgc2luY2UgR0NDIGJ1aWxk
cyBhcmUgdmVyeSBleHBlcmltZW50YWwsDQo+PiAgICMgbWFueSBHQ0Mgd2FybmluZ3MgYXJl
IG5vdCBzdXBwb3J0ZWQgYnkgQ2xhbmcsIHRoZXkgbWF5IG9ubHkgYXBwZWFyIGluDQo+PiAg
ICMgc29tZSBjb25maWd1cmF0aW9ucywgd2l0aCBuZXcgR0NDIHZlcnNpb25zLCBldGMuDQo+
PiAtLSANCj4+IDIuNTIuMA0KPj4NCj4gV2l0aCB0aGlzIGZpeGVkOg0KPiBSZXZpZXdlZC1i
eTogTGluayBNYXV2ZSA8bGlua21hdXZlQGxpbmttYXV2ZS5mcj4NCj4gVGVzdGVkLWJ5OiBM
aW5rIE1hdXZlIDxsaW5rbWF1dmVAbGlua21hdXZlLmZyPg0KPg0K

