Return-Path: <linuxppc-dev+bounces-8637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A33DABADA0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 05:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0RX230qpz303B;
	Sun, 18 May 2025 13:44:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747539874;
	cv=none; b=h3LOjqHxeGVXRk+oPXlwpQnyPT+4YMX2tP2vFL6cdHP4At+vSrwQHg/knk2UtLQfNGacM39UiMcf8zPva/Uw7JvKvbTSzUEH5oHMmn1pygBctRdEFc45cAEJWglk3HXdULjUgETWIlkEtrmwR2rWWnyXvUGT84qkEFDFgoDwx0qdxMPXPR7lFUZFmvfBO0Xw1hjSsOsaAd/h05XK1AQ+Z8b82c1gRe6fhp/1Me1UL+AQ46zyDvVwf6ESW/jU+HzpJBN0M5ZuukBfa192ICQrO2xwv0djuTmVS1T7KpI4xNBDc3OwffeAPMIv4epVkDdu2LzhGplkXW5qet3t4jDqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747539874; c=relaxed/relaxed;
	bh=vUO40GENDVDGM4TyCH0kGvEXTD8spIbIktGq90/7wxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aWKl3SI8VVaSkBAn+nglUp10M1AKbKpZa7m8CquPgX8TXN4PuMAHaL5EzseeZB43b9g2hfi9S66oTt5AOniOHp2zi9UlXlACVuJtxWNn65yZD5+FaKGPLW+MLOJA75nKtLG4vlhk9zir0CGGat3Waku5Fi7N7tqXoPY3Hn5jxV6RRLyLUDV7qskagjN8K02NCxVCWll7y7vNtRL8g/BEdyHBHnqZ3JQWiZha09WWplRV7klKBkty0LrUHymgvbd+umew7iZnDy45Uox60aBP5K2qG5Z/hoXjbBBwnV7Elqdbh35iUApFRGWgEcvtTasvavPcCt2fPGz9Bv7WgA4NnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DD5bNxwU; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DD5bNxwU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0RX15249z301N
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 13:44:33 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I3ahSu011708;
	Sun, 18 May 2025 03:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vUO40G
	ENDVDGM4TyCH0kGvEXTD8spIbIktGq90/7wxg=; b=DD5bNxwU5tmQ1RJYsaHktG
	3b8Fc9QM3C/mO/YDR8YNNnfEpbUhMzUnru4v4SL17anr7Gf/4B00IOaYqiXfD98Q
	wM14BuWR/FFemE+UoHRbP+bofD9Rp1jKYJoiMxsPA6FRmH1zmhN2EtbCCpjKRsjY
	0xTkColnUXbUuLPdOU2Fd64YbABs6daJa8bNWLw0+vlGOTM4GHPVLJnZn3VyImSq
	aPw+v8P7wICNM+V98cieuXOfa0eg/824MAmaX+gxRJHUTYj9wszgckLbR76QbK19
	jT3MX0JsGKyIl9zCOQOdXRAkZSo0FocFVXFN6nV10BE1SY3FEpJFhjXYziZgp/MA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q0389938-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:20 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3ed51018886;
	Sun, 18 May 2025 03:44:20 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q0389936-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I1rgF8005447;
	Sun, 18 May 2025 03:44:18 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q69m09tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:18 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3iHum57082118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:44:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8499720074;
	Sun, 18 May 2025 03:44:17 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E72120073;
	Sun, 18 May 2025 03:44:14 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:44:13 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/8xx: Reduce alignment constraint for kernel memory
Date: Sun, 18 May 2025 09:14:12 +0530
Message-ID: <174753967071.24504.9586296033974318959.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <fa9927b70df13627cdf10b992ea71d6562c7760e.1746191262.git.christophe.leroy@csgroup.eu>
References: <fa9927b70df13627cdf10b992ea71d6562c7760e.1746191262.git.christophe.leroy@csgroup.eu>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4vpa6_uEN1omYsOffSbEmaSfDzUF8jHI
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=68295794 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=7tT5fclhQtEb4bBdwg8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfXyRYq0HL3s+l/ //fdGoqlj6Bitw2BXaleBDYgWFi89vxy042t43lo+qDINFlatAU75GwhUu3nWFIhk7Wusp+Ot/J hp0p1Q0FEK7jWSQgW8yyvv4wdjQ+EQxk9dc+ALWqYqkXjgO5VncTk6Hv3QChNxo3Kk2gCOVxppT
 nwKOM5+C4J6pS4feN0zOgaCx+PnaIxmwUhm/SJJTcLJG98H1+DrflZ/BLvJSKdV70/tQpwmxIKc xcu4fXqtYAenAwY7/Vs71/1Cd3JnreAwYO9occqniCo4gY/nrxjjQpOPJiUacz+9jISIDe7OPzN ox797fxUo/ERYgMSLNU2vbw8Bmu9RSTJmNJPD4a6b/6EJM8XCTJG9bSIC3ZnnV972jdgB/YoQQk
 VoWfZvrGsdWuLw1bpMnIg/bkIzxeowVU5DxPwGpRuxEQQbn55lkj5ysO1NoQSy6TRsT5acxV
X-Proofpoint-ORIG-GUID: h0u5K8pC1MWri0qOKGMHnZw1Oq2Klx9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=729 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 02 May 2025 15:07:53 +0200, Christophe Leroy wrote:
> 8xx has three large page sizes: 8M, 512k and 16k.
> 
> A too big alignment can lead to wasting memory. On a board which has
> only 32 MBytes of RAM, every single byte is worth it and a 512k
> alignment is sometimes too much.
> 
> Allow mapping kernel memory with 16k pages and reduce the constraint
> on kernel memory alignment. 512k and 16k pages are handled the same
> way so reverse tests in order to make 8M pages the special case and
> other ones (512k and 16k) the alternative.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/8xx: Reduce alignment constraint for kernel memory
      https://git.kernel.org/powerpc/c/f9cb1476ade41ba859e6f41323e76284b297d7c2

Thanks

