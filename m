Return-Path: <linuxppc-dev+bounces-8642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64093ABADA8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 05:45:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0RY25ghzz2yrp;
	Sun, 18 May 2025 13:45:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747539926;
	cv=none; b=Kjv/xYaHvCKyXlmrb88GljXM59a15qVYU5z9tvuquGJqIraHlJghiG6xLKPOLF/piz68B1daJQsGm6eS8pdAmRspuLxMnDutuAk0TuVHXFKkM3z56iB7SutdTCXyKEI9SKlAaagThWSGCorL92SkdVI3TZ8jr+4h06dmlnn6B37/yyDKYs45YEJCQUr8Or3DVIjHm8Sj2dRT4tXMZjRahYb2PN9LekzaZLouU0zbq9EwI6lmmdpBB/ziWru94eQ1dlnEBRveFQcGdsr//fS454FIldIkSyNxVetk2aMhRbp0iL2TGSKR/OJq4AmdUlz81yq3XkPBCz/OYL7IWWo1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747539926; c=relaxed/relaxed;
	bh=TAsBsJF6M+HZLYoEUbyOYukC+7ctXYecFMVMGG3OWsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cxu9M2msa19kIA6BWkVQRjjk8Gg0OeXlHAxNgkzjIEIH0yMArOMhPbVfrewRU4qVfgjjkppp9m5FCj9wEnesvAEG5k07jrKpXzouaIoAdW7FookUjMDNEV1fNV9heOLJPI3o3L0Wzb0exPwKsCuLZ9sZ8gPxB9eWf3fMPfpznqiPiYs5xyfoRuZKd9244zGS+aFTc4Yz7qSNjZlajC7YdeafdYWiEhLqDRjwfL9frUJzll2Baz02ZJX2GHoX+3hiJPAakcb8ZVhLwVjI6dqFVvZ5cmkQn6zFT4HYEJ4XvDZCKdZFNej74GeaX98BcuuLabHZXCVNEVf41aw6JsleNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ncI2vTXY; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ncI2vTXY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0RY16c8lz2yrW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 13:45:25 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HMe4rd023130;
	Sun, 18 May 2025 03:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TAsBsJ
	F6M+HZLYoEUbyOYukC+7ctXYecFMVMGG3OWsg=; b=ncI2vTXYY0lXRrb8vz2P1+
	7M9mz4UiuRSw8Hp7oUwPUR4OtPyNRguP5mNoTXRDvZz/kAGiASFGfM6yuZ5fnK/w
	zu86QBcJKdXnSexknGOioTn6IJ/T8lOZYoLsw44ubZhdvcGthXapiCAb6pTBdeoe
	7YT9RuB5GF+OwJ8yrR5w1+x0tbiK3kN3/ys/Vfb1nmowetUbyBAYmutOLeP2o+4a
	G03bts6mEHq4RzchVP14YbtnlUYBMoKkX87L0oiHIjJHGHABJ0tUZNd/S2klrWst
	gI+AwC8RUi77o1JMTU9IBRE9mOipt21QYygd9mcu1S2c3jZvSZIz5BsE8r+9XFvw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqnhtnys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:07 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3j7el001373;
	Sun, 18 May 2025 03:45:07 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqnhtnyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:07 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I3FLN7015958;
	Sun, 18 May 2025 03:45:06 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q7g202dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:06 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3j58956164736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:45:05 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F16E120075;
	Sun, 18 May 2025 03:45:01 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16BD020074;
	Sun, 18 May 2025 03:44:58 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:44:57 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/powermac: Use str_enabled_disabled() and str_on_off() helpers
Date: Sun, 18 May 2025 09:14:55 +0530
Message-ID: <174753967076.24504.5804183720757402859.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250117114625.64903-2-thorsten.blum@linux.dev>
References: <20250117114625.64903-2-thorsten.blum@linux.dev>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfX/NVJMY4IEiEp pz8GwxsnrMj1P0iyXgs9nhFTphDKe3Ycxx/dCl1YoehfIoLg3J3pZ2+FJZB5c9MR0srzXNdKtIY VNzse13LLpU+Dtt9uhS6J3a/lsLTyf5QUPo0EWn5PxeHd8rEFjJXGxnCZizJO5L97M5qrygnh/d
 0FK470q0MR1w1X11XLna1z49rSN8FQAKDTOcC9nilJqPhbQcbFHx0/jkBhWzPrpwL97QlhZyy9N xpP6LZYVcnATaM6ZFRIfzxv3atJdOVowxkvDm7SX/pfSRcPogO+UYv7ut9EVqStbQCKshXZRIHl re4n75jNT/42Hl1r+/zEloJ/LID3VdpQlj9Q0rlf+xLRv69Q68YuhzNWcQ8MKsqXYlcQKhkp+Jg
 c2uzCykA6hApAmqCB7KAdV57gXc1c7PbmPqRL/lnIQPoRZEsxAJqOFTjmMu1FIEjNJhE9iTT
X-Authority-Analysis: v=2.4 cv=V6F90fni c=1 sm=1 tr=0 ts=682957c4 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=4QqHMXSaZKTnzLmzyTsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2384TZKJwVMsAWmYam4pY6QH4TT7xXJX
X-Proofpoint-ORIG-GUID: qCOf8b8bOe0WqHGmpO6Lb3ORF4fGSjfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=706 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 17 Jan 2025 12:46:20 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() and
> str_on_off() helper functions.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/powermac: Use str_enabled_disabled() and str_on_off() helpers
      https://git.kernel.org/powerpc/c/f36a28192e3cbef6952c1b82d4ef78f26a0d2cad

Thanks

