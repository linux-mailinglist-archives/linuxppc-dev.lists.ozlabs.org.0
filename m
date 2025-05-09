Return-Path: <linuxppc-dev+bounces-8474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B1CAB15BB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 15:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv9Np54G2z3blg;
	Fri,  9 May 2025 23:50:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746798602;
	cv=none; b=QNH1sdLYad/hAVidVlB0VcnkYEwvmU28Rcxl/r06GwN7dvvh+XvOGve2gcgLlzJAHS4sMi6gzRfxFPdOAHvC6QVRvM8x1mdVyeDCaL8VAFilyE3D3TOKhaNMHFcslFJI4NT+KfHX1gKZsV/bPI5S5T15QFfB6ORQNI31tNkjyX0cLGaVvWiufk2P5Ax653dhUZRmE3KQRvcw9DiJ5w0C6XSc1+TyEtVhEM6Ix+BJHknvfF9hs46HLcqdod7mNWQopuo3254VHhM6mIzA0xyUfwCNO4BCa+tIcxrWjisPvBvWM4YDFZXOPuIbMP/66L5ITv5pK7GOlMU8oLX+NBIzwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746798602; c=relaxed/relaxed;
	bh=qL35tfjqtvRbZWZeDNm4gyYoQKOGEeBiDKDQQJ0f6xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4rgIXObTL1Do8mWZ8a9vmdX/qrcA4IT1UidHHFBGmYJrdmgJrtFfc0fPW692Bt+AcV4mufmrDde9zrhpPfpHkxHfMVZX8kwJUB/LVWspVLRtaE2cgUcyGuLMrUGlGvfwSyOWWgvDEiwcQZBQAmyUdrh8Xb3/uMH7MD+jJwuHKW6o0nuDGoQuz3MwXFpKBgrzvQ0k7CEwDVR8XkZ9KNeSub6qBzGLYKBPC7EhZ1Y/GIhghAZywzf07QlJEyR77X8xLQEnPbZAyprp8xhpYLr2A6inGUvjOs0BXemRfbN7HJwX7qQP7dmnRKnoaLTXRqeqQVuhK0xmOgWW35lo1ZmCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hc8nLPs+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hc8nLPs+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv9Nn3DtMz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 23:50:00 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549DYmZw031546;
	Fri, 9 May 2025 13:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=qL35tfjqtvRbZWZeDNm4gyYoQKOGEe
	BiDKDQQJ0f6xM=; b=Hc8nLPs+GogWCY8kTHyiFY0gIrg0TzimptS2a6fDT6zcwR
	Ohdi4qF3WkLRiVni2zrKvQAsZvGtjESE421Gl3ef74BUhq8ufOHx5ENWgcdztvBK
	6dsRagf/J4hItu87AgWYZlXna5zVHNXTe6q/jEzOtB5p44DcCrt5E4VGeZ1yZknv
	+zDt/pFeUArs+TtfIDFQh2m7cctqd7k5UYUmgHXvmWJNy/Lfiw2c1SuXszLJyU3L
	PgwCfvPxjdKozvlHPcI/7+JMTGMxpch7gD6GzDqmnLcInh3c3wJxfIgl2A8bpPsa
	ytKUM0VB8cPum0ce6Q9krW7tjRTkySv5wZrxc5DQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46h4rwc0gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 13:49:47 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 549DhFHQ030863;
	Fri, 9 May 2025 13:49:46 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46h4rwc0gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 13:49:46 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 549DIKC8014097;
	Fri, 9 May 2025 13:49:45 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dypm3b49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 13:49:45 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 549DnfBA55378284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 13:49:41 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBEAC200F6;
	Fri,  9 May 2025 13:49:41 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE822200F8;
	Fri,  9 May 2025 13:49:38 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.39.24.79])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  9 May 2025 13:49:38 +0000 (GMT)
Date: Fri, 9 May 2025 19:19:36 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Vaibhav Jain <vaibhav@linux.ibm.com>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix IRQ map warnings with XICS on
 pSeries KVM Guest
Message-ID: <m2a54sgts6stdrdiduzhkiqsp3wlfmlueelxivjsy5qpd3f3oz@3lgtuy5bl4x2>
References: <20250425185641.1611857-1-amachhiw@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425185641.1611857-1-amachhiw@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QIxoRhLL c=1 sm=1 tr=0 ts=681e07fb cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=v01Bmm9WW5sV4C35fbgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: HaN2FDaQ0WR_SGqBR-G2bMzjMEx0FPeF
X-Proofpoint-ORIG-GUID: 0neBe9qo4vhcaef3bA8JcpV8S5vxVVwP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyOCBTYWx0ZWRfX+ZwY+iQm1GHY paAeBzeUc7BYyHlO61eGEeVHBhPzZnvdEYKQCFlIO2ee0Ir+SJ2Y6p1BSFxukZhlC117CrAasR/ 088CaR/oeWz0vzgPkjM2rDlxkiHtFRvekaaDNeDg8AJsTQhIBxhj+AE3EIvcuQZOrtZZGZ1ahsu
 enZ4Ad0sFzTQJDRoGH5xAPdw3LjZrMjF6U8f4cl5YjZToZADVvHbm3oc4LgIPJrIt2Q8cWWozdN ZEPdEaUJDyfqqhgpuhOf2on3ai+EzMfeEtaOPkpWOThz4dnJsczs0N96pfz365ziBe5Z9a6gPkP KaxZKY3bi9qyzGtAjRYQXjTr1rOJq4iWZ8nLcvIUYvwQY9bVoSYO3bDA/gLRxn92Px5SuhhZk4X
 a+ILzqMnlb/5ibD9RkZvGujtcIG/h9YDcDyfdh1oJ2oSrElr3ay+Xpoauc+UJ9kDvSKFdbBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=568 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090128
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I tested this on both KOP and PowerNV, LGTM

Tested-by: Gautam Menghani <gautam@linux.ibm.com>

