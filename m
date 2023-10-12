Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB9F7C6DB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 14:13:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qjO9DbRx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5pFj3SYqz3vXW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 23:03:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qjO9DbRx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5pDm3dyQz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 23:03:04 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CBslrH023887;
	Thu, 12 Oct 2023 12:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UwnvlILX10wd8eW3lTW+/kucpzhYMeZTj2OJc0Mjlm0=;
 b=qjO9DbRxlro0ypk4NLRIUY0akrkQDpDqUVzgsN2NjkJR31nP1EFCUlnefWgDgmkreTz4
 mTa+ZLnq1ivog3aaNOGmtef7cJQQYN+iTmppP0dyrNex0vV9k/qQuGxiIE5424mCQEZa
 aGDiflW33g6zFtBbVzRfEx5UjEsN1L+/zKvG9Hkviem+pF2lPcAs2vfv1VyK8akwnMw6
 7pnlnqTsJdEUxcm+G3XFpzCVHNqbEj8nMMGjw0QNtVo/mCO2YanAr8WpLXTtcJS3esYM
 mlxYAdWzEN7V7EEWN8W/cdG2dYyQmPSf7cY+KwKHocs3+zSy9uiM0Jn/z4Ivkcg+mIxI Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpgbb88q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 12:02:54 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39CBt1i8024392;
	Thu, 12 Oct 2023 12:02:33 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpgbb87uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 12:02:33 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39CC1X1A028191;
	Thu, 12 Oct 2023 12:02:03 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1yfetg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 12:02:03 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39CC22654850422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Oct 2023 12:02:02 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1436F5805E;
	Thu, 12 Oct 2023 12:02:02 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF5B758059;
	Thu, 12 Oct 2023 12:01:57 +0000 (GMT)
Received: from [9.171.14.51] (unknown [9.171.14.51])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Oct 2023 12:01:57 +0000 (GMT)
Message-ID: <a5f0f18e-4fe0-45b6-b962-f28bc9232293@linux.vnet.ibm.com>
Date: Thu, 12 Oct 2023 17:31:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bisected] [1b4fa28a8b07] Build failure "net/core/gso_test.c"
Content-Language: en-US
To: Florian Westphal <fw@strlen.de>
References: <79fbe35c-4dd1-4f27-acb2-7a60794bc348@linux.vnet.ibm.com>
 <20231012095746.GA26871@breakpoint.cc>
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
In-Reply-To: <20231012095746.GA26871@breakpoint.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p9RRXOpJ__9haWxZNh885aVaHS8foOjh
X-Proofpoint-ORIG-GUID: _dR317mRYU1r6GCnKAZudttmZcIsBbl0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=688
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120098
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
Cc: willemb@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, sachinp@linux.vnet.com, abdhalee@linux.vnet.ibm.com, edumazet@google.com, mputtash@linux.vnet.com, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greetings,

Thank you Florian. I have tried the changes suggested by you and it 
fixes the issue. With the suggested changes the problem is not seen.

On 10/12/23 15:27, Florian Westphal wrote:
> .linear_len = GSO_TEST_SIZE,

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

