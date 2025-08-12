Return-Path: <linuxppc-dev+bounces-10824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FD8B21BC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 05:46:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1HV01v3Sz3chg;
	Tue, 12 Aug 2025 13:46:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754970360;
	cv=none; b=Yz05BDKMmr6te/B1g0oz/RmXrFVWxU+0OV9M+ZZCJQ71rTX2N9vxfwnNPY1xEru6jGXTjeJr2U6dCxYR6DWOkX7ndhEvBJNNIwiCNHOPRiJK5lPeOKzorC4/2k/q1GWlrm1MTy5rLMj3mP7S/fxtwrMN2ZPkAwFT106BwfWyKtBQrGe7GCdIyXmTRB5Aksnz0eVmD+6Hq9oZ4oU08mZ3YpWAtKznis8usHPnmNlaUTyhfsaePl+hsRn4CNZRXrf4E3+dm/q3tDDYHCmUESzvOGic+A011+4PJBWA3Ba+1GXN0hRj05Huc+2TjOkLRAYT9ob9QDpBqSlGt5Le9gyXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754970360; c=relaxed/relaxed;
	bh=9q0gyFMLlQZ80P29WiuD/0gjHl1p7rDeeQUw/CFDdr8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ixa2rWXLX61c121yWEYKh3wdkR0GaOdWq4YbiM8KnaoysJjJBMG5JEfqHqXeJy29wAm75BT8kbwK8Itg4Fgxv7lTBtVqKz7rNaMVE9wi8NwJzs5EANJcCyKs091t0jE3TwAjC88I9cG5NY8Htw13doZ0K9d7XVzkJVzsKIFIZ5If+YzIBTGIhw3KaIqvp2d5P+cqXIhMDPlglbONY6cuXf2goWKzVT+ebLQ6RutxrAra9AG9tdOwE8sVH0LecfU4mwr5qjB6uBKlOrRVmv+bEdYfY1YmggUMyyzpF7i/qpNWr+nBN+9cnkUpDS9nY2rmUptaMq9r7P/l9OzZSFmcSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n+lQbuD4; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n+lQbuD4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1HTz2sDHz3cgg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 13:45:58 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C06ccc007051;
	Tue, 12 Aug 2025 03:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9q0gyF
	MLlQZ80P29WiuD/0gjHl1p7rDeeQUw/CFDdr8=; b=n+lQbuD4TolJiw2ByCZWaa
	2ivfMmfaBQJP+XqPMNldoL8BXnqpK725L+1bHGKmkM/nyvPkRnmn8ropkmUsRG7r
	JztOozAm1y44MZrDDqLxkusR0xj3Cpc9/W+vMvW5v+QqsB8yZrSaaeXorwmhWtWf
	7XBLD7DtYYH6SwdB02V0YF1+Xt7+6xLF6JIUxbrTU8tlIhhVO26uKlVzl50/Qk7J
	Qp7iv1omTG5N/u+l2kJRLjjR1BAZncU7dxvsF/fSlQ7PMTLCDqX2MqFmVQsH70Rt
	YtPcgRvDEkmt5++pjq7L+NjuTa5SBRAHkdNzjgCUlQ+WD9itu6Y1mwvLecLaTb5w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14cb7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 03:45:42 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57C3jgJE030651;
	Tue, 12 Aug 2025 03:45:42 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14cb7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 03:45:42 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57C0C3UO028585;
	Tue, 12 Aug 2025 03:45:41 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48ej5n0k78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 03:45:41 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57C3jdU110159228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 03:45:39 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67F8658059;
	Tue, 12 Aug 2025 03:45:39 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94EEF5804B;
	Tue, 12 Aug 2025 03:45:34 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.9.64])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Aug 2025 03:45:34 +0000 (GMT)
Message-ID: <4adce2fdf58f74e42949528e1d6c4345337706b7.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] powerpc: pci-ioda: Optimize
 pnv_ioda_pick_m64_pe()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Yury Norov <yury.norov@gmail.com>,
        "Jiri Slaby (SUSE)"	
 <jirislaby@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael
 Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy	 <christophe.leroy@csgroup.eu>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 13:45:32 +1000
In-Reply-To: <20250811165130.37552-3-yury.norov@gmail.com>
References: <20250811165130.37552-1-yury.norov@gmail.com>
	 <20250811165130.37552-3-yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Rsad0eRKtkOpz_KqJuf7rD7dvcmKxzRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDAyOSBTYWx0ZWRfX+xP77WtJt37o
 Pn8BnX+j9HGO+jwQmMwtdbAh9MnSQAN/3SmXP3j6rhPgkX0GiMRnIN9BLcISas6hs2bu3/b51k2
 M02A+p1DrFer8F4qyiqs180xGsm0hnYOm+Qg8IQu20ivq5jCW9vEgdjRUEGppoMHmtbGDk0HMwc
 xEqni2k7MqwrmZEjKIg+3BmqhL9Gfu5kJLX1RBP0kEv0QdE2ZgpHUZ4LDC+w1rVXjLWEbF3oim0
 dugTEP/WosNlWPyUEJnDuifty8PkgFB465F8yN6g1GvR1TlDxfsZSlQ6AG3ul4YcfdgQUWbopFl
 L7lw1IftNPwL5Q8Mb/hRmYm3SKUb4WH5L+C8iy8NxjnarWVbvunYHdxi3gQLpTvpiFT4W/A8afi
 FQC/5ZCFoT7tjZr+WYJjsBbzrSGmMyrxiELpzm/ul5iqY7Ed2QJWd3ja4G352RRwcKNddE5O
X-Proofpoint-GUID: dKeHuJW1_dp9vEApp2VRkMjY1Bx9w3xf
X-Authority-Analysis: v=2.4 cv=fLg53Yae c=1 sm=1 tr=0 ts=689ab8e6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=KWSvNgz8TR5Tj8vLfpoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=485 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508120029
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-08-11 at 12:51 -0400, Yury Norov wrote:
> From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
>=20
> bitmap_empty() in pnv_ioda_pick_m64_pe() is O(N) and useless because
> the following find_next_bit() does the same work.
>=20
> Drop it, and while there replace a while() loop with the dedicated
> for_each_set_bit().
>=20
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

