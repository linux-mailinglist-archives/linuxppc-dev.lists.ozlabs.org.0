Return-Path: <linuxppc-dev+bounces-12063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC2AB543B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 09:22:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNQq84gNMz3ck2;
	Fri, 12 Sep 2025 17:22:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757661732;
	cv=none; b=YxmfpvFxuR5lb5LXwhd5EYfXIHLIHEaUjLRznaKJkE/Id1Bnx919cjpA26lyP3fDEdtF5NxrMlDw0yj9PRLlepqxdggD5VPMogOg+Sc180ZJJnS4AtiEyUPq0vnnhYQwGU2PcVg9uFSZOqfdwcvLvsaLwMhhqlYYz5BCGRqhqLwSFJrp4k+yi7/sQsFeB8s6mW7G6TcU1q/X9dl/tGEJV4HUR2JAZDKA23jJZ9w0TSN9wFh9HbAdwvKg2QfNIB45PJ9zeRVZwEaAg53Yxqm81fh+jjIGsQ70MUEz8h9/P20BpaFQQ6PZaiotMMQ4laQApgAdrzuoQoZI0qihIkSfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757661732; c=relaxed/relaxed;
	bh=7N8j92UF1rmeEeMIiK9A/lZjg3S0qoHyuNm6kSJjeD4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MFaLSZOzDOTii6BI+aw+KOFD/QVja2yzPCqZbrZ0O6m002SdzWDgHEKYi7xVkHrrSWm31t8IXhkosp3avXDpa2DZX953DQVrvYN9E6mN9XWGmDgpaMp7rpXR4A8Gi0LegtgNWPH59Ss5KXuhdDseGXGnyBDg0Dm/cvaeeH37Ic9xORjJNAUABAhsTNWdcY5Ge84WlM06S4LE3460Irigt7O0E4pyJnfx7pHILvPfW6H4scOPftZBke0irDajRNpKbdYehfz6ZO/o6hu2Q6JNKAS1OKka9r5xIKydSkwfsoX6F446M798Y77I1xO7XSNnK+SP41hKYklzoUV/9OUk1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=flO1iKZ1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=flO1iKZ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNQq72v8dz3cjR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:22:11 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BMBPqt026821;
	Fri, 12 Sep 2025 07:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7N8j92
	UF1rmeEeMIiK9A/lZjg3S0qoHyuNm6kSJjeD4=; b=flO1iKZ1NObM3bAjoluDKi
	r840Bk0ASzcAGEyhoQiQHLlJ7Ft+jP6aEFN8ygl67RTR6/t2+z387deHtexSTIrG
	y/Hhzc6YRvWV395ksfKkcaue2N2tqw/m8G33vI2vKFdOTG2Q8n8Ts3+jFvtaPLK0
	brrwPNPabfFAiEN7n7t8Aa0ViG0NCK52r39Jt+ucrv4R2JiD5fJu5cjB6CiM/fqE
	ziaMFpl4lzQ7RVu23tMxb3BiK1XRsEUDZJ1JPDA280yeISqu/aA5E9MyOi4Y2c8Z
	IoNQNxGtkf1aK83jjVqQtucDtTaov3f1ihN780KJ6T6RLh8hxxmecr3G146BylAQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bct8pm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 07:22:04 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C5BHBf011457;
	Fri, 12 Sep 2025 07:22:03 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 490y9ut181-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 07:22:03 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C7M2cM29754062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 07:22:02 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC9435805D;
	Fri, 12 Sep 2025 07:22:02 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5EA2A58059;
	Fri, 12 Sep 2025 07:21:58 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.244.60])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 12 Sep 2025 07:21:58 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [linux-next20250911]Kernel OOPs while running generic/256 on Pmem
 device
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <aMPIwdleUCUMFPh2@infradead.org>
Date: Fri, 12 Sep 2025 12:51:44 +0530
Cc: linux-fsdevel@vger.kernel.org, riteshh@linux.ibm.com,
        ojaswin@linux.ibm.com, linux-xfs@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm@vger.kernel.org, cgroups@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <96AA28C4-24DD-4638-B944-CC2E2E7FC4C0@linux.ibm.com>
References: <8957c526-d05c-4c0d-bfed-0eb6e6d2476c@linux.ibm.com>
 <aMPIwdleUCUMFPh2@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX694bk+5dV0QP
 vwkrmWpJdqg0KMSFaHJMTLh0yb6j5fa0y1iPDNVi4pdil47n+vvxxr4pLL3ub/OdAaQj1q8Esnz
 vPvFbCZk0F35dt0vp/JvFz8GNb4vgPCQUrc2FIDO/3nd8dFS6bm4+qJeyNWVze+9W+lO8DKaGw5
 jyfUiC+o6z7bke/wjJyQZSLiXz9DnmO9SHDxKCLNc/Il7HOwAzIL36Lr5h+uGafQsLsS5AHXftK
 wD2K8JqZWwHbs1esDqsRI5/KdAkXg00ohc2JCYIudWZM2fBctB78NvGFPtbRADdyfcXRxahP8Wu
 9fCoJg8hQnfCpGtfJqsLYVHeT9UKw9sxKwDYdCa8oaSxRruSx1Gf/aovLAUBWLK8b4B7vN/ddgr
 hzJNLVW7
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68c3ca1c cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=wOK_BrywWAtTNq7yZiUA:9
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 62UQL51jW9jaTqixgBdQ7gy0k8zYkkMo
X-Proofpoint-ORIG-GUID: 62UQL51jW9jaTqixgBdQ7gy0k8zYkkMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_02,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 12 Sep 2025, at 12:46=E2=80=AFPM, Christoph Hellwig =
<hch@infradead.org> wrote:
>=20
> On Fri, Sep 12, 2025 at 10:51:18AM +0530, Venkat Rao Bagalkote wrote:
>> Greetings!!!
>>=20
>>=20
>> IBM CI has reported a kernel crash, while running generic/256 test =
case on
>> pmem device from xfstests suite on linux-next20250911 kernel.
>=20
> Given that this in memcg code you probably want to send this to =
linux-mm
> and the cgroups list.

Thanks for advice.

Adding mm and croups mailing list.

Regards,
Venkat.




