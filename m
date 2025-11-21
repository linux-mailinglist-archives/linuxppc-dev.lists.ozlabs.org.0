Return-Path: <linuxppc-dev+bounces-14393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EA9C771F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 04:11:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCKxC49Fzz2ySq;
	Fri, 21 Nov 2025 14:11:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763694671;
	cv=none; b=oipF1QNcoWW+8Lt5ham0PoYxq2WWJdQjQZ8+hiZGQtMLtfru1EcgW/iMb8hJaREBtsxj45rRImBCukGcoAryOdYCqk0UUmk2OuJTu4YMtTmu+Odf8SZ3Y3RfeFGaE30ya2gmC46IS3/2Y2kBK9QOHSXPnfz15TJ0vdwe98P+bu6luWa6iUyRQCeL6uc3Fwt1xjq4J6alIuaMd+oeJf/lq2tgShsxq1EnCSDytYOyjnwRlMHDyZq/AzCGSwIIObkzWLpL8GJ0rzWrgHqKvNGw8MZhwxOiPEVSJ9oLdi5SWkzpTOYVdvsd5YOhcpMglRLhGHdGH55ZD5nJscbX5beUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763694671; c=relaxed/relaxed;
	bh=Rm3tCl9PmfttV13dnoFSli9Z7WaLE8q0unBTb5W4MQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RGNlXuzMOdiqY/bTNgg8RfacXObbxqW0y9cUQQ7KcbLd2J2H7yssF/I3PA1dMkcUa1dIp2ger4dv4zkCDRzW6o0roinoNmnL6SskCvRe1SIUb8k+i8TqFHc1CfhIry/6tVK8Sa6lTUwlQUWqVWIp/ejcOuT3Xqa3wpVqJy4mDhUFUS9h+GHOEW/KOHIebg/Wble3UxhNt/+UXKEW28IM3wY5xTdelZUC6RApjsGY3zVMyQKr54xw4Dr3uEgsd6XffPNkGTipThHLvM7y5Ew5wmkPA81qrMlaWjla6QN+uI0XHS66wfxKNtCS+XKewSlWqTOL/4C5RvW77qvNoulKcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T6Rkeaai; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T6Rkeaai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCKxB5XJ0z2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 14:11:10 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL1e6uL012709;
	Fri, 21 Nov 2025 03:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Rm3tCl
	9PmfttV13dnoFSli9Z7WaLE8q0unBTb5W4MQc=; b=T6RkeaaiQ62klnGo4YKgYr
	KR6XXmtmknJeyEcoZHlwuckXX0hwfShoKt0DYrQljnw1qt5Pz6Vfb3YqCmaKqXNX
	5JCcFoengAjZNir3xgQBGTWTYzOsBIhYjNvnNPqL/7aPOFkekfw5Jmx4e0nRZlxS
	hv3Wt0trkFCT/KBBBXtVrVo1UP9mpSP5ofqCjuQ5XKjpZ38imCU2YWJI8dBiX/yv
	ggInQq4iLsW86CXBWwtxSkKQ+h681ZO/yRYexBdWm0taFTHKsRO9iAjVraVqZRJk
	codBc6z2NieFyhNsLlRNkFuXwXjA/JHtjqf45XGF18AxsRuslVHxK6E+K4irQLTw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgx8aat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:10:59 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL39JMS010607;
	Fri, 21 Nov 2025 03:10:59 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgx8aaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:10:59 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKNY8iR010392;
	Fri, 21 Nov 2025 03:10:58 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3usj7mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:10:58 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL3AuVQ33096024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 03:10:56 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18671200FA;
	Fri, 21 Nov 2025 02:53:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A23F2200F7;
	Fri, 21 Nov 2025 02:53:30 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:53:30 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Antonio Alvarez Feijoo <antonio.feijoo@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH RESEND] powerpc/boot: Add missing compression methods to usage
Date: Fri, 21 Nov 2025 08:22:53 +0530
Message-ID: <176369324784.72695.8510600253227571110.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20250916061840.5492-1-antonio.feijoo@suse.com>
References: <20250916061840.5492-1-antonio.feijoo@suse.com>
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
X-Proofpoint-GUID: u7w2uPMc_FG7p7KRj3e6xYN8T1h8pp_i
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=691fd843 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=jf1xoyspPRvN_HXY0JcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: RbAZoeq72L30qi7ItukCk4o13B80GqAe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXwi/ixmhfiX46
 fCWcHAs0HPqScegzp46oHrL1Y1VdqTCGiuQ0MTzkRYei23FPgQBRftZZ4Td4FfF2o3eoL+r80QW
 zExHFLeoxnhx+aaF9OpEQgWkyiQ5gHDXh+GtcUy7zdrREMPjvg9rdo+td+M89NFsigjV2wIJcub
 L89jmo56gWXmyr0Z5TtFya9wLWeVPjJ171pzknYS5P92yyW4ZXtxO7RH7qPTtKCgjQdvzxpb2eo
 YB5Ux4pHG26kpONS2OwzfhxQ7PHKhtmiblul+mhlgzA9tFPFQGnmanxP6caoLNznE5Dqs/cQVeb
 d2PhtUdGqyq6W7NMCNJpWE0wg4sHkN5/24FgE2n66Ssyl+MVJkeLv7Fu6M/9FTOZ0t9qczOTtfl
 NMlpxHoWv3HcLxCMW5Qi0xMp9dcotQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 16 Sep 2025 08:18:40 +0200, Antonio Alvarez Feijoo wrote:
> lzma and lzo are also supported.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/boot: Add missing compression methods to usage
      https://git.kernel.org/powerpc/c/cbc8bd1b7d905b3f746542cc726837a954a46bd8

Thanks

