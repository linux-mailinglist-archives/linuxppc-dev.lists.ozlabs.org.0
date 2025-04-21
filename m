Return-Path: <linuxppc-dev+bounces-7858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4BBA94F33
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 12:10:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh1N358S8z3c64;
	Mon, 21 Apr 2025 20:10:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745230243;
	cv=none; b=otoFQ+bA+QxLHZ0HLCLT7eUfeFRaFVGdU+lwI2hIcRsRgx8iLPlsSwwI/YyZJoZyeO0zoxc7NVzosEfPbKEQEdtR2GnQjuvaChAWVQ4EpZuKalTKiGU3zUTU+dWAjqdls8iQxQYoUEyhGKCtyxYqd0fwnxgcLD/iuixeN9Lxi7w/awijSRaY66wlJtCoBsReVPS0yxlMvSJN3Cp5CiBM2eUW/mYpkt7A7m2kiuS9KiNBbxrh5lXms+dArSH4IiJGUUc3bbPvsrr9za2cSnwvL8n6dHjGDa3Oiz9iPj6FS9+pk3WX5xyGYAqqdRnFiS4vurLuJwiA3qd3eGA3ZQxRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745230243; c=relaxed/relaxed;
	bh=t25gV2LlHuZm499XnU/ddA/QM2wW6pt4RXEvXLzehkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dz5pg8K3M4oWrEExv+e8yw/5A4C+yBBJlEAOv9NwnuqUpZh2SR33f+bmaUy21v6Ex9ZIewFNHGjnxnjsX6rqnBLD5olAhiVf4ew3dZGSaq4ZSqOWyceDceGEEbHuIy9fOnPHlWwDcYxYzHKxDhquvXOn808hoWSQ1MVOf6JHaZXiacLwGIOuaQIzOuf6aX6f1uOQoKYw6dq6Yy/XpaAZIOBJ8JmfyYg0Zf+fJTJXRDDycg8Hv/diUCwhpgKaAT+wim5hsPmNasPcZUS0e3H1DxXn6X4GdlahVZvYA+Tc8TpkyXfUM1SUtZtTDKBNjkei+VsAWKcRL1o6miuiUyKNqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CbrPSY8/; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CbrPSY8/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh1N30818z3c2H
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 20:10:42 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LA3tmP007210;
	Mon, 21 Apr 2025 10:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=t25gV2
	LlHuZm499XnU/ddA/QM2wW6pt4RXEvXLzehkE=; b=CbrPSY8/S32X3sAu2NcF//
	lxUfE0wvofDxqPa31B2qMc8DNsSVQO8fwukuZUs39kUs+FZToFvWfy9p2IeS5j6K
	SH1wRdOFuTzHi2gEUR1EWr6DD2TA0WNYeMaJ8UTkZa69M3JYISy3JardOuZSkeez
	CeVyPnSEImpc+g23w94RmzAwdTdRPFBAuvWkICU99pdQlG26K8vWlcz3RXYYnebN
	ck0VaCOQ1CUvdHPJhRU2YhEeGY6CRxUWtXCh6clVzltnlsF7Y2u6I3rdPyOSq5Y1
	TcXw5thcJjtbhfJ7tvZQaMBtrpQjLf9AriW/JhcaXtC97Vn7svnmEkDAZF932q6Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465kxj80k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:10:39 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53LAAcCc019189;
	Mon, 21 Apr 2025 10:10:38 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465kxj80jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:10:38 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L6HGx9032541;
	Mon, 21 Apr 2025 10:10:37 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464phye16h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:10:37 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53LAAZNc33620270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 10:10:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCDFA2048E;
	Mon, 21 Apr 2025 09:45:42 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9056620457;
	Mon, 21 Apr 2025 09:45:39 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.29.154])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 09:45:39 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Donet Tom <donettom@linux.ibm.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v3 1/2] book3s64/radix: Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
Date: Mon, 21 Apr 2025 15:15:36 +0530
Message-ID: <174516637905.525631.9346675264920846918.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <8231763344223c193e3452eab0ae8ea966aff466.1741609795.git.donettom@linux.ibm.com>
References: <8231763344223c193e3452eab0ae8ea966aff466.1741609795.git.donettom@linux.ibm.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BGIxJc2JB4KjO2Y29IA0cHffDlG0rESB
X-Proofpoint-ORIG-GUID: rf1OKkDDRIRoBlABzVStoU-GqASfhMZZ
X-Authority-Analysis: v=2.4 cv=HLDDFptv c=1 sm=1 tr=0 ts=6806199f cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=uNbs28uO5FCRLVzZPbMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=638 mlxscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210077
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 10 Mar 2025 07:44:09 -0500, Donet Tom wrote:
> Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
> 
> 

Applied to powerpc/fixes.

[1/2] book3s64/radix: Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
      https://git.kernel.org/powerpc/c/29bdc1f1c1df80868fb35bc69d1f073183adc6de
[2/2] book3s64/radix : Align section vmemmap start address to PAGE_SIZE
      https://git.kernel.org/powerpc/c/9cf7e13fecbab0894f6986fc6986ab2eba8de52e

Thanks

